Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEF4A65B645
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236460AbjABSGv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236448AbjABSGX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC6960C5
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8362EB80DE1
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88127C433D2;
        Mon,  2 Jan 2023 18:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682781;
        bh=wjVMGv1EVkg0QfhlL7PNMIhfYWYJAg4kv+FqOq6PE1c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qXCkiC09s1jtg159boAEm3roRKuTROnE26v1YVaZC3W+NzTWKEJm2I1xvK9w/02TQ
         r5zH63IN5awIaUH85Wvz9uXeY5TAdu+Bke1b2HV0EkZdsXgvskzKLAPNvH44JSTR2Y
         3Pnw+pW+o0OmJorlOQ/7DUwspDA+29Yu2zkCZq0sv/XIRhQihc2whl7N3Y5Fnhb0fl
         IFCuGlKvpYl6fmtIP9Fxw5YGRivSBYzAlKnRqyysEa/b/aguffdkyVDUXbkoWZDGJ1
         HtfcKlWr4u7d06pTSYTquq5/pQKKiZQ9xfa4WFO7yDFV1zrHCfcCQx4gFPuS/tl5l3
         Y+HEh7dSfuIUg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 21/69] Input: regulator-haptic - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:54 +0000
Message-Id: <20230102181842.718010-22-jic23@kernel.org>
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
 drivers/input/misc/regulator-haptic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/regulator-haptic.c b/drivers/input/misc/regulator-haptic.c
index a661e77545c5..02f73b7c0462 100644
--- a/drivers/input/misc/regulator-haptic.c
+++ b/drivers/input/misc/regulator-haptic.c
@@ -201,7 +201,7 @@ static int regulator_haptic_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused regulator_haptic_suspend(struct device *dev)
+static int regulator_haptic_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct regulator_haptic *haptic = platform_get_drvdata(pdev);
@@ -220,7 +220,7 @@ static int __maybe_unused regulator_haptic_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused regulator_haptic_resume(struct device *dev)
+static int regulator_haptic_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct regulator_haptic *haptic = platform_get_drvdata(pdev);
@@ -239,7 +239,7 @@ static int __maybe_unused regulator_haptic_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(regulator_haptic_pm_ops,
+static DEFINE_SIMPLE_DEV_PM_OPS(regulator_haptic_pm_ops,
 		regulator_haptic_suspend, regulator_haptic_resume);
 
 static const struct of_device_id regulator_haptic_dt_match[] = {
@@ -253,7 +253,7 @@ static struct platform_driver regulator_haptic_driver = {
 	.driver		= {
 		.name		= "regulator-haptic",
 		.of_match_table = regulator_haptic_dt_match,
-		.pm		= &regulator_haptic_pm_ops,
+		.pm		= pm_sleep_ptr(&regulator_haptic_pm_ops),
 	},
 };
 module_platform_driver(regulator_haptic_driver);
-- 
2.39.0

