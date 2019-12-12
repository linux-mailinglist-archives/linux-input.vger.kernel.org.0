Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2E2911D386
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2019 18:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730019AbfLLRPz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Dec 2019 12:15:55 -0500
Received: from mail-wr1-f73.google.com ([209.85.221.73]:55670 "EHLO
        mail-wr1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730101AbfLLRPy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Dec 2019 12:15:54 -0500
Received: by mail-wr1-f73.google.com with SMTP id b13so1269834wrx.22
        for <linux-input@vger.kernel.org>; Thu, 12 Dec 2019 09:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=JRGxEMxXqyLwwq/VLC1I/z+abNsCoEB8oREoiMjCzw4=;
        b=CYurTowCo3NeG9CHGHLholAE9mQNbdbGPDQT49R1Lmtubio4iN/318jMH33rG87Zjx
         wGL2YpYyAP3jue6mIO/AJQdIcqonRk3zhhei52OeHFzo/nLWR/R6NiZ+p7TjFhcXUs35
         KYUhTcdOJS0KnlTq8VdpEcfj3NFzJfosFzgpm2T4Db0U5vyx35ofw0rUWO1/GUc//etY
         zMC+euWL6VwIs/k94lLaKxtupRwAJHx0TUG3xZ44bj/kAJadj4vwGECoJoVdhLhGaEpV
         JtfEpm1Sd5A4a8du8BD++qHOFbFv6yFdbAFnpTuGSJpnk1I7u9RbLoze9dutvq8dzNsp
         ln7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=JRGxEMxXqyLwwq/VLC1I/z+abNsCoEB8oREoiMjCzw4=;
        b=Q5UocI7OPNq3lYdzwtzXt230LFxZBk6hJ5rRsIhUgKYDnNhhB25auzzcLiz7Adfev+
         fcdpfcwd+u32epA1TfXXuMIa1h7Fujg3CCyTfeZ3lpasAHWMW/KPMKZI4KdxBCuzbs6m
         yYIKvJaKOPkCnx5/UaC0tDh6IK3bSejIqiccgwjzmL8TNwiLD5VQ65m6pmbmRnGKfvuO
         uvRjOKNOhM/KzcIkD/nZSTFgdJqlaVrB1/4BBWbSug5XpVUzcVQ4UTI/h4+fgmY5kzBd
         pnaJa/LQduK31fWmN3fdi0X8/VNs+GzLnYYVlQhS0wapKXjrnblYaXceGF3RZJtUT6+H
         ggvA==
X-Gm-Message-State: APjAAAXTOlpZZPnI7K7Vy4yVOknaec3RZBPiUFzoeKEBwsNP0RC8CTRl
        l1QpvuKxXJv6bNkwlRjYkl+XPzyLmCb7sHpB
X-Google-Smtp-Source: APXvYqwZSGOUFrDgSvckfYOQ79ZxiCcGgSE+6bmOJ/qSRTSUUi9MG7l+kSKLLPv3SZ7yvdlV2AFaM3ZR9pxQMMSE
X-Received: by 2002:a5d:6408:: with SMTP id z8mr7658035wru.122.1576170953138;
 Thu, 12 Dec 2019 09:15:53 -0800 (PST)
Date:   Thu, 12 Dec 2019 18:15:39 +0100
In-Reply-To: <cover.1576170740.git.andreyknvl@google.com>
Message-Id: <6b4b598d012d981c0c45fcc9f121ba210bd222f9.1576170740.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1576170740.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
Subject: [PATCH RFC 2/2] HID: usbhid: kcov: add annotations for coverage collection
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds kcov_remote_start/stop() callbacks into usbhid code that
is executed in interrupt context. As the result, kcov can be used to
collect coverage from those parts of the code, which is used to facilitate
coverage-guided fuzzing with syzkaller.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 drivers/hid/usbhid/hid-core.c | 25 ++++++++++++++++++++-----
 drivers/hid/usbhid/usbkbd.c   | 15 ++++++++++++---
 drivers/hid/usbhid/usbmouse.c |  7 ++++++-
 3 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index c7bc9db5b192..3e825f27d882 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -274,6 +274,8 @@ static void hid_irq_in(struct urb *urb)
 	struct usbhid_device	*usbhid = hid->driver_data;
 	int			status;
 
+	kcov_remote_start_usb((u64)urb->dev->bus->busnum);
+
 	switch (urb->status) {
 	case 0:			/* success */
 		usbhid->retry_delay = 0;
@@ -300,12 +302,12 @@ static void hid_irq_in(struct urb *urb)
 		clear_bit(HID_IN_RUNNING, &usbhid->iofl);
 		set_bit(HID_CLEAR_HALT, &usbhid->iofl);
 		schedule_work(&usbhid->reset_work);
-		return;
+		goto out;
 	case -ECONNRESET:	/* unlink */
 	case -ENOENT:
 	case -ESHUTDOWN:	/* unplug */
 		clear_bit(HID_IN_RUNNING, &usbhid->iofl);
-		return;
+		goto out;
 	case -EILSEQ:		/* protocol error or unplug */
 	case -EPROTO:		/* protocol error or unplug */
 	case -ETIME:		/* protocol error or unplug */
@@ -313,7 +315,7 @@ static void hid_irq_in(struct urb *urb)
 		usbhid_mark_busy(usbhid);
 		clear_bit(HID_IN_RUNNING, &usbhid->iofl);
 		hid_io_error(hid);
-		return;
+		goto out;
 	default:		/* error */
 		hid_warn(urb->dev, "input irq status %d received\n",
 			 urb->status);
@@ -330,6 +332,9 @@ static void hid_irq_in(struct urb *urb)
 			hid_io_error(hid);
 		}
 	}
+
+out:
+	kcov_remote_stop();
 }
 
 static int hid_submit_out(struct hid_device *hid)
@@ -433,6 +438,8 @@ static void hid_irq_out(struct urb *urb)
 	unsigned long flags;
 	int unplug = 0;
 
+	kcov_remote_start_usb((u64)urb->dev->bus->busnum);
+
 	switch (urb->status) {
 	case 0:			/* success */
 		break;
@@ -459,7 +466,7 @@ static void hid_irq_out(struct urb *urb)
 				hid_submit_out(hid) == 0) {
 			/* Successfully submitted next urb in queue */
 			spin_unlock_irqrestore(&usbhid->lock, flags);
-			return;
+			goto out;
 		}
 	}
 
@@ -467,6 +474,9 @@ static void hid_irq_out(struct urb *urb)
 	spin_unlock_irqrestore(&usbhid->lock, flags);
 	usb_autopm_put_interface_async(usbhid->intf);
 	wake_up(&usbhid->wait);
+
+out:
+	kcov_remote_stop();
 }
 
 /*
@@ -480,6 +490,8 @@ static void hid_ctrl(struct urb *urb)
 	unsigned long flags;
 	int unplug = 0, status = urb->status;
 
+	kcov_remote_start_usb((u64)urb->dev->bus->busnum);
+
 	switch (status) {
 	case 0:			/* success */
 		if (usbhid->ctrl[usbhid->ctrltail].dir == USB_DIR_IN)
@@ -510,7 +522,7 @@ static void hid_ctrl(struct urb *urb)
 				hid_submit_ctrl(hid) == 0) {
 			/* Successfully submitted next urb in queue */
 			spin_unlock_irqrestore(&usbhid->lock, flags);
-			return;
+			goto out;
 		}
 	}
 
@@ -518,6 +530,9 @@ static void hid_ctrl(struct urb *urb)
 	spin_unlock_irqrestore(&usbhid->lock, flags);
 	usb_autopm_put_interface_async(usbhid->intf);
 	wake_up(&usbhid->wait);
+
+out:
+	kcov_remote_stop();
 }
 
 static void __usbhid_submit_report(struct hid_device *hid, struct hid_report *report,
diff --git a/drivers/hid/usbhid/usbkbd.c b/drivers/hid/usbhid/usbkbd.c
index d5b7a696a68c..eae46e51ca6a 100644
--- a/drivers/hid/usbhid/usbkbd.c
+++ b/drivers/hid/usbhid/usbkbd.c
@@ -102,13 +102,15 @@ static void usb_kbd_irq(struct urb *urb)
 	struct usb_kbd *kbd = urb->context;
 	int i;
 
+	kcov_remote_start_usb((u64)urb->dev->bus->busnum);
+
 	switch (urb->status) {
 	case 0:			/* success */
 		break;
 	case -ECONNRESET:	/* unlink */
 	case -ENOENT:
 	case -ESHUTDOWN:
-		return;
+		goto out;
 	/* -EPIPE:  should clear the halt */
 	default:		/* error */
 		goto resubmit;
@@ -148,6 +150,9 @@ static void usb_kbd_irq(struct urb *urb)
 		hid_err(urb->dev, "can't resubmit intr, %s-%s/input0, status %d",
 			kbd->usbdev->bus->bus_name,
 			kbd->usbdev->devpath, i);
+
+out:
+	kcov_remote_stop();
 }
 
 static int usb_kbd_event(struct input_dev *dev, unsigned int type,
@@ -192,6 +197,8 @@ static void usb_kbd_led(struct urb *urb)
 	unsigned long flags;
 	struct usb_kbd *kbd = urb->context;
 
+	kcov_remote_start_usb((u64)urb->dev->bus->busnum);
+
 	if (urb->status)
 		hid_warn(urb->dev, "led urb status %d received\n",
 			 urb->status);
@@ -201,7 +208,7 @@ static void usb_kbd_led(struct urb *urb)
 	if (*(kbd->leds) == kbd->newleds){
 		kbd->led_urb_submitted = false;
 		spin_unlock_irqrestore(&kbd->leds_lock, flags);
-		return;
+		goto out;
 	}
 
 	*(kbd->leds) = kbd->newleds;
@@ -212,7 +219,9 @@ static void usb_kbd_led(struct urb *urb)
 		kbd->led_urb_submitted = false;
 	}
 	spin_unlock_irqrestore(&kbd->leds_lock, flags);
-	
+
+out:
+	kcov_remote_stop();
 }
 
 static int usb_kbd_open(struct input_dev *dev)
diff --git a/drivers/hid/usbhid/usbmouse.c b/drivers/hid/usbhid/usbmouse.c
index 073127e65ac1..f470ffa8fa87 100644
--- a/drivers/hid/usbhid/usbmouse.c
+++ b/drivers/hid/usbhid/usbmouse.c
@@ -53,13 +53,15 @@ static void usb_mouse_irq(struct urb *urb)
 	struct input_dev *dev = mouse->dev;
 	int status;
 
+	kcov_remote_start_usb((u64)urb->dev->bus->busnum);
+
 	switch (urb->status) {
 	case 0:			/* success */
 		break;
 	case -ECONNRESET:	/* unlink */
 	case -ENOENT:
 	case -ESHUTDOWN:
-		return;
+		goto out;
 	/* -EPIPE:  should clear the halt */
 	default:		/* error */
 		goto resubmit;
@@ -83,6 +85,9 @@ static void usb_mouse_irq(struct urb *urb)
 			"can't resubmit intr, %s-%s/input0, status %d\n",
 			mouse->usbdev->bus->bus_name,
 			mouse->usbdev->devpath, status);
+
+out:
+	kcov_remote_stop();
 }
 
 static int usb_mouse_open(struct input_dev *dev)
-- 
2.24.1.735.g03f4e72817-goog

