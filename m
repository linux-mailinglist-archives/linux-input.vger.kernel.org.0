Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEAD6641E61
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbiLDR4z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbiLDR4a (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80859140CD
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1AEBD60EE7
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DABC433C1;
        Sun,  4 Dec 2022 17:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176588;
        bh=2WR9kOo0nY7FrtMJ1hCnsomQ+6lvIodIoy2y8BxPUyU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FrqI9cXcbZFTkX3L4alWa1YHpS/PyQ331z605Hj1Q1TEu4cY0lJvXdYpHpv/kZIri
         BXrGJFkOpKiOTmI/XfwdG2hYUq6xzqUxOIfcLd4sNXkXH5F2l0CwynR8Pf2oyJKNUD
         pX6Ct2dGEQIkJz3uX5TlDREthzd2EbHL5RhG8YKjn1MBo0a5v1Da1zXBdx0pdHQW1D
         STtXnEsgGM0WN2vLkTCXfLdk7AcoM6QjwZ5gCW21kvl4/liVMat+OuMGGs5fMtbykh
         BPBdHHUws6pYx1D/4skpIR4Yw+xTezn/Cfc5dsFuH/eQfvToBmtTOiY/p25AEzWMBK
         2m1/orX/B0Jww==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 18/32] Input: nomadik-ske-keypad - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:27 +0000
Message-Id: <20221204180841.2211588-19-jic23@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204180841.2211588-1-jic23@kernel.org>
References: <20221204180841.2211588-1-jic23@kernel.org>
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
removed. Thus also drop the ifdef guards.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/keyboard/nomadik-ske-keypad.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/nomadik-ske-keypad.c b/drivers/input/keyboard/nomadik-ske-keypad.c
index 0d55a95347f1..970f2a671c2e 100644
--- a/drivers/input/keyboard/nomadik-ske-keypad.c
+++ b/drivers/input/keyboard/nomadik-ske-keypad.c
@@ -388,7 +388,6 @@ static int ske_keypad_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int ske_keypad_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -416,15 +415,14 @@ static int ske_keypad_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(ske_keypad_dev_pm_ops,
-			 ske_keypad_suspend, ske_keypad_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ske_keypad_dev_pm_ops,
+				ske_keypad_suspend, ske_keypad_resume);
 
 static struct platform_driver ske_keypad_driver = {
 	.driver = {
 		.name = "nmk-ske-keypad",
-		.pm = &ske_keypad_dev_pm_ops,
+		.pm = pm_sleep_ptr(&ske_keypad_dev_pm_ops),
 	},
 	.remove = ske_keypad_remove,
 };
-- 
2.38.1

