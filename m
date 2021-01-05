Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 101DA2EA351
	for <lists+linux-input@lfdr.de>; Tue,  5 Jan 2021 03:25:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbhAECXZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Jan 2021 21:23:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728047AbhAECXX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Jan 2021 21:23:23 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2340C061796
        for <linux-input@vger.kernel.org>; Mon,  4 Jan 2021 18:22:42 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id lj6so800883pjb.0
        for <linux-input@vger.kernel.org>; Mon, 04 Jan 2021 18:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hn4C3X73ZRbSUEbsAMTPQXDD220zuLG8ISgW8JZ0kw8=;
        b=ZVs0uBSCYstjUZV8aa/ghv2YMc+dygqubFe481E2kUOyqSeGsbK/5Qc0WkR5rdO/g3
         iI0z/umCQgz+slespf0fQctD0eRL5U9sy135yBKjJiNKelx/Yu1HNuG6vASFloLKhWPc
         aDW1tv05eLZ+ME0MfpTLFOvciysF5w/x46iaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hn4C3X73ZRbSUEbsAMTPQXDD220zuLG8ISgW8JZ0kw8=;
        b=WJyomeMe6oLL13maIsK7+1V4kogilHERJqaH54azkVSy9rtKfuz/VQvYJsN4sDbQ9v
         b19QYCD9en9UmstkLnxPMsal1ir0CNoj8+FhXlRrVOWHTVrAXdA0AQmxvjLGDqYhUEov
         BfJznNQnNXKIH6en0Eop9ryPGtwCUaIavlnYAbu9yGnxAMShd0YRxq+Qw+fuZCqjy9Nv
         ANrNsp6WjfT92pPSO9BqZFwdbI1LNnSDwd6M7XXEWY9xGV0ZdNjMtkGDWU7FPhMNWVFz
         K2W0mcbvH3534nl7C6Lv1T3/AbJOB0RV3fnQDyzfmY94geeNq8ydlo+F89Ie5MfOPxYd
         8ZKg==
X-Gm-Message-State: AOAM532UUsUnVfT8EzncUjAQ/xFu1o4fP4ouFY9M3nhxtayBALHlBjYC
        7quroglUIzeNjjdmO+c8FticzonSOI4g+Q==
X-Google-Smtp-Source: ABdhPJyWMHymXF4igTbKBfJVsA5Rb/egHmTti4iuRwMLoUXkwpt+7OHa4u095QBqwTrfCfVlMDhAHA==
X-Received: by 2002:a17:90b:1b49:: with SMTP id nv9mr1740967pjb.112.1609813362409;
        Mon, 04 Jan 2021 18:22:42 -0800 (PST)
Received: from philipchen.mtv.corp.google.com ([2620:15c:202:201:a6ae:11ff:fe11:fd59])
        by smtp.gmail.com with ESMTPSA id t23sm56732903pfc.0.2021.01.04.18.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 18:22:41 -0800 (PST)
From:   Philip Chen <philipchen@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>, dmitry.torokhov@gmail.com
Cc:     dianders@chromium.org, swboyd@chromium.org,
        Philip Chen <philipchen@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rajat Jain <rajatja@google.com>, linux-input@vger.kernel.org
Subject: [PATCH v3 2/2] Input: cros-ec-keyb - Expose function row physical map to userspace
Date:   Mon,  4 Jan 2021 18:22:34 -0800
Message-Id: <20210104182154.v3.2.Ibe7d7d53c5b4fe72c60de90111ff763b53f38dbb@changeid>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104182154.v3.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
References: <20210104182154.v3.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
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

Changes in v3:
- parse `function-row-physmap` from DT earlier, when we probe
  cros_ec_keyb, and then store the extracted info in struct cros_ec_keyb.

Changes in v2:
- create function-row-physmap file in sysfs by parsing
  `function-row-physmap` property from DT
- assume the device already has a correct keymap to reflect the custom
  top-row keys (if they exist)

 drivers/input/keyboard/cros_ec_keyb.c | 82 +++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index b379ed7628781..d804430d384d6 100644
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
@@ -49,6 +54,7 @@ struct cros_ec_keyb {
 	int row_shift;
 	const struct matrix_keymap_data *keymap_data;
 	bool ghost_filter;
+	bool has_custom_top_row_keys;
 	uint8_t *valid_keys;
 	uint8_t *old_kb_state;
 
@@ -58,6 +64,9 @@ struct cros_ec_keyb {
 	struct input_dev *idev;
 	struct input_dev *bs_idev;
 	struct notifier_block notifier;
+
+	u16 function_row_physmap[MAX_NUM_TOP_ROW_KEYS];
+	u8 num_function_row_keys;
 };
 
 /**
@@ -527,6 +536,8 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	struct input_dev *idev;
 	const char *phys;
 	int err;
+	u32 top_row_key_pos[MAX_NUM_TOP_ROW_KEYS] = {0};
+	u8 i;
 
 	err = matrix_keypad_parse_properties(dev, &ckdev->rows, &ckdev->cols);
 	if (err)
@@ -578,6 +589,22 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
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
@@ -587,6 +614,52 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
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
@@ -617,6 +690,12 @@ static int cros_ec_keyb_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	err = sysfs_create_group(&dev->kobj, &cros_ec_keyb_attr_group);
+	if (err) {
+		dev_err(dev, "failed to create attributes. err=%d\n", err);
+		return err;
+	}
+
 	ckdev->notifier.notifier_call = cros_ec_keyb_work;
 	err = blocking_notifier_chain_register(&ckdev->ec->event_notifier,
 					       &ckdev->notifier);
@@ -632,6 +711,9 @@ static int cros_ec_keyb_probe(struct platform_device *pdev)
 static int cros_ec_keyb_remove(struct platform_device *pdev)
 {
 	struct cros_ec_keyb *ckdev = dev_get_drvdata(&pdev->dev);
+	struct device *dev = &pdev->dev;
+
+	sysfs_remove_group(&dev->kobj, &cros_ec_keyb_attr_group);
 
 	blocking_notifier_chain_unregister(&ckdev->ec->event_notifier,
 					   &ckdev->notifier);
-- 
2.26.2

