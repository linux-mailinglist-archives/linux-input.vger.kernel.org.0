Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E11C65B639
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235115AbjABSGm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236345AbjABSGH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:07 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40DB81EB
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DF3AAB80DDA
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F73C433F0;
        Mon,  2 Jan 2023 18:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682763;
        bh=e6fSDwGHrvPz/dbKrwaEMDSrhsskXvC36J7txtGN0sw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NXBtha5h7eYmNDauqoFNDJ/dPf2D9xuox0xH7C7bY2y44qATedsoRwDu3D76WsCEx
         wYLITAiRQqD2ZksXAhN8ZQTqjIUchbcSh0Y0Kl5y7vk9twnJId46FsnAf4NhzEyDZv
         NYZVv4Hk0CXvghCOkuGANrGHjXCi6t4ECF+iuAj012t95IAI7SJd902/VAestNYuB7
         zjMvIrbsfJBm03fyJUJ4iej8SDYrAlbmXWETxSriogUSJSr19zlIJeO/vwlDSH3PSC
         FpiiW+J9vGrm9VemaT5gbXvpiKwIZi8MPRxQYXvIBD/EZMxeSeh1UTiyn0tBtke1ct
         qU4uFp6cRKZ9Q==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH 07/69] Input: gpio-vibra - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:40 +0000
Message-Id: <20230102181842.718010-8-jic23@kernel.org>
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
Cc: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/input/misc/gpio-vibra.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/misc/gpio-vibra.c b/drivers/input/misc/gpio-vibra.c
index f79f75595dd7..134a1309ba92 100644
--- a/drivers/input/misc/gpio-vibra.c
+++ b/drivers/input/misc/gpio-vibra.c
@@ -157,7 +157,7 @@ static int gpio_vibrator_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused gpio_vibrator_suspend(struct device *dev)
+static int gpio_vibrator_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct gpio_vibrator *vibrator = platform_get_drvdata(pdev);
@@ -169,7 +169,7 @@ static int __maybe_unused gpio_vibrator_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused gpio_vibrator_resume(struct device *dev)
+static int gpio_vibrator_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct gpio_vibrator *vibrator = platform_get_drvdata(pdev);
@@ -180,8 +180,8 @@ static int __maybe_unused gpio_vibrator_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(gpio_vibrator_pm_ops,
-			 gpio_vibrator_suspend, gpio_vibrator_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(gpio_vibrator_pm_ops,
+				gpio_vibrator_suspend, gpio_vibrator_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id gpio_vibra_dt_match_table[] = {
@@ -195,7 +195,7 @@ static struct platform_driver gpio_vibrator_driver = {
 	.probe	= gpio_vibrator_probe,
 	.driver	= {
 		.name	= "gpio-vibrator",
-		.pm	= &gpio_vibrator_pm_ops,
+		.pm	= pm_sleep_ptr(&gpio_vibrator_pm_ops),
 		.of_match_table = of_match_ptr(gpio_vibra_dt_match_table),
 	},
 };
-- 
2.39.0

