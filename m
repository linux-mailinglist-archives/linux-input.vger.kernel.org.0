Return-Path: <linux-input+bounces-10615-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 144D2A566C8
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 12:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC5D03A34FE
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 11:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694B61A9B4C;
	Fri,  7 Mar 2025 11:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=g-sokol-info.20230601.gappssmtp.com header.i=@g-sokol-info.20230601.gappssmtp.com header.b="ra3j8kx7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49174149C50
	for <linux-input@vger.kernel.org>; Fri,  7 Mar 2025 11:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741347104; cv=none; b=Fg+TBGr/BI5Tc/uV23zT9YZApYfvmcwEUoQDo2n8U6hGF3V5J/JFHzOSAtixFIPcISjprQE7hQXc0tFN7tlw68Fc0XZFqp8z4kLSLhgkq4n75oIWydxOW9rwd27Hs7P3NHE5jnxjA3n23kNCShpoIziTWMlwHM4KgHvIvdMFAdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741347104; c=relaxed/simple;
	bh=l+eRfBrptPncWoSLcqoMbIRDaPTcWL6xX79N+fznuuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=noI2YZTETMcgckA+RonOO8gYjZ4881A4S8fCYH9fK2ezBeEoH3LVCBzp1SZieFU2QZZ6TxdVRGyPy7NGL7HfGLGl83wUvOe2PPnjIdvgN8dTK8Cmw04955/KRlNx8mNUC0dGBLzAW9RkC+6cNt/YgcPCuUxO82gVklJPJwUA81c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=g-sokol.info; spf=none smtp.mailfrom=g-sokol.info; dkim=pass (2048-bit key) header.d=g-sokol-info.20230601.gappssmtp.com header.i=@g-sokol-info.20230601.gappssmtp.com header.b=ra3j8kx7; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=g-sokol.info
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=g-sokol.info
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so5588621fa.2
        for <linux-input@vger.kernel.org>; Fri, 07 Mar 2025 03:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=g-sokol-info.20230601.gappssmtp.com; s=20230601; t=1741347100; x=1741951900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpyPGp+dTBB+qlniZNUqzLuYqzVHyUJz8JfjvWuhOKY=;
        b=ra3j8kx7ui7md6+DHIIYvmKzkLzzxENP2Q+DkSl+kmlJWHakUFQsTWTBOCd0gCMCCD
         3tbY98LYCKtj3xGkLxq1zLi0VEryDrIJ2Qbyv1I/0y/S6I0rUbv1Ba2fxBVsqV0Lbfcj
         1c63JLYohckyhNM1+P01w0dhQ+zPxzeQLEOciVArI6cA/rIFc844C5CXvnAh7xrHB9hq
         nz05SeScbxW6Zib6mt/8o/KDsEesVwdPDfgpFS32EAKqRDaQSfq4dOBcg9A3tS4j9wWB
         HBjm+KUpssuMd3m5kzbXXZ4ILsGymE4JDwsRnMT4aZHg9MXXfkbEmB5/2mOcd0Q2hIPF
         8Fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741347100; x=1741951900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpyPGp+dTBB+qlniZNUqzLuYqzVHyUJz8JfjvWuhOKY=;
        b=mGMT1MwMLq8C6Uu8KCCNxZlBV9D1HSbKlXE7LUXDN237rwB9OrM5nNwu7HvmP5EmS3
         /DgAG5FTDzj1sC2tTqxsqxV+m8R5DR2P9hGhx+s7p4bhJQdRgJ6Q4X8RyLliyZtYSUuG
         U/xbjA6Kvlyxf6idfMjBuPB4lL6+Ix/NVCiD0t1a+f2bAEZ0kJHKCEadiyvlJG/TtZJt
         GnxtXMinqXU3gn+5/ArH1RIQHq/Gfks2xSd2bHrBd78/eR3JJlnW3aot9jAZgPNz/hSD
         5UtsYELNLw+Gr52sjnQ1rwXtUcQGHr+OlqvzS92udYLs81nBD7Wd4ssyDCEi2cA7HjUH
         BxbQ==
X-Gm-Message-State: AOJu0Yy2HU52nS2IJhoAPToDnbInVqaKzL4qEMMhyeCJU3UGT/xRCDxL
	xPWfEtortgndkyvHTbDaO6471rb4/TX2iR90y30hRJ053oBp8KXgVs0KQ3p2d4+iazvIzKnkHsG
	0YBQMJw==
X-Gm-Gg: ASbGncsdRLVm3PfUDvQIZnIXrelrqnx+eA+qEafRPqn8zSqr8ujwg0xEl+yA1TzwT0m
	tbdhUku9Hz30XfIycGfV+C28MM1h9gpQVdMyyx4Sd9n0WpiREh/zGSu5Recy2HIYY0/zlc9pHBW
	d3ckZRxZ7dYltqv8fduWWnJQdaUNcnlEQFG/sA+va6fxgypaAqz3rGUOx8oPiie5oJPHtZqH0Lt
	E6fa2hfS5pSniEbBa5GeW/lA+8kdSwNVUQvDM5dCFnThA6gxMs6kp11NPBSjZR6vuNkAX8blyXz
	H0UzNpdVrn4UOcqjFdjfm+k/ynOTbRr2l5CiVdQ98zYJZsIwV4kGW7eUCZIA4QLiSee56Wxzohq
	hTK1Fa9ZzES5B2kSmp6N1urs=
X-Google-Smtp-Source: AGHT+IETrsIXIK6GRY2XRUDt4uq6ErHsIl6x93t6ybzCJaW3mK/Ol0mvAq3HKyJbmAn2p18OgEtpng==
X-Received: by 2002:a05:6512:3c98:b0:545:519:2d9e with SMTP id 2adb3069b0e04-549910daacamr1017387e87.47.1741347100150;
        Fri, 07 Mar 2025 03:31:40 -0800 (PST)
Received: from localhost.localdomain (dsl-hkibng11-567201-248.dhcp.inet.fi. [86.114.1.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae5992csm459029e87.98.2025.03.07.03.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 03:31:39 -0800 (PST)
From: Grigorii Sokolik <g.sokol99@g-sokol.info>
To: gargaditya08@live.com
Cc: linux-input@vger.kernel.org,
	Grigorii Sokolik <g.sokol99@g-sokol.info>
Subject: [PATCH] HID: hid-apple: Apple Magic Keyboard a3118 USB-C support
Date: Fri,  7 Mar 2025 13:31:23 +0200
Message-ID: <20250307113123.673765-1-g.sokol99@g-sokol.info>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <PN3PR01MB95972A18CA28F0154A3C4454B8D52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB95972A18CA28F0154A3C4454B8D52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Apple Magic Keyboard with fingerprint 2024 model (with USB-C port)
device ID (0321) to those recognized by the hid-apple driver. Keyboard
is otherwise compatible with the existing implementation for its
earlier 2021 model.

Also small refactoring:
- Regroup magic keyboards deffinition by year
- Rename lake magic keyboard key translations

Signed-off-by: Grigorii Sokolik <g.sokol99@g-sokol.info>
---
 drivers/hid/hid-apple.c | 21 +++++++++++++--------
 drivers/hid/hid-ids.h   |  3 ++-
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index d900dd05c..c8775b366 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -166,7 +166,7 @@ struct apple_backlight_set_report {
 };
 
 
-static const struct apple_key_translation apple2021_fn_keys[] = {
+static const struct apple_key_translation magic_keyboard_2021_and_2024_fn_keys[] = {
 	{ KEY_BACKSPACE, KEY_DELETE },
 	{ KEY_ENTER,	KEY_INSERT },
 	{ KEY_F1,	KEY_BRIGHTNESSDOWN, APPLE_FLAG_FKEY },
@@ -480,10 +480,11 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015)
 			table = magic_keyboard_2015_fn_keys;
 		else if (hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021 ||
-			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024 ||
 			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021 ||
 			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021)
-			table = apple2021_fn_keys;
+			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024 ||
+			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024 ||
+			table = magic_keyboard_2021_and_2024_fn_keys;
 		else if (hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132 ||
 			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680 ||
 			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213)
@@ -682,7 +683,7 @@ static void apple_setup_input(struct input_dev *input)
 	apple_setup_key_translation(input, apple_iso_keyboard);
 	apple_setup_key_translation(input, magic_keyboard_alu_fn_keys);
 	apple_setup_key_translation(input, magic_keyboard_2015_fn_keys);
-	apple_setup_key_translation(input, apple2021_fn_keys);
+	apple_setup_key_translation(input, magic_keyboard_2021_and_2024_fn_keys);
 	apple_setup_key_translation(input, macbookpro_no_esc_fn_keys);
 	apple_setup_key_translation(input, macbookpro_dedicated_esc_fn_keys);
 }
@@ -1157,10 +1158,6 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
-		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
-	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
-		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
@@ -1168,6 +1165,14 @@ static const struct hid_device_id apple_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021),
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT),
 		.driver_data = APPLE_MAGIC_BACKLIGHT },
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 7e4006249..f8f140b36 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -184,9 +184,10 @@
 #define USB_DEVICE_ID_APPLE_IRCONTROL4	0x8242
 #define USB_DEVICE_ID_APPLE_IRCONTROL5	0x8243
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021   0x029a
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024   0x0321
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT 0x8102
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY 0x8302
 
-- 
2.48.1


