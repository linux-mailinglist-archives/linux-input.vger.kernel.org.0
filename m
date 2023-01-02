Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8102A65B635
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:06:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235138AbjABSGK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236234AbjABSGB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:01 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE22D617D
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 82AE3B80D0B
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ABD0C433F0;
        Mon,  2 Jan 2023 18:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682758;
        bh=HfQ8v+XO30mtsqWpzBIevpeQiIwtO+//GCpN5kTP3Bs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=euS3qdsDwoHtE3gGByb62CA3acRrWbWxK2EmONqm24rlExoCmzwNlOwrDMI0CI5Xl
         4VJTjXnp8UYd5QHIFxOrom8svMWO4sXKiprdIBocdtjnk8TY2LqL0pWQGWKshqCrlg
         qQqJJBSD3Kck++r6qEcG2usIOIBN2KWK5PZvK5qqDtEqUdHXRTmngc2JxnEYrpvHaI
         9zdegcViVMHOjcjQcdpsfyRYVu/hLD7IkaJEIls7qNE0kbnfp1Yo55ABLiLMdrU4aD
         6WczLdTo8nzQZQeh6wjW4icP0lK6pLAG9c98fbXe8CYlXooxuyLuHVniL/rgXv3OFA
         RH5mdlWrEuY4w==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 03/69] Input: drv260x - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:36 +0000
Message-Id: <20230102181842.718010-4-jic23@kernel.org>
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
 drivers/input/misc/drv260x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/drv260x.c b/drivers/input/misc/drv260x.c
index 3a51ee5e935a..8a9ebfc04a2d 100644
--- a/drivers/input/misc/drv260x.c
+++ b/drivers/input/misc/drv260x.c
@@ -572,7 +572,7 @@ static int drv260x_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused drv260x_suspend(struct device *dev)
+static int drv260x_suspend(struct device *dev)
 {
 	struct drv260x_data *haptics = dev_get_drvdata(dev);
 	int ret = 0;
@@ -604,7 +604,7 @@ static int __maybe_unused drv260x_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused drv260x_resume(struct device *dev)
+static int drv260x_resume(struct device *dev)
 {
 	struct drv260x_data *haptics = dev_get_drvdata(dev);
 	int ret = 0;
@@ -635,7 +635,7 @@ static int __maybe_unused drv260x_resume(struct device *dev)
 	return ret;
 }
 
-static SIMPLE_DEV_PM_OPS(drv260x_pm_ops, drv260x_suspend, drv260x_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(drv260x_pm_ops, drv260x_suspend, drv260x_resume);
 
 static const struct i2c_device_id drv260x_id[] = {
 	{ "drv2605l", 0 },
@@ -657,7 +657,7 @@ static struct i2c_driver drv260x_driver = {
 	.driver		= {
 		.name	= "drv260x-haptics",
 		.of_match_table = drv260x_of_match,
-		.pm	= &drv260x_pm_ops,
+		.pm	= pm_sleep_ptr(&drv260x_pm_ops),
 	},
 	.id_table = drv260x_id,
 };
-- 
2.39.0

