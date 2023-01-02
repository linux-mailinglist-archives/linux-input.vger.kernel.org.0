Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7E6865B661
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236457AbjABSHW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236528AbjABSHB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:01 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 547B35F96
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 09EA5B80DEC
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91B8C433EF;
        Mon,  2 Jan 2023 18:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682817;
        bh=1fZtWpowuzcKXpQvaRbYJ021cC9TtqN2quRW9UcPSU0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Bup5IjrhccUfntyyVqpeMgJWfGkkzf2v6/GVVj03+WxWWhBzOqtOwhBWIE8o6pZNI
         yzgQOkUTnjtL/cOPQ0hwCTjMfkZsxP1S5oQR02vrytwtkWgIhzPj82wqAtAjJWr71s
         XMj0t4THApsKpFNP46EpP2AqG1VdEwXvfR89XLePApsYLDhmelvJnepvEFum+XzI0D
         J/02iLFCUJ9+S1joHaUmjXPbSmIjGXyoW4JsJbRA/+uZe0wUGUTQmlCBFwsrABAYl6
         +eyF87t1CqnVD5BKtflhacxWlXN044iebPom0brka5iO5febXuF0TmGvQkBotYuntW
         rMytBKCylGqFg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Joe Hung <joe_hung@ilitek.com>
Subject: [PATCH 48/69] Input: ilitek_ts_i2c - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:21 +0000
Message-Id: <20230102181842.718010-49-jic23@kernel.org>
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
Cc: Joe Hung <joe_hung@ilitek.com>
---
 drivers/input/touchscreen/ilitek_ts_i2c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
index e6ade3775a8a..d69809338498 100644
--- a/drivers/input/touchscreen/ilitek_ts_i2c.c
+++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
@@ -604,7 +604,7 @@ static int ilitek_ts_i2c_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused ilitek_suspend(struct device *dev)
+static int ilitek_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct ilitek_ts_data *ts = i2c_get_clientdata(client);
@@ -621,7 +621,7 @@ static int __maybe_unused ilitek_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ilitek_resume(struct device *dev)
+static int ilitek_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct ilitek_ts_data *ts = i2c_get_clientdata(client);
@@ -640,7 +640,7 @@ static int __maybe_unused ilitek_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(ilitek_pm_ops, ilitek_suspend, ilitek_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ilitek_pm_ops, ilitek_suspend, ilitek_resume);
 
 static const struct i2c_device_id ilitek_ts_i2c_id[] = {
 	{ ILITEK_TS_NAME, 0 },
@@ -675,7 +675,7 @@ MODULE_DEVICE_TABLE(of, ilitek_ts_i2c_match);
 static struct i2c_driver ilitek_ts_i2c_driver = {
 	.driver = {
 		.name = ILITEK_TS_NAME,
-		.pm = &ilitek_pm_ops,
+		.pm = pm_sleep_ptr(&ilitek_pm_ops),
 		.of_match_table = of_match_ptr(ilitek_ts_i2c_match),
 		.acpi_match_table = ACPI_PTR(ilitekts_acpi_id),
 	},
-- 
2.39.0

