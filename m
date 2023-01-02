Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B580865B664
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236360AbjABSHZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236530AbjABSHB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2685BDAD
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9379461090
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1607EC433F0;
        Mon,  2 Jan 2023 18:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682819;
        bh=OpLp46EogIxb5OGUTW6thnW7f1HE9c0MSmMVIedzrgI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lI8cC7beBsvHLyG6bP8WkAL5T3878//WobUVFFLzlAzdWE4WXXnglk+MaFel039Nl
         444MsIo+tWFLtYqnEMHa+ok5z5pX+xUr63OD5gqEXoKxCS1Sm4QaSTUoLEH+0ORQfP
         M4gv68wP36ofUAInkyz/8CpAYpbwtRh6spbKhvmASynrEeziTULclU/GteP/vIyU7y
         u5/+Dg4clmA7o+VLIclj6j5wuOdvIRf2+nbeZaxJgMwUcm2/eiiHkdn7039B+NRRdt
         j9FOrcX0wAjsAQ4m1/raLdxFIXV7397Y+J5mVkhz8L4sY5DEdD5Wm/aOcPk1+gtyIN
         54K1Kgu/GsbOg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Markuss Broks <markuss.broks@gmail.com>
Subject: [PATCH 49/69] Input: imagis - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:22 +0000
Message-Id: <20230102181842.718010-50-jic23@kernel.org>
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
Cc: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/input/touchscreen/imagis.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/imagis.c b/drivers/input/touchscreen/imagis.c
index e2697e6c6d2a..de1b16e94bb8 100644
--- a/drivers/input/touchscreen/imagis.c
+++ b/drivers/input/touchscreen/imagis.c
@@ -309,7 +309,7 @@ static int imagis_probe(struct i2c_client *i2c)
 	return 0;
 }
 
-static int __maybe_unused imagis_suspend(struct device *dev)
+static int imagis_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct imagis_ts *ts = i2c_get_clientdata(client);
@@ -325,7 +325,7 @@ static int __maybe_unused imagis_suspend(struct device *dev)
 	return retval;
 }
 
-static int __maybe_unused imagis_resume(struct device *dev)
+static int imagis_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct imagis_ts *ts = i2c_get_clientdata(client);
@@ -341,7 +341,7 @@ static int __maybe_unused imagis_resume(struct device *dev)
 	return retval;
 }
 
-static SIMPLE_DEV_PM_OPS(imagis_pm_ops, imagis_suspend, imagis_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(imagis_pm_ops, imagis_suspend, imagis_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id imagis_of_match[] = {
@@ -354,7 +354,7 @@ MODULE_DEVICE_TABLE(of, imagis_of_match);
 static struct i2c_driver imagis_ts_driver = {
 	.driver = {
 		.name = "imagis-touchscreen",
-		.pm = &imagis_pm_ops,
+		.pm = pm_sleep_ptr(&imagis_pm_ops),
 		.of_match_table = of_match_ptr(imagis_of_match),
 	},
 	.probe_new = imagis_probe,
-- 
2.39.0

