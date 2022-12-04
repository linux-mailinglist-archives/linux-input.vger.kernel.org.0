Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D175641E63
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbiLDR4z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbiLDR4a (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:30 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2F02140D2
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 64A80B80B8A
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65529C433B5;
        Sun,  4 Dec 2022 17:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176587;
        bh=1uYTSA3Wuayjm+Jl/K7BBz072B6EuiSzLKQAvcY0wsw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Sn+fzMS28oYN/OjneVqmw0loXTvNRykExEEVDxgA0rt9EIvHkPGhaPUR+zS3pybSS
         lJ/5yDN1mX5jnctao2fumkAsSStcCnYVcJCl54l+T9kfcpBIxMyoz0EhBi60isD50U
         s2VD1z6QZ66d/hpehXmMRPI3/rjape7t1PAbm1VSwjxX6QCEd55ur6lCNI2W194gam
         I7AP5P4dbGZnoyfZu46TepWD/dCOTjgLSstkEi0sInebhO+BsN4Wo7wTO9KNtuyKPw
         ZDtdl32LYFiBIMfVtncvANFt3zLwvxgjPn92cUhfzc5LQYRkZ8ciYP4nqy7ph4JtJU
         g73ncV4hCrA8g==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 17/32] Input: mcs-touchkey - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:26 +0000
Message-Id: <20221204180841.2211588-18-jic23@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204180841.2211588-1-jic23@kernel.org>
References: <20221204180841.2211588-1-jic23@kernel.org>
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
removed. Thus also drop the ifdef guards.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/input/keyboard/mcs_touchkey.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/mcs_touchkey.c b/drivers/input/keyboard/mcs_touchkey.c
index 34683458524c..d414e19e4559 100644
--- a/drivers/input/keyboard/mcs_touchkey.c
+++ b/drivers/input/keyboard/mcs_touchkey.c
@@ -213,7 +213,6 @@ static void mcs_touchkey_shutdown(struct i2c_client *client)
 		data->poweron(false);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int mcs_touchkey_suspend(struct device *dev)
 {
 	struct mcs_touchkey_data *data = dev_get_drvdata(dev);
@@ -243,10 +242,9 @@ static int mcs_touchkey_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(mcs_touchkey_pm_ops,
-			 mcs_touchkey_suspend, mcs_touchkey_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(mcs_touchkey_pm_ops,
+				mcs_touchkey_suspend, mcs_touchkey_resume);
 
 static const struct i2c_device_id mcs_touchkey_id[] = {
 	{ "mcs5000_touchkey", MCS5000_TOUCHKEY },
@@ -258,7 +256,7 @@ MODULE_DEVICE_TABLE(i2c, mcs_touchkey_id);
 static struct i2c_driver mcs_touchkey_driver = {
 	.driver = {
 		.name	= "mcs_touchkey",
-		.pm	= &mcs_touchkey_pm_ops,
+		.pm	= pm_sleep_ptr(&mcs_touchkey_pm_ops),
 	},
 	.probe_new	= mcs_touchkey_probe,
 	.remove		= mcs_touchkey_remove,
-- 
2.38.1

