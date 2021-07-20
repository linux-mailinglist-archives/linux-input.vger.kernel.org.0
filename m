Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 691413D033D
	for <lists+linux-input@lfdr.de>; Tue, 20 Jul 2021 22:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232563AbhGTUEs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Jul 2021 16:04:48 -0400
Received: from todd.t-8ch.de ([159.69.126.157]:53587 "EHLO todd.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237106AbhGTTqv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Jul 2021 15:46:51 -0400
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1626812837;
        bh=rr3Jhg9Eu5FI/LbMQvi3n8hESvKsVt21H82ii3qV3V4=;
        h=From:To:Cc:Subject:Date:From;
        b=Df2a8dT//jJda2CxcNAVoEm/Iodr+jU3kwKzDpF750e/Opim+rnZ3mlVgg/10zbsv
         NsYyC6+YReaA8O6YqwjJ0Owj6A7C7ymnopK+CWsmPc+dkgjBKTM8CNp6FurcsYBjsU
         c1aM8lp97cVCuXgN+3z95yhXXPAM2DFk/aTFFt8Q=
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Ben Chen <ben_chen@bizlinktech.com>
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4] HID: cmedia: add support for HS-100B mute button
Date:   Tue, 20 Jul 2021 22:27:08 +0200
Message-Id: <20210720202708.341057-1-linux@weissschuh.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

These chips report mute button events in bit 4 of their report without it
being part of the report descriptor.
Use a custom descriptor that maps this bit.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---

v1: https://lore.kernel.org/linux-input/a769ae40-6d0c-47c4-803f-2c8dbc362f24@t-8ch.de/

v1 -> v2:
 * Merged into the existing cmedia driver instead of creating a dedicated
   driver.

v2: https://lore.kernel.org/linux-input/20210716160659.154779-1-linux@weissschuh.net/

v2 -> v3:
 * Fixed cosmetic checkpatch warnings
 * CC-ed Ben Chen who is the original author of hid-cmedia.c

v3: https://lore.kernel.org/linux-input/20210719110911.310701-1-linux@weissschuh.net/

v3 -> v4:
 * Create a dedicated struct hid_driver, leaving the existing intact
 * Drop entry in hid-quirks.c

 drivers/hid/Kconfig      |  5 ++-
 drivers/hid/hid-cmedia.c | 90 +++++++++++++++++++++++++++++++++++++++-
 drivers/hid/hid-ids.h    |  1 +
 3 files changed, 92 insertions(+), 4 deletions(-)

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
index 3296c5050264..cab42047bc99 100644
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
@@ -11,13 +13,53 @@
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
 /*
 *
 *CM6533 audio jack HID raw events:
@@ -156,5 +198,49 @@ static struct hid_driver cmhid_driver = {
 	.remove = cmhid_remove,
 	.input_mapping = cmhid_input_mapping,
 };
-module_hid_driver(cmhid_driver);
 
+static __u8 *cmhid_hs100b_report_fixup(struct hid_device *hid, __u8 *rdesc,
+				       unsigned int *rsize)
+{
+	if (*rsize == HS100B_RDESC_ORIG_SIZE) {
+		hid_info(hid, "Fixing CMedia HS-100B report descriptor\n");
+		rdesc = hs100b_rdesc_fixed;
+		*rsize = sizeof(hs100b_rdesc_fixed);
+	}
+	return rdesc;
+}
+
+static const struct hid_device_id cmhid_hs100b_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CMEDIA, USB_DEVICE_ID_CMEDIA_HS100B) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, cmhid_hs100b_devices);
+
+static struct hid_driver cmhid_hs100b_driver = {
+	.name = "cmedia_hs100b",
+	.id_table = cmhid_hs100b_devices,
+	.report_fixup = cmhid_hs100b_report_fixup,
+};
+
+static int cmedia_init(void)
+{
+	int ret;
+
+	ret = hid_register_driver(&cmhid_driver);
+	if (ret)
+		return ret;
+
+	ret = hid_register_driver(&cmhid_hs100b_driver);
+	if (ret)
+		hid_unregister_driver(&cmhid_driver);
+
+	return ret;
+}
+module_init(cmedia_init);
+
+static void cmedia_exit(void)
+{
+		hid_unregister_driver(&cmhid_driver);
+		hid_unregister_driver(&cmhid_hs100b_driver);
+}
+module_exit(cmedia_exit);
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

base-commit: 1b97ec646386cea5b4be139f7685b4a4b4d3799a
-- 
2.32.0

