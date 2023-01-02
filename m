Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5A665B63A
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232791AbjABSGl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236341AbjABSGG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1945B864
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7C6F261038
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C53C433EF;
        Mon,  2 Jan 2023 18:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682764;
        bh=48X3gboWU9P9WuSgH/w8NQHXmTlL1ep2bZ4rwTZotP4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Rd7dvOop7ABUNAJPNkr4D+3GI+9VNubiCymHgoKWz/buO2663Okl8dHN9L+C2c1f/
         WGrqT75mI+pWa8hamEXo/KhY726ITLfnxIn30QR8rIwhqr9QsQvN/BzrmqPRguyg6U
         wsbu2OXBpj3AHAaGr0xnx1B7wtjAgMYN6Ze/WpL5P5MwlA5UEkFnRBb/P+eW+7nece
         6H+2cyGhoNZ8KZ9yPjqsllo9EdANnkgQdtzilX6tWRWDg3QlAxW225eGtKspzUqxSQ
         rLuhZy3NaZ7fEPhnEm7zONqJ2YfvC8HUghFq5yKvumMwcbJJJOcStGZDBanrbfPcAU
         jJLw4eUMhkvng==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 08/69] Input: iqs269a - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:41 +0000
Message-Id: <20230102181842.718010-9-jic23@kernel.org>
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
Cc: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs269a.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index a348247d3d38..8348d8c85e1d 100644
--- a/drivers/input/misc/iqs269a.c
+++ b/drivers/input/misc/iqs269a.c
@@ -1697,7 +1697,7 @@ static int iqs269_probe(struct i2c_client *client)
 	return error;
 }
 
-static int __maybe_unused iqs269_suspend(struct device *dev)
+static int iqs269_suspend(struct device *dev)
 {
 	struct iqs269_private *iqs269 = dev_get_drvdata(dev);
 	struct i2c_client *client = iqs269->client;
@@ -1756,7 +1756,7 @@ static int __maybe_unused iqs269_suspend(struct device *dev)
 	return error;
 }
 
-static int __maybe_unused iqs269_resume(struct device *dev)
+static int iqs269_resume(struct device *dev)
 {
 	struct iqs269_private *iqs269 = dev_get_drvdata(dev);
 	struct i2c_client *client = iqs269->client;
@@ -1803,7 +1803,7 @@ static int __maybe_unused iqs269_resume(struct device *dev)
 	return error;
 }
 
-static SIMPLE_DEV_PM_OPS(iqs269_pm, iqs269_suspend, iqs269_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(iqs269_pm, iqs269_suspend, iqs269_resume);
 
 static const struct of_device_id iqs269_of_match[] = {
 	{ .compatible = "azoteq,iqs269a" },
@@ -1815,7 +1815,7 @@ static struct i2c_driver iqs269_i2c_driver = {
 	.driver = {
 		.name = "iqs269a",
 		.of_match_table = iqs269_of_match,
-		.pm = &iqs269_pm,
+		.pm = pm_sleep_ptr(&iqs269_pm),
 	},
 	.probe_new = iqs269_probe,
 };
-- 
2.39.0

