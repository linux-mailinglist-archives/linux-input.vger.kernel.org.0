Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 353FF65B659
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231908AbjABSHR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236347AbjABSGq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:46 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF98DAD
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8790061057
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF53C433EF;
        Mon,  2 Jan 2023 18:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682804;
        bh=i+FyiKYmLe1L+sLbYHa7msOReo53wYA1a5SokQf2hQk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lVXHcPBXEBrlH/YeNhU7APtSZw8Rvvmyn85lgl3m0B8xZIWg6GbHBpH+q8BBYdOxl
         tP3nuDh74WyeswyZC+CCqYlbfWxNSN1rhf4FaIujiMg0yaaCwFuDp3i7SA3r2QPWUU
         EWVCI774pTB3bPZCweqCQtykAYjXwqZZarQzn8viRrurXUvtG9tnQ5hIom9+t2GSv+
         3AiHoQdBBXKRPozvVfKLXTwa9fdXZtJr2M6z7LBW6JkFOZf5PVSJPuPrre4Nsc6Rqq
         uA4C5Wl9tn3W/7i/x1jgNb1koZDZ3M9lQQqiu6EhxryPT0VrWp6sMoMprOQh1Ztzn1
         reqMXwE+3lNdQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 38/69] Input: chipone_icn8505 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:11 +0000
Message-Id: <20230102181842.718010-39-jic23@kernel.org>
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
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/chipone_icn8505.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/chipone_icn8505.c b/drivers/input/touchscreen/chipone_icn8505.c
index c421f4be2700..246bee0bee53 100644
--- a/drivers/input/touchscreen/chipone_icn8505.c
+++ b/drivers/input/touchscreen/chipone_icn8505.c
@@ -460,7 +460,7 @@ static int icn8505_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused icn8505_suspend(struct device *dev)
+static int icn8505_suspend(struct device *dev)
 {
 	struct icn8505_data *icn8505 = i2c_get_clientdata(to_i2c_client(dev));
 
@@ -471,7 +471,7 @@ static int __maybe_unused icn8505_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused icn8505_resume(struct device *dev)
+static int icn8505_resume(struct device *dev)
 {
 	struct icn8505_data *icn8505 = i2c_get_clientdata(to_i2c_client(dev));
 	int error;
@@ -484,7 +484,7 @@ static int __maybe_unused icn8505_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(icn8505_pm_ops, icn8505_suspend, icn8505_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(icn8505_pm_ops, icn8505_suspend, icn8505_resume);
 
 static const struct acpi_device_id icn8505_acpi_match[] = {
 	{ "CHPN0001" },
@@ -495,7 +495,7 @@ MODULE_DEVICE_TABLE(acpi, icn8505_acpi_match);
 static struct i2c_driver icn8505_driver = {
 	.driver = {
 		.name	= "chipone_icn8505",
-		.pm	= &icn8505_pm_ops,
+		.pm	= pm_sleep_ptr(&icn8505_pm_ops),
 		.acpi_match_table = icn8505_acpi_match,
 	},
 	.probe_new = icn8505_probe,
-- 
2.39.0

