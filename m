Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5AC865B63F
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbjABSGp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236298AbjABSGN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:13 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0779D13B
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 974826109A
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ECC0C433F1;
        Mon,  2 Jan 2023 18:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682771;
        bh=lmqJgWMbi4NXarTWyOwsqOnQ1nXopq+uyJ9COLF+gYY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aHFZ5nZZWSVaCURJ39v68hiJ+hYMUIaIVagq1MIM7ldIYDy8jeBE9ujDwOBrLzbT9
         5ks414m8hTgIpYlmtp0X3RpghAqcOUmkOThVsmBUsp0HIapHLiOQ9pSkYmLsde6fWJ
         w1X/IcxZZ0PqY1idt20NytmIQPOtiqcXy4aPXvDW47HzU2qoRdEgEZvHbZLckNrITl
         zN+9ci0Il4kAQO6k8yvVcIRo1eq06S0RSkwPF/dxRFxQ1Csep2JRc+CdIy5a7JTh2u
         81zdC7HThCz6ELx4ttBRhWY1BgtED0WyWpO253sIWRrWDWxArNipsX4v49nRydDLKP
         MrhGeS23fkSKw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 13/69] Input: max8997_haptic - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:46 +0000
Message-Id: <20230102181842.718010-14-jic23@kernel.org>
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
 drivers/input/misc/max8997_haptic.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/max8997_haptic.c b/drivers/input/misc/max8997_haptic.c
index 99cbc5ee89d1..c4dff476d479 100644
--- a/drivers/input/misc/max8997_haptic.c
+++ b/drivers/input/misc/max8997_haptic.c
@@ -366,7 +366,7 @@ static int max8997_haptic_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused max8997_haptic_suspend(struct device *dev)
+static int max8997_haptic_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct max8997_haptic *chip = platform_get_drvdata(pdev);
@@ -376,7 +376,8 @@ static int __maybe_unused max8997_haptic_suspend(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(max8997_haptic_pm_ops, max8997_haptic_suspend, NULL);
+static DEFINE_SIMPLE_DEV_PM_OPS(max8997_haptic_pm_ops,
+				max8997_haptic_suspend, NULL);
 
 static const struct platform_device_id max8997_haptic_id[] = {
 	{ "max8997-haptic", 0 },
@@ -387,7 +388,7 @@ MODULE_DEVICE_TABLE(platform, max8997_haptic_id);
 static struct platform_driver max8997_haptic_driver = {
 	.driver	= {
 		.name	= "max8997-haptic",
-		.pm	= &max8997_haptic_pm_ops,
+		.pm	= pm_sleep_ptr(&max8997_haptic_pm_ops),
 	},
 	.probe		= max8997_haptic_probe,
 	.remove		= max8997_haptic_remove,
-- 
2.39.0

