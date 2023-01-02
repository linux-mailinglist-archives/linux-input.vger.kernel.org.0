Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60AAF65B64D
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236513AbjABSG5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236490AbjABSGe (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:34 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 135F6DAD
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A54D361038
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB42C433EF;
        Mon,  2 Jan 2023 18:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682793;
        bh=A/p+bOHqSv9ECzGy2jdon9H3yyyOlExiHZ/PsPc3q6o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hLWW1KrkIWVrqmBl8dK2N+InEIT9rdFLcoaQELk0WyhSjfAM+hBokqJhj782ycyjc
         lkfSTjgVo39Y8xalbnVirVCfuxHnYOW52JjCUjw9kQiFoh3YEiLX4fZvVLo9kx5W5X
         ETMC6CH3Z9aM9BFJQmCmEwcrkInwbEsmSr8o7Ue+YwHU12cUByIJ36Ew5fa/XYrXKV
         MBpcqieoKJg5MUTIVh4+DqNPCngTTqitZZrKyNc/uMJTgSLR9oNDz5LqylmIY2IZn6
         iF8wI62jPMbC1tNYufGt16TDmVrs129npuBo2xEeg0/2UrPyrJdh+ej/C9M/5vANjI
         qSlTiRAE82NEQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Michael Hennerich <michael.hennerich@analog.com>
Subject: [PATCH 30/69] Input: ad7877 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:03 +0000
Message-Id: <20230102181842.718010-31-jic23@kernel.org>
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
Cc: Michael Hennerich <michael.hennerich@analog.com>
---
 drivers/input/touchscreen/ad7877.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/ad7877.c b/drivers/input/touchscreen/ad7877.c
index 08f5372f0bfd..edb36d663f22 100644
--- a/drivers/input/touchscreen/ad7877.c
+++ b/drivers/input/touchscreen/ad7877.c
@@ -788,7 +788,7 @@ static int ad7877_probe(struct spi_device *spi)
 	return 0;
 }
 
-static int __maybe_unused ad7877_suspend(struct device *dev)
+static int ad7877_suspend(struct device *dev)
 {
 	struct ad7877 *ts = dev_get_drvdata(dev);
 
@@ -797,7 +797,7 @@ static int __maybe_unused ad7877_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ad7877_resume(struct device *dev)
+static int ad7877_resume(struct device *dev)
 {
 	struct ad7877 *ts = dev_get_drvdata(dev);
 
@@ -806,12 +806,12 @@ static int __maybe_unused ad7877_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(ad7877_pm, ad7877_suspend, ad7877_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ad7877_pm, ad7877_suspend, ad7877_resume);
 
 static struct spi_driver ad7877_driver = {
 	.driver = {
 		.name	= "ad7877",
-		.pm	= &ad7877_pm,
+		.pm	= pm_sleep_ptr(&ad7877_pm),
 	},
 	.probe		= ad7877_probe,
 };
-- 
2.39.0

