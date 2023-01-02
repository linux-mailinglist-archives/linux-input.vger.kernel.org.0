Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA1F65B64A
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236505AbjABSGx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236440AbjABSGZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4ABE625E
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7359B61057
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E165BC433EF;
        Mon,  2 Jan 2023 18:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682783;
        bh=j0NIpOWit3G+Wo+4eOhQ1LFPtxE87nfPnMfqWmARnRc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HmhUu48iy4KtPBnj1L+7wltIrnpC8R0xyxZs8SnswJbT+nFIix7SUsBL1qbMsS2Sg
         NDguVUxDs3Cl22hVAUCTuRd7suDzd+kf0LG75dCAGwlo1V9whoLejr8r5hLvR+raKb
         S+NzGs20fgJOYvI9g5fA0mndNH409TPXyouq62Ssj5cPdn8bBI0fLm9wpPq5oewBjb
         sF+YrOpP1HEKDmAZ4T4M+3ackmEa3oHpRKFL3yYqRiAkf9NmMLn1n0qgvvOgpOy02z
         avqtaSo609+5/mzkuUUiXF7kgMKmPNVrA/OAB/uqqbwn/Aaxk1SsmxZVVPXJ3BF9Te
         Y5cG6nsYTudvg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Pascal Paillet <p.paillet@st.com>
Subject: [PATCH 23/69] Input: stpmic1_onekey - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:56 +0000
Message-Id: <20230102181842.718010-24-jic23@kernel.org>
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
Cc: Pascal Paillet <p.paillet@st.com>
---
 drivers/input/misc/stpmic1_onkey.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/stpmic1_onkey.c b/drivers/input/misc/stpmic1_onkey.c
index d8dc2f2f8000..d5ebca7b90a5 100644
--- a/drivers/input/misc/stpmic1_onkey.c
+++ b/drivers/input/misc/stpmic1_onkey.c
@@ -142,7 +142,7 @@ static int stpmic1_onkey_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused stpmic1_onkey_suspend(struct device *dev)
+static int stpmic1_onkey_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct stpmic1_onkey *onkey = platform_get_drvdata(pdev);
@@ -154,7 +154,7 @@ static int __maybe_unused stpmic1_onkey_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused stpmic1_onkey_resume(struct device *dev)
+static int stpmic1_onkey_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct stpmic1_onkey *onkey = platform_get_drvdata(pdev);
@@ -166,9 +166,9 @@ static int __maybe_unused stpmic1_onkey_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(stpmic1_onkey_pm,
-			 stpmic1_onkey_suspend,
-			 stpmic1_onkey_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(stpmic1_onkey_pm,
+				stpmic1_onkey_suspend,
+				stpmic1_onkey_resume);
 
 static const struct of_device_id of_stpmic1_onkey_match[] = {
 	{ .compatible = "st,stpmic1-onkey" },
@@ -182,7 +182,7 @@ static struct platform_driver stpmic1_onkey_driver = {
 	.driver	= {
 		.name	= "stpmic1_onkey",
 		.of_match_table = of_match_ptr(of_stpmic1_onkey_match),
-		.pm	= &stpmic1_onkey_pm,
+		.pm	= pm_sleep_ptr(&stpmic1_onkey_pm),
 	},
 };
 module_platform_driver(stpmic1_onkey_driver);
-- 
2.39.0

