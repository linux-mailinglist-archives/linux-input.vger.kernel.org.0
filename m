Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D60B641E65
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbiLDR45 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbiLDR4c (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E03140CD
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7224560EDC
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC91C433C1;
        Sun,  4 Dec 2022 17:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176590;
        bh=xAd5M6NwM0b7ZKljlJYd9WdFRhHFhDcNsCUVZEGTHMg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pWRJFsrDLyUWq44BCtfY1OGFbi0+ZxQnCDy2IBsz+/BnZESLhg2At15iCztQxsvmi
         xMiD4pc2ZuYuA2LHUTvdE+IBXzfbyb8Zdu/LsGSLfVVvXgaEJ/OaB+dPOV0N7kp18N
         TKH+WBj1IKkW/khX1Dtkq/xiIBe0C7b4UKnHLDSvofWWz1rl6clze4oKuBKKSBQjCk
         iaW9HlIRm8hy+g0chJD8CaWgct5yXbQUgq6w8xm452CN39+OBv0tPH+yWe8tvovuf2
         AO+zBpBeAm00t8dzLgrf03WmrvXKK0vfFKX1xwohAK/mkTRhBhr4UEf7cCahBSQxUU
         K74w82PNVTQLA==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 20/32] Input: pxa27x_keypad - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:29 +0000
Message-Id: <20221204180841.2211588-21-jic23@kernel.org>
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
 drivers/input/keyboard/pxa27x_keypad.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/pxa27x_keypad.c b/drivers/input/keyboard/pxa27x_keypad.c
index a7f8257c8a02..871f858d0ba7 100644
--- a/drivers/input/keyboard/pxa27x_keypad.c
+++ b/drivers/input/keyboard/pxa27x_keypad.c
@@ -660,7 +660,6 @@ static void pxa27x_keypad_close(struct input_dev *dev)
 	clk_disable_unprepare(keypad->clk);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int pxa27x_keypad_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -706,10 +705,9 @@ static int pxa27x_keypad_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(pxa27x_keypad_pm_ops,
-			 pxa27x_keypad_suspend, pxa27x_keypad_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pxa27x_keypad_pm_ops,
+				pxa27x_keypad_suspend, pxa27x_keypad_resume);
 
 
 static int pxa27x_keypad_probe(struct platform_device *pdev)
@@ -830,7 +828,7 @@ static struct platform_driver pxa27x_keypad_driver = {
 	.driver		= {
 		.name	= "pxa27x-keypad",
 		.of_match_table = of_match_ptr(pxa27x_keypad_dt_match),
-		.pm	= &pxa27x_keypad_pm_ops,
+		.pm	= pm_sleep_ptr(&pxa27x_keypad_pm_ops),
 	},
 };
 module_platform_driver(pxa27x_keypad_driver);
-- 
2.38.1

