Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6994D65B647
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236482AbjABSGw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236452AbjABSGY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:24 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FDAADAD
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 10B2361084
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CD3C433F0;
        Mon,  2 Jan 2023 18:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682782;
        bh=+ch5UtL+cUuPYvpicRKC+EljnWwBiDjO5qkHl2IAZ9w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TcDxTHnD0wwhjkUo+Fp6nTLFSMjCXn4C/08DcgksOYi5puuCZZqnEMS5JQaTtElIz
         PfMzVIY1U7x5kdy8AUbuKUfWa2pyM6yMycjWKO8PS9+l1LSlC10JFwX09Ch9HWYA/0
         N+pKXJ3SjnYVTo2HeqtFrd2HPPBgmCuhuPoJcjl/BneC12xA9j2irnfXQd3lDYpof+
         XZzPp/ymEMbCK+b/sbS4rsSuiVbkDc/K93ODo3ClJlR4Qoy75Z959OsK3yr03plIDJ
         G/X+omuy1mhlnTObcqY0xenhXfosSonnd/f31my6cFOeSiT7sejdRSRpBUMM/UPQmD
         RQcuYvqxSQYAQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 22/69] Input: rotary-encoder - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:55 +0000
Message-Id: <20230102181842.718010-23-jic23@kernel.org>
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
---
 drivers/input/misc/rotary_encoder.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/misc/rotary_encoder.c b/drivers/input/misc/rotary_encoder.c
index 6d613f2a017c..22ec62083065 100644
--- a/drivers/input/misc/rotary_encoder.c
+++ b/drivers/input/misc/rotary_encoder.c
@@ -317,7 +317,7 @@ static int rotary_encoder_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused rotary_encoder_suspend(struct device *dev)
+static int rotary_encoder_suspend(struct device *dev)
 {
 	struct rotary_encoder *encoder = dev_get_drvdata(dev);
 	unsigned int i;
@@ -330,7 +330,7 @@ static int __maybe_unused rotary_encoder_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rotary_encoder_resume(struct device *dev)
+static int rotary_encoder_resume(struct device *dev)
 {
 	struct rotary_encoder *encoder = dev_get_drvdata(dev);
 	unsigned int i;
@@ -343,8 +343,8 @@ static int __maybe_unused rotary_encoder_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(rotary_encoder_pm_ops,
-			 rotary_encoder_suspend, rotary_encoder_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(rotary_encoder_pm_ops,
+				rotary_encoder_suspend, rotary_encoder_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id rotary_encoder_of_match[] = {
@@ -358,7 +358,7 @@ static struct platform_driver rotary_encoder_driver = {
 	.probe		= rotary_encoder_probe,
 	.driver		= {
 		.name	= DRV_NAME,
-		.pm	= &rotary_encoder_pm_ops,
+		.pm	= pm_sleep_ptr(&rotary_encoder_pm_ops),
 		.of_match_table = of_match_ptr(rotary_encoder_of_match),
 	}
 };
-- 
2.39.0

