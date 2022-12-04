Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 059A0641E69
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbiLDR46 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbiLDR4h (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:37 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13058140D2
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B9306B80B89
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C58C433B5;
        Sun,  4 Dec 2022 17:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176594;
        bh=gKIvMf4wVEHJ4qJUOqbOF0pyWbzOSoVIFHxEQQklGi0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sZOVfYLFBGZ74W5Mxr/xy3KaPzyfzTD+LkGZRZxh8F7OSUQLXWI5LoLo+0w/mpyli
         VYu+0NsYUbRjCN3+xuuJIHrP339gl2ohTqHmI3C9jE2VNpwpKIatExDoNXf8FHqrLV
         jmhUNleneKhMVd2eD1cBmhI1sh0kXxfhTsyIh/XKJn/cSKc8dLj+MoVqzeU1bremzR
         BTOv/ojp5D9Y9dE2RDQoUocFmZ8qTkbud8fxrHlGAYkTc76XsztGkp1sAa7xjXq3gl
         TK9JoXSb+qGEt3ajQ/hsfCm1RFl43TEXIPvusrxQkBrwr26feEglAHZ6XhgaJpzTIg
         Z7ZUKZtOEtdNg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 23/32] Input: st-keyscan - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:32 +0000
Message-Id: <20221204180841.2211588-24-jic23@kernel.org>
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
 drivers/input/keyboard/st-keyscan.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/st-keyscan.c b/drivers/input/keyboard/st-keyscan.c
index a62bb8fff88c..13735a5e8391 100644
--- a/drivers/input/keyboard/st-keyscan.c
+++ b/drivers/input/keyboard/st-keyscan.c
@@ -212,7 +212,6 @@ static int keyscan_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int keyscan_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -247,9 +246,9 @@ static int keyscan_resume(struct device *dev)
 	mutex_unlock(&input->mutex);
 	return retval;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(keyscan_dev_pm_ops, keyscan_suspend, keyscan_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(keyscan_dev_pm_ops,
+				keyscan_suspend, keyscan_resume);
 
 static const struct of_device_id keyscan_of_match[] = {
 	{ .compatible = "st,sti-keyscan" },
@@ -261,7 +260,7 @@ static struct platform_driver keyscan_device_driver = {
 	.probe		= keyscan_probe,
 	.driver		= {
 		.name	= "st-keyscan",
-		.pm	= &keyscan_dev_pm_ops,
+		.pm	= pm_sleep_ptr(&keyscan_dev_pm_ops),
 		.of_match_table = of_match_ptr(keyscan_of_match),
 	}
 };
-- 
2.38.1

