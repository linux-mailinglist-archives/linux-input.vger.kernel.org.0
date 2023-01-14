Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F71266ACD3
	for <lists+linux-input@lfdr.de>; Sat, 14 Jan 2023 18:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbjANRDF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Jan 2023 12:03:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbjANRDE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Jan 2023 12:03:04 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 776F759FF
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 09:03:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9422860B4D
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 17:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E084C433F1;
        Sat, 14 Jan 2023 17:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673715782;
        bh=tCNbAL2O2w27urcWXdqc91kTvXnsbGcqyuiClUxiYLo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HqAw+HpUPb68mMnft+Z3ZM97yFoADng1wo/8U8eXbx+P2u7HNRg+WE3jg74wFaesi
         7dO4gxq8peDBpQ35LlrLzSXFcUmw/mfmtZmOoo8vGeQZchuCENVripyhW8yNduFdiA
         huw7agDsfZPVmhqcTEejnpZK2OBqGRTYS3qXhqaOIVijL7D/TyX9jL/6GdusvSonqB
         xcbB6VnoUJGqR6e3jx9do3+b6FFDEaIu9VNjvatlzs3+1io9JsfUuKcqIXkMvwKXfE
         B77KEkniLc+i26infceqaIP4/2tJVVXxESZQtEnITd0mhIuww8Emgz+QWMcgOSLCNT
         N/5MY70YQLaHg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     jic23@kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 09/16] Input: tsc200x - use EXPORT_GPL_SIMPLE_DEV_PM_OPS()
Date:   Sat, 14 Jan 2023 17:16:13 +0000
Message-Id: <20230114171620.42891-10-jic23@kernel.org>
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
and EXPORT_GPL_SIMPLE_DEV_PM_OPS() allows the compiler to see the
functions, thus suppressing the warning, but still allowing the unused
code to be removed. Thus also drop the __maybe_unused markings.
This function also removes the need for separate EXPORT_SYMBOL_GPL()

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/input/touchscreen/tsc2004.c      | 2 +-
 drivers/input/touchscreen/tsc2005.c      | 2 +-
 drivers/input/touchscreen/tsc200x-core.c | 7 +++----
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/tsc2004.c b/drivers/input/touchscreen/tsc2004.c
index 575768b587bb..45f39eb20638 100644
--- a/drivers/input/touchscreen/tsc2004.c
+++ b/drivers/input/touchscreen/tsc2004.c
@@ -65,7 +65,7 @@ static struct i2c_driver tsc2004_driver = {
 	.driver = {
 		.name   = "tsc2004",
 		.of_match_table = of_match_ptr(tsc2004_of_match),
-		.pm     = &tsc200x_pm_ops,
+		.pm     = pm_sleep_ptr(&tsc200x_pm_ops),
 	},
 	.id_table       = tsc2004_idtable,
 	.probe_new      = tsc2004_probe,
diff --git a/drivers/input/touchscreen/tsc2005.c b/drivers/input/touchscreen/tsc2005.c
index 555dfe98b3c4..b6dfbcfc8c19 100644
--- a/drivers/input/touchscreen/tsc2005.c
+++ b/drivers/input/touchscreen/tsc2005.c
@@ -81,7 +81,7 @@ static struct spi_driver tsc2005_driver = {
 	.driver	= {
 		.name	= "tsc2005",
 		.of_match_table = of_match_ptr(tsc2005_of_match),
-		.pm	= &tsc200x_pm_ops,
+		.pm	= pm_sleep_ptr(&tsc200x_pm_ops),
 	},
 	.probe	= tsc2005_probe,
 	.remove	= tsc2005_remove,
diff --git a/drivers/input/touchscreen/tsc200x-core.c b/drivers/input/touchscreen/tsc200x-core.c
index 72c7258b93a5..b799f26fcf8f 100644
--- a/drivers/input/touchscreen/tsc200x-core.c
+++ b/drivers/input/touchscreen/tsc200x-core.c
@@ -588,7 +588,7 @@ void tsc200x_remove(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(tsc200x_remove);
 
-static int __maybe_unused tsc200x_suspend(struct device *dev)
+static int tsc200x_suspend(struct device *dev)
 {
 	struct tsc200x *ts = dev_get_drvdata(dev);
 
@@ -604,7 +604,7 @@ static int __maybe_unused tsc200x_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tsc200x_resume(struct device *dev)
+static int tsc200x_resume(struct device *dev)
 {
 	struct tsc200x *ts = dev_get_drvdata(dev);
 
@@ -620,8 +620,7 @@ static int __maybe_unused tsc200x_resume(struct device *dev)
 	return 0;
 }
 
-SIMPLE_DEV_PM_OPS(tsc200x_pm_ops, tsc200x_suspend, tsc200x_resume);
-EXPORT_SYMBOL_GPL(tsc200x_pm_ops);
+EXPORT_GPL_SIMPLE_DEV_PM_OPS(tsc200x_pm_ops, tsc200x_suspend, tsc200x_resume);
 
 MODULE_AUTHOR("Lauri Leukkunen <lauri.leukkunen@nokia.com>");
 MODULE_DESCRIPTION("TSC200x Touchscreen Driver Core");
-- 
2.39.0

