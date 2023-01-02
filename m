Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE8B65B646
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236420AbjABSGu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236433AbjABSGW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8724C2F5
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 33F1AB80DE1
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D1AC433D2;
        Mon,  2 Jan 2023 18:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682779;
        bh=A3VDr3P6iTDUlRzaCvvkA0+YjH0psQx1Ojm4OakkKgA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m3OTM4/X8GSvXOZwqecv6G589Nu63L2icqTFXfjxFsg/i2R5bSikQABNvSS/ql1Zt
         aP/72H85NJ83SjtwgrooDGoRdDBnLgXjolDWqO9WzVffWQ+DA58VfdjW874OnmndA4
         I5h1gvA/gwdJ94RhadPWXgkTSsF+tKxkQXu4hmlfsvAc4P+b/TfPjvebIBtHOAVfBP
         Q1XBYneEZ1zF2JUD8QskK80yLVeLONDzWLmTPBtUX2AgJJgcLlUzdyb49xNJ73UqBS
         IQek/Mh9m0hhEwlmR1t/ADr5HDqmIUnzl2ylm95ru8jRMTWJcoYnEt4yB0m/qSnlU5
         ynYb7sjKVnAtg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 19/69] Input: pwm-beeper - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:52 +0000
Message-Id: <20230102181842.718010-20-jic23@kernel.org>
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
Cc: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/input/misc/pwm-beeper.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/misc/pwm-beeper.c b/drivers/input/misc/pwm-beeper.c
index d6b12477748a..3cf1812384e6 100644
--- a/drivers/input/misc/pwm-beeper.c
+++ b/drivers/input/misc/pwm-beeper.c
@@ -203,7 +203,7 @@ static int pwm_beeper_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused pwm_beeper_suspend(struct device *dev)
+static int pwm_beeper_suspend(struct device *dev)
 {
 	struct pwm_beeper *beeper = dev_get_drvdata(dev);
 
@@ -221,7 +221,7 @@ static int __maybe_unused pwm_beeper_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused pwm_beeper_resume(struct device *dev)
+static int pwm_beeper_resume(struct device *dev)
 {
 	struct pwm_beeper *beeper = dev_get_drvdata(dev);
 
@@ -235,8 +235,8 @@ static int __maybe_unused pwm_beeper_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(pwm_beeper_pm_ops,
-			 pwm_beeper_suspend, pwm_beeper_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pwm_beeper_pm_ops,
+				pwm_beeper_suspend, pwm_beeper_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id pwm_beeper_match[] = {
@@ -250,7 +250,7 @@ static struct platform_driver pwm_beeper_driver = {
 	.probe	= pwm_beeper_probe,
 	.driver = {
 		.name	= "pwm-beeper",
-		.pm	= &pwm_beeper_pm_ops,
+		.pm	= pm_sleep_ptr(&pwm_beeper_pm_ops),
 		.of_match_table = of_match_ptr(pwm_beeper_match),
 	},
 };
-- 
2.39.0

