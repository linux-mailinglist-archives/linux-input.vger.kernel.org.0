Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D435D650AB
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2019 05:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbfGKDnT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Jul 2019 23:43:19 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45333 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfGKDnT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Jul 2019 23:43:19 -0400
Received: by mail-pf1-f196.google.com with SMTP id r1so2049213pfq.12
        for <linux-input@vger.kernel.org>; Wed, 10 Jul 2019 20:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0hXAs+if3ti+HiHcZ8/BVXsTorC7ekO6oGp1IO9BfSk=;
        b=jE52cvBAaM0cskrLv0Tnc5RwXgECSkHZZ8jskjXKJ6NqAvWOXIccMocRfxANEXAygc
         hggPQ6yqDco5lgyR3grV68Cup4jBrnilwEjAAzLsn2nT7vJaQw1xLWtPQcHQXo99Xsex
         bxtb4XD7v8Ko8S3EaBOvXDyups61wV/Tn2SCeEj8u5d0RK2FhOrc24BqIA6ckdsCsnwk
         GFsxGND/m4TfyOtmvOey6FUaBZVQJmrLOZdXMGjrw/zGqz1MsK/5u1zmCXZd4c0k4GaZ
         eVBsRIsWad+Ol9l/dyhphjwKIVoDzvSUUaF9HWL+Abt9j8CksAJKoZidh8rT+FA1m+H0
         9NkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0hXAs+if3ti+HiHcZ8/BVXsTorC7ekO6oGp1IO9BfSk=;
        b=NXQZYutfr7LbWHSok+s004UrwPZC/pLvHrUxUs1kDBeP6Hs0fVsz9IyuRc6/YzupBT
         UM5iadPN4ZgEK0VX4BwAgtRRvHMWu9G5dCrnMZsN1Mq8m9Y8B7/a9VSBZiz8EjF6NopU
         GeRD6KlpunqolX0tgeJe82wVagh6ZWHeEPvYSQh+fa9ZJR6ujvQZoojkj706OKooYRDd
         /UCc3HaL5aaQKcT5SFgnL11AazHo4St4S50VtEYFA3gD3YgBeJbchT1fl+9H93FS4hbi
         Zu4KpL2xXViuZOWImEl5Phw6qpyPiEZBr2JTzYl4JgoRbX8H/8C0OmhdcWJ3l3deuHBL
         9NzQ==
X-Gm-Message-State: APjAAAVTA/df1Z3SSdro9lwkbsPOo5RWtfXDAtdwEn8ZSH2IKNoXUyZa
        IqIgbArhPGvQlJuu4lWKV/wQpBZz
X-Google-Smtp-Source: APXvYqw8YJ+xW4t1Iml00djWU53h1ESaQ/IJ3+vfwpOLPQwqzz4np8G1vlMO+0tKpPlurrPalF/KIg==
X-Received: by 2002:a65:52ca:: with SMTP id z10mr2021372pgp.424.1562816595334;
        Wed, 10 Jul 2019 20:43:15 -0700 (PDT)
Received: from localhost.localdomain (d75-157-157-79.bchsia.telus.net. [75.157.157.79])
        by smtp.gmail.com with ESMTPSA id y133sm4004918pfb.28.2019.07.10.20.43.14
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 10 Jul 2019 20:43:14 -0700 (PDT)
From:   Lukas Rusak <lorusak@gmail.com>
To:     linux-input@vger.kernel.org
Subject: [PATCH] HID: add ouya controller driver
Date:   Wed, 10 Jul 2019 20:43:13 -0700
Message-Id: <20190711034313.32178-1-lorusak@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This driver is a simple implementation to get the controller working and
mapped properly. The original driver was taken from from the ouya linux
tree with the original authors permission.

Signed-off-by: Lukas Rusak <lorusak@gmail.com>
---
 drivers/hid/Kconfig      |   8 +-
 drivers/hid/Makefile     |   1 +
 drivers/hid/hid-ids.h    |   3 +
 drivers/hid/hid-ouya.c   | 259 +++++++++++++++++++++++++++++++++++++++
 drivers/hid/hid-quirks.c |   3 +
 5 files changed, 273 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hid/hid-ouya.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 3872e03d9a59..f095a52d82d7 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -717,6 +717,12 @@ config HID_ORTEK
 	   - Ortek WKB-2000
 	   - Skycable wireless presenter
 
+config HID_OUYA
+	tristate "OUYA Game Controller"
+	depends on HID
+	help
+	Say Y here if you have an Ouya controller and want to enable support for it.
+
 config HID_PANTHERLORD
 	tristate "Pantherlord/GreenAsia game controller"
 	depends on HID
@@ -882,7 +888,7 @@ config HID_SONY
 	  * Logitech Harmony adapter for Sony Playstation 3 (Bluetooth)
 
 config SONY_FF
-	bool "Sony PS2/3/4 accessories force feedback support" 
+	bool "Sony PS2/3/4 accessories force feedback support"
 	depends on HID_SONY
 	select INPUT_FF_MEMLESS
 	---help---
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index cc5d827c9164..a258efa4c0d3 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -75,6 +75,7 @@ obj-$(CONFIG_HID_MULTITOUCH)	+= hid-multitouch.o
 obj-$(CONFIG_HID_NTI)			+= hid-nti.o
 obj-$(CONFIG_HID_NTRIG)		+= hid-ntrig.o
 obj-$(CONFIG_HID_ORTEK)		+= hid-ortek.o
+obj-$(CONFIG_HID_OUYA)		+= hid-ouya.o
 obj-$(CONFIG_HID_PRODIKEYS)	+= hid-prodikeys.o
 obj-$(CONFIG_HID_PANTHERLORD)	+= hid-pl.o
 obj-$(CONFIG_HID_PENMOUNT)	+= hid-penmount.o
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index b032d3899fa3..5a5f9f2ea515 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -899,6 +899,9 @@
 #define USB_DEVICE_ID_ORTEK_WKB2000	0x2000
 #define USB_DEVICE_ID_ORTEK_IHOME_IMAC_A210S	0x8003
 
+#define USB_VENDOR_ID_OUYA 0x2836
+#define USB_DEVICE_ID_OUYA_CONTROLLER 0x0001
+
 #define USB_VENDOR_ID_PLANTRONICS	0x047f
 
 #define USB_VENDOR_ID_PANASONIC		0x04da
diff --git a/drivers/hid/hid-ouya.c b/drivers/hid/hid-ouya.c
new file mode 100644
index 000000000000..b062e9baebe3
--- /dev/null
+++ b/drivers/hid/hid-ouya.c
@@ -0,0 +1,259 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  HID driver for OUYA Game Controller(s)
+ *
+ *  Copyright (c) 2013 OUYA
+ *  Copyright (c) 2013 Gregorios Leach <optikflux@gmail.com>
+ *  Copyright (c) 2018 Lukas Rusak <lorusak@gmail.com>
+ */
+
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/input.h>
+#include <linux/module.h>
+
+#include "hid-ids.h"
+
+#define OUYA_TOUCHPAD_FIXUP	(1 << 0)
+
+struct ouya_sc {
+	unsigned long quirks;
+};
+
+/* Fixed report descriptor */
+static __u8 ouya_rdesc_fixed[] = {
+
+	0x05, 0x01,         /*  Usage Page (Desktop),           */
+	0x09, 0x05,         /*  Usage (Game Pad),               */
+
+	0xA1, 0x01,         /*  Collection (Application),       */
+	0x85, 0x07,         /*      Report ID (7),              */
+
+	0xA1, 0x00,         /*      Collection (Physical),      */
+	0x09, 0x30,         /*          Usage (X),              */
+	0x09, 0x31,         /*          Usage (Y),              */
+	0x15, 0x00,         /*          Logical Minimum (0),    */
+	0x26, 0xFF, 0x00,   /*          Logical Maximum (255),  */
+	0x35, 0x00,         /*          Physical Minimum (0),   */
+	0x46, 0xFF, 0x00,   /*          Physical Maximum (255), */
+	0x95, 0x02,         /*          Report Count (2),       */
+	0x75, 0x08,         /*          Report Size (8),        */
+	0x81, 0x02,         /*          Input (Variable),       */
+	0xC0,               /*      End Collection,             */
+
+	0xA1, 0x00,         /*      Collection (Physical),      */
+	0x09, 0x33,         /*          Usage (Rx),             */
+	0x09, 0x34,         /*          Usage (Ry),             */
+	0x15, 0x00,         /*          Logical Minimum (0),    */
+	0x26, 0xFF, 0x00,   /*          Logical Maximum (255),  */
+	0x35, 0x00,         /*          Physical Minimum (0),   */
+	0x46, 0xFF, 0x00,   /*          Physical Maximum (255), */
+	0x95, 0x02,         /*          Report Count (2),       */
+	0x75, 0x08,         /*          Report Size (8),        */
+	0x81, 0x02,         /*          Input (Variable),       */
+	0xC0,               /*      End Collection,             */
+
+	0xA1, 0x00,         /*      Collection (Physical),      */
+	0x09, 0x32,         /*          Usage (Z),              */
+	0x15, 0x00,         /*          Logical Minimum (0),    */
+	0x26, 0xFF, 0x00,   /*          Logical Maximum (255),  */
+	0x35, 0x00,         /*          Physical Minimum (0),   */
+	0x46, 0xFF, 0x00,   /*          Physical Maximum (255), */
+	0x95, 0x01,         /*          Report Count (1),       */
+	0x75, 0x08,         /*          Report Size (8),        */
+	0x81, 0x02,         /*          Input (Variable),       */
+	0xC0,               /*      End Collection,             */
+
+	0xA1, 0x00,         /*      Collection (Physical),      */
+	0x09, 0x35,         /*          Usage (Rz),             */
+	0x15, 0x00,         /*          Logical Minimum (0),    */
+	0x26, 0xFF, 0x00,   /*          Logical Maximum (255),  */
+	0x35, 0x00,         /*          Physical Minimum (0),   */
+	0x46, 0xFF, 0x00,   /*          Physical Maximum (255), */
+	0x95, 0x01,         /*          Report Count (1),       */
+	0x75, 0x08,         /*          Report Size (8),        */
+	0x81, 0x02,         /*          Input (Variable),       */
+	0xC0,               /*      End Collection,             */
+
+	0x05, 0x09,         /*      Usage Page (Button),        */
+	0x19, 0x01,         /*      Usage Minimum (01h),        */
+	0x29, 0x10,         /*      Usage Maximum (10h),        */
+	0x95, 0x10,         /*      Report Count (16),          */
+	0x75, 0x01,         /*      Report Size (1),            */
+	0x81, 0x02,         /*      Input (Variable),           */
+
+	/*   ORIGINAL REPORT DESCRIPTOR FOR TOUCHPAD INPUT  */
+	/* 06 00 ff a1 02 09 02 15 00 26 ff 00 35 00 46 ff 00 95 03 75 08 81 02 c0 */
+
+	0x06, 0x00, 0xFF,   /*      Usage Page (Custom),        */
+	0x09, 0x02,         /*      Usage (Mouse),              */
+	0x09, 0x01,         /*      Usage (Pointer),            */
+	0xA1, 0x00,         /*      Collection (Physical),      */
+	0x05, 0x09,         /*          Usage Page (Button),    */
+	0x19, 0x01,         /*          Usage Minimum (01h),    */
+	0x29, 0x03,         /*          Usage Maximum (03h),    */
+	0x15, 0x00,         /*          Logical Minimum (0),    */
+	0x25, 0x01,         /*          Logical Maximum (1),    */
+	0x95, 0x03,         /*          Report Count (3),       */
+	0x75, 0x01,         /*          Report Size (1),        */
+	0x81, 0x02,         /*          Input (Variable),       */
+	0x95, 0x01,         /*          Report Count (1),       */
+	0x75, 0x05,         /*          Report Size (5),        */
+	0x81, 0x01,         /*          Input (Constant),       */
+	0x05, 0x01,         /*          Usage Page (Desktop),   */
+	0x09, 0x30,         /*          Usage (X),              */
+	0x09, 0x31,         /*          Usage (Y),              */
+	0x15, 0x81,         /*          Logical Minimum (-127), */
+	0x25, 0x7f,         /*          Logical Maximum (127),  */
+	0x95, 0x02,         /*          Report Count (2),       */
+	0x75, 0x08,         /*          Report Size (8),        */
+	0x81, 0x06,         /*          Input (Relative),       */
+	0xC0,               /*      End Collection,             */
+
+	0x06, 0x00, 0xFF,   /*      Usage Page (Custom),        */
+	0xA1, 0x02,         /*      Collection (Logical),       */
+	0x75, 0x08,         /*          Report Size (8),        */
+	0x95, 0x07,         /*          Report Count (7),       */
+	0x46, 0xFF, 0x00,   /*          Physical Maximum (255), */
+	0x26, 0xFF, 0x00,   /*          Logical Maximum (255),  */
+	0x09, 0x01,         /*          Usage (Pointer),        */
+	0x91, 0x02,         /*          Output (Variable),      */
+	0xC0,               /*      End Collection,             */
+
+	0xC0,               /*  End Collection                  */
+
+
+	0x06, 0x00, 0xFF,   /*  Usage Page (Custom),            */
+	0x05, 0x0C,         /*  Usage Page (Consumer),          */
+	0x09, 0x01,         /*  Usage (Consumer Control),       */
+
+	0xA1, 0x01,         /*  Collection (Application),       */
+	0x85, 0x03,         /*      Report ID (3),              */
+	0x05, 0x01,         /*      Usage Page (Desktop),       */
+	0x09, 0x06,         /*      Usage (Keyboard),           */
+	0xA1, 0x02,         /*      Collection (Logical),       */
+	0x05, 0x06,         /*          Usage Page (Generic),   */
+	0x09, 0x20,         /*          Usage (Battery Strgth), */
+	0x15, 0x00,         /*          Logical Minimum (0),    */
+	0x26, 0xFF, 0x00,   /*          Logical Maximum (255),  */
+	0x75, 0x08,         /*          Report Size (8),        */
+	0x95, 0x01,         /*          Report Count (1),       */
+	0x81, 0x02,         /*          Input (Variable),       */
+	0x06, 0xBC, 0xFF,   /*          Usage Page (Custom),    */
+
+	0x0A, 0xAD, 0xBD,   /*  UNKNOWN */
+
+	0x75, 0x08,         /*          Report Size (8),        */
+	0x95, 0x06,         /*          Report Count (6),       */
+	0x81, 0x02,         /*          Input (Variable),       */
+	0xC0,               /*      End Collection,             */
+
+	0xC0,               /*  End Collection                  */
+
+	0x00
+};
+
+static __u8 *ouya_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+		unsigned int *rsize)
+{
+	struct ouya_sc *sc = hid_get_drvdata(hdev);
+
+	if (sc->quirks & OUYA_TOUCHPAD_FIXUP) {
+		rdesc = ouya_rdesc_fixed;
+		*rsize = sizeof(ouya_rdesc_fixed);
+	}
+	return rdesc;
+}
+
+static int ouya_input_mapping(struct hid_device *hdev, struct hid_input *hi,
+		struct hid_field *field, struct hid_usage *usage,
+		unsigned long **bit, int *max)
+{
+	struct ouya_sc *sc = hid_get_drvdata(hdev);
+
+	if (!(sc->quirks & OUYA_TOUCHPAD_FIXUP))
+		return 0;
+
+	if ((usage->hid & 0x90000) == 0x90000 &&
+		(field->physical & 0xff000000) == 0xff000000 &&
+		usage->collection_index == 5 &&
+		field->report_count == 3) {
+
+		hid_map_usage_clear(hi, usage, bit, max, EV_KEY,
+				BTN_MOUSE + (usage->hid - 0x90001));
+
+		return 1;
+	}
+
+	return 0;
+}
+
+static int ouya_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	int ret;
+	struct ouya_sc *sc;
+
+	sc = kzalloc(sizeof(*sc), GFP_KERNEL);
+	if (sc == NULL)
+		return -ENOMEM;
+
+	if (((hdev->version & 0xff00) == 0x0100 &&
+		(hdev->version & 0xff) >= 0x04) ||
+		((hdev->version & 0xff00) == 0xe100 &&
+		(hdev->version & 0xff) >= 0x3a)) {
+
+		hid_info(hdev, "ouya controller - new version\n");
+		sc->quirks = OUYA_TOUCHPAD_FIXUP;
+	} else {
+		sc->quirks = 0;
+	}
+
+	hid_set_drvdata(hdev, sc);
+
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "parse failed\n");
+		goto err_free;
+	}
+
+	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT |
+			HID_CONNECT_HIDDEV_FORCE);
+	if (ret) {
+		hid_err(hdev, "hw start failed\n");
+		goto err_free;
+	}
+
+	return 0;
+
+err_free:
+	kfree(sc);
+	return ret;
+}
+
+static void ouya_remove(struct hid_device *hdev)
+{
+	hid_hw_stop(hdev);
+	kfree(hid_get_drvdata(hdev));
+}
+
+static const struct hid_device_id ouya_devices[] = {
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_OUYA, USB_DEVICE_ID_OUYA_CONTROLLER) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, ouya_devices);
+
+static struct hid_driver ouya_driver = {
+	.name = "ouya",
+	.id_table = ouya_devices,
+	.input_mapping = ouya_input_mapping,
+	.probe = ouya_probe,
+	.remove = ouya_remove,
+	.report_fixup = ouya_report_fixup,
+};
+
+module_hid_driver(ouya_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Lukas Rusak <lorusak@gmail.com>");
+MODULE_AUTHOR("Gregorios Leach <optikflux@gmail.com>");
+MODULE_DESCRIPTION("Ouya Controller Driver");
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 671a285724f9..9bdc493dad5c 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -531,6 +531,9 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ORTEK, USB_DEVICE_ID_ORTEK_IHOME_IMAC_A210S) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SKYCABLE, USB_DEVICE_ID_SKYCABLE_WIRELESS_PRESENTER) },
 #endif
+#if IS_ENABLED(CONFIG_HID_OUYA)
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_OUYA, USB_DEVICE_ID_OUYA_CONTROLLER) },
+#endif
 #if IS_ENABLED(CONFIG_HID_PANTHERLORD)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_GAMERON, USB_DEVICE_ID_GAMERON_DUAL_PSX_ADAPTOR) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_GAMERON, USB_DEVICE_ID_GAMERON_DUAL_PCS_ADAPTOR) },
-- 
2.21.0

