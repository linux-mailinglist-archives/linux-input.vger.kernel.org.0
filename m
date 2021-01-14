Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 579B02F5616
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 02:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbhANBlq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Jan 2021 20:41:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbhANBlq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Jan 2021 20:41:46 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27434C06179F
        for <linux-input@vger.kernel.org>; Wed, 13 Jan 2021 17:25:21 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id b5so2304890pjl.0
        for <linux-input@vger.kernel.org>; Wed, 13 Jan 2021 17:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ALt5s9g3woYhgiX6pjcbXt830XUUU6zcEA+TyNk4b0w=;
        b=guVsqAgHIX323CPVurxFbAwEoOIvvbyWMPd5sKB5xN0IJ0viJxwHOFqUHRfdwIBWpn
         uZK2xs3QKehzIMYl2tEKpe/n+IRl5S5UbprtxxF8OWpxlF41C4QhMuCXBLU1NsMP6m4X
         APevqonjTCACoy43Pa1MyZu7g1DHyN+QvcS4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ALt5s9g3woYhgiX6pjcbXt830XUUU6zcEA+TyNk4b0w=;
        b=M9fm2TnzuaRj0Szy3nImNxHEc9buxfWzNtSA6iGeQK9XGv79cZA4Ra3fUSRKYP44+F
         CZsRX4n2wFtBaeCx2F+3NXwTi1bAXFr75ZvR4QqdJivSajSUu8Z24GxZzDuoG7mYBKH8
         ItZd50djwjbsPO7l9orO4rLXqyNd9RpEU9YCbQFmbCyzNUAIVvtJawzuACU+hFnPUk3Y
         S/qkSGjzE6t6voHjmxhwq0KRtZW2t/tat/1VcPcYi4dnWx1PxyOWYrYf8npY794oYaEa
         bpj39P7iN7Aom6KMEWGDyvC61S0lGtqgkuJVp/Xfk9+MFe7Yd1l7AnSG+ow8henebO+m
         hZDw==
X-Gm-Message-State: AOAM531v2QUN6D3XnKWzvoe0Qre28AGlI6bRlzsf5sJJMozXtpT8Oc9D
        TjThkhfWv9wuviai1XwxD209cg==
X-Google-Smtp-Source: ABdhPJz2smE3nBuHvgUyTEtDXB9OHRfDfpAsllaGTyw4XVbXBQh5yAS6z3kxeyeho5K6n6QL55al9w==
X-Received: by 2002:a17:902:8607:b029:db:eb10:eebb with SMTP id f7-20020a1709028607b02900dbeb10eebbmr5198675plo.43.1610587520724;
        Wed, 13 Jan 2021 17:25:20 -0800 (PST)
Received: from philipchen.mtv.corp.google.com ([2620:15c:202:201:a6ae:11ff:fe11:fd59])
        by smtp.gmail.com with ESMTPSA id w90sm3782703pjw.10.2021.01.13.17.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 17:25:20 -0800 (PST)
From:   Philip Chen <philipchen@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>, dmitry.torokhov@gmail.com
Cc:     dianders@chromium.org, swboyd@chromium.org,
        Philip Chen <philipchen@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rajat Jain <rajatja@google.com>, linux-input@vger.kernel.org
Subject: [PATCH v5 2/2] Input: cros-ec-keyb - Expose function row physical map to userspace
Date:   Wed, 13 Jan 2021 17:25:13 -0800
Message-Id: <20210113172450.v5.2.I38e90f114f0311b8aa3bcfff750ba381c09dd3b6@changeid>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113172450.v5.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
References: <20210113172450.v5.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
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

 drivers/input/keyboard/cros_ec_keyb.c | 76 +++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index b379ed7628781..273e3c9ba0b03 100644
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
@@ -527,6 +535,10 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	struct input_dev *idev;
 	const char *phys;
 	int err;
+	struct property *prop;
+	const __be32 *p;
+	u32 key_pos;
+	int i = 0;
 
 	err = matrix_keypad_parse_properties(dev, &ckdev->rows, &ckdev->cols);
 	if (err)
@@ -578,6 +590,19 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	ckdev->idev = idev;
 	cros_ec_keyb_compute_valid_keys(ckdev);
 
+	of_property_for_each_u32(dev->of_node, "function-row-physmap",
+				 prop, p, key_pos) {
+		if (i >= MAX_NUM_TOP_ROW_KEYS) {
+			dev_err(dev, "Only support up to %d top row keys.\n",
+				MAX_NUM_TOP_ROW_KEYS);
+			break;
+		}
+		ckdev->function_row_physmap[i] = MATRIX_SCAN_CODE(
+			KEY_ROW(key_pos), KEY_COL(key_pos), ckdev->row_shift);
+		i++;
+	}
+	ckdev->num_function_row_keys = i;
+
 	err = input_register_device(ckdev->idev);
 	if (err) {
 		dev_err(dev, "cannot register input device\n");
@@ -587,6 +612,51 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
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
@@ -617,6 +687,12 @@ static int cros_ec_keyb_probe(struct platform_device *pdev)
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

