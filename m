Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E44866ACD9
	for <lists+linux-input@lfdr.de>; Sat, 14 Jan 2023 18:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbjANRDP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Jan 2023 12:03:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbjANRDO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Jan 2023 12:03:14 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FBFAA5F8
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 09:03:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B8572B808C2
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 17:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631F5C433EF;
        Sat, 14 Jan 2023 17:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673715790;
        bh=NjxMr2BSrLQyoYZ3Vd27E3CVhskIRyThLT7OGShFHS8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jhfqi5ae1G63MMVtkGLNdY9LIx/Tbtg7E2FPi7GcQ2m3p0+16/NPomCKz+XsWTNRV
         bGx0xFQNwO3R41fDWJbq9RTjhiWwjRUExpy6InGLpDsLyJxPJImXHQpMXtUmQCvsfy
         wt0JvJuJ1Q/B5qiPy2YZu3x3VIZv99GM8KMS/KDUxtOtV+eHCCHkfC21H7zpfg0jO1
         sDUf4xBQNNxPTbR0FLd1q+5OItQLtqx+BXNp+kpuCR5V3bPUvD8reOzAGMQsEqyq3r
         MgP5F9FmcK7uXskSi+T/csM5djrn7CeeLwcBgXKUyGqv5W0oEnI/dlvbwBtdf5quZM
         Q0Cv0ne2qDyDA==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     jic23@kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 15/16] Input: cma3000 - use pm_sleep_ptr() to allow removal of ifdef CONFIG_PM guards
Date:   Sat, 14 Jan 2023 17:16:19 +0000
Message-Id: <20230114171620.42891-16-jic23@kernel.org>
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

As the guards only apply to suspend and resume, #ifdef CONFIG_PM_SLEEP
would have been a tighter protection. As pm_sleep_ptr() lets the compiler
see the protected ops structure and callbacks but also lets the compiler
remove it as unused code if !CONFIG_PM_SLEEP this allows the #ifdef
guards to be removed, slightly simplifying the resulting code.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

--
It seems likely that DEFINE_SIMPLE_DEV_PM_OPS() would work here but
I'd prefer not to make that change unless someone can confirm that the
extra callbacks registered will have no unwanted side effects in this
driver.
---
 drivers/input/misc/cma3000_d0x_i2c.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/input/misc/cma3000_d0x_i2c.c b/drivers/input/misc/cma3000_d0x_i2c.c
index 75442c1230b1..136eb3715870 100644
--- a/drivers/input/misc/cma3000_d0x_i2c.c
+++ b/drivers/input/misc/cma3000_d0x_i2c.c
@@ -64,7 +64,6 @@ static void cma3000_i2c_remove(struct i2c_client *client)
 	cma3000_exit(data);
 }
 
-#ifdef CONFIG_PM
 static int cma3000_i2c_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -89,7 +88,6 @@ static const struct dev_pm_ops cma3000_i2c_pm_ops = {
 	.suspend	= cma3000_i2c_suspend,
 	.resume		= cma3000_i2c_resume,
 };
-#endif
 
 static const struct i2c_device_id cma3000_i2c_id[] = {
 	{ "cma3000_d01", 0 },
@@ -104,9 +102,7 @@ static struct i2c_driver cma3000_i2c_driver = {
 	.id_table	= cma3000_i2c_id,
 	.driver = {
 		.name	= "cma3000_i2c_accl",
-#ifdef CONFIG_PM
-		.pm	= &cma3000_i2c_pm_ops,
-#endif
+		.pm	= pm_sleep_ptr(&cma3000_i2c_pm_ops),
 	},
 };
 
-- 
2.39.0

