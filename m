Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD6237790A
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 00:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbhEIWfh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 May 2021 18:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbhEIWfg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 May 2021 18:35:36 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0124C061574
        for <linux-input@vger.kernel.org>; Sun,  9 May 2021 15:34:31 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id v5so18458604ljg.12
        for <linux-input@vger.kernel.org>; Sun, 09 May 2021 15:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ar6y7hws/LzmglxytevCO91fs4jxRRoR8GPk0J3Q6Ac=;
        b=B2ePBmDEqXYd1ZSE44p4Adatv2UF08L/P1xZs+SElkXnTBiLN1wstcyjuJaoOOPXf4
         it9m/N6jTlMhOyA4UJ1Cw2DErkIMGmej0Ryh3AhaTR+bo+m2e2BFdHeQMFrMzDfGvXC7
         v+8mYYEc65TzxTnKnduCJ20/SjZt7zbkB/DxRj4M/tflYfJIMyeNbWM+VMcNuaQKyeYW
         pCCksg7JWSA+NnEvQVILV8ZNo+Tr8khRwH8AayBtqedOxYsh0MuR66lvc4hc7X6hvOYc
         tlCOhm5/K4h46jwkgCvmBxzgu9nmRUQ7pRNUDMjKWTHcAzWk1hX1rKTX0KTNT9AW2kvI
         FSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ar6y7hws/LzmglxytevCO91fs4jxRRoR8GPk0J3Q6Ac=;
        b=JUSGvVtfiBpTWGyCvZ7O7xsSwim+N9N9eHBzhuln62sfP6m8/k2eQWUwX2paJ2rrPT
         C7gQm1ikVqQGsIdheyB95tH3PA+USQb453lLvoe5bDJgM+Mc2IQ2FQcW1ABXL8n530tG
         ppPTyOFtXMT4E1fWjt+AnxIk/wwSNHXeppEw0imfdxmIiAoBvBI7M1nTtNvAwIV7qDFW
         6Qd0d1WrduG5j1dV5y37qjJcNg2adgYqZp3YQ9XgtXl36pctp965mgvspaTUhvQxf2oT
         jeK5ROFDgOiYMcX8fIMalZ7XHksSHGvaiPDcKwba3ID32TqXzErQuz1Km2Hsds2J+z3L
         B52A==
X-Gm-Message-State: AOAM5336qTQ+JOAPmo2PtmanesPN+EPEkUTp1o/IQ9kZ4FD9lQecmIv2
        oAGWR3XTKutqOXlVKyX2k4a8Zw==
X-Google-Smtp-Source: ABdhPJz0BwXgpiRVmm05vC5QAbVT4Xkfon+pVLdk1EHxCCvy1hvLM1mAxHt44yvlukyKpgdYXMbzwg==
X-Received: by 2002:a2e:9ad9:: with SMTP id p25mr17858683ljj.127.1620599670507;
        Sun, 09 May 2021 15:34:30 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id a16sm2022257lfl.51.2021.05.09.15.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 15:34:30 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3 v5] Input: cyttsp - Probe from compatibles
Date:   Mon, 10 May 2021 00:34:15 +0200
Message-Id: <20210509223416.346104-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210509223416.346104-1-linus.walleij@linaro.org>
References: <20210509223416.346104-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver (both SPI and I2C interface) should probe from
the compatible strings, cypress,cy8ctma340 etc when using
device tree, not as now, where it is probing implicitly from
the I2C/SPI node name "cypress,cyttsp-i2c" etc.

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v5:
- Rebase on v5.13-rc1
ChangeLog v1->v3:
- Add MODULE_DEVICE_TABLE() for both sets of compatible
  strings.
- Collect Javiers review tag.
---
 drivers/input/touchscreen/cyttsp_i2c.c | 8 ++++++++
 drivers/input/touchscreen/cyttsp_spi.c | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/input/touchscreen/cyttsp_i2c.c b/drivers/input/touchscreen/cyttsp_i2c.c
index 061debf64a2b..0a09f07bc23a 100644
--- a/drivers/input/touchscreen/cyttsp_i2c.c
+++ b/drivers/input/touchscreen/cyttsp_i2c.c
@@ -52,10 +52,18 @@ static const struct i2c_device_id cyttsp_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, cyttsp_i2c_id);
 
+static const struct of_device_id cyttsp_of_i2c_match[] = {
+	{ .compatible = "cypress,cy8ctma340", },
+	{ .compatible = "cypress,cy8ctst341", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cyttsp_of_i2c_match);
+
 static struct i2c_driver cyttsp_i2c_driver = {
 	.driver = {
 		.name	= CY_I2C_NAME,
 		.pm	= &cyttsp_pm_ops,
+		.of_match_table = cyttsp_of_i2c_match,
 	},
 	.probe		= cyttsp_i2c_probe,
 	.id_table	= cyttsp_i2c_id,
diff --git a/drivers/input/touchscreen/cyttsp_spi.c b/drivers/input/touchscreen/cyttsp_spi.c
index 54e410921d53..8715e5354d79 100644
--- a/drivers/input/touchscreen/cyttsp_spi.c
+++ b/drivers/input/touchscreen/cyttsp_spi.c
@@ -160,10 +160,18 @@ static int cyttsp_spi_probe(struct spi_device *spi)
 	return 0;
 }
 
+static const struct of_device_id cyttsp_of_spi_match[] = {
+	{ .compatible = "cypress,cy8ctma340", },
+	{ .compatible = "cypress,cy8ctst341", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cyttsp_of_spi_match);
+
 static struct spi_driver cyttsp_spi_driver = {
 	.driver = {
 		.name	= CY_SPI_NAME,
 		.pm	= &cyttsp_pm_ops,
+		.of_match_table = cyttsp_of_spi_match,
 	},
 	.probe  = cyttsp_spi_probe,
 };
-- 
2.30.2

