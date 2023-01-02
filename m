Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1B565B662
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236240AbjABSHX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236531AbjABSHB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5795B55BB
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E8B4D6109A
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69897C433D2;
        Mon,  2 Jan 2023 18:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682820;
        bh=xAi+7u5NdVL5XhTqxWwYWwytmJV0HunHgi/Awgbixyk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CVGBRV0PetQYLsQwnvWsbGi8QFZIDnheY3o6Vi+RMHJW1zIyib5E2Fgf+aRub6SJI
         qfNNBb9eGlrJtLPq7t73yZ0FbSaJsAe1cbcOSNW3TVOjJe3AzeOg7qtG8N33BTcVmD
         xKQkUwEP5HhhstHM1oWkyD7mOWmw7afTmnH8GEMEAxNPEuuNXs7SNcuiP0wqFWND4B
         g99iXldj+KT82HARILiutP4tDLRbEKzpTdBm3qLeP9HMDgtknu2+0CwT9/JVRGxaNg
         8kmkvvqkyTTxLcJdIppvzPPhlOyLeBXgusAoK0aeb3JyOFx478IW12Roq3Env4aZ0W
         0+XidlZSZh4XQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Haibo Chen <haibo.chen@nxp.com>
Subject: [PATCH 50/69] Input: imx6ul_tsc - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:23 +0000
Message-Id: <20230102181842.718010-51-jic23@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102181842.718010-1-jic23@kernel.org>
References: <20230102181842.718010-1-jic23@kernel.org>
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
and DEFINE_SIMPLE_DEV_PM_OPS() allows the compiler to see the functions,
thus suppressing the warning, but still allowing the unused code to be
removed. Thus also drop the __maybe_unused markings.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/input/touchscreen/imx6ul_tsc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index 2d4facf70cdb..6ac8fa84ed9f 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -512,7 +512,7 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused imx6ul_tsc_suspend(struct device *dev)
+static int imx6ul_tsc_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct imx6ul_tsc *tsc = platform_get_drvdata(pdev);
@@ -528,7 +528,7 @@ static int __maybe_unused imx6ul_tsc_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused imx6ul_tsc_resume(struct device *dev)
+static int imx6ul_tsc_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct imx6ul_tsc *tsc = platform_get_drvdata(pdev);
@@ -545,8 +545,8 @@ static int __maybe_unused imx6ul_tsc_resume(struct device *dev)
 	return retval;
 }
 
-static SIMPLE_DEV_PM_OPS(imx6ul_tsc_pm_ops,
-			 imx6ul_tsc_suspend, imx6ul_tsc_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(imx6ul_tsc_pm_ops,
+				imx6ul_tsc_suspend, imx6ul_tsc_resume);
 
 static const struct of_device_id imx6ul_tsc_match[] = {
 	{ .compatible = "fsl,imx6ul-tsc", },
@@ -558,7 +558,7 @@ static struct platform_driver imx6ul_tsc_driver = {
 	.driver		= {
 		.name	= "imx6ul-tsc",
 		.of_match_table	= imx6ul_tsc_match,
-		.pm	= &imx6ul_tsc_pm_ops,
+		.pm	= pm_sleep_ptr(&imx6ul_tsc_pm_ops),
 	},
 	.probe		= imx6ul_tsc_probe,
 };
-- 
2.39.0

