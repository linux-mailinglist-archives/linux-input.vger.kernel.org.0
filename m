Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0BC866ACD4
	for <lists+linux-input@lfdr.de>; Sat, 14 Jan 2023 18:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbjANRDI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Jan 2023 12:03:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbjANRDG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Jan 2023 12:03:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 628F6A5F0
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 09:03:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E679C60BF9
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 17:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D44AC433F2;
        Sat, 14 Jan 2023 17:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673715783;
        bh=8YXSQ9ESVBWSwK3z/En15WH8uLTOqxGy1o5BJU3aBBk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OPOLo/okUpaezBeE4MWb4yLRdREHZMgdKF+hj8BuYFW457GAY/tG7zhRHJVWeo+iY
         62bnqG9nFQy1Wh0Oezqfjr1FfxlZ38ZhFI2xWGjZFyMFjegbL+ka1nJY+jojVCroIn
         hUwLKzn+RM6xTOvt68+9JLNCVDkvvyNSlaPVoeU5UhJGrnImHSrCplTCcTAJ7KJ78p
         nECO+lMegy9/7Lmy1qMYR5Yzdl5GoQ4KWp0VFyKHBii5Uhd1Qj3KB3PsiVBWn6t7R5
         eRactElOZXHy21lKqBpvr7LVx+fY5Bdi12am/W+0R8wZso/nmm4dVKsKe2aWQ0FSuQ
         RImKKkXGpEgqQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     jic23@kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 10/16] Input: cyttsp4 - use EXPORT_GPL_RUNTIME_DEV_PM_OPS()
Date:   Sat, 14 Jan 2023 17:16:14 +0000
Message-Id: <20230114171620.42891-11-jic23@kernel.org>
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

SET_SYSTEM_SLEEP_PM_OPS() and RUNTIME_PM_OPS() are deprecated as
they requires explicit protection against unused function warnings.
The new combination of pm_ptr() EXPORT_GPL_RUNTIME_DEV_PM_OPS()
allows the compiler to see the functions, thus suppressing the
warning, but still allowing the unused code to be
removed. Thus also drop the #ifdef guards.

Note that we are replacing an unconditional call to the suspend
and resume functions for sleep use cases with one via
pm_runtime_force_suspend() / pm_runtime_force_resume() that only
do anything to the device if we are not already in the appropriate
runtime suspended state.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

--

I 'think' this should be fine in that it can only reduce the number
of unnecessary suspends.  If anyone can test that would be great.
---
 drivers/input/touchscreen/cyttsp4_core.c | 9 ++-------
 drivers/input/touchscreen/cyttsp4_i2c.c  | 2 +-
 drivers/input/touchscreen/cyttsp4_spi.c  | 2 +-
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp4_core.c b/drivers/input/touchscreen/cyttsp4_core.c
index dccbcb942fe5..0cd6f626adec 100644
--- a/drivers/input/touchscreen/cyttsp4_core.c
+++ b/drivers/input/touchscreen/cyttsp4_core.c
@@ -1744,7 +1744,6 @@ static void cyttsp4_free_si_ptrs(struct cyttsp4 *cd)
 	kfree(si->btn_rec_data);
 }
 
-#ifdef CONFIG_PM
 static int cyttsp4_core_sleep(struct cyttsp4 *cd)
 {
 	int rc;
@@ -1877,13 +1876,9 @@ static int cyttsp4_core_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-const struct dev_pm_ops cyttsp4_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(cyttsp4_core_suspend, cyttsp4_core_resume)
-	SET_RUNTIME_PM_OPS(cyttsp4_core_suspend, cyttsp4_core_resume, NULL)
-};
-EXPORT_SYMBOL_GPL(cyttsp4_pm_ops);
+EXPORT_GPL_RUNTIME_DEV_PM_OPS(cyttsp4_pm_ops,
+			      cyttsp4_core_suspend, cyttsp4_core_resume, NULL);
 
 static int cyttsp4_mt_open(struct input_dev *input)
 {
diff --git a/drivers/input/touchscreen/cyttsp4_i2c.c b/drivers/input/touchscreen/cyttsp4_i2c.c
index c260bab0c62c..ec7a4779f3fb 100644
--- a/drivers/input/touchscreen/cyttsp4_i2c.c
+++ b/drivers/input/touchscreen/cyttsp4_i2c.c
@@ -58,7 +58,7 @@ MODULE_DEVICE_TABLE(i2c, cyttsp4_i2c_id);
 static struct i2c_driver cyttsp4_i2c_driver = {
 	.driver = {
 		.name	= CYTTSP4_I2C_NAME,
-		.pm	= &cyttsp4_pm_ops,
+		.pm	= pm_ptr(&cyttsp4_pm_ops),
 	},
 	.probe_new	= cyttsp4_i2c_probe,
 	.remove		= cyttsp4_i2c_remove,
diff --git a/drivers/input/touchscreen/cyttsp4_spi.c b/drivers/input/touchscreen/cyttsp4_spi.c
index 5d7db84f2749..944fbbe9113e 100644
--- a/drivers/input/touchscreen/cyttsp4_spi.c
+++ b/drivers/input/touchscreen/cyttsp4_spi.c
@@ -173,7 +173,7 @@ static void cyttsp4_spi_remove(struct spi_device *spi)
 static struct spi_driver cyttsp4_spi_driver = {
 	.driver = {
 		.name	= CYTTSP4_SPI_NAME,
-		.pm	= &cyttsp4_pm_ops,
+		.pm	= pm_ptr(&cyttsp4_pm_ops),
 	},
 	.probe  = cyttsp4_spi_probe,
 	.remove = cyttsp4_spi_remove,
-- 
2.39.0

