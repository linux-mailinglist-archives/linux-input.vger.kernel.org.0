Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28FCA34E38C
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 10:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbhC3Iyu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 04:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231124AbhC3Iyb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 04:54:31 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048D4C061762
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 01:54:31 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 12so12240810lfq.13
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 01:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m07c7y4tYH8unWOnb0Pzb8s2m7otaYJx80OAF9fD+f0=;
        b=Fg3QDwtcUyKXxHPTnQ9okrcd3c7vQXlhG96RXgde/r/libmG9B9dTRqxqYW5vVLSLQ
         V7SgqADrcFvxfLFgKo/JdF8Y7svn43VvERvMhllPTyIpbf6CzC6lxNcypRndZTs+cdWB
         EBCcHQTQPz3zOvlv4O89G9cvkyM/bMHG4CZBhhPtdgd4ZvE2Lhd3/oUc3pU+rSgOBpVP
         /E95ZHjBQ+PLBGEGMv0+C9HI8RV+34vtJHWSlWWstEyR9cnM0efvIOjWENZ2keJmJEwi
         4aF1HXCswy4ayTJNb3dDxTyz8dzeJyoO749AFZqHadgJg5Xkdh8+a7uLgUtAdNdkv0pa
         F3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m07c7y4tYH8unWOnb0Pzb8s2m7otaYJx80OAF9fD+f0=;
        b=Auq0CQU9LhLH0JMT1ZAve0+JIQul351lGZuInZZsnwbO2DCYLrRQURcVyadfduGmeh
         35ZUVI/ro2XG3kG7n0K9/1V4I+a3d8FZGVvsU0ofchJ2ciGBU2HqmoHrkzjdVRm9bCih
         t/8++JR3J5C8ab+MAKNKWqAmfryDX6h5SSkeuE56Du8WjK6Z90DSs+bMzY9WTE0YFhW9
         xctkH6c5oD9LAIgU0RzCmvgzDC5EYy5d4XKOa02XMeXR1Yaiz8GxzQ/6eXFMltQuGAsZ
         iV8lnd1A8SsPl9bztlUgTfV/iudThifY+vzZerdPytlBSaVOvAuyn5cTo4EArs7DKYkq
         T+Ag==
X-Gm-Message-State: AOAM533qO65ntP/rG3nWoz2AOoXN60i/+cu90+abXWrqspktEB4uhAHL
        YYc4Q5IblFczIXjoL2Nga3bqMqv1GuSjMYS0
X-Google-Smtp-Source: ABdhPJwslOtl3CjuzuFsJi9+tNgZCWmonHL1QpnGU+TjPA+okPoNV+qYv6kNv5KRcC6qByl1uUrdmw==
X-Received: by 2002:ac2:5519:: with SMTP id j25mr19976516lfk.220.1617094469544;
        Tue, 30 Mar 2021 01:54:29 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id 201sm2104238lfm.108.2021.03.30.01.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 01:54:29 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/7] Input: cyttsp - Obtain regulators
Date:   Tue, 30 Mar 2021 10:54:19 +0200
Message-Id: <20210330085424.2244653-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330085424.2244653-1-linus.walleij@linaro.org>
References: <20210330085424.2244653-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The CYTTSP TMA340 chips have two supplies: VCPIN and
VDD for analog and digital voltage respectively.
Add some minimal code to obtain and enable these
regulators if need be.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/cyttsp_core.c | 30 +++++++++++++++++++++++--
 drivers/input/touchscreen/cyttsp_core.h |  2 ++
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index b9772192b5ea..a19d7cce95ca 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/property.h>
 #include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
 
 #include "cyttsp_core.h"
 
@@ -621,6 +622,19 @@ struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
 	ts->bus_ops = bus_ops;
 	ts->irq = irq;
 
+	/*
+	 * VCPIN is the analog voltage supply
+	 * VDD is the digital voltage supply
+	 */
+	ts->regulators[0].supply = "vcpin";
+	ts->regulators[1].supply = "vdd";
+	error = devm_regulator_bulk_get(dev, ARRAY_SIZE(ts->regulators),
+					ts->regulators);
+	if (error) {
+		dev_err(dev, "Failed to get regulators: %d\n", error);
+		return ERR_PTR(error);
+	}
+
 	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ts->reset_gpio)) {
 		error = PTR_ERR(ts->reset_gpio);
@@ -666,20 +680,32 @@ struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
 
 	disable_irq(ts->irq);
 
+	error = regulator_bulk_enable(ARRAY_SIZE(ts->regulators),
+				      ts->regulators);
+	if (error) {
+		dev_err(dev, "Cannot enable regulators: %d\n", error);
+		return ERR_PTR(error);
+	}
+
 	cyttsp_hard_reset(ts);
 
 	error = cyttsp_power_on(ts);
 	if (error)
-		return ERR_PTR(error);
+		goto err_dis_reg;
 
 	error = input_register_device(input_dev);
 	if (error) {
 		dev_err(ts->dev, "failed to register input device: %d\n",
 			error);
-		return ERR_PTR(error);
+		goto err_dis_reg;
 	}
 
 	return ts;
+
+err_dis_reg:
+	regulator_bulk_disable(ARRAY_SIZE(ts->regulators),
+			       ts->regulators);
+	return ERR_PTR(error);
 }
 EXPORT_SYMBOL_GPL(cyttsp_probe);
 
diff --git a/drivers/input/touchscreen/cyttsp_core.h b/drivers/input/touchscreen/cyttsp_core.h
index 8c651336ac12..c102a094e888 100644
--- a/drivers/input/touchscreen/cyttsp_core.h
+++ b/drivers/input/touchscreen/cyttsp_core.h
@@ -23,6 +23,7 @@
 #include <linux/types.h>
 #include <linux/device.h>
 #include <linux/input/cyttsp.h>
+#include <linux/regulator/consumer.h>
 
 #define CY_NUM_RETRY		16 /* max number of retries for read ops */
 
@@ -123,6 +124,7 @@ struct cyttsp {
 	enum cyttsp_state state;
 	bool suspended;
 
+	struct regulator_bulk_data regulators[2];
 	struct gpio_desc *reset_gpio;
 	bool use_hndshk;
 	u8 act_dist;
-- 
2.29.2

