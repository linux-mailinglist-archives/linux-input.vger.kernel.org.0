Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5BB641E51
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbiLDR4P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbiLDR4O (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:14 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301E6140CD
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C92D260EDC
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CCEC433D7;
        Sun,  4 Dec 2022 17:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176573;
        bh=C57XBgOiDjdkdqotpKYfKJSQyCNiNL4jZK190Z3LfZE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TMuOOG2EcABu39+sDMSuUmMiL54pSUyvyZWnsKnK8GCF+HUY5kY8CANHcK/XQfTW/
         bUXaRY8KkIDau0lkaPxalT7v2SXYi1mPSSDc0NTd7mx6B3BRFClQmYvbBYcgQnd0Vp
         KYtRubpZ4RciHbMI4hNJZNxEKxE8HSbl7QTDTvJ0KeVslWo4SfBQlC2KerzyyH8EV6
         f5K2icly2fRDckq6Q01dZANDg/PUl7vwcokheMcChsHPxvCs4N1kwFmIiwInlHv4kj
         mwiI2/dHNDS1C47qS2YI3deJ62rOLdhAE8pBXWaRvw4HGhCJbPX24VcOOd5Ijpny+y
         CHJq/Bo2+Ma6g==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 06/32] Input: gpio-keys - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:15 +0000
Message-Id: <20221204180841.2211588-7-jic23@kernel.org>
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
removed. Thus also drop the __maybe_unused markings.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/input/keyboard/gpio_keys.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index a5dc4ab87fa1..5496482a38c1 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -992,7 +992,7 @@ gpio_keys_disable_wakeup(struct gpio_keys_drvdata *ddata)
 	}
 }
 
-static int __maybe_unused gpio_keys_suspend(struct device *dev)
+static int gpio_keys_suspend(struct device *dev)
 {
 	struct gpio_keys_drvdata *ddata = dev_get_drvdata(dev);
 	struct input_dev *input = ddata->input;
@@ -1012,7 +1012,7 @@ static int __maybe_unused gpio_keys_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused gpio_keys_resume(struct device *dev)
+static int gpio_keys_resume(struct device *dev)
 {
 	struct gpio_keys_drvdata *ddata = dev_get_drvdata(dev);
 	struct input_dev *input = ddata->input;
@@ -1034,7 +1034,7 @@ static int __maybe_unused gpio_keys_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(gpio_keys_pm_ops, gpio_keys_suspend, gpio_keys_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(gpio_keys_pm_ops, gpio_keys_suspend, gpio_keys_resume);
 
 static void gpio_keys_shutdown(struct platform_device *pdev)
 {
@@ -1050,7 +1050,7 @@ static struct platform_driver gpio_keys_device_driver = {
 	.shutdown	= gpio_keys_shutdown,
 	.driver		= {
 		.name	= "gpio-keys",
-		.pm	= &gpio_keys_pm_ops,
+		.pm	= pm_sleep_ptr(&gpio_keys_pm_ops),
 		.of_match_table = gpio_keys_of_match,
 		.dev_groups	= gpio_keys_groups,
 	}
-- 
2.38.1

