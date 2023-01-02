Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 833F865B66C
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236517AbjABSH2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236559AbjABSHM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:12 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAEB5116B
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 70B96B80DF1
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C043C433F0;
        Mon,  2 Jan 2023 18:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682829;
        bh=azSq6YF+4EV+1uK5JouKOAdUVIRIYfWtQYtVkDFsx1w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q7obHyV0gW/W3ksX777MK+MaP0gLXv6pGm/6p0Tbau7FZ15dEZaQfUIgtwk31X1Hh
         rnmBpwUuezSGNXQTDZ12/9NiUHVWsACdB6z00iPiyDAibz4BE1h5MnM6NEaBsFyDFx
         Uc/tPRCJIgMR0XmXwg3NbHiihSInZWQDjeHfNw5r2RYzBnIViQ1ngXWi89ggIVXTEg
         92Y8PVgl/9By8PtTLfqb+Fpto97jCn7yKmKzjGvPoPKOvUi7Mxe9SwFcy1MXTeOApb
         qi21vcxSCVM3H3Bytt9QCr140NnqJFlBDjA5HWNAvh5AcD/1DcGQGdnMjc2K9Fe98L
         +mKkjiT+M69EQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 57/69] Input: pixcir_i2c_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:30 +0000
Message-Id: <20230102181842.718010-58-jic23@kernel.org>
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
Cc: Fabio Estevam <festevam@gmail.com>
---
 drivers/input/touchscreen/pixcir_i2c_ts.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/pixcir_i2c_ts.c b/drivers/input/touchscreen/pixcir_i2c_ts.c
index 7959947a3458..f09f4831bad4 100644
--- a/drivers/input/touchscreen/pixcir_i2c_ts.c
+++ b/drivers/input/touchscreen/pixcir_i2c_ts.c
@@ -405,7 +405,7 @@ static void pixcir_input_close(struct input_dev *dev)
 	pixcir_stop(ts);
 }
 
-static int __maybe_unused pixcir_i2c_ts_suspend(struct device *dev)
+static int pixcir_i2c_ts_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct pixcir_i2c_ts_data *ts = i2c_get_clientdata(client);
@@ -432,7 +432,7 @@ static int __maybe_unused pixcir_i2c_ts_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused pixcir_i2c_ts_resume(struct device *dev)
+static int pixcir_i2c_ts_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct pixcir_i2c_ts_data *ts = i2c_get_clientdata(client);
@@ -459,8 +459,8 @@ static int __maybe_unused pixcir_i2c_ts_resume(struct device *dev)
 	return ret;
 }
 
-static SIMPLE_DEV_PM_OPS(pixcir_dev_pm_ops,
-			 pixcir_i2c_ts_suspend, pixcir_i2c_ts_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pixcir_dev_pm_ops,
+				pixcir_i2c_ts_suspend, pixcir_i2c_ts_resume);
 
 static int pixcir_i2c_ts_probe(struct i2c_client *client)
 {
@@ -614,7 +614,7 @@ MODULE_DEVICE_TABLE(of, pixcir_of_match);
 static struct i2c_driver pixcir_i2c_ts_driver = {
 	.driver = {
 		.name	= "pixcir_ts",
-		.pm	= &pixcir_dev_pm_ops,
+		.pm	= pm_sleep_ptr(&pixcir_dev_pm_ops),
 		.of_match_table = of_match_ptr(pixcir_of_match),
 	},
 	.probe_new	= pixcir_i2c_ts_probe,
-- 
2.39.0

