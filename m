Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 359C93BACBF
	for <lists+linux-input@lfdr.de>; Sun,  4 Jul 2021 12:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhGDKwC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Jul 2021 06:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbhGDKwC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Jul 2021 06:52:02 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE665C061762
        for <linux-input@vger.kernel.org>; Sun,  4 Jul 2021 03:49:24 -0700 (PDT)
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1625395760;
        bh=+iOUpjO0NGFBvDKyHWADnDxlmoloAiU5hmupn6cKekI=;
        h=From:To:Cc:Subject:Date:From;
        b=GTskROOsWUAsZ+m8VfX63O8hDR6qmIT3cicpRNxBzK76hjHAXzRcZtXnRDiBT0d+S
         I9AF/7GAZ/qU3OZ2+YK5dhR3/2wi4GR4sLAFwsDqRAxKcFZuKVD1aQ+B2R8v9xN9VD
         mZIR1zNNiRiuNLJ7sTMIhUW8ajoTMki31L8pVCGQ=
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.or
Subject: [PATCH] HID: add cmedia-fixup driver
Date:   Sun,  4 Jul 2021 12:49:06 +0200
Message-Id: <20210704104906.78490-1-linux@weissschuh.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This driver provides HID fixups for CMedia audio chips.
For now this enables the recognition of the microphone mute button for the
HS-100B.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/Kconfig            |  6 +++
 drivers/hid/Makefile           |  1 +
 drivers/hid/hid-cmedia-fixup.c | 82 ++++++++++++++++++++++++++++++++++
 drivers/hid/hid-ids.h          |  1 +
 drivers/hid/hid-quirks.c       |  3 ++
 5 files changed, 93 insertions(+)
 create mode 100644 drivers/hid/hid-cmedia-fixup.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 160554903ef9..5e139c93f75a 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -264,6 +264,12 @@ config HID_CMEDIA
 	help
 	Support for CMedia CM6533 HID audio jack controls.
 
+config HID_CMEDIA_FIXUP
+	tristate "CMedia hid fixup"
+	depends on HID
+	help
+	Fixups for CMedia based audio chips.
+
 config HID_CP2112
 	tristate "Silicon Labs CP2112 HID USB-to-SMBus Bridge support"
 	depends on USB_HID && HIDRAW && I2C && GPIOLIB
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 1ea1a7c0b20f..66d6b06ce4d2 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_HID_BIGBEN_FF)	+= hid-bigbenff.o
 obj-$(CONFIG_HID_CHERRY)	+= hid-cherry.o
 obj-$(CONFIG_HID_CHICONY)	+= hid-chicony.o
 obj-$(CONFIG_HID_CMEDIA)	+= hid-cmedia.o
+obj-$(CONFIG_HID_CMEDIA_FIXUP)	+= hid-cmedia-fixup.o
 obj-$(CONFIG_HID_CORSAIR)	+= hid-corsair.o
 obj-$(CONFIG_HID_COUGAR)	+= hid-cougar.o
 obj-$(CONFIG_HID_CP2112)	+= hid-cp2112.o
diff --git a/drivers/hid/hid-cmedia-fixup.c b/drivers/hid/hid-cmedia-fixup.c
new file mode 100644
index 000000000000..c9a984ea6f0a
--- /dev/null
+++ b/drivers/hid/hid-cmedia-fixup.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * HID driver containing fixups for CMedia audio chips.
+ *
+ * Copyright (C) 2021 Thomas Weißschuh <thomas@weissschuh.net>
+ */
+
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/module.h>
+#include "hid-ids.h"
+
+#define HS100B_RDESC_ORIG_SIZE 60
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
+static __u8 *cmhid_fixup_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+				      unsigned int *rsize)
+{
+	switch (hdev->product) {
+	case USB_DEVICE_ID_CMEDIA_HS100B:
+		if (*rsize == HS100B_RDESC_ORIG_SIZE) {
+			hid_info(hdev, "Fixing CMedia HS-100B report descriptor\n");
+			rdesc = hs100b_rdesc_fixed;
+			*rsize = sizeof(hs100b_rdesc_fixed);
+		}
+		break;
+	}
+	return rdesc;
+}
+
+static const struct hid_device_id cmhid_fixup_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CMEDIA, USB_DEVICE_ID_CMEDIA_HS100B) },
+	{ }
+};
+
+static struct hid_driver cmhid_fixup_driver = {
+	.name = "cmedia_fixups",
+	.id_table = cmhid_fixup_devices,
+	.report_fixup = cmhid_fixup_report_fixup,
+};
+module_hid_driver(cmhid_fixup_driver);
+
+MODULE_DEVICE_TABLE(hid, cmhid_fixup_devices);
+MODULE_AUTHOR("Thomas Weißschuh <thomas@weissschuh.net>");
+MODULE_DESCRIPTION("CMedia HID fixup");
+MODULE_LICENSE("GPL");
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
index 51b39bda9a9d..7776aa13ee27 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -346,6 +346,9 @@ static const struct hid_device_id hid_have_special_driver[] = {
 #if IS_ENABLED(CONFIG_HID_CMEDIA)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CMEDIA, USB_DEVICE_ID_CM6533) },
 #endif
+#if IS_ENABLED(CONFIG_HID_CMEDIA_FIXUP)
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CMEDIA, USB_DEVICE_ID_CMEDIA_HS100B) },
+#endif
 #if IS_ENABLED(CONFIG_HID_CORSAIR)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSAIR_K90) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSAIR_GLAIVE_RGB) },

base-commit: df04fbe8680bfe07f3d7487eccff9f768bb02533
-- 
2.32.0

