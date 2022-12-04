Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF0C5641E55
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:56:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbiLDR4T (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbiLDR4S (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 320A7140CD
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CBA1D60DEB
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52438C433C1;
        Sun,  4 Dec 2022 17:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176577;
        bh=r8D8Sd1WxQQUnUAbhdzbXR9bTkQGae2Mgvb+dbVYKiA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p8y1TwgC26BKweWKqkGyBzclkrHthI6gwfQMgObONQbLuhkLQ6HE+FH+mpIAemngb
         WEcA4bp+MViao64LzbWiwFGT+RLVb5Exx44DMoKjRWZa8FeoKzKyxBqSd4eA4TJKTP
         8wspfnvjmkiacB+J9lCUrKF/i9PA1LUsSyKdrLPtdkldOwG4sFRcQJHmGyBiMikVs9
         OVdKyXarGubdrblUwe6qH7CvMqscQ2lsG762P4/XuZPTpIunx+Yx5Dw/8uhm5vl3vF
         YOwtsonLmMWcxTUbMrZVZtPEFHRY5Ebxfay79rSvJ6/MuuQVPZAZJucWC1KX/5ETh9
         WC9iMHRdSMqyg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH 09/32] Input: mtk-pmic-keys - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:18 +0000
Message-Id: <20221204180841.2211588-10-jic23@kernel.org>
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
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 9b34da0ec260..3d4ffa25e3df 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -231,7 +231,7 @@ static int mtk_pmic_key_setup(struct mtk_pmic_keys *keys,
 	return 0;
 }
 
-static int __maybe_unused mtk_pmic_keys_suspend(struct device *dev)
+static int mtk_pmic_keys_suspend(struct device *dev)
 {
 	struct mtk_pmic_keys *keys = dev_get_drvdata(dev);
 	int index;
@@ -247,7 +247,7 @@ static int __maybe_unused mtk_pmic_keys_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mtk_pmic_keys_resume(struct device *dev)
+static int mtk_pmic_keys_resume(struct device *dev)
 {
 	struct mtk_pmic_keys *keys = dev_get_drvdata(dev);
 	int index;
@@ -263,8 +263,8 @@ static int __maybe_unused mtk_pmic_keys_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(mtk_pmic_keys_pm_ops, mtk_pmic_keys_suspend,
-			mtk_pmic_keys_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(mtk_pmic_keys_pm_ops, mtk_pmic_keys_suspend,
+				mtk_pmic_keys_resume);
 
 static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	{
@@ -387,7 +387,7 @@ static struct platform_driver pmic_keys_pdrv = {
 	.driver = {
 		   .name = "mtk-pmic-keys",
 		   .of_match_table = of_mtk_pmic_keys_match_tbl,
-		   .pm = &mtk_pmic_keys_pm_ops,
+		   .pm = pm_sleep_ptr(&mtk_pmic_keys_pm_ops),
 	},
 };
 
-- 
2.38.1

