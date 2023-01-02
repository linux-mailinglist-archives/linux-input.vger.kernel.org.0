Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE7165B65C
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236347AbjABSHT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236500AbjABSGx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF56C2F5
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A944FB80DEC
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B7A8C433EF;
        Mon,  2 Jan 2023 18:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682809;
        bh=d4MO4Fl+LVtQkwl5qpm268Fadx1u/sLrfvHPk8I0zRo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Zhjr7UcoYKkadJs5KnYx76vpYh5Z+alzIgjSvWt0tjcNgRcmKvhnkCCwrWHEOZ9cF
         n1/XBwE8OndB1MPhj8m4Zq7ZBW6lI9WVK531LzP0salBuQuT9sGrxq3lYjXSI4epEu
         b+0cX88Uh2I1tXCyYQDIyXF/zv95Y2A79PLHdxeguTrPrSjxmfyUBcMo47xSGhwHPB
         +6kF1xoyOrFoRff5lhpKJZEFREKmXiYYcN0MVArY12EGEbH71bTTNqPfBX1w6AeKUg
         A4ew0s35cgz1UxvsA9irNdfpAK0Dv3iOXoE0MGoriW4I8R/faC2tIu6cCLPLGisI38
         x3nsM/2Fx78yQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH 42/69] Input: eeti_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:15 +0000
Message-Id: <20230102181842.718010-43-jic23@kernel.org>
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
Cc: Daniel Mack <daniel@zonque.org>
---
 drivers/input/touchscreen/eeti_ts.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/eeti_ts.c b/drivers/input/touchscreen/eeti_ts.c
index c8ab03f49227..56fa21688bdb 100644
--- a/drivers/input/touchscreen/eeti_ts.c
+++ b/drivers/input/touchscreen/eeti_ts.c
@@ -232,7 +232,7 @@ static int eeti_ts_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused eeti_ts_suspend(struct device *dev)
+static int eeti_ts_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct eeti_ts *eeti = i2c_get_clientdata(client);
@@ -251,7 +251,7 @@ static int __maybe_unused eeti_ts_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused eeti_ts_resume(struct device *dev)
+static int eeti_ts_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct eeti_ts *eeti = i2c_get_clientdata(client);
@@ -270,7 +270,7 @@ static int __maybe_unused eeti_ts_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(eeti_ts_pm, eeti_ts_suspend, eeti_ts_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(eeti_ts_pm, eeti_ts_suspend, eeti_ts_resume);
 
 static const struct i2c_device_id eeti_ts_id[] = {
 	{ "eeti_ts", 0 },
@@ -288,7 +288,7 @@ static const struct of_device_id of_eeti_ts_match[] = {
 static struct i2c_driver eeti_ts_driver = {
 	.driver = {
 		.name = "eeti_ts",
-		.pm = &eeti_ts_pm,
+		.pm = pm_sleep_ptr(&eeti_ts_pm),
 		.of_match_table = of_match_ptr(of_eeti_ts_match),
 	},
 	.probe_new = eeti_ts_probe,
-- 
2.39.0

