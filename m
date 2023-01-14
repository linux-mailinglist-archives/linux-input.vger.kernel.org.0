Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA39366ACD7
	for <lists+linux-input@lfdr.de>; Sat, 14 Jan 2023 18:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbjANRDL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Jan 2023 12:03:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbjANRDJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Jan 2023 12:03:09 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DEF4B741
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 09:03:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3E78160C03
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 17:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75DCC433EF;
        Sat, 14 Jan 2023 17:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673715787;
        bh=LmQpRaIX07iuTjVXIPfr7oOuAVUNJPzsLf954XZ+HVk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Jh7zqAU9gVwIY6vzYIGQ6QCZF8sQN0IdfUeJd4e2dNXs45t7dxtKIFPzLJjnEiLYz
         SqpHrP0Z4yYhr9HW0NcYGp2Ygn+fA/Z8OvJyFbuExPot1++et+tK+ej/wVTerCceaj
         eXhOzkJTzSW+3R5lC27IWl626PVFevrH1UyX6b/Ad9uCl4TZCHVh/2mLSgkso5RFv2
         6EmzXP91JmSRTLbhEzrqI9E1vO6JN8GBjKA/wNouieZQuc1g4K8LORxxeVPRkP8VHF
         N6XoGgAmZf3x0LXb3E2oXBsAb6PHU9QMe/FwLopXUfwaqK0I5/0OgD07Pu9+l/zRdv
         i3m9ctBOvbTkg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     jic23@kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 13/16] Input: omap4-keyad - use pm_ptr() and RUNTIME_DEV_PM_OPS()
Date:   Sat, 14 Jan 2023 17:16:17 +0000
Message-Id: <20230114171620.42891-14-jic23@kernel.org>
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

SET_RUNTIME_DEV_PM_OPS() is deprecated as it requires explicit protection
against unused function warnings.  The new combination of pm_ptr()
and RUNTIME_DEV_PM_OPS() allows the compiler to see the functions,
thus suppressing the warning, but still allowing the unused code to be
removed. Thus also drop the __maybe_unused markings.

Note that DEFINE_RUNTIME_DEV_PM_OPS() is not used because that adds
additional callbacks for suspend and resume and would need
testing.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/input/keyboard/omap4-keypad.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
index ee9d04a3f0d5..4426120398b0 100644
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -310,7 +310,7 @@ static int omap4_keypad_check_revision(struct device *dev,
  * Interrupt may not happen for key-up events. We must clear stuck
  * key-up events after the keyboard hardware has auto-idled.
  */
-static int __maybe_unused omap4_keypad_runtime_suspend(struct device *dev)
+static int omap4_keypad_runtime_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct omap4_keypad *keypad_data = platform_get_drvdata(pdev);
@@ -328,7 +328,7 @@ static int __maybe_unused omap4_keypad_runtime_suspend(struct device *dev)
 }
 
 static const struct dev_pm_ops omap4_keypad_pm_ops = {
-	SET_RUNTIME_PM_OPS(omap4_keypad_runtime_suspend, NULL, NULL)
+	RUNTIME_PM_OPS(omap4_keypad_runtime_suspend, NULL, NULL)
 };
 
 static void omap4_disable_pm(void *d)
@@ -488,7 +488,7 @@ static struct platform_driver omap4_keypad_driver = {
 	.driver		= {
 		.name	= "omap4-keypad",
 		.of_match_table = omap_keypad_dt_match,
-		.pm = &omap4_keypad_pm_ops,
+		.pm = pm_ptr(&omap4_keypad_pm_ops),
 	},
 };
 module_platform_driver(omap4_keypad_driver);
-- 
2.39.0

