Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70EE3509D3
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2019 13:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727284AbfFXLdl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Jun 2019 07:33:41 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:60239 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbfFXLdl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Jun 2019 07:33:41 -0400
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 65AF420000C;
        Mon, 24 Jun 2019 11:33:31 +0000 (UTC)
Message-ID: <58ee0e02bd6bee1e73f60077b940e0c5d3738253.camel@hadess.net>
Subject: [PATCH] HID: sb0540: add support for Creative SB0540 IR receivers
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 24 Jun 2019 13:33:30 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

With initial reviews from Benjamin Tissoires.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/Kconfig               |   9 ++
 drivers/hid/Makefile              |   1 +
 drivers/hid/hid-creative-sb0540.c | 254 ++++++++++++++++++++++++++++++
 drivers/hid/hid-ids.h             |   1 +
 4 files changed, 265 insertions(+)
 create mode 100644 drivers/hid/hid-creative-sb0540.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 3872e03d9a59..ea2b080649b6 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -273,6 +273,15 @@ config HID_CP2112
 	and gpiochip to expose these functions of the CP2112. The
 	customizable USB descriptor fields are exposed as sysfs attributes.
 
+config HID_CREATIVE_SB0540
+	tristate "Creative SB0540 infrared receiver"
+	depends on (USB_HID)
+	---help---
+	Support for Creative infrared SB0540-compatible remote controls, such
+	as the RM-1500 and RM-1800 remotes.
+
+	Say Y here if you want support for Creative SB0540 infrared receiver.
+
 config HID_CYPRESS
 	tristate "Cypress mouse and barcode readers"
 	depends on HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index cc5d827c9164..1ad662fe37b6 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_HID_ALPS)		+= hid-alps.o
 obj-$(CONFIG_HID_ACRUX)		+= hid-axff.o
 obj-$(CONFIG_HID_APPLE)		+= hid-apple.o
 obj-$(CONFIG_HID_APPLEIR)	+= hid-appleir.o
+obj-$(CONFIG_HID_CREATIVE_SB0540)	+= hid-creative-sb0540.c
 obj-$(CONFIG_HID_ASUS)		+= hid-asus.o
 obj-$(CONFIG_HID_AUREAL)	+= hid-aureal.o
 obj-$(CONFIG_HID_BELKIN)	+= hid-belkin.o
diff --git a/drivers/hid/hid-creative-sb0540.c b/drivers/hid/hid-creative-sb0540.c
new file mode 100644
index 000000000000..a3f31b178b46
--- /dev/null
+++ b/drivers/hid/hid-creative-sb0540.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * HID driver for the Creative SB0540 receiver
+ *
+ * Copyright (C) 2019 Red Hat Inc. All Rights Reserved
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/module.h>
+#include "hid-ids.h"
+
+MODULE_AUTHOR("Bastien Nocera <hadess@hadess.net>");
+MODULE_DESCRIPTION("HID Creative SB0540 receiver");
+MODULE_LICENSE("GPL");
+
+static const unsigned short creative_sb0540_key_table[] = {
+	KEY_POWER,
+	KEY_RESERVED,		/* text: 24bit */
+	KEY_RESERVED,		/* 24bit wheel up */
+	KEY_RESERVED,		/* 24bit wheel down */
+	KEY_RESERVED,		/* text: CMSS */
+	KEY_RESERVED,		/* CMSS wheel Up */
+	KEY_RESERVED,		/* CMSS wheel Down */
+	KEY_RESERVED,		/* text: EAX */
+	KEY_RESERVED,		/* EAX wheel up */
+	KEY_RESERVED,		/* EAX wheel down */
+	KEY_RESERVED,		/* text: 3D Midi */
+	KEY_RESERVED,		/* 3D Midi wheel up */
+	KEY_RESERVED,		/* 3D Midi wheel down */
+	KEY_MUTE,
+	KEY_VOLUMEUP,
+	KEY_VOLUMEDOWN,
+	KEY_UP,
+	KEY_LEFT,
+	KEY_RIGHT,
+	KEY_REWIND,
+	KEY_OK,
+	KEY_FASTFORWARD,
+	KEY_DOWN,
+	KEY_SELECT,		/* text: Return, symbol: Jump to */
+	KEY_RESERVED,		/* text: Start */
+	KEY_RESERVED,		/* Cancel */
+	KEY_RECORD,
+	KEY_OPTION,
+	KEY_RESERVED,		/* text: Display */
+	KEY_PREVIOUS,
+	KEY_PLAY,
+	KEY_NEXT,
+	KEY_SLOW,
+	KEY_STOP,
+	KEY_NUMERIC_1,
+	KEY_NUMERIC_2,
+	KEY_NUMERIC_3,
+	KEY_NUMERIC_4,
+	KEY_NUMERIC_5,
+	KEY_NUMERIC_6,
+	KEY_NUMERIC_7,
+	KEY_NUMERIC_8,
+	KEY_NUMERIC_9,
+	KEY_NUMERIC_0
+};
+
+/* Codes and keys from lirc's
+ * remotes/creative/lircd.conf.alsa_usb
+ * order and size must match creative_sb0540_key_table[] above */
+static const unsigned short creative_sb0540_codes[] = {
+	0x619E,
+	0x916E,
+	0x926D,
+	0x936C,
+	0x718E,
+	0x946B,
+	0x956A,
+	0x8C73,
+	0x9669,
+	0x9768,
+	0x9867,
+	0x9966,
+	0x9A65,
+	0x6E91,
+	0x629D,
+	0x639C,
+	0x7B84,
+	0x6B94,
+	0x728D,
+	0x8778,
+	0x817E,
+	0x758A,
+	0x8D72,
+	0x8E71,
+	0x8877,
+	0x7C83,
+	0x738C,
+	0x827D,
+	0x7689,
+	0x7F80,
+	0x7986,
+	0x7A85,
+	0x7D82,
+	0x857A,
+	0x8B74,
+	0x8F70,
+	0x906F,
+	0x8A75,
+	0x847B,
+	0x7887,
+	0x8976,
+	0x837C,
+	0x7788,
+	0x807F
+};
+
+struct creative_sb0540 {
+	struct input_dev *input_dev;
+	struct hid_device *hid;
+	unsigned short keymap[ARRAY_SIZE(creative_sb0540_key_table)];
+};
+
+static inline u64 reverse(u64 data, int bits)
+{
+	int i;
+	u64 c;
+
+	c = 0;
+	for (i = 0; i < bits; i++) {
+		c |= (u64) (((data & (((u64) 1) << i)) ? 1 : 0)) << (bits - 1 - i);
+	}
+	return (c);
+}
+
+static int get_key(struct creative_sb0540 *creative_sb0540, u64 keycode)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(creative_sb0540_codes); i++) {
+		if (creative_sb0540_codes[i] == keycode)
+			return creative_sb0540->keymap[i];
+	}
+
+	return 0;
+
+}
+
+static int creative_sb0540_raw_event(struct hid_device *hid, struct hid_report *report,
+	 u8 *data, int len)
+{
+	struct creative_sb0540 *creative_sb0540 = hid_get_drvdata(hid);
+	u64 code, main_code;
+	int key;
+
+	if (len != 6)
+		goto out;
+
+	/* From daemons/hw_hiddev.c sb0540_rec() in lirc */
+	code = reverse(data[5], 8);
+	main_code = (code << 8) + ((~code) & 0xff);
+
+	/* Flip to get values in the same format as
+	 * remotes/creative/lircd.conf.alsa_usb in lirc */
+	main_code = ((main_code & 0xff) << 8) + ((main_code & 0xff00) >> 8);
+
+	key = get_key(creative_sb0540, main_code);
+	if (key == 0 || key == KEY_RESERVED) {
+		hid_err(hid, "Could not get a key for main_code %llX\n", main_code);
+		goto out;
+	}
+
+	input_report_key(creative_sb0540->input_dev, key, 1);
+	input_report_key(creative_sb0540->input_dev, key, 0);
+	input_sync(creative_sb0540->input_dev);
+
+out:
+	/* let hidraw and hiddev handle the report */
+	return 0;
+}
+
+static int creative_sb0540_input_configured(struct hid_device *hid,
+		struct hid_input *hidinput)
+{
+	struct input_dev *input_dev = hidinput->input;
+	struct creative_sb0540 *creative_sb0540 = hid_get_drvdata(hid);
+	int i;
+
+	creative_sb0540->input_dev = input_dev;
+
+	input_dev->keycode = creative_sb0540->keymap;
+	input_dev->keycodesize = sizeof(unsigned short);
+	input_dev->keycodemax = ARRAY_SIZE(creative_sb0540->keymap);
+
+	input_dev->evbit[0] = BIT(EV_KEY) | BIT(EV_REP);
+
+	memcpy(creative_sb0540->keymap, creative_sb0540_key_table, sizeof(creative_sb0540->keymap));
+	for (i = 0; i < ARRAY_SIZE(creative_sb0540_key_table); i++)
+		set_bit(creative_sb0540->keymap[i], input_dev->keybit);
+	clear_bit(KEY_RESERVED, input_dev->keybit);
+
+	return 0;
+}
+
+static int creative_sb0540_input_mapping(struct hid_device *hid,
+		struct hid_input *hi, struct hid_field *field,
+		struct hid_usage *usage, unsigned long **bit, int *max)
+{
+	return -1;
+}
+
+static int creative_sb0540_probe(struct hid_device *hid, const struct hid_device_id *id)
+{
+	int ret;
+	struct creative_sb0540 *creative_sb0540;
+
+	creative_sb0540 = devm_kzalloc(&hid->dev, sizeof(struct creative_sb0540), GFP_KERNEL);
+	if (!creative_sb0540)
+		return -ENOMEM;
+
+	creative_sb0540->hid = hid;
+
+	/* force input as some remotes bypass the input registration */
+	hid->quirks |= HID_QUIRK_HIDINPUT_FORCE;
+
+	hid_set_drvdata(hid, creative_sb0540);
+
+	ret = hid_parse(hid);
+	if (ret) {
+		hid_err(hid, "parse failed\n");
+		return ret;
+	}
+
+	ret = hid_hw_start(hid, HID_CONNECT_DEFAULT);
+	if (ret) {
+		hid_err(hid, "hw start failed\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static const struct hid_device_id creative_sb0540_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CREATIVELABS, USB_DEVICE_ID_CREATIVE_SB0540) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, creative_sb0540_devices);
+
+static struct hid_driver creative_sb0540_driver = {
+	.name = "creative-sb0540",
+	.id_table = creative_sb0540_devices,
+	.raw_event = creative_sb0540_raw_event,
+	.input_configured = creative_sb0540_input_configured,
+	.probe = creative_sb0540_probe,
+	.input_mapping = creative_sb0540_input_mapping,
+};
+module_hid_driver(creative_sb0540_driver);
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 826324997686..206b7065da86 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -312,6 +312,7 @@
 #define USB_VENDOR_ID_CREATIVELABS	0x041e
 #define USB_DEVICE_ID_CREATIVE_SB_OMNI_SURROUND_51	0x322c
 #define USB_DEVICE_ID_PRODIKEYS_PCMIDI	0x2801
+#define USB_DEVICE_ID_CREATIVE_SB0540	0x3100
 
 #define USB_VENDOR_ID_CVTOUCH		0x1ff7
 #define USB_DEVICE_ID_CVTOUCH_SCREEN	0x0013

