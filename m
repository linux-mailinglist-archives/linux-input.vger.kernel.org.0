Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1C12F709A
	for <lists+linux-input@lfdr.de>; Fri, 15 Jan 2021 03:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732127AbhAOCbT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 21:31:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728625AbhAOCbS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 21:31:18 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56087C0613D3
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 18:30:38 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d2so4563347pfq.5
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 18:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+gQLInJtarBaVsca/9Zi73auZk42R13LChAml9yBQjs=;
        b=bawylaeN2YBTxilkUC4ATdKnIxiD9prdGPx1BaJMsUjsdCP6W00yK17kwIh8imypx7
         3UNKuWECX+4pqybhB8a+rTtqIi1NFHJCA1Mth5/Edrs31TNdGQHFPIFZ6/UOvby98rEu
         TcdVhIeZV5ScWeBpQ6dNiML//6k6THPwgBdW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+gQLInJtarBaVsca/9Zi73auZk42R13LChAml9yBQjs=;
        b=dO1eIH2ia0UPcm7sZwNmkR0PxcU7tC5LkRHi4NZau9tAQBzDE7GpVYYHR2Vk+7NSBS
         vxeCL8jSmR6jgl5FNdeqC4ZniZCgwigTMr/OuvHwaioaewAOcaCjqdKHviBWrHt7twCQ
         gjJc0M9XgOQE/L7wiuSKk9mTxosJ6eGXDajgVp/qIhgAIoS56tary7FmIvT8X0UV/0Ut
         D+NLDJgi0v6CQvNdLJn/mwY/f7jP2qjIfjLRvVLCo82bROcvZbBffLrTYpek5rvTNh+L
         D+f2EEuM5k8NBTXqpkiWqwXr6gl7XsMTP0Nx5DeTL5SP5YQRyf6U+vUM0+fAuLSIADpk
         SN6A==
X-Gm-Message-State: AOAM5316q8sJpC8u3uhis76vFCwb0SfIWn1fzAMAeLqdMzpsC8QQhiIb
        iMqfUuw9H1CeuOpj+o4NRbRBsA==
X-Google-Smtp-Source: ABdhPJx/+WjoDFP2gPrhBTkqJUA/Jk6sAVk+D8wWNUH3OEVKlDG3oJ2MIfsVoTSYf9c3SId9PrrWqQ==
X-Received: by 2002:a63:eb0c:: with SMTP id t12mr10496634pgh.7.1610677837917;
        Thu, 14 Jan 2021 18:30:37 -0800 (PST)
Received: from philipchen.mtv.corp.google.com ([2620:15c:202:201:a6ae:11ff:fe11:fd59])
        by smtp.gmail.com with ESMTPSA id b11sm6046429pjg.27.2021.01.14.18.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 18:30:37 -0800 (PST)
From:   Philip Chen <philipchen@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>, dmitry.torokhov@gmail.com
Cc:     swboyd@chromium.org, dianders@chromium.org,
        Philip Chen <philipchen@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org
Subject: [PATCH v6 2/2] Input: cros-ec-keyb - Expose function row physical map to userspace
Date:   Thu, 14 Jan 2021 18:30:31 -0800
Message-Id: <20210114183010.v6.2.I2c219435b0d06a84411ae35c3154e123c52fcd7d@changeid>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114183010.v6.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
References: <20210114183010.v6.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
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

So, enhance the cros-ec-keyb driver to create such a mapping
and expose it to userspace in the form of a function_row_physmap
attribute. The attribute would be a space separated ordered list of
row/column codes, for the keys in the function row, in a left-to-right
order.

The attribute will only be present when the device has a custom design
for the top-row keys.

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

Changes in v6:
- add to Documentation/ABI
- update cros_ec_keyb_register_matrix() to improve readability

Changes in v5:
- change the data type for a few local variables
- update function_row_physmap_show() and cros_ec_keyb_register_matrix()
  to improve readability/efficiency

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

 .../testing/sysfs-driver-input-cros-ec-keyb   |  6 ++
 drivers/input/keyboard/cros_ec_keyb.c         | 79 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-input-cros-ec-keyb

diff --git a/Documentation/ABI/testing/sysfs-driver-input-cros-ec-keyb b/Documentation/ABI/testing/sysfs-driver-input-cros-ec-keyb
new file mode 100644
index 0000000000000..c7afc2328045c
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-input-cros-ec-keyb
@@ -0,0 +1,6 @@
+What:		/sys/class/input/input(x)/device/function_row_physmap
+Date:		January 2021
+Contact:	Philip Chen <philipchen@chromium.org>
+Description:	A space separated list of scancodes for the top row keys,
+		ordered by the physical positions of the keys, from left
+		to right.
diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index b379ed7628781..38457d9641bdf 100644
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
+	size_t num_function_row_keys;
 };
 
 /**
@@ -527,6 +535,11 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	struct input_dev *idev;
 	const char *phys;
 	int err;
+	struct property *prop;
+	const __be32 *p;
+	u16 *physmap;
+	u32 key_pos;
+	int row, col;
 
 	err = matrix_keypad_parse_properties(dev, &ckdev->rows, &ckdev->cols);
 	if (err)
@@ -578,6 +591,21 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	ckdev->idev = idev;
 	cros_ec_keyb_compute_valid_keys(ckdev);
 
+	physmap = ckdev->function_row_physmap;
+	of_property_for_each_u32(dev->of_node, "function-row-physmap",
+				 prop, p, key_pos) {
+		if (ckdev->num_function_row_keys == MAX_NUM_TOP_ROW_KEYS) {
+			dev_warn(dev, "Only support up to %d top row keys\n",
+				 MAX_NUM_TOP_ROW_KEYS);
+			break;
+		}
+		row = KEY_ROW(key_pos);
+		col = KEY_COL(key_pos);
+		*physmap = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
+		physmap++;
+		ckdev->num_function_row_keys++;
+	}
+
 	err = input_register_device(ckdev->idev);
 	if (err) {
 		dev_err(dev, "cannot register input device\n");
@@ -587,6 +615,51 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	return 0;
 }
 
+static ssize_t function_row_physmap_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	ssize_t size = 0;
+	int i;
+	struct cros_ec_keyb *ckdev = dev_get_drvdata(dev);
+	u16 *physmap = ckdev->function_row_physmap;
+
+	for (i = 0; i < ckdev->num_function_row_keys; i++)
+		size += scnprintf(buf + size, PAGE_SIZE - size,
+				  "%s%02X", size ? " " : "", physmap[i]);
+	if (size)
+		size += scnprintf(buf + size, PAGE_SIZE - size, "\n");
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

