Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 850B965B669
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236502AbjABSH1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236553AbjABSHJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:09 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1DB116B
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D8A14B80DED
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58E7C433D2;
        Mon,  2 Jan 2023 18:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682826;
        bh=BNEwtmTr1jjEY9u9KTxA6Wz7K+aEyIiTKh8//mO50Sg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D1SnFA4kUCaxZUsqRb1Sf9VLxZAeyvqvj90qdh/PEDWZJ9fNha8hfAZhS/E1RduOO
         de07QgPPtSPFqFV8V7BmotiVwPzlf27S+7B0+DuqFzyedryUT4Ha7YReSfC/ou8WwH
         zXc7PEiMB0pmo+rvItAfuSsz+O/gqrJp7cgiaSHalcJYrAezyq9P29bGAq0pj8kxB6
         e8uE/cL/1fEVkfsMJV/869wG5bRL8EVqYQ7Wa10bgQUb1i03SZGiNsOEGOwSAleTQK
         Vc+/lds+Yx+gBnVhso+TrkmHd6OTVVZw5CZX/vTN+Mf1w1II6YGsiRK06YfXHguena
         kuK0HZaDK3CvQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 55/69] Input: mms114 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:28 +0000
Message-Id: <20230102181842.718010-56-jic23@kernel.org>
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
 drivers/input/touchscreen/mms114.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index 758b669391a7..4dbca1aad89d 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -557,7 +557,7 @@ static int mms114_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused mms114_suspend(struct device *dev)
+static int mms114_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct mms114_data *data = i2c_get_clientdata(client);
@@ -581,7 +581,7 @@ static int __maybe_unused mms114_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mms114_resume(struct device *dev)
+static int mms114_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct mms114_data *data = i2c_get_clientdata(client);
@@ -601,7 +601,7 @@ static int __maybe_unused mms114_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(mms114_pm_ops, mms114_suspend, mms114_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(mms114_pm_ops, mms114_suspend, mms114_resume);
 
 static const struct i2c_device_id mms114_id[] = {
 	{ "mms114", 0 },
@@ -635,7 +635,7 @@ MODULE_DEVICE_TABLE(of, mms114_dt_match);
 static struct i2c_driver mms114_driver = {
 	.driver = {
 		.name	= "mms114",
-		.pm	= &mms114_pm_ops,
+		.pm	= pm_sleep_ptr(&mms114_pm_ops),
 		.of_match_table = of_match_ptr(mms114_dt_match),
 	},
 	.probe_new	= mms114_probe,
-- 
2.39.0

