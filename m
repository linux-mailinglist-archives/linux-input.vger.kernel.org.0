Return-Path: <linux-input+bounces-16655-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A01CACD3F2E
	for <lists+linux-input@lfdr.de>; Sun, 21 Dec 2025 12:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 892DE3006464
	for <lists+linux-input@lfdr.de>; Sun, 21 Dec 2025 11:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26731EBA19;
	Sun, 21 Dec 2025 11:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXKBj0mK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E1A78F2E;
	Sun, 21 Dec 2025 11:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766315548; cv=none; b=YCVts4k6HisETcmPq9eYWZK/dr9TvfrT1RENJONKxj9Zz5QoHVQNJEuRj6yUiw+B0pbhaJXrQTmh643/BpGvd/AzXqe5cirMJJo60lT+PhT4sH6Ob2jjM9+yKfw75qfPdIHNufOFyKc0YWNM0wGsY2iDyh1zX4lTec8UOO0efBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766315548; c=relaxed/simple;
	bh=ec96tAEOXALc9aCBhzT5fARzm+25iWy+XvT3cRjF2+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YR/2MMvQp+MTlUrGLLMlngbMFnl0yEQgP3RaU9xlXYSPazO0RuebR9pcU0rmUHbCPly+a6w19zP42nEyI9fYYOHRAPsoS6wbgKt5qz/FBBip65Z52qGw88oxcrZm4UAu07Wwm7pABCDL/RwgMftvCXrw+3vBD2Inc5so9Jzr9mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXKBj0mK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A3F9C4CEFB;
	Sun, 21 Dec 2025 11:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766315548;
	bh=ec96tAEOXALc9aCBhzT5fARzm+25iWy+XvT3cRjF2+o=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=GXKBj0mKxucPVYHIncHIynNQR3U6V9EtA7mBNFBFJ94tQ6u6YGqKFQ3DmLulaEiuz
	 3Gh29KhPfrFVhoZCVaSOrP9EdD5F0aXyYQd5UBYTq3hQNWdraN/tf/jfzAsr8P04Kz
	 JKhNFUnatSW2l142952UYV0NoLKdV4lNI1IUFpkyR4JtvsZQstvBnsHt687T0TU+pr
	 hiUqpCJxV0V4O8h/q+G8QrocZjBUU0Ka3bYnhhVQ37F0BG4D8FECzqiQKX3xew8N4a
	 TUJmD/Dgg7uaUdzyR5ffjW7jF23Q90/N4f+4wJYgCXmrLyKlc/bCjORLcidrrp1wbn
	 gGzXsR8yC0+wA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2328AE67482;
	Sun, 21 Dec 2025 11:12:28 +0000 (UTC)
From: Alexandru Marc Serdeliuc via B4 Relay <devnull+serdeliuk.yahoo.com@kernel.org>
Date: Sun, 21 Dec 2025 12:12:26 +0100
Subject: [PATCH] HID: asus: add new Asus EC hid device for keyboard
 backlight and FN HotKeys
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-add-support-for-the-asus-hid-ec-v1-1-35d7d70fbbfc@yahoo.com>
X-B4-Tracking: v=1; b=H4sIABnWR2kC/x3NTQqDQAxA4atI1g046R/tVUoX0cRONs6QqBTEu
 3fo8tu8t0OomwY8ux1cNwsrc0M6dTBmnj+KJs1APV0TUUIWwVhrLb7gVByXrMixBmYT1BH51g8
 PJrlfhjO0SnWd7Ps/vN7H8QPjXYvEcQAAAA==
X-Change-ID: 20251221-add-support-for-the-asus-hid-ec-a60b9a2d74b3
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766315546; l=14614;
 i=serdeliuk@yahoo.com; s=20240326; h=from:subject:message-id;
 bh=FVls44rC3kCWAia0b4VndnrMgzTsYDMV5S2vJbaf0i8=;
 b=CkPiQ2YNWYdOZL+lAafTjsBgrRpEAKaFMwv6exCxUEbqB61/tiz1tM4Tm0K/JF4lJ+GrPSdXJ
 ZekaZUoERRVDdZLqQZ3M+Ryde4XcuKgBjWlbStGJkwtwCoopoBZQLvS
X-Developer-Key: i=serdeliuk@yahoo.com; a=ed25519;
 pk=aWyveUE11qfDOOlRIFayXukrNn39BvZ9k9uq94dAsgY=
X-Endpoint-Received: by B4 Relay for serdeliuk@yahoo.com/20240326 with
 auth_id=147
X-Original-From: Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>
Reply-To: serdeliuk@yahoo.com

From: Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>

Add support for Asus Embedded Controlled accessed via HID

Currently working features:
- Keyboard Backlight
- FN HotKeys

Signed-off-by: Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>
---
Add support for Asus Embedded Controlled accessed via HID

Currently working features:
- Keyboard Backlight
- FN HotKeys
---
 drivers/hid/Kconfig       |  10 ++
 drivers/hid/Makefile      |   1 +
 drivers/hid/hid-asus-ec.c | 386 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 397 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 920a64b66b25b39e8259105c7c9b975fb77b2725..f0fbc951735eeea39198137294a9429f5b9d34b8 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -202,6 +202,16 @@ config HID_ASUS
 	- GL553V series
 	- GL753V series
 
+config HID_ASUS_EC
+	tristate "ASUS EC HID support (Zenbook A14 UX3407QA)"
+	depends on HID && I2C_HID
+	help
+	  Say Y here if you have an ASUS Zenbook A14 (UX3407QA) and want
+	  support for its EC-controlled keyboard backlight and Fn hotkeys
+
+	  This driver is currently only tested on the ASUS Zenbook A14
+	  UX3407QA; behaviour on other models is unknown.
+
 config HID_AUREAL
 	tristate "Aureal"
 	help
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 361a7daedeb85454114def8afb5f58caeab58a00..bacccf00482c1b787ce59660e4366f8224aeefee 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_HID_APPLETB_BL)	+= hid-appletb-bl.o
 obj-$(CONFIG_HID_APPLETB_KBD)	+= hid-appletb-kbd.o
 obj-$(CONFIG_HID_CREATIVE_SB0540)	+= hid-creative-sb0540.o
 obj-$(CONFIG_HID_ASUS)		+= hid-asus.o
+obj-$(CONFIG_HID_ASUS_EC)	+= hid-asus-ec.o
 obj-$(CONFIG_HID_AUREAL)	+= hid-aureal.o
 obj-$(CONFIG_HID_BELKIN)	+= hid-belkin.o
 obj-$(CONFIG_HID_BETOP_FF)	+= hid-betopff.o
diff --git a/drivers/hid/hid-asus-ec.c b/drivers/hid/hid-asus-ec.c
new file mode 100644
index 0000000000000000000000000000000000000000..1cf61fb2468d079827bfdb1db49daca905e53874
--- /dev/null
+++ b/drivers/hid/hid-asus-ec.c
@@ -0,0 +1,386 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * ASUS EC HID driver for Zenbook A14 (UX3407QA)
+ *
+ * EC I2C HID driver for keyboard backlight and Fn hotkeys.
+ *
+ * Copyright (c) 2025 Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/hid.h>
+#include <linux/input.h>
+#include <linux/leds.h>
+#include <linux/slab.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/string.h>
+#include <linux/delay.h>
+#include <linux/pm.h>
+
+#define ASUS_VENDOR_ID		0x0B05
+#define ASUS_PRODUCT_ID		0x0220
+
+#define A14_EC_REPORT_ID	0x5A
+#define A14_EC_REPORT_SIZE	64
+#define A14_EC_MAX_BACKLIGHT	3
+
+#define A14_EC_EVT_KEY_FN_ESC	0x4E
+#define A14_EC_EVT_KEY_FN_F4	0xC7
+#define A14_EC_EVT_KEY_FN_F5	0x10
+#define A14_EC_EVT_KEY_FN_F6	0x20
+#define A14_EC_EVT_KEY_FN_F8	0x7E
+#define A14_EC_EVT_KEY_FN_F9	0x7C
+#define A14_EC_EVT_KEY_FN_F10	0x85
+#define A14_EC_EVT_KEY_FN_F11	0x6B
+#define A14_EC_EVT_KEY_FN_F12	0x86
+#define A14_EC_EVT_KEY_FN_F	0x9d
+
+
+struct asus_hid_data {
+	struct hid_device *hdev;
+	struct led_classdev kbd_led_cdev;
+	struct input_dev *hotkey_input_dev;
+	enum led_brightness saved_brightness;
+};
+
+static struct asus_hid_data *asus_data;
+
+static int asus_send_ec_command(struct hid_device *hdev, u8 *cmd_buf)
+{
+	int ret;
+	u8 report_id = cmd_buf[0];
+
+	ret = hid_hw_raw_request(hdev, report_id, cmd_buf, A14_EC_REPORT_SIZE,
+				     HID_FEATURE_REPORT,
+				     HID_REQ_SET_REPORT);
+
+	if (ret < 0)
+		dev_err(&hdev->dev, "hid_hw_raw_request failed with status: %d\n", ret);
+
+	return ret;
+}
+
+static int asus_kbd_led_init(struct hid_device *hdev)
+{
+	u8 ec_init_cmd[A14_EC_REPORT_SIZE] = { A14_EC_REPORT_ID, 0xD0, 0x8F, 0x01 };
+	int ret;
+
+	ret = asus_send_ec_command(hdev, ec_init_cmd);
+
+	if (ret < 0)
+		return ret;
+
+	u8 brightness_cmd[A14_EC_REPORT_SIZE] = { A14_EC_REPORT_ID, 0xBA, 0xC5,
+				    0xC4, A14_EC_MAX_BACKLIGHT };
+
+	ret = asus_send_ec_command(hdev, brightness_cmd);
+	if (ret < 0)
+		dev_warn(&hdev->dev, "Brightness init failed: %d\n", ret);
+
+	return ret;
+}
+
+static void asus_kbd_set_brightness(struct led_classdev *led_cdev,
+				    enum led_brightness brightness)
+{
+	struct asus_hid_data *data = container_of(led_cdev, struct asus_hid_data, kbd_led_cdev);
+
+	u8 level = (u8)brightness;
+
+	if (level > A14_EC_MAX_BACKLIGHT)
+		level = A14_EC_MAX_BACKLIGHT;
+
+	u8 buf[A14_EC_REPORT_SIZE] = { A14_EC_REPORT_ID, 0xBA, 0xC5, 0xC4, level };
+
+	asus_send_ec_command(data->hdev, buf);
+	msleep(20);
+	data->saved_brightness = (enum led_brightness)level;
+}
+
+static int asus_raw_event(struct hid_device *hdev, struct hid_report *report,
+			  u8 *raw_data, int size)
+{
+	struct asus_hid_data *data = hid_get_drvdata(hdev);
+	struct input_dev *input_dev = data->hotkey_input_dev;
+
+	if (report->id == A14_EC_REPORT_ID && size >= 2) {
+		u8 usage_code = raw_data[1];
+
+		switch (usage_code) {
+		case A14_EC_EVT_KEY_FN_ESC:
+			input_event(input_dev, EV_KEY, KEY_FN_ESC, 1);
+			input_sync(input_dev);
+			input_event(input_dev, EV_KEY, KEY_FN_ESC, 0);
+			input_sync(input_dev);
+			return 1;
+
+		/* FN + F1, F2 and F3 are not managed by EC*/
+
+		case A14_EC_EVT_KEY_FN_F4:
+			if (size >= 3) {
+				u8 current_level = data->saved_brightness;
+				u8 max_level = A14_EC_MAX_BACKLIGHT;
+				u8 next_level = (current_level + 1) % (max_level + 1);
+
+				asus_kbd_set_brightness(&data->kbd_led_cdev,
+							(enum led_brightness)next_level);
+				if (next_level > current_level ||
+				    (current_level == max_level && next_level == 0)) {
+					if (next_level == 0) {
+						input_event(input_dev, EV_KEY,
+							    KEY_KBDILLUMDOWN, 1);
+						input_sync(input_dev);
+						input_event(input_dev, EV_KEY,
+							    KEY_KBDILLUMDOWN, 0);
+						input_sync(input_dev);
+						input_event(input_dev, EV_KEY,
+							    KEY_KBDILLUMDOWN, 1);
+						input_sync(input_dev);
+						input_event(input_dev, EV_KEY,
+							    KEY_KBDILLUMDOWN, 0);
+						input_sync(input_dev);
+						input_event(input_dev, EV_KEY,
+							    KEY_KBDILLUMDOWN, 1);
+						input_sync(input_dev);
+						input_event(input_dev, EV_KEY,
+							    KEY_KBDILLUMDOWN, 0);
+						input_sync(input_dev);
+					} else {
+						input_event(input_dev, EV_KEY,
+							    KEY_KBDILLUMUP, 1);
+						input_sync(input_dev);
+						input_event(input_dev, EV_KEY,
+							    KEY_KBDILLUMUP, 0);
+						input_sync(input_dev);
+					}
+				} else if (next_level < current_level) {
+					input_event(input_dev, EV_KEY,
+						    KEY_KBDILLUMDOWN, 1);
+					input_sync(input_dev);
+					input_event(input_dev, EV_KEY,
+						    KEY_KBDILLUMDOWN, 0);
+					input_sync(input_dev);
+					input_event(input_dev, EV_KEY,
+						    KEY_KBDILLUMDOWN, 1);
+					input_sync(input_dev);
+					input_event(input_dev, EV_KEY,
+						    KEY_KBDILLUMDOWN, 0);
+					input_sync(input_dev);
+					input_event(input_dev, EV_KEY,
+						    KEY_KBDILLUMDOWN, 1);
+					input_sync(input_dev);
+					input_event(input_dev, EV_KEY,
+						    KEY_KBDILLUMDOWN, 0);
+					input_sync(input_dev);
+				}
+			}
+			return 1;
+		case A14_EC_EVT_KEY_FN_F5:
+			input_event(input_dev, EV_KEY, KEY_BRIGHTNESSDOWN, 1);
+			input_sync(input_dev);
+			input_event(input_dev, EV_KEY, KEY_BRIGHTNESSDOWN, 0);
+			input_sync(input_dev);
+			return 1;
+		case A14_EC_EVT_KEY_FN_F6:
+			input_event(input_dev, EV_KEY, KEY_BRIGHTNESSUP, 1);
+			input_sync(input_dev);
+			input_event(input_dev, EV_KEY, KEY_BRIGHTNESSUP, 0);
+			input_sync(input_dev);
+			return 1;
+
+		/* FN + F7 is not managed by the EC*/
+
+		case A14_EC_EVT_KEY_FN_F8:
+			input_event(input_dev, EV_KEY, KEY_EMOJI_PICKER, 1);
+			input_sync(input_dev);
+			input_event(input_dev, EV_KEY, KEY_EMOJI_PICKER, 0);
+			input_sync(input_dev);
+			return 1;
+		case A14_EC_EVT_KEY_FN_F9:
+			input_event(input_dev, EV_KEY, KEY_MICMUTE, 1);
+			input_sync(input_dev);
+			input_event(input_dev, EV_KEY, KEY_MICMUTE, 0);
+			input_sync(input_dev);
+			return 1;
+		case A14_EC_EVT_KEY_FN_F10:
+			input_event(input_dev, EV_KEY, KEY_CAMERA_ACCESS_TOGGLE, 1);
+			input_sync(input_dev);
+			input_event(input_dev, EV_KEY, KEY_CAMERA_ACCESS_TOGGLE, 0);
+			input_sync(input_dev);
+			return 1;
+		case A14_EC_EVT_KEY_FN_F11:
+			input_event(input_dev, EV_KEY, KEY_TOUCHPAD_TOGGLE, 1);
+			input_sync(input_dev);
+			input_event(input_dev, EV_KEY, KEY_TOUCHPAD_TOGGLE, 0);
+			input_sync(input_dev);
+			return 1;
+		case A14_EC_EVT_KEY_FN_F12:
+			input_event(input_dev, EV_KEY, KEY_PROG1, 1);
+			input_sync(input_dev);
+			input_event(input_dev, EV_KEY, KEY_PROG1, 0);
+			input_sync(input_dev);
+			return 1;
+		case A14_EC_EVT_KEY_FN_F:
+			input_event(input_dev, EV_KEY, KEY_PERFORMANCE, 1);
+			input_sync(input_dev);
+			input_event(input_dev, EV_KEY, KEY_PERFORMANCE, 0);
+			input_sync(input_dev);
+			return 1;
+		default:
+			return 0;
+		}
+	}
+	return 0;
+}
+
+static int asus_hid_suspend(struct hid_device *hdev, pm_message_t message)
+{
+	struct asus_hid_data *data = hid_get_drvdata(hdev);
+
+	if (message.event == PM_EVENT_SUSPEND || message.event == PM_EVENT_HIBERNATE) {
+		asus_kbd_set_brightness(&data->kbd_led_cdev, LED_OFF);
+		return 0;
+	}
+
+	dev_dbg(&hdev->dev, "Runtime suspend: turning off keyboard backlight\n");
+	asus_kbd_set_brightness(&data->kbd_led_cdev, LED_OFF);
+	return 0;
+}
+
+
+static int asus_hid_resume(struct hid_device *hdev)
+{
+	struct asus_hid_data *data = hid_get_drvdata(hdev);
+	int ret;
+	int retry_count;
+
+	msleep(40);
+
+	dev_dbg(&hdev->dev, "Re-initialising EC backlight communication\n");
+	retry_count = 0;
+	do {
+		ret = asus_kbd_led_init(hdev);
+		if (ret >= 0) {
+			dev_dbg(&hdev->dev,
+				"EC init successful on attempt %d\n",
+				retry_count + 1);
+			break;
+		}
+		retry_count++;
+		dev_warn(&hdev->dev,
+			 "EC init attempt %d failed: %d, retrying...\n",
+			 retry_count, ret);
+		msleep(300 * retry_count);
+	} while (retry_count < 5);
+
+	if (ret < 0) {
+		dev_err(&hdev->dev,
+			"EC init on resume failed after %d attempts: %d\n",
+			retry_count, ret);
+		dev_err(&hdev->dev,
+			"Keyboard backlight may not work; try reloading the driver\n");
+	} else {
+		dev_dbg(&hdev->dev, "EC backlight communication restored\n");
+	}
+
+	asus_kbd_set_brightness(&data->kbd_led_cdev, data->saved_brightness);
+
+	dev_info(&hdev->dev, "Resume complete\n");
+	return 0;
+}
+
+static const struct hid_device_id asus_hid_devices[] = {
+	/* Tested on ASUS Zenbook A14 (UX3407QA) only. */
+	{ HID_DEVICE(0x18, 0x00, ASUS_VENDOR_ID, ASUS_PRODUCT_ID) },
+	{ } /* Terminating entry */
+};
+MODULE_DEVICE_TABLE(hid, asus_hid_devices);
+
+static int asus_hid_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	int ret;
+	struct asus_hid_data *data;
+
+	data = devm_kzalloc(&hdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	data->hdev = hdev;
+	hid_set_drvdata(hdev, data);
+	asus_data = data;
+	data->saved_brightness = A14_EC_MAX_BACKLIGHT;
+	ret = hid_parse(hdev);
+	if (ret)
+		return ret;
+	ret = hid_hw_start(hdev, HID_INPUT_REPORT | HID_OUTPUT_REPORT | HID_FEATURE_REPORT);
+	if (ret)
+		return ret;
+	data->hotkey_input_dev = input_allocate_device();
+	if (!data->hotkey_input_dev) {
+		dev_err(&hdev->dev, "Failed to allocate hotkey input device\n");
+		hid_hw_stop(hdev); return -ENOMEM;
+	}
+	data->hotkey_input_dev->name = "ASUS EC I2C HID hotkeys";
+	data->hotkey_input_dev->phys = "i2c-hid/input1/hotkeys";
+	data->hotkey_input_dev->id.bustype = hdev->bus;
+	data->hotkey_input_dev->id.vendor = hdev->vendor;
+	data->hotkey_input_dev->id.product = hdev->product;
+	data->hotkey_input_dev->dev.parent = &hdev->dev;
+	set_bit(EV_KEY, data->hotkey_input_dev->evbit);
+	set_bit(KEY_FN_ESC, data->hotkey_input_dev->keybit);
+	set_bit(KEY_KBDILLUMUP, data->hotkey_input_dev->keybit);
+	set_bit(KEY_KBDILLUMDOWN, data->hotkey_input_dev->keybit);
+	set_bit(KEY_BRIGHTNESSDOWN, data->hotkey_input_dev->keybit);
+	set_bit(KEY_BRIGHTNESSUP, data->hotkey_input_dev->keybit);
+	set_bit(KEY_SWITCHVIDEOMODE, data->hotkey_input_dev->keybit);
+	set_bit(KEY_EMOJI_PICKER, data->hotkey_input_dev->keybit);
+	set_bit(KEY_MICMUTE, data->hotkey_input_dev->keybit);
+	set_bit(KEY_CAMERA_ACCESS_TOGGLE, data->hotkey_input_dev->keybit);
+	set_bit(KEY_TOUCHPAD_TOGGLE, data->hotkey_input_dev->keybit);
+	set_bit(KEY_PROG1, data->hotkey_input_dev->keybit);
+	set_bit(KEY_PERFORMANCE, data->hotkey_input_dev->keybit);
+
+	ret = input_register_device(data->hotkey_input_dev);
+	if (ret) {
+		dev_err(&hdev->dev, "Failed to register hotkey input device\n");
+		input_free_device(data->hotkey_input_dev); hid_hw_stop(hdev);
+		return ret;
+	}
+	asus_kbd_led_init(hdev);
+	data->kbd_led_cdev.name = "asus::kbd_backlight";
+	data->kbd_led_cdev.brightness_set = asus_kbd_set_brightness;
+	data->kbd_led_cdev.max_brightness = A14_EC_MAX_BACKLIGHT;
+	ret = led_classdev_register(&hdev->dev, &data->kbd_led_cdev);
+	if (ret) {
+		input_unregister_device(data->hotkey_input_dev);
+		hid_hw_stop(hdev);
+		return ret;
+	}
+	dev_info(&hdev->dev,
+		 "ASUS EC HID driver for Zenbook A14 loaded for 0x%04x:0x%04x\n",
+		 ASUS_VENDOR_ID, ASUS_PRODUCT_ID);
+	return 0;
+}
+static void asus_hid_remove(struct hid_device *hdev)
+{
+	struct asus_hid_data *data = hid_get_drvdata(hdev);
+
+	led_classdev_unregister(&data->kbd_led_cdev);
+	input_unregister_device(data->hotkey_input_dev);
+	hid_hw_stop(hdev);
+	asus_data = NULL;
+}
+static struct hid_driver hid_asus_ec_driver = {
+	.name       = "hid-asus-ec",
+	.id_table   = asus_hid_devices,
+	.probe      = asus_hid_probe,
+	.remove     = asus_hid_remove,
+	.raw_event  = asus_raw_event,
+	.suspend    = asus_hid_suspend,
+	.resume     = asus_hid_resume,
+};
+module_hid_driver(hid_asus_ec_driver);
+MODULE_AUTHOR("Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>");
+MODULE_DESCRIPTION("ASUS EC HID driver for Zenbook A14 (UX3407QA)");
+MODULE_LICENSE("GPL");

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251221-add-support-for-the-asus-hid-ec-a60b9a2d74b3

Best regards,
-- 
Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>



