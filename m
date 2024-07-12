Return-Path: <linux-input+bounces-4992-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8407692F4ED
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 07:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A9361F22AAC
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 05:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACF23D0A9;
	Fri, 12 Jul 2024 05:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ew7toQ4/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C59C32C8E;
	Fri, 12 Jul 2024 05:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720761548; cv=none; b=rIpqPRSgtVQkNp9da0fELXSphsn4I2oGsEhe9Lm/ttu3XIHVDDWGZJKbGuvvq2F0rsTH6Mb2skA3PcKWLd1uwgpQyLDEGB9xZ5b0lp10wzxXWQivAQJC6OM+dpXgo6EH9ye0g8kIveIhDE0i9DrhJWjq23WHYyCs0HPCqUXL/3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720761548; c=relaxed/simple;
	bh=7v5J+LI43kRT+11Ciog0l20mx78IvpIS1F9DPhEZPDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u80BuP2SddQXss+tN3Vm2WkSkxsOfolJ3a/FEUhhooRKkOADBYdxzdXrzyMoh3unO4nQH2LoegIIKOj4UwCKl5hJXhj5djEu/mK+6gPHNdnMOWbQWz7IERH9qkFQSfIcwa/q8KMDmJaTdwZkdHOuHl1yAllpKu/Xt20HJXl7l0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ew7toQ4/; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-25d634c5907so915742fac.2;
        Thu, 11 Jul 2024 22:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720761545; x=1721366345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5F0niynViJ6QyVEvqCOujqexF9M4RH7/E0H24Q65TVU=;
        b=Ew7toQ4/lfmvwi1q2Qxx+zNuUG3rqGoz7RHDcf0OT/wyAMNDQVk/IgOYBSPQvgDZjR
         KFLNXCqhBmyRTxBnND7Jx9ZNVAk4Dbe7AH7nNYErL6aqRuTDiV+PQPKEdFa+gAZPvevz
         XZJtY9o8Vpg8z4bZ8nMpr5qDXLIMSRdCZUfZdBSfG80YPAsyhwmqu2vCvkMRLvenCtZO
         eqWByCTRZ+X4DMr++oKAkPcKH6W/l+YBwO5nQDFIBi6Y2Rq5mXtxkDGqbmtYlwYWhNdi
         37SaVaZL6iz8RUNzK3arKZitDvXhE4VyNB7yhQjNjp7z+//M6YH/33bOrLKvx6ubisRd
         byOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720761545; x=1721366345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5F0niynViJ6QyVEvqCOujqexF9M4RH7/E0H24Q65TVU=;
        b=uORfHFsauqMXwVrVTj9dx66g4/lBuK9dA7orxMOzxlB9T8xbje/DMTSB4/V4ky5t4u
         /fDXDzeTDXirU5no/lIGZECvrMwpDjXkIMOh7SN+zGXYPRM1WYQNv7cOTnDAMBDO+KSS
         dIbyqwIEKKDeHtKqO87uhrIasYeoLb9CBYJ7cxLoHvz1gODQhFD5hxDpAduiV+TLZ6si
         aWjQvuqUWtwG4tQ+vINfL4xW506kQDbo6STxUsw0Cy9e84HZUYkUhx+zutoSUuVI054l
         2IttoYb77bD0lrPuKRsd4XMkIzq0Wh1FTMCV5I4OWFYwCAzCk2YgUhP5dpniyuu8Nt+n
         5jgA==
X-Forwarded-Encrypted: i=1; AJvYcCU4VXgi4MFGYLNvgumHhmApWe43ePwdpbhlCYB8h3VdS4aTyRc3V76yKcurKt5DaLPS3Mv0TtdQ1uPnSCcOf3XgCYQH/36cFhKJ6jE1
X-Gm-Message-State: AOJu0YyQP15h2PMdF5R9QZzleF0F1a+hH9vzQJ/kU0/Z3eoxiQ8MGmy6
	olJ92B+3YrqgukwPEy/eFDGaZV8JpwWeghgOy6JPs68Q0S4jqygzLdQk7g==
X-Google-Smtp-Source: AGHT+IGBDZpckVwtpgJ6NTT8H8+EV1SqceOhmbJsUjC/PtJCG8GqY2skiKGGmMTea8ErZhlbLQWI+g==
X-Received: by 2002:a05:6870:3287:b0:25e:1c7c:3de9 with SMTP id 586e51a60fabf-25eae7efbdcmr8459914fac.15.1720761545321;
        Thu, 11 Jul 2024 22:19:05 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:acda:de52:5c83:f72d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-77d669d525csm4328972a12.73.2024.07.11.22.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 22:19:04 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Greg KH <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] Input: usbtouchscreen - use guard notation when acquiring mutexes
Date: Thu, 11 Jul 2024 22:18:49 -0700
Message-ID: <20240712051851.3463657-7-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
In-Reply-To: <20240712051851.3463657-1-dmitry.torokhov@gmail.com>
References: <20240712051851.3463657-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code more compact and error handling more robust.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/usbtouchscreen.c | 65 +++++++++++-----------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
index ecde2eaf1f72..0015f0a6de01 100644
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -1349,6 +1349,20 @@ static void usbtouch_irq(struct urb *urb)
 			__func__, retval);
 }
 
+static int usbtouch_start_io(struct usbtouch_usb *usbtouch)
+{
+	guard(mutex)(&usbtouch->pm_mutex);
+
+	if (!usbtouch->type->irq_always)
+		if (usb_submit_urb(usbtouch->irq, GFP_KERNEL))
+			return -EIO;
+
+	usbtouch->interface->needs_remote_wakeup = 1;
+	usbtouch->is_open = true;
+
+	return 0;
+}
+
 static int usbtouch_open(struct input_dev *input)
 {
 	struct usbtouch_usb *usbtouch = input_get_drvdata(input);
@@ -1357,23 +1371,12 @@ static int usbtouch_open(struct input_dev *input)
 	usbtouch->irq->dev = interface_to_usbdev(usbtouch->interface);
 
 	r = usb_autopm_get_interface(usbtouch->interface) ? -EIO : 0;
-	if (r < 0)
-		goto out;
-
-	mutex_lock(&usbtouch->pm_mutex);
-	if (!usbtouch->type->irq_always) {
-		if (usb_submit_urb(usbtouch->irq, GFP_KERNEL)) {
-			r = -EIO;
-			goto out_put;
-		}
-	}
+	if (r)
+		return r;
+
+	r = usbtouch_start_io(usbtouch);
 
-	usbtouch->interface->needs_remote_wakeup = 1;
-	usbtouch->is_open = true;
-out_put:
-	mutex_unlock(&usbtouch->pm_mutex);
 	usb_autopm_put_interface(usbtouch->interface);
-out:
 	return r;
 }
 
@@ -1382,11 +1385,11 @@ static void usbtouch_close(struct input_dev *input)
 	struct usbtouch_usb *usbtouch = input_get_drvdata(input);
 	int r;
 
-	mutex_lock(&usbtouch->pm_mutex);
-	if (!usbtouch->type->irq_always)
-		usb_kill_urb(usbtouch->irq);
-	usbtouch->is_open = false;
-	mutex_unlock(&usbtouch->pm_mutex);
+	scoped_guard(mutex, &usbtouch->pm_mutex) {
+		if (!usbtouch->type->irq_always)
+			usb_kill_urb(usbtouch->irq);
+		usbtouch->is_open = false;
+	}
 
 	r = usb_autopm_get_interface(usbtouch->interface);
 	usbtouch->interface->needs_remote_wakeup = 0;
@@ -1394,8 +1397,7 @@ static void usbtouch_close(struct input_dev *input)
 		usb_autopm_put_interface(usbtouch->interface);
 }
 
-static int usbtouch_suspend
-(struct usb_interface *intf, pm_message_t message)
+static int usbtouch_suspend(struct usb_interface *intf, pm_message_t message)
 {
 	struct usbtouch_usb *usbtouch = usb_get_intfdata(intf);
 
@@ -1407,20 +1409,19 @@ static int usbtouch_suspend
 static int usbtouch_resume(struct usb_interface *intf)
 {
 	struct usbtouch_usb *usbtouch = usb_get_intfdata(intf);
-	int result = 0;
 
-	mutex_lock(&usbtouch->pm_mutex);
+	guard(mutex)(&usbtouch->pm_mutex);
+
 	if (usbtouch->is_open || usbtouch->type->irq_always)
-		result = usb_submit_urb(usbtouch->irq, GFP_NOIO);
-	mutex_unlock(&usbtouch->pm_mutex);
+		return usb_submit_urb(usbtouch->irq, GFP_NOIO);
 
-	return result;
+	return 0;
 }
 
 static int usbtouch_reset_resume(struct usb_interface *intf)
 {
 	struct usbtouch_usb *usbtouch = usb_get_intfdata(intf);
-	int err = 0;
+	int err;
 
 	/* reinit the device */
 	if (usbtouch->type->init) {
@@ -1434,12 +1435,12 @@ static int usbtouch_reset_resume(struct usb_interface *intf)
 	}
 
 	/* restart IO if needed */
-	mutex_lock(&usbtouch->pm_mutex);
+	guard(mutex)(&usbtouch->pm_mutex);
+
 	if (usbtouch->is_open)
-		err = usb_submit_urb(usbtouch->irq, GFP_NOIO);
-	mutex_unlock(&usbtouch->pm_mutex);
+		return usb_submit_urb(usbtouch->irq, GFP_NOIO);
 
-	return err;
+	return 0;
 }
 
 static void usbtouch_free_buffers(struct usb_device *udev,
-- 
2.45.2.993.g49e7a77208-goog


