Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB102638CD
	for <lists+linux-input@lfdr.de>; Thu, 10 Sep 2020 00:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgIIWDX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Sep 2020 18:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbgIIWDV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Sep 2020 18:03:21 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09166C061756
        for <linux-input@vger.kernel.org>; Wed,  9 Sep 2020 15:03:20 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id k15so3348213pfc.12
        for <linux-input@vger.kernel.org>; Wed, 09 Sep 2020 15:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y29oJ2wR8B7vMMWMqGAukb+m950+dbW6OxjMlymMlBc=;
        b=fhPN17N7/qjwdvpNEW6poJXqxItTX/BcX32e5QXRppf6eTv8TDJzy4xUtkU6HmOsWY
         VjI8t1NJzXsCZIFXeEtlBNDKB5jQvwdTxEvA7XZgRduXh/P8Pef+NRDu42A+5T2P/bYs
         Ga0BAjAjJ65pQVyqxq60fuMrFVCGOkdUQdlGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y29oJ2wR8B7vMMWMqGAukb+m950+dbW6OxjMlymMlBc=;
        b=cZUlRAw9nSO974UfEDsyNJZfZGVCdDX8YyDCUFctjYEO1AAEczQON9j2jMo3sBSHqI
         QNoja7EnDdwogZPq2OjpY0EK4rromm/W9MeEN7j1dNkkuYTLLIVIsOJDENofe3d6TGG4
         SQl81EmYs9rswEq0wLjor2X5S/b9kT4KeX9aJSJdhTmmuqHSwuCIyooBVByrWf6lRmwJ
         wrHhyr1Zk4afMbrZETa5aJjD5ed0NGDpboVzRoMYLyeqqgm5zRC7NOIRi+aH7+aL+oLv
         Ar+Wc0aUqiJBeP5xKbXjNDoAeNXVnVb2/T1f6JQQMLC+4+3ePjS8xKf14aeqnacGNzXb
         ZweQ==
X-Gm-Message-State: AOAM533sp56IXmjcYagtExZ21j0mJ4KK/KKXj8pTGCF12gW2+r4SDwq4
        PRit4DQ3ulz2ksXajCXxfTz+Ew==
X-Google-Smtp-Source: ABdhPJw/d5Tqf/rHCwWkJFbCgAyi1QvfIXvgAz1a19pSi6GJfrzgl7jFis+ln923AoXqFqkEyH0Ijg==
X-Received: by 2002:a62:cf05:: with SMTP id b5mr2495603pfg.108.1599689000262;
        Wed, 09 Sep 2020 15:03:20 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:9657:a5ff:feef:7b57])
        by smtp.gmail.com with ESMTPSA id n2sm170854pja.41.2020.09.09.15.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 15:03:19 -0700 (PDT)
From:   Sean O'Brien <seobrien@chromium.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Sean O'Brien <seobrien@chromium.org>
Subject: [PATCH v3] HID: add vivaldi HID driver
Date:   Wed,  9 Sep 2020 15:03:04 -0700
Message-Id: <20200909150254.1.I170489c0c2ac1538b3890abb5a92b95ad4f04d01@changeid>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add vivaldi HID driver. This driver allows us to read and report the top
row layout of keyboards which provide a vendor-defined (Google) HID
usage.

Signed-off-by: Sean O'Brien <seobrien@chromium.org>
---

 drivers/hid/Kconfig       |   9 +++
 drivers/hid/Makefile      |   1 +
 drivers/hid/hid-core.c    |   7 ++
 drivers/hid/hid-vivaldi.c | 144 ++++++++++++++++++++++++++++++++++++++
 include/linux/hid.h       |   2 +
 5 files changed, 163 insertions(+)
 create mode 100644 drivers/hid/hid-vivaldi.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 05315b434276..612629678c84 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -397,6 +397,15 @@ config HID_GOOGLE_HAMMER
 	help
 	Say Y here if you have a Google Hammer device.
 
+config HID_VIVALDI
+	tristate "Vivaldi Keyboard"
+	depends on HID
+	help
+	  Say Y here if you want to enable support for Vivaldi keyboards.
+
+	  Vivaldi keyboards use a vendor-specific (Google) HID usage to report
+	  how the keys in the top row are physically ordered.
+
 config HID_GT683R
 	tristate "MSI GT68xR LED support"
 	depends on LEDS_CLASS && USB_HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index d8ea4b8c95af..4acb583c92a6 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -50,6 +50,7 @@ obj-$(CONFIG_HID_GEMBIRD)	+= hid-gembird.o
 obj-$(CONFIG_HID_GFRM)		+= hid-gfrm.o
 obj-$(CONFIG_HID_GLORIOUS)  += hid-glorious.o
 obj-$(CONFIG_HID_GOOGLE_HAMMER)	+= hid-google-hammer.o
+obj-$(CONFIG_HID_VIVALDI)	+= hid-vivaldi.o
 obj-$(CONFIG_HID_GT683R)	+= hid-gt683r.o
 obj-$(CONFIG_HID_GYRATION)	+= hid-gyration.o
 obj-$(CONFIG_HID_HOLTEK)	+= hid-holtek-kbd.o
diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index d2ecc9c45255..6dbd09254c44 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -814,6 +814,13 @@ static void hid_scan_collection(struct hid_parser *parser, unsigned type)
 
 	if ((parser->global.usage_page << 16) >= HID_UP_MSVENDOR)
 		parser->scan_flags |= HID_SCAN_FLAG_VENDOR_SPECIFIC;
+
+	if ((parser->global.usage_page << 16) == HID_UP_GOOGLEVENDOR)
+		for (i = 0; i < parser->local.usage_index; i++)
+			if (parser->local.usage[i] ==
+					(HID_UP_GOOGLEVENDOR | 0x0001))
+				parser->device->group =
+					HID_GROUP_VIVALDI;
 }
 
 static int hid_scan_main(struct hid_parser *parser, struct hid_item *item)
diff --git a/drivers/hid/hid-vivaldi.c b/drivers/hid/hid-vivaldi.c
new file mode 100644
index 000000000000..cd7ada48b1d9
--- /dev/null
+++ b/drivers/hid/hid-vivaldi.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * HID support for Vivaldi Keyboard
+ *
+ * Copyright 2020 Google LLC.
+ * Author: Sean O'Brien <seobrien@chromium.org>
+ */
+
+#include <linux/hid.h>
+#include <linux/module.h>
+
+#define MIN_FN_ROW_KEY	1
+#define MAX_FN_ROW_KEY	24
+#define HID_VD_FN_ROW_PHYSMAP 0x00000001
+#define HID_USAGE_FN_ROW_PHYSMAP (HID_UP_GOOGLEVENDOR | HID_VD_FN_ROW_PHYSMAP)
+
+static struct hid_driver hid_vivaldi;
+
+struct vivaldi_data {
+	u32 function_row_physmap[MAX_FN_ROW_KEY - MIN_FN_ROW_KEY + 1];
+	int max_function_row_key;
+};
+
+static ssize_t function_row_physmap_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct vivaldi_data *drvdata = hid_get_drvdata(hdev);
+	ssize_t size = 0;
+	int i;
+
+	if (!drvdata->max_function_row_key)
+		return 0;
+
+	for (i = 0; i < drvdata->max_function_row_key; i++)
+		size += sprintf(buf + size, "%02X ",
+				drvdata->function_row_physmap[i]);
+	size += sprintf(buf + size, "\n");
+	return size;
+}
+
+DEVICE_ATTR_RO(function_row_physmap);
+static struct attribute *sysfs_attrs[] = {
+	&dev_attr_function_row_physmap.attr,
+	NULL
+};
+
+static const struct attribute_group input_attribute_group = {
+	.attrs = sysfs_attrs
+};
+
+static int vivaldi_probe(struct hid_device *hdev,
+			 const struct hid_device_id *id)
+{
+	struct vivaldi_data *drvdata;
+	int ret;
+
+	drvdata = devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL);
+	hid_set_drvdata(hdev, drvdata);
+
+	ret = hid_parse(hdev);
+	if (ret)
+		return ret;
+
+	return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+}
+
+static void vivaldi_feature_mapping(struct hid_device *hdev,
+				    struct hid_field *field,
+				    struct hid_usage *usage)
+{
+	struct vivaldi_data *drvdata = hid_get_drvdata(hdev);
+	int fn_key;
+	int ret;
+	u32 report_len;
+	u8 *buf;
+
+	if (field->logical != HID_USAGE_FN_ROW_PHYSMAP ||
+	    (usage->hid & HID_USAGE_PAGE) != HID_UP_ORDINAL)
+		return;
+
+	fn_key = (usage->hid & HID_USAGE);
+	if (fn_key < MIN_FN_ROW_KEY || fn_key > MAX_FN_ROW_KEY)
+		return;
+	if (fn_key > drvdata->max_function_row_key)
+		drvdata->max_function_row_key = fn_key;
+
+	buf = hid_alloc_report_buf(field->report, GFP_KERNEL);
+	if (!buf)
+		return;
+
+	report_len = hid_report_len(field->report);
+	ret = hid_hw_raw_request(hdev, field->report->id, buf,
+				 report_len, HID_FEATURE_REPORT,
+				 HID_REQ_GET_REPORT);
+	if (ret < 0) {
+		dev_warn(&hdev->dev, "failed to fetch feature %d\n",
+			 field->report->id);
+		goto out;
+	}
+
+	ret = hid_report_raw_event(hdev, HID_FEATURE_REPORT, buf,
+				   report_len, 0);
+	if (ret) {
+		dev_warn(&hdev->dev, "failed to report feature %d\n",
+			 field->report->id);
+		goto out;
+	}
+
+	drvdata->function_row_physmap[fn_key - MIN_FN_ROW_KEY] =
+	    field->value[usage->usage_index];
+
+out:
+	kfree(buf);
+}
+
+static int vivaldi_input_configured(struct hid_device *hdev,
+				    struct hid_input *hidinput)
+{
+	return sysfs_create_group(&hdev->dev.kobj, &input_attribute_group);
+}
+
+static const struct hid_device_id vivaldi_table[] = {
+	{ HID_DEVICE(HID_BUS_ANY, HID_GROUP_VIVALDI, HID_ANY_ID,
+		     HID_ANY_ID) },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(hid, vivaldi_table);
+
+static struct hid_driver hid_vivaldi = {
+	.name = "hid-vivaldi",
+	.id_table = vivaldi_table,
+	.probe = vivaldi_probe,
+	.feature_mapping = vivaldi_feature_mapping,
+	.input_configured = vivaldi_input_configured,
+};
+
+module_hid_driver(hid_vivaldi);
+
+MODULE_AUTHOR("Sean O'Brien");
+MODULE_DESCRIPTION("HID vivaldi driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/hid.h b/include/linux/hid.h
index c7044a14200e..58684657960b 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -163,6 +163,7 @@ struct hid_item {
 #define HID_UP_LNVENDOR		0xffa00000
 #define HID_UP_SENSOR		0x00200000
 #define HID_UP_ASUSVENDOR	0xff310000
+#define HID_UP_GOOGLEVENDOR	0xffd10000
 
 #define HID_USAGE		0x0000ffff
 
@@ -371,6 +372,7 @@ struct hid_item {
 #define HID_GROUP_LOGITECH_DJ_DEVICE		0x0102
 #define HID_GROUP_STEAM				0x0103
 #define HID_GROUP_LOGITECH_27MHZ_DEVICE		0x0104
+#define HID_GROUP_VIVALDI			0x0105
 
 /*
  * HID protocol status
-- 
2.28.0.526.ge36021eeef-goog

