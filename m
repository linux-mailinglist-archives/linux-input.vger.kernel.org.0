Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF2FE370FE4
	for <lists+linux-input@lfdr.de>; Mon,  3 May 2021 01:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbhEBXjF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 May 2021 19:39:05 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:55094 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232367AbhEBXjD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 2 May 2021 19:39:03 -0400
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id 485CCF405D7; Mon,  3 May 2021 01:28:57 +0200 (CEST)
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     linux-input@vger.kernel.org
Cc:     Ash Logan <ash@heyquark.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Subject: [PATCH 1/4] HID: wiiu-drc: Add a driver for this gamepad
Date:   Mon,  3 May 2021 01:28:32 +0200
Message-Id: <20210502232836.26134-2-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210502232836.26134-1-linkmauve@linkmauve.fr>
References: <20210502232836.26134-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Ash Logan <ash@heyquark.com>

This driver is for the DRC (wireless gamepad) when plugged to the DRH of
the Wii U, a chip exposing it as a USB device.

This first patch exposes the buttons and sticks of this device, so that
it can act as a plain game controller.

Signed-off-by: Ash Logan <ash@heyquark.com>
Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 drivers/hid/Kconfig        |   7 +
 drivers/hid/Makefile       |   1 +
 drivers/hid/hid-ids.h      |   1 +
 drivers/hid/hid-quirks.c   |   3 +
 drivers/hid/hid-wiiu-drc.c | 270 +++++++++++++++++++++++++++++++++++++
 5 files changed, 282 insertions(+)
 create mode 100644 drivers/hid/hid-wiiu-drc.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 4bf263c2d61a..01116c315459 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1105,6 +1105,13 @@ config HID_WACOM
 	  To compile this driver as a module, choose M here: the
 	  module will be called wacom.
 
+config HID_WIIU_DRC
+	tristate "Nintendo Wii U gamepad over internal DRH"
+	depends on HID
+	help
+	  Support for the Wii U gamepad, when connected with the Wii U’s
+	  internal DRH chip.
+
 config HID_WIIMOTE
 	tristate "Nintendo Wii / Wii U peripherals"
 	depends on HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 193431ec4db8..8fcaaeae4d65 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -134,6 +134,7 @@ wacom-objs			:= wacom_wac.o wacom_sys.o
 obj-$(CONFIG_HID_WACOM)		+= wacom.o
 obj-$(CONFIG_HID_WALTOP)	+= hid-waltop.o
 obj-$(CONFIG_HID_WIIMOTE)	+= hid-wiimote.o
+obj-$(CONFIG_HID_WIIU_DRC)	+= hid-wiiu-drc.o
 obj-$(CONFIG_HID_SENSOR_HUB)	+= hid-sensor-hub.o
 obj-$(CONFIG_HID_SENSOR_CUSTOM_SENSOR)	+= hid-sensor-custom.o
 
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 84b8da3e7d09..fbac0dd021f1 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -916,6 +916,7 @@
 #define USB_VENDOR_ID_NINTENDO		0x057e
 #define USB_DEVICE_ID_NINTENDO_WIIMOTE	0x0306
 #define USB_DEVICE_ID_NINTENDO_WIIMOTE2	0x0330
+#define USB_DEVICE_ID_NINTENDO_WIIU_DRH	0x0341
 
 #define USB_VENDOR_ID_NOVATEK		0x0603
 #define USB_DEVICE_ID_NOVATEK_PCT	0x0600
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 3dd6f15f2a67..af400177537e 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -513,6 +513,9 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_WIIMOTE) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_WIIMOTE2) },
 #endif
+#if IS_ENABLED(CONFIG_HID_WIIU_DRC)
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_WIIU_DRH) },
+#endif
 #if IS_ENABLED(CONFIG_HID_NTI)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_NTI, USB_DEVICE_ID_USB_SUN) },
 #endif
diff --git a/drivers/hid/hid-wiiu-drc.c b/drivers/hid/hid-wiiu-drc.c
new file mode 100644
index 000000000000..018cbdb53a2c
--- /dev/null
+++ b/drivers/hid/hid-wiiu-drc.c
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * HID driver for Nintendo Wii U gamepad, connected via console-internal DRH
+ *
+ * Copyright (C) 2021 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
+ * Copyright (C) 2019 Ash Logan <ash@heyquark.com>
+ * Copyright (C) 2013 Mema Hacking
+ *
+ * Based on the excellent work at http://libdrc.org/docs/re/sc-input.html and
+ * https://bitbucket.org/memahaxx/libdrc/src/master/src/input-receiver.cpp .
+ * libdrc code is licensed under BSD 2-Clause.
+ * Driver based on hid-udraw-ps3.c.
+ */
+
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/module.h>
+#include "hid-ids.h"
+
+#define DEVICE_NAME	"Nintendo Wii U gamepad"
+
+/* Button and stick constants */
+#define VOLUME_MIN	0
+#define VOLUME_MAX	255
+#define NUM_STICK_AXES	4
+#define STICK_MIN	900
+#define STICK_MAX	3200
+
+#define BUTTON_SYNC	BIT(0)
+#define BUTTON_HOME	BIT(1)
+#define BUTTON_MINUS	BIT(2)
+#define BUTTON_PLUS	BIT(3)
+#define BUTTON_R	BIT(4)
+#define BUTTON_L	BIT(5)
+#define BUTTON_ZR	BIT(6)
+#define BUTTON_ZL	BIT(7)
+#define BUTTON_DOWN	BIT(8)
+#define BUTTON_UP	BIT(9)
+#define BUTTON_RIGHT	BIT(10)
+#define BUTTON_LEFT	BIT(11)
+#define BUTTON_Y	BIT(12)
+#define BUTTON_X	BIT(13)
+#define BUTTON_B	BIT(14)
+#define BUTTON_A	BIT(15)
+
+#define BUTTON_TV	BIT(21)
+#define BUTTON_R3	BIT(22)
+#define BUTTON_L3	BIT(23)
+
+#define BUTTON_POWER	BIT(25)
+
+/*
+ * The device is setup with multiple input devices:
+ * - A joypad with the buttons and sticks.
+ */
+
+struct drc {
+	struct input_dev *joy_input_dev;
+	struct hid_device *hdev;
+};
+
+static int drc_raw_event(struct hid_device *hdev, struct hid_report *report,
+	 u8 *data, int len)
+{
+	struct drc *drc = hid_get_drvdata(hdev);
+	int i;
+	u32 buttons;
+
+	if (len != 128)
+		return 0;
+
+	buttons = (data[4] << 24) | (data[80] << 16) | (data[2] << 8) | data[3];
+	/* joypad */
+	input_report_key(drc->joy_input_dev, BTN_DPAD_RIGHT, buttons & BUTTON_RIGHT);
+	input_report_key(drc->joy_input_dev, BTN_DPAD_DOWN, buttons & BUTTON_DOWN);
+	input_report_key(drc->joy_input_dev, BTN_DPAD_LEFT, buttons & BUTTON_LEFT);
+	input_report_key(drc->joy_input_dev, BTN_DPAD_UP, buttons & BUTTON_UP);
+
+	input_report_key(drc->joy_input_dev, BTN_EAST, buttons & BUTTON_A);
+	input_report_key(drc->joy_input_dev, BTN_SOUTH, buttons & BUTTON_B);
+	input_report_key(drc->joy_input_dev, BTN_NORTH, buttons & BUTTON_X);
+	input_report_key(drc->joy_input_dev, BTN_WEST, buttons & BUTTON_Y);
+
+	input_report_key(drc->joy_input_dev, BTN_TL, buttons & BUTTON_L);
+	input_report_key(drc->joy_input_dev, BTN_TL2, buttons & BUTTON_ZL);
+	input_report_key(drc->joy_input_dev, BTN_TR, buttons & BUTTON_R);
+	input_report_key(drc->joy_input_dev, BTN_TR2, buttons & BUTTON_ZR);
+
+	input_report_key(drc->joy_input_dev, BTN_Z, buttons & BUTTON_TV);
+	input_report_key(drc->joy_input_dev, BTN_THUMBL, buttons & BUTTON_L3);
+	input_report_key(drc->joy_input_dev, BTN_THUMBR, buttons & BUTTON_R3);
+
+	input_report_key(drc->joy_input_dev, BTN_SELECT, buttons & BUTTON_MINUS);
+	input_report_key(drc->joy_input_dev, BTN_START, buttons & BUTTON_PLUS);
+	input_report_key(drc->joy_input_dev, BTN_MODE, buttons & BUTTON_HOME);
+
+	input_report_key(drc->joy_input_dev, BTN_DEAD, buttons & BUTTON_POWER);
+
+	for (i = 0; i < NUM_STICK_AXES; i++) {
+		s16 val = (data[7 + 2*i] << 8) | data[6 + 2*i];
+		/* clamp */
+		if (val < STICK_MIN)
+			val = STICK_MIN;
+		if (val > STICK_MAX)
+			val = STICK_MAX;
+
+		switch (i) {
+		case 0:
+			input_report_abs(drc->joy_input_dev, ABS_X, val);
+			break;
+		case 1:
+			input_report_abs(drc->joy_input_dev, ABS_Y, val);
+			break;
+		case 2:
+			input_report_abs(drc->joy_input_dev, ABS_RX, val);
+			break;
+		case 3:
+			input_report_abs(drc->joy_input_dev, ABS_RY, val);
+			break;
+		default:
+			break;
+		}
+	}
+
+	input_report_abs(drc->joy_input_dev, ABS_VOLUME, data[14]);
+
+	input_sync(drc->joy_input_dev);
+
+	/* let hidraw and hiddev handle the report */
+	return 0;
+}
+
+static int drc_open(struct input_dev *dev)
+{
+	struct drc *drc = input_get_drvdata(dev);
+
+	return hid_hw_open(drc->hdev);
+}
+
+static void drc_close(struct input_dev *dev)
+{
+	struct drc *drc = input_get_drvdata(dev);
+
+	hid_hw_close(drc->hdev);
+}
+
+static struct input_dev *allocate_and_setup(struct hid_device *hdev,
+		const char *name)
+{
+	struct input_dev *input_dev;
+
+	input_dev = devm_input_allocate_device(&hdev->dev);
+	if (!input_dev)
+		return NULL;
+
+	input_dev->name = name;
+	input_dev->phys = hdev->phys;
+	input_dev->dev.parent = &hdev->dev;
+	input_dev->open = drc_open;
+	input_dev->close = drc_close;
+	input_dev->uniq = hdev->uniq;
+	input_dev->id.bustype = hdev->bus;
+	input_dev->id.vendor  = hdev->vendor;
+	input_dev->id.product = hdev->product;
+	input_dev->id.version = hdev->version;
+	input_set_drvdata(input_dev, hid_get_drvdata(hdev));
+
+	return input_dev;
+}
+
+static bool drc_setup_joypad(struct drc *drc,
+		struct hid_device *hdev)
+{
+	struct input_dev *input_dev;
+
+	input_dev = allocate_and_setup(hdev, DEVICE_NAME " Joypad");
+	if (!input_dev)
+		return false;
+
+	input_dev->evbit[0] = BIT(EV_KEY) | BIT(EV_ABS);
+
+	set_bit(BTN_DPAD_RIGHT, input_dev->keybit);
+	set_bit(BTN_DPAD_DOWN, input_dev->keybit);
+	set_bit(BTN_DPAD_LEFT, input_dev->keybit);
+	set_bit(BTN_DPAD_UP, input_dev->keybit);
+	set_bit(BTN_EAST, input_dev->keybit);
+	set_bit(BTN_SOUTH, input_dev->keybit);
+	set_bit(BTN_NORTH, input_dev->keybit);
+	set_bit(BTN_WEST, input_dev->keybit);
+	set_bit(BTN_TL, input_dev->keybit);
+	set_bit(BTN_TL2, input_dev->keybit);
+	set_bit(BTN_TR, input_dev->keybit);
+	set_bit(BTN_TR2, input_dev->keybit);
+	set_bit(BTN_THUMBL, input_dev->keybit);
+	set_bit(BTN_THUMBR, input_dev->keybit);
+	set_bit(BTN_SELECT, input_dev->keybit);
+	set_bit(BTN_START, input_dev->keybit);
+	set_bit(BTN_MODE, input_dev->keybit);
+
+	/* These two buttons are actually TV control and Power. */
+	set_bit(BTN_Z, input_dev->keybit);
+	set_bit(BTN_DEAD, input_dev->keybit);
+
+	input_set_abs_params(input_dev, ABS_X, STICK_MIN, STICK_MAX, 0, 0);
+	input_set_abs_params(input_dev, ABS_Y, STICK_MIN, STICK_MAX, 0, 0);
+	input_set_abs_params(input_dev, ABS_RX, STICK_MIN, STICK_MAX, 0, 0);
+	input_set_abs_params(input_dev, ABS_RY, STICK_MIN, STICK_MAX, 0, 0);
+	input_set_abs_params(input_dev, ABS_VOLUME, VOLUME_MIN, VOLUME_MAX, 0, 0);
+
+	drc->joy_input_dev = input_dev;
+
+	return true;
+}
+
+static int drc_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	struct drc *drc;
+	int ret;
+
+	drc = devm_kzalloc(&hdev->dev, sizeof(struct drc), GFP_KERNEL);
+	if (!drc)
+		return -ENOMEM;
+
+	drc->hdev = hdev;
+
+	hid_set_drvdata(hdev, drc);
+
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "parse failed\n");
+		return ret;
+	}
+
+	if (!drc_setup_joypad(drc, hdev)) {
+		hid_err(hdev, "could not allocate interface\n");
+		return -ENOMEM;
+	}
+
+	ret = input_register_device(drc->joy_input_dev);
+	if (ret) {
+		hid_err(hdev, "failed to register interface\n");
+		return ret;
+	}
+
+	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW | HID_CONNECT_DRIVER);
+	if (ret) {
+		hid_err(hdev, "hw start failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct hid_device_id drc_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_WIIU_DRH) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, drc_devices);
+
+static struct hid_driver drc_driver = {
+	.name = "hid-wiiu-drc",
+	.id_table = drc_devices,
+	.raw_event = drc_raw_event,
+	.probe = drc_probe,
+};
+module_hid_driver(drc_driver);
+
+MODULE_AUTHOR("Ash Logan <ash@heyquark.com>");
+MODULE_DESCRIPTION("Nintendo Wii U gamepad driver");
+MODULE_LICENSE("GPL");
-- 
2.31.1

