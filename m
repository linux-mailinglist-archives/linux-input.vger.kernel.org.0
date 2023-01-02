Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7B7565B66D
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236528AbjABSH3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232151AbjABSHP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:15 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82F4038BD
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 14C7FB80DED
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58EAC433F0;
        Mon,  2 Jan 2023 18:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682831;
        bh=ZNJoi6CRGYY42ylwYrS7E+kQ1L3lM7YrqHcIxI5m09Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Vuy2w1mvVSExR4vUvZR9X94Bm0Iqyebr6ZD1R1bhuXKRGLQc7chmXyShr4dK7xOuF
         q7DBJwZd/n9MvrIoodUXsKb0iLG3pIx/1jLuZKQ2oHIc2cqQP69a8fxPZMMRBAM5s0
         uUKUdjY3AElTAg2wwHdulDrnstQkmUuCI51twSyNIuEfo3HkzeCh/lUr0s8Owxk7Fh
         4UcAq04qVWnMdKXc2KPKwrXbD7TbcTwyS33BD6xQUwLQPv2PwL8YQRLqApvauErKFS
         LE7eEekN8hEBv8lzAYmxF8WE7RwSEPZOqiLL6TEFsvN+YwIEYrrFFVpvYfozeAZyga
         Jcy7GSrYLSToA==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 59/69] Input: silead - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:32 +0000
Message-Id: <20230102181842.718010-60-jic23@kernel.org>
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
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/silead.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
index 8a7351c4414c..a37fac089010 100644
--- a/drivers/input/touchscreen/silead.c
+++ b/drivers/input/touchscreen/silead.c
@@ -736,7 +736,7 @@ static int silead_ts_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused silead_ts_suspend(struct device *dev)
+static int silead_ts_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 
@@ -745,7 +745,7 @@ static int __maybe_unused silead_ts_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused silead_ts_resume(struct device *dev)
+static int silead_ts_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	bool second_try = false;
@@ -784,7 +784,7 @@ static int __maybe_unused silead_ts_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(silead_ts_pm, silead_ts_suspend, silead_ts_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(silead_ts_pm, silead_ts_suspend, silead_ts_resume);
 
 static const struct i2c_device_id silead_ts_id[] = {
 	{ "gsl1680", 0 },
@@ -832,7 +832,7 @@ static struct i2c_driver silead_ts_driver = {
 		.name = SILEAD_TS_NAME,
 		.acpi_match_table = ACPI_PTR(silead_ts_acpi_match),
 		.of_match_table = of_match_ptr(silead_ts_of_match),
-		.pm = &silead_ts_pm,
+		.pm = pm_sleep_ptr(&silead_ts_pm),
 	},
 };
 module_i2c_driver(silead_ts_driver);
-- 
2.39.0

