Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C485641E53
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:56:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbiLDR4S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbiLDR4R (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:17 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCE34140CD
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 79DCA60DEB
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3BFEC433D6;
        Sun,  4 Dec 2022 17:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176575;
        bh=7Vkbkwa2VGJ7g3SZ6ixVK9ZHktVllTsPZZe/aAxuBFs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mB+jCtXJQwqebxc5T5WTqQhvPR4L0Jde1cXk1fEBjtyJ2WicrhOvyvRFueaFasrvx
         L8kgfYXfBGsjKGvTamYzx5FI1u3EGWMb4SX0UXXgag61/SCdQ7zz/KIak9qMgUFSgU
         21Mug5U3fzEEZaMxsVyjKGlFsPHSNSCJicgJcIVg221zckJyLYcglnJxFi2Z3mhwp/
         ZjGpuDq2c2PYEJpwqJ+pyG3OPp2N55dfLm5DgrgUcA9eyGU5jd9YRqNJI4uRz5oaS9
         wvdSwi9Q4xhDVemkcwFM/EwLm6NcbAgQzAiNrSDVIu/tL3GxOw2BT6NIBNNI0dlg/y
         lpF0/4rdP6PLQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH 08/32] Input: mpr121-touchkey - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:17 +0000
Message-Id: <20221204180841.2211588-9-jic23@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204180841.2211588-1-jic23@kernel.org>
References: <20221204180841.2211588-1-jic23@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Michal Vokáč <michal.vokac@ysoft.com>
---
 drivers/input/keyboard/mpr121_touchkey.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/mpr121_touchkey.c b/drivers/input/keyboard/mpr121_touchkey.c
index 4610ef55903c..74ad353462a3 100644
--- a/drivers/input/keyboard/mpr121_touchkey.c
+++ b/drivers/input/keyboard/mpr121_touchkey.c
@@ -340,7 +340,7 @@ static int mpr_touchkey_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused mpr_suspend(struct device *dev)
+static int mpr_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 
@@ -352,7 +352,7 @@ static int __maybe_unused mpr_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mpr_resume(struct device *dev)
+static int mpr_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct mpr121_touchkey *mpr121 = i2c_get_clientdata(client);
@@ -366,7 +366,7 @@ static int __maybe_unused mpr_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(mpr121_touchkey_pm_ops, mpr_suspend, mpr_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(mpr121_touchkey_pm_ops, mpr_suspend, mpr_resume);
 
 static const struct i2c_device_id mpr121_id[] = {
 	{ "mpr121_touchkey", 0 },
@@ -385,7 +385,7 @@ MODULE_DEVICE_TABLE(of, mpr121_touchkey_dt_match_table);
 static struct i2c_driver mpr_touchkey_driver = {
 	.driver = {
 		.name	= "mpr121",
-		.pm	= &mpr121_touchkey_pm_ops,
+		.pm	= pm_sleep_ptr(&mpr121_touchkey_pm_ops),
 		.of_match_table = of_match_ptr(mpr121_touchkey_dt_match_table),
 	},
 	.id_table	= mpr121_id,
-- 
2.38.1

