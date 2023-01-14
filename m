Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37CC866ACD5
	for <lists+linux-input@lfdr.de>; Sat, 14 Jan 2023 18:03:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbjANRDI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Jan 2023 12:03:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbjANRDH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Jan 2023 12:03:07 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1600B752
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 09:03:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8F47560B4D
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 17:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC913C433D2;
        Sat, 14 Jan 2023 17:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673715785;
        bh=Vuuw9Xo3u+9CCXmC4HeHz2ij6y6biOpNLxCkJlE7I18=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f13hC9NfrwarCmcvIPE3ueYk7+5TG+puAQPomblQ0RY2aB4VMHVU8TC/0QvSVEtCp
         yngULn0OInGq3E+iXvnexI1EyrEc1DsXM1HAL7CWoMF2CuSGlrUMC4DEY+3Wugd9Gf
         qPEBl3rqXuGV8iuK1mZJyUhyjN5eQtvEi2F65w5G+/JkrXnP9BGFzNRABvXwGFirz1
         66FJ643jhyP5cJi2yDKxNU/R4T2GF1hni414uZ8OQsjIX7l+3fhIeZNgcjnYjTh6YC
         bo1zimxqfxvNM6VuaIenn1zyrSkQ/ZyzQDhNO5GLqtV6nrUJkmUUMAbEilL6A78qt3
         sv0rdE0eyxpHQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     jic23@kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 11/16] Input: cyttsp - use EXPORT_GPL_SIMPLE_DEV_PM_OPS()
Date:   Sat, 14 Jan 2023 17:16:15 +0000
Message-Id: <20230114171620.42891-12-jic23@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114171620.42891-1-jic23@kernel.org>
References: <20230114171620.42891-1-jic23@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

SIMPLE_DEV_PM_OPS() is deprecated as it requires explicit protection
against unused function warnings.  The new combination of pm_sleep_ptr()
and EXPORT_GPL_SIMPLE_DEV_PMU_OPS() allows the compiler to see the
functions, thus suppressing the warning, but still allowing the unused
code to be removed. Thus also drop the __maybe_unused markings.
It also rolls in the EXPORT_SYMBOL() so that we only export it
if CONFIG_PM_SLEEP.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/cyttsp_core.c | 7 +++----
 drivers/input/touchscreen/cyttsp_i2c.c  | 2 +-
 drivers/input/touchscreen/cyttsp_spi.c  | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index 1dbd849c9613..132ed5786e84 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -491,7 +491,7 @@ static int cyttsp_disable(struct cyttsp *ts)
 	return 0;
 }
 
-static int __maybe_unused cyttsp_suspend(struct device *dev)
+static int cyttsp_suspend(struct device *dev)
 {
 	struct cyttsp *ts = dev_get_drvdata(dev);
 	int retval = 0;
@@ -509,7 +509,7 @@ static int __maybe_unused cyttsp_suspend(struct device *dev)
 	return retval;
 }
 
-static int __maybe_unused cyttsp_resume(struct device *dev)
+static int cyttsp_resume(struct device *dev)
 {
 	struct cyttsp *ts = dev_get_drvdata(dev);
 
@@ -525,8 +525,7 @@ static int __maybe_unused cyttsp_resume(struct device *dev)
 	return 0;
 }
 
-SIMPLE_DEV_PM_OPS(cyttsp_pm_ops, cyttsp_suspend, cyttsp_resume);
-EXPORT_SYMBOL_GPL(cyttsp_pm_ops);
+EXPORT_GPL_SIMPLE_DEV_PM_OPS(cyttsp_pm_ops, cyttsp_suspend, cyttsp_resume);
 
 static int cyttsp_open(struct input_dev *dev)
 {
diff --git a/drivers/input/touchscreen/cyttsp_i2c.c b/drivers/input/touchscreen/cyttsp_i2c.c
index 0155a1626adf..3f91cb43ec82 100644
--- a/drivers/input/touchscreen/cyttsp_i2c.c
+++ b/drivers/input/touchscreen/cyttsp_i2c.c
@@ -63,7 +63,7 @@ MODULE_DEVICE_TABLE(of, cyttsp_of_i2c_match);
 static struct i2c_driver cyttsp_i2c_driver = {
 	.driver = {
 		.name	= CY_I2C_NAME,
-		.pm	= &cyttsp_pm_ops,
+		.pm	= pm_sleep_ptr(&cyttsp_pm_ops),
 		.of_match_table = cyttsp_of_i2c_match,
 	},
 	.probe_new	= cyttsp_i2c_probe,
diff --git a/drivers/input/touchscreen/cyttsp_spi.c b/drivers/input/touchscreen/cyttsp_spi.c
index 30c6fbf86a86..ada17f2dadf3 100644
--- a/drivers/input/touchscreen/cyttsp_spi.c
+++ b/drivers/input/touchscreen/cyttsp_spi.c
@@ -172,7 +172,7 @@ MODULE_DEVICE_TABLE(of, cyttsp_of_spi_match);
 static struct spi_driver cyttsp_spi_driver = {
 	.driver = {
 		.name	= CY_SPI_NAME,
-		.pm	= &cyttsp_pm_ops,
+		.pm	= pm_sleep_ptr(&cyttsp_pm_ops),
 		.of_match_table = cyttsp_of_spi_match,
 	},
 	.probe  = cyttsp_spi_probe,
-- 
2.39.0

