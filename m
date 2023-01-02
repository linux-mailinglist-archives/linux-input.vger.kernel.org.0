Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4F9B65B658
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236182AbjABSHQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236361AbjABSGq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:46 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529DB38BD
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DA38C61038
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62309C433F0;
        Mon,  2 Jan 2023 18:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682805;
        bh=P52FlEoCRfPh6+uYTUIosrqGHhs0uvLmWr7ieXaP2pU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MW5o7lbLLzncWae+N9RQ0A08mYZuMwUlc008XgCwfRu5HKBCuhjGjOuqTjD8D8ap/
         3vLPBLELVar1GXlf2BfaDaa3stWFkMLyvarnKV1j1jarJqC8aM6JoH2VVfmjvNtjoC
         rzvVUOPpo96cs/g8lRzeByvT2DyeIzDdXSQc/2A5Yp2Vl1T/gDYkozJZG8jhTVmJho
         9tckmVkmj3rX3D/FliIWNGUBRaXvpo3yL7914yIMgFMhj0k9UUqwiEww2B96E+WxDR
         reM3BvhHAlg095ERCaIHzINKmFJVGqEP6zvZNzYxLlGUAWU8YUH95w+xlxnWzyEm1c
         dlUJO7J0tg6eg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 39/69] Input: cy8ctma140 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:12 +0000
Message-Id: <20230102181842.718010-40-jic23@kernel.org>
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
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/cy8ctma140.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/cy8ctma140.c b/drivers/input/touchscreen/cy8ctma140.c
index 3a91d948b7f6..cd86477d971a 100644
--- a/drivers/input/touchscreen/cy8ctma140.c
+++ b/drivers/input/touchscreen/cy8ctma140.c
@@ -296,7 +296,7 @@ static int cy8ctma140_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused cy8ctma140_suspend(struct device *dev)
+static int cy8ctma140_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct cy8ctma140 *ts = i2c_get_clientdata(client);
@@ -307,7 +307,7 @@ static int __maybe_unused cy8ctma140_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cy8ctma140_resume(struct device *dev)
+static int cy8ctma140_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct cy8ctma140 *ts = i2c_get_clientdata(client);
@@ -322,7 +322,8 @@ static int __maybe_unused cy8ctma140_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(cy8ctma140_pm, cy8ctma140_suspend, cy8ctma140_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(cy8ctma140_pm,
+				cy8ctma140_suspend, cy8ctma140_resume);
 
 static const struct i2c_device_id cy8ctma140_idtable[] = {
 	{ CY8CTMA140_NAME, 0 },
@@ -339,7 +340,7 @@ MODULE_DEVICE_TABLE(of, cy8ctma140_of_match);
 static struct i2c_driver cy8ctma140_driver = {
 	.driver		= {
 		.name	= CY8CTMA140_NAME,
-		.pm	= &cy8ctma140_pm,
+		.pm	= pm_sleep_ptr(&cy8ctma140_pm),
 		.of_match_table = cy8ctma140_of_match,
 	},
 	.id_table	= cy8ctma140_idtable,
-- 
2.39.0

