Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C13A565B65E
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236439AbjABSHU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236440AbjABSG4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:56 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD992F5
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 197DC61038
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B7F6C433F0;
        Mon,  2 Jan 2023 18:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682813;
        bh=Q6SeAcYj+zkhpFnXxlYMG9Y1KqQ5hi0Qo7CJ5UiuGh0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JyBIdzpPlHSmARpjXxB+09UgvjxwZ+akgXJNzCAxKXerVHGeHX30fnh3pI+LtfgGH
         ZI5VVOw/BSrNwAqiXlYReDC1zVnJsEij7uQRE7KrvYYFghXYBpvFya/8PgmH6yrHzv
         DMFfLFY5GbyxItOVvaDUkKCdntoK5MPScG8zSQbpQ/BLCXtFNLG4PpvnB0tRuJSId4
         gLp5oBsDtHxIbGiSwJ92Kfp8Sb45QEg0OJtB7B8t2at0WueyE7OhoNPikWZSrsYtLe
         BQDONdbNkOo/WkLst9c9NrVZ0Wrm73d1bW970J5KZTYP5Mo9Po3eQTuHkvFTFoQKHk
         AVW78LFMnjH/Q==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 45/69] Input: elants_i2c - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:18 +0000
Message-Id: <20230102181842.718010-46-jic23@kernel.org>
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
Cc: Douglas Anderson <dianders@chromium.org>
---
 drivers/input/touchscreen/elants_i2c.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 5452b50f8a77..8a16eb51481f 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1572,7 +1572,7 @@ static int elants_i2c_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused elants_i2c_suspend(struct device *dev)
+static int elants_i2c_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct elants_data *ts = i2c_get_clientdata(client);
@@ -1611,7 +1611,7 @@ static int __maybe_unused elants_i2c_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused elants_i2c_resume(struct device *dev)
+static int elants_i2c_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct elants_data *ts = i2c_get_clientdata(client);
@@ -1644,8 +1644,8 @@ static int __maybe_unused elants_i2c_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(elants_i2c_pm_ops,
-			 elants_i2c_suspend, elants_i2c_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(elants_i2c_pm_ops,
+				elants_i2c_suspend, elants_i2c_resume);
 
 static const struct i2c_device_id elants_i2c_id[] = {
 	{ DEVICE_NAME, EKTH3500 },
@@ -1677,7 +1677,7 @@ static struct i2c_driver elants_i2c_driver = {
 	.id_table = elants_i2c_id,
 	.driver = {
 		.name = DEVICE_NAME,
-		.pm = &elants_i2c_pm_ops,
+		.pm = pm_sleep_ptr(&elants_i2c_pm_ops),
 		.acpi_match_table = ACPI_PTR(elants_acpi_id),
 		.of_match_table = of_match_ptr(elants_of_match),
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-- 
2.39.0

