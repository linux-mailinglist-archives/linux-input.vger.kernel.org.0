Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2B12E0411
	for <lists+linux-input@lfdr.de>; Tue, 22 Dec 2020 02:49:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725807AbgLVBtZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Dec 2020 20:49:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgLVBtY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Dec 2020 20:49:24 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34578C061248
        for <linux-input@vger.kernel.org>; Mon, 21 Dec 2020 17:48:16 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id b8so6613213plx.0
        for <linux-input@vger.kernel.org>; Mon, 21 Dec 2020 17:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K1LHXBytfI76uJ+Q0fQC7ufBawjIu6kcWpfQ3+EC1Vw=;
        b=KaSG8szVWROO86ga8ksTHNDZiv+58qdqkzV5S/UjWri1aHGqK9s8OqpplnuNAiKOPQ
         znDx/xFcTm8D/MNGGXsxPSmXygXlsazvJMr7DLh4ik3uqFPtKRmPuGRr39bFRwU0wgPk
         AuqlFycjlF2jpIdEGJpp+oF+3yOg5O/KBwvkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K1LHXBytfI76uJ+Q0fQC7ufBawjIu6kcWpfQ3+EC1Vw=;
        b=VeGCFmZFxqZ2A9+jCO9oSMTnaoxXkWpdaoL3ovvsv9Uw7ywYQrD8K1lTa8zZ3qKv6g
         wyvI2vljFSkbH/cpk87syWfHpxMRkA443Sd1o+cEhgQ9ghvdXqIm4PAZkY77+Bh7uXRx
         s4lbhGq+WdwQ+/psY/mFv5vm4lisSn7HXDCvP/1fH4x0Q3uH+UrO5dSi0iztu9SC8jcU
         qnBT9KjXzI2cjkNMrRxS1wSy2eoNNofnX6yEiD7wJqduHXsiWbe+EAjt0AzIy3g5aV7l
         Xry3Rk/CWn4TE80f2Zc9ZHlFqmrgujNTohCgmXCKE6FcziQmCHx0HZkA27Q3mFNtMD5C
         WR7w==
X-Gm-Message-State: AOAM530Ui48ycDcVxxrodTP4Lb1RazLBSvrr1PwoQLprOnrMRS8IyANj
        btoJI1W9KqdISwmCghb4U88MqA==
X-Google-Smtp-Source: ABdhPJyBRfxwrU7hAsQuLM8YY5s4JGPgCC4cvg67S94IeDEdWEb7UWWeskQXWQX3HCGIpHEtPhO3HA==
X-Received: by 2002:a17:902:7205:b029:db:d2d5:fe79 with SMTP id ba5-20020a1709027205b02900dbd2d5fe79mr18880303plb.30.1608601695797;
        Mon, 21 Dec 2020 17:48:15 -0800 (PST)
Received: from philipchen.mtv.corp.google.com ([2620:15c:202:201:a6ae:11ff:fe11:fd59])
        by smtp.gmail.com with ESMTPSA id h8sm20164316pjc.2.2020.12.21.17.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 17:48:15 -0800 (PST)
From:   Philip Chen <philipchen@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dtor@chromium.org, swboyd@chromium.org, dianders@chromium.org,
        rajatja@chromium.org, Philip Chen <philipchen@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rajat Jain <rajatja@google.com>, linux-input@vger.kernel.org
Subject: [PATCH 3/3] Input: cros-ec-keyb - Expose function row physical map to userspace
Date:   Mon, 21 Dec 2020 17:47:59 -0800
Message-Id: <20201221174751.3.I48f45bea10c670224ad7429835d1d00da478dc7d@changeid>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201221174751.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
References: <20201221174751.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
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

This patch enhances the cros-ec-keyb driver to create such a mapping and
expose it to userspace in the form of a function-row-physmap attribute.
The attribute would be a space separated ordered list of row/column codes,
for the keys in the function row, in left-to-right order.

The attribute will only be present when cros-ec-keyb sends action key
codes for the top-row keys, otherwise the attribute shall not be
visible.

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

 drivers/input/keyboard/cros_ec_keyb.c | 59 +++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index c997ec5c5d469..4f2f98bb14663 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -658,6 +658,56 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	return 0;
 }
 
+static ssize_t function_row_physmap_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	ssize_t size = 0;
+	u8 i;
+	u16 code;
+	struct cros_ec_keyb *ckdev = dev_get_drvdata(dev);
+
+	if (!ckdev->num_function_row_keys)
+		return 0;
+
+	for (i = 0; i < ckdev->num_function_row_keys; i++) {
+		code = MATRIX_SCAN_CODE(top_row_key_pos[i].row,
+					top_row_key_pos[i].col,
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
@@ -688,6 +738,12 @@ static int cros_ec_keyb_probe(struct platform_device *pdev)
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
@@ -703,6 +759,9 @@ static int cros_ec_keyb_probe(struct platform_device *pdev)
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

