Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A289A4C6423
	for <lists+linux-input@lfdr.de>; Mon, 28 Feb 2022 08:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233753AbiB1Hzf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Feb 2022 02:55:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233752AbiB1Hzf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Feb 2022 02:55:35 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B5F4614D
        for <linux-input@vger.kernel.org>; Sun, 27 Feb 2022 23:54:56 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id 12so10750664pgd.0
        for <linux-input@vger.kernel.org>; Sun, 27 Feb 2022 23:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JbfF5igIjOuMscLIDjexzjqyjFNX5yyYO53wKrTiDpw=;
        b=foF1n0i22SyPBrM+WEJPyI3O9gsma64F//7Rflu3u0KR4OfDUw2C8Jxp94AkO0roIG
         PSQkqNcthx4EOwziolg+HLNTc9fb95VB/5Mi4f5Vt3LvIN5DOs8j3OUK9+PMiRFVDKAO
         mFffhQC5zOeUrRY5ekh4fd1pwP0/ESGrT3El776YvK2nsNjX84dSf7tUFy9AUMUuHOqf
         4470pv93bXNQZoBZ3WJb1Bb+Z4qRIQr8OK7Nl+Alr4dm/P9VWzTmgSFcnr5rKGt8QHSL
         yH7PXkqjMzZSRx5CKyD/vHNgqNp2BWINm2/ckUQh84TPjkf9FtAwqKKJ4Z2RI5urRac0
         BTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JbfF5igIjOuMscLIDjexzjqyjFNX5yyYO53wKrTiDpw=;
        b=XD2pVvJU09JPsOnYhU/CGojqJ25JwXTcHSqtYoeGs+MRiAMixgU63Vgv5BTfAD06ko
         uuLkVEM9MjdFnL+GHvgDhfw+ZJjPdRz9hINr7canv8BBim4oBqcoM1ggPZAipnPPRFSE
         Jtk8pwqGgo93lBM/np/nRtKt1T6Tnvt5FBp0rxTQCYe6qYmnJrawLopfcwAoGudtyZVP
         auWplQMXfqcy7ODCep5vVGFXbHupkx8slDPOtppxdanRuzCLNNUNNPsIwFlhLLndkrYy
         QxI8G2b2/TKnMXeFsjcHnk5gh4Ng/0HCtOlplTSAs6B7NFYlIdu1+bE4J+Sn6oAiFXJf
         DPBQ==
X-Gm-Message-State: AOAM532DcFFgbGiXP1AgPU/gf9q1TlnkjsADRlLfJIdddRz3RMV8FY/S
        cL6T1qTBJaAQUo7t88/UalUpxo7URSs=
X-Google-Smtp-Source: ABdhPJxzUmi9BnxbQultZy2PIwMqduV1yk67gxUvCbqdby/QsNlEOneSxxhpaQQ2ZECoCVNavFQjzg==
X-Received: by 2002:a05:6a00:21ca:b0:4c9:ff9:47e3 with SMTP id t10-20020a056a0021ca00b004c90ff947e3mr20384981pfj.10.1646034895001;
        Sun, 27 Feb 2022 23:54:55 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:43a2:93b6:ebd7:94fd])
        by smtp.gmail.com with ESMTPSA id d13-20020a17090ac24d00b001bcd7c2b2c3sm10718517pjx.16.2022.02.27.23.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 23:54:53 -0800 (PST)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Stephen Boyd <swboyd@chromium.org>, benjamin.tissoires@redhat.com,
        Jiri Kosina <jikos@kernel.org>,
        Sean O'Brien <seobrien@chromium.org>,
        "Douglas Anderson linux-kernel @ vger . kernel . org" 
        <dianders@chromium.org>
Subject: [PATCH v5 3/5] HID: google: extract Vivaldi hid feature mapping for use in hid-hammer
Date:   Sun, 27 Feb 2022 23:54:44 -0800
Message-Id: <20220228075446.466016-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.35.1.574.g5d30c73bfb-goog
In-Reply-To: <20220228075446.466016-1-dmitry.torokhov@gmail.com>
References: <20220228075446.466016-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Stephen Boyd <swboyd@chromium.org>

We need to support parsing the HID device in both the Vivaldi and the
Hammer drivers so that we can properly expose the function row physmap
to userspace when a hammer device uses a vivaldi keyboard layout for the
function row keys. Extract the feature mapping logic from the vivaldi
driver into an hid specific vivaldi library so we can use it from both
HID drivers.

To allow more code sharing we mandate that vivaldi data must be placed
at the very beginning of the driver data attached to the HID device
instance.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Link: https://lore.kernel.org/r/20220216195901.1326924-3-swboyd@chromium.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/Kconfig              |   8 ++
 drivers/hid/Makefile             |   1 +
 drivers/hid/hid-vivaldi-common.c | 140 +++++++++++++++++++++++++++++++
 drivers/hid/hid-vivaldi-common.h |  16 ++++
 drivers/hid/hid-vivaldi.c        | 106 +----------------------
 5 files changed, 167 insertions(+), 104 deletions(-)
 create mode 100644 drivers/hid/hid-vivaldi-common.c
 create mode 100644 drivers/hid/hid-vivaldi-common.h

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 5569a2029dab..f5245c5fe1af 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -403,6 +403,13 @@ config HOLTEK_FF
 	  Say Y here if you have a Holtek On Line Grip based game controller
 	  and want to have force feedback support for it.
 
+config HID_VIVALDI_COMMON
+	tristate
+	help
+	  ChromeOS Vivaldi HID parsing support library. This is a hidden
+	  option so that drivers can use common code to parse the HID
+	  descriptors for vivaldi function row keymap.
+
 config HID_GOOGLE_HAMMER
 	tristate "Google Hammer Keyboard"
 	depends on USB_HID && LEDS_CLASS && CROS_EC
@@ -411,6 +418,7 @@ config HID_GOOGLE_HAMMER
 
 config HID_VIVALDI
 	tristate "Vivaldi Keyboard"
+	select HID_VIVALDI_COMMON
 	select INPUT_VIVALDIFMAP
 	depends on HID
 	help
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 6d3e630e81af..469a6159ebae 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -50,6 +50,7 @@ obj-$(CONFIG_HID_FT260)		+= hid-ft260.o
 obj-$(CONFIG_HID_GEMBIRD)	+= hid-gembird.o
 obj-$(CONFIG_HID_GFRM)		+= hid-gfrm.o
 obj-$(CONFIG_HID_GLORIOUS)  += hid-glorious.o
+obj-$(CONFIG_HID_VIVALDI_COMMON) += hid-vivaldi-common.o
 obj-$(CONFIG_HID_GOOGLE_HAMMER)	+= hid-google-hammer.o
 obj-$(CONFIG_HID_VIVALDI)	+= hid-vivaldi.o
 obj-$(CONFIG_HID_GT683R)	+= hid-gt683r.o
diff --git a/drivers/hid/hid-vivaldi-common.c b/drivers/hid/hid-vivaldi-common.c
new file mode 100644
index 000000000000..c88b26f4c78b
--- /dev/null
+++ b/drivers/hid/hid-vivaldi-common.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Helpers for ChromeOS HID Vivaldi keyboards
+ *
+ * Copyright (C) 2022 Google, Inc
+ */
+
+#include <linux/export.h>
+#include <linux/hid.h>
+#include <linux/input/vivaldi-fmap.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/types.h>
+
+#include "hid-vivaldi-common.h"
+
+#define MIN_FN_ROW_KEY 1
+#define MAX_FN_ROW_KEY VIVALDI_MAX_FUNCTION_ROW_KEYS
+#define HID_VD_FN_ROW_PHYSMAP 0x00000001
+#define HID_USAGE_FN_ROW_PHYSMAP (HID_UP_GOOGLEVENDOR | HID_VD_FN_ROW_PHYSMAP)
+
+/**
+ * vivaldi_feature_mapping - Fill out vivaldi keymap data exposed via HID
+ * @hdev: HID device to parse
+ * @field: HID field to parse
+ * @usage: HID usage to parse
+ *
+ * This function assumes that driver data attached to @hdev contains an
+ * instance of &struct vivaldi_data in the very beginning.
+ */
+void vivaldi_feature_mapping(struct hid_device *hdev,
+			     struct hid_field *field, struct hid_usage *usage)
+{
+	struct vivaldi_data *data = hid_get_drvdata(hdev);
+	struct hid_report *report = field->report;
+	u8 *report_data, *buf;
+	u32 report_len;
+	unsigned int fn_key;
+	int ret;
+
+	if (field->logical != HID_USAGE_FN_ROW_PHYSMAP ||
+	    (usage->hid & HID_USAGE_PAGE) != HID_UP_ORDINAL)
+		return;
+
+	fn_key = usage->hid & HID_USAGE;
+	if (fn_key < MIN_FN_ROW_KEY || fn_key > MAX_FN_ROW_KEY)
+		return;
+
+	if (fn_key > data->num_function_row_keys)
+		data->num_function_row_keys = fn_key;
+
+	report_data = buf = hid_alloc_report_buf(report, GFP_KERNEL);
+	if (!report_data)
+		return;
+
+	report_len = hid_report_len(report);
+	if (!report->id) {
+		/*
+		 * hid_hw_raw_request() will stuff report ID (which will be 0)
+		 * into the first byte of the buffer even for unnumbered
+		 * reports, so we need to account for this to avoid getting
+		 * -EOVERFLOW in return.
+		 * Note that hid_alloc_report_buf() adds 7 bytes to the size
+		 * so we can safely say that we have space for an extra byte.
+		 */
+		report_len++;
+	}
+
+	ret = hid_hw_raw_request(hdev, report->id, report_data,
+				 report_len, HID_FEATURE_REPORT,
+				 HID_REQ_GET_REPORT);
+	if (ret < 0) {
+		dev_warn(&hdev->dev, "failed to fetch feature %d\n",
+			 field->report->id);
+		goto out;
+	}
+
+	if (!report->id) {
+		/*
+		 * Undo the damage from hid_hw_raw_request() for unnumbered
+		 * reports.
+		 */
+		report_data++;
+		report_len--;
+	}
+
+	ret = hid_report_raw_event(hdev, HID_FEATURE_REPORT, report_data,
+				   report_len, 0);
+	if (ret) {
+		dev_warn(&hdev->dev, "failed to report feature %d\n",
+			 field->report->id);
+		goto out;
+	}
+
+	data->function_row_physmap[fn_key - MIN_FN_ROW_KEY] =
+		field->value[usage->usage_index];
+
+out:
+	kfree(buf);
+}
+EXPORT_SYMBOL_GPL(vivaldi_feature_mapping);
+
+static ssize_t function_row_physmap_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct vivaldi_data *data = hid_get_drvdata(hdev);
+
+	return vivaldi_function_row_physmap_show(data, buf);
+}
+
+static DEVICE_ATTR_RO(function_row_physmap);
+static struct attribute *vivaldi_sysfs_attrs[] = {
+	&dev_attr_function_row_physmap.attr,
+	NULL
+};
+
+static const struct attribute_group vivaldi_attribute_group = {
+	.attrs = vivaldi_sysfs_attrs,
+};
+
+/**
+ * vivaldi_feature_mapping - Complete initialization of device using vivaldi map
+ * @hdev: HID device to witch vivaldi attributes should be attached
+ * @hidinput: HID input device (unused).
+ */
+int vivaldi_input_configured(struct hid_device *hdev,
+			     struct hid_input *hidinput)
+{
+	struct vivaldi_data *data = hid_get_drvdata(hdev);
+
+	if (!data->num_function_row_keys)
+		return 0;
+
+	return devm_device_add_group(&hdev->dev, &vivaldi_attribute_group);
+}
+EXPORT_SYMBOL_GPL(vivaldi_input_configured);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-vivaldi-common.h b/drivers/hid/hid-vivaldi-common.h
new file mode 100644
index 000000000000..37bc9b3e4f27
--- /dev/null
+++ b/drivers/hid/hid-vivaldi-common.h
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+#ifndef _HID_VIVALDI_COMMON_H
+#define _HID_VIVALDI_COMMON_H
+
+struct hid_device;
+struct hid_field;
+struct hid_input;
+struct hid_usage;
+
+void vivaldi_feature_mapping(struct hid_device *hdev,
+			     struct hid_field *field, struct hid_usage *usage);
+
+int vivaldi_input_configured(struct hid_device *hdev,
+			     struct hid_input *hidinput);
+
+#endif /* _HID_VIVALDI_COMMON_H */
diff --git a/drivers/hid/hid-vivaldi.c b/drivers/hid/hid-vivaldi.c
index ca8cb40928e6..3a979123e7d3 100644
--- a/drivers/hid/hid-vivaldi.c
+++ b/drivers/hid/hid-vivaldi.c
@@ -11,32 +11,8 @@
 #include <linux/input/vivaldi-fmap.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/sysfs.h>
 
-#define MIN_FN_ROW_KEY 1
-#define MAX_FN_ROW_KEY VIVALDI_MAX_FUNCTION_ROW_KEYS
-#define HID_VD_FN_ROW_PHYSMAP 0x00000001
-#define HID_USAGE_FN_ROW_PHYSMAP (HID_UP_GOOGLEVENDOR | HID_VD_FN_ROW_PHYSMAP)
-
-static ssize_t function_row_physmap_show(struct device *dev,
-					 struct device_attribute *attr,
-					 char *buf)
-{
-	struct hid_device *hdev = to_hid_device(dev);
-	struct vivaldi_data *drvdata = hid_get_drvdata(hdev);
-
-	return vivaldi_function_row_physmap_show(drvdata, buf);
-}
-
-static DEVICE_ATTR_RO(function_row_physmap);
-static struct attribute *sysfs_attrs[] = {
-	&dev_attr_function_row_physmap.attr,
-	NULL
-};
-
-static const struct attribute_group input_attribute_group = {
-	.attrs = sysfs_attrs
-};
+#include "hid-vivaldi-common.h"
 
 static int vivaldi_probe(struct hid_device *hdev,
 			 const struct hid_device_id *id)
@@ -57,86 +33,8 @@ static int vivaldi_probe(struct hid_device *hdev,
 	return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 }
 
-static void vivaldi_feature_mapping(struct hid_device *hdev,
-				    struct hid_field *field,
-				    struct hid_usage *usage)
-{
-	struct vivaldi_data *drvdata = hid_get_drvdata(hdev);
-	struct hid_report *report = field->report;
-	int fn_key;
-	int ret;
-	u32 report_len;
-	u8 *report_data, *buf;
-
-	if (field->logical != HID_USAGE_FN_ROW_PHYSMAP ||
-	    (usage->hid & HID_USAGE_PAGE) != HID_UP_ORDINAL)
-		return;
-
-	fn_key = usage->hid & HID_USAGE;
-	if (fn_key < MIN_FN_ROW_KEY || fn_key > MAX_FN_ROW_KEY)
-		return;
-	if (fn_key > drvdata->num_function_row_keys)
-		drvdata->num_function_row_keys = fn_key;
-
-	report_data = buf = hid_alloc_report_buf(report, GFP_KERNEL);
-	if (!report_data)
-		return;
-
-	report_len = hid_report_len(report);
-	if (!report->id) {
-		/*
-		 * hid_hw_raw_request() will stuff report ID (which will be 0)
-		 * into the first byte of the buffer even for unnumbered
-		 * reports, so we need to account for this to avoid getting
-		 * -EOVERFLOW in return.
-		 * Note that hid_alloc_report_buf() adds 7 bytes to the size
-		 * so we can safely say that we have space for an extra byte.
-		 */
-		report_len++;
-	}
-
-	ret = hid_hw_raw_request(hdev, report->id, report_data,
-				 report_len, HID_FEATURE_REPORT,
-				 HID_REQ_GET_REPORT);
-	if (ret < 0) {
-		dev_warn(&hdev->dev, "failed to fetch feature %d\n",
-			 field->report->id);
-		goto out;
-	}
-
-	if (!report->id) {
-		/*
-		 * Undo the damage from hid_hw_raw_request() for unnumbered
-		 * reports.
-		 */
-		report_data++;
-		report_len--;
-	}
-
-	ret = hid_report_raw_event(hdev, HID_FEATURE_REPORT, report_data,
-				   report_len, 0);
-	if (ret) {
-		dev_warn(&hdev->dev, "failed to report feature %d\n",
-			 field->report->id);
-		goto out;
-	}
-
-	drvdata->function_row_physmap[fn_key - MIN_FN_ROW_KEY] =
-	    field->value[usage->usage_index];
-
-out:
-	kfree(buf);
-}
-
-static int vivaldi_input_configured(struct hid_device *hdev,
-				    struct hid_input *hidinput)
-{
-	return devm_device_add_group(&hdev->dev, &input_attribute_group);
-}
-
 static const struct hid_device_id vivaldi_table[] = {
-	{ HID_DEVICE(HID_BUS_ANY, HID_GROUP_VIVALDI, HID_ANY_ID,
-		     HID_ANY_ID) },
+	{ HID_DEVICE(HID_BUS_ANY, HID_GROUP_VIVALDI, HID_ANY_ID, HID_ANY_ID) },
 	{ }
 };
 
-- 
2.35.1.574.g5d30c73bfb-goog

