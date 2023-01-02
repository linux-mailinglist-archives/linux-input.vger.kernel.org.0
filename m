Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB64665B667
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236354AbjABSH0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236541AbjABSHG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB6C2E2
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F082961084
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C180C433EF;
        Mon,  2 Jan 2023 18:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682825;
        bh=OJIoV+HcGll9TYddayhFSQT37QbfYXxlNbkCQsuoV/8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qeMEycqEeUmfWU2PNaQpGXda3HBipV6s6IHjLGSk3BC3/WL31DalF5Q8R15yunsnk
         pVygmwPY0tOg3xC53zrc7fOsLuS/bwieCsfv5I33mXTOTAyICyY1U6Ix20LUpZP2OP
         2OZkcraQPTAbRb1cZM8TlSCgC3De1M3twAWSSvhdwZrFx82eyUdeTgbCYx42JlEN1Y
         QSoGtAJ5JWJOOFP2WTcmtFyYhKEDTR6lmdjuBemFupqB+tG8MvW9t9qz9+pa0tiERV
         i1GBtbPRClYa//TxiZkX1BvwzttPNuKBZxc1SJvZ4FabRVmRQtNF2wD73rPnQNU+Nr
         6xuAI5Mt6b/RQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 54/69] input: migor_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:27 +0000
Message-Id: <20230102181842.718010-55-jic23@kernel.org>
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
 drivers/input/touchscreen/migor_ts.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/migor_ts.c b/drivers/input/touchscreen/migor_ts.c
index ff0f605f3a3a..69fcc88d4f80 100644
--- a/drivers/input/touchscreen/migor_ts.c
+++ b/drivers/input/touchscreen/migor_ts.c
@@ -186,7 +186,7 @@ static void migor_ts_remove(struct i2c_client *client)
 	dev_set_drvdata(&client->dev, NULL);
 }
 
-static int __maybe_unused migor_ts_suspend(struct device *dev)
+static int migor_ts_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct migor_ts_priv *priv = i2c_get_clientdata(client);
@@ -197,7 +197,7 @@ static int __maybe_unused migor_ts_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused migor_ts_resume(struct device *dev)
+static int migor_ts_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct migor_ts_priv *priv = i2c_get_clientdata(client);
@@ -208,7 +208,7 @@ static int __maybe_unused migor_ts_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(migor_ts_pm, migor_ts_suspend, migor_ts_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(migor_ts_pm, migor_ts_suspend, migor_ts_resume);
 
 static const struct i2c_device_id migor_ts_id[] = {
 	{ "migor_ts", 0 },
@@ -219,7 +219,7 @@ MODULE_DEVICE_TABLE(i2c, migor_ts_id);
 static struct i2c_driver migor_ts_driver = {
 	.driver = {
 		.name = "migor_ts",
-		.pm = &migor_ts_pm,
+		.pm = pm_sleep_ptr(&migor_ts_pm),
 	},
 	.probe_new = migor_ts_probe,
 	.remove = migor_ts_remove,
-- 
2.39.0

