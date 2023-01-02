Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3925A65B66B
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236512AbjABSH2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236558AbjABSHM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64451DAD
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F3FE86109A
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4CDC433EF;
        Mon,  2 Jan 2023 18:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682830;
        bh=p97cadpCAwbN4+eSOmhzOpTVUPpTRTV1Oh+yoMkBD3Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LFV+VTlm1NHljeWq82APSkuBNtwaT0ymPWs5SiMnHevCbVpZWj0QSCrfYX3CxdEzU
         2etzM7dA1m88JB4U5p7z8c1M8fuez6iIxs+G1hSHKSnTbINPq8bipa4xmlbB00NaQE
         gnDda9Y/q0Im++oTwRoaqp594AEbKWYAGC2AkDYU/VH4JefL3EVgQdnm5elOT37K6r
         ly3LJILyB/lHHMToeUzZCeCxVwfZkzQapSbTEuO7+MI3V+t7zeBcfjHPO6N01/OjI+
         kB79DjpGZAnqPlviUIF2f2h5gjz88U19sqLG3Vmfpa1XXmz0c5BTGVq2m7C5twZsAk
         jHBf+F9ttgGUw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 58/69] Input: raydium_i2c_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:31 +0000
Message-Id: <20230102181842.718010-59-jic23@kernel.org>
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
 drivers/input/touchscreen/raydium_i2c_ts.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
index d690a17240c2..49a06d3876cf 100644
--- a/drivers/input/touchscreen/raydium_i2c_ts.c
+++ b/drivers/input/touchscreen/raydium_i2c_ts.c
@@ -1197,7 +1197,7 @@ static int raydium_i2c_probe(struct i2c_client *client)
 	return 0;
 }
 
-static void __maybe_unused raydium_enter_sleep(struct i2c_client *client)
+static void raydium_enter_sleep(struct i2c_client *client)
 {
 	static const u8 sleep_cmd[] = { 0x5A, 0xff, 0x00, 0x0f };
 	int error;
@@ -1209,7 +1209,7 @@ static void __maybe_unused raydium_enter_sleep(struct i2c_client *client)
 			"sleep command failed: %d\n", error);
 }
 
-static int __maybe_unused raydium_i2c_suspend(struct device *dev)
+static int raydium_i2c_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct raydium_data *ts = i2c_get_clientdata(client);
@@ -1229,7 +1229,7 @@ static int __maybe_unused raydium_i2c_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused raydium_i2c_resume(struct device *dev)
+static int raydium_i2c_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct raydium_data *ts = i2c_get_clientdata(client);
@@ -1246,8 +1246,8 @@ static int __maybe_unused raydium_i2c_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(raydium_i2c_pm_ops,
-			 raydium_i2c_suspend, raydium_i2c_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(raydium_i2c_pm_ops,
+				raydium_i2c_suspend, raydium_i2c_resume);
 
 static const struct i2c_device_id raydium_i2c_id[] = {
 	{ "raydium_i2c", 0 },
@@ -1277,7 +1277,7 @@ static struct i2c_driver raydium_i2c_driver = {
 	.id_table = raydium_i2c_id,
 	.driver = {
 		.name = "raydium_ts",
-		.pm = &raydium_i2c_pm_ops,
+		.pm = pm_sleep_ptr(&raydium_i2c_pm_ops),
 		.acpi_match_table = ACPI_PTR(raydium_acpi_id),
 		.of_match_table = of_match_ptr(raydium_of_match),
 	},
-- 
2.39.0

