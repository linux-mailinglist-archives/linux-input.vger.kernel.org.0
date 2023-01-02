Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EABB265B652
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236486AbjABSHA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236491AbjABSGh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:37 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7228D5FF7
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0FDB061090
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA35C433EF;
        Mon,  2 Jan 2023 18:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682795;
        bh=ttZG/hThuLxfyJrixxjvdrjxHYGdj+JfoO65HELhxHE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ksEzce4Ts55LR6b+Zmtqv5vjP5Jw0rhYW7DcWo/rRKhWOLuYcFZwt4BWNtivDl4vV
         9yYYMgKL6TfAiA9skyO7X+PfGkF4H5VABIUtW6H8a0KBwDYbEfDA0J6TmjEl8B6Wtf
         hVSdtnRYXrUQ4mpUwGHNXEHCc/fJ7ANkIDYOf6TxHQF6oaibOdJySF99O/Ec999w7j
         6v6f2J/I62QIEB6VyE4C12tc7IM+Fnqw1m6dJ4YABdBN5OcaFMZJLcJGzx9+0h4Jho
         vw6s+h55ta6/Q7PdKdakyGLi0IGN7StyGatpfTgzVXTwrZKfnh63LwNuKBFEe/tO/V
         wKMff1Ifptw8w==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 32/69] Input: ar1021 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:05 +0000
Message-Id: <20230102181842.718010-33-jic23@kernel.org>
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
 drivers/input/touchscreen/ar1021_i2c.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/ar1021_i2c.c b/drivers/input/touchscreen/ar1021_i2c.c
index 25bcc677e98b..3a5b65cae360 100644
--- a/drivers/input/touchscreen/ar1021_i2c.c
+++ b/drivers/input/touchscreen/ar1021_i2c.c
@@ -142,7 +142,7 @@ static int ar1021_i2c_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused ar1021_i2c_suspend(struct device *dev)
+static int ar1021_i2c_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 
@@ -151,7 +151,7 @@ static int __maybe_unused ar1021_i2c_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ar1021_i2c_resume(struct device *dev)
+static int ar1021_i2c_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 
@@ -160,7 +160,8 @@ static int __maybe_unused ar1021_i2c_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(ar1021_i2c_pm, ar1021_i2c_suspend, ar1021_i2c_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ar1021_i2c_pm,
+				ar1021_i2c_suspend, ar1021_i2c_resume);
 
 static const struct i2c_device_id ar1021_i2c_id[] = {
 	{ "ar1021", 0 },
@@ -177,7 +178,7 @@ MODULE_DEVICE_TABLE(of, ar1021_i2c_of_match);
 static struct i2c_driver ar1021_i2c_driver = {
 	.driver	= {
 		.name	= "ar1021_i2c",
-		.pm	= &ar1021_i2c_pm,
+		.pm	= pm_sleep_ptr(&ar1021_i2c_pm),
 		.of_match_table = ar1021_i2c_of_match,
 	},
 
-- 
2.39.0

