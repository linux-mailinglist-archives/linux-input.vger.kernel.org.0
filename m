Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9606F65B654
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbjABSHP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236182AbjABSGm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:42 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45B2B5F96
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D5A9D61084
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3609AC433F0;
        Mon,  2 Jan 2023 18:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682801;
        bh=Hm+NMfy8u4Ey3XwANoh8EzMdtU1FKdyDxaIe/img+7Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qlc3ZPIwuehOhcOT0Wdgsfc5uX2E1ZlxDUiWDE4fF1ui8sn1JUWIjSe09lWeOq9gX
         rDz/wc3wxJih/dBvj97W4z+HiCxhE+Asn7eSoRSMdIyTxCiao/6ZHbeIQ2KTjPqL6L
         t+94w0/Mp+6theDOz8pjkpa8fH1nvFEpJFUf5mNwQOWGdG71074PKqcWx32ejM4r3a
         zY3le2rX+E+VDPQbRGT86V5akxoqmj69q/mE68ZsE9ZHUe2ZBbzATmC6kCL83toINT
         F+MghwZ05ZWs31SR/fgO2lb8ZI/Y6WDvgV65r2fL6UW1Q5PfJ/N0vOOyLT7FPgFR8C
         gelaE8oytW6UQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Zhu Yi <yi.zhu5@cn.bosch.com>,
        Mark Jonas <mark.jonas@de.bosch.com>
Subject: [PATCH 36/69] Input: bu21029 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:09 +0000
Message-Id: <20230102181842.718010-37-jic23@kernel.org>
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
Cc: Zhu Yi <yi.zhu5@cn.bosch.com>
Cc: Mark Jonas <mark.jonas@de.bosch.com>
---
 drivers/input/touchscreen/bu21029_ts.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/bu21029_ts.c b/drivers/input/touchscreen/bu21029_ts.c
index 215f4dc5105d..8f1442894ff9 100644
--- a/drivers/input/touchscreen/bu21029_ts.c
+++ b/drivers/input/touchscreen/bu21029_ts.c
@@ -422,7 +422,7 @@ static int bu21029_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused bu21029_suspend(struct device *dev)
+static int bu21029_suspend(struct device *dev)
 {
 	struct i2c_client *i2c = to_i2c_client(dev);
 	struct bu21029_ts_data *bu21029 = i2c_get_clientdata(i2c);
@@ -437,7 +437,7 @@ static int __maybe_unused bu21029_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused bu21029_resume(struct device *dev)
+static int bu21029_resume(struct device *dev)
 {
 	struct i2c_client *i2c = to_i2c_client(dev);
 	struct bu21029_ts_data *bu21029 = i2c_get_clientdata(i2c);
@@ -451,7 +451,7 @@ static int __maybe_unused bu21029_resume(struct device *dev)
 
 	return 0;
 }
-static SIMPLE_DEV_PM_OPS(bu21029_pm_ops, bu21029_suspend, bu21029_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(bu21029_pm_ops, bu21029_suspend, bu21029_resume);
 
 static const struct i2c_device_id bu21029_ids[] = {
 	{ DRIVER_NAME, 0 },
@@ -471,7 +471,7 @@ static struct i2c_driver bu21029_driver = {
 	.driver	= {
 		.name		= DRIVER_NAME,
 		.of_match_table	= of_match_ptr(bu21029_of_ids),
-		.pm		= &bu21029_pm_ops,
+		.pm		= pm_sleep_ptr(&bu21029_pm_ops),
 	},
 	.id_table	= bu21029_ids,
 	.probe_new	= bu21029_probe,
-- 
2.39.0

