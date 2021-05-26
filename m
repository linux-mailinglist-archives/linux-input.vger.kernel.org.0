Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5972839231A
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 01:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233103AbhEZXRH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 19:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232367AbhEZXRG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 19:17:06 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8228C061574
        for <linux-input@vger.kernel.org>; Wed, 26 May 2021 16:15:33 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id o8so3889864ljp.0
        for <linux-input@vger.kernel.org>; Wed, 26 May 2021 16:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LQ+NVSE12x9Re+JEwRuLPo0/XN0+woXtggWLeLMlBSI=;
        b=DfqfE95RBJx7pZLX2Wbbhwz0+1zjSVyxH0Lb/14Sn1Ifwggl2alBcGXEpPG6zNzvH/
         sDhMBPRZGBeOafA0Odim1v5Uq4wtwi22/AaWIrFFUrrjwv+1hUULfZr8cC+Vy6uAxGUb
         uQ1msYk0gnlGhDOidTxXy6w4THuW9xu1WFCY0VO0jk7+WJ3QY1zVSj08NK78SW4rEIun
         m+A4ZG7sEdyl+w+XT00q/Yys09Jlla51ltojh7iD3bS9gAnZ42W/s9RcYMpPOePoti4P
         gDr3bTWWcwQ5CIP9ZoTMoTvy88Otr398cRUBF9FhaB21i6E2/ng5FY0NpI7UBjwQfNPS
         BgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LQ+NVSE12x9Re+JEwRuLPo0/XN0+woXtggWLeLMlBSI=;
        b=TtQDORbHwouJ3GtTPJQ+nsh8+E09t/QZUYvjaw0fydZwvO8qajyvmU2U2kK0oSEPkQ
         hy/UTfw+hap3LI6B2rJlLhtgqIv6+LHWNYyuucCVOg35/lMknqgL7UyhQmVn1EmcX9NC
         RSyR5C++att2r0ExfvWvvwawVUfb5lFHuI50k9nJ1ZsIlMD8G3GG6X/oNehESd8BCQcG
         Ygxpl4ii9NymWSt0UcAp+k4fN6FNKcByYBhzlEHqaOaQnkrSmNtmIGT+xLmhLnkh4ySD
         GIg4J8vnA9LHG1JuleeREaItJ5OjWY3Cz6T4CTpqTos0agJF6i4vWAK905SYoVUAMyzs
         hZOg==
X-Gm-Message-State: AOAM531NpPyR/XB31qFN2kNi29cTqmbOm2K70ciW+8+TtxPHVz8jVyWx
        LUHgk3ax+jSapW6hEVP49FC3TA==
X-Google-Smtp-Source: ABdhPJy1WvG3HV0DOGsrUoI+7BztM4o6AtEAKnCH6izc6Xq5mRi/NwIJuyVqFotRmO/zLqmRtDcSiA==
X-Received: by 2002:a2e:b54b:: with SMTP id a11mr303092ljn.459.1622070932090;
        Wed, 26 May 2021 16:15:32 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id w21sm35415lfl.117.2021.05.26.16.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 16:15:31 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3 v6] Input: cyttsp - Probe from compatibles
Date:   Thu, 27 May 2021 01:03:51 +0200
Message-Id: <20210526230352.1433537-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526230352.1433537-1-linus.walleij@linaro.org>
References: <20210526230352.1433537-1-linus.walleij@linaro.org>
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
ChangeLog v5->v6:
- No changes just resending with the other patches.
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
2.31.1

