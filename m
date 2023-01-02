Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8EA65B637
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234558AbjABSGL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236298AbjABSGF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:05 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE5FBF54
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 68BC1B80D0D
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA25C433EF;
        Mon,  2 Jan 2023 18:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682762;
        bh=yTeszxuvQgDKdYT0ragnF3gBuF2JkNE+uL9JVBLje98=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kFQuUNicUmbVfjIMNqIRCMVxs/t3iiIOQMDmrWU/ZG4Uju5Mxz3LYFPDkt9j5tqbi
         BVJ3aN714lD4b2LDPI3FtFosHN1ANfrWUDNcQBEdI3vH4o7YkKzeElbPfQALnmEUej
         qmioTzA/RLO70omYgvcPK8NCbrlr+t9arqnIc1sTv/5GNdHp+lN1jLAhiwQSrv/lr2
         8meT1wjSYZ5ekq3VSZfvElIkMMlRH5nq40ozHjZilL5Wn0nU5g3h6xFZ6OKAyWdTMs
         PCwJPqNLGOe8bKCW8pDtvXJH4Y6Fi6gqXoqIK7CZ2jfTfPtnx3jBBwRwdNMo6EFagZ
         /sw2pp5eB6f1A==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Moritz Fischer <mdf@kernel.org>
Subject: [PATCH 06/69] Input: e3x0-button - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:39 +0000
Message-Id: <20230102181842.718010-7-jic23@kernel.org>
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
Cc: Moritz Fischer <mdf@kernel.org>
---
 drivers/input/misc/e3x0-button.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/misc/e3x0-button.c b/drivers/input/misc/e3x0-button.c
index e2fde6e1553f..5bd527117470 100644
--- a/drivers/input/misc/e3x0-button.c
+++ b/drivers/input/misc/e3x0-button.c
@@ -35,7 +35,7 @@ static irqreturn_t e3x0_button_press_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int __maybe_unused e3x0_button_suspend(struct device *dev)
+static int e3x0_button_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 
@@ -45,7 +45,7 @@ static int __maybe_unused e3x0_button_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused e3x0_button_resume(struct device *dev)
+static int e3x0_button_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 
@@ -55,8 +55,8 @@ static int __maybe_unused e3x0_button_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(e3x0_button_pm_ops,
-			 e3x0_button_suspend, e3x0_button_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(e3x0_button_pm_ops,
+				e3x0_button_suspend, e3x0_button_resume);
 
 static int e3x0_button_probe(struct platform_device *pdev)
 {
@@ -122,7 +122,7 @@ static struct platform_driver e3x0_button_driver = {
 	.driver		= {
 		.name	= "e3x0-button",
 		.of_match_table = of_match_ptr(e3x0_button_match),
-		.pm	= &e3x0_button_pm_ops,
+		.pm	= pm_sleep_ptr(&e3x0_button_pm_ops),
 	},
 	.probe		= e3x0_button_probe,
 };
-- 
2.39.0

