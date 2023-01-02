Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C081E65B632
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:06:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234650AbjABSGI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231454AbjABSF5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:05:57 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0B2CDD4
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:05:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4426761038
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF4FC433F1;
        Mon,  2 Jan 2023 18:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682755;
        bh=1/9diJ0LyAqf/5EINz6bE03sh0wkbD6nhUaZgN+4Kx8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PNVekfGTXGAzry4fUVR8Nj5ewZoObEx9shHqaDdY8e0EQXgfZdIOve1c0idkarDgv
         YRSX8hQWzhCrabJtr+i1G64PAnpF6UaQgap/ire9AArzZzDCoo+dGls84mLPCZQkgg
         ZNvaWoQ1in4hrmX63r7o2K9/7+xRk0WR9JMswJN3a+nnJD84QgUHT/fdRB1ilJ05Rc
         T/PwKGZjRpMrxxeIwziJDAi7G2gCBDxa7FmSeRw/jGaoYXG/H3F1dT4AcJZKP4wHYa
         hMyVjgSdoeBfobC6YyzVLT3uqPMSLJpZD8nBKSsnkNr9fAUDO9rJiUHolosZQxUvt+
         fDpR1qpPsrpbw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 01/69] Input: 88pm860x - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:34 +0000
Message-Id: <20230102181842.718010-2-jic23@kernel.org>
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
---
 drivers/input/misc/88pm860x_onkey.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/88pm860x_onkey.c b/drivers/input/misc/88pm860x_onkey.c
index 685995cad73f..0f8b7ffb3aff 100644
--- a/drivers/input/misc/88pm860x_onkey.c
+++ b/drivers/input/misc/88pm860x_onkey.c
@@ -110,7 +110,7 @@ static int pm860x_onkey_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused pm860x_onkey_suspend(struct device *dev)
+static int pm860x_onkey_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct pm860x_chip *chip = dev_get_drvdata(pdev->dev.parent);
@@ -119,7 +119,7 @@ static int __maybe_unused pm860x_onkey_suspend(struct device *dev)
 		chip->wakeup_flag |= 1 << PM8607_IRQ_ONKEY;
 	return 0;
 }
-static int __maybe_unused pm860x_onkey_resume(struct device *dev)
+static int pm860x_onkey_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct pm860x_chip *chip = dev_get_drvdata(pdev->dev.parent);
@@ -129,12 +129,13 @@ static int __maybe_unused pm860x_onkey_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(pm860x_onkey_pm_ops, pm860x_onkey_suspend, pm860x_onkey_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pm860x_onkey_pm_ops,
+				pm860x_onkey_suspend, pm860x_onkey_resume);
 
 static struct platform_driver pm860x_onkey_driver = {
 	.driver		= {
 		.name	= "88pm860x-onkey",
-		.pm	= &pm860x_onkey_pm_ops,
+		.pm	= pm_sleep_ptr(&pm860x_onkey_pm_ops),
 	},
 	.probe		= pm860x_onkey_probe,
 };
-- 
2.39.0

