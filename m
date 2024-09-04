Return-Path: <linux-input+bounces-6128-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7091E96AFDE
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B0E52866F8
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A24127E37;
	Wed,  4 Sep 2024 04:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CcQLUdSK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8230884E04;
	Wed,  4 Sep 2024 04:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725424283; cv=none; b=lz6hf88VCBUwqTpmZCnIrfUYP8JVgwnweSCsQTdl5bih6KE6ag7KmFf8quZwtsJTJQ44QUiXwsTWO7NSVln9qBZ9KflCkCBqy659QCqRhxlIAskwtofASISrVHJ6l/HDctUaFEliJ1b+tE3HtqsYVJKZXtZUgn8eQ0cdkMfmRXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725424283; c=relaxed/simple;
	bh=0LOtEDxqgMC7wo/o2yyIbKIOxPtlr40fkEONHzYmrbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fHHFYOc++IKuTmFQdoiFNckP7Pcp22aJmCsAt6mP6+LXcJvreapUXytHeqYZ6B1aInlJjsIJ3/F39qyHEHDeAZUbKQDgx+gfuo704qqwH2EhMqWoq49wD4a4OHR3HVtMstsixtH5IXozJrG5VFA+QpIo25/3qZ+JgUjT9aeHkTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CcQLUdSK; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7d4ed6158bcso1321235a12.1;
        Tue, 03 Sep 2024 21:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725424280; x=1726029080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BhurDw2g3u6eFgUPXTkTmmYE1RtoDZNWEQeOaQogBU=;
        b=CcQLUdSK0icp+Rpw57nOnBb+LCpl5xUWTozQw3mnrw8ct9Q7oPNLVpbnPKd3deVhFL
         LV+tguBZa2cAW4kDQhq8wbR/BQIJVea+zTibPp5a9JYtjXBsmy7ve2y6S2NJGp6F3DlC
         CMkKRxe1TAEsrdq1ddXLSnbfvv9vUsKMr48Kmc9SDpp/yNooq9EAVFLlFdISFvcCEzcq
         KGrNNmweCE8ijledqxfr71Q3L5Dib1d/2/W/M1lvC0aDMoKlRPpEzKn+2r5YvRn5Hc9z
         nvjRltYVVlpjUrDL6x9hoSeqHU/ZpWLW5RrXxHMvDHlXalzuRNuSiM1byzNuqmcN4u0I
         qYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725424280; x=1726029080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0BhurDw2g3u6eFgUPXTkTmmYE1RtoDZNWEQeOaQogBU=;
        b=t5gu74bzd3YHSMJAtR8xLgtTWnopdbwrSyXv4CwUy7DlA4bTtfNHoDbzWpf7bjikUM
         HGlo6GMrkGwZTaH/6Wo4QAxh3P00mXxIFgOB02cRv5fDK8eptkXtI+Sc0szlJwKKZyg2
         iQwIkvgvXcZMYXn8Ai1bPJ45RE/gpHEyuxumBAFEqXkHKxTLGFRQrKzCms2iqoim55Kg
         Vw2sZ4o5U7ONTrlsGEqJvTjYwlqp2j3q1+TnyfThDsJ9GkEtV68xtdMeh+qSVQJQBkT0
         bcs4e+HroNqGux+KTu3OmYkVkukr8r6IBLQZpZrOO8iWECniFhvXo+WTs80IHwyHUZKu
         Ay1A==
X-Forwarded-Encrypted: i=1; AJvYcCXujthEPw3YuYodohTdsgeKF12fR1WyExehMDxbb2ryNQTfr/ncxv6Zhsav9p7s7hQsVCh7pmUsdEuNEjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIguSHq4V0SCa+E0tj1VGSWxY0gXRFY5uLEU+w/j3MPPTPuma+
	yKu4FlCUZkFa8UeWUXmtm6okxPY7Q/kOAwEzjT+M33JCVIcuTEyDCBV4Qg==
X-Google-Smtp-Source: AGHT+IEYg1nJX27vH3Xy+K67QrvM81/pMR2nK7XP0mMhMyQCDtH5uVgKMvBxNaUGTQMnciMCx8QiYg==
X-Received: by 2002:a05:6a21:9614:b0:1c3:b234:5f54 with SMTP id adf61e73a8af0-1cece5e2846mr11941713637.48.1725424280140;
        Tue, 03 Sep 2024 21:31:20 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea392e3sm5503555ad.135.2024.09.03.21.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:31:19 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Erick Archer <erick.archer@outlook.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] Input: xpad - use guard notation when acquiring mutex and spinlock
Date: Tue,  3 Sep 2024 21:31:03 -0700
Message-ID: <20240904043104.1030257-7-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904043104.1030257-1-dmitry.torokhov@gmail.com>
References: <20240904043104.1030257-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using guard notation makes the code more compact and error handling
more robust by ensuring that locks are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/joystick/xpad.c | 99 ++++++++++++-----------------------
 1 file changed, 34 insertions(+), 65 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 4eda18f4f46e..3e61df927277 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -1289,9 +1289,8 @@ static void xpad_irq_out(struct urb *urb)
 	struct device *dev = &xpad->intf->dev;
 	int status = urb->status;
 	int error;
-	unsigned long flags;
 
-	spin_lock_irqsave(&xpad->odata_lock, flags);
+	guard(spinlock_irqsave)(&xpad->odata_lock);
 
 	switch (status) {
 	case 0:
@@ -1325,8 +1324,6 @@ static void xpad_irq_out(struct urb *urb)
 			xpad->irq_out_active = false;
 		}
 	}
-
-	spin_unlock_irqrestore(&xpad->odata_lock, flags);
 }
 
 static int xpad_init_output(struct usb_interface *intf, struct usb_xpad *xpad,
@@ -1391,10 +1388,8 @@ static int xpad_inquiry_pad_presence(struct usb_xpad *xpad)
 {
 	struct xpad_output_packet *packet =
 			&xpad->out_packets[XPAD_OUT_CMD_IDX];
-	unsigned long flags;
-	int retval;
 
-	spin_lock_irqsave(&xpad->odata_lock, flags);
+	guard(spinlock_irqsave)(&xpad->odata_lock);
 
 	packet->data[0] = 0x08;
 	packet->data[1] = 0x00;
@@ -1413,17 +1408,12 @@ static int xpad_inquiry_pad_presence(struct usb_xpad *xpad)
 
 	/* Reset the sequence so we send out presence first */
 	xpad->last_out_packet = -1;
-	retval = xpad_try_sending_next_out_packet(xpad);
-
-	spin_unlock_irqrestore(&xpad->odata_lock, flags);
-
-	return retval;
+	return xpad_try_sending_next_out_packet(xpad);
 }
 
 static int xpad_start_xbox_one(struct usb_xpad *xpad)
 {
-	unsigned long flags;
-	int retval;
+	int error;
 
 	if (usb_ifnum_to_if(xpad->udev, GIP_WIRED_INTF_AUDIO)) {
 		/*
@@ -1432,15 +1422,15 @@ static int xpad_start_xbox_one(struct usb_xpad *xpad)
 		 * Controller for Series X|S (0x20d6:0x200e) to report the
 		 * guide button.
 		 */
-		retval = usb_set_interface(xpad->udev,
-					   GIP_WIRED_INTF_AUDIO, 0);
-		if (retval)
+		error = usb_set_interface(xpad->udev,
+					  GIP_WIRED_INTF_AUDIO, 0);
+		if (error)
 			dev_warn(&xpad->dev->dev,
 				 "unable to disable audio interface: %d\n",
-				 retval);
+				 error);
 	}
 
-	spin_lock_irqsave(&xpad->odata_lock, flags);
+	guard(spinlock_irqsave)(&xpad->odata_lock);
 
 	/*
 	 * Begin the init sequence by attempting to send a packet.
@@ -1448,16 +1438,11 @@ static int xpad_start_xbox_one(struct usb_xpad *xpad)
 	 * sending any packets from the output ring.
 	 */
 	xpad->init_seq = 0;
-	retval = xpad_try_sending_next_out_packet(xpad);
-
-	spin_unlock_irqrestore(&xpad->odata_lock, flags);
-
-	return retval;
+	return xpad_try_sending_next_out_packet(xpad);
 }
 
 static void xpadone_ack_mode_report(struct usb_xpad *xpad, u8 seq_num)
 {
-	unsigned long flags;
 	struct xpad_output_packet *packet =
 			&xpad->out_packets[XPAD_OUT_CMD_IDX];
 	static const u8 mode_report_ack[] = {
@@ -1465,7 +1450,7 @@ static void xpadone_ack_mode_report(struct usb_xpad *xpad, u8 seq_num)
 		0x00, GIP_CMD_VIRTUAL_KEY, GIP_OPT_INTERNAL, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
 	};
 
-	spin_lock_irqsave(&xpad->odata_lock, flags);
+	guard(spinlock_irqsave)(&xpad->odata_lock);
 
 	packet->len = sizeof(mode_report_ack);
 	memcpy(packet->data, mode_report_ack, packet->len);
@@ -1475,8 +1460,6 @@ static void xpadone_ack_mode_report(struct usb_xpad *xpad, u8 seq_num)
 	/* Reset the sequence so we send out the ack now */
 	xpad->last_out_packet = -1;
 	xpad_try_sending_next_out_packet(xpad);
-
-	spin_unlock_irqrestore(&xpad->odata_lock, flags);
 }
 
 #ifdef CONFIG_JOYSTICK_XPAD_FF
@@ -1486,8 +1469,6 @@ static int xpad_play_effect(struct input_dev *dev, void *data, struct ff_effect
 	struct xpad_output_packet *packet = &xpad->out_packets[XPAD_OUT_FF_IDX];
 	__u16 strong;
 	__u16 weak;
-	int retval;
-	unsigned long flags;
 
 	if (effect->type != FF_RUMBLE)
 		return 0;
@@ -1495,7 +1476,7 @@ static int xpad_play_effect(struct input_dev *dev, void *data, struct ff_effect
 	strong = effect->u.rumble.strong_magnitude;
 	weak = effect->u.rumble.weak_magnitude;
 
-	spin_lock_irqsave(&xpad->odata_lock, flags);
+	guard(spinlock_irqsave)(&xpad->odata_lock);
 
 	switch (xpad->xtype) {
 	case XTYPE_XBOX:
@@ -1561,15 +1542,10 @@ static int xpad_play_effect(struct input_dev *dev, void *data, struct ff_effect
 		dev_dbg(&xpad->dev->dev,
 			"%s - rumble command sent to unsupported xpad type: %d\n",
 			__func__, xpad->xtype);
-		retval = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
-	retval = xpad_try_sending_next_out_packet(xpad);
-
-out:
-	spin_unlock_irqrestore(&xpad->odata_lock, flags);
-	return retval;
+	return xpad_try_sending_next_out_packet(xpad);
 }
 
 static int xpad_init_ff(struct usb_xpad *xpad)
@@ -1622,11 +1598,10 @@ static void xpad_send_led_command(struct usb_xpad *xpad, int command)
 {
 	struct xpad_output_packet *packet =
 			&xpad->out_packets[XPAD_OUT_LED_IDX];
-	unsigned long flags;
 
 	command %= 16;
 
-	spin_lock_irqsave(&xpad->odata_lock, flags);
+	guard(spinlock_irqsave)(&xpad->odata_lock);
 
 	switch (xpad->xtype) {
 	case XTYPE_XBOX360:
@@ -1656,8 +1631,6 @@ static void xpad_send_led_command(struct usb_xpad *xpad, int command)
 	}
 
 	xpad_try_sending_next_out_packet(xpad);
-
-	spin_unlock_irqrestore(&xpad->odata_lock, flags);
 }
 
 /*
@@ -1782,11 +1755,10 @@ static void xpad_stop_input(struct usb_xpad *xpad)
 
 static void xpad360w_poweroff_controller(struct usb_xpad *xpad)
 {
-	unsigned long flags;
 	struct xpad_output_packet *packet =
 			&xpad->out_packets[XPAD_OUT_CMD_IDX];
 
-	spin_lock_irqsave(&xpad->odata_lock, flags);
+	guard(spinlock_irqsave)(&xpad->odata_lock);
 
 	packet->data[0] = 0x00;
 	packet->data[1] = 0x00;
@@ -1806,8 +1778,6 @@ static void xpad360w_poweroff_controller(struct usb_xpad *xpad)
 	/* Reset the sequence so we send out poweroff now */
 	xpad->last_out_packet = -1;
 	xpad_try_sending_next_out_packet(xpad);
-
-	spin_unlock_irqrestore(&xpad->odata_lock, flags);
 }
 
 static int xpad360w_start_input(struct usb_xpad *xpad)
@@ -2231,10 +2201,10 @@ static int xpad_suspend(struct usb_interface *intf, pm_message_t message)
 		if (auto_poweroff && xpad->pad_present)
 			xpad360w_poweroff_controller(xpad);
 	} else {
-		mutex_lock(&input->mutex);
+		guard(mutex)(&input->mutex);
+
 		if (input_device_enabled(input))
 			xpad_stop_input(xpad);
-		mutex_unlock(&input->mutex);
 	}
 
 	xpad_stop_output(xpad);
@@ -2246,26 +2216,25 @@ static int xpad_resume(struct usb_interface *intf)
 {
 	struct usb_xpad *xpad = usb_get_intfdata(intf);
 	struct input_dev *input = xpad->dev;
-	int retval = 0;
 
-	if (xpad->xtype == XTYPE_XBOX360W) {
-		retval = xpad360w_start_input(xpad);
-	} else {
-		mutex_lock(&input->mutex);
-		if (input_device_enabled(input)) {
-			retval = xpad_start_input(xpad);
-		} else if (xpad->xtype == XTYPE_XBOXONE) {
-			/*
-			 * Even if there are no users, we'll send Xbox One pads
-			 * the startup sequence so they don't sit there and
-			 * blink until somebody opens the input device again.
-			 */
-			retval = xpad_start_xbox_one(xpad);
-		}
-		mutex_unlock(&input->mutex);
+	if (xpad->xtype == XTYPE_XBOX360W)
+		return xpad360w_start_input(xpad);
+
+	guard(mutex)(&input->mutex);
+
+	if (input_device_enabled(input))
+		return xpad_start_input(xpad);
+
+	if (xpad->xtype == XTYPE_XBOXONE) {
+		/*
+		 * Even if there are no users, we'll send Xbox One pads
+		 * the startup sequence so they don't sit there and
+		 * blink until somebody opens the input device again.
+		 */
+		return xpad_start_xbox_one(xpad);
 	}
 
-	return retval;
+	return 0;
 }
 
 static struct usb_driver xpad_driver = {
-- 
2.46.0.469.g59c65b2a67-goog


