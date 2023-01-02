Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C13B65B672
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236388AbjABSHd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236451AbjABSHU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A87855BB
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 48DE4B80DF0
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF59C433D2;
        Mon,  2 Jan 2023 18:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682837;
        bh=Y1Csk/jAlhoN8DqbAw4sHvp8m2skPk4TUsUXQnDQQk8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NJAFFQCkOEQGrYnCVk3OOcOnJU77xEZZIz+NzPNq87XVFaqD2xsCt3AYoREdsh/vi
         QL6NxRDXnU+AsK331qgduj/L0MqOqRSOvykImKF9Ne5Drp/2YAGGVbbL9UXTJ8ECzb
         laMM5I6MDuvNOA/i26gKNkB9YprOJ2ZU6CXBo/7Vch2qMluLLOCqX+VLOZ/NbllW+k
         PI5Is+zZTFKWu6Lni4KFhYzypskpsDEaot0XkagO6sg/luVD9AuC4MQEghvreX2x8N
         TVxnJkIOAT6DXjccXXW7GNzd4jSY+X0kpFTCnoIE0yWep/XLdes2qY9MDIGgIId0wE
         9IWZD6IjftBeA==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 63/69] Input: ucb1400_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:36 +0000
Message-Id: <20230102181842.718010-64-jic23@kernel.org>
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
 drivers/input/touchscreen/ucb1400_ts.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/ucb1400_ts.c b/drivers/input/touchscreen/ucb1400_ts.c
index dfd3b35590c3..1b3d1df231bb 100644
--- a/drivers/input/touchscreen/ucb1400_ts.c
+++ b/drivers/input/touchscreen/ucb1400_ts.c
@@ -401,7 +401,7 @@ static int ucb1400_ts_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused ucb1400_ts_suspend(struct device *dev)
+static int ucb1400_ts_suspend(struct device *dev)
 {
 	struct ucb1400_ts *ucb = dev_get_platdata(dev);
 	struct input_dev *idev = ucb->ts_idev;
@@ -415,7 +415,7 @@ static int __maybe_unused ucb1400_ts_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ucb1400_ts_resume(struct device *dev)
+static int ucb1400_ts_resume(struct device *dev)
 {
 	struct ucb1400_ts *ucb = dev_get_platdata(dev);
 	struct input_dev *idev = ucb->ts_idev;
@@ -429,15 +429,15 @@ static int __maybe_unused ucb1400_ts_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(ucb1400_ts_pm_ops,
-			 ucb1400_ts_suspend, ucb1400_ts_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ucb1400_ts_pm_ops,
+				ucb1400_ts_suspend, ucb1400_ts_resume);
 
 static struct platform_driver ucb1400_ts_driver = {
 	.probe	= ucb1400_ts_probe,
 	.remove	= ucb1400_ts_remove,
 	.driver	= {
 		.name	= "ucb1400_ts",
-		.pm	= &ucb1400_ts_pm_ops,
+		.pm	= pm_sleep_ptr(&ucb1400_ts_pm_ops),
 	},
 };
 module_platform_driver(ucb1400_ts_driver);
-- 
2.39.0

