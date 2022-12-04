Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8318641E6B
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbiLDR46 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbiLDR4e (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:34 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40813140D0
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CFBF260EDC
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79189C433D7;
        Sun,  4 Dec 2022 17:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176593;
        bh=CnxH2NeO2cSF4u8gQi3M8DSZxK3l+bCBIn1JqqrbXhg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ht1zLNC6BNUlDB5rpJNaYToUvP8mvjRNhte0uEdIwD7Zs37lZvK6IUTRpMwV0dq/0
         UiamqMWnKph2sQFAs6QWZlGoj4/hWtNuKO+r01MPs1wMMsA9LRuuOPaAYWtO+FLHjH
         Hk7f8Tsa0OQywhrmYVs+D414mUJy0s3R/nt2cbEB2BOQEaNnmcDlMjXqHRlHJCy+Xn
         ZKCDZpSbmZt9QuMX6+ii+QG1W7me4AHIKdwUW/RDVynxYmHUSqQavxdQ/swYQeYttw
         ZA83S66T3H2VAchEeEpmkst3ZXWFGMorBzic4BFFxGGFkA1pZ1dPUrz2VvKk5j7J/7
         1h0MXMlBwQPnw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 22/32] Input: sh-keysc - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:31 +0000
Message-Id: <20221204180841.2211588-23-jic23@kernel.org>
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
 drivers/input/keyboard/sh_keysc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/sh_keysc.c b/drivers/input/keyboard/sh_keysc.c
index c155adebf96e..2c00320f739f 100644
--- a/drivers/input/keyboard/sh_keysc.c
+++ b/drivers/input/keyboard/sh_keysc.c
@@ -283,7 +283,6 @@ static int sh_keysc_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int sh_keysc_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -316,17 +315,16 @@ static int sh_keysc_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(sh_keysc_dev_pm_ops,
-			 sh_keysc_suspend, sh_keysc_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(sh_keysc_dev_pm_ops,
+				sh_keysc_suspend, sh_keysc_resume);
 
 static struct platform_driver sh_keysc_device_driver = {
 	.probe		= sh_keysc_probe,
 	.remove		= sh_keysc_remove,
 	.driver		= {
 		.name	= "sh_keysc",
-		.pm	= &sh_keysc_dev_pm_ops,
+		.pm	= pm_sleep_ptr(&sh_keysc_dev_pm_ops),
 	}
 };
 module_platform_driver(sh_keysc_device_driver);
-- 
2.38.1

