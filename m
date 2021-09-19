Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF73410B34
	for <lists+linux-input@lfdr.de>; Sun, 19 Sep 2021 13:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbhISLOJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Sep 2021 07:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhISLOI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Sep 2021 07:14:08 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E322C061574;
        Sun, 19 Sep 2021 04:12:43 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i25so54644649lfg.6;
        Sun, 19 Sep 2021 04:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=j8QaTxxQxyImn6EDWqOWwZnyqhdFGAgsCjs4X0yKWAU=;
        b=QmlUPbVT/KiITNNAlk9/z03jbiqvH6Xaq9bmj11jBnElyIO8Opk3NL/u3TFoeXIRd0
         tvHf432I0CwDsZH0suk/CdCBKtpowJYaSnzeqIAviheMwVDypY8E3+FtD5NgXZvvquF5
         GyRwdCR5kOncdhDaEAVbYfallDaGV+Da2rpnkn5aeBiwi6r8FfoQeNatU0vCO1mSXBYS
         /UlqkwwO4NJC+b6HWCzH1oCAXJa5U+lggDZvj0KhAmwgNc89t42M4gTmw+rXVKkzqfMR
         RPBf7zyy3wh2K2WC6210Ku4TXv6/cNf+P5OAL6ZTpu7vqcuLwSSU3huoq4rjhmgQgaTz
         G0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=j8QaTxxQxyImn6EDWqOWwZnyqhdFGAgsCjs4X0yKWAU=;
        b=XA77MsfLKu9nTifkJfkQDbF82mUjP/Oyj/JUoJOsBKCNRs9vBj037YLTWyS3dEVUeD
         MJypf1R1zitlVd4Nrt8k8LChHJ083CDx7ndQi1ci7cRB0A51ctFOBaCWwM+cN6uL0oBb
         HNYQAXWeJorVTji/WMdMv0M0NlTP1KcLi6FufwxcjkMonkoTw5EKilMBQ7UnmG+NrCOP
         TNeHYYZAk1ZhDSOy7NquUUqOnFeq6BDfYr7vEPlnFuW5t85ZiW9sT+JKHkDNEaXt6xG5
         r4u6Aa9oO9fYEg5IaX6gDcUI6ovA/eo7AFQadsXG53MNZc1VVQpoLzh5B9hDv3aHeiYM
         BjHg==
X-Gm-Message-State: AOAM531yWf/Zem1Z7f+UtXUi7L21HDpCEfDza8Oh99Av+e6bMiva924J
        x/57yB0Xa8nY+5ra/LANWp8TyeGlp8ixtg==
X-Google-Smtp-Source: ABdhPJwAGreJjovH380koy5VgbbJQYUVIqiwH9tmMHM+2Q5YjnhtK66pdcYj943Mj+7SHxgIFus8ew==
X-Received: by 2002:a2e:9a58:: with SMTP id k24mr17853221ljj.496.1632049961255;
        Sun, 19 Sep 2021 04:12:41 -0700 (PDT)
Received: from ilya-330s ([93.157.255.113])
        by smtp.gmail.com with ESMTPSA id s8sm667848ljh.79.2021.09.19.04.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 04:12:40 -0700 (PDT)
Date:   Sun, 19 Sep 2021 14:12:36 +0300
From:   Ilya Skriblovsky <ilyaskriblovsky@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v3] Support for side buttons of Xiaomi Mi Dual Mode Wireless
 Mouse Silent Edition
Message-ID: <YUcbJFPUzt82vil7@ilya-330s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch enables side-buttons of Xiaomi Bluetooth mouse (specifically
Xiaomi Mi Dual Mode Wireless Mouse Silent Edition).

The mouse sends invalid button count in its HID Report Descriptor and
this patch just replaces its descriptor with corrected one. With this
driver side buttons work as expected acting like Back/Forward buttons.

Signed-off-by: Ilya Skriblovsky <ilyaskriblovsky@gmail.com>
---
Changes since v2:
 - Vendor ID and Device ID moved to hid-ids.h
 - Removed unneeded license blurb

Changes since v1:
 - Fixed syntax of Kconfig
---
 drivers/hid/Kconfig      |  7 +++
 drivers/hid/Makefile     |  1 +
 drivers/hid/hid-ids.h    |  3 ++
 drivers/hid/hid-xiaomi.c | 94 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 105 insertions(+)
 create mode 100644 drivers/hid/hid-xiaomi.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 76937f716fbe..cc0d3169fe75 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -467,6 +467,13 @@ config HID_VIEWSONIC
 	help
 	  Support for ViewSonic/Signotec PD1011 signature pad.
 
+config HID_XIAOMI
+	tristate "Xiaomi"
+	depends on HID
+	help
+	  Adds support for side buttons of Xiaomi Mi Dual Mode Wireless
+	  Mouse Silent Edition.
+
 config HID_GYRATION
 	tristate "Gyration remote control"
 	depends on HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 1ea1a7c0b20f..c89a25b9c4b9 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -126,6 +126,7 @@ hid-uclogic-objs		:= hid-uclogic-core.o \
 obj-$(CONFIG_HID_UCLOGIC)	+= hid-uclogic.o
 obj-$(CONFIG_HID_UDRAW_PS3)	+= hid-udraw-ps3.o
 obj-$(CONFIG_HID_LED)		+= hid-led.o
+obj-$(CONFIG_HID_XIAOMI)	+= hid-xiaomi.o
 obj-$(CONFIG_HID_XINMO)		+= hid-xinmo.o
 obj-$(CONFIG_HID_ZEROPLUS)	+= hid-zpff.o
 obj-$(CONFIG_HID_ZYDACRON)	+= hid-zydacron.o
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 8f1893e68112..3d095ad2407e 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1295,6 +1295,9 @@
 #define USB_VENDOR_ID_XAT	0x2505
 #define USB_DEVICE_ID_XAT_CSR	0x0220
 
+#define USB_VENDOR_ID_XIAOMI		0x2717
+#define USB_DEVICE_ID_MI_SILENT_MOUSE	0x5014
+
 #define USB_VENDOR_ID_XIN_MO			0x16c0
 #define USB_DEVICE_ID_XIN_MO_DUAL_ARCADE	0x05e1
 #define USB_DEVICE_ID_THT_2P_ARCADE		0x75e1
diff --git a/drivers/hid/hid-xiaomi.c b/drivers/hid/hid-xiaomi.c
new file mode 100644
index 000000000000..a97a90afad33
--- /dev/null
+++ b/drivers/hid/hid-xiaomi.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * HID driver for Xiaomi Mi Dual Mode Wireless Mouse Silent Edition
+ *
+ * Copyright (c) 2021 Ilya Skriblovsky
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/hid.h>
+
+#include "hid-ids.h"
+
+/* Fixed Mi Silent Mouse report descriptor */
+/* Button's Usage Maximum changed from 3 to 5 to make side buttons work */
+#define MI_SILENT_MOUSE_ORIG_RDESC_LENGTH   87
+static __u8 mi_silent_mouse_rdesc_fixed[] = {
+	0x05, 0x01,         /*  Usage Page (Desktop),               */
+	0x09, 0x02,         /*  Usage (Mouse),                      */
+	0xA1, 0x01,         /*  Collection (Application),           */
+	0x85, 0x03,         /*      Report ID (3),                  */
+	0x09, 0x01,         /*      Usage (Pointer),                */
+	0xA1, 0x00,         /*      Collection (Physical),          */
+	0x05, 0x09,         /*          Usage Page (Button),        */
+	0x19, 0x01,         /*          Usage Minimum (01h),        */
+	0x29, 0x05, /* X */ /*          Usage Maximum (05h),        */
+	0x15, 0x00,         /*          Logical Minimum (0),        */
+	0x25, 0x01,         /*          Logical Maximum (1),        */
+	0x75, 0x01,         /*          Report Size (1),            */
+	0x95, 0x05,         /*          Report Count (5),           */
+	0x81, 0x02,         /*          Input (Variable),           */
+	0x75, 0x03,         /*          Report Size (3),            */
+	0x95, 0x01,         /*          Report Count (1),           */
+	0x81, 0x01,         /*          Input (Constant),           */
+	0x05, 0x01,         /*          Usage Page (Desktop),       */
+	0x09, 0x30,         /*          Usage (X),                  */
+	0x09, 0x31,         /*          Usage (Y),                  */
+	0x15, 0x81,         /*          Logical Minimum (-127),     */
+	0x25, 0x7F,         /*          Logical Maximum (127),      */
+	0x75, 0x08,         /*          Report Size (8),            */
+	0x95, 0x02,         /*          Report Count (2),           */
+	0x81, 0x06,         /*          Input (Variable, Relative), */
+	0x09, 0x38,         /*          Usage (Wheel),              */
+	0x15, 0x81,         /*          Logical Minimum (-127),     */
+	0x25, 0x7F,         /*          Logical Maximum (127),      */
+	0x75, 0x08,         /*          Report Size (8),            */
+	0x95, 0x01,         /*          Report Count (1),           */
+	0x81, 0x06,         /*          Input (Variable, Relative), */
+	0xC0,               /*      End Collection,                 */
+	0xC0,               /*  End Collection,                     */
+	0x06, 0x01, 0xFF,   /*  Usage Page (FF01h),                 */
+	0x09, 0x01,         /*  Usage (01h),                        */
+	0xA1, 0x01,         /*  Collection (Application),           */
+	0x85, 0x05,         /*      Report ID (5),                  */
+	0x09, 0x05,         /*      Usage (05h),                    */
+	0x15, 0x00,         /*      Logical Minimum (0),            */
+	0x26, 0xFF, 0x00,   /*      Logical Maximum (255),          */
+	0x75, 0x08,         /*      Report Size (8),                */
+	0x95, 0x04,         /*      Report Count (4),               */
+	0xB1, 0x02,         /*      Feature (Variable),             */
+	0xC0                /*  End Collection                      */
+};
+
+static __u8 *xiaomi_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+				 unsigned int *rsize)
+{
+	switch (hdev->product) {
+	case USB_DEVICE_ID_MI_SILENT_MOUSE:
+		if (*rsize == MI_SILENT_MOUSE_ORIG_RDESC_LENGTH) {
+			hid_info(hdev, "fixing up Mi Silent Mouse report descriptor\n");
+			rdesc = mi_silent_mouse_rdesc_fixed;
+			*rsize = sizeof(mi_silent_mouse_rdesc_fixed);
+		}
+		break;
+	}
+	return rdesc;
+}
+
+static const struct hid_device_id xiaomi_devices[] = {
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_XIAOMI, USB_DEVICE_ID_MI_SILENT_MOUSE) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, xiaomi_devices);
+
+static struct hid_driver xiaomi_driver = {
+	.name = "xiaomi",
+	.id_table = xiaomi_devices,
+	.report_fixup = xiaomi_report_fixup,
+};
+module_hid_driver(xiaomi_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Ilya Skriblovsky <IlyaSkriblovsky@gmail.com>");
+MODULE_DESCRIPTION("Fixing side buttons of Xiaomi Mi Silent Mouse");
-- 
2.30.2

