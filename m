Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74E0E65B644
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236411AbjABSGs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236412AbjABSGT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:19 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEDCA5F96
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9E28FB80DDF
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F44C433D2;
        Mon,  2 Jan 2023 18:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682776;
        bh=kotcoLSZ8HkgZRPjZcnHoA6r3zLmIW7DIYRYJl4RVsI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DFnXVOiCBoUBbJtaDCuUhsedr5K5x0ClEeJeqp4dTpvwqGyyw9eyURhM6mGzGr5cK
         ggliFu7RG2fykGHDbVxTq76PnaPLz0tHAnkcTmh/B/lvWeB/nOqRy7nx1H4RKhpL7e
         HiSZm1/sA6pBin8HtmwDhQRfcsItQdLzy6FVHtyyv0gy+KE6N2mVO+mge09i4zKezH
         153GYQOiHxCsPpP/hdSqZm/3xoQH4vFPkBQOaGfXxH/9xfN+NolwcJdGVyupUJ9nRB
         KMuGQGI3I5zmTf59zy8inJ+u44on1bECo6qQ/TfmFOAV9axW8IY94kfpTL1ukOpyeM
         kW8TyMQnfw4HA==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Damien Riegel <damien.riegel@savoirfairelinux.com>
Subject: [PATCH 17/69] Input: pm8xxx-vibrator - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:50 +0000
Message-Id: <20230102181842.718010-18-jic23@kernel.org>
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
Cc: Damien Riegel <damien.riegel@savoirfairelinux.com>
---
 drivers/input/misc/pm8xxx-vibrator.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/pm8xxx-vibrator.c b/drivers/input/misc/pm8xxx-vibrator.c
index 53ad25eaf1a2..04cb87efd799 100644
--- a/drivers/input/misc/pm8xxx-vibrator.c
+++ b/drivers/input/misc/pm8xxx-vibrator.c
@@ -226,7 +226,7 @@ static int pm8xxx_vib_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused pm8xxx_vib_suspend(struct device *dev)
+static int pm8xxx_vib_suspend(struct device *dev)
 {
 	struct pm8xxx_vib *vib = dev_get_drvdata(dev);
 
@@ -236,7 +236,7 @@ static int __maybe_unused pm8xxx_vib_suspend(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(pm8xxx_vib_pm_ops, pm8xxx_vib_suspend, NULL);
+static DEFINE_SIMPLE_DEV_PM_OPS(pm8xxx_vib_pm_ops, pm8xxx_vib_suspend, NULL);
 
 static const struct of_device_id pm8xxx_vib_id_table[] = {
 	{ .compatible = "qcom,pm8058-vib", .data = &pm8058_regs },
@@ -250,7 +250,7 @@ static struct platform_driver pm8xxx_vib_driver = {
 	.probe		= pm8xxx_vib_probe,
 	.driver		= {
 		.name	= "pm8xxx-vib",
-		.pm	= &pm8xxx_vib_pm_ops,
+		.pm	= pm_sleep_ptr(&pm8xxx_vib_pm_ops),
 		.of_match_table = pm8xxx_vib_id_table,
 	},
 };
-- 
2.39.0

