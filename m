Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D96AF641E64
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbiLDR44 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbiLDR4b (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:31 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB2D140CD
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 485EC60EDC
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E578BC433D6;
        Sun,  4 Dec 2022 17:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176589;
        bh=srjWXdPFJfvPJ/zI6w+DJeiqewJpTejo8GBm47iv9Fg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZOz0F72lLx73D2zlKNJOq0MR2lMDcscw7l4UsdzUNcOHVJjMgeikfKx1kCr4eHWzC
         AWKU80VeXkQez123hx41Y2DgrmwxnFEX0HgDXuAZ8Fj11TQzcYaAbBWGsev+VAB4AD
         k4y3dwU6OZdTjZTqdJvV6tRdI0oW5ESLxkHjE7m0fvLcs3BDgJmuEEzvgZGHc+o6z0
         UUMxJcqIOGBPgxkrHLBC9Q7elw8FxLMIkK23bn3y2QH7pXTivTmknrGmmN6zUY3IwJ
         5Yf0Q5Z0WP0d2JpFsNwfbxjNg2O8uQvjaR64bIPknuD+ikd2SA8GYq4fxNm4nvr+KE
         hZ83l1klTX/Yg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 19/32] Input: pmic8xxx-keypad - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:28 +0000
Message-Id: <20221204180841.2211588-20-jic23@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204180841.2211588-1-jic23@kernel.org>
References: <20221204180841.2211588-1-jic23@kernel.org>
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
removed. Thus also drop the ifdef guards.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/input/keyboard/pmic8xxx-keypad.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/pmic8xxx-keypad.c b/drivers/input/keyboard/pmic8xxx-keypad.c
index 4766c5048ce2..26a005f9ace3 100644
--- a/drivers/input/keyboard/pmic8xxx-keypad.c
+++ b/drivers/input/keyboard/pmic8xxx-keypad.c
@@ -621,7 +621,6 @@ static int pmic8xxx_kp_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int pmic8xxx_kp_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -661,10 +660,9 @@ static int pmic8xxx_kp_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(pm8xxx_kp_pm_ops,
-			 pmic8xxx_kp_suspend, pmic8xxx_kp_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pm8xxx_kp_pm_ops,
+				pmic8xxx_kp_suspend, pmic8xxx_kp_resume);
 
 static const struct of_device_id pm8xxx_match_table[] = {
 	{ .compatible = "qcom,pm8058-keypad" },
@@ -677,7 +675,7 @@ static struct platform_driver pmic8xxx_kp_driver = {
 	.probe		= pmic8xxx_kp_probe,
 	.driver		= {
 		.name = "pm8xxx-keypad",
-		.pm = &pm8xxx_kp_pm_ops,
+		.pm = pm_sleep_ptr(&pm8xxx_kp_pm_ops),
 		.of_match_table = pm8xxx_match_table,
 	},
 };
-- 
2.38.1

