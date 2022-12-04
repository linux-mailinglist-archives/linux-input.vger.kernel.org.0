Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9A02641E5B
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:57:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbiLDR4y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbiLDR40 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:26 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 017D3140D2
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AFCDDB80B8D
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF0EC433D7;
        Sun,  4 Dec 2022 17:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176583;
        bh=vTeqQ/FADlj6OHw9wfTnAZpdtyR+2INUfKAhCBkhRIM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bGRkBALpBM5lfUUeonHyxwUp17+l8mCPUTOPghI94NLKhaJzCNJbVgUqUtXmYhxtD
         riMU3PoSonNMD/I5XbHWwoffH43VWo3HEFyxVJjNR41Cq94k4SXdMaZKRtgcUhUrWp
         5ZSCwODLEHc483hfCISto1VEZT6OvlEso4r6gsHf2IggpwSW1NDI+onAHSNa3MzKwp
         p8EtfxJPY2nWVmV/sdgi0QkiZaDlBoPUCb+2BrjHVABPgBBpN287oE49bvm4pZJ7UH
         YfdBCse08FktU093pRLznX2rpUQHjfqdX62AHMOpOPQ6YzU+gs+vOKV3PYmZ7cSIEI
         wcAFix3f1M5DQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 14/32] Input: lpc32xx-keys - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:23 +0000
Message-Id: <20221204180841.2211588-15-jic23@kernel.org>
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
 drivers/input/keyboard/lpc32xx-keys.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/lpc32xx-keys.c b/drivers/input/keyboard/lpc32xx-keys.c
index 943aeeb0de79..911e1181cd6f 100644
--- a/drivers/input/keyboard/lpc32xx-keys.c
+++ b/drivers/input/keyboard/lpc32xx-keys.c
@@ -264,7 +264,6 @@ static int lpc32xx_kscan_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int lpc32xx_kscan_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -302,10 +301,9 @@ static int lpc32xx_kscan_resume(struct device *dev)
 	mutex_unlock(&input->mutex);
 	return retval;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(lpc32xx_kscan_pm_ops, lpc32xx_kscan_suspend,
-			 lpc32xx_kscan_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(lpc32xx_kscan_pm_ops, lpc32xx_kscan_suspend,
+				lpc32xx_kscan_resume);
 
 static const struct of_device_id lpc32xx_kscan_match[] = {
 	{ .compatible = "nxp,lpc3220-key" },
@@ -317,7 +315,7 @@ static struct platform_driver lpc32xx_kscan_driver = {
 	.probe		= lpc32xx_kscan_probe,
 	.driver		= {
 		.name	= DRV_NAME,
-		.pm	= &lpc32xx_kscan_pm_ops,
+		.pm	= pm_sleep_ptr(&lpc32xx_kscan_pm_ops),
 		.of_match_table = lpc32xx_kscan_match,
 	}
 };
-- 
2.38.1

