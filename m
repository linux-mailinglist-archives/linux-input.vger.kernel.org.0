Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC5965B64C
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236435AbjABSGz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236479AbjABSGb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:31 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C15E116B
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D4A4961090
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE08C433EF;
        Mon,  2 Jan 2023 18:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682789;
        bh=PhkmDoI+0I6gM2p/4+vbRdX2WIzy2DkWL1S+oB0vbTA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kqWoHpMhAFLZm+6iSw3mx+j88uDEu7nNbZrqOxtHa5K6rkdxIBYcSRlWH1V1C4v45
         gmUE8U1qaTLUyXcNjMeHrGirXaJVrq7vV/eERgOC9aTmD2Qn1PXZ1pTkJitf4v9lz2
         f01hscYMPvnhXeemzhrOR9DO4AVGaUEx1vY6jOGHUZ1UTkHKCQdrqDpDqDElnzvwcU
         5RN8U5AGo7+5OPGPN+zPaE3sgdD8dNAfdAJnlzIdMGy5pcaYGvFvAKi2jCOMrcf7BJ
         7jwbQ1ViGJhhxQ96UNV1vaux0Tu1TQWuR36ZwE0Tn2WEt1Fv6O8EpMO9+CCuGWH81p
         qJpTBZ3IvMuzg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 27/69] Input: navpoint - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:00 +0000
Message-Id: <20230102181842.718010-28-jic23@kernel.org>
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
 drivers/input/mouse/navpoint.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/input/mouse/navpoint.c b/drivers/input/mouse/navpoint.c
index 4d67575bb276..2b7b86eef280 100644
--- a/drivers/input/mouse/navpoint.c
+++ b/drivers/input/mouse/navpoint.c
@@ -315,7 +315,7 @@ static int navpoint_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused navpoint_suspend(struct device *dev)
+static int navpoint_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct navpoint *navpoint = platform_get_drvdata(pdev);
@@ -329,7 +329,7 @@ static int __maybe_unused navpoint_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused navpoint_resume(struct device *dev)
+static int navpoint_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct navpoint *navpoint = platform_get_drvdata(pdev);
@@ -343,14 +343,15 @@ static int __maybe_unused navpoint_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(navpoint_pm_ops, navpoint_suspend, navpoint_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(navpoint_pm_ops,
+				navpoint_suspend, navpoint_resume);
 
 static struct platform_driver navpoint_driver = {
 	.probe		= navpoint_probe,
 	.remove		= navpoint_remove,
 	.driver = {
 		.name	= "navpoint",
-		.pm	= &navpoint_pm_ops,
+		.pm	= pm_sleep_ptr(&navpoint_pm_ops),
 	},
 };
 
-- 
2.39.0

