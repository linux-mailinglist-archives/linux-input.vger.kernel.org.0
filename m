Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEAFA66ACCC
	for <lists+linux-input@lfdr.de>; Sat, 14 Jan 2023 18:02:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbjANRCz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Jan 2023 12:02:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbjANRCx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Jan 2023 12:02:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7583CB75B
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 09:02:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 08CA760BC1
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 17:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A830C433F0;
        Sat, 14 Jan 2023 17:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673715771;
        bh=d1taWlWOF2XOLFoS18UoFOWFJ/+qK+Xewe9jIvYV040=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sgWAHLrvP+98nfQuRFG8BpQpuQofRftg3kxmuQ8i6Ah/247L7oNHL0Uob4RnqBsWB
         5oz3BUSF9kzXBNws3w4pKZ+eMS/ZEoHPw4JadVB/p2/8iGoCGHCgZhEhwBYuOslgiX
         teResmAnGX9OSb5kml8FghdQyk7SWFoYqcUu/1ELCtxZ8x6bw1DP8dzcb1ByyM/q6Z
         vhsOW+7VW6scsinz+Jjg4JSx1qW7vbB0iVYIHENRX/ghdL9E4dW/u2Re4MeW98SQ2M
         MIMbuXSzTp68dsL6+gpmhAc+vgp1k3Sg59cq5RqOZqJ44YRCTKW3owFTiN5eU12dzG
         voCfY0HX6pA3w==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     jic23@kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 02/16] Input: axp20x-pek - switch to SYSTEM_SLEEP_PM_OPS() and pm_sleep_ptr()
Date:   Sat, 14 Jan 2023 17:16:06 +0000
Message-Id: <20230114171620.42891-3-jic23@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114171620.42891-1-jic23@kernel.org>
References: <20230114171620.42891-1-jic23@kernel.org>
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

SET_SYSTEM_SLEEP_PM_OPS() is deprecated as it requires explicit protection
against unused function warnings.  The new combination of pm_sleep_ptr()
and SYSTEM_SLEEP_PM_OPS() allows the compiler to see the functions,
thus suppressing the warning, but still allowing the unused code to be
removed. Thus also drop the __maybe_unused markings.  Here the
additional .resume_noirq callback is protected with pm_sleep_ptr(). This
isn't strictly necessary but is done for consistency with the other
callbacks.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/misc/axp20x-pek.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
index 04da7916eb70..4581606a28d6 100644
--- a/drivers/input/misc/axp20x-pek.c
+++ b/drivers/input/misc/axp20x-pek.c
@@ -336,7 +336,7 @@ static int axp20x_pek_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused axp20x_pek_suspend(struct device *dev)
+static int axp20x_pek_suspend(struct device *dev)
 {
 	struct axp20x_pek *axp20x_pek = dev_get_drvdata(dev);
 
@@ -355,7 +355,7 @@ static int __maybe_unused axp20x_pek_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused axp20x_pek_resume(struct device *dev)
+static int axp20x_pek_resume(struct device *dev)
 {
 	struct axp20x_pek *axp20x_pek = dev_get_drvdata(dev);
 
@@ -389,10 +389,8 @@ static int __maybe_unused axp20x_pek_resume_noirq(struct device *dev)
 }
 
 static const struct dev_pm_ops axp20x_pek_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(axp20x_pek_suspend, axp20x_pek_resume)
-#ifdef CONFIG_PM_SLEEP
-	.resume_noirq = axp20x_pek_resume_noirq,
-#endif
+	SYSTEM_SLEEP_PM_OPS(axp20x_pek_suspend, axp20x_pek_resume)
+	.resume_noirq = pm_sleep_ptr(axp20x_pek_resume_noirq),
 };
 
 static const struct platform_device_id axp_pek_id_match[] = {
@@ -413,7 +411,7 @@ static struct platform_driver axp20x_pek_driver = {
 	.id_table	= axp_pek_id_match,
 	.driver		= {
 		.name		= "axp20x-pek",
-		.pm		= &axp20x_pek_pm_ops,
+		.pm		= pm_sleep_ptr(&axp20x_pek_pm_ops),
 		.dev_groups	= axp20x_groups,
 	},
 };
-- 
2.39.0

