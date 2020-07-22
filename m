Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 552682292C4
	for <lists+linux-input@lfdr.de>; Wed, 22 Jul 2020 09:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgGVH6h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Jul 2020 03:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726153AbgGVH6g (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jul 2020 03:58:36 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 926C1C0619DC
        for <linux-input@vger.kernel.org>; Wed, 22 Jul 2020 00:58:36 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id z24so1469213ljn.8
        for <linux-input@vger.kernel.org>; Wed, 22 Jul 2020 00:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QbAV89qrrKIACpY0C/Mhq61biM+O6+R6Lj7W2yCr7hE=;
        b=EjDgkA/6Lu/0hNTaBhbuYESga8oUhfGm8xhz9KLlnfXT4czTKSTkMgTbZqw0JFBGqU
         JbKxSd7MlZyg4/weQYKftlDihDF4oapNklC6ruSOvEyLI4c4YpVXjfkBLuR0aMtRFdwt
         O9zMif53znpncvq6j1jVErNrJBXxW0a1yKkZlcofjNVGI2NWRoa96s1SbuLU2hqanFYJ
         x6drfG/w766jim4YwOjIEWDjRUqgf4hxFzDyJ9yrLb2ewWJbApCq+KO6uk/Rk4nLIW2z
         OkvcsbHpSinnHWhGs//GZz1+SlIHNdEMIcCKQHJsAxZFY+hgpp7T+hVxgAqwudqi3mcs
         IQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QbAV89qrrKIACpY0C/Mhq61biM+O6+R6Lj7W2yCr7hE=;
        b=hQhl0CzoIRaIEHUzgTX+SHDMDo5X1LQTbs/TY4hQUbEoy/je/7Xh08lJp++YXygZHb
         35GWfioKIvhwu2hnjfNwbKDSgdXL+hnGMWUlUr0vqS3oddni+GzYSZpirM8Ca5eo1tHF
         Zod/ChLOkK7Hgv0T5oEx369wFQ0wgCbOh+s0Gdc3StnkofgHa7vSEWOQS3cvWdt5SSxN
         CLnsLUtnvD6c+vsGHGdkPLcZwxfw8J471AfHKWgupmHfHdj7JtajsP3xKWif/97wGGgM
         xL/OirZ69JByw1M0bGAE+Za4PirVoPbB2nN6geIj6Fzp0vWtk3beYUCwDAT5sH6bePNq
         wV/A==
X-Gm-Message-State: AOAM533hfYswHN5iIqr1JIjsBSMGp1cKFbWbaeXO822BxCfqlZFaCu+1
        KgAxCKrvbfB177T6VPzdW8UkGw==
X-Google-Smtp-Source: ABdhPJzLnS1C+cYDICXQhydYgEAy6QBOg2MQluGJGPIi2S0FgGVgpeBunpNHuZ8o1bSnFrEcK2pfNg==
X-Received: by 2002:a2e:9207:: with SMTP id k7mr14228507ljg.120.1595404715023;
        Wed, 22 Jul 2020 00:58:35 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id h15sm6184322ljj.105.2020.07.22.00.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 00:58:34 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Eudean Sun <eudean@arista.com>,
        =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Subject: [PATCH] HID: cp2112: Use irqchip template
Date:   Wed, 22 Jul 2020 09:56:32 +0200
Message-Id: <20200722075632.57962-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This makes the driver use the irqchip template to assign
properties to the gpio_irq_chip instead of using the
explicit calls to gpiochip_irqchip_add(). The irqchip is
instead added while adding the gpiochip.

Cc: Eudean Sun <eudean@arista.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hid/hid-cp2112.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index db1b55df0d13..222340e27e5f 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -1235,6 +1235,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	struct cp2112_device *dev;
 	u8 buf[3];
 	struct cp2112_smbus_config_report config;
+	struct gpio_irq_chip *girq;
 	int ret;
 
 	dev = devm_kzalloc(&hdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -1338,6 +1339,15 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	dev->gc.can_sleep		= 1;
 	dev->gc.parent			= &hdev->dev;
 
+	girq = &dev->gc.irq;
+	girq->chip = &cp2112_gpio_irqchip;
+	/* The event comes from the outside so no parent handler */
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_simple_irq;
+
 	ret = gpiochip_add_data(&dev->gc, dev);
 	if (ret < 0) {
 		hid_err(hdev, "error registering gpio chip\n");
@@ -1353,17 +1363,8 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	chmod_sysfs_attrs(hdev);
 	hid_hw_power(hdev, PM_HINT_NORMAL);
 
-	ret = gpiochip_irqchip_add(&dev->gc, &cp2112_gpio_irqchip, 0,
-				   handle_simple_irq, IRQ_TYPE_NONE);
-	if (ret) {
-		dev_err(dev->gc.parent, "failed to add IRQ chip\n");
-		goto err_sysfs_remove;
-	}
-
 	return ret;
 
-err_sysfs_remove:
-	sysfs_remove_group(&hdev->dev.kobj, &cp2112_attr_group);
 err_gpiochip_remove:
 	gpiochip_remove(&dev->gc);
 err_free_i2c:
-- 
2.26.2

