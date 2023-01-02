Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3AAE65B648
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236499AbjABSGw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236435AbjABSGW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3FC62E2
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 719B8B80D0D
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E93FC433EF;
        Mon,  2 Jan 2023 18:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682780;
        bh=JXQWNe5ogfkH4k+8uuyvdtpGaRn0P1ym2tvP5GvgHlg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rr38E2PjHPrEwb68kyPJs7OCtrbzDqZXMfTPe3dPkBK9Zhp8yifjgvC64VgHyaed6
         T9HoNa13CbSTVdW9RaURxA3PQFRNRpx5cDmyXa03expxRf6pV8aP97TYQOF+4r3YRb
         ll1PuyGlvOgu5Sw73a+vv738OFLAt/zC/NmPnakL0A82Fip9lO3LZ24YiY4IK9Ac6p
         k7P3kRaPm9P1WHREHw+CSx0TfIMF4YKLpLTY3Sr7MnPTRrRrJUnQ65iAf8M1HHHbLi
         xKqmz7y8hwlWXWsYgQfFDsBbe9aTGuC6lgMbH7O2V8T/nAdiRT3jVP0XBKGbsGUtKl
         I7qalREU29Elw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 20/69] Input: pwm-vibra - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:53 +0000
Message-Id: <20230102181842.718010-21-jic23@kernel.org>
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
 drivers/input/misc/pwm-vibra.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/misc/pwm-vibra.c b/drivers/input/misc/pwm-vibra.c
index 81e777a04b88..d0e58a7cdfa3 100644
--- a/drivers/input/misc/pwm-vibra.c
+++ b/drivers/input/misc/pwm-vibra.c
@@ -222,7 +222,7 @@ static int pwm_vibrator_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused pwm_vibrator_suspend(struct device *dev)
+static int pwm_vibrator_suspend(struct device *dev)
 {
 	struct pwm_vibrator *vibrator = dev_get_drvdata(dev);
 
@@ -233,7 +233,7 @@ static int __maybe_unused pwm_vibrator_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused pwm_vibrator_resume(struct device *dev)
+static int pwm_vibrator_resume(struct device *dev)
 {
 	struct pwm_vibrator *vibrator = dev_get_drvdata(dev);
 
@@ -243,8 +243,8 @@ static int __maybe_unused pwm_vibrator_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(pwm_vibrator_pm_ops,
-			 pwm_vibrator_suspend, pwm_vibrator_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pwm_vibrator_pm_ops,
+				pwm_vibrator_suspend, pwm_vibrator_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id pwm_vibra_dt_match_table[] = {
@@ -258,7 +258,7 @@ static struct platform_driver pwm_vibrator_driver = {
 	.probe	= pwm_vibrator_probe,
 	.driver	= {
 		.name	= "pwm-vibrator",
-		.pm	= &pwm_vibrator_pm_ops,
+		.pm	= pm_sleep_ptr(&pwm_vibrator_pm_ops),
 		.of_match_table = of_match_ptr(pwm_vibra_dt_match_table),
 	},
 };
-- 
2.39.0

