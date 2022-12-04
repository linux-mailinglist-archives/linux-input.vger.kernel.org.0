Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C347641E4E
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:56:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbiLDR4N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbiLDR4L (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:11 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7639140D0
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 63AF0B80B89
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41651C433C1;
        Sun,  4 Dec 2022 17:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176568;
        bh=MHTqRd6Sz6bdPi1bmAAWLtTtMGvpgCeIFVu7ZKExuds=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Hth3K+VDQjogQpGWyTLdvoX20E3UbA6dae4CpMOJIt8imOy2JBThNFWRWKal/Hxfl
         ya+nnpkwJtwKRLMwpLAAtv6U0wFbNtIAOJFrCg7BOmxz/dqZa2Uzt4VTRAT27LYFrk
         GY2I9eS0sIP7RYLATnx0K64UlkODyVBDfevnIsjhs20w7FUhHMae+OYg1CIpWxW+tO
         w+t2p9qAB83tGYjWE8KRJM0NVyW4xSEuaXmiWaB47NdNCGDBh00br17Eyv3jtdkakh
         LOUzpW3V7QGTAsABQ+/gUH1Fb5NTH/N3uKRa78EONjFstWsGkYrt2MCxNxzzTaSqCh
         y3igzrpBdp7gw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Michael Hennerich <michael.hennerich@analog.com>
Subject: [PATCH 02/32] Input: adp5589-keys - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:11 +0000
Message-Id: <20221204180841.2211588-3-jic23@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204180841.2211588-1-jic23@kernel.org>
References: <20221204180841.2211588-1-jic23@kernel.org>
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
Cc: Michael Hennerich <michael.hennerich@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 25c9f6344bf2..38d7073863a8 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -1016,7 +1016,7 @@ static int adp5589_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused adp5589_suspend(struct device *dev)
+static int adp5589_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct adp5589_kpad *kpad = i2c_get_clientdata(client);
@@ -1027,7 +1027,7 @@ static int __maybe_unused adp5589_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused adp5589_resume(struct device *dev)
+static int adp5589_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct adp5589_kpad *kpad = i2c_get_clientdata(client);
@@ -1038,7 +1038,7 @@ static int __maybe_unused adp5589_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(adp5589_dev_pm_ops, adp5589_suspend, adp5589_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(adp5589_dev_pm_ops, adp5589_suspend, adp5589_resume);
 
 static const struct i2c_device_id adp5589_id[] = {
 	{"adp5589-keys", ADP5589},
@@ -1052,7 +1052,7 @@ MODULE_DEVICE_TABLE(i2c, adp5589_id);
 static struct i2c_driver adp5589_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
-		.pm = &adp5589_dev_pm_ops,
+		.pm = pm_sleep_ptr(&adp5589_dev_pm_ops),
 	},
 	.probe_new = adp5589_probe,
 	.id_table = adp5589_id,
-- 
2.38.1

