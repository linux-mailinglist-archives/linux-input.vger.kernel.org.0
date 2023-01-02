Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 802BD65B641
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232796AbjABSGr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236323AbjABSGO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:14 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5131CC25
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E4D8C61057
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6980FC433D2;
        Mon,  2 Jan 2023 18:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682772;
        bh=J3LJBoT6/HDUpx9uLtOS8a+86h+aDEO8uNeRqLJq5Jk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kzE7SEvxMWA2gDq34QOH/deKdL0EQBtwtWSHOBNXY2Oq79nivUe49Vgv0kL7I5+6h
         +UdBVyGJ/FBDNGDt7A8piFIZMrzw1ydPTyYIj40Et17so0CCfWFLhtfsuYPiuhPvn0
         ns7BHDM3Cqc694mu15eoLFHejJPcIbfZLrZ5/3Pab3onsilB6YtetpYcKss9iMDnNn
         irgUiP7SMsacG8tYYbWNispWqU21t15KpKkLdJ14RQwET3QtNotZWv7QrXmmcESaCs
         YxqTh85zhCeUysNBf4luu+kqh/0g7vWbRPNXzdMGKgK0KwAwVFTfPYfSN6r3bvMUZ0
         I2xj0HpIfcMTA==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 14/69] Input: palmas-pwrbutton - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:47 +0000
Message-Id: <20230102181842.718010-15-jic23@kernel.org>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/input/misc/palmas-pwrbutton.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/misc/palmas-pwrbutton.c b/drivers/input/misc/palmas-pwrbutton.c
index 465e6693077a..7e361727b0d9 100644
--- a/drivers/input/misc/palmas-pwrbutton.c
+++ b/drivers/input/misc/palmas-pwrbutton.c
@@ -266,7 +266,7 @@ static int palmas_pwron_remove(struct platform_device *pdev)
  *
  * Return: 0
  */
-static int __maybe_unused palmas_pwron_suspend(struct device *dev)
+static int palmas_pwron_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct palmas_pwron *pwron = platform_get_drvdata(pdev);
@@ -287,7 +287,7 @@ static int __maybe_unused palmas_pwron_suspend(struct device *dev)
  *
  * Return: 0
  */
-static int __maybe_unused palmas_pwron_resume(struct device *dev)
+static int palmas_pwron_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct palmas_pwron *pwron = platform_get_drvdata(pdev);
@@ -298,8 +298,8 @@ static int __maybe_unused palmas_pwron_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(palmas_pwron_pm,
-			 palmas_pwron_suspend, palmas_pwron_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(palmas_pwron_pm,
+				palmas_pwron_suspend, palmas_pwron_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id of_palmas_pwr_match[] = {
@@ -316,7 +316,7 @@ static struct platform_driver palmas_pwron_driver = {
 	.driver	= {
 		.name	= "palmas_pwrbutton",
 		.of_match_table = of_match_ptr(of_palmas_pwr_match),
-		.pm	= &palmas_pwron_pm,
+		.pm	= pm_sleep_ptr(&palmas_pwron_pm),
 	},
 };
 module_platform_driver(palmas_pwron_driver);
-- 
2.39.0

