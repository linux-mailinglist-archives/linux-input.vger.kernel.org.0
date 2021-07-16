Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 538A43CBA4B
	for <lists+linux-input@lfdr.de>; Fri, 16 Jul 2021 18:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbhGPQKK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Jul 2021 12:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhGPQKJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Jul 2021 12:10:09 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA6AC06175F;
        Fri, 16 Jul 2021 09:07:14 -0700 (PDT)
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1626451632;
        bh=gS6ysxE98avoMovLDbnar/geonvAjSzT/o/nkTPxiME=;
        h=From:To:Cc:Subject:Date:From;
        b=TGglYEpNc+CkE+epynGDlQmz/i+YzAVi+M6clfl/CSZWyJ92WzbpUPeW36ywbiCY2
         m2YRJkdfrtd4GNk4CefScbXGinZuZLb4dp2ZL52o41+Ly/JpNGQy6s8p4qJqAujHrc
         zc2aJzunCl0Fi/8I/NqpBydoWeH8m3vkAUqB0txo=
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] HID: cmedia: add support for HS-100B mute button
Date:   Fri, 16 Jul 2021 18:06:59 +0200
Message-Id: <20210716160659.154779-1-linux@weissschuh.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

These chips report mute button events in bit 4 of their report without it being
part of the report descriptor.
Use a custom descriptor that maps this bit.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---

v1: https://lore.kernel.org/linux-input/a769ae40-6d0c-47c4-803f-2c8dbc362f24@t-8ch.de/

v1 -> v2:
 * Merged into the existing cmedia driver instead of creating a dedicated
   driver.

 drivers/hid/Kconfig      |   5 +-
 drivers/hid/hid-cmedia.c | 100 ++++++++++++++++++++++++++++++++++-----
 drivers/hid/hid-ids.h    |   1 +
 drivers/hid/hid-quirks.c |   1 +
 4 files changed, 94 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 160554903ef9..6f72ecd79db0 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -259,10 +259,11 @@ config HID_PRODIKEYS
 	  and some additional multimedia keys.
 
 config HID_CMEDIA
-	tristate "CMedia CM6533 HID audio jack controls"
+	tristate "CMedia audio chips"
 	depends on HID
 	help
-	Support for CMedia CM6533 HID audio jack controls.
+	Support for CMedia CM6533 HID audio jack controls
+        and HS100B mute buttons.
 
 config HID_CP2112
 	tristate "Silicon Labs CP2112 HID USB-to-SMBus Bridge support"
diff --git a/drivers/hid/hid-cmedia.c b/drivers/hid/hid-cmedia.c
index 3296c5050264..be37ae3883c6 100644
--- a/drivers/hid/hid-cmedia.c
+++ b/drivers/hid/hid-cmedia.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * HID driver for CMedia CM6533 audio jack controls
+ * and HS100B mute buttons
  *
  * Copyright (C) 2015 Ben Chen <ben_chen@bizlinktech.com>
+ * Copyright (C) 2021 Thomas Weißschuh <linux@weissschuh.net>
  */
 
 #include <linux/device.h>
@@ -11,13 +13,16 @@
 #include "hid-ids.h"
 
 MODULE_AUTHOR("Ben Chen");
-MODULE_DESCRIPTION("CM6533 HID jack controls");
+MODULE_AUTHOR("Thomas Weißschuh");
+MODULE_DESCRIPTION("CM6533 HID jack controls and HS100B mute button");
 MODULE_LICENSE("GPL");
 
 #define CM6533_JD_TYPE_COUNT      1
 #define CM6533_JD_RAWEV_LEN	 16
 #define CM6533_JD_SFX_OFFSET	  8
 
+#define HS100B_RDESC_ORIG_SIZE   60
+
 /*
 *
 *CM6533 audio jack HID raw events:
@@ -40,13 +45,51 @@ static int jack_switch_types[CM6533_JD_TYPE_COUNT] = {
 	SW_HEADPHONE_INSERT,
 };
 
-struct cmhid {
+struct cmhid_cm6533 {
 	struct input_dev *input_dev;
 	struct hid_device *hid;
 	unsigned short switch_map[CM6533_JD_TYPE_COUNT];
 };
 
-static void hp_ev(struct hid_device *hid, struct cmhid *cm, int value)
+/* Fixed report descriptor of HS-100B audio chip
+ * Bit 4 is an abolute Microphone mute usage instead of being unassigned.
+ */
+static __u8 hs100b_rdesc_fixed[] = {
+	0x05, 0x0C,         /*  Usage Page (Consumer),          */
+	0x09, 0x01,         /*  Usage (Consumer Control),       */
+	0xA1, 0x01,         /*  Collection (Application),       */
+	0x15, 0x00,         /*      Logical Minimum (0),        */
+	0x25, 0x01,         /*      Logical Maximum (1),        */
+	0x09, 0xE9,         /*      Usage (Volume Inc),         */
+	0x09, 0xEA,         /*      Usage (Volume Dec),         */
+	0x75, 0x01,         /*      Report Size (1),            */
+	0x95, 0x02,         /*      Report Count (2),           */
+	0x81, 0x02,         /*      Input (Variable),           */
+	0x09, 0xE2,         /*      Usage (Mute),               */
+	0x95, 0x01,         /*      Report Count (1),           */
+	0x81, 0x06,         /*      Input (Variable, Relative), */
+	0x05, 0x0B,         /*      Usage Page (Telephony),     */
+	0x09, 0x2F,         /*      Usage (2Fh),                */
+	0x81, 0x02,         /*      Input (Variable),           */
+	0x09, 0x20,         /*      Usage (20h),                */
+	0x81, 0x06,         /*      Input (Variable, Relative), */
+	0x05, 0x0C,         /*      Usage Page (Consumer),      */
+	0x09, 0x00,         /*      Usage (00h),                */
+	0x95, 0x03,         /*      Report Count (3),           */
+	0x81, 0x02,         /*      Input (Variable),           */
+	0x26, 0xFF, 0x00,   /*      Logical Maximum (255),      */
+	0x09, 0x00,         /*      Usage (00h),                */
+	0x75, 0x08,         /*      Report Size (8),            */
+	0x95, 0x03,         /*      Report Count (3),           */
+	0x81, 0x02,         /*      Input (Variable),           */
+	0x09, 0x00,         /*      Usage (00h),                */
+	0x95, 0x04,         /*      Report Count (4),           */
+	0x91, 0x02,         /*      Output (Variable),          */
+	0xC0                /*  End Collection                  */
+};
+
+
+static void hp_ev(struct hid_device *hid, struct cmhid_cm6533 *cm, int value)
 {
 	input_report_switch(cm->input_dev, SW_HEADPHONE_INSERT, value);
 	input_sync(cm->input_dev);
@@ -55,7 +98,12 @@ static void hp_ev(struct hid_device *hid, struct cmhid *cm, int value)
 static int cmhid_raw_event(struct hid_device *hid, struct hid_report *report,
 	 u8 *data, int len)
 {
-	struct cmhid *cm = hid_get_drvdata(hid);
+	struct cmhid_cm6533 *cm;
+
+	if (hid->product != USB_DEVICE_ID_CM6533)
+		return 0;
+
+	cm = hid_get_drvdata(hid);
 
 	if (len != CM6533_JD_RAWEV_LEN)
 		goto out;
@@ -79,9 +127,12 @@ static int cmhid_input_configured(struct hid_device *hid,
 		struct hid_input *hidinput)
 {
 	struct input_dev *input_dev = hidinput->input;
-	struct cmhid *cm = hid_get_drvdata(hid);
+	struct cmhid_cm6533 *cm = hid_get_drvdata(hid);
 	int i;
 
+	if (hid->product != USB_DEVICE_ID_CM6533)
+		return 0;
+
 	cm->input_dev = input_dev;
 	memcpy(cm->switch_map, jack_switch_types, sizeof(cm->switch_map));
 	input_dev->evbit[0] = BIT(EV_SW);
@@ -95,15 +146,27 @@ static int cmhid_input_mapping(struct hid_device *hid,
 		struct hid_input *hi, struct hid_field *field,
 		struct hid_usage *usage, unsigned long **bit, int *max)
 {
-	return -1;
+	switch (hid->product) {
+		case USB_DEVICE_ID_CM6533:
+			return -1;
+		default:
+			return 0;
+	}
 }
 
 static int cmhid_probe(struct hid_device *hid, const struct hid_device_id *id)
 {
 	int ret;
-	struct cmhid *cm;
+	struct cmhid_cm6533 *cm;
+
+	if (hid->product != USB_DEVICE_ID_CM6533) {
+		ret = hid_open_report(hid);
+		if (!ret)
+			ret = hid_hw_start(hid, HID_CONNECT_DEFAULT);
+		return ret;
+	}
 
-	cm = kzalloc(sizeof(struct cmhid), GFP_KERNEL);
+	cm = kzalloc(sizeof(*cm), GFP_KERNEL);
 	if (!cm) {
 		ret = -ENOMEM;
 		goto allocfail;
@@ -132,7 +195,6 @@ static int cmhid_probe(struct hid_device *hid, const struct hid_device_id *id)
 allocfail:
 	return ret;
 }
-
 static void cmhid_remove(struct hid_device *hid)
 {
 	struct cmhid *cm = hid_get_drvdata(hid);
@@ -141,20 +203,36 @@ static void cmhid_remove(struct hid_device *hid)
 	kfree(cm);
 }
 
+static __u8 *cmhid_report_fixup(struct hid_device *hid, __u8 *rdesc,
+		unsigned int *rsize)
+{
+	switch (hid->product) {
+	case USB_DEVICE_ID_CMEDIA_HS100B:
+		if (*rsize == HS100B_RDESC_ORIG_SIZE) {
+			hid_info(hid, "Fixing CMedia HS-100B report descriptor\n");
+			rdesc = hs100b_rdesc_fixed;
+			*rsize = sizeof(hs100b_rdesc_fixed);
+		}
+		break;
+	}
+	return rdesc;
+}
+
 static const struct hid_device_id cmhid_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CMEDIA, USB_DEVICE_ID_CM6533) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CMEDIA, USB_DEVICE_ID_CMEDIA_HS100B) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, cmhid_devices);
 
 static struct hid_driver cmhid_driver = {
-	.name = "cm6533_jd",
+	.name = "cmedia",
 	.id_table = cmhid_devices,
 	.raw_event = cmhid_raw_event,
 	.input_configured = cmhid_input_configured,
 	.probe = cmhid_probe,
 	.remove = cmhid_remove,
+	.report_fixup = cmhid_report_fixup,
 	.input_mapping = cmhid_input_mapping,
 };
 module_hid_driver(cmhid_driver);
-
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 8f1893e68112..6864e4e6ac8b 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -292,6 +292,7 @@
 
 #define USB_VENDOR_ID_CMEDIA		0x0d8c
 #define USB_DEVICE_ID_CM109		0x000e
+#define USB_DEVICE_ID_CMEDIA_HS100B	0x0014
 #define USB_DEVICE_ID_CM6533		0x0022
 
 #define USB_VENDOR_ID_CODEMERCS		0x07c0
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 51b39bda9a9d..8c1813abd86f 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -345,6 +345,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
 #endif
 #if IS_ENABLED(CONFIG_HID_CMEDIA)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CMEDIA, USB_DEVICE_ID_CM6533) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CMEDIA, USB_DEVICE_ID_CMEDIA_HS100B) },
 #endif
 #if IS_ENABLED(CONFIG_HID_CORSAIR)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSAIR_K90) },

base-commit: 1b97ec646386cea5b4be139f7685b4a4b4d3799a
-- 
2.32.0

