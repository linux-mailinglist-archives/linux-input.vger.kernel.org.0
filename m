Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1138560DAB
	for <lists+linux-input@lfdr.de>; Sat,  6 Jul 2019 00:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbfGEWQw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Jul 2019 18:16:52 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36175 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbfGEWQv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Jul 2019 18:16:51 -0400
Received: by mail-ed1-f66.google.com with SMTP id k21so9022194edq.3
        for <linux-input@vger.kernel.org>; Fri, 05 Jul 2019 15:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vdwaa-nl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IMMOAYXD5NOAplzkClFtoHu5MdZ5vpuse4lyP53gzgs=;
        b=d4FIvOFgSkIQ46fq0z95YEZ70bPNxa/LnnoPpWsWc0jESWvtElRM6LbekBztxyRHtv
         7/E0LKnVLlbpnjgohOIezUeLRY9axNuBFtOIrIkUd2+9DYFYe1ST/zc8TAPyNdJVitVy
         OpEChTXBP9gGRN6p5hVTt4VA30BpXJ2jAIZs0rCF6Om+4c1AXW8DRVjkb6kRiT0F0ICh
         IBFlolZAu2CXsk4QueQ4Rb34pPhnGfDd0H7rNPvGPPKuCuHUlRhYOfpptZVvE54hB6jN
         YFW9FVuIe9BvsQKhNHk3K3WMPGy4giGRduGJP6ZIRaADLDbtYu9C+X2MHGbGprCHFdfi
         3NqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IMMOAYXD5NOAplzkClFtoHu5MdZ5vpuse4lyP53gzgs=;
        b=gYi6qjXjropi5qjkoh42DVQvpf0B0cMJo4AhJCrOX9qeh3A43nD/qYhOsPH9l+Ekkn
         q7i0RcaxHnjsXw14GFTMRbH8mqzAhkkQ1SEKmL3hTO9qgMiFYuzRYeg3Eeh7WtJENx1/
         f/x0gnG2iUf98E6fNJERty3x+OZRpxqnjR4CG5NYu7q9ottV3fNtTJYMdz+Fd3b2scL4
         2d/RDOm7ceKpsIlkLhH96Rmh6PFF2uIzI6uR2QoR+D00my4J0v8YODnald1I4+EnTT/W
         AQttMtxEs4bQN8CNv19aM6MoDpRVo8jiAo8SGiVOndJGosNmUlYrC+BOofB/Yv7XnoYD
         oznA==
X-Gm-Message-State: APjAAAUasfEIwdVTDJ+V6EnjsT4Uk1Pqxt/wMmpHAgNKrETKJUDPiR8L
        D7a+/i7JBrPnwpZt+kjWsYDdRQ==
X-Google-Smtp-Source: APXvYqy/l6+vs4qWXRjmvfGXcGbfbvnCRFVMTtMjTR3LYUsccb3ckUYQV7/An4XE1ZfdaeV9S6GOFw==
X-Received: by 2002:aa7:cf0c:: with SMTP id a12mr6971385edy.146.1562365009225;
        Fri, 05 Jul 2019 15:16:49 -0700 (PDT)
Received: from helium.space.revspace.nl ([2a01:4f8:1c0c:6c86:997e:5a09:8f9:e9b8])
        by smtp.gmail.com with ESMTPSA id 5sm1780398ejx.58.2019.07.05.15.16.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 15:16:48 -0700 (PDT)
From:   Jelle van der Waa <jelle@vdwaa.nl>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jelle van der Waa <jelle@vdwaa.nl>, linux-input@vger.kernel.org
Subject: [PATCH] HID: Add support for Razer Blackwidow keyboards
Date:   Sat,  6 Jul 2019 00:16:05 +0200
Message-Id: <20190705221605.28293-1-jelle@vdwaa.nl>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for the macro keys on the Razor Blackwidow keyboards. By
default the macro keys do not work and have to be enabled via a feature
report. After being enabled they report as XF86Tools, XF86Launch5-8.

Signed-off-by: Jelle van der Waa <jelle@vdwaa.nl>
---
 drivers/hid/Kconfig     |  7 ++++
 drivers/hid/Makefile    |  1 +
 drivers/hid/hid-ids.h   |  3 ++
 drivers/hid/hid-razer.c | 78 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 89 insertions(+)
 create mode 100644 drivers/hid/hid-razer.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 3872e03d9a59..0b4bc464fc11 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1135,6 +1135,13 @@ config HID_ALPS
 	Say Y here if you have a Alps touchpads over i2c-hid or usbhid
 	and want support for its special functionalities.
 
+config HID_RAZER
+	tristate "Razer Blackwidow keyboard support"
+	depends on HID
+	---help---
+	Say Y here if you want the Razer Blackwidow keyboards to enable macro
+	keys.
+
 endmenu
 
 endif # HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index cc5d827c9164..417168a88193 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -121,6 +121,7 @@ obj-$(CONFIG_HID_XINMO)		+= hid-xinmo.o
 obj-$(CONFIG_HID_ZEROPLUS)	+= hid-zpff.o
 obj-$(CONFIG_HID_ZYDACRON)	+= hid-zydacron.o
 obj-$(CONFIG_HID_VIEWSONIC)	+= hid-viewsonic.o
+obj-$(CONFIG_HID_RAZER)		+= hid-razer.o
 
 wacom-objs			:= wacom_wac.o wacom_sys.o
 obj-$(CONFIG_HID_WACOM)		+= wacom.o
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index b032d3899fa3..8f6ce553b52c 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -955,6 +955,9 @@
 
 #define USB_VENDOR_ID_RAZER            0x1532
 #define USB_DEVICE_ID_RAZER_BLADE_14   0x011D
+#define USB_DEVICE_ID_RAZER_BLACKWIDOW 0x010e
+#define USB_DEVICE_ID_RAZER_BLACKWIDOW_ULTIMATE 0x011a
+#define USB_DEVICE_ID_RAZER_BLACKWIDOW_2013 0x011b
 
 #define USB_VENDOR_ID_REALTEK		0x0bda
 #define USB_DEVICE_ID_REALTEK_READER	0x0152
diff --git a/drivers/hid/hid-razer.c b/drivers/hid/hid-razer.c
new file mode 100644
index 000000000000..d958fd9f9311
--- /dev/null
+++ b/drivers/hid/hid-razer.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * HID driver to enable macro keys on Razer keyboards
+ *
+ * Copyright (c) 2019 Jelle van der Waa <jelle@vdwaa.nl>
+ */
+
+#include <linux/hid.h>
+#include <linux/module.h>
+#include "hid-ids.h"
+
+#define RAZER_BLACKWIDOW_FEATURE_REPORT 0x00
+#define BUF_SIZE 91
+
+static const u8 data[BUF_SIZE] = {0, 0, 0, 0, 0, 0, 2, 0, 4, 2, 0, 0, 0, 0, 0,
+	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	0, 0, 4, 0};
+
+static const struct hid_device_id razer_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_RAZER, USB_DEVICE_ID_RAZER_BLACKWIDOW) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_RAZER, USB_DEVICE_ID_RAZER_BLACKWIDOW_2013) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_RAZER, USB_DEVICE_ID_RAZER_BLACKWIDOW_ULTIMATE) },
+	{}
+};
+
+MODULE_DEVICE_TABLE(hid, razer_devices);
+
+static int razer_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	struct hid_report_enum *rep_enum;
+	struct hid_report *rep;
+	unsigned char *dmabuf;
+	bool has_ff000002 = false;
+	int ret = 0;
+
+	dmabuf = kmemdup(data, BUF_SIZE, GFP_KERNEL);
+	if (!dmabuf)
+		return -ENOMEM;
+
+	hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
+
+	ret = hid_parse(hdev);
+	if (ret)
+		return ret;
+
+	rep_enum = &hdev->report_enum[HID_FEATURE_REPORT];
+	list_for_each_entry(rep, &rep_enum->report_list, list) {
+		if (rep->maxfield && rep->field[0]->maxusage)
+			if (rep->field[0]->usage[0].hid == 0xff000002)
+				has_ff000002 = true;
+	}
+
+	if (has_ff000002) {
+		ret = hid_hw_raw_request(hdev, RAZER_BLACKWIDOW_FEATURE_REPORT,
+				dmabuf, BUF_SIZE, HID_FEATURE_REPORT,
+				HID_REQ_SET_REPORT);
+		if (ret != BUF_SIZE)
+			hid_err(hdev, "Razer failed to enable macro keys\n");
+	}
+
+	kfree(dmabuf);
+
+	return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+}
+
+static struct hid_driver razer_driver = {
+	.name = "hid-razer",
+	.id_table = razer_devices,
+	.probe = razer_probe,
+};
+
+module_hid_driver(razer_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jelle van der Waa <jelle@vdwaa.nl");
+MODULE_DESCRIPTION("Razer blackwidow 2013/2014 HID driver");
-- 
2.22.0

