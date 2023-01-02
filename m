Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7610465B638
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236234AbjABSGL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234558AbjABSGC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:02 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98983626A
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 37CBD61093
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF2EC433F0;
        Mon,  2 Jan 2023 18:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682760;
        bh=l2NcdvkQRpDh5XF6l2Oj+NMh4/PHJMd27ZIIZThO760=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KCEu37yWojvITireKnBs7biaIKaj7H/K9UM1JNxoGLtmKbSrcQ+wkPN2yEP64K1/N
         5TYsrkx67JLAQMMviXmwvJTGeZEOLssGtDgrAHyidHQmDCCRgfCChxRpdpke28+TBb
         0A5LyTIIt1O2Z8DWXPePhVwXfMkWY6YeT65RIpFtQ4sJ7NyG1QcAABdGwRGj9c+ZNw
         Ta0szeBHe5NyI+siywM1o/Q0QwcNXvtH37K353lLwvWszPY5CSDc6h28rePS83QJDC
         6jwfIrWx8fVJTYE7nNhKzCTG3Eycf0D9XeHevdVCVIAB5xYK/fWSOriaw+JzPMpJUm
         EkVjpTwd9JDnw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 05/69] Input: drv2667 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:38 +0000
Message-Id: <20230102181842.718010-6-jic23@kernel.org>
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
 drivers/input/misc/drv2667.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/drv2667.c b/drivers/input/misc/drv2667.c
index da7ac63dce4c..88b4dbe3e5b5 100644
--- a/drivers/input/misc/drv2667.c
+++ b/drivers/input/misc/drv2667.c
@@ -399,7 +399,7 @@ static int drv2667_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused drv2667_suspend(struct device *dev)
+static int drv2667_suspend(struct device *dev)
 {
 	struct drv2667_data *haptics = dev_get_drvdata(dev);
 	int ret = 0;
@@ -428,7 +428,7 @@ static int __maybe_unused drv2667_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused drv2667_resume(struct device *dev)
+static int drv2667_resume(struct device *dev)
 {
 	struct drv2667_data *haptics = dev_get_drvdata(dev);
 	int ret = 0;
@@ -457,7 +457,7 @@ static int __maybe_unused drv2667_resume(struct device *dev)
 	return ret;
 }
 
-static SIMPLE_DEV_PM_OPS(drv2667_pm_ops, drv2667_suspend, drv2667_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(drv2667_pm_ops, drv2667_suspend, drv2667_resume);
 
 static const struct i2c_device_id drv2667_id[] = {
 	{ "drv2667", 0 },
@@ -478,7 +478,7 @@ static struct i2c_driver drv2667_driver = {
 	.driver		= {
 		.name	= "drv2667-haptics",
 		.of_match_table = of_match_ptr(drv2667_of_match),
-		.pm	= &drv2667_pm_ops,
+		.pm	= pm_sleep_ptr(&drv2667_pm_ops),
 	},
 	.id_table = drv2667_id,
 };
-- 
2.39.0

