Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBB9641E57
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbiLDR4v (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbiLDR4X (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C14140D0
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1A255B80B8D
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03034C433C1;
        Sun,  4 Dec 2022 17:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176579;
        bh=lNtXRtqMGslc3byALBZnfjx/EhEkMCwXUqmIRqPRA88=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fb6XAWLxJxqH6fzZSn+fiLGXbZ4MpLoGE7ysre2nvdCaI+sI1GP8HBdj7/2rEAJes
         UzOrD3ybNrTxneLIKqGxmbN0Ay8OgR3zCiyQhhDjp2MYC52etZ4fCYrDVnamR0D/tu
         vJWdNHcz6w4sDX1sDZhgr5Bz2Xd77y4qNGY3whUj1AdYvysqO9fhhytuGIXi3VR0cA
         H8x+aKO7yGcU03hQNRachwpN5xfuuvEfofPTIXiDwD7vpKmvSptYhlYez6gd/ReGbD
         T/wEru7ptpgRQTMesHx/x4BnbPwdcTSKdPNlJzwkidlH41DGF3jha72aG6a2bdBOl7
         5VFLLmWT91jBQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 11/32] Input: spear-keyboard - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:20 +0000
Message-Id: <20221204180841.2211588-12-jic23@kernel.org>
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
 drivers/input/keyboard/spear-keyboard.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/spear-keyboard.c b/drivers/input/keyboard/spear-keyboard.c
index 9838c79cb288..4bb7c533147c 100644
--- a/drivers/input/keyboard/spear-keyboard.c
+++ b/drivers/input/keyboard/spear-keyboard.c
@@ -284,7 +284,7 @@ static int spear_kbd_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused spear_kbd_suspend(struct device *dev)
+static int spear_kbd_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct spear_kbd *kbd = platform_get_drvdata(pdev);
@@ -337,7 +337,7 @@ static int __maybe_unused spear_kbd_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused spear_kbd_resume(struct device *dev)
+static int spear_kbd_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct spear_kbd *kbd = platform_get_drvdata(pdev);
@@ -364,7 +364,8 @@ static int __maybe_unused spear_kbd_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(spear_kbd_pm_ops, spear_kbd_suspend, spear_kbd_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(spear_kbd_pm_ops,
+				spear_kbd_suspend, spear_kbd_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id spear_kbd_id_table[] = {
@@ -379,7 +380,7 @@ static struct platform_driver spear_kbd_driver = {
 	.remove		= spear_kbd_remove,
 	.driver		= {
 		.name	= "keyboard",
-		.pm	= &spear_kbd_pm_ops,
+		.pm	= pm_sleep_ptr(&spear_kbd_pm_ops),
 		.of_match_table = of_match_ptr(spear_kbd_id_table),
 	},
 };
-- 
2.38.1

