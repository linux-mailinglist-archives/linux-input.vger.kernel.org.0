Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59F2166ACCE
	for <lists+linux-input@lfdr.de>; Sat, 14 Jan 2023 18:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbjANRDA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Jan 2023 12:03:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbjANRC6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Jan 2023 12:02:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909DFA5D8
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 09:02:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E6623B808C2
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 17:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6C7C433D2;
        Sat, 14 Jan 2023 17:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673715774;
        bh=sCMLoY0TZl0mA3CTDTauBhZyEf4eqEFuiC41HUSHGgY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ubrC/Q49ITWH5ScYRm3rbD5zeJY5iYXPr/5bzET1mTObp5dj9JtrBtGYlQ6S4Fz+o
         pExLNIldgIpQ5kTxR6yhu5oky9H2Ye4pj194P5m3VRbehljxPnVT9jc9C2COm3MImt
         95Xrv6DRASviCYPEdV737ZXe5kfwTEq0wXo8i1dfq/lnhiEJ1QxqqmxuqyCPH7d6mE
         8Hza1K0esOyJwkc0YerpK6XOSJoQBY6kdVIlzYsdL9JLKXaW5IXJK+zLZZNRaEQSuE
         zayHNgfjhoC938QdK/tN+AD9CyT3Ot6WdsalEWYOHMLm99lVQvNJ3Ms3kvf1PdgERd
         cx9LQpkt67MIA==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     jic23@kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Andi Shyti <andi@etezian.org>
Subject: [PATCH 04/16] Input: s6sy761 - switch to SYSTEM_SLEEP_/RUNTIME_PM_OPS() and pm_ptr()
Date:   Sat, 14 Jan 2023 17:16:08 +0000
Message-Id: <20230114171620.42891-5-jic23@kernel.org>
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
Cc: Caleb Connolly <caleb@connolly.tech>
Cc: Andi Shyti <andi@etezian.org>
---
 drivers/input/touchscreen/s6sy761.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/s6sy761.c b/drivers/input/touchscreen/s6sy761.c
index cc417c03aaca..371cf4848ad5 100644
--- a/drivers/input/touchscreen/s6sy761.c
+++ b/drivers/input/touchscreen/s6sy761.c
@@ -479,7 +479,7 @@ static void s6sy761_remove(struct i2c_client *client)
 	pm_runtime_disable(&client->dev);
 }
 
-static int __maybe_unused s6sy761_runtime_suspend(struct device *dev)
+static int s6sy761_runtime_suspend(struct device *dev)
 {
 	struct s6sy761_data *sdata = dev_get_drvdata(dev);
 
@@ -487,7 +487,7 @@ static int __maybe_unused s6sy761_runtime_suspend(struct device *dev)
 				S6SY761_APPLICATION_MODE, S6SY761_APP_SLEEP);
 }
 
-static int __maybe_unused s6sy761_runtime_resume(struct device *dev)
+static int s6sy761_runtime_resume(struct device *dev)
 {
 	struct s6sy761_data *sdata = dev_get_drvdata(dev);
 
@@ -495,7 +495,7 @@ static int __maybe_unused s6sy761_runtime_resume(struct device *dev)
 				S6SY761_APPLICATION_MODE, S6SY761_APP_NORMAL);
 }
 
-static int __maybe_unused s6sy761_suspend(struct device *dev)
+static int s6sy761_suspend(struct device *dev)
 {
 	struct s6sy761_data *sdata = dev_get_drvdata(dev);
 
@@ -504,7 +504,7 @@ static int __maybe_unused s6sy761_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused s6sy761_resume(struct device *dev)
+static int s6sy761_resume(struct device *dev)
 {
 	struct s6sy761_data *sdata = dev_get_drvdata(dev);
 
@@ -514,9 +514,8 @@ static int __maybe_unused s6sy761_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops s6sy761_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(s6sy761_suspend, s6sy761_resume)
-	SET_RUNTIME_PM_OPS(s6sy761_runtime_suspend,
-				s6sy761_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(s6sy761_suspend, s6sy761_resume)
+	RUNTIME_PM_OPS(s6sy761_runtime_suspend, s6sy761_runtime_resume, NULL)
 };
 
 #ifdef CONFIG_OF
@@ -537,7 +536,7 @@ static struct i2c_driver s6sy761_driver = {
 	.driver = {
 		.name = S6SY761_DEV_NAME,
 		.of_match_table = of_match_ptr(s6sy761_of_match),
-		.pm = &s6sy761_pm_ops,
+		.pm = pm_ptr(&s6sy761_pm_ops),
 	},
 	.probe_new = s6sy761_probe,
 	.remove = s6sy761_remove,
-- 
2.39.0

