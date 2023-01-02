Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9EAE65B634
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232655AbjABSGJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232796AbjABSF6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:05:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B74C38BD
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:05:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 98B5661057
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1181DC433D2;
        Mon,  2 Jan 2023 18:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682757;
        bh=NOjTjtn7k7niayHti6GiZtzoE7yUz0hY1RduihXBHEU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nwy9dDI6Q/+TmsnmXKaAK2BVVFcsLPUw1dQIxcvNSVjNZmL/tvMtCCTM/PWlbYkRu
         GnnVhz7QlpX+NVO3qLgK5gXCfUBW0G580lKIhs3ajOKyYd0RDqlT9LhLHyShIBXlYx
         TsJPOJ1Qz9fUCugn0OU5EeutcQrDNnxWG6znUqOcbroLXjotQi6gGj5tNubcHXo1bn
         XbxU/D/ZBH/e7ZeJ/LNef25NFHNza9XcrajNLujXrxsSj25WAsSvn+H78T3lM5NOLu
         Rs6j/DQTMq5ML/5Mq3DxEI5phbll2yp4nZqN9to6J/D1Fo+GOo+MHnpdSmeeKtHt4A
         tYmGSsZUqh9eQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Roy Im <roy.im.opensource@diasemi.com>
Subject: [PATCH 02/69] Input: da7280 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:35 +0000
Message-Id: <20230102181842.718010-3-jic23@kernel.org>
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
Cc: Roy Im <roy.im.opensource@diasemi.com>
---
 drivers/input/misc/da7280.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/da7280.c b/drivers/input/misc/da7280.c
index dcdea33b1a8f..b85a19e3554f 100644
--- a/drivers/input/misc/da7280.c
+++ b/drivers/input/misc/da7280.c
@@ -1260,7 +1260,7 @@ static int da7280_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused da7280_suspend(struct device *dev)
+static int da7280_suspend(struct device *dev)
 {
 	struct da7280_haptic *haptics = dev_get_drvdata(dev);
 
@@ -1281,7 +1281,7 @@ static int __maybe_unused da7280_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused da7280_resume(struct device *dev)
+static int da7280_resume(struct device *dev)
 {
 	struct da7280_haptic *haptics = dev_get_drvdata(dev);
 	int retval;
@@ -1313,13 +1313,13 @@ static const struct i2c_device_id da7280_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, da7280_i2c_id);
 
-static SIMPLE_DEV_PM_OPS(da7280_pm_ops, da7280_suspend, da7280_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(da7280_pm_ops, da7280_suspend, da7280_resume);
 
 static struct i2c_driver da7280_driver = {
 	.driver = {
 		.name = "da7280",
 		.of_match_table = of_match_ptr(da7280_of_match),
-		.pm = &da7280_pm_ops,
+		.pm = pm_sleep_ptr(&da7280_pm_ops),
 	},
 	.probe_new = da7280_probe,
 	.id_table = da7280_i2c_id,
-- 
2.39.0

