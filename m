Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 601EE65B666
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236479AbjABSHZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236534AbjABSHF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:05 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62DADDB1
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 13A58B80DF0
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0086C433EF;
        Mon,  2 Jan 2023 18:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682821;
        bh=jWijrKeYCGjamKjpO42XPQkqBGuRvod0lS5P3mSEp4M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tX0akr+djH5OFgY2REHQZbuuk3wbkAR6Vv7Xqeptfqlr2y5S6YEXNkiCPSsXxp/rg
         sIKFtTgiauYl1Ugj7+5K9opayJ2gljjqN8nGS5Vbls8DFM7NQEaDbmG3Itbad88nXJ
         SRONtiAVEHMjnD8AQOlsOKGRmXon7OJKD45AmkezVcjoe0wK9SIHGdnkLT1x5i9NmX
         RsQF/hB+W4CABaMmEvRPWHWWQrttXXrItS+S4Bt97qxadBtEqjBLES/0ZGkdapvEqV
         ag0pTfaGydv/KQLAW3/P8KH7Nsgz3N+hMLZbwcUZ/CbPQpUJPuUylFjV8qYn71stOp
         j4P2yDT1WV4Vg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 51/69] Input: iqs5xx - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:24 +0000
Message-Id: <20230102181842.718010-52-jic23@kernel.org>
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
 drivers/input/touchscreen/iqs5xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index dc3137a34f35..c73e9c5c0077 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -979,7 +979,7 @@ static const struct attribute_group iqs5xx_attr_group = {
 	.attrs = iqs5xx_attrs,
 };
 
-static int __maybe_unused iqs5xx_suspend(struct device *dev)
+static int iqs5xx_suspend(struct device *dev)
 {
 	struct iqs5xx_private *iqs5xx = dev_get_drvdata(dev);
 	struct input_dev *input = iqs5xx->input;
@@ -998,7 +998,7 @@ static int __maybe_unused iqs5xx_suspend(struct device *dev)
 	return error;
 }
 
-static int __maybe_unused iqs5xx_resume(struct device *dev)
+static int iqs5xx_resume(struct device *dev)
 {
 	struct iqs5xx_private *iqs5xx = dev_get_drvdata(dev);
 	struct input_dev *input = iqs5xx->input;
@@ -1017,7 +1017,7 @@ static int __maybe_unused iqs5xx_resume(struct device *dev)
 	return error;
 }
 
-static SIMPLE_DEV_PM_OPS(iqs5xx_pm, iqs5xx_suspend, iqs5xx_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(iqs5xx_pm, iqs5xx_suspend, iqs5xx_resume);
 
 static int iqs5xx_probe(struct i2c_client *client)
 {
@@ -1090,7 +1090,7 @@ static struct i2c_driver iqs5xx_i2c_driver = {
 	.driver = {
 		.name		= "iqs5xx",
 		.of_match_table	= iqs5xx_of_match,
-		.pm		= &iqs5xx_pm,
+		.pm		= pm_sleep_ptr(&iqs5xx_pm),
 	},
 	.id_table	= iqs5xx_id,
 	.probe_new	= iqs5xx_probe,
-- 
2.39.0

