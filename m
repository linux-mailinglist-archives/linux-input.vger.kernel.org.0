Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA1365B660
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236440AbjABSHV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236490AbjABSG7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:59 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C65A116B
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 414C1B80DEC
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0292C433EF;
        Mon,  2 Jan 2023 18:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682815;
        bh=DIMShl4zaE2YV+7C0HGEGNxIMwfKzQ/0f0VBb7kDREw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tiWR/X9bBKkTVhvZSo1ggYOfQe1o/jL4+fGSbm6R1H5cwVZow3nP9EFrnLj9eFTOv
         AHQhE+9gYNa3akIxgXCt71zBI1NnO9dXS+rJMjNcnkb6Ycqq8PfCzjOyeNJpbrCDXf
         P+lU4DxEVqDXXqwb+Ndah3ULwxooczI1iTsAeK9QfGSsR9T9KWaBItFZVRkfq990wH
         MRq725ok4ePrNeJgv3vWVPACOAiPC2RgjDRubkdlPWV6p5RA/znETyYSWG2rZ8j4sD
         pRdr+dm1NfkcuBlih90uaCBvHOeYi7uw6IvTp1XaixjF0eizeKUN1rgeuV0/pM3Q8P
         Vwew9Z6bu/uvQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 46/69] Input: goodix - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:19 +0000
Message-Id: <20230102181842.718010-47-jic23@kernel.org>
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
Cc: Bastien Nocera <hadess@hadess.net>
---
 drivers/input/touchscreen/goodix.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 8a0a8078de8f..b348172f19c3 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -1401,7 +1401,7 @@ static void goodix_ts_remove(struct i2c_client *client)
 		wait_for_completion(&ts->firmware_loading_complete);
 }
 
-static int __maybe_unused goodix_suspend(struct device *dev)
+static int goodix_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct goodix_ts_data *ts = i2c_get_clientdata(client);
@@ -1448,7 +1448,7 @@ static int __maybe_unused goodix_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused goodix_resume(struct device *dev)
+static int goodix_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct goodix_ts_data *ts = i2c_get_clientdata(client);
@@ -1497,7 +1497,7 @@ static int __maybe_unused goodix_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(goodix_pm_ops, goodix_suspend, goodix_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(goodix_pm_ops, goodix_suspend, goodix_resume);
 
 static const struct i2c_device_id goodix_ts_id[] = {
 	{ "GDIX1001:00", 0 },
@@ -1543,7 +1543,7 @@ static struct i2c_driver goodix_ts_driver = {
 		.name = "Goodix-TS",
 		.acpi_match_table = ACPI_PTR(goodix_acpi_match),
 		.of_match_table = of_match_ptr(goodix_of_match),
-		.pm = &goodix_pm_ops,
+		.pm = pm_sleep_ptr(&goodix_pm_ops),
 	},
 };
 module_i2c_driver(goodix_ts_driver);
-- 
2.39.0

