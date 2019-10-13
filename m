Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A07F4D569A
	for <lists+linux-input@lfdr.de>; Sun, 13 Oct 2019 17:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbfJMPRo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Oct 2019 11:17:44 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:44413 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbfJMPRo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Oct 2019 11:17:44 -0400
Received: by mail-ed1-f66.google.com with SMTP id r16so12603108edq.11
        for <linux-input@vger.kernel.org>; Sun, 13 Oct 2019 08:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vdwaa-nl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VZQ4Ij7vw7nZ2BwAbCr6W3WjBFto6hUXu45r/qSRMRc=;
        b=B7cUImcmjgLNoh8eA+sWNLXyhxlBBamwwdpz5gI/Q1Ga5tC42/Nbf6fIokkkp0y/RQ
         8ye/EGusi0HpRvvZpfPdh4IEoI2OyBKwdzsp2/Jvs682xAwjIVfNRYkoZqV7SAmTWjAO
         Sxxg7/rTFsaAwreEql02F7NzLRrDahIwxFIRkAReHeup+po3v2lQBNfKdWjxAL9bMY3I
         D9X8P1+rb6m9krfgi3NdxvE9rhnKHR+PGB5WYq0bCqULynm490LDdksQ+U5shAdQoDgf
         d3iHNU5tm1fh4CdggnCj4258BGg8f2y+mR0HrTkT9Yiu41yOZdwIOlNNxRduXtAgascq
         kMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VZQ4Ij7vw7nZ2BwAbCr6W3WjBFto6hUXu45r/qSRMRc=;
        b=ZT7epuKoM4sV1Sr0rhlAIJuCLbT/5Nylt7h90MmOCNiW3+rJQygYUIrUKrY0UPfumM
         LbioH/KCMqhEL5GIwt9PxPVwxJwK+/Ez2mu5dQgQjGjFPDQUg58VWPFsqD+Fliv82305
         eOf0bGOl2FpyUxreuaQL0iNfN/yzt2nR2T48acgNRK6k1t59XXuNliAYIYAulkeET2iR
         QA1TZ9bwlRlJaOirm25FcMh/TIdBiPNpdxNVitTtVyOpFBhMALduhnDpoVNw4l+Sj4P3
         l4ElLPLHi5xRozLFsFLNhsqhUOvnRTfqS5p9y2ympvl8voMs1f4vUiTs72gbht50iwCz
         0Neg==
X-Gm-Message-State: APjAAAUa84b79LMT/nd0feq537TnXKBJGyndonAV8V4CHl78onOYVjqM
        0niH5IVE32C6ehLGID7zDnengA==
X-Google-Smtp-Source: APXvYqyfPWAm9CfQjMMcHMW+6u3PnJS65FNLSqYtWSi4mYDwUUseMNVho0pDmCKGeAR28983+ZMGWw==
X-Received: by 2002:a17:906:b24c:: with SMTP id ce12mr24296448ejb.327.1570979862020;
        Sun, 13 Oct 2019 08:17:42 -0700 (PDT)
Received: from localhost.localdomain (83-84-17-34.cable.dynamic.v4.ziggo.nl. [83.84.17.34])
        by smtp.gmail.com with ESMTPSA id h10sm2702489edf.81.2019.10.13.08.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 08:17:41 -0700 (PDT)
From:   Jelle van der Waa <jelle@vdwaa.nl>
X-Google-Original-From: Jelle van der Waa
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>
Subject: [PATCH v2] HID: Add support for Razer Blackwidow keyboards
Date:   Sun, 13 Oct 2019 17:16:50 +0200
Message-Id: <20191013151650.41360-1-jelle@vdwaa.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190705221605.28293-1-jelle@vdwaa.nl>
References: <20190705221605.28293-1-jelle@vdwaa.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jelle van der Waa <jelle@vdwaa.nl>

Add support for the macro keys on the Razer Blackwidow keyboards. By
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
index 1ecb5124421c..4f347fe60a63 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1144,6 +1144,13 @@ config HID_ALPS
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
index 0c03308cfb08..5ae72667b07e 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -107,6 +107,7 @@ obj-$(CONFIG_HID_STEAM)		+= hid-steam.o
 obj-$(CONFIG_HID_STEELSERIES)	+= hid-steelseries.o
 obj-$(CONFIG_HID_SUNPLUS)	+= hid-sunplus.o
 obj-$(CONFIG_HID_GREENASIA)	+= hid-gaff.o
+obj-$(CONFIG_HID_RAZER)		+= hid-razer.o
 obj-$(CONFIG_HID_THRUSTMASTER)	+= hid-tmff.o
 obj-$(CONFIG_HID_TIVO)		+= hid-tivo.o
 obj-$(CONFIG_HID_TOPSEED)	+= hid-topseed.o
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 76969a22b0f2..d9ab9a048fee 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -960,6 +960,9 @@
 
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
2.23.0

