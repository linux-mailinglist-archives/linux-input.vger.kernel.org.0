Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC36166ACCB
	for <lists+linux-input@lfdr.de>; Sat, 14 Jan 2023 18:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbjANRCy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Jan 2023 12:02:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbjANRCw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Jan 2023 12:02:52 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D10DA5EE
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 09:02:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A229860B4D
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 17:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2897C433A8;
        Sat, 14 Jan 2023 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673715769;
        bh=J2eGQ+i+Wwkxy7k8KnXhn+ekie7fem7YIseq7P9xy5E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uQpu1dQZW1PyDK9OIXWetSl4tBkkUdSowGSpPmKaJ/sjTjbJRfJKnTd/niH5KVNZ9
         KhylvZv0Bv6WzBeXN9Lg/ysSM8HsaWhcRekXPHpSzNZwdKPdAX7sUgxYfd4M4dFHxt
         YqYoGMBOH4DwxRQTBPmO90aN6mcSUDYQBjZXOhXsjmno7SAPBcdyPMUYEZabhgOdO8
         E1OSTWZAz63Iduatd2rObtSioShigd1GKx1jiSFXEJyShFgVJ6Hmp8z7muCVlguGXo
         HrcFjF1jzsNygryHTXTUsBV+6aO5gQ8UHeL34Li4+xy2lly5DUnAxkPQ0+Gl1fwwb2
         4tVRxRN4siDFw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     jic23@kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 01/16] Input: cyapa - switch to SYSTEM_SLEEP/RUNTIME_PM_OPS() and pm_ptr()
Date:   Sat, 14 Jan 2023 17:16:05 +0000
Message-Id: <20230114171620.42891-2-jic23@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114171620.42891-1-jic23@kernel.org>
References: <20230114171620.42891-1-jic23@kernel.org>
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

SET_SYSTEM_SLEEP_PM_OPS() and SET_RUNTIME_PM_OPS() are deprecated as
they require explicit protection against unused function warnings.
The new combination of pm_ptr() and SYSTEM_SLEEP_PM_OPS()/
RUNTIME_PM_OPS() allows the compiler to see the functions,
thus suppressing the warning, but still allowing the unused code to be
removed. Thus also drop the __maybe_unused markings.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/input/mouse/cyapa.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/input/mouse/cyapa.c b/drivers/input/mouse/cyapa.c
index 7e88a6ec7989..dd7b0d70d791 100644
--- a/drivers/input/mouse/cyapa.c
+++ b/drivers/input/mouse/cyapa.c
@@ -1349,7 +1349,7 @@ static int cyapa_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused cyapa_suspend(struct device *dev)
+static int cyapa_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct cyapa *cyapa = i2c_get_clientdata(client);
@@ -1397,7 +1397,7 @@ static int __maybe_unused cyapa_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cyapa_resume(struct device *dev)
+static int cyapa_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct cyapa *cyapa = i2c_get_clientdata(client);
@@ -1424,7 +1424,7 @@ static int __maybe_unused cyapa_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cyapa_runtime_suspend(struct device *dev)
+static int cyapa_runtime_suspend(struct device *dev)
 {
 	struct cyapa *cyapa = dev_get_drvdata(dev);
 	int error;
@@ -1439,7 +1439,7 @@ static int __maybe_unused cyapa_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cyapa_runtime_resume(struct device *dev)
+static int cyapa_runtime_resume(struct device *dev)
 {
 	struct cyapa *cyapa = dev_get_drvdata(dev);
 	int error;
@@ -1453,8 +1453,8 @@ static int __maybe_unused cyapa_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops cyapa_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(cyapa_suspend, cyapa_resume)
-	SET_RUNTIME_PM_OPS(cyapa_runtime_suspend, cyapa_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(cyapa_suspend, cyapa_resume)
+	RUNTIME_PM_OPS(cyapa_runtime_suspend, cyapa_runtime_resume, NULL)
 };
 
 static const struct i2c_device_id cyapa_id_table[] = {
@@ -1484,7 +1484,7 @@ MODULE_DEVICE_TABLE(of, cyapa_of_match);
 static struct i2c_driver cyapa_driver = {
 	.driver = {
 		.name = "cyapa",
-		.pm = &cyapa_pm_ops,
+		.pm = pm_ptr(&cyapa_pm_ops),
 		.acpi_match_table = ACPI_PTR(cyapa_acpi_id),
 		.of_match_table = of_match_ptr(cyapa_of_match),
 	},
-- 
2.39.0

