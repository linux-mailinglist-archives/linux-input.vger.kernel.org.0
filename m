Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35A6965B640
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236323AbjABSGr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236410AbjABSGP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:15 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E72413B
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2B93C61057
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B15C433F0;
        Mon,  2 Jan 2023 18:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682773;
        bh=5VLcsaZXDvy3xLFQdEdVLBMXMe2LcAIztX8IsNzrPyY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MCKfEYw+HLsmAP3UNm3P7tpKIIGUc1DSwKOHhZfU1/6xKCWoMeShEXPOKo36R7P5S
         kkF4+KTvOIFYDKEspwdoyNNN/38a5VDT87eZaijM5mTPXJzYUkZDy+07XZJScAtsax
         HbK0JviEDcksstNYcqacEOjp3LFOodRs+EaqJDbCzuyS9RoQM2OvY63lAzuMuKnmq7
         I7n2h6ME4u1ISQxLcYFZCI57BcpMakgqnXxPcbBiivZNRL+DpM/3CNHH6HJAyUcuYt
         nkOTcLRX9pTm0H3uE7U+2XdEuyG/L9PPf4DBktwnC2NZGrj0Wc1DRGoiJaVxoB9I3X
         PqmflthgtnoqQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 15/69] Input: pcfg8574_keypad - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:48 +0000
Message-Id: <20230102181842.718010-16-jic23@kernel.org>
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
removed. Thus also drop the #ifdef guards.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/input/misc/pcf8574_keypad.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/input/misc/pcf8574_keypad.c b/drivers/input/misc/pcf8574_keypad.c
index fd1ff3f1cd92..6323c3d37ef7 100644
--- a/drivers/input/misc/pcf8574_keypad.c
+++ b/drivers/input/misc/pcf8574_keypad.c
@@ -167,7 +167,6 @@ static void pcf8574_kp_remove(struct i2c_client *client)
 	kfree(lp);
 }
 
-#ifdef CONFIG_PM
 static int pcf8574_kp_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -186,15 +185,8 @@ static int pcf8574_kp_suspend(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops pcf8574_kp_pm_ops = {
-	.suspend	= pcf8574_kp_suspend,
-	.resume		= pcf8574_kp_resume,
-};
-
-#else
-# define pcf8574_kp_resume  NULL
-# define pcf8574_kp_suspend NULL
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(pcf8574_kp_pm_ops,
+				pcf8574_kp_suspend, pcf8574_kp_resume);
 
 static const struct i2c_device_id pcf8574_kp_id[] = {
 	{ DRV_NAME, 0 },
@@ -205,9 +197,7 @@ MODULE_DEVICE_TABLE(i2c, pcf8574_kp_id);
 static struct i2c_driver pcf8574_kp_driver = {
 	.driver = {
 		.name  = DRV_NAME,
-#ifdef CONFIG_PM
-		.pm = &pcf8574_kp_pm_ops,
-#endif
+		.pm = pm_sleep_ptr(&pcf8574_kp_pm_ops),
 	},
 	.probe_new = pcf8574_kp_probe,
 	.remove   = pcf8574_kp_remove,
-- 
2.39.0

