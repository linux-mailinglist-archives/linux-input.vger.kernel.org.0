Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96A8765B63B
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236307AbjABSGn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236361AbjABSGK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B65116B
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3C6E36109E
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14BBC433D2;
        Mon,  2 Jan 2023 18:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682768;
        bh=rB5/nHkFGyj35jSAxOJAtOMC42cp1lz66fm9KeMNI5Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ngjEWFRji/QKFl0reVNiTDOABjPskEdp84R8Yqpf+fhAjvr4qnFl3Mr7wuznuW3yO
         KXYdP/B+gfwo4iIYQ4Rgg7afxdIIqwqjA2MHWHwRzvOr4lN4WmQyoZxKXhYkSZi7DI
         H4hce9r7opqSsxf+V+rMeLkAhzS/CTOOFSm0s4A+qKu7mqoEAm24rPSzJN6cds6KnL
         01CqdUIDHeW5/a+0iJvGWyRJOofNgSlQKLlZfAzIPcBkaTcRN2unj2AWcMKvNnszjG
         /G3wxrXxsix5yju3nxbxfg5LKFXIBv1cLNVKhU902HjhCkbgCXd1JutdFZKNWrei7W
         3owahULmXrTLw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 11/69] Input: max77693-haptic - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:44 +0000
Message-Id: <20230102181842.718010-12-jic23@kernel.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/input/misc/max77693-haptic.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/input/misc/max77693-haptic.c b/drivers/input/misc/max77693-haptic.c
index 4369d3c04d38..80f4416ffe2f 100644
--- a/drivers/input/misc/max77693-haptic.c
+++ b/drivers/input/misc/max77693-haptic.c
@@ -375,7 +375,7 @@ static int max77693_haptic_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused max77693_haptic_suspend(struct device *dev)
+static int max77693_haptic_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct max77693_haptic *haptic = platform_get_drvdata(pdev);
@@ -388,7 +388,7 @@ static int __maybe_unused max77693_haptic_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused max77693_haptic_resume(struct device *dev)
+static int max77693_haptic_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct max77693_haptic *haptic = platform_get_drvdata(pdev);
@@ -401,8 +401,9 @@ static int __maybe_unused max77693_haptic_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(max77693_haptic_pm_ops,
-			 max77693_haptic_suspend, max77693_haptic_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(max77693_haptic_pm_ops,
+				max77693_haptic_suspend,
+				max77693_haptic_resume);
 
 static const struct platform_device_id max77693_haptic_id[] = {
 	{ "max77693-haptic", TYPE_MAX77693 },
@@ -414,7 +415,7 @@ MODULE_DEVICE_TABLE(platform, max77693_haptic_id);
 static struct platform_driver max77693_haptic_driver = {
 	.driver		= {
 		.name	= "max77693-haptic",
-		.pm	= &max77693_haptic_pm_ops,
+		.pm	= pm_sleep_ptr(&max77693_haptic_pm_ops),
 	},
 	.probe		= max77693_haptic_probe,
 	.id_table	= max77693_haptic_id,
-- 
2.39.0

