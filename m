Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503DC40EB2B
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 21:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233882AbhIPTzi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 15:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235479AbhIPTzi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 15:55:38 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56353C061756;
        Thu, 16 Sep 2021 12:54:17 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id x27so23134336lfu.5;
        Thu, 16 Sep 2021 12:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=CFqQ+K+fPr0Rm6OCs/EUkPShOnFG2Gl4wQSnJsaCPrs=;
        b=Q6TSc/oUkmaCQ/P4z0L1RYfRTDTdMFN7epoXbxPi8T3Q8agC4MbPtcNFg+8tmWW32x
         rPN0oLsiMSf3LwnRFHlk3qBgl03+ZY4qyT3dUBC03+w8plQIbbO3fKjYn9KDU9Krisnn
         n1C4ZHRF3IojGyQ9bW/iRnTVtMqS7UTnz5Um6P04FMRUcAROFkudT9VNpsU3MelAMsdK
         RTVIRvUfbowb4eoMc6+Jv5D9w221DYjwk812AxFdPTSTJzjv5Ts684CXfhBm6eC7RZu0
         4oOByF8NSNiWIFUkT3Pyu2Bh2YVavWW/nmlMOemQkofeD+q0i3/Gt8IKri95IkCFkQyT
         arwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=CFqQ+K+fPr0Rm6OCs/EUkPShOnFG2Gl4wQSnJsaCPrs=;
        b=DmThOcRLQfKbKzXnzPrJMT43Pu4LTNXQBMP7mBN4qsnyhnbae7ojIitCJksDNwmppJ
         2efM59MaHRSM6vCzOZxQ0RLj49WhcpDy0evcwPQlyHj8Lg8Xyjvj+8wmJUNQlW5ZN28S
         9YXKZR4nLk9YQmj5FXMR6eOe2w1WgMuBC2pfGdW88CcwFM/tXC+eHzY+u4mK28iFUR/R
         MA4LjVvum4p4iRcM08j65OB25BMV1YPCwx5/Y+WEbRjEGBsgQwWi//5iYHrZVK9YvP1u
         ntqPFUwmhUepmNYGb8PCFXq2Y1TUJ4MbwGSvqkQkOB15g1uiMWrxHnf9NAAf6xOmYPuK
         hTww==
X-Gm-Message-State: AOAM530NP8X8tIw12gmwadp+AsJTs/h98IsCw64rptTSCPTJwB52aumb
        XW8u03hcHlbnJNUtNL7gCpRHg6l3fLeQFQ==
X-Google-Smtp-Source: ABdhPJwNZ7Ks94D9WK+/HF9ZKqfV++Twx825itt8VJ7GHOM5QPRZ+ETCWFLwjll4oJMgtJOdyOqeUQ==
X-Received: by 2002:ac2:4f02:: with SMTP id k2mr5416567lfr.472.1631822055592;
        Thu, 16 Sep 2021 12:54:15 -0700 (PDT)
Received: from ilya-330s ([93.157.255.113])
        by smtp.gmail.com with ESMTPSA id z8sm339969lfs.177.2021.09.16.12.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 12:54:15 -0700 (PDT)
Date:   Thu, 16 Sep 2021 22:54:13 +0300
From:   Ilya Skriblovsky <ilyaskriblovsky@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH] Support for side buttons of Xiaomi Mi Dual Mode Wireless
 Mouse Silent Edition
Message-ID: <YUOg5aDkO0lp7eM8@ilya-330s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

Please take a look on my patch that enables side-buttons of Xiaomi
Bluetooth mouse (specifially Xiaomi Mi Dual Mode Wireless Mouse Silent
Edition).

The mouse sends invalid button count in its HID Report Descriptor and
this patch just replaces its descriptor with corrected one. With this
driver side buttons work as expected acting like Back/Forward buttons.

Best regards,
  Ilya

Signed-off-by: Ilya Skriblovsky <ilyaskriblovsky@gmail.com>
---
 drivers/hid/Kconfig      |   7 +++
 drivers/hid/Makefile     |   1 +
 drivers/hid/hid-xiaomi.c | 103 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+)
 create mode 100644 drivers/hid/hid-xiaomi.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 76937f716fbe..d09abc63290e 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -467,6 +467,13 @@ config HID_VIEWSONIC
 	help
 	  Support for ViewSonic/Signotec PD1011 signature pad.
 
+config HID_XIAOMI:
+	tristate "Xiaomi"
+	depends on HID
+	help
+	Adds support for side buttons of Xiaomi Mi Dual Mode Wireless
+	Mouse Silent Edition
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
diff --git a/drivers/hid/hid-xiaomi.c b/drivers/hid/hid-xiaomi.c
new file mode 100644
index 000000000000..56e8edd3d62f
--- /dev/null
+++ b/drivers/hid/hid-xiaomi.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * HID driver for Xiaomi Mi Dual Mode Wireless Mouse Silent Edition
+ *
+ * Copyright (c) 2021 Ilya Skriblovsky
+ */
+
+/*
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the Free
+ * Software Foundation; either version 2 of the License, or (at your option)
+ * any later version.
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/hid.h>
+
+#define USB_VENDOR_ID_XIAOMI    0x2717
+#define USB_DEVICE_ID_MI_SILENT_MOUSE   0x5014
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

