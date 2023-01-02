Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF43A65B66A
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236362AbjABSH2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236557AbjABSHM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:12 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85EC92E2
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 30E79B80DF0
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1B7C433EF;
        Mon,  2 Jan 2023 18:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682827;
        bh=/FR+gxDCwvqrk6XzyZSWBM2i8Gaz+adNRvhAyRiFtTU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WuYUrUIlsPHi0GB5L2YRQPoYtIu2V8tdE61tWioZp+bandgaDM8j9UTJKL+BFSLk/
         nQX3T0bPauzUTPdX57bcFjsmumtj1PfhzTN86OVl83T+4uBxAbV73NxBI4C9JIq9w6
         PRcMlsaBdFW3KkPMyvOZDGP6Gjchnj8PQWJzUxk1Z/+ER1EfKQamF6n0OihdSfUEfH
         KUV0A8kYQ/JSENNRtqUchitjbsMv6JrfcesuwhXdF6FDCS5Q2cegDw8Q2I/FPjP7at
         jxdWx6rhKiC4NnzPyi7xsJjB6i+SsLMh17yGiXPPCBGt8YlYLe2NAZR/hE7ZUxsbBD
         RjwGXFDQcNTQQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>
Subject: [PATCH 56/69] Input: msg2638 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:29 +0000
Message-Id: <20230102181842.718010-57-jic23@kernel.org>
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
Cc: Vincent Knecht <vincent.knecht@mailoo.org>
---
 drivers/input/touchscreen/msg2638.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/msg2638.c b/drivers/input/touchscreen/msg2638.c
index 4c0816b09d33..b23db689d995 100644
--- a/drivers/input/touchscreen/msg2638.c
+++ b/drivers/input/touchscreen/msg2638.c
@@ -441,7 +441,7 @@ static int msg2638_ts_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused msg2638_suspend(struct device *dev)
+static int msg2638_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct msg2638_ts_data *msg2638 = i2c_get_clientdata(client);
@@ -456,7 +456,7 @@ static int __maybe_unused msg2638_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused msg2638_resume(struct device *dev)
+static int msg2638_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct msg2638_ts_data *msg2638 = i2c_get_clientdata(client);
@@ -472,7 +472,7 @@ static int __maybe_unused msg2638_resume(struct device *dev)
 	return ret;
 }
 
-static SIMPLE_DEV_PM_OPS(msg2638_pm_ops, msg2638_suspend, msg2638_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(msg2638_pm_ops, msg2638_suspend, msg2638_resume);
 
 static const struct msg_chip_data msg2138_data = {
 	.irq_handler = msg2138_ts_irq_handler,
@@ -495,7 +495,7 @@ static struct i2c_driver msg2638_ts_driver = {
 	.probe_new = msg2638_ts_probe,
 	.driver = {
 		.name = "MStar-TS",
-		.pm = &msg2638_pm_ops,
+		.pm = pm_sleep_ptr(&msg2638_pm_ops),
 		.of_match_table = msg2638_of_match,
 	},
 };
-- 
2.39.0

