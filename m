Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2C965B668
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236490AbjABSH1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236543AbjABSHH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:07 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D04DCDB1
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 81DD9B80DF1
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48EA4C433F1;
        Mon,  2 Jan 2023 18:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682824;
        bh=XLU9Se8YrY4ehr2z+FI0cF0zuYf5sdDf7ODC2YjDrVc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JeUJ/NtZSX9AeBe2zNMlr0rLqfNI4A1imI16A5TS/7r2rhzBoabZmTK+NU4AMLDzW
         J76GRdpMatJAZOMBxQrf9UVg8uB9we0r7VrB8UDhL0Yac9aLtOF8NtYDQmzg5DtH35
         92PzSKdSmog1cCK+Pz86vnUeERvANPDQozEQ7pe4tls+wBJRW+AVsXhLabb4yiCHKk
         3cveQy7MQeXQrrdkvixPBHCPyUq7eCPxccwYswHYf3aA2HDD9h1PijjlrKZQjB7P8o
         A4uyerMMXdFx1JXwi9jdfZZtg5dBYmFzubuma18E2eI+UR+1rWrxleySw17TfFez6G
         qQdN4RKWQ4hbQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Sangwon Jee <jeesw@melfas.com>
Subject: [PATCH 53/69] Input: melfas_mip4 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:26 +0000
Message-Id: <20230102181842.718010-54-jic23@kernel.org>
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
Cc: Sangwon Jee <jeesw@melfas.com>
---
 drivers/input/touchscreen/melfas_mip4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
index 4ee8ed4c930c..acdfbdea2b6e 100644
--- a/drivers/input/touchscreen/melfas_mip4.c
+++ b/drivers/input/touchscreen/melfas_mip4.c
@@ -1528,7 +1528,7 @@ static int mip4_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused mip4_suspend(struct device *dev)
+static int mip4_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct mip4_ts *ts = i2c_get_clientdata(client);
@@ -1546,7 +1546,7 @@ static int __maybe_unused mip4_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mip4_resume(struct device *dev)
+static int mip4_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct mip4_ts *ts = i2c_get_clientdata(client);
@@ -1564,7 +1564,7 @@ static int __maybe_unused mip4_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(mip4_pm_ops, mip4_suspend, mip4_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(mip4_pm_ops, mip4_suspend, mip4_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id mip4_of_match[] = {
@@ -1595,7 +1595,7 @@ static struct i2c_driver mip4_driver = {
 		.name = MIP4_DEVICE_NAME,
 		.of_match_table = of_match_ptr(mip4_of_match),
 		.acpi_match_table = ACPI_PTR(mip4_acpi_match),
-		.pm = &mip4_pm_ops,
+		.pm = pm_sleep_ptr(&mip4_pm_ops),
 	},
 };
 module_i2c_driver(mip4_driver);
-- 
2.39.0

