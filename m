Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3D0E641E56
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:56:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbiLDR4V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbiLDR4U (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:20 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 924E7140CD
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2DEBD60EDD
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D65C433D6;
        Sun,  4 Dec 2022 17:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176578;
        bh=PLyI93Tj2D3ZXvAGonBYuVmFq83B08FPwkoUUbRdQzg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eYUNF/7DTRLPlssZ+lt6V4jj1e9Lu57al1k7r/nY6o6uC4LxlNBk8s92JahuIYPjN
         +t30kE5z5FKk51mKgve00iHV6vPZ7uQSHeZducdM2XN6S61SBmN0ZRanjIeLgATfoB
         MEbNIJkh9JhgRqOmmq9lA4Z3CD6e4BR9ooZ1wp7+3RERMWuTHMJE+AsaRDeMa7adGp
         7XKBoV15pHEqS675QLdu0TtzZ52U3xGl0ynQFb5P9f/Foh+92H6ItdWOZdVSJkPkfl
         JEbVzFhpC+UMHcYwlq3vNp2dGlnhfWUvows6QktjSllaIWx+tvawR6Yq8jl4m1dIBT
         aSGcxraFl+szQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 10/32] Input: qt1050 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:19 +0000
Message-Id: <20221204180841.2211588-11-jic23@kernel.org>
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
Cc: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/input/keyboard/qt1050.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/qt1050.c b/drivers/input/keyboard/qt1050.c
index 403060d05c3b..317fe2b1f827 100644
--- a/drivers/input/keyboard/qt1050.c
+++ b/drivers/input/keyboard/qt1050.c
@@ -547,7 +547,7 @@ static int qt1050_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused qt1050_suspend(struct device *dev)
+static int qt1050_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct qt1050_priv *ts = i2c_get_clientdata(client);
@@ -563,7 +563,7 @@ static int __maybe_unused qt1050_suspend(struct device *dev)
 			    device_may_wakeup(dev) ? 125 : 0);
 }
 
-static int __maybe_unused qt1050_resume(struct device *dev)
+static int qt1050_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct qt1050_priv *ts = i2c_get_clientdata(client);
@@ -574,7 +574,7 @@ static int __maybe_unused qt1050_resume(struct device *dev)
 	return regmap_write(ts->regmap, QT1050_LPMODE, 2);
 }
 
-static SIMPLE_DEV_PM_OPS(qt1050_pm_ops, qt1050_suspend, qt1050_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(qt1050_pm_ops, qt1050_suspend, qt1050_resume);
 
 static const struct of_device_id __maybe_unused qt1050_of_match[] = {
 	{ .compatible = "microchip,qt1050", },
@@ -586,7 +586,7 @@ static struct i2c_driver qt1050_driver = {
 	.driver	= {
 		.name = "qt1050",
 		.of_match_table = of_match_ptr(qt1050_of_match),
-		.pm = &qt1050_pm_ops,
+		.pm = pm_sleep_ptr(&qt1050_pm_ops),
 	},
 	.probe_new = qt1050_probe,
 };
-- 
2.38.1

