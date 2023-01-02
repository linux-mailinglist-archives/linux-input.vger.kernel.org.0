Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A61665B657
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234664AbjABSHQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236329AbjABSGo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 735B460C5
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2CB72B80DE8
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E04C433D2;
        Mon,  2 Jan 2023 18:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682799;
        bh=6sMKeo3C8fj8EQqv6VxbCdOrcGolTm+q78xJDXML3Zo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sH0o4v/Uj0ja3NqCyrGOYBaVXuWHOg37WpURjZvaAQJsB3Ukz2FlQZL66YLcQ3LU4
         P5npwcrKfb5jncWgW3eg9MEXJqABa6R5Dh44if/ELwgiJc6UD7t0MYNdNS58MVok9t
         tkJna8YRLp54Bc8oHqeT0x51hiPbkmt0z1rOHY3jDTIEqBMjUXYQi4VUKKXRVkyfd+
         xInH0weeMo6AC1P5ZQxta2n4ZW5OYE2F+GSCZFDQdHu9X1TUv4eAQbakEtHewD0fbn
         IdExqRO2eNZk4jVpImme0dDKR+ymIpykWk+pfV5QHKt7CiwtbR4KpznUIi167a5eYy
         XVnNT+wTqlaoQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 35/69] Input: bu21013_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:08 +0000
Message-Id: <20230102181842.718010-36-jic23@kernel.org>
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
 drivers/input/touchscreen/bu21013_ts.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
index 5a4dbd39a372..c994ab6f4e58 100644
--- a/drivers/input/touchscreen/bu21013_ts.c
+++ b/drivers/input/touchscreen/bu21013_ts.c
@@ -560,7 +560,7 @@ static void bu21013_remove(struct i2c_client *client)
 	/* The resources will be freed by devm */
 }
 
-static int __maybe_unused bu21013_suspend(struct device *dev)
+static int bu21013_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct bu21013_ts *ts = i2c_get_clientdata(client);
@@ -575,7 +575,7 @@ static int __maybe_unused bu21013_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused bu21013_resume(struct device *dev)
+static int bu21013_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct bu21013_ts *ts = i2c_get_clientdata(client);
@@ -604,7 +604,7 @@ static int __maybe_unused bu21013_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(bu21013_dev_pm_ops, bu21013_suspend, bu21013_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(bu21013_dev_pm_ops, bu21013_suspend, bu21013_resume);
 
 static const struct i2c_device_id bu21013_id[] = {
 	{ DRIVER_TP, 0 },
@@ -615,7 +615,7 @@ MODULE_DEVICE_TABLE(i2c, bu21013_id);
 static struct i2c_driver bu21013_driver = {
 	.driver	= {
 		.name	=	DRIVER_TP,
-		.pm	=	&bu21013_dev_pm_ops,
+		.pm	=	pm_sleep_ptr(&bu21013_dev_pm_ops),
 	},
 	.probe_new	=	bu21013_probe,
 	.remove		=	bu21013_remove,
-- 
2.39.0

