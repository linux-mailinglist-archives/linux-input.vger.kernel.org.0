Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF056641E58
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbiLDR4w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbiLDR4Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:25 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4C3140D0
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8C8C4B80B89
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80344C433C1;
        Sun,  4 Dec 2022 17:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176582;
        bh=fy6Qm8//JB92RZWtxsfcCWVK00HVnMmRKB46QXrvF1E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ypec/pJhUdj74wTOnbfHJl9IFdnhPSH/tM5ovNmMZtzc0qGfu0QIpiMafCiYGi5g9
         7elwIQeu5J9ULGFC/w569YQLE6hLfTyekBF8P5ofKPlRAAQIL3ReSwYGGG6mYkBtYE
         o0YE74JKxLFiqxijCfjyDYyIs0pi4uWlZxycZqgI8Qlf6ma8h/+vt7GrrRSFm1PiT+
         sBzWPzuASRk34D4xsu3YvziK2E1dasLKk60aoJoJW7nrkW17IfCZCLyhTM7dNMWJ3P
         DxYEvRbl/aNF/QQp43TsDHu5MwfLADs05lKI50bmJ5BMaXd7F9S4+lE3BB5WsADLm8
         HO71UaF690eyQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 13/32] Input: lm8323 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:22 +0000
Message-Id: <20221204180841.2211588-14-jic23@kernel.org>
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
---
 drivers/input/keyboard/lm8323.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/lm8323.c b/drivers/input/keyboard/lm8323.c
index 4846eccb0a93..5df4d5a7ed9e 100644
--- a/drivers/input/keyboard/lm8323.c
+++ b/drivers/input/keyboard/lm8323.c
@@ -770,7 +770,6 @@ static void lm8323_remove(struct i2c_client *client)
 	kfree(lm);
 }
 
-#ifdef CONFIG_PM_SLEEP
 /*
  * We don't need to explicitly suspend the chip, as it already switches off
  * when there's no activity.
@@ -814,9 +813,8 @@ static int lm8323_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(lm8323_pm_ops, lm8323_suspend, lm8323_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(lm8323_pm_ops, lm8323_suspend, lm8323_resume);
 
 static const struct i2c_device_id lm8323_id[] = {
 	{ "lm8323", 0 },
@@ -826,7 +824,7 @@ static const struct i2c_device_id lm8323_id[] = {
 static struct i2c_driver lm8323_i2c_driver = {
 	.driver = {
 		.name	= "lm8323",
-		.pm	= &lm8323_pm_ops,
+		.pm	= pm_sleep_ptr(&lm8323_pm_ops),
 	},
 	.probe_new	= lm8323_probe,
 	.remove		= lm8323_remove,
-- 
2.38.1

