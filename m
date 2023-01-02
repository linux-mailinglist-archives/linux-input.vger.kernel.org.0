Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF52065B673
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236451AbjABSHd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236452AbjABSHV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D082E2
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 26DD861038
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88A3C433F0;
        Mon,  2 Jan 2023 18:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682839;
        bh=SDsLxYAM5d+mRT4vUHww8LmYxVPiSxLKAcMZQ6Dby+w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qZQFH4dCtuKg4AxfTFwj7lLbxyFR+VEkGHakL/ogkAgouciMwos7dtb4jt0UdEMBv
         HOqelKFfksRuLf3+2LDTrXKZ9iDA5qMoXNtk1jQ3v9gAbNvu+8cdO5G7h153V6SH4+
         DICApkxPvnGNCu7Ky4tKj1VUYT8GiDLHwXTY3hOKstxjKldYsXP3AvwilFdKzma/YQ
         Lj3PBB04pC4zclj0dN5UhbkdYR8JbvmvAkDs9GkTN6rZiy6t+Tg8Jb/vRdoYB/vnW2
         cIFmzykBiiNVPBtE3AuiqaFlapNn3sD/EayW2Co8auedQp+IpbY9Sqle4ZfAH/od6e
         00umn9+EgCJdw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 65/69] Input: wdt87xx_i2c - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:38 +0000
Message-Id: <20230102181842.718010-66-jic23@kernel.org>
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
 drivers/input/touchscreen/wdt87xx_i2c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/wdt87xx_i2c.c b/drivers/input/touchscreen/wdt87xx_i2c.c
index 3f87db5cdca4..771962af3d0a 100644
--- a/drivers/input/touchscreen/wdt87xx_i2c.c
+++ b/drivers/input/touchscreen/wdt87xx_i2c.c
@@ -1113,7 +1113,7 @@ static int wdt87xx_ts_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused wdt87xx_suspend(struct device *dev)
+static int wdt87xx_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	int error;
@@ -1132,7 +1132,7 @@ static int __maybe_unused wdt87xx_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused wdt87xx_resume(struct device *dev)
+static int wdt87xx_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	int error;
@@ -1154,7 +1154,7 @@ static int __maybe_unused wdt87xx_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(wdt87xx_pm_ops, wdt87xx_suspend, wdt87xx_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(wdt87xx_pm_ops, wdt87xx_suspend, wdt87xx_resume);
 
 static const struct i2c_device_id wdt87xx_dev_id[] = {
 	{ WDT87XX_NAME, 0 },
@@ -1173,7 +1173,7 @@ static struct i2c_driver wdt87xx_driver = {
 	.id_table	= wdt87xx_dev_id,
 	.driver	= {
 		.name	= WDT87XX_NAME,
-		.pm     = &wdt87xx_pm_ops,
+		.pm     = pm_sleep_ptr(&wdt87xx_pm_ops),
 		.acpi_match_table = ACPI_PTR(wdt87xx_acpi_id),
 	},
 };
-- 
2.39.0

