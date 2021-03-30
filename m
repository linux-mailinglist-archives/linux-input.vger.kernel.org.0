Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E76134E38D
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 10:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhC3Iyu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 04:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbhC3Iy3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 04:54:29 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680DCC061762
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 01:54:29 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id n138so22653253lfa.3
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 01:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/7GlKvi87M8Si6285ApZgfbAtLyH/k4agACd8QLYqS0=;
        b=Z8cg/k86hy9BFJPEW6HeuQ4b6sKNo2fusttZ+SIdMiMPBViTUr6P8C1eiZu8iImEob
         i/eU2/obmck14J5enLSSGjP1Mfs1Bi3nuuoAWJw70N2zMfOB5oaNbUHIe1kmO9cgpIZU
         99ixmkYOtWRY+DU2NgdiPoM5uEy5MClrFs28sZONVpJWFSMTAxDaMuPXNYjcNwjFnI5X
         Q0HEKTfayoVEifhnUirzLtib0i0PjFYilyelA/TUd5eku5GD4w4xNvjfR95uOWuDZB8p
         //eJm6F6TaUbDDn9+OvG4v5vJRb8m6shqVwCwTm7kaiWFH/MrIySCHsMa5OauC0LXyqq
         3d+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/7GlKvi87M8Si6285ApZgfbAtLyH/k4agACd8QLYqS0=;
        b=B6YB4IEJ13qUfUp/Nsr925KdwEpbS4Do8zD9XHgsxbcN/00gFU4f1TFwXVyc/ayg6v
         Wxyiw0vTPJ15j+wNB4WMBaoufCV5AYUk/yNzPi3MYXG/1AournnwgUAZbYKGOx709FuQ
         Bjd73T6t6UhI/cGgnJlbQv9OVPZBmPQ+hmwmGOdbbt8zBZ7T++1bMkEjXfQCCpH4pbAM
         3t1v5y2KEHdfqhOwKgYvk5F4DSflPItTVrCuegRuWnFjg7ItcANUwtUvbgce8jtNq64h
         27VIBvOL0mkkeVIXVz0k5LvyaXJd4rUil7vr0m9iekAgwi8NEEZ33jJoHSFDU1QFQd6F
         gfNQ==
X-Gm-Message-State: AOAM530P4kLsOUxHSNaF7i3qUK8NmPZH9dXZvhJ5JAAPXp4tC5vC1QWN
        /l0fMjqM1Hr3FayuB9YYjMw/8Q==
X-Google-Smtp-Source: ABdhPJyyiyo+HTF0JO2YDBJFqErSKy/JB/cJeH1vsIN+s5vtD18CpIL7Q5QPVw7qHteiJbtaXBvKCA==
X-Received: by 2002:a19:ae07:: with SMTP id f7mr19301555lfc.551.1617094467954;
        Tue, 30 Mar 2021 01:54:27 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id 201sm2104238lfm.108.2021.03.30.01.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 01:54:27 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/7] Input: cyttsp - Probe from compatibles
Date:   Tue, 30 Mar 2021 10:54:18 +0200
Message-Id: <20210330085424.2244653-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330085424.2244653-1-linus.walleij@linaro.org>
References: <20210330085424.2244653-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver (both SPI and I2C interface) should probe from
the compatible strings, cypress,cy8ctma340 etc when using
device tree, not as now, where it is probing implicitly from
the I2C/SPI node name "cypress,cyttsp-i2c" etc.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/cyttsp_i2c.c | 7 +++++++
 drivers/input/touchscreen/cyttsp_spi.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/input/touchscreen/cyttsp_i2c.c b/drivers/input/touchscreen/cyttsp_i2c.c
index 061debf64a2b..0f097f34832a 100644
--- a/drivers/input/touchscreen/cyttsp_i2c.c
+++ b/drivers/input/touchscreen/cyttsp_i2c.c
@@ -52,10 +52,17 @@ static const struct i2c_device_id cyttsp_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, cyttsp_i2c_id);
 
+static const struct of_device_id cyttsp_of_i2c_match[] = {
+	{ .compatible = "cypress,cy8ctma340", },
+	{ .compatible = "cypress,cy8ctst341", },
+	{ /* sentinel */ }
+};
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
index 54e410921d53..ad8b3c6c4d3e 100644
--- a/drivers/input/touchscreen/cyttsp_spi.c
+++ b/drivers/input/touchscreen/cyttsp_spi.c
@@ -160,10 +160,17 @@ static int cyttsp_spi_probe(struct spi_device *spi)
 	return 0;
 }
 
+static const struct of_device_id cyttsp_of_spi_match[] = {
+	{ .compatible = "cypress,cy8ctma340", },
+	{ .compatible = "cypress,cy8ctst341", },
+	{ /* sentinel */ }
+};
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

