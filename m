Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41539433454
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 13:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235408AbhJSLGn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 07:06:43 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:52278 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235379AbhJSLGl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 07:06:41 -0400
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id 68B02F40C34; Tue, 19 Oct 2021 13:04:23 +0200 (CEST)
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Ash Logan <ash@heyquark.com>, linux-input@vger.kernel.org,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Subject: [PATCH v4 2/5] HID: nintendo: drc: add support for the Wii U gamepad
Date:   Tue, 19 Oct 2021 13:04:15 +0200
Message-Id: <20211019110418.26874-3-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211019110418.26874-1-linkmauve@linkmauve.fr>
References: <20210519085924.1636-1-linkmauve@linkmauve.fr>
 <20211019110418.26874-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Ash Logan <ash@heyquark.com>

This driver is for the DRC (gamepad) of the Wii U when wirelessly
connected to the DRH of the console, an internal chip exposing it as a
USB device.

This first patch exposes the buttons and sticks of this device, so that
it can act as a plain game controller.

The report format has been described by the libdrc folks at:
https://libdrc.org/docs/re/sc-input.html

Signed-off-by: Ash Logan <ash@heyquark.com>
Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 drivers/hid/Kconfig             |   7 +
 drivers/hid/Makefile            |   1 +
 drivers/hid/hid-ids.h           |   1 +
 drivers/hid/hid-nintendo-wiiu.c | 267 ++++++++++++++++++++++++++++++++
 drivers/hid/hid-nintendo.c      |  17 +-
 drivers/hid/hid-nintendo.h      |   6 +
 drivers/hid/hid-quirks.c        |   3 +
 7 files changed, 300 insertions(+), 2 deletions(-)
 create mode 100644 drivers/hid/hid-nintendo-wiiu.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 79beccefd431..9e75593e19cd 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -749,6 +749,13 @@ config NINTENDO_FF
 	controller. For the pro controller, both rumble motors can be controlled
 	individually.
 
+config HID_NINTENDO_WIIU
+	tristate "Nintendo Wii U gamepad (DRC) over internal DRH"
+	depends on HID_NINTENDO
+	help
+	  Support for the Wii U gamepad, when connected with the Wii U’s
+	  internal DRH chip.
+
 config HID_NINTENDO_SWITCH
 	tristate "Nintendo Wii U gamepad (DRC) over internal DRH"
 	depends on HID_NINTENDO
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index a0a9ee182ef2..f9851a7acea9 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -79,6 +79,7 @@ obj-$(CONFIG_HID_MICROSOFT)	+= hid-microsoft.o
 obj-$(CONFIG_HID_MONTEREY)	+= hid-monterey.o
 obj-$(CONFIG_HID_MULTITOUCH)	+= hid-multitouch.o
 obj-$(CONFIG_HID_NINTENDO)	+= hid-nintendo.o
+obj-$(CONFIG_HID_NINTENDO_WIIU)	+= hid-nintendo-wiiu.o
 obj-$(CONFIG_HID_NINTENDO_SWITCH)	+= hid-nintendo-switch.o
 obj-$(CONFIG_HID_NTI)			+= hid-nti.o
 obj-$(CONFIG_HID_NTRIG)		+= hid-ntrig.o
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index dc8f2f402464..30ce4287c48b 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -917,6 +917,7 @@
 #define USB_VENDOR_ID_NINTENDO		0x057e
 #define USB_DEVICE_ID_NINTENDO_WIIMOTE	0x0306
 #define USB_DEVICE_ID_NINTENDO_WIIMOTE2	0x0330
+#define USB_DEVICE_ID_NINTENDO_WIIU_DRH	0x0341
 #define USB_DEVICE_ID_NINTENDO_JOYCONL	0x2006
 #define USB_DEVICE_ID_NINTENDO_JOYCONR	0x2007
 #define USB_DEVICE_ID_NINTENDO_PROCON	0x2009
diff --git a/drivers/hid/hid-nintendo-wiiu.c b/drivers/hid/hid-nintendo-wiiu.c
new file mode 100644
index 000000000000..0b9df62587ed
--- /dev/null
+++ b/drivers/hid/hid-nintendo-wiiu.c
@@ -0,0 +1,267 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * HID driver for Nintendo Wii U gamepad (DRC), connected via console-internal DRH
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
+#include <linux/input.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include "hid-ids.h"
+#include "hid-nintendo.h"
+
+#define DEVICE_NAME	"Nintendo Wii U gamepad (DRC)"
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
+	enum nintendo_driver driver;
+	struct hid_device *hdev;
+	struct input_dev *joy_input_dev;
+};
+
+/*
+ * The format of this report has been reversed by the libdrc project, the
+ * documentation can be found here:
+ * https://libdrc.org/docs/re/sc-input.html
+ *
+ * We receive this report from USB, but it is actually formed on the DRC, the
+ * DRH only retransmits it over USB.
+ */
+int wiiu_hid_event(struct hid_device *hdev, struct hid_report *report,
+		   u8 *data, int len)
+{
+	struct drc *drc = hid_get_drvdata(hdev);
+	int i;
+	u32 buttons;
+
+	if (len != 128)
+		return -EINVAL;
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
+
+		val = clamp(val, (s16)STICK_MIN, (s16)STICK_MAX);
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
+					    const char *name)
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
+			     struct hid_device *hdev)
+{
+	struct input_dev *input_dev;
+
+	input_dev = allocate_and_setup(hdev, DEVICE_NAME " buttons and sticks");
+	if (!input_dev)
+		return false;
+
+	drc->joy_input_dev = input_dev;
+
+	input_set_capability(input_dev, EV_KEY, BTN_DPAD_RIGHT);
+	input_set_capability(input_dev, EV_KEY, BTN_DPAD_DOWN);
+	input_set_capability(input_dev, EV_KEY, BTN_DPAD_LEFT);
+	input_set_capability(input_dev, EV_KEY, BTN_DPAD_UP);
+	input_set_capability(input_dev, EV_KEY, BTN_EAST);
+	input_set_capability(input_dev, EV_KEY, BTN_SOUTH);
+	input_set_capability(input_dev, EV_KEY, BTN_NORTH);
+	input_set_capability(input_dev, EV_KEY, BTN_WEST);
+	input_set_capability(input_dev, EV_KEY, BTN_TL);
+	input_set_capability(input_dev, EV_KEY, BTN_TL2);
+	input_set_capability(input_dev, EV_KEY, BTN_TR);
+	input_set_capability(input_dev, EV_KEY, BTN_TR2);
+	input_set_capability(input_dev, EV_KEY, BTN_THUMBL);
+	input_set_capability(input_dev, EV_KEY, BTN_THUMBR);
+	input_set_capability(input_dev, EV_KEY, BTN_SELECT);
+	input_set_capability(input_dev, EV_KEY, BTN_START);
+	input_set_capability(input_dev, EV_KEY, BTN_MODE);
+
+	/*
+	 * These two buttons are actually TV Control and Power.
+	 *
+	 * TV Control draws a line at the bottom of the DRC’s screen saying to
+	 * go into System Settings (on the original proprietary OS), while
+	 * Power will shutdown the DRC when held for four seconds, but those
+	 * two are still normal buttons otherwise.
+	 */
+	input_set_capability(input_dev, EV_KEY, BTN_Z);
+	input_set_capability(input_dev, EV_KEY, BTN_DEAD);
+
+	input_set_abs_params(input_dev, ABS_X, STICK_MIN, STICK_MAX, 0, 0);
+	input_set_abs_params(input_dev, ABS_Y, STICK_MIN, STICK_MAX, 0, 0);
+	input_set_abs_params(input_dev, ABS_RX, STICK_MIN, STICK_MAX, 0, 0);
+	input_set_abs_params(input_dev, ABS_RY, STICK_MIN, STICK_MAX, 0, 0);
+	input_set_abs_params(input_dev, ABS_VOLUME, VOLUME_MIN, VOLUME_MAX, 0, 0);
+
+	return true;
+}
+
+int wiiu_hid_probe(struct hid_device *hdev,
+		   const struct hid_device_id *id)
+{
+	struct drc *drc;
+	int ret;
+
+	drc = devm_kzalloc(&hdev->dev, sizeof(struct drc), GFP_KERNEL);
+	if (!drc)
+		return -ENOMEM;
+
+	drc->driver = NINTENDO_WIIU;
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
+	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW | HID_CONNECT_DRIVER);
+	if (ret) {
+		hid_err(hdev, "hw start failed\n");
+		return ret;
+	}
+
+	ret = input_register_device(drc->joy_input_dev);
+	if (ret) {
+		hid_err(hdev, "failed to register interface\n");
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 9d67c7b2ac75..83397e387310 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -18,6 +18,10 @@ static int nintendo_hid_event(struct hid_device *hdev,
 {
 	enum nintendo_driver *driver = hid_get_drvdata(hdev);
 
+#ifdef CONFIG_HID_NINTENDO_WIIU
+	if (*driver == NINTENDO_WIIU)
+		return wiiu_hid_event(hdev, report, raw_data, size);
+#endif
 #ifdef CONFIG_HID_NINTENDO_SWITCH
 	if (*driver == NINTENDO_SWITCH)
 		return switch_hid_event(hdev, report, raw_data, size);
@@ -30,10 +34,14 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 {
 	int ret;
 
+#ifdef CONFIG_HID_NINTENDO_WIIU
+	if (id->product == USB_DEVICE_ID_NINTENDO_WIIU_DRH)
+		ret = wiiu_hid_probe(hdev, id);
+#endif
 #ifdef CONFIG_HID_NINTENDO_SWITCH
-	ret = switch_hid_probe(hdev, id);
+	if (id->product != USB_DEVICE_ID_NINTENDO_WIIU_DRH)
+		ret = switch_hid_probe(hdev, id);
 #endif
-
 	return ret;
 }
 
@@ -48,6 +56,11 @@ static void nintendo_hid_remove(struct hid_device *hdev)
 }
 
 static const struct hid_device_id nintendo_hid_devices[] = {
+#ifdef CONFIG_HID_NINTENDO_WIIU
+	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
+			 USB_DEVICE_ID_NINTENDO_WIIU_DRH) },
+#endif
+
 #ifdef CONFIG_HID_NINTENDO_SWITCH
 	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
 			 USB_DEVICE_ID_NINTENDO_PROCON) },
diff --git a/drivers/hid/hid-nintendo.h b/drivers/hid/hid-nintendo.h
index 56bb7e800cc2..eba300ee039e 100644
--- a/drivers/hid/hid-nintendo.h
+++ b/drivers/hid/hid-nintendo.h
@@ -6,9 +6,15 @@
 /* Every HID drvdata supported by this driver MUST start with this
  * enum, so that dispatch can work properly. */
 enum nintendo_driver {
+	NINTENDO_WIIU,
 	NINTENDO_SWITCH,
 };
 
+int wiiu_hid_event(struct hid_device *hdev, struct hid_report *report,
+		   u8 *data, int len);
+int wiiu_hid_probe(struct hid_device *hdev,
+		   const struct hid_device_id *id);
+
 int switch_hid_event(struct hid_device *hdev,
 		     struct hid_report *report, u8 *raw_data, int size);
 int switch_hid_probe(struct hid_device *hdev,
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 2e104682c22b..6b13edfa195d 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -517,6 +517,9 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_WIIMOTE) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_WIIMOTE2) },
 #endif
+#if IS_ENABLED(CONFIG_HID_WIIU_DRC)
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_WIIU_DRH) },
+#endif
 #if IS_ENABLED(CONFIG_HID_NTI)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_NTI, USB_DEVICE_ID_USB_SUN) },
 #endif
-- 
2.33.1

