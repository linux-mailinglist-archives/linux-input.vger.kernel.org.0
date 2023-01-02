Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 752E065B65D
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236361AbjABSHT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236502AbjABSGx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DCD52E2
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3CE6261084
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC3CBC433F0;
        Mon,  2 Jan 2023 18:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682810;
        bh=Bfpirfi1/wnNoY0OXjR20imqa1gbuOi0JsIrNeOfC+M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=A7biqdAU1EOqdwZZXE1T5TWfesrJQtKvlY6WtRKAikHcsYP8W2BVowDKvLB7FQncP
         FOgkCPZ9ss7cPjfplQr5Fbc19zYDk6QJpQ9EsWQaTFOadKMDG4txR0PmNY9dWUDXj4
         LASKsF7vZ1yKs8+z3FlYjL7HMdVuv1B9bHpK9HKRPpcvMmEyIWeGFXt+TuN3Ayrn0b
         I+gV7twoXplxZR7eTfDWDOkUto3z00fuY/6p++D80yrr+bs5R1jnGT5cmZRpr/YBup
         YlOX/BIR1NdxDDAMjjhnfzyYiziDhgY8wXiPZBJG1My+i6QFiuQLBN2dylkmLu/xCa
         qclkBpfBLCyDw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 43/69] Input: egalax_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:16 +0000
Message-Id: <20230102181842.718010-44-jic23@kernel.org>
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
 drivers/input/touchscreen/egalax_ts.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/egalax_ts.c b/drivers/input/touchscreen/egalax_ts.c
index 742d47a75ac1..1a9805938e6d 100644
--- a/drivers/input/touchscreen/egalax_ts.c
+++ b/drivers/input/touchscreen/egalax_ts.c
@@ -223,7 +223,7 @@ static const struct i2c_device_id egalax_ts_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, egalax_ts_id);
 
-static int __maybe_unused egalax_ts_suspend(struct device *dev)
+static int egalax_ts_suspend(struct device *dev)
 {
 	static const u8 suspend_cmd[MAX_I2C_DATA_LEN] = {
 		0x3, 0x6, 0xa, 0x3, 0x36, 0x3f, 0x2, 0, 0, 0
@@ -238,7 +238,7 @@ static int __maybe_unused egalax_ts_suspend(struct device *dev)
 	return ret > 0 ? 0 : ret;
 }
 
-static int __maybe_unused egalax_ts_resume(struct device *dev)
+static int egalax_ts_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 
@@ -248,7 +248,8 @@ static int __maybe_unused egalax_ts_resume(struct device *dev)
 	return egalax_wake_up_device(client);
 }
 
-static SIMPLE_DEV_PM_OPS(egalax_ts_pm_ops, egalax_ts_suspend, egalax_ts_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(egalax_ts_pm_ops,
+				egalax_ts_suspend, egalax_ts_resume);
 
 static const struct of_device_id egalax_ts_dt_ids[] = {
 	{ .compatible = "eeti,egalax_ts" },
@@ -259,7 +260,7 @@ MODULE_DEVICE_TABLE(of, egalax_ts_dt_ids);
 static struct i2c_driver egalax_ts_driver = {
 	.driver = {
 		.name	= "egalax_ts",
-		.pm	= &egalax_ts_pm_ops,
+		.pm	= pm_sleep_ptr(&egalax_ts_pm_ops),
 		.of_match_table	= egalax_ts_dt_ids,
 	},
 	.id_table	= egalax_ts_id,
-- 
2.39.0

