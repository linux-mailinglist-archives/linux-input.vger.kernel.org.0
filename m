Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E354C65B66F
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236298AbjABSHa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236313AbjABSHR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:17 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF3D5F96
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 776BB61084
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03EDC433EF;
        Mon,  2 Jan 2023 18:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682835;
        bh=48Vj5p6AnR2rJaq9SOgxMVfQh0dhal3ebs2RixzwhmY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uuoazqvTfckPAxvYnI2hWBfSMD9MBhzzlbLqQ4G/TffjOcbgi17OaZeBC2TAehzK/
         ik4gw1+0aouwUfPNDBw4KZmnWb+4IuoJ5AsSoYyPDyH28ZZUdZlfWRF89P23h3OzBe
         qsOGglx6BPs1kz0hVPh85un9pHn2xlrF6+oBTWjK2xUxj0KysOzgvJbR5O52ryIJpR
         Qv5oaFXvS0pKMWRiTC5MHWsTtVHExgCqz8yC6F2IUJ2UppEUI/50+tA4V8di18pd0S
         0Jcybz81XnOcVsZP+mZqHyGlUy9xNZjJFbEyVfTu2R2u9LtFsGDFxLdsnjYHNRo1FO
         04bdqWqZ9+25A==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Dario Binacchi <dariobin@libero.it>
Subject: [PATCH 62/69] Input: ti_am335x_tsc - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:35 +0000
Message-Id: <20230102181842.718010-63-jic23@kernel.org>
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
Cc: Dario Binacchi <dariobin@libero.it>
---
 drivers/input/touchscreen/ti_am335x_tsc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/ti_am335x_tsc.c b/drivers/input/touchscreen/ti_am335x_tsc.c
index f2fb6a9a1a57..decf2d24a115 100644
--- a/drivers/input/touchscreen/ti_am335x_tsc.c
+++ b/drivers/input/touchscreen/ti_am335x_tsc.c
@@ -512,7 +512,7 @@ static int titsc_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused titsc_suspend(struct device *dev)
+static int titsc_suspend(struct device *dev)
 {
 	struct titsc *ts_dev = dev_get_drvdata(dev);
 	unsigned int idle;
@@ -527,7 +527,7 @@ static int __maybe_unused titsc_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused titsc_resume(struct device *dev)
+static int titsc_resume(struct device *dev)
 {
 	struct titsc *ts_dev = dev_get_drvdata(dev);
 
@@ -543,7 +543,7 @@ static int __maybe_unused titsc_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(titsc_pm_ops, titsc_suspend, titsc_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(titsc_pm_ops, titsc_suspend, titsc_resume);
 
 static const struct of_device_id ti_tsc_dt_ids[] = {
 	{ .compatible = "ti,am3359-tsc", },
@@ -556,7 +556,7 @@ static struct platform_driver ti_tsc_driver = {
 	.remove	= titsc_remove,
 	.driver	= {
 		.name   = "TI-am335x-tsc",
-		.pm	= &titsc_pm_ops,
+		.pm	= pm_sleep_ptr(&titsc_pm_ops),
 		.of_match_table = ti_tsc_dt_ids,
 	},
 };
-- 
2.39.0

