Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA04965B65B
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236346AbjABSHS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236439AbjABSGu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:50 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3A02F5
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EBB11B80DE9
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4750C433D2;
        Mon,  2 Jan 2023 18:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682806;
        bh=9nAWkRRQRs1+5gNeftMIhlHfgQ85pgTDAkPVOD9oe5g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EoUMLAIKkIIu+YT6Y3Dgt4clngVZr7A7isvhIKy0M1MUGriPbhFSdj8zPsHq5eLNx
         0qVlE1ZZC96qYzpW+3fvCJ8S7gpnJw4/xLzqc6YzFVpdr8UQE5DGa2guW++JUoXX0V
         Qvn2ZYfQCyM08T7cqSxyRiRmL8XCBJXXnBm6Zp5FmI9Vk18XCRtSo51834Tqi0LDGn
         fpCcS0dW/SURAJ40W9+HHozpXL1Fxa6VhsNziLsCn/V/Yi/WvtglxrN54bar5VXvOx
         iayvl8IcKhOjAN7Y7vyDI/7Ig/fE0sWi3fRbff0fx5fGfiTNajBPj1wrnJ2jVO9P7e
         nrIPzSIRA+tew==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 40/69] Input: cy8ctmg110_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:13 +0000
Message-Id: <20230102181842.718010-41-jic23@kernel.org>
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
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/cy8ctmg110_ts.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/cy8ctmg110_ts.c b/drivers/input/touchscreen/cy8ctmg110_ts.c
index 7c2b7309dbaf..dcf50fbf6dc7 100644
--- a/drivers/input/touchscreen/cy8ctmg110_ts.c
+++ b/drivers/input/touchscreen/cy8ctmg110_ts.c
@@ -237,7 +237,7 @@ static int cy8ctmg110_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused cy8ctmg110_suspend(struct device *dev)
+static int cy8ctmg110_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct cy8ctmg110 *ts = i2c_get_clientdata(client);
@@ -250,7 +250,7 @@ static int __maybe_unused cy8ctmg110_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cy8ctmg110_resume(struct device *dev)
+static int cy8ctmg110_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct cy8ctmg110 *ts = i2c_get_clientdata(client);
@@ -263,7 +263,8 @@ static int __maybe_unused cy8ctmg110_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(cy8ctmg110_pm, cy8ctmg110_suspend, cy8ctmg110_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(cy8ctmg110_pm,
+				cy8ctmg110_suspend, cy8ctmg110_resume);
 
 static const struct i2c_device_id cy8ctmg110_idtable[] = {
 	{ CY8CTMG110_DRIVER_NAME, 1 },
@@ -275,7 +276,7 @@ MODULE_DEVICE_TABLE(i2c, cy8ctmg110_idtable);
 static struct i2c_driver cy8ctmg110_driver = {
 	.driver		= {
 		.name	= CY8CTMG110_DRIVER_NAME,
-		.pm	= &cy8ctmg110_pm,
+		.pm	= pm_sleep_ptr(&cy8ctmg110_pm),
 	},
 	.id_table	= cy8ctmg110_idtable,
 	.probe_new	= cy8ctmg110_probe,
-- 
2.39.0

