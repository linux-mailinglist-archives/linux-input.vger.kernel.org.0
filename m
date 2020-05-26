Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 947E31B4E51
	for <lists+linux-input@lfdr.de>; Wed, 22 Apr 2020 22:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgDVU0L (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Apr 2020 16:26:11 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:34894 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725779AbgDVU0L (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Apr 2020 16:26:11 -0400
X-Greylist: delayed 442 seconds by postgrey-1.27 at vger.kernel.org; Wed, 22 Apr 2020 16:26:11 EDT
Received: (qmail 11311 invoked by uid 2102); 22 Apr 2020 16:18:48 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 22 Apr 2020 16:18:48 -0400
Date:   Wed, 22 Apr 2020 16:18:48 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <syzkaller-bugs@googlegroups.com>, <linux-input@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: [PATCH] usbhid: Fix race between usbhid_close() and usbhid_stop()
Message-ID: <Pine.LNX.4.44L0.2004221614580.11262-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The syzbot fuzzer discovered a bad race between in the usbhid driver
between usbhid_stop() and usbhid_close().  In particular,
usbhid_stop() does:

	usb_free_urb(usbhid->urbin);
	...
	usbhid->urbin = NULL; /* don't mess up next start */

and usbhid_close() does:

	usb_kill_urb(usbhid->urbin);

with no mutual exclusion.  If the two routines happen to run
concurrently so that usb_kill_urb() is called in between the
usb_free_urb() and the NULL assignment, it will access the
deallocated urb structure -- a use-after-free bug.

This patch adds a mutex to the usbhid private structure and uses it to
enforce mutual exclusion of the usbhid_start(), usbhid_stop(),
usbhid_open() and usbhid_close() callbacks.

Reported-and-tested-by: syzbot+7bf5a7b0f0a1f9446f4c@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: <stable@vger.kernel.org>

---


[as1935]


 drivers/hid/usbhid/hid-core.c |   37 +++++++++++++++++++++++++++++--------
 drivers/hid/usbhid/usbhid.h   |    1 +
 2 files changed, 30 insertions(+), 8 deletions(-)

Index: usb-devel/drivers/hid/usbhid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/usbhid/hid-core.c
+++ usb-devel/drivers/hid/usbhid/hid-core.c
@@ -682,16 +682,21 @@ static int usbhid_open(struct hid_device
 	struct usbhid_device *usbhid = hid->driver_data;
 	int res;
 
+	mutex_lock(&usbhid->mutex);
+
 	set_bit(HID_OPENED, &usbhid->iofl);
 
-	if (hid->quirks & HID_QUIRK_ALWAYS_POLL)
-		return 0;
+	if (hid->quirks & HID_QUIRK_ALWAYS_POLL) {
+		res = 0;
+		goto Done;
+	}
 
 	res = usb_autopm_get_interface(usbhid->intf);
 	/* the device must be awake to reliably request remote wakeup */
 	if (res < 0) {
 		clear_bit(HID_OPENED, &usbhid->iofl);
-		return -EIO;
+		res = -EIO;
+		goto Done;
 	}
 
 	usbhid->intf->needs_remote_wakeup = 1;
@@ -725,6 +730,9 @@ static int usbhid_open(struct hid_device
 		msleep(50);
 
 	clear_bit(HID_RESUME_RUNNING, &usbhid->iofl);
+
+ Done:
+	mutex_unlock(&usbhid->mutex);
 	return res;
 }
 
@@ -732,6 +740,8 @@ static void usbhid_close(struct hid_devi
 {
 	struct usbhid_device *usbhid = hid->driver_data;
 
+	mutex_lock(&usbhid->mutex);
+
 	/*
 	 * Make sure we don't restart data acquisition due to
 	 * a resumption we no longer care about by avoiding racing
@@ -743,12 +753,13 @@ static void usbhid_close(struct hid_devi
 		clear_bit(HID_IN_POLLING, &usbhid->iofl);
 	spin_unlock_irq(&usbhid->lock);
 
-	if (hid->quirks & HID_QUIRK_ALWAYS_POLL)
-		return;
+	if (!(hid->quirks & HID_QUIRK_ALWAYS_POLL)) {
+		hid_cancel_delayed_stuff(usbhid);
+		usb_kill_urb(usbhid->urbin);
+		usbhid->intf->needs_remote_wakeup = 0;
+	}
 
-	hid_cancel_delayed_stuff(usbhid);
-	usb_kill_urb(usbhid->urbin);
-	usbhid->intf->needs_remote_wakeup = 0;
+	mutex_unlock(&usbhid->mutex);
 }
 
 /*
@@ -1057,6 +1068,8 @@ static int usbhid_start(struct hid_devic
 	unsigned int n, insize = 0;
 	int ret;
 
+	mutex_lock(&usbhid->mutex);
+
 	clear_bit(HID_DISCONNECTED, &usbhid->iofl);
 
 	usbhid->bufsize = HID_MIN_BUFFER_SIZE;
@@ -1177,6 +1190,8 @@ static int usbhid_start(struct hid_devic
 		usbhid_set_leds(hid);
 		device_set_wakeup_enable(&dev->dev, 1);
 	}
+
+	mutex_unlock(&usbhid->mutex);
 	return 0;
 
 fail:
@@ -1187,6 +1202,7 @@ fail:
 	usbhid->urbout = NULL;
 	usbhid->urbctrl = NULL;
 	hid_free_buffers(dev, hid);
+	mutex_unlock(&usbhid->mutex);
 	return ret;
 }
 
@@ -1202,6 +1218,8 @@ static void usbhid_stop(struct hid_devic
 		usbhid->intf->needs_remote_wakeup = 0;
 	}
 
+	mutex_lock(&usbhid->mutex);
+
 	clear_bit(HID_STARTED, &usbhid->iofl);
 	spin_lock_irq(&usbhid->lock);	/* Sync with error and led handlers */
 	set_bit(HID_DISCONNECTED, &usbhid->iofl);
@@ -1222,6 +1240,8 @@ static void usbhid_stop(struct hid_devic
 	usbhid->urbout = NULL;
 
 	hid_free_buffers(hid_to_usb_dev(hid), hid);
+
+	mutex_unlock(&usbhid->mutex);
 }
 
 static int usbhid_power(struct hid_device *hid, int lvl)
@@ -1382,6 +1402,7 @@ static int usbhid_probe(struct usb_inter
 	INIT_WORK(&usbhid->reset_work, hid_reset);
 	timer_setup(&usbhid->io_retry, hid_retry_timeout, 0);
 	spin_lock_init(&usbhid->lock);
+	mutex_init(&usbhid->mutex);
 
 	ret = hid_add_device(hid);
 	if (ret) {
Index: usb-devel/drivers/hid/usbhid/usbhid.h
===================================================================
--- usb-devel.orig/drivers/hid/usbhid/usbhid.h
+++ usb-devel/drivers/hid/usbhid/usbhid.h
@@ -80,6 +80,7 @@ struct usbhid_device {
 	dma_addr_t outbuf_dma;                                          /* Output buffer dma */
 	unsigned long last_out;							/* record of last output for timeouts */
 
+	struct mutex mutex;						/* start/stop/open/close */
 	spinlock_t lock;						/* fifo spinlock */
 	unsigned long iofl;                                             /* I/O flags (CTRL_RUNNING, OUT_RUNNING) */
 	struct timer_list io_retry;                                     /* Retry timer */

