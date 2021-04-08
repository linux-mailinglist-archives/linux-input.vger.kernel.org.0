Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5499D358443
	for <lists+linux-input@lfdr.de>; Thu,  8 Apr 2021 15:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbhDHNMc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Apr 2021 09:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbhDHNMc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Apr 2021 09:12:32 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ABE7C061761
        for <linux-input@vger.kernel.org>; Thu,  8 Apr 2021 06:12:20 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id n138so3957411lfa.3
        for <linux-input@vger.kernel.org>; Thu, 08 Apr 2021 06:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PKYnqJnp68WP1Kj7L4dIOxVEYx067uC0uEvN3KDQkUM=;
        b=SMJseBmaf3lnlUZnrmX06kRdFCspaK2zz9JZCMJ+EHEO+/BDzpvG/PndnIpsW9ERuT
         VJWNDGLHmLe2VOBXl9Lpav4iIXx8IdQFW3dK2FeJM2kEh2JctqlW7YKmBmweStcf6/RV
         tmfX/HCqqTe9ObzrNtoLQZHYco7XmdA7Zm3S231NMN7b8iJRvBY9U/IKk3nMrM+Q9yXJ
         5NpjWgZn/45+kGIzDofVajyW3haN1WfjeTbyGUQHbZJs1hDr+Ft5K0cGuoTU6/Hiy/NT
         X5b/qszeduANR7R3Mv6IyI9z6B3X7mlSoCTGVvYHpk2yTwKhsW4AZisf8x9b/lVsAehG
         +Aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PKYnqJnp68WP1Kj7L4dIOxVEYx067uC0uEvN3KDQkUM=;
        b=kkr9OKxyvqI/mhktNASo0unAPHw+yiO523bFH8047dZnshxy1ezwSa4x+ovFDMim3I
         e/3vfKaIdeUM7o0gQPKg2HGkLHFw11Oq56kSs/1CVAUgjJbbKvAl238NZCKfRMwHGgwm
         rbsO1hJrh1FQu2FE/C4XnRRo+UcmxOUYUKyY5Z9Omu57Ff0k+05JPGOtlDcjrcy4ILkV
         +3ajAp7DeTxQZucU/542wGl/VHAF0JiHmM6pYgK8a5K2vauiuJY+FGs3M25NZiE1QQBZ
         GXKCFXCeWiXerjGB51Si0Y7ndXWaszH3b8g1i7Lqv4/YnoiMLU9I3cmT6/LmGd8FYgyO
         gDSg==
X-Gm-Message-State: AOAM532nrNpOPErssE7ckwJ1M50+s1NZ7TA35+zUolSqMhvYfz9UXzo0
        DBUzBoPn+EdgKa22jRzDpOy4J1Y3dudx+/wc
X-Google-Smtp-Source: ABdhPJy8QxfhOyZaIxIqPgT2FMKxQChtTzI6RDbVjXbaBSKjjPVMEDSNyOSCwp1i1QT8Mw1Jt3nqTA==
X-Received: by 2002:a19:24d4:: with SMTP id k203mr5804278lfk.249.1617887538596;
        Thu, 08 Apr 2021 06:12:18 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id z7sm126936ljm.102.2021.04.08.06.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 06:12:18 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/8 v3] Input: cyttsp - Probe from compatibles
Date:   Thu,  8 Apr 2021 15:11:47 +0200
Message-Id: <20210408131153.3446138-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210408131153.3446138-1-linus.walleij@linaro.org>
References: <20210408131153.3446138-1-linus.walleij@linaro.org>
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
2.29.2

