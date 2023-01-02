Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2364165B65F
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235952AbjABSHV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236475AbjABSG4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:56 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C537755BB
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 791A4B80DED
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12202C433D2;
        Mon,  2 Jan 2023 18:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682812;
        bh=A+adGC5uX20xMfqb5JGln2JU+zgoaUd7BOyB9DkXiN4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AwxCjGiutQjBNOZASt6LPGlZ4ntLyMzcI69jU1kJ7f5U5G+V9L9ZXUwXIbn3MXTbb
         eBe9wGv7bqDj1nZ1pvK5j9nXF9N+SQ+Ih+zCMuRCXi0v4ElVlBRvxcjUJQHYVsKO1E
         /ox2WpZtCfXpdawYfNwRVZV0BeH5ZY83r34Wk/N/4+0vbqqWNyHyxVjRD9vfc4I03/
         IjzAUbTJNXgN/HJwVjIGsqOP/yqPXWNQUw8akJl8Xzoab+jV31BFT2iKyqb6dC8hg+
         UCYgBUu1QRolmVEEMsTTNpU2Kxhu16DXvbP2cGLd6PmfhwR1odxxVMIZTl0PVaMgYa
         noMpnMzklLEdw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 44/69] input: ektf2127 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:17 +0000
Message-Id: <20230102181842.718010-45-jic23@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102181842.718010-1-jic23@kernel.org>
References: <20230102181842.718010-1-jic23@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/ektf2127.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/ektf2127.c b/drivers/input/touchscreen/ektf2127.c
index 328841eaa1b7..e6f1e46d003d 100644
--- a/drivers/input/touchscreen/ektf2127.c
+++ b/drivers/input/touchscreen/ektf2127.c
@@ -177,7 +177,7 @@ static void ektf2127_stop(struct input_dev *dev)
 	gpiod_set_value_cansleep(ts->power_gpios, 0);
 }
 
-static int __maybe_unused ektf2127_suspend(struct device *dev)
+static int ektf2127_suspend(struct device *dev)
 {
 	struct ektf2127_ts *ts = i2c_get_clientdata(to_i2c_client(dev));
 
@@ -189,7 +189,7 @@ static int __maybe_unused ektf2127_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ektf2127_resume(struct device *dev)
+static int ektf2127_resume(struct device *dev)
 {
 	struct ektf2127_ts *ts = i2c_get_clientdata(to_i2c_client(dev));
 
@@ -201,8 +201,8 @@ static int __maybe_unused ektf2127_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(ektf2127_pm_ops, ektf2127_suspend,
-			 ektf2127_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ektf2127_pm_ops, ektf2127_suspend,
+				ektf2127_resume);
 
 static int ektf2127_query_dimension(struct i2c_client *client, bool width)
 {
@@ -348,7 +348,7 @@ MODULE_DEVICE_TABLE(i2c, ektf2127_i2c_id);
 static struct i2c_driver ektf2127_driver = {
 	.driver = {
 		.name	= "elan_ektf2127",
-		.pm	= &ektf2127_pm_ops,
+		.pm	= pm_sleep_ptr(&ektf2127_pm_ops),
 		.of_match_table = of_match_ptr(ektf2127_of_match),
 	},
 	.probe_new = ektf2127_probe,
-- 
2.39.0

