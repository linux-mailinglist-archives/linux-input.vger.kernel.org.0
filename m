Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50D35641E59
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:57:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbiLDR4v (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbiLDR4Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:25 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4FD9140CD
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 087C8CE0BAD
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D44AC433D6;
        Sun,  4 Dec 2022 17:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176581;
        bh=dZpy/GJ340BdOCA7F3pmskMstdkhkITN4BXYoije6z4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ubGjBeWniol2/OkpEY6phtrSLBPui3vXv/Lc3LlDSnVlcZ0qwENMxRpcvtt+6lCVp
         out+fI754K640DU4xzlOjEJIcG22gPU5rol16cVa/ufjx04Hp/QBsD+2ykZXzPtL9E
         nyIroybbz0G9/Kwls5W+TjQuaeT0altKAjpUYqm+sMY6Qj1KvtmFn4+7ziO/f4+z6Q
         AGc/0y5xesQ8HYx3bp4322zOyfUXLuOr5lSTfdLq/J4ReLZCXBuZacWRXyzJhHRw8J
         SDljmKQiQH419qR1DBMoYh1eU8d+hmVP2AobjurBmbqbNpxgr8fBXl96rNMYb7OGUA
         qyS/oRfgrwLmQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 12/32] Input: tm2-touchkey - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:21 +0000
Message-Id: <20221204180841.2211588-13-jic23@kernel.org>
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
Cc: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/input/keyboard/tm2-touchkey.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/tm2-touchkey.c b/drivers/input/keyboard/tm2-touchkey.c
index 086aafaf0418..6627e65f06e5 100644
--- a/drivers/input/keyboard/tm2-touchkey.c
+++ b/drivers/input/keyboard/tm2-touchkey.c
@@ -297,7 +297,7 @@ static int tm2_touchkey_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused tm2_touchkey_suspend(struct device *dev)
+static int tm2_touchkey_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct tm2_touchkey_data *touchkey = i2c_get_clientdata(client);
@@ -308,7 +308,7 @@ static int __maybe_unused tm2_touchkey_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tm2_touchkey_resume(struct device *dev)
+static int tm2_touchkey_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct tm2_touchkey_data *touchkey = i2c_get_clientdata(client);
@@ -323,8 +323,8 @@ static int __maybe_unused tm2_touchkey_resume(struct device *dev)
 	return ret;
 }
 
-static SIMPLE_DEV_PM_OPS(tm2_touchkey_pm_ops,
-			 tm2_touchkey_suspend, tm2_touchkey_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(tm2_touchkey_pm_ops,
+				tm2_touchkey_suspend, tm2_touchkey_resume);
 
 static const struct i2c_device_id tm2_touchkey_id_table[] = {
 	{ TM2_TOUCHKEY_DEV_NAME, 0 },
@@ -353,7 +353,7 @@ MODULE_DEVICE_TABLE(of, tm2_touchkey_of_match);
 static struct i2c_driver tm2_touchkey_driver = {
 	.driver = {
 		.name = TM2_TOUCHKEY_DEV_NAME,
-		.pm = &tm2_touchkey_pm_ops,
+		.pm = pm_sleep_ptr(&tm2_touchkey_pm_ops),
 		.of_match_table = of_match_ptr(tm2_touchkey_of_match),
 	},
 	.probe_new = tm2_touchkey_probe,
-- 
2.38.1

