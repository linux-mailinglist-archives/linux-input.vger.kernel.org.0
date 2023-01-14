Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCAD166ACD0
	for <lists+linux-input@lfdr.de>; Sat, 14 Jan 2023 18:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjANRDC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Jan 2023 12:03:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbjANRC7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Jan 2023 12:02:59 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B91EBB777
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 09:02:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 49CC860BC1
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 17:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF6DC433F0;
        Sat, 14 Jan 2023 17:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673715777;
        bh=WmulUa00nVBFtJzNq66tmRXEyQB2Lu/VtCKKfiisxaE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LZX9lPzwd1SPD1gjIqO+VdUQ29yowdrwi/zygoqdtdtH4BGoioVWeSaz708KpCYtP
         XfuCFc+BlhhRQNS7XJlDb9kNa8h8v4uChE1/r1vZKavxH7bXD+74ZCe9hIIBFqhWvy
         3vYXcDrB/UEsPnPgNSMFpvq4w6ZOn4CH/zbZfztZTU3gW77jKJPUBtToIzRMcCEwT1
         JHS/Rejua8imUtNJzYQdfE7Y95yB+2GLsW5K5yU5TkjGVBMRtuPR2X5JCXueu1CmIr
         usN2tFLkg9RZndvWQHMK2Z7vE6l94hlalS/6iwEsbSJoMCcSY0AnZ7yVDI1isuZ7Ok
         fZHlvkcfaoBhA==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     jic23@kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andi Shyti <andi@etezian.org>
Subject: [PATCH 06/16] Input: stmfts - switch to SYSTEM_SLEEP_/RUNTIME_PM_OPS() and pm_ptr()
Date:   Sat, 14 Jan 2023 17:16:10 +0000
Message-Id: <20230114171620.42891-7-jic23@kernel.org>
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

SET_SYSTEM_SLEEP_PM_OPS() and SET_RUNTIME_PM_OPS() are deprecated as
they require explicit protection against unused function warnings.
The new combination of pm_ptr() and SYSTEM_SLEEP_PM_OPS()/
RUNTIME_PM_OPS() allows the compiler to see the functions,
thus suppressing the warning, but still allowing the unused code to be
removed. Thus also drop the __maybe_unused markings.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Andi Shyti <andi@etezian.org>
---
 drivers/input/touchscreen/stmfts.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index d092e89d40e8..fdbf5e68943c 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -742,7 +742,7 @@ static void stmfts_remove(struct i2c_client *client)
 	pm_runtime_disable(&client->dev);
 }
 
-static int __maybe_unused stmfts_runtime_suspend(struct device *dev)
+static int stmfts_runtime_suspend(struct device *dev)
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 	int ret;
@@ -754,7 +754,7 @@ static int __maybe_unused stmfts_runtime_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused stmfts_runtime_resume(struct device *dev)
+static int stmfts_runtime_resume(struct device *dev)
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 	int ret;
@@ -766,7 +766,7 @@ static int __maybe_unused stmfts_runtime_resume(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused stmfts_suspend(struct device *dev)
+static int stmfts_suspend(struct device *dev)
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
@@ -775,7 +775,7 @@ static int __maybe_unused stmfts_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused stmfts_resume(struct device *dev)
+static int stmfts_resume(struct device *dev)
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
@@ -783,8 +783,8 @@ static int __maybe_unused stmfts_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops stmfts_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(stmfts_suspend, stmfts_resume)
-	SET_RUNTIME_PM_OPS(stmfts_runtime_suspend, stmfts_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(stmfts_suspend, stmfts_resume)
+	RUNTIME_PM_OPS(stmfts_runtime_suspend, stmfts_runtime_resume, NULL)
 };
 
 #ifdef CONFIG_OF
@@ -805,7 +805,7 @@ static struct i2c_driver stmfts_driver = {
 	.driver = {
 		.name = STMFTS_DEV_NAME,
 		.of_match_table = of_match_ptr(stmfts_of_match),
-		.pm = &stmfts_pm_ops,
+		.pm = pm_ptr(&stmfts_pm_ops),
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe_new = stmfts_probe,
-- 
2.39.0

