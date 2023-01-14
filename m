Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17CFA66ACD2
	for <lists+linux-input@lfdr.de>; Sat, 14 Jan 2023 18:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbjANRDF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Jan 2023 12:03:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbjANRDC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Jan 2023 12:03:02 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEC9BA5F6
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 09:03:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4851860BC1
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 17:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D63C433F0;
        Sat, 14 Jan 2023 17:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673715780;
        bh=9BXRU0waUXDp0h00YlnZwRoEBTBIWCwMc5/JkMuxn+Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fhbTfA7+gAEGJPQXoiJWL3moKSaa3TNGRq9KNMe+24zONxBzP3XIVh11+llpweVpP
         LWgYBo9ZtwFA0pNxLExFRTYnTGkyFsK3IDr4wwcT3VfZiXiY6rZzWoqieROPcKZ2i0
         0/v6kVxUHBTQ59VQH5kUZimrAO/IjVH4+HQT1GFn3tFvhyupmE3oHhLTy1Um/I9MoH
         ODNCn5hYvbcKEvtb3bcZ1tLoxmoEm7eyQy6d07LVxM+K2WVLNYz9fItUXGSo8pqxdH
         G2Un2kcpI/cX53W3ZMXJBjs8GhGr22uSYwfTWL9ZjiIMY0GR5mBduoOyIPAwTvXgB2
         cotZXCMHTpKrg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     jic23@kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Michael Hennerich <michael.hennerich@analog.com>
Subject: [PATCH 08/16] Input: adxl34x - unify dev_pm_ops using EXPORT_SIMPLE_DEV_PM_OPS()
Date:   Sat, 14 Jan 2023 17:16:12 +0000
Message-Id: <20230114171620.42891-9-jic23@kernel.org>
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
then back again to get the drvdata).  As such rather than just moving
these to SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() take the opportunity
to unify the struct dev_pm_ops and use the new EXPORT_SIMPLE_DEV_PM_OPS()
macro so that we can drop the unused suspend and resume callbacks as well
as the structure if !CONFIG_PM_SLEEP without needing to mark the callbacks
__maybe_unused.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>
---
 drivers/input/misc/adxl34x-i2c.c | 25 +------------------------
 drivers/input/misc/adxl34x-spi.c | 25 +------------------------
 drivers/input/misc/adxl34x.c     | 16 ++++++++++++----
 drivers/input/misc/adxl34x.h     |  4 ++--
 4 files changed, 16 insertions(+), 54 deletions(-)

diff --git a/drivers/input/misc/adxl34x-i2c.c b/drivers/input/misc/adxl34x-i2c.c
index a8ceea36d80a..1c75d98c85a7 100644
--- a/drivers/input/misc/adxl34x-i2c.c
+++ b/drivers/input/misc/adxl34x-i2c.c
@@ -105,29 +105,6 @@ static void adxl34x_i2c_remove(struct i2c_client *client)
 	adxl34x_remove(ac);
 }
 
-static int __maybe_unused adxl34x_i2c_suspend(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct adxl34x *ac = i2c_get_clientdata(client);
-
-	adxl34x_suspend(ac);
-
-	return 0;
-}
-
-static int __maybe_unused adxl34x_i2c_resume(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct adxl34x *ac = i2c_get_clientdata(client);
-
-	adxl34x_resume(ac);
-
-	return 0;
-}
-
-static SIMPLE_DEV_PM_OPS(adxl34x_i2c_pm, adxl34x_i2c_suspend,
-			 adxl34x_i2c_resume);
-
 static const struct i2c_device_id adxl34x_id[] = {
 	{ "adxl34x", 0 },
 	{ }
@@ -155,7 +132,7 @@ MODULE_DEVICE_TABLE(of, adxl34x_of_id);
 static struct i2c_driver adxl34x_driver = {
 	.driver = {
 		.name = "adxl34x",
-		.pm = &adxl34x_i2c_pm,
+		.pm = pm_sleep_ptr(&adxl34x_pm),
 		.of_match_table = adxl34x_of_id,
 	},
 	.probe_new = adxl34x_i2c_probe,
diff --git a/drivers/input/misc/adxl34x-spi.c b/drivers/input/misc/adxl34x-spi.c
index 91e44d4c66f7..f1094a8ccdd5 100644
--- a/drivers/input/misc/adxl34x-spi.c
+++ b/drivers/input/misc/adxl34x-spi.c
@@ -94,33 +94,10 @@ static void adxl34x_spi_remove(struct spi_device *spi)
 	adxl34x_remove(ac);
 }
 
-static int __maybe_unused adxl34x_spi_suspend(struct device *dev)
-{
-	struct spi_device *spi = to_spi_device(dev);
-	struct adxl34x *ac = spi_get_drvdata(spi);
-
-	adxl34x_suspend(ac);
-
-	return 0;
-}
-
-static int __maybe_unused adxl34x_spi_resume(struct device *dev)
-{
-	struct spi_device *spi = to_spi_device(dev);
-	struct adxl34x *ac = spi_get_drvdata(spi);
-
-	adxl34x_resume(ac);
-
-	return 0;
-}
-
-static SIMPLE_DEV_PM_OPS(adxl34x_spi_pm, adxl34x_spi_suspend,
-			 adxl34x_spi_resume);
-
 static struct spi_driver adxl34x_driver = {
 	.driver = {
 		.name = "adxl34x",
-		.pm = &adxl34x_spi_pm,
+		.pm = pm_sleep_ptr(&adxl34x_pm),
 	},
 	.probe   = adxl34x_spi_probe,
 	.remove  = adxl34x_spi_remove,
diff --git a/drivers/input/misc/adxl34x.c b/drivers/input/misc/adxl34x.c
index a4af314392a9..eecca671b588 100644
--- a/drivers/input/misc/adxl34x.c
+++ b/drivers/input/misc/adxl34x.c
@@ -412,8 +412,10 @@ static void __adxl34x_enable(struct adxl34x *ac)
 	AC_WRITE(ac, POWER_CTL, ac->pdata.power_mode | PCTL_MEASURE);
 }
 
-void adxl34x_suspend(struct adxl34x *ac)
+static int adxl34x_suspend(struct device *dev)
 {
+	struct adxl34x *ac = dev_get_drvdata(dev);
+
 	mutex_lock(&ac->mutex);
 
 	if (!ac->suspended && !ac->disabled && ac->opened)
@@ -422,11 +424,14 @@ void adxl34x_suspend(struct adxl34x *ac)
 	ac->suspended = true;
 
 	mutex_unlock(&ac->mutex);
+
+	return 0;
 }
-EXPORT_SYMBOL_GPL(adxl34x_suspend);
 
-void adxl34x_resume(struct adxl34x *ac)
+static int adxl34x_resume(struct device *dev)
 {
+	struct adxl34x *ac = dev_get_drvdata(dev);
+
 	mutex_lock(&ac->mutex);
 
 	if (ac->suspended && !ac->disabled && ac->opened)
@@ -435,8 +440,9 @@ void adxl34x_resume(struct adxl34x *ac)
 	ac->suspended = false;
 
 	mutex_unlock(&ac->mutex);
+
+	return 0;
 }
-EXPORT_SYMBOL_GPL(adxl34x_resume);
 
 static ssize_t adxl34x_disable_show(struct device *dev,
 				    struct device_attribute *attr, char *buf)
@@ -906,6 +912,8 @@ void adxl34x_remove(struct adxl34x *ac)
 }
 EXPORT_SYMBOL_GPL(adxl34x_remove);
 
+EXPORT_GPL_SIMPLE_DEV_PM_OPS(adxl34x_pm, adxl34x_suspend, adxl34x_resume);
+
 MODULE_AUTHOR("Michael Hennerich <hennerich@blackfin.uclinux.org>");
 MODULE_DESCRIPTION("ADXL345/346 Three-Axis Digital Accelerometer Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/input/misc/adxl34x.h b/drivers/input/misc/adxl34x.h
index febf85270fff..f9272a2e7a96 100644
--- a/drivers/input/misc/adxl34x.h
+++ b/drivers/input/misc/adxl34x.h
@@ -20,11 +20,11 @@ struct adxl34x_bus_ops {
 	int (*write)(struct device *, unsigned char, unsigned char);
 };
 
-void adxl34x_suspend(struct adxl34x *ac);
-void adxl34x_resume(struct adxl34x *ac);
 struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 			      bool fifo_delay_default,
 			      const struct adxl34x_bus_ops *bops);
 void adxl34x_remove(struct adxl34x *ac);
 
+extern const struct dev_pm_ops adxl34x_pm;
+
 #endif
-- 
2.39.0

