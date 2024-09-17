Return-Path: <linux-input+bounces-6578-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3508197AE76
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2024 12:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 599111C21025
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2024 10:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9069815C138;
	Tue, 17 Sep 2024 10:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWDkjFtK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB25D15A876;
	Tue, 17 Sep 2024 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726567536; cv=none; b=TmNX8pILENb5hsFTmPQQwbQIW5wCvmBDd8PkhGFqen3lYBSVHn4yTQEVn8iTPfhh8/k4AlI+cfTi5aNRe8zrso2AutjxW7BmKdyQusJg4CZBn+dh+QBUo6EaNwyjVPUKXTPbfc53gh5EaVYA90+2jRQTJFyozwEfXYeJ/HBDSlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726567536; c=relaxed/simple;
	bh=/LpCZIRCjJEZxOcuU8A08ovsog+8/vTmnzNEXBX08Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UxVD+u/LXerG1zWQ3TV29EfFaKUzKAhioRANVXjKz3d9gcelbgwTFLyRBEZO+XwJC3qjuaUPZ1IjeigrVdHToJnPt69yXCxo1Hd5nh6s6+7Mx+CEJvMkhCmbvlHBbEZ552sKeT4QJKMmN19go/WtFpe2cg2CWzE0WrCsCjiX4cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWDkjFtK; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71923d87be4so2883690b3a.0;
        Tue, 17 Sep 2024 03:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726567534; x=1727172334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c2xltqATgw2KK02jP7aHfFW3EbgnqGG2UjGS0NpdfPI=;
        b=BWDkjFtKs5Y25Ywuja1SHRHUub4oIQk8d1V2wiyeLHAYghCmXjXuU5TYD7WafpoYI3
         +pRjRtwiORfvQjTyeLNttPdDSdJllm9Ib2gPoRJvDFCheOe/AODXrKWBoJxrHSLrfVh2
         H2mYm88w5Fzjue3PaDC9eyycK84Nj7KDwXQZaona2k1J0B7hGLcuI0N1G/zvyoRkf/4K
         N9xP0L7YJ4JGZK26OgA+F1jkVro4Or33F5YTWZnuPhx+izBStAa4GEq0Mfy9xvo4SMkL
         yc0j1kl90VocBUJo0/1QXPrjTeDCPdBjTcJOPs8NCLcXwfWQPi9S3SMT5Lnc9QH2NUYi
         VP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726567534; x=1727172334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2xltqATgw2KK02jP7aHfFW3EbgnqGG2UjGS0NpdfPI=;
        b=FDgTcBia8DP6/ZoKdr7DzIPRDkyFoyOr3NjSC4LTSiLNQ/kY6k2T698GukdaFkNemP
         DYk0uLCJ3BkI7CVzT+S+l5nOCQi7YjHV7c5nZY6++fiWYU1tG8n9lD+OP/f7u2ILJI5W
         0tHd8qmPB4q3+ckPur5Gr7tsXLSNUw+K304OqfBXr2wbEfw0mn2Vb2BL1LxZMCYDLFvj
         x/kJDjHkRdh2zC+ZUxL8u/emODX/93ts1uw98UJu+bIicVCQlZ0AejRzWJG5Y4QQRjFA
         Cvp4oKeJ1RcYK3Vva8gwcYNSr3ExXaQ3Sq0gEd30YsfF/kFuV/ww/bmhqU2WDJ8PkExo
         amKg==
X-Forwarded-Encrypted: i=1; AJvYcCU4BpvOAH6Jeda2QQpTVSUgk/6fa+LRJu6kc7ngpeJJv3ckA5ExZrSWbp50SVNl7QUvl1FwXlm8GPKH8w==@vger.kernel.org, AJvYcCVbzzMPtGdB5FPY+dRC5ljOzjB8s9mpW8y+Thy+D0u12l2HFjQ8Z4yUEqtcILU/0aDw8UwYlmW7l0OlflwL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9jfGKoKGo60rh72U7BZXtG391xd+oDqirX/VrqkaypXdkZCrG
	RevnUFOIuy9Y2qGVMAetjKeiCuLjv3d1rCOoWPGkUvfBAOoKWTd0DVvnwEh6
X-Google-Smtp-Source: AGHT+IEhgI1xC1jJZOD1de7YDbvwzkQMM+KNJgJUVBgyYHMuRqktpY+sgutcL88I3EGLOZ2U9+ua+A==
X-Received: by 2002:a05:6a00:c8f:b0:70d:2ac8:c838 with SMTP id d2e1a72fcca58-71936a3ac34mr25472368b3a.4.1726567533892;
        Tue, 17 Sep 2024 03:05:33 -0700 (PDT)
Received: from hera-2-ThinkPad-X12-Detachable-Gen-2.. ([2404:7a80:b9a1:7100:38f5:6885:145f:ccf2])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71944bc17edsm4915065b3a.184.2024.09.17.03.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 03:05:33 -0700 (PDT)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH] hid: hid-lenovo: Supporting TP-X12-TAB-1/2 Kbd Hotkeys using raw  events.
Date: Tue, 17 Sep 2024 19:04:31 +0900
Message-ID: <20240917100432.10887-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HID raw events being handled as Mic mute, Power Modes/Airplane mode,
Selective screenshot/Pickup Phone, KBD Backlight, Display mode and
star/Favourites has been added.
Thinkpad X12 TAB 2 and TAB 1 Folio keyboard's raw events will get
detected with this patch.

Default fn_lock state for these Keyboard are OFF.

Other than these changes, we follow TP10UKBD's processes.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Signed-off-by: Vishnu Sankar <vsankar@lenovo.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/hid/hid-lenovo.c | 118 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index e5e72aa52..db14b416f 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -31,12 +31,21 @@
 #include <linux/input.h>
 #include <linux/leds.h>
 #include <linux/workqueue.h>
+#include <linux/platform_profile.h>
 
 #include "hid-ids.h"
 
 /* Userspace expects F20 for mic-mute KEY_MICMUTE does not work */
 #define LENOVO_KEY_MICMUTE KEY_F20
 
+/* HID raw events for ThinkPas X12 Tabs*/
+#define TP_X12_RAW_HOTKEY_FN_F4		0x000200
+#define TP_X12_RAW_HOTKEY_FN_F8		0x100038
+#define TP_X12_RAW_HOTKEY_FN_F10	0x080000
+#define TP_X12_RAW_HOTKEY_FN_F12	0x040000
+#define TP_X12_RAW_HOTKEY_FN_SPACE	0x100018
+#define TP_X12_RAW_HOTKEY_FN_F7		0x080013
+
 struct lenovo_drvdata {
 	u8 led_report[3]; /* Must be first for proper alignment */
 	int led_state;
@@ -71,6 +80,14 @@ struct lenovo_drvdata {
 #define TP10UBKBD_LED_OFF		1
 #define TP10UBKBD_LED_ON		2
 
+/* Function to report raw_events as key events*/
+static inline void report_key_event(struct input_dev *input, int keycode)
+{
+	input_report_key(input, keycode, 1);
+	input_report_key(input, keycode, 0);
+	input_sync(input);
+}
+
 static int lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 led_code,
 				    enum led_brightness value)
 {
@@ -472,6 +489,8 @@ static int lenovo_input_mapping(struct hid_device *hdev,
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 		return lenovo_input_mapping_tp10_ultrabook_kbd(hdev, hi, field,
 							       usage, bit, max);
+	case USB_DEVICE_ID_LENOVO_X12_TAB:
+	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
 		return lenovo_input_mapping_x1_tab_kbd(hdev, hi, field, usage, bit, max);
 	default:
@@ -581,6 +600,8 @@ static ssize_t attr_fn_lock_store(struct device *dev,
 	case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
 		lenovo_features_set_cptkbd(hdev);
 		break;
+	case USB_DEVICE_ID_LENOVO_X12_TAB:
+	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
 		ret = lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, value);
@@ -678,9 +699,62 @@ static const struct attribute_group lenovo_attr_group_cptkbd = {
 	.attrs = lenovo_attributes_cptkbd,
 };
 
+/* Function to handle Lenovo Thinkpad TAB X12's HID raw inputs for fn keys*/
+static int lenovo_raw_event_TP_X12_tab(struct hid_device *hdev, u32 raw_data)
+{
+	struct hid_input *hidinput;
+	struct input_dev *input = NULL;
+
+	/* Iterate through the associated inputs to find the correct input device */
+	list_for_each_entry(hidinput, &hdev->inputs, list) {
+		input = hidinput->input;
+		if (input)
+			break;  /* Use the first valid input device */
+	}
+
+	switch (raw_data) {
+		/* fn-F20 being used here for MIC mute*/
+	case TP_X12_RAW_HOTKEY_FN_F4:
+		report_key_event(input, LENOVO_KEY_MICMUTE);
+		return 1;
+		/* Power-mode or Airplane mode will be called based on the device*/
+	case TP_X12_RAW_HOTKEY_FN_F8:
+		/* TP X12 TAB uses Fn-F8 calls Airplanemode
+		 * Whereas TP X12 TAB2 uses Fn-F8 for toggling
+		 * Power modes
+		 */
+		(hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB) ?
+			report_key_event(input, KEY_RFKILL) :
+			platform_profile_cycle();
+		return 1;
+	case TP_X12_RAW_HOTKEY_FN_F10:
+		/* TAB1 has PICKUP Phone and TAB2 use Snipping tool*/
+		(hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB) ?
+		report_key_event(input, KEY_PICKUP_PHONE) :
+		report_key_event(input, KEY_SELECTIVE_SCREENSHOT);
+		return 1;
+	case TP_X12_RAW_HOTKEY_FN_F12:
+		/* BookMarks/STAR key*/
+		report_key_event(input, KEY_BOOKMARKS);
+		return 1;
+	case TP_X12_RAW_HOTKEY_FN_SPACE:
+		/* Keyboard LED backlight toggle*/
+		report_key_event(input, KEY_KBDILLUMTOGGLE);
+		return 1;
+	case TP_X12_RAW_HOTKEY_FN_F7:
+		/* DISPLAY switching when connecting to external monitors*/
+		report_key_event(input, KEY_SWITCHVIDEOMODE);
+		return 1;
+	default:
+		break;
+	}
+	return 0;
+}
+
 static int lenovo_raw_event(struct hid_device *hdev,
 			struct hid_report *report, u8 *data, int size)
 {
+	u32 raw_data;
 	/*
 	 * Compact USB keyboard's Fn-F12 report holds down many other keys, and
 	 * its own key is outside the usage page range. Remove extra
@@ -695,6 +769,29 @@ static int lenovo_raw_event(struct hid_device *hdev,
 		data[2] = 0x01;
 	}
 
+	/* Lenovo TP X12 Tab KBD's Fn+XX is HID raw data defined. Report ID is 0x03
+	 * For eg: Raw data received for MIC mute is 0x03000200.
+	 */
+	if (unlikely((hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB
+			|| hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB2)
+			&& size >= 3)) {
+		/* data[0] is report ID and is same for all 4byte raw_events from this KBD
+		 * for eg: Fn+F8 0x03,0x10,0x00,0x38
+		 * report ID here for most of the keys are 0x03.
+		 */
+		if (report->id == 0x03)
+			raw_data = (data[1] << 16) | (data[2] << 8) | data[3];
+		/* For some Keys the raw data is 6 bytes long but the last 3 bytes
+		 * will be always Zeros. There is no report-id documented.
+		 * For eg: for Fn+F7: 0x08,0x00,0x13,0x00,0x00,0x00.
+		 * In other words the last 3 bytes are dummy for now.
+		 */
+		else
+			raw_data = (data[0] << 16) | (data[1] << 8) | data[2];
+
+		/* Calling function to generate Key events */
+		lenovo_raw_event_TP_X12_tab(hdev, raw_data);
+	}
 	return 0;
 }
 
@@ -774,6 +871,8 @@ static int lenovo_event(struct hid_device *hdev, struct hid_field *field,
 	case USB_DEVICE_ID_LENOVO_TPIIUSBKBD:
 	case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
 		return lenovo_event_cptkbd(hdev, field, usage, value);
+	case USB_DEVICE_ID_LENOVO_X12_TAB:
+	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
 		return lenovo_event_tp10ubkbd(hdev, field, usage, value);
@@ -1054,6 +1153,8 @@ static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
 	case USB_DEVICE_ID_LENOVO_TPKBD:
 		lenovo_led_set_tpkbd(hdev);
 		break;
+	case USB_DEVICE_ID_LENOVO_X12_TAB:
+	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
 		ret = lenovo_led_set_tp10ubkbd(hdev, tp10ubkbd_led[led_nr], value);
@@ -1239,8 +1340,15 @@ static int lenovo_probe_tp10ubkbd(struct hid_device *hdev)
 	 * We cannot read the state, only set it, so we force it to on here
 	 * (which should be a no-op) to make sure that our state matches the
 	 * keyboard's FN-lock state. This is the same as what Windows does.
+	 *
+	 * For X12 TAB and TAB2, the default windows behavious Fn-lock Off.
+	 * Adding additional check to ensure the behaviour in case of
+	 * Thinkpad X12 Tabs.
 	 */
-	data->fn_lock = true;
+
+	data->fn_lock = !(hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB ||
+			hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB2);
+
 	lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, data->fn_lock);
 
 	ret = sysfs_create_group(&hdev->dev.kobj, &lenovo_attr_group_tp10ubkbd);
@@ -1284,6 +1392,8 @@ static int lenovo_probe(struct hid_device *hdev,
 	case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
 		ret = lenovo_probe_cptkbd(hdev);
 		break;
+	case USB_DEVICE_ID_LENOVO_X12_TAB:
+	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
 		ret = lenovo_probe_tp10ubkbd(hdev);
@@ -1370,6 +1480,8 @@ static void lenovo_remove(struct hid_device *hdev)
 	case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
 		lenovo_remove_cptkbd(hdev);
 		break;
+	case USB_DEVICE_ID_LENOVO_X12_TAB:
+	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
 		lenovo_remove_tp10ubkbd(hdev);
@@ -1421,6 +1533,10 @@ static const struct hid_device_id lenovo_devices[] = {
 	 */
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB) },
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X12_TAB) },
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X12_TAB2) },
 	{ }
 };
 
-- 
2.43.0


