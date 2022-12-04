Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72656641E70
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbiLDR5A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:57:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbiLDR4k (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85BA7140D0
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 39CE0B80B8C
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D41CC433C1;
        Sun,  4 Dec 2022 17:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176597;
        bh=es+q7h2YGeWq9XshkCivTogjo/hEOQ+U4iQW7XOvkqw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M2qFLzW9XehAxz+qNkR9x3c/pkPjy4nTwriP3cIUKoBNboWNt5yhKXEFw4pEDonVb
         bCVpXp/2tekvyYzVLIudeNwDvuJ+oBxcKZWUGgTMMZUuE1JcDHw6g+xnkEKxeKMaBq
         de0Mlm6VLSMg7tpu8NwkMQlk8G3GF2Z3yfQjoJ3uPPQsG/IqZazqY1EYOa/2oD0Fy1
         Ewu2cgzMb7AVAAXllJOdxDpfU0jeWrCrNhbLGsEhDeuUF7MraAORki0S9n972CkONy
         J+Gk5fmxpR9TfjqI7vOb9vlTWZi9PnFSDhQZ577sn3WbZgmgUQ+mESBTXzscp5urs6
         yzmiDvUIlF8gA==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 25/32] Input: tca6416-keypad - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:34 +0000
Message-Id: <20221204180841.2211588-26-jic23@kernel.org>
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
 drivers/input/keyboard/tca6416-keypad.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/tca6416-keypad.c b/drivers/input/keyboard/tca6416-keypad.c
index 281d9ec163cc..673b905af6fe 100644
--- a/drivers/input/keyboard/tca6416-keypad.c
+++ b/drivers/input/keyboard/tca6416-keypad.c
@@ -320,7 +320,6 @@ static void tca6416_keypad_remove(struct i2c_client *client)
 	kfree(chip);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int tca6416_keypad_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -342,15 +341,14 @@ static int tca6416_keypad_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(tca6416_keypad_dev_pm_ops,
-			 tca6416_keypad_suspend, tca6416_keypad_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(tca6416_keypad_dev_pm_ops,
+				tca6416_keypad_suspend, tca6416_keypad_resume);
 
 static struct i2c_driver tca6416_keypad_driver = {
 	.driver = {
 		.name	= "tca6416-keypad",
-		.pm	= &tca6416_keypad_dev_pm_ops,
+		.pm	= pm_sleep_ptr(&tca6416_keypad_dev_pm_ops),
 	},
 	.probe_new	= tca6416_keypad_probe,
 	.remove		= tca6416_keypad_remove,
-- 
2.38.1

