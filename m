Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60FAF641E67
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbiLDR44 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230296AbiLDR4d (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:33 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C44140D2
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A460160EE7
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A462C433D6;
        Sun,  4 Dec 2022 17:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176592;
        bh=pqJfGsQ3XwlQtiiA8BbghJui3arS74gMf/3FN6Kc+5A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f9NrkQ+tifCU/FXfBgCUnGZl2iyrf6RIQRBRuMW4sf9l7Pxq9IOXoF8DT46+VR8ad
         u+g0WfhTRSK/AnOlz1fQM7M3iH09iYCpq+dMX8iOg/MtzlNjt7TDIUWqADUntntJbk
         8mh5asR4aS57UFFLZVEYdKkhBpUncEVBQla497poyPtsVdUhTYZd6Q5AqAhjzJA01n
         zWNvzuPTUvvEXlmsfBkAvgsij0Uh2dd7s4g8TGHaKqFCITZ3lMAu9jqmUiv9fYsKnK
         +s6Zz7scbelRdp4KWG9JDoVj3UeqEXLHE3yMKOeAW3klsZBJxocHd1OHVAQlC6L1XK
         2gJaK7kxlVVRA==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 21/32] Input: qt1070 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:30 +0000
Message-Id: <20221204180841.2211588-22-jic23@kernel.org>
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
 drivers/input/keyboard/qt1070.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/qt1070.c b/drivers/input/keyboard/qt1070.c
index 533bb0375223..fabb50bde844 100644
--- a/drivers/input/keyboard/qt1070.c
+++ b/drivers/input/keyboard/qt1070.c
@@ -226,7 +226,6 @@ static void qt1070_remove(struct i2c_client *client)
 	kfree(data);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int qt1070_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -248,9 +247,8 @@ static int qt1070_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(qt1070_pm_ops, qt1070_suspend, qt1070_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(qt1070_pm_ops, qt1070_suspend, qt1070_resume);
 
 static const struct i2c_device_id qt1070_id[] = {
 	{ "qt1070", 0 },
@@ -270,7 +268,7 @@ static struct i2c_driver qt1070_driver = {
 	.driver	= {
 		.name	= "qt1070",
 		.of_match_table = of_match_ptr(qt1070_of_match),
-		.pm	= &qt1070_pm_ops,
+		.pm	= pm_sleep_ptr(&qt1070_pm_ops),
 	},
 	.id_table	= qt1070_id,
 	.probe_new	= qt1070_probe,
-- 
2.38.1

