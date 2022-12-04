Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBA72641E52
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbiLDR4Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbiLDR4P (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:15 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81766140D0
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4340FB80886
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45DF0C433C1;
        Sun,  4 Dec 2022 17:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176572;
        bh=XlqaHO4DKK4/tExXGHlwiTmpl72Ain9+PidTnAzVTzA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cc3QqKQliuAClX/k5qsL4MJLkXvi3vMoCCFlNlYUS2Qpy/5Dq0DNFyucmn+eajCrN
         So4xWcuzcV7NHWCvRlM/SkSnUbZdsvQihz6Z2/oTO+xDAD2yOA5IOi2v0QJb/7JT8o
         6DPE14Of5yjfdCf9ameRVlScMZwB6UzcJPU4a1Pogbb+MULuV08QlEtBU/uLDawCEC
         dCLjnLlZZTJ8q16Tni23gr+n//1te1IJ+i32dcutSqF/A4MePYFceXk8WrzW6ZkDFZ
         AT5FLI0dPWVHEbR2PG7Gmp/WKLfNRtoFynmVjbrBIi3+iJ2jR+2CuWwE41IumpmLSv
         BRw6n+uITTxNQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 05/32] Input: ep39xx-keypad - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:14 +0000
Message-Id: <20221204180841.2211588-6-jic23@kernel.org>
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
 drivers/input/keyboard/ep93xx_keypad.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
index f5bf7524722a..55075addcac2 100644
--- a/drivers/input/keyboard/ep93xx_keypad.c
+++ b/drivers/input/keyboard/ep93xx_keypad.c
@@ -178,7 +178,7 @@ static void ep93xx_keypad_close(struct input_dev *pdev)
 }
 
 
-static int __maybe_unused ep93xx_keypad_suspend(struct device *dev)
+static int ep93xx_keypad_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
@@ -196,7 +196,7 @@ static int __maybe_unused ep93xx_keypad_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ep93xx_keypad_resume(struct device *dev)
+static int ep93xx_keypad_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
@@ -217,8 +217,8 @@ static int __maybe_unused ep93xx_keypad_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(ep93xx_keypad_pm_ops,
-			 ep93xx_keypad_suspend, ep93xx_keypad_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ep93xx_keypad_pm_ops,
+				ep93xx_keypad_suspend, ep93xx_keypad_resume);
 
 static void ep93xx_keypad_release_gpio_action(void *_pdev)
 {
@@ -318,7 +318,7 @@ static int ep93xx_keypad_remove(struct platform_device *pdev)
 static struct platform_driver ep93xx_keypad_driver = {
 	.driver		= {
 		.name	= "ep93xx-keypad",
-		.pm	= &ep93xx_keypad_pm_ops,
+		.pm	= pm_sleep_ptr(&ep93xx_keypad_pm_ops),
 	},
 	.probe		= ep93xx_keypad_probe,
 	.remove		= ep93xx_keypad_remove,
-- 
2.38.1

