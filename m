Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B02F65B63E
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236353AbjABSGq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232796AbjABSGK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A5B3DD4
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 57C6EB80D0B
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FC0C433D2;
        Mon,  2 Jan 2023 18:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682766;
        bh=wp2ktGfZ0eg2QwSC98iKO5FSWIj7S0x2/HyeCPemldY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gYPHAaVBqQKEqDARxI+y7AOqlyK9WY7kuVd1CvD4JS9q+CGvL0Ll6OAUMb+VWPsho
         GMewwRk+WawK1wAriDf7VH/xx6Znp0udmrMscRc/gYrMyNehncPSZKZEX6uwCwgK5v
         G+Ai7MmrtbXnf0zzH9ZpWKDNA1/k1aEVpWVNZxsAnb5vPxSsgCU8ZDQr+26n9rYMbt
         b/7H+cO5NaN0dfgs79wc6hp3br326DvGvYS+1YXvCPHZJFsxoftykhiT2DhVonio0+
         +5EEeQV5PiqnI4rGBItkPGyA/0L/jMEOE0hV/Nhrv+Civh72M65mZcXf/bdw/ro6xU
         hoAe+1Itb3J4w==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 09/69] Input: iqs626a - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:42 +0000
Message-Id: <20230102181842.718010-10-jic23@kernel.org>
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
 drivers/input/misc/iqs626a.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/iqs626a.c b/drivers/input/misc/iqs626a.c
index 23b5dd9552dc..4727e6b95e41 100644
--- a/drivers/input/misc/iqs626a.c
+++ b/drivers/input/misc/iqs626a.c
@@ -1712,7 +1712,7 @@ static int iqs626_probe(struct i2c_client *client)
 	return error;
 }
 
-static int __maybe_unused iqs626_suspend(struct device *dev)
+static int iqs626_suspend(struct device *dev)
 {
 	struct iqs626_private *iqs626 = dev_get_drvdata(dev);
 	struct i2c_client *client = iqs626->client;
@@ -1771,7 +1771,7 @@ static int __maybe_unused iqs626_suspend(struct device *dev)
 	return error;
 }
 
-static int __maybe_unused iqs626_resume(struct device *dev)
+static int iqs626_resume(struct device *dev)
 {
 	struct iqs626_private *iqs626 = dev_get_drvdata(dev);
 	struct i2c_client *client = iqs626->client;
@@ -1818,7 +1818,7 @@ static int __maybe_unused iqs626_resume(struct device *dev)
 	return error;
 }
 
-static SIMPLE_DEV_PM_OPS(iqs626_pm, iqs626_suspend, iqs626_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(iqs626_pm, iqs626_suspend, iqs626_resume);
 
 static const struct of_device_id iqs626_of_match[] = {
 	{ .compatible = "azoteq,iqs626a" },
@@ -1830,7 +1830,7 @@ static struct i2c_driver iqs626_i2c_driver = {
 	.driver = {
 		.name = "iqs626a",
 		.of_match_table = iqs626_of_match,
-		.pm = &iqs626_pm,
+		.pm = pm_sleep_ptr(&iqs626_pm),
 	},
 	.probe_new = iqs626_probe,
 };
-- 
2.39.0

