Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37BAE2EA0AA
	for <lists+linux-input@lfdr.de>; Tue,  5 Jan 2021 00:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbhADXVo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Jan 2021 18:21:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727157AbhADXVn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Jan 2021 18:21:43 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C0AC061798
        for <linux-input@vger.kernel.org>; Mon,  4 Jan 2021 15:20:55 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id f132so33999233oib.12
        for <linux-input@vger.kernel.org>; Mon, 04 Jan 2021 15:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JZOlQj0JLO6r78FAjqdLGe/A26q+7HZVrLl16AaDzeg=;
        b=CdpERZg3rfH3oizVzPZrdaJBzWshww722TBp6ftNzokdkgMnu4wHbrlsRkjLPhxlXG
         FJEQSp4mppvf37oWc5P6Wid9q7hFMHJ8yhSCagsHGsBeFXeiaXVPHkgxwSVyRod2kxAI
         bYhlB/xNIddFkB+IOWFDimgg539IpYEVFNtes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JZOlQj0JLO6r78FAjqdLGe/A26q+7HZVrLl16AaDzeg=;
        b=HQySDzFd5NDjRAtO2XCCL8Vk/PazVFZnh9AjTxqcoH40IAQ3fSTsijVmlveuEEvOV6
         RXVVDA6Bk1RNSwRwj0EK+zACWXkwxK40FTBIndqRLzPH787N/vjEAl35KAF+suBOHUZO
         SfDKfMSmkLUOw9MRb/f8ND6QDXB8Y6yNbAi8dbxqEZBrTc2CLGKGE3kigKh4FHZHvh7f
         f0S+is252oxhBsqWgGwV4yx0nd0ugAVhrcofq50zmtKl9qorBX7V40pKyxeCRN5bAjWz
         fBU7ujF0GXSh6Xun+QvQASlAPD0EJntKYzCvjEDQ3GZsyrrYSeq9wFZur4o1tbHdiHd6
         E0/g==
X-Gm-Message-State: AOAM532xY6QyvNFR0zZYhBAl4jB9LStXHwv5g+9GlsSM8cbo5CURgbKW
        qGtnhVohuU6CWWKR2Epns+aQFvdbErTTTg==
X-Google-Smtp-Source: ABdhPJwSKAvbD4bhDGkhVibLnbKQLux/K3s7rmk67dw6xsu19NFT44XqApTwk4XprN2SLuF+IZjnlg==
X-Received: by 2002:a17:90a:cb8b:: with SMTP id a11mr1062501pju.3.1609800941694;
        Mon, 04 Jan 2021 14:55:41 -0800 (PST)
Received: from philipchen.mtv.corp.google.com ([2620:15c:202:201:a6ae:11ff:fe11:fd59])
        by smtp.gmail.com with ESMTPSA id c18sm54951051pfj.200.2021.01.04.14.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 14:55:41 -0800 (PST)
From:   Philip Chen <philipchen@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>, dmitry.torokhov@gmail.com
Cc:     dianders@chromium.org, swboyd@chromium.org,
        Philip Chen <philipchen@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org
Subject: [PATCH v2 2/2] Input: cros-ec-keyb - Expose function row physical map to userspace
Date:   Mon,  4 Jan 2021 14:55:32 -0800
Message-Id: <20210104145523.v2.2.Ibe7d7d53c5b4fe72c60de90111ff763b53f38dbb@changeid>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104145523.v2.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
References: <20210104145523.v2.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
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

Changes in v2:
- create function-row-physmap file in sysfs by parsing
  `function-row-physmap` property from DT
- assume the device already has a correct keymap to reflect the custom
  top-row keys (if they exist)

 drivers/input/keyboard/cros_ec_keyb.c | 72 +++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index b379ed7628781..06642e4ce9c63 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -27,6 +27,8 @@
 
 #include <asm/unaligned.h>
 
+#define MAX_NUM_TOP_ROW_KEYS   15
+
 /**
  * struct cros_ec_keyb - Structure representing EC keyboard device
  *
@@ -35,6 +37,7 @@
  * @row_shift: log2 or number of rows, rounded up
  * @keymap_data: Matrix keymap data used to convert to keyscan values
  * @ghost_filter: true to enable the matrix key-ghosting filter
+ * @has_custom_top_row_keys: true if the keyboard has custom top row keys
  * @valid_keys: bitmap of existing keys for each matrix column
  * @old_kb_state: bitmap of keys pressed last scan
  * @dev: Device pointer
@@ -49,6 +52,7 @@ struct cros_ec_keyb {
 	int row_shift;
 	const struct matrix_keymap_data *keymap_data;
 	bool ghost_filter;
+	bool has_custom_top_row_keys;
 	uint8_t *valid_keys;
 	uint8_t *old_kb_state;
 
@@ -587,6 +591,65 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	return 0;
 }
 
+static ssize_t function_row_physmap_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	ssize_t size = 0;
+	u8 i;
+	u16 code;
+	u32 top_row_key_code[MAX_NUM_TOP_ROW_KEYS] = {0};
+	struct cros_ec_keyb *ckdev = dev_get_drvdata(dev);
+
+	if (of_property_read_variable_u32_array(dev->of_node,
+						"function-row-physmap",
+						top_row_key_code,
+						0,
+						MAX_NUM_TOP_ROW_KEYS) > 0)
+		return 0;
+
+	ckdev->has_custom_top_row_keys = true;
+
+	for (i = 0; i < MAX_NUM_TOP_ROW_KEYS; i++) {
+		if (!top_row_key_code[i])
+			break;
+		code = MATRIX_SCAN_CODE(KEY_ROW(top_row_key_code[i]),
+					KEY_COL(top_row_key_code[i]),
+					ckdev->row_shift);
+		size += scnprintf(buf + size, PAGE_SIZE - size, "%02X ", code);
+	}
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
+	    !ckdev->has_custom_top_row_keys)
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
@@ -617,6 +680,12 @@ static int cros_ec_keyb_probe(struct platform_device *pdev)
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
@@ -632,6 +701,9 @@ static int cros_ec_keyb_probe(struct platform_device *pdev)
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

