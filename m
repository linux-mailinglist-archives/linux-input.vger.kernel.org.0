Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0171B65B675
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236452AbjABSHf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236496AbjABSHZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:25 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A10F9DB1
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 496A9B80DF4
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D02AC433F0;
        Mon,  2 Jan 2023 18:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682841;
        bh=D+xzrm8+tGJWej4XFfR/tu4Ix5fet+t3h85ezQCOn3g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fOvqJyL9GCaiXFyW+lgySGPalm6qwowQgnB5HLxF5REoW1ktRYIV7bCb+m8niLcsY
         sg1PkXaRkSMB+PDQS4O4LQwKb483Tt8gCNMwmNobEaWSrKZZoH7AvxoqVx1l0MMa+C
         /j7ODlavDeVtOqBtcJM56nAP/hwhBSv+vEbCgS7AkY8zLzV7SVR5M4XT4uw8Kkfvf+
         IUJUUKXMfnWClGE6tUi/jV89mIPJFq/FjTQXs3EmlRGNCnK0GtEcHcbAGwhzwNNn8m
         C4KdnaS9xlayKnQqzfxDhTZmc0ZMIHdJAPVz0DVXYLrMnkvBGUikI38nlMPX5INLvK
         i7tA6EwI0Fidg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 67/69] Input: zforce_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:40 +0000
Message-Id: <20230102181842.718010-68-jic23@kernel.org>
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
 drivers/input/touchscreen/zforce_ts.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index 24e78ca83fa3..76b194285e1c 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -608,7 +608,7 @@ static void zforce_input_close(struct input_dev *dev)
 	return;
 }
 
-static int __maybe_unused zforce_suspend(struct device *dev)
+static int zforce_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct zforce_ts *ts = i2c_get_clientdata(client);
@@ -653,7 +653,7 @@ static int __maybe_unused zforce_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused zforce_resume(struct device *dev)
+static int zforce_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct zforce_ts *ts = i2c_get_clientdata(client);
@@ -691,7 +691,7 @@ static int __maybe_unused zforce_resume(struct device *dev)
 	return ret;
 }
 
-static SIMPLE_DEV_PM_OPS(zforce_pm_ops, zforce_suspend, zforce_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(zforce_pm_ops, zforce_suspend, zforce_resume);
 
 static void zforce_reset(void *data)
 {
@@ -941,7 +941,7 @@ MODULE_DEVICE_TABLE(of, zforce_dt_idtable);
 static struct i2c_driver zforce_driver = {
 	.driver = {
 		.name	= "zforce-ts",
-		.pm	= &zforce_pm_ops,
+		.pm	= pm_sleep_ptr(&zforce_pm_ops),
 		.of_match_table	= of_match_ptr(zforce_dt_idtable),
 	},
 	.probe_new	= zforce_probe,
-- 
2.39.0

