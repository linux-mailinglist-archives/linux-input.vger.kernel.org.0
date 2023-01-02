Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F31A65B674
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236530AbjABSHe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236475AbjABSHY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:24 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55977625E
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 06CCEB80DF0
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B06C433EF;
        Mon,  2 Jan 2023 18:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682840;
        bh=oWaP/dpAbIyR5ftaPWRn+r0glgsacUFqwB+Ehr/0slA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rhbmDm2yFKP42bCYhYcMl6ovFVnc0qyAMnJnigqyHgqaDWS/eyqiCFtAoBgxteFhq
         zRQKAgiVLN0lsUU8RTwBQCLkNC7dMD8OaTvG5GPqAOhrF7J9uZOQuo6oLgCizGG+Ue
         /6knM1QNa9B2RXlxX3tMDDKnphttAKzmS3se9NSLQ54MCIfyhwHsGKLTKQP5xNRWS3
         5XcoZtsEapJGDCvuoCMUSUzBSqSHU8VEMIRQ8tvlQliVI3dMl/ZY8pHvT0oF8ocQhL
         h44gTnauW6wX8hAVqB9HKsv0+ij55zaxMHot4bwIpsRvjOCjjiiywAy1LninEjefMU
         n1npoZsZyMXkg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 66/69] Input: wm97xx - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:39 +0000
Message-Id: <20230102181842.718010-67-jic23@kernel.org>
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
 drivers/input/touchscreen/wm97xx-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/wm97xx-core.c b/drivers/input/touchscreen/wm97xx-core.c
index f51ab5614532..ac3b3dd59488 100644
--- a/drivers/input/touchscreen/wm97xx-core.c
+++ b/drivers/input/touchscreen/wm97xx-core.c
@@ -763,7 +763,7 @@ static int wm97xx_mfd_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused wm97xx_suspend(struct device *dev)
+static int wm97xx_suspend(struct device *dev)
 {
 	struct wm97xx *wm = dev_get_drvdata(dev);
 	u16 reg;
@@ -797,7 +797,7 @@ static int __maybe_unused wm97xx_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused wm97xx_resume(struct device *dev)
+static int wm97xx_resume(struct device *dev)
 {
 	struct wm97xx *wm = dev_get_drvdata(dev);
 
@@ -833,7 +833,7 @@ static int __maybe_unused wm97xx_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(wm97xx_pm_ops, wm97xx_suspend, wm97xx_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(wm97xx_pm_ops, wm97xx_suspend, wm97xx_resume);
 
 /*
  * Machine specific operations
@@ -869,13 +869,13 @@ static struct device_driver wm97xx_driver = {
 	.owner =	THIS_MODULE,
 	.probe =	wm97xx_probe,
 	.remove =	wm97xx_remove,
-	.pm =		&wm97xx_pm_ops,
+	.pm =		pm_sleep_ptr(&wm97xx_pm_ops),
 };
 
 static struct platform_driver wm97xx_mfd_driver = {
 	.driver = {
 		.name =		"wm97xx-ts",
-		.pm =		&wm97xx_pm_ops,
+		.pm =		pm_sleep_ptr(&wm97xx_pm_ops),
 	},
 	.probe =	wm97xx_mfd_probe,
 	.remove =	wm97xx_mfd_remove,
-- 
2.39.0

