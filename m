Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1F54641E54
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:56:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbiLDR4S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbiLDR4R (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E24A140D2
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EB374B80886
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D032C433C1;
        Sun,  4 Dec 2022 17:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176574;
        bh=3Lky+xKxHB3nBcYHWbORFQoR4+X4lAy6Ei+zknpbUG4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jvAwqj1WBtNU4nn27LeuWO3VOOf0TOiqWcfwexSqxSfOdUH0W1RzM+JGTfEh1eI6L
         etRktfxiV40G1/LHJPOeJtu082l/+O52XRygyHV0sogv8AEfvzT4AGxCUkN8St0FFJ
         18h9SZCFks2qQya5uf5FRVvSofJLsoTBZYmqRCtLaQqSLNE3UMVGl2z1hWjWA2wYBd
         suA4zIFgSYiTqrgi4xyS0LXfR3bb9aiDYSGK/7dBEBZzqd5/L0ttavs7WJdWvazcdD
         T7gjbNSdyj5F2K84GsN7AUN4GMvQztyBhBQ0otyizSZr7hyAiTBemQOoc2kZciYwT9
         QfG8ZRxMr/TQA==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 07/32] Input: ipaq-micro-keys - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:16 +0000
Message-Id: <20221204180841.2211588-8-jic23@kernel.org>
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
Cc: Linus Walleij <linus.walleij@linaro.org>

---
 drivers/input/keyboard/ipaq-micro-keys.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/ipaq-micro-keys.c b/drivers/input/keyboard/ipaq-micro-keys.c
index 13a66a8e3411..7b509bce2b33 100644
--- a/drivers/input/keyboard/ipaq-micro-keys.c
+++ b/drivers/input/keyboard/ipaq-micro-keys.c
@@ -124,7 +124,7 @@ static int micro_key_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused micro_key_suspend(struct device *dev)
+static int micro_key_suspend(struct device *dev)
 {
 	struct ipaq_micro_keys *keys = dev_get_drvdata(dev);
 
@@ -133,7 +133,7 @@ static int __maybe_unused micro_key_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused micro_key_resume(struct device *dev)
+static int micro_key_resume(struct device *dev)
 {
 	struct ipaq_micro_keys *keys = dev_get_drvdata(dev);
 	struct input_dev *input = keys->input;
@@ -148,13 +148,13 @@ static int __maybe_unused micro_key_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(micro_key_dev_pm_ops,
-			 micro_key_suspend, micro_key_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(micro_key_dev_pm_ops,
+				micro_key_suspend, micro_key_resume);
 
 static struct platform_driver micro_key_device_driver = {
 	.driver = {
 		.name    = "ipaq-micro-keys",
-		.pm	= &micro_key_dev_pm_ops,
+		.pm	= pm_sleep_ptr(&micro_key_dev_pm_ops),
 	},
 	.probe   = micro_key_probe,
 };
-- 
2.38.1

