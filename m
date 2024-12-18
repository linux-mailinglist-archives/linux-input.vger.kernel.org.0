Return-Path: <linux-input+bounces-8658-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C1D9F6892
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2024 15:35:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9FE31895B35
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2024 14:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67A11E9B37;
	Wed, 18 Dec 2024 14:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7KvsowN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0DE1E9B09;
	Wed, 18 Dec 2024 14:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734532402; cv=none; b=gXTj+Lh3sUj6xZ2ZZX63gG04MHkfknHX3K8up0dsYMdo04VdbhFiRx0gubPP+gfURFz5luCtez68YBPLu70GJii6gujvVDmf/OLMnYLkT0WnfSFhK10sLIHyf3p+vMeFfHgmj7QAlrVnYUbJF/vpzbX9TiLr3uyJ1tYf9EMPHMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734532402; c=relaxed/simple;
	bh=oxG3xNZpxKdb6Abko7sY+XRSa25Q4p0QwhvSywz8X9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jb99p0BRX4758L/NGb0LwnMAXgg7xCQrpkt1PSXixMaROgDHfDzb7lcM7m5xQuAIw3B4hnqJSPm71GzppzpzNBhbWa6GjP8SvO3S3XbkZtUpG7CdiaaNoP+6oUjENSLRInZMw0VlfM+HeCyyI+F+mdX910j0VfeF/gRb5HaBR9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7KvsowN; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-728f28744c5so6158336b3a.1;
        Wed, 18 Dec 2024 06:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734532399; x=1735137199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t775Qrcz6/GIXhaZoWIqsLuLrbeamqdZlPZt9Etb1e0=;
        b=T7KvsowNj2SjJU7GLkHk3O1XZZUhhMZ6qu1d0O6hNq/+p6MEs66Fs/z/aZyU1Pptp2
         /rOoVwXBAnIrtb+WFGAd0M9PoP+vXWKkpImV9RjrqachsIK+H5oV76hAheevmG/nkyTZ
         KaNWiBQwsp3mbcoD2qJS7FQsY+bDoOEi3ih7WM6rg/MqxV8SQFtOLwxd32S3Ybhy+WAN
         emQOhwrIQmBCIvLvfm2R+vVdVwOWr7XbKfTDY0JcwOr238RR51YoR6mHVvqyJPCH8ijO
         42W5r5Tf+Xtegk8vqFsDXB7Nh19ZvCcYji8vNHPPdjA7yWHl779KeD3fq0lONvGqi5dK
         oAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734532399; x=1735137199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t775Qrcz6/GIXhaZoWIqsLuLrbeamqdZlPZt9Etb1e0=;
        b=BRG4VvuAMFJf+JOmm6nRhgcUDBBdW8FIQNvTRSpllg5qe+yqLhrqQ25psT8+fHYKRV
         dEA7K/OATS/3iqWR/s+ZJ7B5dtM8a3ItyGR6Dx2GiJsgmsIeHEmho+b6XVBuyk+AoCrm
         54x4NOC4mmxNAFGsDK7L1vg+RiiqYTL2NXe3EDSup8wHwCSxbtEW1+kDMvRxFKKtsttW
         nWUJRnjreToRj6jwwTXvIe/Rs0jNZopraNeujlB6bLIwrBmuQLnUTIQP0HDjM5tgAioK
         6vH6KQsjfZj7w3ivPiE1LMUq73etIjA/V7v13Abk2mzfBhwoU62q4mLlFjPkthuEOWd3
         nqjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpMsoQfztO01NP1M9qERQ2DcCMpxYBhaP/f0dPmOj4bENCMPf0PFWRdiA1RXbLDHhOUjak/HiO6uiObw==@vger.kernel.org, AJvYcCWKeRcjZpRJpuGgMVF6WG4XHGvowL1UmIXDxe44Hwfscpap3/XvImrwXNuUxNYVQXeN8r4gY9skBWUbL1n7@vger.kernel.org
X-Gm-Message-State: AOJu0YxzzWb1rqEWsr8BKQ8XzeEDOK7tYBW5c7iM5LAc/owD0fPs/Rcp
	5NLuoWTJVwSLFxqifG7fSqc+MqPPZLsHS3cNlsYq4t9ucwoP7w7/
X-Gm-Gg: ASbGncvNRv9yOA0dD4boL3qLjAVqLBvqB56/r6h8U2dH9VLbNQU2BiGFwnMLnM/RhxZ
	Cnss6JsBvvMTyAMepUU1k9Y86eQ9w10s3yUEcT7j+WRRxa45r85XDyDUebHqr1GToQL1vKRsGXr
	yCAm3bT5EiuDI9Lb4m+DBz1zU1hYCDcWLVzueRvSHC9O1ds80cIcfuqpiyTS+X+qMMwHrGBkBzF
	I8T4YeUo2ByYQ8sTxI1nZm7698z7nwQ51nknY/2OWoQHubinht3dGtcNmmcndRcZJNYVu5TQ9ly
	e7DPa0mlvgCkBNORSqcF
X-Google-Smtp-Source: AGHT+IHzOZT0FJKWTGNiKKhvNWzy8fbq+LcQnkBczEYF3Ne2PloDl/9LFPthGycN7Sc1oM8vU0IPpA==
X-Received: by 2002:a05:6a20:db0a:b0:1e0:df27:10b5 with SMTP id adf61e73a8af0-1e5b487eb30mr5391974637.29.1734532399066;
        Wed, 18 Dec 2024 06:33:19 -0800 (PST)
Received: from hera-2-ThinkPad-X12-Detachable-Gen-2.. ([2404:7a80:b9a1:7100:971a:a6a2:1647:6607])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5ae979bsm7582629a12.48.2024.12.18.06.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 06:33:18 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v3] HID: lenovo: Support for ThinkPad-X12-TAB-1/2 Kbd Fn keys
Date: Wed, 18 Dec 2024 23:33:09 +0900
Message-ID: <20241218143309.86811-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fn Keys like Mic mute, Power Modes/Airplane mode,Selective
screenshot/Pickup Phone, KBD Backlight and
star/Favourites is emitted as HID raw events in X12 Tab1 and Tab2.
This support has been added.

Thinkpad X12 TAB 2 and TAB 1 Folio keyboard's raw events will get
detected as Fn keys with this patch.

Default fn_lock state for these Keyboards are OFF.

Other than these changes, we follow TP10UKBD's processes.

Tested on X12 Tab 2.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Signed-off-by: Vishnu Sankar <vsankar@lenovo.com>
Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
V2
-Rebased to hid.git
V3
-Renamed the patch to HID: lenovo: Support for ThinkPad-X12-TAB-1/2 Kbd Fn keys
-Fn Key macros changed to 4 bytes.
-Raw data check will look for 4 bytes instead of 3
-le32_to_cpu () used instead of shift operator to make 32 bit data.
-iternate through all hid inputs to find the device who generated the event,
instead of selecting the first available input.
-removed Fn-F7 as it is working by default.
-only 4 bytes hid raw data being handled now.
-additional check to ensure report-id is 0x03.
---
 drivers/hid/hid-lenovo.c | 99 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 98 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index f66194fde891..bfaadd54cba1 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -31,12 +31,20 @@
 #include <linux/input.h>
 #include <linux/leds.h>
 #include <linux/workqueue.h>
+#include <linux/platform_profile.h>
 
 #include "hid-ids.h"
 
 /* Userspace expects F20 for mic-mute KEY_MICMUTE does not work */
 #define LENOVO_KEY_MICMUTE KEY_F20
 
+/* HID raw events for ThinkPad X12 Tabs*/
+#define TP_X12_RAW_HOTKEY_FN_F4		0x00020003
+#define TP_X12_RAW_HOTKEY_FN_F8		0x38001003
+#define TP_X12_RAW_HOTKEY_FN_F10	0x00000803
+#define TP_X12_RAW_HOTKEY_FN_F12	0x00000403
+#define TP_X12_RAW_HOTKEY_FN_SPACE	0x18001003
+
 struct lenovo_drvdata {
 	u8 led_report[3]; /* Must be first for proper alignment */
 	int led_state;
@@ -71,6 +79,14 @@ struct lenovo_drvdata {
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
@@ -472,6 +488,8 @@ static int lenovo_input_mapping(struct hid_device *hdev,
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 		return lenovo_input_mapping_tp10_ultrabook_kbd(hdev, hi, field,
 							       usage, bit, max);
+	case USB_DEVICE_ID_LENOVO_X12_TAB:
+	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		return lenovo_input_mapping_x1_tab_kbd(hdev, hi, field, usage, bit, max);
@@ -582,6 +600,8 @@ static ssize_t attr_fn_lock_store(struct device *dev,
 	case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
 		lenovo_features_set_cptkbd(hdev);
 		break;
+	case USB_DEVICE_ID_LENOVO_X12_TAB:
+	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
@@ -680,6 +700,55 @@ static const struct attribute_group lenovo_attr_group_cptkbd = {
 	.attrs = lenovo_attributes_cptkbd,
 };
 
+/* Function to handle Lenovo Thinkpad TAB X12's HID raw inputs for fn keys*/
+static int lenovo_raw_event_TP_X12_tab(struct hid_device *hdev, u32 raw_data)
+{
+	struct hid_input *hidinput;
+	struct input_dev *input = NULL;
+
+	/* Iterate through all associated input devices */
+	list_for_each_entry(hidinput, &hdev->inputs, list) {
+		input = hidinput->input;
+		if (!input)
+			continue;
+
+		switch (raw_data) {
+			/* fn-F20 being used here for MIC mute*/
+		case TP_X12_RAW_HOTKEY_FN_F4:
+			report_key_event(input, LENOVO_KEY_MICMUTE);
+			return 1;
+		/* Power-mode or Airplane mode will be called based on the device*/
+		case TP_X12_RAW_HOTKEY_FN_F8:
+			/*
+			 * TP X12 TAB uses Fn-F8 calls Airplanemode
+			 * Whereas TP X12 TAB2 uses Fn-F8 for toggling
+			 * Power modes
+			 */
+			(hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB) ?
+				report_key_event(input, KEY_RFKILL) :
+				platform_profile_cycle();
+			return 1;
+		case TP_X12_RAW_HOTKEY_FN_F10:
+			/* TAB1 has PICKUP Phone and TAB2 use Snipping tool*/
+			(hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB) ?
+			report_key_event(input, KEY_PICKUP_PHONE) :
+			report_key_event(input, KEY_SELECTIVE_SCREENSHOT);
+			return 1;
+		case TP_X12_RAW_HOTKEY_FN_F12:
+			/* BookMarks/STAR key*/
+			report_key_event(input, KEY_BOOKMARKS);
+			return 1;
+		case TP_X12_RAW_HOTKEY_FN_SPACE:
+			/* Keyboard LED backlight toggle*/
+			report_key_event(input, KEY_KBDILLUMTOGGLE);
+			return 1;
+		default:
+			break;
+		}
+	}
+	return 0;
+}
+
 static int lenovo_raw_event(struct hid_device *hdev,
 			struct hid_report *report, u8 *data, int size)
 {
@@ -697,6 +766,15 @@ static int lenovo_raw_event(struct hid_device *hdev,
 		data[2] = 0x01;
 	}
 
+	/*
+	 * Lenovo TP X12 Tab KBD's Fn+XX is HID raw data defined. Report ID is 0x03
+	 * e.g.: Raw data received for MIC mute is 0x00020003.
+	 */
+	if (unlikely((hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB
+			|| hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB2)
+			&& size >= 3 && report->id == 0x03))
+		return lenovo_raw_event_TP_X12_tab(hdev, le32_to_cpu(*(u32 *)data));
+
 	return 0;
 }
 
@@ -776,6 +854,8 @@ static int lenovo_event(struct hid_device *hdev, struct hid_field *field,
 	case USB_DEVICE_ID_LENOVO_TPIIUSBKBD:
 	case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
 		return lenovo_event_cptkbd(hdev, field, usage, value);
+	case USB_DEVICE_ID_LENOVO_X12_TAB:
+	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
@@ -1057,6 +1137,8 @@ static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
 	case USB_DEVICE_ID_LENOVO_TPKBD:
 		lenovo_led_set_tpkbd(hdev);
 		break;
+	case USB_DEVICE_ID_LENOVO_X12_TAB:
+	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
@@ -1243,8 +1325,15 @@ static int lenovo_probe_tp10ubkbd(struct hid_device *hdev)
 	 * We cannot read the state, only set it, so we force it to on here
 	 * (which should be a no-op) to make sure that our state matches the
 	 * keyboard's FN-lock state. This is the same as what Windows does.
+	 *
+	 * For X12 TAB and TAB2, the default windows behaviour Fn-lock Off.
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
@@ -1288,6 +1377,8 @@ static int lenovo_probe(struct hid_device *hdev,
 	case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
 		ret = lenovo_probe_cptkbd(hdev);
 		break;
+	case USB_DEVICE_ID_LENOVO_X12_TAB:
+	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
@@ -1375,6 +1466,8 @@ static void lenovo_remove(struct hid_device *hdev)
 	case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
 		lenovo_remove_cptkbd(hdev);
 		break;
+	case USB_DEVICE_ID_LENOVO_X12_TAB:
+	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
@@ -1429,6 +1522,10 @@ static const struct hid_device_id lenovo_devices[] = {
 		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB) },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB3) },
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X12_TAB) },
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X12_TAB2) },
 	{ }
 };
 
-- 
2.43.0


