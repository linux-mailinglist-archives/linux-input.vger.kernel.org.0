Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6AE65B643
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235261AbjABSGt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236423AbjABSGU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E10CC25
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CFFECB80DDE
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9792C433EF;
        Mon,  2 Jan 2023 18:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682777;
        bh=oFc+PQl/9z4J6KHsg/Qo2TKXa4P5EbaXoA5U9NLooSk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RJKcp1X+fy0TcFlFIiaFyD/uzzJcIK7+dwB5OVMnqlBnRNeYs2GArrI9dltPbgIT6
         ljQ2miQBcbKuTIaPpFyEUzDjX6+KKF3kTxJE4o042XybMzsGHKALtNrd9MX2Ea1sP5
         QaRfq7OPkI2aNBTHfztMegQJ0pJMLrnuTIyd0QTyWzVJRt6oq+HlZC4p5B6Hzya+Ya
         l8IlQBFUFch1JjgalBxWx0ryscZqYWegbqidQT/jJJrcCy75hTTW7uFKsWIP7gUNYU
         /r8nlwnn6xm1mRFCJhwPGcEPBXKv2q2TBQOiFkNteP2JUNW18JLHvEourW4QAFHr7K
         pbNrp83AhS4hQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 18/69] Input: pmic8xxx-pwrkey - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:51 +0000
Message-Id: <20230102181842.718010-19-jic23@kernel.org>
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
Cc: Stephen Boyd <swboyd@chromium.org>
---
 drivers/input/misc/pmic8xxx-pwrkey.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/pmic8xxx-pwrkey.c b/drivers/input/misc/pmic8xxx-pwrkey.c
index 0e818a3d28c5..89fb137e3715 100644
--- a/drivers/input/misc/pmic8xxx-pwrkey.c
+++ b/drivers/input/misc/pmic8xxx-pwrkey.c
@@ -100,7 +100,7 @@ static irqreturn_t pwrkey_release_irq(int irq, void *_pwr)
 	return IRQ_HANDLED;
 }
 
-static int __maybe_unused pmic8xxx_pwrkey_suspend(struct device *dev)
+static int pmic8xxx_pwrkey_suspend(struct device *dev)
 {
 	struct pmic8xxx_pwrkey *pwrkey = dev_get_drvdata(dev);
 
@@ -110,7 +110,7 @@ static int __maybe_unused pmic8xxx_pwrkey_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused pmic8xxx_pwrkey_resume(struct device *dev)
+static int pmic8xxx_pwrkey_resume(struct device *dev)
 {
 	struct pmic8xxx_pwrkey *pwrkey = dev_get_drvdata(dev);
 
@@ -120,7 +120,7 @@ static int __maybe_unused pmic8xxx_pwrkey_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(pm8xxx_pwr_key_pm_ops,
+static DEFINE_SIMPLE_DEV_PM_OPS(pm8xxx_pwr_key_pm_ops,
 		pmic8xxx_pwrkey_suspend, pmic8xxx_pwrkey_resume);
 
 static void pmic8xxx_pwrkey_shutdown(struct platform_device *pdev)
@@ -442,7 +442,7 @@ static struct platform_driver pmic8xxx_pwrkey_driver = {
 	.shutdown	= pmic8xxx_pwrkey_shutdown,
 	.driver		= {
 		.name	= "pm8xxx-pwrkey",
-		.pm	= &pm8xxx_pwr_key_pm_ops,
+		.pm	= pm_sleep_ptr(&pm8xxx_pwr_key_pm_ops),
 		.of_match_table = pm8xxx_pwr_key_id_table,
 	},
 };
-- 
2.39.0

