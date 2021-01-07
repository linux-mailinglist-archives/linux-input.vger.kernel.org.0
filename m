Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7DD2EE9E3
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 00:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729241AbhAGXnD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 18:43:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728289AbhAGXnD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 18:43:03 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C69EFC0612FC
        for <linux-input@vger.kernel.org>; Thu,  7 Jan 2021 15:42:16 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id n3so4723319pjm.1
        for <linux-input@vger.kernel.org>; Thu, 07 Jan 2021 15:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6DrvTW/D8DeEAOBHByFNZGq7CUGM4Fwgn7nIcrSh7JA=;
        b=QMD4zbTEXpRoQxtNZrxO2CjlOSwg2aEsM1vb5Ds59KnlTR0gx9zYY7DUI3zPhetfVa
         zj/rJxe0GmP6AYq1SeNdQzStp/cx2akXqRVvikt6/GtL32AZuek8Of8CgJ47LUtH6LjX
         sAxYFIOW7fHlU4c0tWS6xv0hnqKmQVxDYb9Bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6DrvTW/D8DeEAOBHByFNZGq7CUGM4Fwgn7nIcrSh7JA=;
        b=J7f2tbLNLYSEny0HoeuvC8HDS+fA8wzVVw17q4/QWYt2zS70HpPh5aVSZOo2rxX04/
         YIBrNSsrGnIfq3xW6zehlO7hjmEbtwBSZL91gkWd3m0Wfn5b1bUvUVoTeHzCkOnkGryO
         E/KV4eXCU7WeNpnaPhB08YR+s7zAXSrAWJh+SD4lsp1mODJghbiRAbiuIG8BELW2IKCJ
         wywpisYLOtGS2i3ikuupVDNoltO2RHTHD1n96YVpEQ981Inp2JZ3VEtAOkhDsekFtzwc
         DRPs4uWCoa2DHBuAx8Q40SHmg4XsCtqy/TVUd0fg6IIa5nPRbXclmxowoNuDRsOmdHOu
         CJWg==
X-Gm-Message-State: AOAM531qZVqulgzR5I+T9YnZjkwoG3C14UPvME8NbNMdlpyf//Hn7jsn
        Q+qdJLGJWGwWAsZcGO0Mf/xd3fcUNvkw5w==
X-Google-Smtp-Source: ABdhPJy61XzozRY9Uiw5IAJWJhehsJ0Y0dYH7FmXPe1/AUsL/dLPxcTvGWM7jnPhCQqyRMgbBZWhFw==
X-Received: by 2002:a17:90a:d308:: with SMTP id p8mr865175pju.110.1610062936305;
        Thu, 07 Jan 2021 15:42:16 -0800 (PST)
Received: from philipchen.mtv.corp.google.com ([2620:15c:202:201:a6ae:11ff:fe11:fd59])
        by smtp.gmail.com with ESMTPSA id h8sm7376487pjc.2.2021.01.07.15.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 15:42:15 -0800 (PST)
From:   Philip Chen <philipchen@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>, dmitry.torokhov@gmail.com
Cc:     swboyd@chromium.org, dianders@chromium.org,
        Philip Chen <philipchen@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org
Subject: [PATCH v4 2/2] Input: cros-ec-keyb - Expose function row physical map to userspace
Date:   Thu,  7 Jan 2021 15:42:09 -0800
Message-Id: <20210107154200.v4.2.Ibe7d7d53c5b4fe72c60de90111ff763b53f38dbb@changeid>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107154200.v4.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
References: <20210107154200.v4.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The top-row keys in a keyboard usually have dual functionalities.
E.g. A function key "F1" is also an action key "Browser back".

Therefore, when an application receives an action key code from
a top-row key press, the application needs to know how to correlate
the action key code with the function key code and do the conversion
whenever necessary.

Since the userpace already knows the key scanlines (row/column)
associated with a received key code. Essentially, the userspace only
needs a mapping between the key row/column and the matching physical
location in the top row.

This patch enhances the cros-ec-keyb driver to create such a mapping
and expose it to userspace in the form of a function-row-physmap
attribute. The attribute would be a space separated ordered list of
row/column codes, for the keys in the function row, in a left-to-right
order.

The attribute will only be present when the device has a custom design
for the top-row keys.

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

Changes in v4:
- replace sysfs_create_group() with devm_device_add_group()
- remove an unused member in struct cros_ec_keyb

Changes in v3:
- parse `function-row-physmap` from DT earlier, when we probe
  cros_ec_keyb, and then store the extracted info in struct cros_ec_keyb.

Changes in v2:
- create function-row-physmap file in sysfs by parsing
  `function-row-physmap` property from DT
- assume the device already has a correct keymap to reflect the custom
  top-row keys (if they exist)

 drivers/input/keyboard/cros_ec_keyb.c | 78 +++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index b379ed7628781..75d1cb29734ce 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -27,6 +27,8 @@
 
 #include <asm/unaligned.h>
 
+#define MAX_NUM_TOP_ROW_KEYS   15
+
 /**
  * struct cros_ec_keyb - Structure representing EC keyboard device
  *
@@ -42,6 +44,9 @@
  * @idev: The input device for the matrix keys.
  * @bs_idev: The input device for non-matrix buttons and switches (or NULL).
  * @notifier: interrupt event notifier for transport devices
+ * @function_row_physmap: An array of the encoded rows/columns for the top
+ *                        row function keys, in an order from left to right
+ * @num_function_row_keys: The number of top row keys in a custom keyboard
  */
 struct cros_ec_keyb {
 	unsigned int rows;
@@ -58,6 +63,9 @@ struct cros_ec_keyb {
 	struct input_dev *idev;
 	struct input_dev *bs_idev;
 	struct notifier_block notifier;
+
+	u16 function_row_physmap[MAX_NUM_TOP_ROW_KEYS];
+	u8 num_function_row_keys;
 };
 
 /**
@@ -527,6 +535,8 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	struct input_dev *idev;
 	const char *phys;
 	int err;
+	u32 top_row_key_pos[MAX_NUM_TOP_ROW_KEYS] = {0};
+	u8 i;
 
 	err = matrix_keypad_parse_properties(dev, &ckdev->rows, &ckdev->cols);
 	if (err)
@@ -578,6 +588,22 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	ckdev->idev = idev;
 	cros_ec_keyb_compute_valid_keys(ckdev);
 
+	if (of_property_read_variable_u32_array(dev->of_node,
+						"function-row-physmap",
+						top_row_key_pos,
+						0,
+						MAX_NUM_TOP_ROW_KEYS) > 0) {
+		for (i = 0; i < MAX_NUM_TOP_ROW_KEYS; i++) {
+			if (!top_row_key_pos[i])
+				break;
+			ckdev->function_row_physmap[i] = MATRIX_SCAN_CODE(
+						KEY_ROW(top_row_key_pos[i]),
+						KEY_COL(top_row_key_pos[i]),
+						ckdev->row_shift);
+		}
+		ckdev->num_function_row_keys = i;
+	}
+
 	err = input_register_device(ckdev->idev);
 	if (err) {
 		dev_err(dev, "cannot register input device\n");
@@ -587,6 +613,52 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	return 0;
 }
 
+static ssize_t function_row_physmap_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	ssize_t size = 0;
+	u8 i;
+	struct cros_ec_keyb *ckdev = dev_get_drvdata(dev);
+
+	if (!ckdev->num_function_row_keys)
+		return 0;
+
+	for (i = 0; i < ckdev->num_function_row_keys; i++)
+		size += scnprintf(buf + size, PAGE_SIZE - size, "%02X ",
+				  ckdev->function_row_physmap[i]);
+	size += scnprintf(buf + size, PAGE_SIZE - size, "\n");
+
+	return size;
+}
+
+static DEVICE_ATTR_RO(function_row_physmap);
+
+static struct attribute *cros_ec_keyb_attrs[] = {
+	&dev_attr_function_row_physmap.attr,
+	NULL,
+};
+
+static umode_t cros_ec_keyb_attr_is_visible(struct kobject *kobj,
+					    struct attribute *attr,
+					    int n)
+{
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct cros_ec_keyb *ckdev = dev_get_drvdata(dev);
+
+	if (attr == &dev_attr_function_row_physmap.attr &&
+	    !ckdev->num_function_row_keys)
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group cros_ec_keyb_attr_group = {
+	.is_visible = cros_ec_keyb_attr_is_visible,
+	.attrs = cros_ec_keyb_attrs,
+};
+
+
 static int cros_ec_keyb_probe(struct platform_device *pdev)
 {
 	struct cros_ec_device *ec = dev_get_drvdata(pdev->dev.parent);
@@ -617,6 +689,12 @@ static int cros_ec_keyb_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	err = devm_device_add_group(dev, &cros_ec_keyb_attr_group);
+	if (err) {
+		dev_err(dev, "failed to create attributes. err=%d\n", err);
+		return err;
+	}
+
 	ckdev->notifier.notifier_call = cros_ec_keyb_work;
 	err = blocking_notifier_chain_register(&ckdev->ec->event_notifier,
 					       &ckdev->notifier);
-- 
2.26.2

