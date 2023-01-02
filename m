Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A063365B651
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236491AbjABSHB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236493AbjABSGh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:37 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6FDFB1CC
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 81536B80DE3
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E870C433F0;
        Mon,  2 Jan 2023 18:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682794;
        bh=CCF9VP7+QSlMlgDTmWkVt9+SZ6veW1iH+HMzoVJj5fk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rDGQZaDyRFh7Hrk3eYqap9qikJZxq2YlpFBZKpLRabTUZftGAJPti1n+A+ghyOVrP
         TVzPDS9pA6M2gorONdpds0ybjimtaWAvEZz7EN1PnbIaQk8OfjKCH+5YoqCL07GicK
         UTc8jczSq3nAcHHo5MT9gQalILeW6GIMb4SuYZpDjArK+26TF0RRFuDM7eaKs7i+1B
         nMcMsNb+mj4QYTFlzzSJraIqVdLyoQwMYdKsRc2t88NoD2UrPlQ/TqqVtnf28mpGvO
         R6+ZuhHZeaNgFaGc47zre29K2yVA92xJmt4ET0FCnlss8F1MghJiHjc3W7pF2cczkr
         DxoFo8RtZg1dQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 31/69] Input: ads7846 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:04 +0000
Message-Id: <20230102181842.718010-32-jic23@kernel.org>
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
 drivers/input/touchscreen/ads7846.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index bed68a68f330..4c3dd01902d0 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -944,7 +944,7 @@ static irqreturn_t ads7846_irq(int irq, void *handle)
 	return IRQ_HANDLED;
 }
 
-static int __maybe_unused ads7846_suspend(struct device *dev)
+static int ads7846_suspend(struct device *dev)
 {
 	struct ads7846 *ts = dev_get_drvdata(dev);
 
@@ -966,7 +966,7 @@ static int __maybe_unused ads7846_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ads7846_resume(struct device *dev)
+static int ads7846_resume(struct device *dev)
 {
 	struct ads7846 *ts = dev_get_drvdata(dev);
 
@@ -988,7 +988,7 @@ static int __maybe_unused ads7846_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(ads7846_pm, ads7846_suspend, ads7846_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ads7846_pm, ads7846_suspend, ads7846_resume);
 
 static int ads7846_setup_pendown(struct spi_device *spi,
 				 struct ads7846 *ts,
@@ -1421,7 +1421,7 @@ static void ads7846_remove(struct spi_device *spi)
 static struct spi_driver ads7846_driver = {
 	.driver = {
 		.name	= "ads7846",
-		.pm	= &ads7846_pm,
+		.pm	= pm_sleep_ptr(&ads7846_pm),
 		.of_match_table = of_match_ptr(ads7846_dt_ids),
 	},
 	.probe		= ads7846_probe,
-- 
2.39.0

