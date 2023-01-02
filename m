Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E015E65B655
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236562AbjABSHO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234664AbjABSGl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09ED4DB1
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B1633B80DDE
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D7CC433EF;
        Mon,  2 Jan 2023 18:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682798;
        bh=8ZdOGz/bDhGDj4PVUr5gjyywEohp0wPXoxVGIOiIUMo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WeDkJ6uQvyMx/vdqtEWvf7N00zNr2xJsNkVcFecS99yl15UKbZH+xNUdbCxyyb8l0
         cgVQ9qxO7qC8capr3NUmHqBEpDKbo8/naq/xlajoefeKZUj5OuOttoXfJBjwpKE6AA
         it4GYFYe+U9/OSiPNfGaapW1DgynGOpYoNE5wG50QL1PzNh/B86L0F7xhndhGDWWVZ
         PqSznY/6bRFkTjpo96CwKAHE2LvNQcDPc+V67ojZjDe5K44Wk/1/ImapT7x6pjQG89
         2w6wwKzbzok6mEZON7krFPmZh17rbAxLgkeHpgu++D8baGX/tjM/dWoiFPr/4AiRHK
         eIeywfpZffWmg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 34/69] Input: auo-pixcir-ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:07 +0000
Message-Id: <20230102181842.718010-35-jic23@kernel.org>
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
Cc: Heiko Stuebner <heiko@sntech.de>
---
 drivers/input/touchscreen/auo-pixcir-ts.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/auo-pixcir-ts.c b/drivers/input/touchscreen/auo-pixcir-ts.c
index a4a1d58aeeac..5359efc80b2b 100644
--- a/drivers/input/touchscreen/auo-pixcir-ts.c
+++ b/drivers/input/touchscreen/auo-pixcir-ts.c
@@ -410,7 +410,7 @@ static void auo_pixcir_input_close(struct input_dev *dev)
 	auo_pixcir_stop(ts);
 }
 
-static int __maybe_unused auo_pixcir_suspend(struct device *dev)
+static int auo_pixcir_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct auo_pixcir_ts *ts = i2c_get_clientdata(client);
@@ -442,7 +442,7 @@ static int __maybe_unused auo_pixcir_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused auo_pixcir_resume(struct device *dev)
+static int auo_pixcir_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct auo_pixcir_ts *ts = i2c_get_clientdata(client);
@@ -472,8 +472,8 @@ static int __maybe_unused auo_pixcir_resume(struct device *dev)
 	return ret;
 }
 
-static SIMPLE_DEV_PM_OPS(auo_pixcir_pm_ops,
-			 auo_pixcir_suspend, auo_pixcir_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(auo_pixcir_pm_ops,
+				auo_pixcir_suspend, auo_pixcir_resume);
 
 static void auo_pixcir_reset(void *data)
 {
@@ -633,7 +633,7 @@ MODULE_DEVICE_TABLE(of, auo_pixcir_ts_dt_idtable);
 static struct i2c_driver auo_pixcir_driver = {
 	.driver = {
 		.name	= "auo_pixcir_ts",
-		.pm	= &auo_pixcir_pm_ops,
+		.pm	= pm_sleep_ptr(&auo_pixcir_pm_ops),
 		.of_match_table	= of_match_ptr(auo_pixcir_ts_dt_idtable),
 	},
 	.probe_new	= auo_pixcir_probe,
-- 
2.39.0

