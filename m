Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11D9065B677
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236495AbjABSHg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236500AbjABSH1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:27 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E534D116B
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 936E2B80DF0
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C94C433D2;
        Mon,  2 Jan 2023 18:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682843;
        bh=gkIYc4/MRL5X3akPURcJs/EjJw83xE9ZMq4yKDMqTPg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Isl1q/7xp6XftcdnUCDMeA9QhMHg6VrNClJWtWGYtWeZY77gRCPj397HiqKFIV4iJ
         LMyfQH3dJzQTNvb6e0klQJ8Cz4g9wHK5mUSDyo8L03ZGJlK/DaNzS1zNurF1CMgB0L
         gga6Vw5WRqRkp/wT7XJcDLL9ArWeXqo7LbyX3B2V9FUrtxs4c7vua4IdMNSz+W59Qd
         GxgVWwrAgskesuQZcoEaFfXF2ufCRDO6iiKOTyD8NHIPLGZg//x9sBhB8/KCGxG+3b
         4p01WCgUXExF8I3pT5xuNVGYkWxtqfhEnbFxkhfbJgNohoXL4qNjak02TYvN0uq/2C
         pFV5OVSbx4taQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 68/69] Input: zinitix - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:41 +0000
Message-Id: <20230102181842.718010-69-jic23@kernel.org>
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
 drivers/input/touchscreen/zinitix.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 52f9e9eaab14..cdf9bcd744db 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -562,7 +562,7 @@ static int zinitix_ts_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused zinitix_suspend(struct device *dev)
+static int zinitix_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct bt541_ts_data *bt541 = i2c_get_clientdata(client);
@@ -577,7 +577,7 @@ static int __maybe_unused zinitix_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused zinitix_resume(struct device *dev)
+static int zinitix_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct bt541_ts_data *bt541 = i2c_get_clientdata(client);
@@ -593,7 +593,7 @@ static int __maybe_unused zinitix_resume(struct device *dev)
 	return ret;
 }
 
-static SIMPLE_DEV_PM_OPS(zinitix_pm_ops, zinitix_suspend, zinitix_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(zinitix_pm_ops, zinitix_suspend, zinitix_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id zinitix_of_match[] = {
@@ -620,7 +620,7 @@ static struct i2c_driver zinitix_ts_driver = {
 	.probe_new = zinitix_ts_probe,
 	.driver = {
 		.name = "Zinitix-TS",
-		.pm = &zinitix_pm_ops,
+		.pm = pm_sleep_ptr(&zinitix_pm_ops),
 		.of_match_table = of_match_ptr(zinitix_of_match),
 	},
 };
-- 
2.39.0

