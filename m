Return-Path: <linux-input+bounces-7996-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2DC9C3028
	for <lists+linux-input@lfdr.de>; Sun, 10 Nov 2024 01:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E06EFB2126F
	for <lists+linux-input@lfdr.de>; Sun, 10 Nov 2024 00:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15DC1322B;
	Sun, 10 Nov 2024 00:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J14O1Vhf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6575672;
	Sun, 10 Nov 2024 00:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731198618; cv=none; b=R0nwmAuNE693EXiSWu46hMPZpvHr7Xsu1DPcn6bIzcl6i3KNxi/Det3R4rir6cdNH1UZjn5yUPZvHzo/vYNDBXLu312VVgW2uuIsoeiEk3+42cfzY1gNDV9Z0bDdWZGeJ01j7mI6eqD98hCjhb67dN5/76OF98u1mqtMELt2z50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731198618; c=relaxed/simple;
	bh=wt2Zbxs1AwV7ieBynOFN7iZzoWYpsfCJCcOB8j0H0W4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EwkbJMetW42phPLjf9h/VA3oYIhkEY8B0Q21lkX6CqOXWOqa8YDKgnHpgmVPJmdtopmJ8MBPpyyCdt5/AOTRytT3VPjWmZFnX4C1NPVXrKLQd04RaGPWP5lmQudhBpcZvD+mubM0LmD7qD6rYgFdI3H0Vg4dPcpq29vqa2Hc/uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J14O1Vhf; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-718119fc061so1814468a34.2;
        Sat, 09 Nov 2024 16:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731198615; x=1731803415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BzH3Me0ot1rVvtxYdn0QkNURYo5VRNkKPRgTtnhHozE=;
        b=J14O1VhfyTHy33hSWvA62ii4pd/CD237dptl958uufHuRLtEDB5U0WJoer9mIj2L/x
         81s5RDtc4fX5+aE/MDwPESLmfG1K1G46ouO6eb7nOVd6Ju6aeEg5jUKtOOpiKzyxVsAx
         FUglcBVnPSyj5+mAjDiZVcq2GuMmcJOiIbSmqj9/U0wusOcJ+Ey4xCd5mggs9Vw/u1dB
         /TTabqSL4phlGLkdCnb4pOmlte1O9MSxLqi0ISW9tPFly4pATRrUvF0kVfcCE5E+odRB
         EpDH1l9/iOAGR91lPTpGg7aAVO1z4EgOUhPp3vs/bAQKNF21Nxz4mmtiCrT/vM4E5X/w
         Kf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731198615; x=1731803415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BzH3Me0ot1rVvtxYdn0QkNURYo5VRNkKPRgTtnhHozE=;
        b=jj2FI7Q5qmtAyF820R6uY99WAN/O3c609dsTPZi9DcDFI2TM4rnQUkBOInCFIlScbU
         IrNgsupJ0vcToHJoOKwZWm3dhdF30uAkyLimUCSi0SpW+fjq7dZvyERjmnN2KHzrWlR1
         aQSz2suQgvnO3bU5nPxhFY+7BR6jEXM3niMdQZaDT/eG29lIuTbUo6aLSoupDuc1lZNs
         ORu/1g7NpdsSGu73MCwqbTUIJFnO4VoZCH4yQgrI7c78mw+du1V9Rb3Xcz1vPN1uIVUE
         0QREboQsEhNgz1m6jGOMQFxjJrTFgWkjt/UrV2fc2Hr7HkNDChqzNChdcpVfHUttbUGa
         jfDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGkox1jWkzGpEt7AyoERtYRf0pMh0jEYHkvHPgKHey2a9wTyx5S3lZj3XZXBH57KLQumBgAfhIVd98Rb+G@vger.kernel.org, AJvYcCX8xxAJnwh7ciCR5EowxX1eLaDAMLF7y9FkXp1qdb4tK+HXx1R+S4Sd/yfRl7euyxw9FdsGBDrdrKr1Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUCma2p472pObUkBosd4XtRJnaOwzRx+XhMx36dam6pS9v5Xh+
	mu1GzLMn+2DpnTZFhF9gpJUZrrv5pqAR9O5jOGqLCI1CAjUsLdS5
X-Google-Smtp-Source: AGHT+IHZl4Xw2EV9HknwhTsUXa+zPcgDeuvjVBxN0CZOGXLDHALFOKyk1aEswTVQ9yd9RepV0F7Iww==
X-Received: by 2002:a05:6830:2803:b0:710:b19a:b999 with SMTP id 46e09a7af769-71a1c2275camr7734676a34.14.1731198615228;
        Sat, 09 Nov 2024 16:30:15 -0800 (PST)
Received: from dev-G5-5587.attlocal.net ([2600:1702:5d48:b900:f796:a09c:98fc:26de])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-71a107eb6f3sm1573497a34.4.2024.11.09.16.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 16:30:14 -0800 (PST)
From: Callahan Kovacs <callahankovacs@gmail.com>
To: callahankovacs@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jose.exposito89@gmail.com
Subject: [PATCH] HID: magicmouse: Apple Magic Trackpad 2 USB-C driver support
Date: Sat,  9 Nov 2024 18:25:56 -0600
Message-ID: <20241110002816.6064-1-callahankovacs@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds driver support for the USB-C model of Apple's Magic Trackpad 2.

The 2024 USB-C model is compatible with the existing Magic Trackpad 2
driver but has a different hardware ID.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=219470
---
 drivers/hid/hid-ids.h        |  1 +
 drivers/hid/hid-magicmouse.c | 56 ++++++++++++++++++++++++++----------
 2 files changed, 42 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 92cff3f2658c..0f23be98c56e 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -94,6 +94,7 @@
 #define USB_DEVICE_ID_APPLE_MAGICMOUSE2	0x0269
 #define USB_DEVICE_ID_APPLE_MAGICTRACKPAD	0x030e
 #define USB_DEVICE_ID_APPLE_MAGICTRACKPAD2	0x0265
+#define USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC	0x0324
 #define USB_DEVICE_ID_APPLE_FOUNTAIN_ANSI	0x020e
 #define USB_DEVICE_ID_APPLE_FOUNTAIN_ISO	0x020f
 #define USB_DEVICE_ID_APPLE_GEYSER_ANSI	0x0214
diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 8a73b59e0827..ec110dea8772 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -227,7 +227,9 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 		touch_minor = tdata[4];
 		state = tdata[7] & TOUCH_STATE_MASK;
 		down = state != TOUCH_STATE_NONE;
-	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
+	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+		   input->id.product ==
+			   USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
 		id = tdata[8] & 0xf;
 		x = (tdata[1] << 27 | tdata[0] << 19) >> 19;
 		y = -((tdata[3] << 30 | tdata[2] << 22 | tdata[1] << 14) >> 19);
@@ -259,8 +261,9 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 	/* If requested, emulate a scroll wheel by detecting small
 	 * vertical touch motions.
 	 */
-	if (emulate_scroll_wheel && (input->id.product !=
-			USB_DEVICE_ID_APPLE_MAGICTRACKPAD2)) {
+	if (emulate_scroll_wheel &&
+	    input->id.product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
+	    input->id.product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
 		unsigned long now = jiffies;
 		int step_x = msc->touches[id].scroll_x - x;
 		int step_y = msc->touches[id].scroll_y - y;
@@ -359,7 +362,9 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 		input_report_abs(input, ABS_MT_POSITION_X, x);
 		input_report_abs(input, ABS_MT_POSITION_Y, y);
 
-		if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2)
+		if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+		    input->id.product ==
+			    USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC)
 			input_report_abs(input, ABS_MT_PRESSURE, pressure);
 
 		if (report_undeciphered) {
@@ -367,7 +372,9 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 			    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2)
 				input_event(input, EV_MSC, MSC_RAW, tdata[7]);
 			else if (input->id.product !=
-					USB_DEVICE_ID_APPLE_MAGICTRACKPAD2)
+					 USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
+				 input->id.product !=
+					 USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC)
 				input_event(input, EV_MSC, MSC_RAW, tdata[8]);
 		}
 	}
@@ -493,7 +500,9 @@ static int magicmouse_raw_event(struct hid_device *hdev,
 		magicmouse_emit_buttons(msc, clicks & 3);
 		input_report_rel(input, REL_X, x);
 		input_report_rel(input, REL_Y, y);
-	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
+	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+		   input->id.product ==
+			   USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
 		input_mt_sync_frame(input);
 		input_report_key(input, BTN_MOUSE, clicks & 1);
 	} else { /* USB_DEVICE_ID_APPLE_MAGICTRACKPAD */
@@ -545,7 +554,9 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
 			__set_bit(REL_WHEEL_HI_RES, input->relbit);
 			__set_bit(REL_HWHEEL_HI_RES, input->relbit);
 		}
-	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
+	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+		   input->id.product ==
+			   USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
 		/* If the trackpad has been connected to a Mac, the name is
 		 * automatically personalized, e.g., "José Expósito's Trackpad".
 		 * When connected through Bluetooth, the personalized name is
@@ -621,7 +632,9 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
 				  MOUSE_RES_X);
 		input_abs_set_res(input, ABS_MT_POSITION_Y,
 				  MOUSE_RES_Y);
-	} else if (input->id.product ==  USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
+	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+		   input->id.product ==
+			   USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
 		input_set_abs_params(input, ABS_MT_PRESSURE, 0, 253, 0, 0);
 		input_set_abs_params(input, ABS_PRESSURE, 0, 253, 0, 0);
 		input_set_abs_params(input, ABS_MT_ORIENTATION, -3, 4, 0, 0);
@@ -660,7 +673,8 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
 	input_set_events_per_packet(input, 60);
 
 	if (report_undeciphered &&
-	    input->id.product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
+	    input->id.product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
+	    input->id.product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
 		__set_bit(EV_MSC, input->evbit);
 		__set_bit(MSC_RAW, input->mscbit);
 	}
@@ -685,7 +699,9 @@ static int magicmouse_input_mapping(struct hid_device *hdev,
 
 	/* Magic Trackpad does not give relative data after switching to MT */
 	if ((hi->input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD ||
-	     hi->input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) &&
+	     hi->input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+	     hi->input->id.product ==
+		     USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
 	    field->flags & HID_MAIN_ITEM_RELATIVE)
 		return -1;
 
@@ -721,7 +737,8 @@ static int magicmouse_enable_multitouch(struct hid_device *hdev)
 	int ret;
 	int feature_size;
 
-	if (hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
+	if (hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+	    hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
 		if (hdev->vendor == BT_VENDOR_ID_APPLE) {
 			feature_size = sizeof(feature_mt_trackpad2_bt);
 			feature = feature_mt_trackpad2_bt;
@@ -766,7 +783,8 @@ static int magicmouse_fetch_battery(struct hid_device *hdev)
 
 	if (!hdev->battery || hdev->vendor != USB_VENDOR_ID_APPLE ||
 	    (hdev->product != USB_DEVICE_ID_APPLE_MAGICMOUSE2 &&
-	     hdev->product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2))
+	     hdev->product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
+	     hdev->product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC))
 		return -1;
 
 	report_enum = &hdev->report_enum[hdev->battery_report_type];
@@ -835,7 +853,9 @@ static int magicmouse_probe(struct hid_device *hdev,
 
 	if (id->vendor == USB_VENDOR_ID_APPLE &&
 	    (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
-	     (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 && hdev->type != HID_TYPE_USBMOUSE)))
+	     ((id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+	       id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
+	      hdev->type != HID_TYPE_USBMOUSE)))
 		return 0;
 
 	if (!msc->input) {
@@ -850,7 +870,8 @@ static int magicmouse_probe(struct hid_device *hdev,
 	else if (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2)
 		report = hid_register_report(hdev, HID_INPUT_REPORT,
 			MOUSE2_REPORT_ID, 0);
-	else if (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
+	else if (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+		 id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
 		if (id->vendor == BT_VENDOR_ID_APPLE)
 			report = hid_register_report(hdev, HID_INPUT_REPORT,
 				TRACKPAD2_BT_REPORT_ID, 0);
@@ -920,7 +941,8 @@ static const __u8 *magicmouse_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	 */
 	if (hdev->vendor == USB_VENDOR_ID_APPLE &&
 	    (hdev->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
-	     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) &&
+	     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+	     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
 	    *rsize == 83 && rdesc[46] == 0x84 && rdesc[58] == 0x85) {
 		hid_info(hdev,
 			 "fixing up magicmouse battery report descriptor\n");
@@ -951,6 +973,10 @@ static const struct hid_device_id magic_mice[] = {
 		USB_DEVICE_ID_APPLE_MAGICTRACKPAD2), .driver_data = 0 },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
 		USB_DEVICE_ID_APPLE_MAGICTRACKPAD2), .driver_data = 0 },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE,
+		USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC), .driver_data = 0 },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
+		USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC), .driver_data = 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, magic_mice);
-- 
2.45.2


