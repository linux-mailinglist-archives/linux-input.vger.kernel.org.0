Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F67865B65A
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236341AbjABSHR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236451AbjABSGu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:50 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 249B92E2
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B59F561090
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E77C433F0;
        Mon,  2 Jan 2023 18:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682808;
        bh=d0bE5TyAe4V50qpq3vKJGk5/0QIrUcAqB5bT5nqLoKM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P4+jRWkmAA1t8HARlu95ZNiojN1/47rsAyy16VbHP26CGjKmbDNgReQs4panN3USU
         NfJdg5QMvNotQPzBpcZ1fzWpxpLCW6IaNHq2eYRNyaWZO6CD5wCM/HK0mISNABdNSA
         Ft1ILY7yUA1cQZymmaTwEg2v9Jv9JRHnwbhV7AomqSXVlL6huxdhwC2w5N5WainzJo
         qRuCtiU4EHhgvXR652ZT1FQJh2sB+J9ZE2qR13oU97TUf1qbhsG5zL4Rl6O1+2bNlX
         YfWatccWAqTF1HYNtkz1a9/GiyS/FN1bjwyBbhTt2IWiulV5gDbVd6VAkLdR453zuo
         HAC8okPc4kilQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH 41/69] Input: edt-ft5x06 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:14 +0000
Message-Id: <20230102181842.718010-42-jic23@kernel.org>
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index ddd0f1f62458..d09bfeaa7da6 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1353,7 +1353,7 @@ static void edt_ft5x06_ts_remove(struct i2c_client *client)
 	edt_ft5x06_ts_teardown_debugfs(tsdata);
 }
 
-static int __maybe_unused edt_ft5x06_ts_suspend(struct device *dev)
+static int edt_ft5x06_ts_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
@@ -1396,7 +1396,7 @@ static int __maybe_unused edt_ft5x06_ts_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused edt_ft5x06_ts_resume(struct device *dev)
+static int edt_ft5x06_ts_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
@@ -1459,8 +1459,8 @@ static int __maybe_unused edt_ft5x06_ts_resume(struct device *dev)
 	return ret;
 }
 
-static SIMPLE_DEV_PM_OPS(edt_ft5x06_ts_pm_ops,
-			 edt_ft5x06_ts_suspend, edt_ft5x06_ts_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(edt_ft5x06_ts_pm_ops,
+				edt_ft5x06_ts_suspend, edt_ft5x06_ts_resume);
 
 static const struct edt_i2c_chip_data edt_ft5x06_data = {
 	.max_support_points = 5,
@@ -1500,7 +1500,7 @@ static struct i2c_driver edt_ft5x06_ts_driver = {
 	.driver = {
 		.name = "edt_ft5x06",
 		.of_match_table = edt_ft5x06_of_match,
-		.pm = &edt_ft5x06_ts_pm_ops,
+		.pm = pm_sleep_ptr(&edt_ft5x06_ts_pm_ops),
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.id_table = edt_ft5x06_ts_id,
-- 
2.39.0

