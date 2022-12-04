Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0060B641E6C
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbiLDR47 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbiLDR4h (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:37 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EFA3140CD
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3B52660DEB
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D537BC43470;
        Sun,  4 Dec 2022 17:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176595;
        bh=60Ukzlb6cd5F4UzQ06v/qkbtLwp5G12OMTw7hfYOvLE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mmkxBeMTLqeDQUELypssZm7upcFsjijMZYhoWZ7CUT8ruEvfLewy18zQIy+C/7eWO
         7yAFmfnEbzlYEjhxt5EGOFMM0oKvG1PIttu6b0JT8wOUJXjC2LaJ10QCKNCNQ5cyj0
         vdjp/fRhyE7QbgItHj6tKEJ8A89nDEOWqDnUvLO91ENUB/HFO1O+qYB7oMZjjXCHmh
         5yGcbmLJYVL4LdI9dQvt0BS+rvfvFMH/o7Yfl9XeKi9sAemeJsYhXiCAwurNGWmDy2
         at7157qI/vYlnTPGh2331HQIo9pZ7owf6j45BuJ/G6/IEKA2opEIrzR2L1u2UFiOre
         u3h3unCH8AUUA==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 24/32] Input: tc3589x - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:33 +0000
Message-Id: <20221204180841.2211588-25-jic23@kernel.org>
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
 drivers/input/keyboard/tc3589x-keypad.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/tc3589x-keypad.c b/drivers/input/keyboard/tc3589x-keypad.c
index 78e55318ccd6..b0d86621c60a 100644
--- a/drivers/input/keyboard/tc3589x-keypad.c
+++ b/drivers/input/keyboard/tc3589x-keypad.c
@@ -455,7 +455,6 @@ static int tc3589x_keypad_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int tc3589x_keypad_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -492,15 +491,14 @@ static int tc3589x_keypad_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(tc3589x_keypad_dev_pm_ops,
-			 tc3589x_keypad_suspend, tc3589x_keypad_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(tc3589x_keypad_dev_pm_ops,
+				tc3589x_keypad_suspend, tc3589x_keypad_resume);
 
 static struct platform_driver tc3589x_keypad_driver = {
 	.driver	= {
 		.name	= "tc3589x-keypad",
-		.pm	= &tc3589x_keypad_dev_pm_ops,
+		.pm	= pm_sleep_ptr(&tc3589x_keypad_dev_pm_ops),
 	},
 	.probe	= tc3589x_keypad_probe,
 };
-- 
2.38.1

