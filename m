Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF8BD66ACD6
	for <lists+linux-input@lfdr.de>; Sat, 14 Jan 2023 18:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbjANRDK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Jan 2023 12:03:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbjANRDJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Jan 2023 12:03:09 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55150A5F2
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 09:03:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E5F8B60C01
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 17:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D13C433F0;
        Sat, 14 Jan 2023 17:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673715786;
        bh=wI6BTPk4E4tB5BRh5Aw4uOihjadUKrEtfrtL2v1kpPA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mUOylq3kbpfYYl7qUoiCh7oXKohH9xVzJwLqO99VEijNE6rz/wsdVBGTXYqh4gC5v
         3zbFuGi27fOFHwPeBv9O6WvAFX0HThHLQZ+1T+dlui8WMVUaj+9+WdnS3jXNfCC2SP
         whPWRweuJrVfVOnt9GKJgakuVwPCzx5Wrpqva+HhB88HQjz65MR+5ZKhWC1wHKmFa8
         dIXnlhQk7NlgzEHg0LIsmlX1QUCGQS/OQrouZJ1oDuSs0dmgpVm95DcgAz1Ckmrugs
         g2EXPkbBj2R7iSPSH9A04ojIflJVh+Eg0/6uXxA7n6IR8gWEhlZ3bS72kv5JbJWf3U
         ogbguMCfpI9ag==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     jic23@kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 12/16] Input: applespi - use pm_sleep_ptr() and SYSTEM_SLEEP_PM_OPS()
Date:   Sat, 14 Jan 2023 17:16:16 +0000
Message-Id: <20230114171620.42891-13-jic23@kernel.org>
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
removed. Thus also drop the __maybe_unused markings.

In this case we also have a .poweroff_late() callback. Whilst not
strictly necessary, to future proof against relaxation of the protection
of the main driver.pm = pm_sleep_ptr() protect this pointer with
pm_sleep_ptr() as would be done if the LATE_SYSTEM_SLEEP_PM_OPS()
macro were used to set it.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/input/keyboard/applespi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
index 91a9810f6980..cf25177b4830 100644
--- a/drivers/input/keyboard/applespi.c
+++ b/drivers/input/keyboard/applespi.c
@@ -1876,7 +1876,7 @@ static int applespi_poweroff_late(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused applespi_suspend(struct device *dev)
+static int applespi_suspend(struct device *dev)
 {
 	struct spi_device *spi = to_spi_device(dev);
 	struct applespi_data *applespi = spi_get_drvdata(spi);
@@ -1903,7 +1903,7 @@ static int __maybe_unused applespi_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused applespi_resume(struct device *dev)
+static int applespi_resume(struct device *dev)
 {
 	struct spi_device *spi = to_spi_device(dev);
 	struct applespi_data *applespi = spi_get_drvdata(spi);
@@ -1947,15 +1947,15 @@ static const struct acpi_device_id applespi_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, applespi_acpi_match);
 
 static const struct dev_pm_ops applespi_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(applespi_suspend, applespi_resume)
-	.poweroff_late	= applespi_poweroff_late,
+	SYSTEM_SLEEP_PM_OPS(applespi_suspend, applespi_resume)
+	.poweroff_late	= pm_sleep_ptr(applespi_poweroff_late),
 };
 
 static struct spi_driver applespi_driver = {
 	.driver		= {
 		.name			= "applespi",
 		.acpi_match_table	= applespi_acpi_match,
-		.pm			= &applespi_pm_ops,
+		.pm			= pm_sleep_ptr(&applespi_pm_ops),
 	},
 	.probe		= applespi_probe,
 	.remove		= applespi_remove,
-- 
2.39.0

