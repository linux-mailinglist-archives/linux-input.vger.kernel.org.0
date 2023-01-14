Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62A8E66ACCD
	for <lists+linux-input@lfdr.de>; Sat, 14 Jan 2023 18:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbjANRC7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Jan 2023 12:02:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbjANRC5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Jan 2023 12:02:57 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B836DB776
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 09:02:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 376B3B80A07
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 17:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FD9C433EF;
        Sat, 14 Jan 2023 17:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673715772;
        bh=dykHAaWG+KSvPCrUvb7Dm/B3XnIPq5JU0vuHaOcNvo4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hnYsY/flp0PuuBu79BsjEUrknUegqN6pdDMzrAi3RnngoswwxJynmP2aV07szyDzU
         TvXMEQYHJSRNxfOADur4FZN8QL2ZMHK0Fua/hrV2M6CYVCdD2OyTcya10xl/p/wTNs
         5eM5ZaMdozOZHPBlYOccp964aQ44RJdlpuNN8jfVivC1F7Pi/Hd47RvWrEz3lm5dp0
         lUjFK/I7W2GvFsjWIWH0c7qR1B0iKgsgc617b8Ff5NoVU9Fx8jhbkrm3Gj9C4+B2Pe
         M+ucve3kH4d4M1m0ui+YYLKqC4ncpOww0K95QmlX/5vYWidCehTF5YAbwiogxMrQeq
         9M1a711CuPblQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     jic23@kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 03/16] Input: samsung-keypad - switch to pm_ptr() and SYSTEM_SLEEP/RUNTIME_PM_OPS()
Date:   Sat, 14 Jan 2023 17:16:07 +0000
Message-Id: <20230114171620.42891-4-jic23@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114171620.42891-1-jic23@kernel.org>
References: <20230114171620.42891-1-jic23@kernel.org>
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

The SET_ variants are deprecated as they require explicit protection
against unused function warnings.  The new combination of pm_ptr()
and SYSTEM_SLEEP/RUNTIME_DEV_PM_OPS() allow the compiler to see the
functions, thus suppressing the warning, but still allowing the unused
code to be removed. Thus also drop the #ifdef guards.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/input/keyboard/samsung-keypad.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index df0258dcf89e..09e883ea1352 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -458,7 +458,6 @@ static int samsung_keypad_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int samsung_keypad_runtime_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -503,9 +502,7 @@ static int samsung_keypad_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-#ifdef CONFIG_PM_SLEEP
 static void samsung_keypad_toggle_wakeup(struct samsung_keypad *keypad,
 					 bool enable)
 {
@@ -563,12 +560,11 @@ static int samsung_keypad_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops samsung_keypad_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(samsung_keypad_suspend, samsung_keypad_resume)
-	SET_RUNTIME_PM_OPS(samsung_keypad_runtime_suspend,
-			   samsung_keypad_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(samsung_keypad_suspend, samsung_keypad_resume)
+	RUNTIME_PM_OPS(samsung_keypad_runtime_suspend,
+		       samsung_keypad_runtime_resume, NULL)
 };
 
 #ifdef CONFIG_OF
@@ -598,7 +594,7 @@ static struct platform_driver samsung_keypad_driver = {
 	.driver		= {
 		.name	= "samsung-keypad",
 		.of_match_table = of_match_ptr(samsung_keypad_dt_match),
-		.pm	= &samsung_keypad_pm_ops,
+		.pm	= pm_ptr(&samsung_keypad_pm_ops),
 	},
 	.id_table	= samsung_keypad_driver_ids,
 };
-- 
2.39.0

