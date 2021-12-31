Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 605DF4823A0
	for <lists+linux-input@lfdr.de>; Fri, 31 Dec 2021 12:25:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbhLaLZP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Dec 2021 06:25:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbhLaLZO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Dec 2021 06:25:14 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2857C061574
        for <linux-input@vger.kernel.org>; Fri, 31 Dec 2021 03:25:13 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id z9so38062078edm.10
        for <linux-input@vger.kernel.org>; Fri, 31 Dec 2021 03:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vdwaa-nl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZWrRYjTuK8+TkiCC/kEQQjpggSKJeXy+UjN0CwCT2f0=;
        b=qR1YWbF/27x5DX108E/sDfqfQiY2FO+1NW3/FnN+6IhtSTS4tFzZLyUo22iK3FxLXn
         smLBL2GzfupzCCNqnsqs/ZKFTxUT8DJuje9dHmtDowtRervhr7S24SkLlLtZyeb5t56/
         vf7GFB8+6tbBnikCRdlTRGB49gGAI5cz6M7Cyoo3gjkzFzilhUdUVfP5bTPcmX2e2b5d
         E5o+6yKoAgBO1TWV0eemjgezdK/BX1hZ3xH9lv3IHo24QN3Bwd1XftMrIbxmyEIjohmQ
         p4tIIjpp9L8XT/LLeI99UBdVOjLGXYpCTMOzlcw9C0drMj780IyKfBDlep/CZUptCg4k
         BLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZWrRYjTuK8+TkiCC/kEQQjpggSKJeXy+UjN0CwCT2f0=;
        b=cj8DU0eTflvJeQ/vacca+et6/EPJToq2rVytFK/mNzE+DYQODy4c/RHrg/MTQCUBfM
         KaQzqXnWdXtUu4ltvnb4lBKZDgh8IGsB5WnAwoIJLnJ32rbhqC41xjzBY9dvgBrhHH6u
         /fv5tZMiFDgvD6Su8gZwRTW12rwAVf9dnbsKr4AZ5VKe9HL+msJS5Hu7+yMshmplWTdU
         PzCORpi2QMIIx9pr6lEaAN93Quo/2Ot99Rdd74LLTm2dabIU7rWsVuTeKamaV7ejWhVH
         3y6dj5/vP92Qbb/FM5opVOcxKOoir/6Vn97iJk51ia7BLICaMXKqZvPfGbfZxnM4HXLd
         zdyA==
X-Gm-Message-State: AOAM531NKAgCk0Cqqpt8ZDcpmaEHeaKFvy3K1TQiytZd2WhGwO+mABCw
        uTiZkmotvXcDM8mv4BxNYttXog==
X-Google-Smtp-Source: ABdhPJyR3x6sPRvfjtvio7xbM4b7Hqxr5a7D1Qm8cmTNU1aF7HtSWUD/72WZWkpysx8qyBXXz1KbcQ==
X-Received: by 2002:a17:907:7fa4:: with SMTP id qk36mr27736410ejc.308.1640949912247;
        Fri, 31 Dec 2021 03:25:12 -0800 (PST)
Received: from localhost.localdomain (83-84-17-34.cable.dynamic.v4.ziggo.nl. [83.84.17.34])
        by smtp.gmail.com with ESMTPSA id n25sm10368586eds.9.2021.12.31.03.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Dec 2021 03:25:11 -0800 (PST)
From:   Jelle van der Waa <jelle@vdwaa.nl>
X-Google-Original-From: Jelle van der Waa <jvanderwaa@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jelle van der Waa <jvanderwaa@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH] HID: Add driver for Razer Blackwidow keyboards
Date:   Fri, 31 Dec 2021 12:25:00 +0100
Message-Id: <20211231112500.8350-1-jvanderwaa@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a driver to enable the macro keys (M1 - M5) by default, these are
mapped to XF86Tools and XF86Launch5 - XF86Launch8. The driver remaps
them by default to macro keys with an option to retain the old mapping
which users most likely already use as there are many scripts to enable
the macro keys available on Github and other websites.

Signed-off-by: Jelle van der Waa <jvanderwaa@redhat.com>
---
 drivers/hid/Kconfig                |   7 ++
 drivers/hid/Makefile               |   1 +
 drivers/hid/hid-ids.h              |   3 +
 drivers/hid/hid-razer-blackwidow.c | 122 +++++++++++++++++++++++++++++
 4 files changed, 133 insertions(+)
 create mode 100644 drivers/hid/hid-razer-blackwidow.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index a7c78ac96270..7f4f891c9853 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -915,6 +915,13 @@ config PLAYSTATION_FF
 	  Say Y here if you would like to enable force feedback support for
 	  PlayStation game controllers.
 
+config HID_RAZER_BLACKWIDOW
+	tristate "Razer Blackwidow non-fully HID-compliant devices"
+	depends on HID
+	help
+	Support for Razer devices that are not fully compliant with the
+	HID standard.
+
 config HID_PRIMAX
 	tristate "Primax non-fully HID-compliant devices"
 	depends on HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 55a6fa3eca5a..e2a9f506f87e 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -98,6 +98,7 @@ hid-picolcd-$(CONFIG_DEBUG_FS)		+= hid-picolcd_debugfs.o
 obj-$(CONFIG_HID_PLANTRONICS)	+= hid-plantronics.o
 obj-$(CONFIG_HID_PLAYSTATION)	+= hid-playstation.o
 obj-$(CONFIG_HID_PRIMAX)	+= hid-primax.o
+obj-$(CONFIG_HID_RAZER_BLACKWIDOW)         += hid-razer-blackwidow.o
 obj-$(CONFIG_HID_REDRAGON)	+= hid-redragon.o
 obj-$(CONFIG_HID_RETRODE)	+= hid-retrode.o
 obj-$(CONFIG_HID_ROCCAT)	+= hid-roccat.o hid-roccat-common.o \
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 19da07777d62..793efdd0a93d 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1024,6 +1024,9 @@
 #define I2C_PRODUCT_ID_RAYDIUM_3118	0x3118
 
 #define USB_VENDOR_ID_RAZER            0x1532
+#define USB_DEVICE_ID_RAZER_BLACKWIDOW_ULTIMATE   0x010D
+#define USB_DEVICE_ID_RAZER_BLACKWIDOW            0x010e
+#define USB_DEVICE_ID_RAZER_BLACKWIDOW_CLASSIC    0x011b
 #define USB_DEVICE_ID_RAZER_BLADE_14   0x011D
 
 #define USB_VENDOR_ID_REALTEK		0x0bda
diff --git a/drivers/hid/hid-razer-blackwidow.c b/drivers/hid/hid-razer-blackwidow.c
new file mode 100644
index 000000000000..8668a143837f
--- /dev/null
+++ b/drivers/hid/hid-razer-blackwidow.c
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
+#define RAZOR_BLACKWIDOW_TRANSFER_BUF_SIZE	91
+
+static bool macro_key_remapping = 1;
+module_param(macro_key_remapping, bool, 0644);
+MODULE_PARM_DESC(macro_key_remapping, " on (Y) off (N)");
+
+
+static unsigned char blackwidow_init[RAZOR_BLACKWIDOW_TRANSFER_BUF_SIZE] = {
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
+static int razer_blackwidow_input_mapping(struct hid_device *hdev,
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
+static int razer_blackwidow_probe(struct hid_device *hdev, const struct hid_device_id *id)
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
+		buf = kmemdup(blackwidow_init, RAZOR_BLACKWIDOW_TRANSFER_BUF_SIZE, GFP_KERNEL);
+		if (buf == NULL)
+			return -ENOMEM;
+
+		ret = hid_hw_raw_request(hdev, 0, buf, RAZOR_BLACKWIDOW_TRANSFER_BUF_SIZE,
+				HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
+		if (ret != RAZOR_BLACKWIDOW_TRANSFER_BUF_SIZE)
+			hid_err(hdev, "failed to enable macro keys: %d\n", ret);
+
+		kfree(buf);
+	}
+
+	return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+}
+
+static const struct hid_device_id razer_blackwidow_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_RAZER,
+		USB_DEVICE_ID_RAZER_BLACKWIDOW) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_RAZER,
+		USB_DEVICE_ID_RAZER_BLACKWIDOW_CLASSIC) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_RAZER,
+		USB_DEVICE_ID_RAZER_BLACKWIDOW_ULTIMATE) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, razer_blackwidow_devices);
+
+static struct hid_driver razer_blackwidow_driver = {
+	.name = "razer-blackwidow",
+	.id_table = razer_blackwidow_devices,
+	.input_mapping = razer_blackwidow_input_mapping,
+	.probe = razer_blackwidow_probe,
+};
+module_hid_driver(razer_blackwidow_driver);
+
+MODULE_AUTHOR("Jelle van der Waa <jvanderwaa@redhat.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1

