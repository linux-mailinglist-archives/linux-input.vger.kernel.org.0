Return-Path: <linux-input+bounces-11174-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4964BA6EF55
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 12:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2DBF188B550
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 11:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408662561AB;
	Tue, 25 Mar 2025 11:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cegITY20"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9DB2571BF;
	Tue, 25 Mar 2025 11:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742900903; cv=none; b=nqMDjk8UZ3X61uMxZ3GbtFIjnIDHqRUz5Xh9QYBf03DHcO1vA0bebT9+bANWJOsoH+XixleoGqLOSaa1xVoOgu5uj9wpBqz2m5e9Da5R2AIPXt+m9RKwFnhVHJiStv3m4bxTjobnjnHFiVE0rVINSSpcTdut+li+rMgVE5k9fFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742900903; c=relaxed/simple;
	bh=dSzU1RT2RVlJ75z/U3K83JjoResu+3Vz2eZrTVbI8bY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gkE5JwYGZH9AZlP1YMoFsBp+4UkjSV2fCKaLdw41285RMMoyvuOn2dmDCFrwk5SiG2Znejtsng/tahX9pIQZ5LMsXsorbXL0TU34loRgV6NVS+D8I2B3BnElwSPOOx+cQpP5e8TDRjPzkWQ8whiz9EzA16xByzfL3c7RjpZEVOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cegITY20; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227aaa82fafso50095865ad.2;
        Tue, 25 Mar 2025 04:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742900900; x=1743505700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXCl3WWGod0Kz7gpDOq3MqT6WRAUowr29PSlspMmRgY=;
        b=cegITY20gUquJcmf05LWH/LauJOQR0zlf57lBl6kHZwKGbVzhPgNfRypB8gXcMew+U
         mAcRGjl7chPC9PHtPEVPvox/1watGmmS3t8kbH9ATRhH/y+041fnQmv1jT2Kcm8krkmn
         dWeKujXSyHXUN/3BT7GoEplXplUYhrOJhCPvA5tJSfuyBycyV5qu+TDwHbJjALDLXFJD
         hEQTmQ6i0fAXUp1G0ZPUsr0LxXTnEcr3xsTxwO3TpnUGXuNMnWCu+udQOBCzyeQ4ejK8
         Gk0mjdo2uFpzfjk7BONCBx3wcNkHIax/D1KcFDAdOmNZFb7emuG5c/NSSkL55eStkL0d
         WCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742900900; x=1743505700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXCl3WWGod0Kz7gpDOq3MqT6WRAUowr29PSlspMmRgY=;
        b=GK+B+njqwAg/b2tIpJCtTtIz7ulfpGmUhJJWW5T9NPkleMR3+3HvL9HmuLW4tpfU+n
         zwD25ae9J7LMwwulfc74LzN+SXc25+InyRYtdCFUcHDwI4Eq9ngDUZZOlnf3f5vyx9EO
         tVR7ocgTmDaVXqRXeQPYaNWaVoWelMLABKk3Mu0lsUR0BIDCrspximkjSxhHs4y8rQPA
         2d3+oTG1gAco9UXgLZulKnHxdBzPu35D2jIoA+Zyu2ORJ85JDovDTc8cTZIzlpqfnan6
         DXSFs7T2DZpaN/HmO7InUX3ZRQBDmP01qFWuaOYrmudLUFBy8qgBihpQyVFFNtdYD/oJ
         MjrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdMMXYb4d27gnss8Oscfui2zWkgqdAvBLNIQsElwZTZjffW45i31o9Pa8DGSzXrk6RwAWq3atWw203VA==@vger.kernel.org, AJvYcCWyx8zwbTAN6LtOSZKoUSXx+SFWR/l2DAFLQSb2ITf79cnpu/Fseu5FD6QDoLnXNV3GSXzsFYwMkhB5R0lk@vger.kernel.org
X-Gm-Message-State: AOJu0YyJVPW5NusVrbfp2srQ0AFsJlD5+H2e4pF0jUb1UYHrlHCq7c2G
	SRgTDL3CKqm4O0WRMOf8PKWN+/A9vsxFywDZkuKh68q5AZmYnT1v
X-Gm-Gg: ASbGnctqq/nWN9+x8x3yW5SlfvKxbkq3X3OVWIjI3X3rTJ20mCC2YzhUxesbSn1jX/8
	8RMW5A7zq261DdkHCiiHYKLJybVuLNJGgQH2gidPWjw0CGdBBNvnoEljGE8QyoP5ZR7OmQTKQXd
	f7h7aZ64Fv6LA2MgLbZ0cE7h7Fpev48CalosaE3LXYe3UMr62V6SGDQ7nH0jMS2K9SMsXKoUBlV
	5sLIxymCOTVoAsvdPaCbke1G2mVRrEugdGaCOyQjk6I5OMF0iD2v4Ba2kmikLe7ToFuAwuzNOO9
	VPuMmwN8RNVkmLc6fEDMcDUJfaOhMgPrtiUem+RjtdmcYdHOwE0nIHkgUutCXDb5e+zSwx3+gXA
	4kqm/wb7sw3e58LkPf5z+i47W3NtHwEWirERDFKVW66GXvwGQg2qEIa0W
X-Google-Smtp-Source: AGHT+IFobGjpv4nZgk4eoCCakCryK+v9+D7q9swa46QCpQcL9TTKvKmwBD1WzYbYRODSPLXOCcAUcQ==
X-Received: by 2002:a05:6a21:1085:b0:1f5:7873:304f with SMTP id adf61e73a8af0-1fe43300f45mr34740607637.37.1742900899717;
        Tue, 25 Mar 2025 04:08:19 -0700 (PDT)
Received: from codespaces-3dd663.dxrpqgqhlb3ehogrxrezr215ye.rx.internal.cloudapp.net ([20.192.21.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739061592b9sm9787667b3a.152.2025.03.25.04.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:08:19 -0700 (PDT)
From: Aditya Garg <adityagarg1208@gmail.com>
X-Google-Original-From: Aditya Garg <gargaditya08@live.com>
To: jikos@kernel.org,
	jkosina@suse.com,
	bentiss@kernel.org,
	benjamin.tissoires@redhat.com
Cc: g.sokol99@g-sokol.info,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	gargaditya08@live.com
Subject: [PATCH v3 4/5] HID: apple: Add Apple Magic Keyboard A3118 USB-C support
Date: Tue, 25 Mar 2025 11:05:26 +0000
Message-ID: <20250325110754.28359-5-gargaditya08@live.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325110754.28359-1-gargaditya08@live.com>
References: <20250325110754.28359-1-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Grigorii Sokolik <g.sokol99@g-sokol.info>

Add Apple Magic Keyboard 2024 with Touch ID device ID (05ac:0321) to
those recognized by the hid-apple driver. Keyboard is otherwise
compatible with the existing implementation for its earlier 2021 model.

Signed-off-by: Grigorii Sokolik <g.sokol99@g-sokol.info>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 21 +++++++++++++--------
 drivers/hid/hid-ids.h   |  9 +++++----
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index fde438bee..e95a54113 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -165,7 +165,7 @@ static const struct apple_key_translation magic_keyboard_2015_fn_keys[] = {
 	{ }
 };
 
-static const struct apple_key_translation apple2021_fn_keys[] = {
+static const struct apple_key_translation magic_keyboard_2021_and_2024_fn_keys[] = {
 	{ KEY_BACKSPACE, KEY_DELETE },
 	{ KEY_ENTER,	KEY_INSERT },
 	{ KEY_F1,	KEY_BRIGHTNESSDOWN, APPLE_FLAG_FKEY },
@@ -482,10 +482,11 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 			table = magic_keyboard_2015_fn_keys;
 			break;
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021:
-		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021:
-			table = apple2021_fn_keys;
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024:
+			table = magic_keyboard_2021_and_2024_fn_keys;
 			break;
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132:
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213:
@@ -690,7 +691,7 @@ static void apple_setup_input(struct input_dev *input)
 	apple_setup_key_translation(input, apple_iso_keyboard);
 	apple_setup_key_translation(input, magic_keyboard_alu_fn_keys);
 	apple_setup_key_translation(input, magic_keyboard_2015_fn_keys);
-	apple_setup_key_translation(input, apple2021_fn_keys);
+	apple_setup_key_translation(input, magic_keyboard_2021_and_2024_fn_keys);
 	apple_setup_key_translation(input, macbookpro_no_esc_fn_keys);
 	apple_setup_key_translation(input, macbookpro_dedicated_esc_fn_keys);
 }
@@ -1165,10 +1166,6 @@ static const struct hid_device_id apple_devices[] = {
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
@@ -1177,6 +1174,14 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT),
 		.driver_data = APPLE_MAGIC_BACKLIGHT },
 
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 7e4006249..7f2976639 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -162,6 +162,11 @@
 #define USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS   0x0257
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015   0x0267
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015   0x026c
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021   0x029a
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024   0x0321
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ANSI	0x0290
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ISO	0x0291
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_JIS	0x0292
@@ -183,10 +188,6 @@
 #define USB_DEVICE_ID_APPLE_IRCONTROL3	0x8241
 #define USB_DEVICE_ID_APPLE_IRCONTROL4	0x8242
 #define USB_DEVICE_ID_APPLE_IRCONTROL5	0x8243
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021   0x029a
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT 0x8102
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY 0x8302
 
-- 
2.49.0


