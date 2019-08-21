Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF7C69861A
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 22:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbfHUU7q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 16:59:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33336 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728485AbfHUU7p (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 16:59:45 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 35976309175F;
        Wed, 21 Aug 2019 20:59:45 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-29.ams2.redhat.com [10.36.116.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1D03C18150;
        Wed, 21 Aug 2019 20:59:43 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 2/7] HID: Add driver for Logitech gaming keyboards (G15, G15 v2)
Date:   Wed, 21 Aug 2019 22:59:32 +0200
Message-Id: <20190821205937.4929-3-hdegoede@redhat.com>
In-Reply-To: <20190821205937.4929-1-hdegoede@redhat.com>
References: <20190821205937.4929-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Wed, 21 Aug 2019 20:59:45 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a driver to stop the extra "G" keys from sending F1 - F12 instead
making them send KEY_GKEY# and also make the non-functional M1 - M3 and MR
keys and the non-functional buttons below the LCD panel properly generated
key events.

Note the connect_mask and gkeys_settings_output_report variables may seem
unnecessary since they are always set to the same value, these are there in
preparation of adding support for the G, M and LCD keys on the G510 kbd.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 MAINTAINERS              |   7 ++
 drivers/hid/Makefile     |   1 +
 drivers/hid/hid-ids.h    |   2 +
 drivers/hid/hid-lg-g15.c | 256 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 266 insertions(+)
 create mode 100644 drivers/hid/hid-lg-g15.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1c48322e1cb1..636932afd21f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9478,6 +9478,13 @@ S:	Maintained
 F:	Documentation/admin-guide/ldm.rst
 F:	block/partitions/ldm.*
 
+LOGITECH HID GAMING KEYBOARDS
+M:	Hans de Goede <hdegoede@redhat.com>
+L:	linux-input@vger.kernel.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
+S:	Maintained
+F:	drivers/hid/hid-lg-g15.c
+
 LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
 M:	Sathya Prakash <sathya.prakash@broadcom.com>
 M:	Chaitra P B <chaitra.basappa@broadcom.com>
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index cc5d827c9164..666f4358207e 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -63,6 +63,7 @@ obj-$(CONFIG_HID_KYE)		+= hid-kye.o
 obj-$(CONFIG_HID_LCPOWER)	+= hid-lcpower.o
 obj-$(CONFIG_HID_LENOVO)	+= hid-lenovo.o
 obj-$(CONFIG_HID_LOGITECH)	+= hid-logitech.o
+obj-$(CONFIG_HID_LOGITECH)	+= hid-lg-g15.o
 obj-$(CONFIG_HID_LOGITECH_DJ)	+= hid-logitech-dj.o
 obj-$(CONFIG_HID_LOGITECH_HIDPP)	+= hid-logitech-hidpp.o
 obj-$(CONFIG_HID_MACALLY)	+= hid-macally.o
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 0a00be19f7a0..912c1f9bb957 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -745,6 +745,8 @@
 #define USB_DEVICE_ID_LOGITECH_DUAL_ACTION	0xc216
 #define USB_DEVICE_ID_LOGITECH_RUMBLEPAD2	0xc218
 #define USB_DEVICE_ID_LOGITECH_RUMBLEPAD2_2	0xc219
+#define USB_DEVICE_ID_LOGITECH_G15_LCD		0xc222
+#define USB_DEVICE_ID_LOGITECH_G15_V2_LCD	0xc227
 #define USB_DEVICE_ID_LOGITECH_G29_WHEEL	0xc24f
 #define USB_DEVICE_ID_LOGITECH_G920_WHEEL	0xc262
 #define USB_DEVICE_ID_LOGITECH_WINGMAN_F3D	0xc283
diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
new file mode 100644
index 000000000000..1e35739a461b
--- /dev/null
+++ b/drivers/hid/hid-lg-g15.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *  HID driver for gaming keys on Logitech gaming keyboards (such as the G15)
+ *
+ *  Copyright (c) 2019 Hans de Goede <hdegoede@redhat.com>
+ */
+
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/module.h>
+#include <linux/random.h>
+#include <linux/sched.h>
+#include <linux/usb.h>
+#include <linux/wait.h>
+
+#include "hid-ids.h"
+
+#define LG_G15_TRANSFER_BUF_SIZE	20
+
+enum lg_g15_model {
+	LG_G15,
+	LG_G15_V2,
+};
+
+struct lg_g15_data {
+	/* Must be first for proper dma alignment */
+	u8 transfer_buf[LG_G15_TRANSFER_BUF_SIZE];
+	struct input_dev *input;
+	struct hid_device *hdev;
+	enum lg_g15_model model;
+};
+
+/* On the G15 Mark I Logitech has been quite creative with which bit is what */
+static int lg_g15_event(struct lg_g15_data *g15, u8 *data, int size)
+{
+	int i, val;
+
+	/* G1 - G6 */
+	for (i = 0; i < 6; i++) {
+		val = data[i + 1] & (1 << i);
+		input_report_key(g15->input, KEY_MACRO1 + i, val);
+	}
+	/* G7 - G12 */
+	for (i = 0; i < 6; i++) {
+		val = data[i + 2] & (1 << i);
+		input_report_key(g15->input, KEY_MACRO7 + i, val);
+	}
+	/* G13 - G17 */
+	for (i = 0; i < 5; i++) {
+		val = data[i + 1] & (4 << i);
+		input_report_key(g15->input, KEY_MACRO13 + i, val);
+	}
+	/* G18 */
+	input_report_key(g15->input, KEY_MACRO18, data[8] & 0x40);
+
+	/* M1 - M3 */
+	for (i = 0; i < 3; i++) {
+		val = data[i + 6] & (1 << i);
+		input_report_key(g15->input, KEY_MACRO_PRESET1 + i, val);
+	}
+	/* MR */
+	input_report_key(g15->input, KEY_MACRO_RECORD_START, data[7] & 0x40);
+
+	/* Most left (round) button below the LCD */
+	input_report_key(g15->input, KEY_LCD_MENU1, data[8] & 0x80);
+	/* 4 other buttons below the LCD */
+	for (i = 0; i < 4; i++) {
+		val = data[i + 2] & 0x80;
+		input_report_key(g15->input, KEY_LCD_MENU2 + i, val);
+	}
+
+	input_sync(g15->input);
+	return 0;
+}
+
+static int lg_g15_v2_event(struct lg_g15_data *g15, u8 *data, int size)
+{
+	int i, val;
+
+	/* G1 - G6 */
+	for (i = 0; i < 6; i++) {
+		val = data[1] & (1 << i);
+		input_report_key(g15->input, KEY_MACRO1 + i, val);
+	}
+
+	/* M1 - M3 + MR */
+	input_report_key(g15->input, KEY_MACRO_PRESET1, data[1] & 0x40);
+	input_report_key(g15->input, KEY_MACRO_PRESET2, data[1] & 0x80);
+	input_report_key(g15->input, KEY_MACRO_PRESET3, data[2] & 0x20);
+	input_report_key(g15->input, KEY_MACRO_RECORD_START, data[2] & 0x40);
+
+	/* Round button to the left of the LCD */
+	input_report_key(g15->input, KEY_LCD_MENU1, data[2] & 0x80);
+	/* 4 buttons below the LCD */
+	for (i = 0; i < 4; i++) {
+		val = data[2] & (2 << i);
+		input_report_key(g15->input, KEY_LCD_MENU2 + i, val);
+	}
+
+	input_sync(g15->input);
+	return 0;
+}
+
+static int lg_g15_raw_event(struct hid_device *hdev, struct hid_report *report,
+			    u8 *data, int size)
+{
+	struct lg_g15_data *g15 = hid_get_drvdata(hdev);
+
+	if (g15->model == LG_G15 && data[0] == 0x02 && size == 9)
+		return lg_g15_event(g15, data, size);
+
+	if (g15->model == LG_G15_V2 && data[0] == 0x02 && size == 5)
+		return lg_g15_v2_event(g15, data, size);
+
+	return 0;
+}
+
+static int lg_g15_input_open(struct input_dev *dev)
+{
+	struct hid_device *hdev = input_get_drvdata(dev);
+
+	return hid_hw_open(hdev);
+}
+
+static void lg_g15_input_close(struct input_dev *dev)
+{
+	struct hid_device *hdev = input_get_drvdata(dev);
+
+	hid_hw_close(hdev);
+}
+
+static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	u8 gkeys_settings_output_report = 0;
+	unsigned int connect_mask = 0;
+	struct lg_g15_data *g15;
+	struct input_dev *input;
+	int ret, i, gkeys = 0;
+
+	ret = hid_parse(hdev);
+	if (ret)
+		return ret;
+
+	g15 = devm_kzalloc(&hdev->dev, sizeof(*g15), GFP_KERNEL);
+	if (!g15)
+		return -ENOMEM;
+
+	input = devm_input_allocate_device(&hdev->dev);
+	if (!input)
+		return -ENOMEM;
+
+	g15->hdev = hdev;
+	g15->model = id->driver_data;
+	hid_set_drvdata(hdev, (void *)g15);
+
+	switch (g15->model) {
+	case LG_G15:
+		/*
+		 * The G15 and G15 v2 use a separate usb-device (on a builtin
+		 * hub) which emulates a keyboard for the F1 - F12 emulation
+		 * on the G-keys, which we disable, rendering the emulated kbd
+		 * non-functional, so we do not let hid-input connect.
+		 */
+		connect_mask = HID_CONNECT_HIDRAW;
+		gkeys_settings_output_report = 0x02;
+		gkeys = 18;
+		break;
+	case LG_G15_V2:
+		connect_mask = HID_CONNECT_HIDRAW;
+		gkeys_settings_output_report = 0x02;
+		gkeys = 6;
+		break;
+	}
+
+	ret = hid_hw_start(hdev, connect_mask);
+	if (ret)
+		return ret;
+
+	/* Tell the keyboard to stop sending F1-F12 + 1-6 for G1 - G18 */
+	if (gkeys_settings_output_report) {
+		g15->transfer_buf[0] = gkeys_settings_output_report;
+		memset(g15->transfer_buf + 1, 0, gkeys);
+		/*
+		 * The kbd ignores our output report if we do not queue
+		 * an URB on the USB input endpoint first...
+		 */
+		ret = hid_hw_open(hdev);
+		if (ret)
+			goto error_hw_stop;
+		ret = hid_hw_output_report(hdev, g15->transfer_buf, gkeys + 1);
+		hid_hw_close(hdev);
+	}
+
+	if (ret < 0) {
+		hid_err(hdev, "Error disabling keyboard emulation for the G-keys\n");
+		goto error_hw_stop;
+	}
+
+	input->name = "Logitech Gaming Keyboard Gaming Keys";
+	input->phys = hdev->phys;
+	input->uniq = hdev->uniq;
+	input->id.bustype = hdev->bus;
+	input->id.vendor  = hdev->vendor;
+	input->id.product = hdev->product;
+	input->id.version = hdev->version;
+	input->dev.parent = &hdev->dev;
+	input->open = lg_g15_input_open;
+	input->close = lg_g15_input_close;
+
+	/* G-keys */
+	for (i = 0; i < gkeys; i++)
+		input_set_capability(input, EV_KEY, KEY_MACRO1 + i);
+
+	/* M1 - M3 and MR keys */
+	for (i = 0; i < 3; i++)
+		input_set_capability(input, EV_KEY, KEY_MACRO_PRESET1 + i);
+	input_set_capability(input, EV_KEY, KEY_MACRO_RECORD_START);
+
+	/* Keys below the LCD, intended for controlling a menu on the LCD */
+	for (i = 0; i < 5; i++)
+		input_set_capability(input, EV_KEY, KEY_LCD_MENU1 + i);
+
+	g15->input = input;
+	input_set_drvdata(input, hdev);
+
+	ret = input_register_device(input);
+	if (ret)
+		goto error_hw_stop;
+
+	return 0;
+
+error_hw_stop:
+	hid_hw_stop(hdev);
+	return ret;
+}
+
+static const struct hid_device_id lg_g15_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+			 USB_DEVICE_ID_LOGITECH_G15_LCD),
+		.driver_data = LG_G15 },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+			 USB_DEVICE_ID_LOGITECH_G15_V2_LCD),
+		.driver_data = LG_G15_V2 },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, lg_g15_devices);
+
+static struct hid_driver lg_g15_driver = {
+	.name			= "lg-g15",
+	.id_table		= lg_g15_devices,
+	.raw_event		= lg_g15_raw_event,
+	.probe			= lg_g15_probe,
+};
+module_hid_driver(lg_g15_driver);
+
+MODULE_LICENSE("GPL");
-- 
2.23.0.rc2

