Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0E1065B63C
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232506AbjABSGo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236303AbjABSGL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:11 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D16E355BB
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 82CD7B80D0D
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8599FC433EF;
        Mon,  2 Jan 2023 18:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682767;
        bh=xHO8Iv4ZqtiCejPdA5Y2Q7wrp3IybCcMIqoV1cTvr10=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rUfI5FQrOGv/UWWJWLTVSm/b9uuIPVb7tEiMIlYfgB0Bfo+fqx3jM5pDmXlR/tRyC
         Hs2mpS1GcTVnkZTzsPcfdA2u20IumwahI/hcCtYiH+9ZsxELijPkZM20vr9ipvJ3zl
         mcRwD++OwbFB6vRnDbGZah8dbIn5MgxWQk3xS7FNY1RWfYPJUYasZXM7RBWH5ErrGq
         Svk2FxnF3qojGD61YDYCitf5YT0yui2chQnMgAna5D1PjVJ0gJ++/c1R69vwZozLmo
         dJk6SKV+1tPbFpfjktJYNo7ySIJnOwDnMGToHoz5l0GPhcUGckhZVIiiA+JOc8UxWv
         6xpAYXRFGu9xQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 10/69] Input: kxtj9 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:43 +0000
Message-Id: <20230102181842.718010-11-jic23@kernel.org>
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
 drivers/input/misc/kxtj9.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/kxtj9.c b/drivers/input/misc/kxtj9.c
index 7e73e6e0730f..4e806d56c55d 100644
--- a/drivers/input/misc/kxtj9.c
+++ b/drivers/input/misc/kxtj9.c
@@ -494,7 +494,7 @@ static int kxtj9_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused kxtj9_suspend(struct device *dev)
+static int kxtj9_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct kxtj9_data *tj9 = i2c_get_clientdata(client);
@@ -509,7 +509,7 @@ static int __maybe_unused kxtj9_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused kxtj9_resume(struct device *dev)
+static int kxtj9_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct kxtj9_data *tj9 = i2c_get_clientdata(client);
@@ -524,7 +524,7 @@ static int __maybe_unused kxtj9_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(kxtj9_pm_ops, kxtj9_suspend, kxtj9_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(kxtj9_pm_ops, kxtj9_suspend, kxtj9_resume);
 
 static const struct i2c_device_id kxtj9_id[] = {
 	{ NAME, 0 },
@@ -536,7 +536,7 @@ MODULE_DEVICE_TABLE(i2c, kxtj9_id);
 static struct i2c_driver kxtj9_driver = {
 	.driver = {
 		.name	= NAME,
-		.pm	= &kxtj9_pm_ops,
+		.pm	= pm_sleep_ptr(&kxtj9_pm_ops),
 	},
 	.probe_new	= kxtj9_probe,
 	.id_table	= kxtj9_id,
-- 
2.39.0

