Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97D79641E5D
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbiLDR4x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbiLDR41 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:27 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C1C140CD
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 205D8B80B8A
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7283C433C1;
        Sun,  4 Dec 2022 17:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176584;
        bh=9lLSaUUPEH0GXqgySigGjoaOcjTG/JbDCrjpOyjkK7w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kmyuIFv73eUxAwCekcJa2Gujopt5XGcrUWQdcvHIBGXRo6sw2VghlfKuaPB8xNNRV
         JYP/x3S6nI7PF2ls5zp1jvw9DSzNRc3LwOmObHGp68cMycon+OJFARh4zyZGPGfQoI
         TZb7U8l06VpkzhgmZY7g4qly6zczDpaj/LKxv5y3YWPvhxosnGcFOKN85zJR9zNIhZ
         RpGrHEdXn8Jmq/xvc6iuWNVplSR1dE2KR+i+rCj7Uw8vUFn5o5xQS0LivYh5fYa43Y
         t2qsYH3Uri9swZlQPdpI7WY0aJGNJtWyNVUJi39SjKkJ0ZY42yggWQqQ4NRalbp356
         4Q+s+/JeEU08Q==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 15/32] Input: matrix-keypad - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:24 +0000
Message-Id: <20221204180841.2211588-16-jic23@kernel.org>
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
Cc: Marek Vasut <marek.vasut@gmail.com>
---
 drivers/input/keyboard/matrix_keypad.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index b4c0325bbf1a..203310727d88 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -230,7 +230,6 @@ static void matrix_keypad_stop(struct input_dev *dev)
 	disable_row_irqs(keypad);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static void matrix_keypad_enable_wakeup(struct matrix_keypad *keypad)
 {
 	const struct matrix_keypad_platform_data *pdata = keypad->pdata;
@@ -299,10 +298,9 @@ static int matrix_keypad_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(matrix_keypad_pm_ops,
-			 matrix_keypad_suspend, matrix_keypad_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(matrix_keypad_pm_ops,
+				matrix_keypad_suspend, matrix_keypad_resume);
 
 static int matrix_keypad_init_gpio(struct platform_device *pdev,
 				   struct matrix_keypad *keypad)
@@ -577,7 +575,7 @@ static struct platform_driver matrix_keypad_driver = {
 	.remove		= matrix_keypad_remove,
 	.driver		= {
 		.name	= "matrix-keypad",
-		.pm	= &matrix_keypad_pm_ops,
+		.pm	= pm_sleep_ptr(&matrix_keypad_pm_ops),
 		.of_match_table = of_match_ptr(matrix_keypad_dt_match),
 	},
 };
-- 
2.38.1

