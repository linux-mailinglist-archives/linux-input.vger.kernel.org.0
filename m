Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA85B65B642
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236401AbjABSGs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236411AbjABSGS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:18 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744492E2
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 29763B80D0D
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F96C433EF;
        Mon,  2 Jan 2023 18:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682774;
        bh=cJ0v3okXs+tO/Ws2wkgAookJbjJPjhab5+zfNFPGX5A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H5E87zFRibFI/LcD7YJRm1M0JKWgNPIDezAtE8mXoVvyI4U61r4nzCEB4RKw6MVAR
         7KHnZengdPR7nA672Z0ahn6QXH0X6x/Ri6yujQWakx60UnuD0xbx6KuRFtv2jW/1a2
         EYMzlyUym71b4fxPSmMv2KBO40qOQDsRmCzfeuvL7jpqSoMo+Vd2evXhgIEkhB3QmS
         dpnnh3QntcOLVLggpVNs8bH8eL95nJQWhOvQHbfcZI5xv5MnTJF/bG10pwh/TShVDF
         m8AFr+YB/mq6m08DdevHkSNxa7fFaQx6hDPubobrLCVLqTCzwfOmxkDi9goy6k6dXB
         k5bbhaW0RViBg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 16/69] Input: pm8941-pwrkey - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:49 +0000
Message-Id: <20230102181842.718010-17-jic23@kernel.org>
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
 drivers/input/misc/pm8941-pwrkey.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
index 549df01b6ee3..b6a27ebae977 100644
--- a/drivers/input/misc/pm8941-pwrkey.c
+++ b/drivers/input/misc/pm8941-pwrkey.c
@@ -217,7 +217,7 @@ static int pm8941_pwrkey_sw_debounce_init(struct pm8941_pwrkey *pwrkey)
 	return 0;
 }
 
-static int __maybe_unused pm8941_pwrkey_suspend(struct device *dev)
+static int pm8941_pwrkey_suspend(struct device *dev)
 {
 	struct pm8941_pwrkey *pwrkey = dev_get_drvdata(dev);
 
@@ -227,7 +227,7 @@ static int __maybe_unused pm8941_pwrkey_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused pm8941_pwrkey_resume(struct device *dev)
+static int pm8941_pwrkey_resume(struct device *dev)
 {
 	struct pm8941_pwrkey *pwrkey = dev_get_drvdata(dev);
 
@@ -237,8 +237,8 @@ static int __maybe_unused pm8941_pwrkey_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(pm8941_pwr_key_pm_ops,
-			 pm8941_pwrkey_suspend, pm8941_pwrkey_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pm8941_pwr_key_pm_ops,
+				pm8941_pwrkey_suspend, pm8941_pwrkey_resume);
 
 static int pm8941_pwrkey_probe(struct platform_device *pdev)
 {
@@ -460,7 +460,7 @@ static struct platform_driver pm8941_pwrkey_driver = {
 	.remove = pm8941_pwrkey_remove,
 	.driver = {
 		.name = "pm8941-pwrkey",
-		.pm = &pm8941_pwr_key_pm_ops,
+		.pm = pm_sleep_ptr(&pm8941_pwr_key_pm_ops),
 		.of_match_table = of_match_ptr(pm8941_pwr_key_id_table),
 	},
 };
-- 
2.39.0

