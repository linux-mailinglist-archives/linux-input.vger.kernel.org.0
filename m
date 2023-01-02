Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0176D65B64F
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236519AbjABSG7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236488AbjABSGd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0464DDB1
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B6D6FB80DDE
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18B0C433F0;
        Mon,  2 Jan 2023 18:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682790;
        bh=JxgXGRC1AuHOUHx4JHC+Q1Fdj2PY8yXCBtkWTbn94Fs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CkUnqwDW9iPjk/qBMsCSd/zpj6NxynoZYndEzQmWaBV+MbYmCluGqw3U5mDcKSLK2
         dBPiBkbCq0bR580T/m7F21XSwOLAtW2TQo2QyaDM3ULVbORrH+6MVUq9NbK9MtQRu1
         GCYCGNCY2ZV7npuE0Q16BuDIIrp5fGjvnEUY1Sd9LKikAsCS6ghH+Hu7fAzrDHt235
         bR6K450/+nH7h4NYIO3oyOdJkWrKMPQ2ZbmlsvYX2DM8ZHhnrsBlKGY/zb3V+uQgaR
         PR3xBr+pXFYs4jqXQOCC390LP830Yz62Z4VYlZ/8lLrRZdjw9giWwIEkZFh29CpIzV
         03l1aOc1FBC/g==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 28/69] Input: synaptics_i2c - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:01 +0000
Message-Id: <20230102181842.718010-29-jic23@kernel.org>
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
 drivers/input/mouse/synaptics_i2c.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/mouse/synaptics_i2c.c b/drivers/input/mouse/synaptics_i2c.c
index 6487c8c60d5e..068692a8aba5 100644
--- a/drivers/input/mouse/synaptics_i2c.c
+++ b/drivers/input/mouse/synaptics_i2c.c
@@ -597,7 +597,7 @@ static void synaptics_i2c_remove(struct i2c_client *client)
 	kfree(touch);
 }
 
-static int __maybe_unused synaptics_i2c_suspend(struct device *dev)
+static int synaptics_i2c_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct synaptics_i2c *touch = i2c_get_clientdata(client);
@@ -610,7 +610,7 @@ static int __maybe_unused synaptics_i2c_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused synaptics_i2c_resume(struct device *dev)
+static int synaptics_i2c_resume(struct device *dev)
 {
 	int ret;
 	struct i2c_client *client = to_i2c_client(dev);
@@ -626,8 +626,8 @@ static int __maybe_unused synaptics_i2c_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(synaptics_i2c_pm, synaptics_i2c_suspend,
-			 synaptics_i2c_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(synaptics_i2c_pm, synaptics_i2c_suspend,
+				synaptics_i2c_resume);
 
 static const struct i2c_device_id synaptics_i2c_id_table[] = {
 	{ "synaptics_i2c", 0 },
@@ -647,7 +647,7 @@ static struct i2c_driver synaptics_i2c_driver = {
 	.driver = {
 		.name	= DRIVER_NAME,
 		.of_match_table = of_match_ptr(synaptics_i2c_of_match),
-		.pm	= &synaptics_i2c_pm,
+		.pm	= pm_sleep_ptr(&synaptics_i2c_pm),
 	},
 
 	.probe_new	= synaptics_i2c_probe,
-- 
2.39.0

