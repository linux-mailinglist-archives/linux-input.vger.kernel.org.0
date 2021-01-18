Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C1D2F965A
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 00:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730518AbhAQXqF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 18:46:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730846AbhAQXp0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 18:45:26 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D32FC061574
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:44:46 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d4so7658625plh.5
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Dxv9LYIJpadb3FHIKHQYlt8c5Y+UnV/AVz/fA4+7jw=;
        b=b1LLGDbAeUYY3mNALg6eVa+03o4bRx7IkrRbollptRiKIJYJdWCEeXXnTQeljOcYyO
         VlkYo8yrc2Ubnw8o58uo1LH2+d/oeEOLIOs/ObcCmIjeV5oH6VOC+QTAgbbI+6gj9pY8
         90I2DYu1Ta5vyt+3E2FfnCwR9Ooco05Gi9kZ3oDR7QnLcVAG9lwH4NZ3Nx/xgxtM3Gxi
         TYsjIuYhDNuQcATMW8wDdNMfyQF8v1/sHazenFAr5DO30sM/i0R+Ze8jwgoYB89sX4/K
         R969EUTOnQe1e3WFNBuuHGL5LsTylSCfS81y+Emcjqo5DFxCf5X05J/F2a/VJkd2eRrr
         Wwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Dxv9LYIJpadb3FHIKHQYlt8c5Y+UnV/AVz/fA4+7jw=;
        b=FW3bQHX4mEHWLu8HV+9CAZygdMDI5VXNNiXBbiLTZZX4AIPZGfq4sWGiu5h9qB+mDE
         MtEEMEvZqx5CN7A2E4ENISdHjWcuOrSzVT6vvw7ZcGEP/RnPGRjeElDVifnHi+T82f8A
         JTv7s604FsED0diWG7sNezDZ0b/HNEipPsFSZ1bkXRw7n7xF3dspDIilOuAnNpZvde2Z
         in5DfPEin2ITGnnoee9ITV4nLDrjEPoZzHyJRCiNVXJmB8y0ufrBr0DpN4zUy2ZLXdmw
         47Kj4hJFXi4Vlaot0nwiTrPNGXqytV8EdguUqv7CKOwNMi6rt2CV5aP1npZUObb3arNy
         fg0g==
X-Gm-Message-State: AOAM533z1PTOWZKHMQsZqBaeBNB5n/rCq9Rexdp7HZ6xFlsMjF5hjuwg
        X52VnVEsupan9eZJP8EHol3oA+gspau71g==
X-Google-Smtp-Source: ABdhPJw1VJ/Hh0Zaz6St8rFsbSnfsyUKOMVMxoGcE0durVPCPvJEJS+F3DEUyeOZYklQmmBi3Gd+CQ==
X-Received: by 2002:a17:902:8203:b029:dc:3ef7:9321 with SMTP id x3-20020a1709028203b02900dc3ef79321mr23434069pln.39.1610927086202;
        Sun, 17 Jan 2021 15:44:46 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id i2sm14721568pjd.21.2021.01.17.15.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 15:44:45 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v4 01/13] HID: playstation: initial DualSense USB support.
Date:   Sun, 17 Jan 2021 15:44:23 -0800
Message-Id: <20210117234435.180294-2-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117234435.180294-1-roderick@gaikai.com>
References: <20210117234435.180294-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Implement support for PlayStation DualSense gamepad in USB mode.
Support features include buttons and sticks, which adhere to the
Linux gamepad spec.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 MAINTAINERS                   |   6 +
 drivers/hid/Kconfig           |   8 +
 drivers/hid/Makefile          |   1 +
 drivers/hid/hid-ids.h         |   1 +
 drivers/hid/hid-playstation.c | 328 ++++++++++++++++++++++++++++++++++
 5 files changed, 344 insertions(+)
 create mode 100644 drivers/hid/hid-playstation.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f81d598a8556..0ecae30af074 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7918,6 +7918,12 @@ F:	drivers/hid/
 F:	include/linux/hid*
 F:	include/uapi/linux/hid*
 
+HID PLAYSTATION DRIVER
+M:	Roderick Colenbrander <roderick.colenbrander@sony.com>
+L:	linux-input@vger.kernel.org
+S:	Supported
+F:	drivers/hid/hid-playstation.c
+
 HID SENSOR HUB DRIVERS
 M:	Jiri Kosina <jikos@kernel.org>
 M:	Jonathan Cameron <jic23@kernel.org>
diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 7bdda1b5b221..0aefbb81ba43 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -853,6 +853,14 @@ config HID_PLANTRONICS
 
 	  Say M here if you may ever plug in a Plantronics USB audio device.
 
+config HID_PLAYSTATION
+	tristate "PlayStation HID Driver"
+	depends on HID
+	help
+	  Provides support for Sony PS5 controllers including support for
+	  its special functionalities e.g. touchpad, lights and motion
+	  sensors.
+
 config HID_PRIMAX
 	tristate "Primax non-fully HID-compliant devices"
 	depends on HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 014d21fe7dac..3cdbfb60ca57 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -94,6 +94,7 @@ hid-picolcd-$(CONFIG_HID_PICOLCD_CIR)	+= hid-picolcd_cir.o
 hid-picolcd-$(CONFIG_DEBUG_FS)		+= hid-picolcd_debugfs.o
 
 obj-$(CONFIG_HID_PLANTRONICS)	+= hid-plantronics.o
+obj-$(CONFIG_HID_PLAYSTATION)	+= hid-playstation.o
 obj-$(CONFIG_HID_PRIMAX)	+= hid-primax.o
 obj-$(CONFIG_HID_REDRAGON)	+= hid-redragon.o
 obj-$(CONFIG_HID_RETRODE)	+= hid-retrode.o
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 4c5f23640f9c..70c51ec6395c 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1072,6 +1072,7 @@
 #define USB_DEVICE_ID_SONY_PS4_CONTROLLER	0x05c4
 #define USB_DEVICE_ID_SONY_PS4_CONTROLLER_2	0x09cc
 #define USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE	0x0ba0
+#define USB_DEVICE_ID_SONY_PS5_CONTROLLER	0x0ce6
 #define USB_DEVICE_ID_SONY_MOTION_CONTROLLER	0x03d5
 #define USB_DEVICE_ID_SONY_NAVIGATION_CONTROLLER	0x042f
 #define USB_DEVICE_ID_SONY_BUZZ_CONTROLLER		0x0002
diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
new file mode 100644
index 000000000000..46d5f5b3b0dd
--- /dev/null
+++ b/drivers/hid/hid-playstation.c
@@ -0,0 +1,328 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  HID driver for Sony DualSense(TM) controller.
+ *
+ *  Copyright (c) 2020 Sony Interactive Entertainment
+ */
+
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/input/mt.h>
+#include <linux/module.h>
+
+#include <asm/unaligned.h>
+
+#include "hid-ids.h"
+
+#define HID_PLAYSTATION_VERSION_PATCH 0x8000
+
+/* Base class for playstation devices. */
+struct ps_device {
+	struct hid_device *hdev;
+
+	int (*parse_report)(struct ps_device *dev, struct hid_report *report, u8 *data, int size);
+};
+
+#define DS_INPUT_REPORT_USB			0x01
+#define DS_INPUT_REPORT_USB_SIZE		64
+
+/* Button masks for DualSense input report. */
+#define DS_BUTTONS0_HAT_SWITCH	GENMASK(3, 0)
+#define DS_BUTTONS0_SQUARE	BIT(4)
+#define DS_BUTTONS0_CROSS	BIT(5)
+#define DS_BUTTONS0_CIRCLE	BIT(6)
+#define DS_BUTTONS0_TRIANGLE	BIT(7)
+#define DS_BUTTONS1_L1		BIT(0)
+#define DS_BUTTONS1_R1		BIT(1)
+#define DS_BUTTONS1_L2		BIT(2)
+#define DS_BUTTONS1_R2		BIT(3)
+#define DS_BUTTONS1_CREATE	BIT(4)
+#define DS_BUTTONS1_OPTIONS	BIT(5)
+#define DS_BUTTONS1_L3		BIT(6)
+#define DS_BUTTONS1_R3		BIT(7)
+#define DS_BUTTONS2_PS_HOME	BIT(0)
+#define DS_BUTTONS2_TOUCHPAD	BIT(1)
+
+struct dualsense {
+	struct ps_device base;
+	struct input_dev *gamepad;
+};
+
+struct dualsense_touch_point {
+	uint8_t contact;
+	uint8_t x_lo;
+	uint8_t x_hi:4, y_lo:4;
+	uint8_t y_hi;
+} __packed;
+static_assert(sizeof(struct dualsense_touch_point) == 4);
+
+/* Main DualSense input report excluding any BT/USB specific headers. */
+struct dualsense_input_report {
+	uint8_t x, y;
+	uint8_t rx, ry;
+	uint8_t z, rz;
+	uint8_t seq_number;
+	uint8_t buttons[4];
+	uint8_t reserved[4];
+
+	/* Motion sensors */
+	__le16 gyro[3]; /* x, y, z */
+	__le16 accel[3]; /* x, y, z */
+	__le32 sensor_timestamp;
+	uint8_t reserved2;
+
+	/* Touchpad */
+	struct dualsense_touch_point points[2];
+
+	uint8_t reserved3[12];
+	uint8_t status;
+	uint8_t reserved4[10];
+} __packed;
+/* Common input report size shared equals the size of the USB report minus 1 byte for ReportID. */
+static_assert(sizeof(struct dualsense_input_report) == DS_INPUT_REPORT_USB_SIZE - 1);
+
+/*
+ * Common gamepad buttons across DualShock 3 / 4 and DualSense.
+ * Note: for device with a touchpad, touchpad button is not included
+ *        as it will be part of the touchpad device.
+ */
+static const int ps_gamepad_buttons[] = {
+	BTN_WEST, /* Square */
+	BTN_NORTH, /* Triangle */
+	BTN_EAST, /* Circle */
+	BTN_SOUTH, /* Cross */
+	BTN_TL, /* L1 */
+	BTN_TR, /* R1 */
+	BTN_TL2, /* L2 */
+	BTN_TR2, /* R2 */
+	BTN_SELECT, /* Create (PS5) / Share (PS4) */
+	BTN_START, /* Option */
+	BTN_THUMBL, /* L3 */
+	BTN_THUMBR, /* R3 */
+	BTN_MODE, /* PS Home */
+};
+
+static const struct {int x; int y; } ps_gamepad_hat_mapping[] = {
+	{0, -1}, {1, -1}, {1, 0}, {1, 1}, {0, 1}, {-1, 1}, {-1, 0}, {-1, -1},
+	{0, 0},
+};
+
+static struct input_dev *ps_allocate_input_dev(struct hid_device *hdev, const char *name_suffix)
+{
+	struct input_dev *input_dev;
+
+	input_dev = devm_input_allocate_device(&hdev->dev);
+	if (!input_dev)
+		return ERR_PTR(-ENOMEM);
+
+	input_dev->id.bustype = hdev->bus;
+	input_dev->id.vendor = hdev->vendor;
+	input_dev->id.product = hdev->product;
+	input_dev->id.version = hdev->version;
+	input_dev->uniq = hdev->uniq;
+
+	if (name_suffix) {
+		input_dev->name = devm_kasprintf(&hdev->dev, GFP_KERNEL, "%s %s", hdev->name,
+				name_suffix);
+		if (!input_dev->name)
+			return ERR_PTR(-ENOMEM);
+	} else {
+		input_dev->name = hdev->name;
+	}
+
+	input_set_drvdata(input_dev, hdev);
+
+	return input_dev;
+}
+
+static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
+{
+	struct input_dev *gamepad;
+	unsigned int i;
+	int ret;
+
+	gamepad = ps_allocate_input_dev(hdev, NULL);
+	if (IS_ERR(gamepad))
+		return ERR_CAST(gamepad);
+
+	input_set_abs_params(gamepad, ABS_X, 0, 255, 0, 0);
+	input_set_abs_params(gamepad, ABS_Y, 0, 255, 0, 0);
+	input_set_abs_params(gamepad, ABS_Z, 0, 255, 0, 0);
+	input_set_abs_params(gamepad, ABS_RX, 0, 255, 0, 0);
+	input_set_abs_params(gamepad, ABS_RY, 0, 255, 0, 0);
+	input_set_abs_params(gamepad, ABS_RZ, 0, 255, 0, 0);
+
+	input_set_abs_params(gamepad, ABS_HAT0X, -1, 1, 0, 0);
+	input_set_abs_params(gamepad, ABS_HAT0Y, -1, 1, 0, 0);
+
+	for (i = 0; i < ARRAY_SIZE(ps_gamepad_buttons); i++)
+		input_set_capability(gamepad, EV_KEY, ps_gamepad_buttons[i]);
+
+	ret = input_register_device(gamepad);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return gamepad;
+}
+
+static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *report,
+		u8 *data, int size)
+{
+	struct hid_device *hdev = ps_dev->hdev;
+	struct dualsense *ds = container_of(ps_dev, struct dualsense, base);
+	struct dualsense_input_report *ds_report;
+	uint8_t value;
+
+	/*
+	 * DualSense in USB uses the full HID report for reportID 1, but
+	 * Bluetooth uses a minimal HID report for reportID 1 and reports
+	 * the full report using reportID 49.
+	 */
+	if (hdev->bus == BUS_USB && report->id == DS_INPUT_REPORT_USB &&
+			size == DS_INPUT_REPORT_USB_SIZE) {
+		ds_report = (struct dualsense_input_report *)&data[1];
+	} else {
+		hid_err(hdev, "Unhandled reportID=%d\n", report->id);
+		return -1;
+	}
+
+	input_report_abs(ds->gamepad, ABS_X,  ds_report->x);
+	input_report_abs(ds->gamepad, ABS_Y,  ds_report->y);
+	input_report_abs(ds->gamepad, ABS_RX, ds_report->rx);
+	input_report_abs(ds->gamepad, ABS_RY, ds_report->ry);
+	input_report_abs(ds->gamepad, ABS_Z,  ds_report->z);
+	input_report_abs(ds->gamepad, ABS_RZ, ds_report->rz);
+
+	value = ds_report->buttons[0] & DS_BUTTONS0_HAT_SWITCH;
+	if (value > ARRAY_SIZE(ps_gamepad_hat_mapping))
+		value = 8; /* center */
+	input_report_abs(ds->gamepad, ABS_HAT0X, ps_gamepad_hat_mapping[value].x);
+	input_report_abs(ds->gamepad, ABS_HAT0Y, ps_gamepad_hat_mapping[value].y);
+
+	input_report_key(ds->gamepad, BTN_WEST,   ds_report->buttons[0] & DS_BUTTONS0_SQUARE);
+	input_report_key(ds->gamepad, BTN_SOUTH,  ds_report->buttons[0] & DS_BUTTONS0_CROSS);
+	input_report_key(ds->gamepad, BTN_EAST,   ds_report->buttons[0] & DS_BUTTONS0_CIRCLE);
+	input_report_key(ds->gamepad, BTN_NORTH,  ds_report->buttons[0] & DS_BUTTONS0_TRIANGLE);
+	input_report_key(ds->gamepad, BTN_TL,     ds_report->buttons[1] & DS_BUTTONS1_L1);
+	input_report_key(ds->gamepad, BTN_TR,     ds_report->buttons[1] & DS_BUTTONS1_R1);
+	input_report_key(ds->gamepad, BTN_TL2,    ds_report->buttons[1] & DS_BUTTONS1_L2);
+	input_report_key(ds->gamepad, BTN_TR2,    ds_report->buttons[1] & DS_BUTTONS1_R2);
+	input_report_key(ds->gamepad, BTN_SELECT, ds_report->buttons[1] & DS_BUTTONS1_CREATE);
+	input_report_key(ds->gamepad, BTN_START,  ds_report->buttons[1] & DS_BUTTONS1_OPTIONS);
+	input_report_key(ds->gamepad, BTN_THUMBL, ds_report->buttons[1] & DS_BUTTONS1_L3);
+	input_report_key(ds->gamepad, BTN_THUMBR, ds_report->buttons[1] & DS_BUTTONS1_R3);
+	input_report_key(ds->gamepad, BTN_MODE,   ds_report->buttons[2] & DS_BUTTONS2_PS_HOME);
+	input_sync(ds->gamepad);
+
+	return 0;
+}
+
+static struct ps_device *dualsense_create(struct hid_device *hdev)
+{
+	struct dualsense *ds;
+	int ret;
+
+	ds = devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
+	if (!ds)
+		return ERR_PTR(-ENOMEM);
+
+	/*
+	 * Patch version to allow userspace to distinguish between
+	 * hid-generic vs hid-playstation axis and button mapping.
+	 */
+	hdev->version |= HID_PLAYSTATION_VERSION_PATCH;
+
+	ds->base.hdev = hdev;
+	ds->base.parse_report = dualsense_parse_report;
+	hid_set_drvdata(hdev, ds);
+
+	ds->gamepad = ps_gamepad_create(hdev);
+	if (IS_ERR(ds->gamepad)) {
+		ret = PTR_ERR(ds->gamepad);
+		goto err;
+	}
+
+	return &ds->base;
+
+err:
+	return ERR_PTR(ret);
+}
+
+static int ps_raw_event(struct hid_device *hdev, struct hid_report *report,
+		u8 *data, int size)
+{
+	struct ps_device *dev = hid_get_drvdata(hdev);
+
+	if (dev && dev->parse_report)
+		return dev->parse_report(dev, report, data, size);
+
+	return 0;
+}
+
+static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	struct ps_device *dev;
+	int ret;
+
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "Parse failed\n");
+		return ret;
+	}
+
+	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
+	if (ret) {
+		hid_err(hdev, "Failed to start HID device\n");
+		return ret;
+	}
+
+	ret = hid_hw_open(hdev);
+	if (ret) {
+		hid_err(hdev, "Failed to open HID device\n");
+		goto err_stop;
+	}
+
+	if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
+		dev = dualsense_create(hdev);
+		if (IS_ERR(dev)) {
+			hid_err(hdev, "Failed to create dualsense.\n");
+			ret = PTR_ERR(dev);
+			goto err_close;
+		}
+	}
+
+	return ret;
+
+err_close:
+	hid_hw_close(hdev);
+err_stop:
+	hid_hw_stop(hdev);
+	return ret;
+}
+
+static void ps_remove(struct hid_device *hdev)
+{
+	hid_hw_close(hdev);
+	hid_hw_stop(hdev);
+}
+
+static const struct hid_device_id ps_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, ps_devices);
+
+static struct hid_driver ps_driver = {
+	.name             = "playstation",
+	.id_table         = ps_devices,
+	.probe            = ps_probe,
+	.remove           = ps_remove,
+	.raw_event        = ps_raw_event,
+};
+
+module_hid_driver(ps_driver);
+
+MODULE_AUTHOR("Sony Interactive Entertainment");
+MODULE_DESCRIPTION("HID Driver for PlayStation peripherals.");
+MODULE_LICENSE("GPL");
-- 
2.26.2

