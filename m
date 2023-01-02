Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1573E65B665
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236480AbjABSHZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236495AbjABSHE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:04 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5324DAD
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7219261090
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1DEC433D2;
        Mon,  2 Jan 2023 18:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682822;
        bh=V97y/4xYbFUsag90T3R8pWIjov8QCz4DCEl+aFdulVQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aQImDPDzVOpxSWMoooRUF6EhxGk3ve2/K0v/5UGpoPjBw0CPex67FAdF1j+QMYHo4
         AFZg/5xLm3Vt3DeeOCBcx2mzUHKdwg1CCchOy4REQSED1WlmrjX6scgrvNLkNzZNLY
         aSEW5BXU6o8knZs1agiPlnU930oH+oOoVw7E0g/oSNd2GHONrzdeGtJvJ7FxSsSdWk
         LnZLHQVhLRS0J13U/BM16xl3UXVme/E3w41ypSIjDLH3dlkKwsClLxzyH2cSWOq4b0
         oa0ybRCaH83Tm8lY8Rwc9I7h+oQevtW4/g2KHfGqpeG7+EGI9MJN4xdlNIgPWoqnpL
         dgdLvXX7qvECQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 52/69] Input: mcs5000_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:25 +0000
Message-Id: <20230102181842.718010-53-jic23@kernel.org>
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
 drivers/input/touchscreen/mcs5000_ts.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/mcs5000_ts.c b/drivers/input/touchscreen/mcs5000_ts.c
index ea9517cad695..704e36087ca2 100644
--- a/drivers/input/touchscreen/mcs5000_ts.c
+++ b/drivers/input/touchscreen/mcs5000_ts.c
@@ -241,7 +241,7 @@ static int mcs5000_ts_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused mcs5000_ts_suspend(struct device *dev)
+static int mcs5000_ts_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 
@@ -251,7 +251,7 @@ static int __maybe_unused mcs5000_ts_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mcs5000_ts_resume(struct device *dev)
+static int mcs5000_ts_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct mcs5000_ts_data *data = i2c_get_clientdata(client);
@@ -262,7 +262,8 @@ static int __maybe_unused mcs5000_ts_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(mcs5000_ts_pm, mcs5000_ts_suspend, mcs5000_ts_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(mcs5000_ts_pm,
+				mcs5000_ts_suspend, mcs5000_ts_resume);
 
 static const struct i2c_device_id mcs5000_ts_id[] = {
 	{ "mcs5000_ts", 0 },
@@ -274,7 +275,7 @@ static struct i2c_driver mcs5000_ts_driver = {
 	.probe_new	= mcs5000_ts_probe,
 	.driver = {
 		.name = "mcs5000_ts",
-		.pm   = &mcs5000_ts_pm,
+		.pm   = pm_sleep_ptr(&mcs5000_ts_pm),
 	},
 	.id_table	= mcs5000_ts_id,
 };
-- 
2.39.0

