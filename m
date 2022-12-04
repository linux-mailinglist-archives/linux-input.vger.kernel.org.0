Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3D7E641E5E
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbiLDR4y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbiLDR43 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85983140CD
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3A156B80B89
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36468C433D6;
        Sun,  4 Dec 2022 17:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176586;
        bh=zF6amAXTX9YciA6NiuXXHgBN8jTQyFOrZOg9yvy/vnA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IKCHkix1F2I0qj2ZYmq+QOq8CR0SRi62THiKdiUAUU2kiecl5C8GjyReQEpKfHNrB
         SnA/z/MrlQHQImn2SneUnvvKalscB0cNudA8FMWKut/8rtp+eBxIW4gzEoNw54aYHw
         mT7tSvwVUv5nzsnEODBv/PreRs6wS05gK/I8BBX+AamHDRwgr5lpFdzopFJPqyVhXN
         3a6X9osmm82QLlkGLh2qRwCdGT2BfOZc35uOwnwunBdik+l2yMvdZSg8fYXnZuDvsK
         GJqTu0jy+jaT//vpeaGxgaRPmcifdSdb7JRhGh7O3tOhyssNHziYfRXpsRR+J01Tcb
         0SmP4S+KqO/EA==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 16/32] Input: max7359-keypad - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:25 +0000
Message-Id: <20221204180841.2211588-17-jic23@kernel.org>
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
removed. Thus also drop the ifdef guards.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/input/keyboard/max7359_keypad.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/max7359_keypad.c b/drivers/input/keyboard/max7359_keypad.c
index 1bba11ed4132..b363749d02e2 100644
--- a/drivers/input/keyboard/max7359_keypad.c
+++ b/drivers/input/keyboard/max7359_keypad.c
@@ -242,7 +242,6 @@ static int max7359_probe(struct i2c_client *client)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int max7359_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -267,9 +266,8 @@ static int max7359_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(max7359_pm, max7359_suspend, max7359_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(max7359_pm, max7359_suspend, max7359_resume);
 
 static const struct i2c_device_id max7359_ids[] = {
 	{ "max7359", 0 },
@@ -280,7 +278,7 @@ MODULE_DEVICE_TABLE(i2c, max7359_ids);
 static struct i2c_driver max7359_i2c_driver = {
 	.driver = {
 		.name = "max7359",
-		.pm   = &max7359_pm,
+		.pm   = pm_sleep_ptr(&max7359_pm),
 	},
 	.probe_new	= max7359_probe,
 	.id_table	= max7359_ids,
-- 
2.38.1

