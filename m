Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8580A66ACDA
	for <lists+linux-input@lfdr.de>; Sat, 14 Jan 2023 18:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbjANRDR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Jan 2023 12:03:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbjANRDP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Jan 2023 12:03:15 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7344830DB
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 09:03:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2E14BB80938
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 17:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3391C433D2;
        Sat, 14 Jan 2023 17:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673715791;
        bh=KxjPv6ueFUfWu6l2frfr+Nr23nCmoR9EN/JPsNdBiww=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S0wbv4HJFFNB+tm2FjXDQ+KOKzKWAhNJYTUm81wAbMh0Rrz9vu6bnAyM8ugbS/L1Q
         ynaVSBitzJ/5aKwBnUS57qs57UnPSqPSUyY7PKUHRd4xOPfjm0vtFFWNqa9dvYtrb6
         chvcuULMHT41f3Do83h0eTNyhRhxpy2+hfr5sRKsC+o0rp/yEw531yaktr+jVyILRB
         +TYwsS2yjN8Zd7Oh1oN8CTO0lFmpMc/MFR4y8nKHdPNj6Qljs88892/bjnL8VuuAmz
         F+Nm8oxxbKPLquSy6Ja3YgUuwvRoHn5KBiYvh8drVeHq85xt3veeOnqPNSpDJCxMJq
         8Z3pqzrVMV2kQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     jic23@kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 16/16] Input: wistron_btns -  use pm_sleep_ptr() to allow removal of ifdef CONFIG_PM guards
Date:   Sat, 14 Jan 2023 17:16:20 +0000
Message-Id: <20230114171620.42891-17-jic23@kernel.org>
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
 drivers/input/misc/wistron_btns.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/input/misc/wistron_btns.c b/drivers/input/misc/wistron_btns.c
index 80dfd72a02d3..111cb70cde46 100644
--- a/drivers/input/misc/wistron_btns.c
+++ b/drivers/input/misc/wistron_btns.c
@@ -1295,7 +1295,6 @@ static int wistron_remove(struct platform_device *dev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int wistron_suspend(struct device *dev)
 {
 	if (have_wifi)
@@ -1330,14 +1329,11 @@ static const struct dev_pm_ops wistron_pm_ops = {
 	.poweroff	= wistron_suspend,
 	.restore	= wistron_resume,
 };
-#endif
 
 static struct platform_driver wistron_driver = {
 	.driver		= {
 		.name	= "wistron-bios",
-#ifdef CONFIG_PM
-		.pm	= &wistron_pm_ops,
-#endif
+		.pm	= pm_sleep_ptr(&wistron_pm_ops),
 	},
 	.probe		= wistron_probe,
 	.remove		= wistron_remove,
-- 
2.39.0

