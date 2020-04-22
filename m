Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 912491B4806
	for <lists+linux-input@lfdr.de>; Wed, 22 Apr 2020 17:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbgDVPCR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Apr 2020 11:02:17 -0400
Received: from netrider.rowland.org ([192.131.102.5]:52759 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725934AbgDVPCR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Apr 2020 11:02:17 -0400
Received: (qmail 24632 invoked by uid 500); 22 Apr 2020 11:02:15 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 22 Apr 2020 11:02:15 -0400
Date:   Wed, 22 Apr 2020 11:02:15 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     syzbot <syzbot+7bf5a7b0f0a1f9446f4c@syzkaller.appspotmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>
cc:     Julian Squires <julian@cipht.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, <andreyknvl@google.com>,
        <gregkh@linuxfoundation.org>, <ingrassia@epigenesys.com>,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>, Ping Cheng <pingc@wacom.com>,
        <pinglinux@gmail.com>, <killertofu@gmail.com>
Subject: Re: KASAN: use-after-free Read in usbhid_close (3)
In-Reply-To: <Pine.LNX.4.44L0.2004191835550.28419-100000@netrider.rowland.org>
Message-ID: <Pine.LNX.4.44L0.2004221058240.20574-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 19 Apr 2020, Alan Stern wrote:

> Jiri, you should know: Are HID drivers supposed to work okay when the
> ->close callback is issued after (or concurrently with) the ->stop
> callback?

No response.  I'll assume that strange callback orderings should be 
supported.  Let's see if the patch below fixes the race in usbhid.

Alan Stern

#syz test: https://github.com/google/kasan.git 0fa84af8

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

