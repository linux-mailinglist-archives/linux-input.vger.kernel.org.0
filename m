Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9427D641E50
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbiLDR4O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbiLDR4N (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:13 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C008140D0
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1AAA6B80B8E
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E789CC433D7;
        Sun,  4 Dec 2022 17:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176570;
        bh=rP4CzG0/AcVjdoHGkquS0ZRSwA95mBNSbJ3ZVt6rlLg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JiBAvo5FWT1laJ4HYAuF/i51q9yMH6EKG7q5tji+6mFadLlsv56KuRltrkpW5sPqE
         jJVVvJlSCr8uh3itOABMCzkjpwcIGuzTr4tvo4Gm4Hiw0vJjQf6nppONJe0vAfnkMj
         cuMbcM1TzDfX11E72SGLsnbrPoCXvsxMoCW43yn6cZCoLHKfjCb0V6EW0Tm1VQ+s4L
         o46pp8bVoWrj4NO1E9G8orxxDF2oGUDp0kyFsL2PXiNcjUm9vP8+5BVH5U5oEa4RHD
         E6h5q4FdGuDVfLm5fvWr24GrDCK9yTQxzzDEHflbaaXyvJLshzgnR45Cunu4w/Wo15
         5GqX3eFP7+ivw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 04/32] Input: cypress-sf - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:13 +0000
Message-Id: <20221204180841.2211588-5-jic23@kernel.org>
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
removed. Thus also drop the __maybe_unused markings.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/input/keyboard/cypress-sf.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/cypress-sf.c b/drivers/input/keyboard/cypress-sf.c
index 9a23eed6a4f4..686388f40317 100644
--- a/drivers/input/keyboard/cypress-sf.c
+++ b/drivers/input/keyboard/cypress-sf.c
@@ -168,7 +168,7 @@ static int cypress_sf_probe(struct i2c_client *client)
 	return 0;
 };
 
-static int __maybe_unused cypress_sf_suspend(struct device *dev)
+static int cypress_sf_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct cypress_sf_data *touchkey = i2c_get_clientdata(client);
@@ -187,7 +187,7 @@ static int __maybe_unused cypress_sf_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cypress_sf_resume(struct device *dev)
+static int cypress_sf_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct cypress_sf_data *touchkey = i2c_get_clientdata(client);
@@ -205,8 +205,8 @@ static int __maybe_unused cypress_sf_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(cypress_sf_pm_ops,
-			 cypress_sf_suspend, cypress_sf_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(cypress_sf_pm_ops,
+				cypress_sf_suspend, cypress_sf_resume);
 
 static struct i2c_device_id cypress_sf_id_table[] = {
 	{ CYPRESS_SF_DEV_NAME, 0 },
@@ -225,7 +225,7 @@ MODULE_DEVICE_TABLE(of, cypress_sf_of_match);
 static struct i2c_driver cypress_sf_driver = {
 	.driver = {
 		.name = CYPRESS_SF_DEV_NAME,
-		.pm = &cypress_sf_pm_ops,
+		.pm = pm_sleep_ptr(&cypress_sf_pm_ops),
 		.of_match_table = of_match_ptr(cypress_sf_of_match),
 	},
 	.id_table = cypress_sf_id_table,
-- 
2.38.1

