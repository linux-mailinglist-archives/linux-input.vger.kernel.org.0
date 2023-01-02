Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4014565B656
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232873AbjABSHP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236341AbjABSGo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C7BD2E2
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 39D4B61084
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11E6C433D2;
        Mon,  2 Jan 2023 18:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682802;
        bh=zAeCllVa4MlsazseY7jZE/SQhpAgSJ7SLe3rljqgoyI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OSRRDhOO6l+SDkW/KxtiyPjniWJxdehJAjWfUHjxnf/ARgXSgCzTGZFQDBAx8M1Qf
         1+ff1l/8lf32TMTlPF3gDipX1yfa+wMZuQplFQAm4sQ9M/7Sodk0S4SPpPtUSmm1Ac
         STiZWOkqYGcQdTtr/2snoI45mYsJWsBdO4zWH4R+IS07rulpXv3dyNtYa7qxtw2pKQ
         4XFeFH2SRddXMpBSOer1GczKbjdWUQ5tqBgf38lOCgp4c+rzNi1VLAC0VoRTzV/Fau
         QrQWpwUQGETIDFqraBBBv1ml61FITtUDWElng6xLfBtc2087O1n1deuuWa9F3HQjb0
         KcHQh4v3PN66g==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 37/69] Input: chipone_in8318 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:10 +0000
Message-Id: <20230102181842.718010-38-jic23@kernel.org>
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
removed. Thus also drop the #ifdef guards.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/chipone_icn8318.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/chipone_icn8318.c b/drivers/input/touchscreen/chipone_icn8318.c
index f6769e4bd4f2..32b714a6ed2d 100644
--- a/drivers/input/touchscreen/chipone_icn8318.c
+++ b/drivers/input/touchscreen/chipone_icn8318.c
@@ -148,7 +148,6 @@ static void icn8318_stop(struct input_dev *dev)
 	gpiod_set_value_cansleep(data->wake_gpio, 0);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int icn8318_suspend(struct device *dev)
 {
 	struct icn8318_data *data = i2c_get_clientdata(to_i2c_client(dev));
@@ -172,9 +171,8 @@ static int icn8318_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(icn8318_pm_ops, icn8318_suspend, icn8318_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(icn8318_pm_ops, icn8318_suspend, icn8318_resume);
 
 static int icn8318_probe(struct i2c_client *client)
 {
@@ -263,7 +261,7 @@ MODULE_DEVICE_TABLE(i2c, icn8318_i2c_id);
 static struct i2c_driver icn8318_driver = {
 	.driver = {
 		.name	= "chipone_icn8318",
-		.pm	= &icn8318_pm_ops,
+		.pm	= pm_sleep_ptr(&icn8318_pm_ops),
 		.of_match_table = icn8318_of_match,
 	},
 	.probe_new = icn8318_probe,
-- 
2.39.0

