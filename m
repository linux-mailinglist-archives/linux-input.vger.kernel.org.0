Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40DE065B63D
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236303AbjABSGp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236313AbjABSGN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:13 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E582CD
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 10848B80D0B
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EED8C433F0;
        Mon,  2 Jan 2023 18:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682769;
        bh=SUXIjSXgaIalpRpwc0mafU/IbtWI52x8Vh5ylsyxOp4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sgdImx7wFO+xsA0OXjAPyyNJ3xh+y1yERsLzcFSZE/RGEs4Jno9AIPWyf2fTxYNkB
         CZDN/JQoWijA+SKKfNBBZFDAd8FwcqxQSfo1DX5XBqT7V0ab29i6pnv4Kv9eC7qq5U
         LV2iFOy4S1vKM4mqsh06kS6C3vuPrpKzW5qnjb0yGSC/hrhxlmiddd2rjME9ADUD6E
         lVZRM0zZjYHyKAeWjNJ1uRGhBogFgH5vvpMJYXEPPVZSpHUxlmp4H24kDdArCjauym
         E+XVEfNOFmngRvX4EO5ABbeRdTYJ49C75QiHmedAM/eSkwzDvMGomhuHCaYOlgqgkV
         YmgTObAz8iTew==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 12/69] Input: max8925_onkey - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:45 +0000
Message-Id: <20230102181842.718010-13-jic23@kernel.org>
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
 drivers/input/misc/max8925_onkey.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/max8925_onkey.c b/drivers/input/misc/max8925_onkey.c
index 4770cb55631a..62619e4fed20 100644
--- a/drivers/input/misc/max8925_onkey.c
+++ b/drivers/input/misc/max8925_onkey.c
@@ -129,7 +129,7 @@ static int max8925_onkey_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused max8925_onkey_suspend(struct device *dev)
+static int max8925_onkey_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct max8925_onkey_info *info = platform_get_drvdata(pdev);
@@ -143,7 +143,7 @@ static int __maybe_unused max8925_onkey_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused max8925_onkey_resume(struct device *dev)
+static int max8925_onkey_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct max8925_onkey_info *info = platform_get_drvdata(pdev);
@@ -157,12 +157,13 @@ static int __maybe_unused max8925_onkey_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(max8925_onkey_pm_ops, max8925_onkey_suspend, max8925_onkey_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(max8925_onkey_pm_ops,
+				max8925_onkey_suspend, max8925_onkey_resume);
 
 static struct platform_driver max8925_onkey_driver = {
 	.driver		= {
 		.name	= "max8925-onkey",
-		.pm	= &max8925_onkey_pm_ops,
+		.pm	= pm_sleep_ptr(&max8925_onkey_pm_ops),
 	},
 	.probe		= max8925_onkey_probe,
 };
-- 
2.39.0

