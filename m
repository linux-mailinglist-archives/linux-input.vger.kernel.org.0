Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 919D937790C
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 00:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbhEIWfj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 May 2021 18:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbhEIWfi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 May 2021 18:35:38 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDFE8C061573
        for <linux-input@vger.kernel.org>; Sun,  9 May 2021 15:34:33 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id h4so20604037lfv.0
        for <linux-input@vger.kernel.org>; Sun, 09 May 2021 15:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/XEFvoPEC4OvoR2e/02RptgwEhAcqU67gkc7kt6cnxs=;
        b=xndKYbbwsWOL44jQWznLh01SJuKlxf9TFsfpLaVW2PXcvwI2AH9SooYs7kIe07vS2v
         PY4UWTyhodMl7F4kzjPAwg1D+iDeUgL+NNncnU+4X3+OU0B4UFylY4ddnmeCz1Ho8Cc7
         pRFYCi9fLzD0yuvEweM/KI6/ALJ7ostMq6VQ1+kX7y25la5pSCDiaxt+cHIaKDwmqJAD
         mQi0RzeEhDCXIt7L6J+YMbGFNJOlBjp9VX6R3qZzsGWuHSp/sV4CEAYJ4vo0bRjejS5G
         EALJM5fAO0VeoC4x6ICE45gAZ8PtEyGAR3LXXf2KsGamWBhZVMjgFdjfxWqadyorinb/
         xfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/XEFvoPEC4OvoR2e/02RptgwEhAcqU67gkc7kt6cnxs=;
        b=EZZzIXTmXvmX8Re9mOeUAn4Tv+tsBB9b0Yjne9f7o7ElU5LP83BBdke+7zuN0SZR8f
         /wcMeCdswFw4seMCa5uxKN2AhYN5CM3Dd4ZLhC74WYh0Mw5PrGxKJRXfCW+vpM7qfj65
         J78HiBIhWC1exieDKjUZQv9LxYB6wQN3jQSF4eo6qi2jTFMEBu0EFIKb6eJC0gFN1M+o
         yomwM9bVT/zFvCFiLS3vHrK+j3GQdnOWJ9Obxnxp9Johdeo3DYaTJBtYh8ZP1X1YMXdr
         p6EIRqlizsKAxDd/76V73bjWJBxb9alfMNt6V2Ut47l7+LjQwgNl0IKh0SHme8dHSOyC
         MBfA==
X-Gm-Message-State: AOAM533ih1jM+KX6Jy9ICmiAFW5hEqsMx9ID4sJCjMtEfcgVwMgzsjx8
        5YAr86HNQSfrg/BaTp1e8iIZhuuDvUtDOg==
X-Google-Smtp-Source: ABdhPJzpGxeHh37T0Nvu+r45fEEQyJN4Tk3a+0DbjfEolPGMnjhdcXehEKU2MFRuO6r023L6/PXlMA==
X-Received: by 2002:a19:f707:: with SMTP id z7mr14421374lfe.653.1620599672289;
        Sun, 09 May 2021 15:34:32 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id a16sm2022257lfl.51.2021.05.09.15.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 15:34:32 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3 v5] Input: cyttsp - Obtain regulators
Date:   Mon, 10 May 2021 00:34:16 +0200
Message-Id: <20210509223416.346104-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210509223416.346104-1-linus.walleij@linaro.org>
References: <20210509223416.346104-1-linus.walleij@linaro.org>
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
ChangeLog v3->v5:
- Rebase on v5.13-rc1
ChangeLog v1->v3:
- Collect Javier's reviewed-by.
---
 drivers/input/touchscreen/cyttsp_core.c | 30 +++++++++++++++++++++++--
 drivers/input/touchscreen/cyttsp_core.h |  2 ++
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index 106dd4962785..5af4d034b36b 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/property.h>
 #include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
 
 #include "cyttsp_core.h"
 
@@ -628,6 +629,19 @@ struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
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
@@ -673,20 +687,32 @@ struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
 		return ERR_PTR(error);
 	}
 
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
index 9bc4fe7e6ac5..8eba9d8ba74a 100644
--- a/drivers/input/touchscreen/cyttsp_core.h
+++ b/drivers/input/touchscreen/cyttsp_core.h
@@ -23,6 +23,7 @@
 #include <linux/types.h>
 #include <linux/device.h>
 #include <linux/input/cyttsp.h>
+#include <linux/regulator/consumer.h>
 
 #define CY_NUM_RETRY		16 /* max number of retries for read ops */
 
@@ -122,6 +123,7 @@ struct cyttsp {
 	enum cyttsp_state state;
 	bool suspended;
 
+	struct regulator_bulk_data regulators[2];
 	struct gpio_desc *reset_gpio;
 	bool use_hndshk;
 	u8 act_dist;
-- 
2.30.2

