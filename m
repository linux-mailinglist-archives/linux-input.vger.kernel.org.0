Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95FC865B676
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236475AbjABSHf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236495AbjABSH1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:27 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 939EA2F5
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 32CCE61038
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A952DC433EF;
        Mon,  2 Jan 2023 18:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682844;
        bh=fKlwZBB5vriG9IeekEsuZH7scn4rXfepY25G/m2u79g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Kc1gCAxmg8xRe1RwTqrLp7CjVLDreLAJs5Z2ILwlrxNiqKvzI5rJ5OA3VZQXwsq9+
         nz02aLEn3ejSY4XkmCcnw4jvjHj87vxmtzRKLh8sEyvAPiH3PoJiEOtL80w6sP2caL
         l7EvQX5xQubLZVv39BAZ21vOOgMhV4UsoICpOM6du2GoiIVNMiQoG78twFww2QhjZ7
         u3/TnWgSGFRUhOq+KqCe3vrzScn3ryjMjzwE9ghiy97cPxUINTj36P822n6rbqysuE
         fSovdJodRAeTxxbSZRtj/fl3cVaL2+XFBGyt13785TxHxxviC/h1Nb2JNYE3eVqXL/
         X4Wjdu2D2H5qw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 69/69] Input: ipaq-micro-ts - use DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:42 +0000
Message-Id: <20230102181842.718010-70-jic23@kernel.org>
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

This driver never used the older SIMPLE_DEV_PM_OPS() but instead just
set two of the callbacks directly.  Skip that deprecated macro and go
straight to the new form that avoids the need for guarding or marking
callbacks __maybe_unused.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
--
It is possible there is some subtle reason why only two of the
callbacks normally set by SIMPLE_DEV_PM_OPS() are set. As such,
this one needs some closer reading than many of the others.
---
 drivers/input/touchscreen/ipaq-micro-ts.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/ipaq-micro-ts.c b/drivers/input/touchscreen/ipaq-micro-ts.c
index 0eb5689fe65f..d8e25b502968 100644
--- a/drivers/input/touchscreen/ipaq-micro-ts.c
+++ b/drivers/input/touchscreen/ipaq-micro-ts.c
@@ -119,7 +119,7 @@ static int micro_ts_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused micro_ts_suspend(struct device *dev)
+static int micro_ts_suspend(struct device *dev)
 {
 	struct touchscreen_data *ts = dev_get_drvdata(dev);
 
@@ -128,7 +128,7 @@ static int __maybe_unused micro_ts_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused micro_ts_resume(struct device *dev)
+static int micro_ts_resume(struct device *dev)
 {
 	struct touchscreen_data *ts = dev_get_drvdata(dev);
 	struct input_dev *input = ts->input;
@@ -143,14 +143,13 @@ static int __maybe_unused micro_ts_resume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops micro_ts_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(micro_ts_suspend, micro_ts_resume)
-};
+static DEFINE_SIMPLE_DEV_PM(micro_ts_dev_pm_ops,
+			    micro_ts_suspend, micro_ts_resume);
 
 static struct platform_driver micro_ts_device_driver = {
 	.driver	= {
 		.name	= "ipaq-micro-ts",
-		.pm	= &micro_ts_dev_pm_ops,
+		.pm	= pm_sleep_ptr(&micro_ts_dev_pm_ops),
 	},
 	.probe	= micro_ts_probe,
 };
-- 
2.39.0

