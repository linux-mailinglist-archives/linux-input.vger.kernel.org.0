Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47986641E4F
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbiLDR4N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbiLDR4M (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:12 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C50C140D2
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D7285B80B8D
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F15C433D6;
        Sun,  4 Dec 2022 17:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176569;
        bh=Anw1KIhTev3BF6tVyrUuETRFTSG+rjBk7qNfiy7pw2c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rJGuAFnYQzAe5PMXyBD6YYg8EWj2xcReqERZBcf0Kbe9unCBtBV1VfMOBoG2vTVbn
         VDlMcMYPg9Wlmqt+9TbPofZ7s3b6WhICMvTtFutspVxGuhRn58c9tVrvnlMUPRzKIs
         gkhhg8YxV3NQqRQS/iDxcT+yjNYnOLmFky9kwCu5BbmG3lbTiZ2lW99rzo4OR50YdL
         G1h7qe1QB0y2DzfykrZVqWKDEltzVQ4tJi1aogLkVrnnwvUkfCHbQs03zYfR7STdGf
         ORpsy7NDX4jErulC8wN+Ml/TsCpiexf0q7eQIUwyu4oTMnIojEJbMh1ez0PZ+APu5x
         EEqb1xjRtWBQA==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 03/32] Input: cros-ec-keyb - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:12 +0000
Message-Id: <20221204180841.2211588-4-jic23@kernel.org>
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
removed. Thus also drop the __maybe_unused markings.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Stephen Boyd <swboyd@chromium.org>
---
 drivers/input/keyboard/cros_ec_keyb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index c14136b733a9..6f435125ec03 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -415,7 +415,7 @@ static int cros_ec_keyb_query_switches(struct cros_ec_keyb *ckdev)
  *
  * Returns 0 if no error or -error upon error.
  */
-static __maybe_unused int cros_ec_keyb_resume(struct device *dev)
+static int cros_ec_keyb_resume(struct device *dev)
 {
 	struct cros_ec_keyb *ckdev = dev_get_drvdata(dev);
 
@@ -760,7 +760,7 @@ static const struct of_device_id cros_ec_keyb_of_match[] = {
 MODULE_DEVICE_TABLE(of, cros_ec_keyb_of_match);
 #endif
 
-static SIMPLE_DEV_PM_OPS(cros_ec_keyb_pm_ops, NULL, cros_ec_keyb_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(cros_ec_keyb_pm_ops, NULL, cros_ec_keyb_resume);
 
 static struct platform_driver cros_ec_keyb_driver = {
 	.probe = cros_ec_keyb_probe,
@@ -769,7 +769,7 @@ static struct platform_driver cros_ec_keyb_driver = {
 		.name = "cros-ec-keyb",
 		.of_match_table = of_match_ptr(cros_ec_keyb_of_match),
 		.acpi_match_table = ACPI_PTR(cros_ec_keyb_acpi_match),
-		.pm = &cros_ec_keyb_pm_ops,
+		.pm = pm_sleep_ptr(&cros_ec_keyb_pm_ops),
 	},
 };
 
-- 
2.38.1

