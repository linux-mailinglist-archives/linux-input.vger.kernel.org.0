Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6873D65B663
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236473AbjABSHY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236517AbjABSG7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:59 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0532F5
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E79D461038
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E0BC433D2;
        Mon,  2 Jan 2023 18:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682816;
        bh=78iLIx8k83FMNuPJTRiPoDvs1BszJFYIUVQkTlbfYd4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TTAfdudNQXerk3tZ9DfFBupP5e4Undd0sb8qVJLdRaivAB76seWyGxTs4GohIwg9K
         EpChhymiQRO6vqvGkm7dXIw2fTb4cM4lXBIvVkDsLGLfkRpwWjNjhwqz/NwyoDaAZB
         nU/YcHhF7yn39GfNF6sG48UfJycVZthjfrH3lRZnoJw8TfoBTh8g+fZTpAcJS4mDBJ
         JDvTumYy4FHBjty6Y1w+WpOvqf0qcp4iRf/poEGYO0fhFFpdUxzhOwv5cjN08z8gIM
         xkVUQO5tuMYioZRAX008FOgHw8PnCJvuh1qokA/E5OyAg5PJKYoCI3E2Bq4pFgwitE
         gAeYHFhhuQjsg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Anthony Kim <anthony.kim@hideep.com>
Subject: [PATCH 47/69] Input: hideep - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:20 +0000
Message-Id: <20230102181842.718010-48-jic23@kernel.org>
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
Cc: Anthony Kim <anthony.kim@hideep.com>
---
 drivers/input/touchscreen/hideep.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/hideep.c b/drivers/input/touchscreen/hideep.c
index ff4bb4c14898..bd454d93f1f7 100644
--- a/drivers/input/touchscreen/hideep.c
+++ b/drivers/input/touchscreen/hideep.c
@@ -959,7 +959,7 @@ static const struct attribute_group hideep_ts_attr_group = {
 	.attrs = hideep_ts_sysfs_entries,
 };
 
-static int __maybe_unused hideep_suspend(struct device *dev)
+static int hideep_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct hideep_ts *ts = i2c_get_clientdata(client);
@@ -970,7 +970,7 @@ static int __maybe_unused hideep_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused hideep_resume(struct device *dev)
+static int hideep_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct hideep_ts *ts = i2c_get_clientdata(client);
@@ -987,7 +987,7 @@ static int __maybe_unused hideep_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(hideep_pm_ops, hideep_suspend, hideep_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(hideep_pm_ops, hideep_suspend, hideep_resume);
 
 static const struct regmap_config hideep_regmap_config = {
 	.reg_bits = 16,
@@ -1108,7 +1108,7 @@ static struct i2c_driver hideep_driver = {
 		.name			= HIDEEP_I2C_NAME,
 		.of_match_table		= of_match_ptr(hideep_match_table),
 		.acpi_match_table	= ACPI_PTR(hideep_acpi_id),
-		.pm			= &hideep_pm_ops,
+		.pm			= pm_sleep_ptr(&hideep_pm_ops),
 	},
 	.id_table	= hideep_i2c_id,
 	.probe_new	= hideep_probe,
-- 
2.39.0

