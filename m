Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9FA65B66E
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232151AbjABSHa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236298AbjABSHQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E495F96
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6985BB80DF0
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2341FC433D2;
        Mon,  2 Jan 2023 18:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682833;
        bh=pOtQFRFZ1Jm3XVuE8vq2Jxymty7rjqd8mlv/ZM2z+XM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I1e/G7wW1SrKMVNEdCMIMvF3viToD3anMAafpbyB3prQeHD0FF7dFGMvDlhMSPu5K
         n3WOD6fAMHLCaTVPPXLkHAdJROFXjduELd56PK5aKgo/st4BdECyf3P80lZCf5hdJH
         SfHyIF7rHnRqB2dWulF3cd5YLSOP0niKUKE1H5q9xlrb+Gzaj0iBFhqq6I/cuBiBWn
         eS6yLzX3pTvXgxQcUpKF3g4QemDDkb0I2YoQBtOCQoedmc6+7VakT6yX/ugh/tvlBc
         tsied90hwwc0VnbXz1TCYA5lrPzIlwMB/k7WCkg3Jqie0egYNYCXw/U1o8A2wQeUwa
         LhsJtYgy4Za7g==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        John Keeping <john@metanate.com>
Subject: [PATCH 60/69] Input: st1232 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:33 +0000
Message-Id: <20230102181842.718010-61-jic23@kernel.org>
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
Cc: John Keeping <john@metanate.com>
---
 drivers/input/touchscreen/st1232.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index bd68633dc6c0..f49566dc96f8 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -340,7 +340,7 @@ static int st1232_ts_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused st1232_ts_suspend(struct device *dev)
+static int st1232_ts_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct st1232_ts_data *ts = i2c_get_clientdata(client);
@@ -353,7 +353,7 @@ static int __maybe_unused st1232_ts_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused st1232_ts_resume(struct device *dev)
+static int st1232_ts_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct st1232_ts_data *ts = i2c_get_clientdata(client);
@@ -366,8 +366,8 @@ static int __maybe_unused st1232_ts_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(st1232_ts_pm_ops,
-			 st1232_ts_suspend, st1232_ts_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(st1232_ts_pm_ops,
+				st1232_ts_suspend, st1232_ts_resume);
 
 static const struct i2c_device_id st1232_ts_id[] = {
 	{ ST1232_TS_NAME, (unsigned long)&st1232_chip_info },
@@ -390,7 +390,7 @@ static struct i2c_driver st1232_ts_driver = {
 		.name	= ST1232_TS_NAME,
 		.of_match_table = st1232_ts_dt_ids,
 		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
-		.pm	= &st1232_ts_pm_ops,
+		.pm	= pm_sleep_ptr(&st1232_ts_pm_ops),
 	},
 };
 
-- 
2.39.0

