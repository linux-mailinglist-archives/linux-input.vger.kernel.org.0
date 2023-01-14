Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9FB66ACD1
	for <lists+linux-input@lfdr.de>; Sat, 14 Jan 2023 18:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbjANRDE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Jan 2023 12:03:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjANRDC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Jan 2023 12:03:02 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A1A4B747
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 09:03:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C563760C01
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 17:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22CA0C433F2;
        Sat, 14 Jan 2023 17:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673715779;
        bh=bNlQp06hTROH1cUdwcVPA4Q2JKZPVOwmwfOIX8AT6es=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=F7Fuf4G7QCyolbj9c+6q483CHVcIj35Mm/CGChHpPm8MaCyUWDdweNZSsqsc+bD2d
         kgfeFMOJhXXwA0ZTqN1MI1i6WJNO7Z7W4kqo4EP6uu+nIplGujXBgDQqiu7dsywzc7
         nMbMcpKH4EXh+/i1mwug8ZyiluhPd/Uqx2BhI8XuSxAKsA1WuX/ojwDeURw64LkGOi
         lklh83LOlXPzZ8ZUnV22R0cgwwUZt+M+346BDfK88U+s9gobE9HztApNMx1F03jhxI
         /ADhy8kpLsBN7aUGynF4H5jDLUlCJY/PK2vMqgn8clG6OmD3zn9wIVFzfIF7Xi9BZN
         0BF58V3jvaM9g==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     jic23@kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Michael Hennerich <michael.hennerich@analog.com>
Subject: [PATCH 07/16] Input: ad714x - unify dev_pm_ops using EXPORT_SIMPLE_DEV_PM_OPS()
Date:   Sat, 14 Jan 2023 17:16:11 +0000
Message-Id: <20230114171620.42891-8-jic23@kernel.org>
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

The I2C and SPI PM callbacks were identical (though wrapped in some
bouncing out to the bus specific container of the struct device and
then back again to get the drvdata). As such rather than just moving
these to SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() take the opportunity
to unify the struct dev_pm_ops and use the new EXPORT_SIMPLE_DEV_PM_OPS()
macro so that we can drop the unused suspend and resume callbacks as well
as the structure if !CONFIG_PM_SLEEP without needing to mark the callbacks
__maybe_unused.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>
---
 drivers/input/misc/ad714x-i2c.c | 14 +-------------
 drivers/input/misc/ad714x-spi.c | 14 +-------------
 drivers/input/misc/ad714x.c     | 12 ++++++------
 drivers/input/misc/ad714x.h     |  4 ++--
 4 files changed, 10 insertions(+), 34 deletions(-)

diff --git a/drivers/input/misc/ad714x-i2c.c b/drivers/input/misc/ad714x-i2c.c
index 5ef518a50e63..d8e39f4a57ac 100644
--- a/drivers/input/misc/ad714x-i2c.c
+++ b/drivers/input/misc/ad714x-i2c.c
@@ -12,18 +12,6 @@
 #include <linux/pm.h>
 #include "ad714x.h"
 
-static int __maybe_unused ad714x_i2c_suspend(struct device *dev)
-{
-	return ad714x_disable(i2c_get_clientdata(to_i2c_client(dev)));
-}
-
-static int __maybe_unused ad714x_i2c_resume(struct device *dev)
-{
-	return ad714x_enable(i2c_get_clientdata(to_i2c_client(dev)));
-}
-
-static SIMPLE_DEV_PM_OPS(ad714x_i2c_pm, ad714x_i2c_suspend, ad714x_i2c_resume);
-
 static int ad714x_i2c_write(struct ad714x_chip *chip,
 			    unsigned short reg, unsigned short data)
 {
@@ -96,7 +84,7 @@ MODULE_DEVICE_TABLE(i2c, ad714x_id);
 static struct i2c_driver ad714x_i2c_driver = {
 	.driver = {
 		.name = "ad714x_captouch",
-		.pm   = &ad714x_i2c_pm,
+		.pm   = pm_sleep_ptr(&ad714x_pm),
 	},
 	.probe_new = ad714x_i2c_probe,
 	.id_table = ad714x_id,
diff --git a/drivers/input/misc/ad714x-spi.c b/drivers/input/misc/ad714x-spi.c
index 7d3bf434620f..eb13b4cd6594 100644
--- a/drivers/input/misc/ad714x-spi.c
+++ b/drivers/input/misc/ad714x-spi.c
@@ -15,18 +15,6 @@
 #define AD714x_SPI_CMD_PREFIX      0xE000   /* bits 15:11 */
 #define AD714x_SPI_READ            BIT(10)
 
-static int __maybe_unused ad714x_spi_suspend(struct device *dev)
-{
-	return ad714x_disable(spi_get_drvdata(to_spi_device(dev)));
-}
-
-static int __maybe_unused ad714x_spi_resume(struct device *dev)
-{
-	return ad714x_enable(spi_get_drvdata(to_spi_device(dev)));
-}
-
-static SIMPLE_DEV_PM_OPS(ad714x_spi_pm, ad714x_spi_suspend, ad714x_spi_resume);
-
 static int ad714x_spi_read(struct ad714x_chip *chip,
 			   unsigned short reg, unsigned short *data, size_t len)
 {
@@ -103,7 +91,7 @@ static int ad714x_spi_probe(struct spi_device *spi)
 static struct spi_driver ad714x_spi_driver = {
 	.driver = {
 		.name	= "ad714x_captouch",
-		.pm	= &ad714x_spi_pm,
+		.pm	= pm_sleep_ptr(&ad714x_pm),
 	},
 	.probe		= ad714x_spi_probe,
 };
diff --git a/drivers/input/misc/ad714x.c b/drivers/input/misc/ad714x.c
index 43132d98feda..1acd8429c56c 100644
--- a/drivers/input/misc/ad714x.c
+++ b/drivers/input/misc/ad714x.c
@@ -1162,9 +1162,9 @@ struct ad714x_chip *ad714x_probe(struct device *dev, u16 bus_type, int irq,
 }
 EXPORT_SYMBOL(ad714x_probe);
 
-#ifdef CONFIG_PM
-int ad714x_disable(struct ad714x_chip *ad714x)
+static int ad714x_suspend(struct device *dev)
 {
+	struct ad714x_chip *ad714x = dev_get_drvdata(dev);
 	unsigned short data;
 
 	dev_dbg(ad714x->dev, "%s enter\n", __func__);
@@ -1178,10 +1178,10 @@ int ad714x_disable(struct ad714x_chip *ad714x)
 
 	return 0;
 }
-EXPORT_SYMBOL(ad714x_disable);
 
-int ad714x_enable(struct ad714x_chip *ad714x)
+static int ad714x_resume(struct device *dev)
 {
+	struct ad714x_chip *ad714x = dev_get_drvdata(dev);
 	dev_dbg(ad714x->dev, "%s enter\n", __func__);
 
 	mutex_lock(&ad714x->mutex);
@@ -1201,8 +1201,8 @@ int ad714x_enable(struct ad714x_chip *ad714x)
 
 	return 0;
 }
-EXPORT_SYMBOL(ad714x_enable);
-#endif
+
+EXPORT_SIMPLE_DEV_PM_OPS(ad714x_pm, ad714x_suspend, ad714x_resume);
 
 MODULE_DESCRIPTION("Analog Devices AD714X Capacitance Touch Sensor Driver");
 MODULE_AUTHOR("Barry Song <21cnbao@gmail.com>");
diff --git a/drivers/input/misc/ad714x.h b/drivers/input/misc/ad714x.h
index af847b5f0d0e..dafa12325f27 100644
--- a/drivers/input/misc/ad714x.h
+++ b/drivers/input/misc/ad714x.h
@@ -8,6 +8,7 @@
 #ifndef _AD714X_H_
 #define _AD714X_H_
 
+#include <linux/pm.h>
 #include <linux/types.h>
 
 #define STAGE_NUM              12
@@ -45,8 +46,7 @@ struct ad714x_chip {
 
 };
 
-int ad714x_disable(struct ad714x_chip *ad714x);
-int ad714x_enable(struct ad714x_chip *ad714x);
+extern const struct dev_pm_ops ad714x_pm;
 struct ad714x_chip *ad714x_probe(struct device *dev, u16 bus_type, int irq,
 				 ad714x_read_t read, ad714x_write_t write);
 
-- 
2.39.0

