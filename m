Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE3765B653
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236493AbjABSHC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236495AbjABSGj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:39 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5BB38BD
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B05CE61038
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA17BC433D2;
        Mon,  2 Jan 2023 18:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682797;
        bh=Un5nYpevtqceByjkTlY/X84bVFVGTSzGQTioYBHsDFc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M+xyZI9FYQYcB5IbBbvV1ZpVGO0ubS3rLgpISAan2k8C1cxRnNgUdt+xKjBB2ooGD
         Pmqs0rPpv6IhbqM3QJnrEKxNsE0181Yt7RT9PavJFLGCZw18hZ8BmSTvGkeC83eH5o
         BkCJT2+bCudQs9ImDTuU1PVZs+PjigJqHf7CR+/hGj7jT9MtsXirEQqCOFC51m+Yw2
         vsPm/A7CdZLCEul8CzUy8p9VCYEk0s+pMJntWvd0rMfjtdv9dyXlRHlBruAPsCCoeJ
         z6IVHXpvTlkK791AdWdZrvkZth+hhPbzxTzal8wUpQ+8fMfzTa4hE182ICsC1N7a48
         mqOAOXxvRTajQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 33/69] Input: atmel_mxt_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:06 +0000
Message-Id: <20230102181842.718010-34-jic23@kernel.org>
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
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 39ef2664b852..996bf434e1cb 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3296,7 +3296,7 @@ static void mxt_remove(struct i2c_client *client)
 			       data->regulators);
 }
 
-static int __maybe_unused mxt_suspend(struct device *dev)
+static int mxt_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct mxt_data *data = i2c_get_clientdata(client);
@@ -3317,7 +3317,7 @@ static int __maybe_unused mxt_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mxt_resume(struct device *dev)
+static int mxt_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct mxt_data *data = i2c_get_clientdata(client);
@@ -3338,7 +3338,7 @@ static int __maybe_unused mxt_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(mxt_pm_ops, mxt_suspend, mxt_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(mxt_pm_ops, mxt_suspend, mxt_resume);
 
 static const struct of_device_id mxt_of_match[] = {
 	{ .compatible = "atmel,maxtouch", },
@@ -3375,7 +3375,7 @@ static struct i2c_driver mxt_driver = {
 		.name	= "atmel_mxt_ts",
 		.of_match_table = mxt_of_match,
 		.acpi_match_table = ACPI_PTR(mxt_acpi_id),
-		.pm	= &mxt_pm_ops,
+		.pm	= pm_sleep_ptr(&mxt_pm_ops),
 	},
 	.probe_new	= mxt_probe,
 	.remove		= mxt_remove,
-- 
2.39.0

