Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7172A48FDA2
	for <lists+linux-input@lfdr.de>; Sun, 16 Jan 2022 16:34:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235444AbiAPPek (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Jan 2022 10:34:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235433AbiAPPej (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Jan 2022 10:34:39 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81394C061574
        for <linux-input@vger.kernel.org>; Sun, 16 Jan 2022 07:34:39 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id q25so54933025edb.2
        for <linux-input@vger.kernel.org>; Sun, 16 Jan 2022 07:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vdwaa-nl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UdwV+h3hVVM0sGxE88nSRV7oFGY0kk3CRQLtC/dtTP8=;
        b=x3f6cZ+GUpZCoS7BR+mpSWse8I/ls32ZLJ8RpMjsRB9xPFU4dot20bOL5JvlZKGhTv
         nRmbPnscXpd6xdSc7fkZl6LEaL5OQ/i2quh3VejuRadvBH8561jRNyebM5oCFL25GUUM
         2LsfXaJosEK7WPx4Jtas04woKhTfjIQPEl6JmpHmqNmDahe2wZFZqfHzFLmA737RdiE2
         J62P88d5nzhlgj55JXi9koZQ4BOQTSnvnUy9SAbMkXQ+iQ0/AWIFujbpYCB3b+AuPM9f
         YE/BO/KaiWRPPGA8iZ0ORCod13L+sImTs5dKl+2mZ9I6b9yFLQBP+Jg/8f1qEjH1yOAC
         VsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UdwV+h3hVVM0sGxE88nSRV7oFGY0kk3CRQLtC/dtTP8=;
        b=oW2CAxKwjb6YoztxMTSwUkhgbdVrS53UVrpvodTCYC5+do1qf1GMawsLMEGGnTCUgC
         xWM+NsZXo3+Y7tcJJcmrsSBN7NDqesO5qlTGc4X6g1jV/35+McR6f+3g6G47vJuW7llk
         6ktfMyPayfNGI5bZFcWFnmh6P79aPG2x0yAw16FoJT2gsyW1juV/wS74dJpdSIe/4+sb
         472O1V/zdbl/InlQHUDNGBSt7fm4e3GuIo1eUIIHzF64fMIBw0xhP2ZPrlWRDNgM0mQk
         nR0jK+CoAxxJWkLsvG3bl9160bbLWSLqjNzWNLuNguUrW1US/LzTLo2rSLKk7Z+2ydDB
         bCwQ==
X-Gm-Message-State: AOAM53260JbQui7/bvCMKP+bTsvBOt/euezR6YpPlwnbVeRxKrR7EjrX
        wJhaucFt5nHoNCe7EOAGLqdUXg==
X-Google-Smtp-Source: ABdhPJxaghh9NK6dhHtUaKXJQbAEZeXFkK+383aws7+4UvSQFoEAhdQOH/0aJb42L4Rc/GquQKBEPQ==
X-Received: by 2002:a17:907:b0b:: with SMTP id h11mr14170317ejl.50.1642347277638;
        Sun, 16 Jan 2022 07:34:37 -0800 (PST)
Received: from localhost.localdomain (83-84-17-34.cable.dynamic.v4.ziggo.nl. [83.84.17.34])
        by smtp.gmail.com with ESMTPSA id s16sm4635840edt.30.2022.01.16.07.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jan 2022 07:34:36 -0800 (PST)
From:   Jelle van der Waa <jelle@vdwaa.nl>
X-Google-Original-From: Jelle van der Waa
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jelle van der Waa <jvanderwaa@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH v2] HID: Add driver for Razer Blackwidow keyboards
Date:   Sun, 16 Jan 2022 16:34:25 +0100
Message-Id: <20220116153425.441642-1-jvanderwaa@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211231112500.8350-1-jvanderwaa@redhat.com>
References: <20211231112500.8350-1-jvanderwaa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jelle van der Waa <jvanderwaa@redhat.com>

Add a driver to enable the macro keys (M1 - M5) by default, these are
mapped to XF86Tools and XF86Launch5 - XF86Launch8. The driver remaps
them by default to macro keys with an option to retain the old mapping
which users most likely already use as there are many scripts to enable
the macro keys available on Github and other websites.

Signed-off-by: Jelle van der Waa <jvanderwaa@redhat.com>

---

* Rename to hid-razer
* Rename RAZOR to RAZER
---
 drivers/hid/Kconfig     |   7 +++
 drivers/hid/Makefile    |   1 +
 drivers/hid/hid-ids.h   |   3 +
 drivers/hid/hid-razer.c | 122 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 133 insertions(+)
 create mode 100644 drivers/hid/hid-razer.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index f5544157576c..66a5200ce83a 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -929,6 +929,13 @@ config PLAYSTATION_FF
 	  Say Y here if you would like to enable force feedback support for
 	  PlayStation game controllers.
 
+config HID_RAZER
+	tristate "Razer non-fully HID-compliant devices"
+	depends on HID
+	help
+	Support for Razer devices that are not fully compliant with the
+	HID standard.
+
 config HID_PRIMAX
 	tristate "Primax non-fully HID-compliant devices"
 	depends on HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 6d3e630e81af..501731380f1f 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -99,6 +99,7 @@ hid-picolcd-$(CONFIG_DEBUG_FS)		+= hid-picolcd_debugfs.o
 obj-$(CONFIG_HID_PLANTRONICS)	+= hid-plantronics.o
 obj-$(CONFIG_HID_PLAYSTATION)	+= hid-playstation.o
 obj-$(CONFIG_HID_PRIMAX)	+= hid-primax.o
+obj-$(CONFIG_HID_RAZER)	+= hid-razer.o
 obj-$(CONFIG_HID_REDRAGON)	+= hid-redragon.o
 obj-$(CONFIG_HID_RETRODE)	+= hid-retrode.o
 obj-$(CONFIG_HID_ROCCAT)	+= hid-roccat.o hid-roccat-common.o \
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 26cee452ec44..f5b013d99428 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1029,6 +1029,9 @@
 #define I2C_PRODUCT_ID_RAYDIUM_3118	0x3118
 
 #define USB_VENDOR_ID_RAZER            0x1532
+#define USB_DEVICE_ID_RAZER_BLACKWIDOW_ULTIMATE   0x010D
+#define USB_DEVICE_ID_RAZER_BLACKWIDOW            0x010e
+#define USB_DEVICE_ID_RAZER_BLACKWIDOW_CLASSIC    0x011b
 #define USB_DEVICE_ID_RAZER_BLADE_14   0x011D
 
 #define USB_VENDOR_ID_REALTEK		0x0bda
diff --git a/drivers/hid/hid-razer.c b/drivers/hid/hid-razer.c
new file mode 100644
index 000000000000..381b80b479c6
--- /dev/null
+++ b/drivers/hid/hid-razer.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *  HID driver for gaming keys on Razer Blackwidow gaming keyboards
+ *  Macro Key Keycodes: M1 = 191, M2 = 192, M3 = 193, M4 = 194, M5 = 195
+ *
+ *  Copyright (c) 2021 Jelle van der Waa <jvanderwaa@redhat.com>
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
+#define map_key_clear(c) hid_map_usage_clear(hi, usage, bit, max, EV_KEY, (c))
+
+#define RAZER_BLACKWIDOW_TRANSFER_BUF_SIZE	91
+
+static bool macro_key_remapping = 1;
+module_param(macro_key_remapping, bool, 0644);
+MODULE_PARM_DESC(macro_key_remapping, " on (Y) off (N)");
+
+
+static unsigned char blackwidow_init[RAZER_BLACKWIDOW_TRANSFER_BUF_SIZE] = {
+	0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x04,
+	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x04, 0x00
+};
+
+static int razer_input_mapping(struct hid_device *hdev,
+		struct hid_input *hi, struct hid_field *field,
+		struct hid_usage *usage, unsigned long **bit, int *max)
+{
+
+	if (!macro_key_remapping)
+		return 0;
+
+	if ((usage->hid & HID_UP_KEYBOARD) != HID_UP_KEYBOARD)
+		return 0;
+
+	switch (usage->hid & ~HID_UP_KEYBOARD) {
+	case 0x68:
+		map_key_clear(KEY_MACRO1);
+		return 1;
+	case 0x69:
+		map_key_clear(KEY_MACRO2);
+		return 1;
+	case 0x6a:
+		map_key_clear(KEY_MACRO3);
+		return 1;
+	case 0x6b:
+		map_key_clear(KEY_MACRO4);
+		return 1;
+	case 0x6c:
+		map_key_clear(KEY_MACRO5);
+		return 1;
+	}
+
+	return 0;
+}
+
+static int razer_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	char *buf;
+	int ret = 0;
+
+	ret = hid_parse(hdev);
+	if (ret)
+		return ret;
+
+	// Only send the enable macro keys command for the third device identified as mouse input.
+	if (hdev->type == HID_TYPE_USBMOUSE) {
+		buf = kmemdup(blackwidow_init, RAZER_BLACKWIDOW_TRANSFER_BUF_SIZE, GFP_KERNEL);
+		if (buf == NULL)
+			return -ENOMEM;
+
+		ret = hid_hw_raw_request(hdev, 0, buf, RAZER_BLACKWIDOW_TRANSFER_BUF_SIZE,
+				HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
+		if (ret != RAZER_BLACKWIDOW_TRANSFER_BUF_SIZE)
+			hid_err(hdev, "failed to enable macro keys: %d\n", ret);
+
+		kfree(buf);
+	}
+
+	return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+}
+
+static const struct hid_device_id razer_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_RAZER,
+		USB_DEVICE_ID_RAZER_BLACKWIDOW) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_RAZER,
+		USB_DEVICE_ID_RAZER_BLACKWIDOW_CLASSIC) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_RAZER,
+		USB_DEVICE_ID_RAZER_BLACKWIDOW_ULTIMATE) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, razer_devices);
+
+static struct hid_driver razer_driver = {
+	.name = "razer",
+	.id_table = razer_devices,
+	.input_mapping = razer_input_mapping,
+	.probe = razer_probe,
+};
+module_hid_driver(razer_driver);
+
+MODULE_AUTHOR("Jelle van der Waa <jvanderwaa@redhat.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1

