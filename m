Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6C6665B64B
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236433AbjABSGz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236457AbjABSG0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:26 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 602C9C25
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CAA6661084
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4424FC433F1;
        Mon,  2 Jan 2023 18:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682785;
        bh=KJ/6Fiq+66gE9QBOZoiYId0WA81ucFP75UxDeS2Imk0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e4yvhEs0xPTsnkD5HH60UsUBQP0Fd2zXRInJMyj/+aMx8MieFxqKp/RVuXJ7NYfuV
         z7gVpYD2XxSfBkT9ftrg7PLpkFA9yTbNyRY/SilpBkQxAEfa15jn5viQKOjBJ28KCF
         9rs23lqUHX3o3SZvfI8HYdRlb1eiSF0VtvBaz0doJOxB/fLt1Xooh/OzFVl26uwGwr
         rRBBYUwo/OM+4A0/KnLW1cwNc1hUF5OFJl9pFzec7uReUyMk2wxQq7IOlky/wv36pS
         YFC0+NHg4BpmY7oKC4g+Q5Iok0/sv4Z0iuWpZRiWa1xx1JipYc3kGUM8wGpytzlrFC
         JRu1IhT81IUGg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Tony Lindgren <tony@atomide.com>
Subject: [PATCH 24/69] Input: twl4030-vibra - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:57 +0000
Message-Id: <20230102181842.718010-25-jic23@kernel.org>
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
Cc: Tony Lindgren <tony@atomide.com>
---
 drivers/input/misc/twl4030-vibra.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/misc/twl4030-vibra.c b/drivers/input/misc/twl4030-vibra.c
index 5619996da86f..101548b35ee3 100644
--- a/drivers/input/misc/twl4030-vibra.c
+++ b/drivers/input/misc/twl4030-vibra.c
@@ -143,7 +143,7 @@ static void twl4030_vibra_close(struct input_dev *input)
 }
 
 /*** Module ***/
-static int __maybe_unused twl4030_vibra_suspend(struct device *dev)
+static int twl4030_vibra_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct vibra_info *info = platform_get_drvdata(pdev);
@@ -154,14 +154,14 @@ static int __maybe_unused twl4030_vibra_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused twl4030_vibra_resume(struct device *dev)
+static int twl4030_vibra_resume(struct device *dev)
 {
 	vibra_disable_leds();
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(twl4030_vibra_pm_ops,
-			 twl4030_vibra_suspend, twl4030_vibra_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(twl4030_vibra_pm_ops,
+				twl4030_vibra_suspend, twl4030_vibra_resume);
 
 static bool twl4030_vibra_check_coexist(struct device_node *parent)
 {
@@ -234,7 +234,7 @@ static struct platform_driver twl4030_vibra_driver = {
 	.probe		= twl4030_vibra_probe,
 	.driver		= {
 		.name	= "twl4030-vibra",
-		.pm	= &twl4030_vibra_pm_ops,
+		.pm	= pm_sleep_ptr(&twl4030_vibra_pm_ops),
 	},
 };
 module_platform_driver(twl4030_vibra_driver);
-- 
2.39.0

