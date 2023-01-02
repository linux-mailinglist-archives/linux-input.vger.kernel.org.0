Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 140CB65B649
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236508AbjABSGy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236475AbjABSG2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90838116B
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2E2C561084
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1265C433EF;
        Mon,  2 Jan 2023 18:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682786;
        bh=kJHZb0C+/iFCJLe0VK0nSQP3gxiI/hMvlbaIkD1LlRA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m550oxrW8uz81BVZhp43Q+SrcTp+I1b5QTzui7aN5N86wSCglfskTgQo+JQ9gTxXs
         zw3AMPpDWcrC6eE8rGN54m20iGFfvaJylitV8FS8c8yrxu8qupg9QQWczp/ipNgSwK
         vz/JLUOf0+Ejx1tnrZXqs0vUSCxrtl8YR5E2BOKJz9NH/qJbRTYU5ysD+qjTgnJkHU
         2ezZ3CxhLmNQL84xLV/kLLd64RrbbRHvVh9tMvys6PFTOjS9n85n0K6yXhSeHQMu7d
         j6rAIED9usk66QIEPLULXZGZ5rP+KaHXVjEmWT8rl4qTMJ7tljYl1YJQUJunDo8KYg
         7RILEjnrCaTSg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Tony Lindgren <tony@atomide.com>
Subject: [PATCH 25/69] Input: twl6030-vibra - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:58 +0000
Message-Id: <20230102181842.718010-26-jic23@kernel.org>
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
 drivers/input/misc/twl6040-vibra.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/twl6040-vibra.c b/drivers/input/misc/twl6040-vibra.c
index bf6644927630..78f0b63e5c20 100644
--- a/drivers/input/misc/twl6040-vibra.c
+++ b/drivers/input/misc/twl6040-vibra.c
@@ -210,7 +210,7 @@ static void twl6040_vibra_close(struct input_dev *input)
 		twl6040_vibra_disable(info);
 }
 
-static int __maybe_unused twl6040_vibra_suspend(struct device *dev)
+static int twl6040_vibra_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct vibra_info *info = platform_get_drvdata(pdev);
@@ -223,7 +223,8 @@ static int __maybe_unused twl6040_vibra_suspend(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(twl6040_vibra_pm_ops, twl6040_vibra_suspend, NULL);
+static DEFINE_SIMPLE_DEV_PM_OPS(twl6040_vibra_pm_ops,
+				twl6040_vibra_suspend, NULL);
 
 static int twl6040_vibra_probe(struct platform_device *pdev)
 {
@@ -354,7 +355,7 @@ static struct platform_driver twl6040_vibra_driver = {
 	.probe		= twl6040_vibra_probe,
 	.driver		= {
 		.name	= "twl6040-vibra",
-		.pm	= &twl6040_vibra_pm_ops,
+		.pm	= pm_sleep_ptr(&twl6040_vibra_pm_ops),
 	},
 };
 module_platform_driver(twl6040_vibra_driver);
-- 
2.39.0

