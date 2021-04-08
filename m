Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFCC0358444
	for <lists+linux-input@lfdr.de>; Thu,  8 Apr 2021 15:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbhDHNMf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Apr 2021 09:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231255AbhDHNMe (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Apr 2021 09:12:34 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D685C061760
        for <linux-input@vger.kernel.org>; Thu,  8 Apr 2021 06:12:22 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id s17so2196826ljc.5
        for <linux-input@vger.kernel.org>; Thu, 08 Apr 2021 06:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RVS/LU7jqjcdXf4E5Cbtx0sONNBFIluxdVbfhRy1+Lk=;
        b=jjZ+8Zay6JXOc0ieQniwN+KRK114jxztN+s9xArVb/1/+V3X4orFicDBMg0e4mmQ7B
         lJV2U5dcEE5K0GKGRiyZtQ20hS1zImSewG7e3wQEsLOx+5YPH7Za0eY+cc3TLNpYu9V2
         tZvGh2wmreLRZQ0pkSpy3UYb8ULIeGrfGY6XMkZobEbnS4Lf1GtnWfxDQyA3nwT2Rs+l
         uGplaiItKgfGtNvcc51A2aXYgLWdFonUsiAb1qdUgJ+L6aR0WkRjP5PaAXBjhFXVMReN
         HUioHKDEGKlRCXLyAEY9Z3oB/naEQtY6l3ina6ZnYGPOqcnz9Bvrk/kGPza/9NT+hBt9
         s/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RVS/LU7jqjcdXf4E5Cbtx0sONNBFIluxdVbfhRy1+Lk=;
        b=eGRNuYu3rj3AxYuyWlw1FcjHECnj+gjJPrLtyQigjmrcHqJw+pi/vZ13EX/Y7HdGIC
         A3fOtvjxe/KEQJPM0cetHO3//xsimny00hMg3JsNLb8qltYfi85IReUBitxqNwngONWB
         u0vw/li2TmtVGqRaWf1G+wiXkAr9uNhqa7/4qKViuPdZOpKb3TV+Xbzo6ReJaLKnrH1O
         bQ5Ga4LI2lF3eIxMbxj0g6bGltfz4xFLS8I8gzk84W0aM0jayy6svvWvsW3IzCd0cr2m
         MV14ZnBrdOaFnsnjYfojchm0K5SvpQH1PEKEaXouIpBTVgA6XbAZYbALTT02eCuktDbb
         TOkQ==
X-Gm-Message-State: AOAM5330+RBPsCqLd4KqVMw5WVTRQaGiT9h7rH+5mENTBhHmDOuz4x9S
        slXhAL2i0Uw/IkmbQS3/xmWZLk+4a9HxqzgV
X-Google-Smtp-Source: ABdhPJwJK4NSeYR+/7YwCZfJ3V0c3MrCN4v6HQMi2W+wRQUQdC2RmOIKblMOzAz/qQ+Rvhoua07xHw==
X-Received: by 2002:a2e:bba1:: with SMTP id y33mr2887671lje.345.1617887540797;
        Thu, 08 Apr 2021 06:12:20 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id z7sm126936ljm.102.2021.04.08.06.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 06:12:20 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/8 v3] Input: cyttsp - Obtain regulators
Date:   Thu,  8 Apr 2021 15:11:48 +0200
Message-Id: <20210408131153.3446138-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210408131153.3446138-1-linus.walleij@linaro.org>
References: <20210408131153.3446138-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The CYTTSP TMA340 chips have two supplies: VCPIN and
VDD for analog and digital voltage respectively.
Add some minimal code to obtain and enable these
regulators if need be.

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v3:
- Collect Javier's reviewed-by.
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

