Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39BDA65B670
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236313AbjABSHb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236329AbjABSHR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:07:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39EA32F5
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:07:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DF2A9B80DF5
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77303C433F0;
        Mon,  2 Jan 2023 18:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682834;
        bh=dAlfi3RLLV0942y0dlxDhozOmjKNK0RGjvUZcn1Uj8g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NLICCP1Rg5GcxJxKzCLk/phcnwVjrYvyV6GvelsbW/InmTW5ddWnPXiS5afIYlF7j
         Ic5MQUHmjRU99YzJNHaTdmjo9UQDVN4xBMcwxwpkvu+EnteH1SbpIJJlxGSE/4X3bA
         66YDOHKAmxStWKDH6jATJ3vwYkO/XiGlRgVAhxH/yOe7jzjzvTdh3y2Otrn0PbKFUe
         spV/cgHc88WNGfU1A7WObx0oKhn8Os2BjfHiKQMGmst9yAMbn+0GigXu7Hyz5gK50J
         lnNGmUsL/20vEImt7ccuWutUAXrn4CTZt9RiTk2nkFoIS/HPFlL1opylTYtOpuvKe5
         itl9BEE9llfHg==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Stephen Just <stephenjust@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 61/69] Input: surface3_spi - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:34 +0000
Message-Id: <20230102181842.718010-62-jic23@kernel.org>
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
Cc: Stephen Just <stephenjust@gmail.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/input/touchscreen/surface3_spi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/surface3_spi.c b/drivers/input/touchscreen/surface3_spi.c
index 1da23e5585a0..31d140248f2e 100644
--- a/drivers/input/touchscreen/surface3_spi.c
+++ b/drivers/input/touchscreen/surface3_spi.c
@@ -369,7 +369,7 @@ static int surface3_spi_probe(struct spi_device *spi)
 	return 0;
 }
 
-static int __maybe_unused surface3_spi_suspend(struct device *dev)
+static int surface3_spi_suspend(struct device *dev)
 {
 	struct spi_device *spi = to_spi_device(dev);
 	struct surface3_ts_data *data = spi_get_drvdata(spi);
@@ -381,7 +381,7 @@ static int __maybe_unused surface3_spi_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused surface3_spi_resume(struct device *dev)
+static int surface3_spi_resume(struct device *dev)
 {
 	struct spi_device *spi = to_spi_device(dev);
 	struct surface3_ts_data *data = spi_get_drvdata(spi);
@@ -393,9 +393,9 @@ static int __maybe_unused surface3_spi_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(surface3_spi_pm_ops,
-			 surface3_spi_suspend,
-			 surface3_spi_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(surface3_spi_pm_ops,
+				surface3_spi_suspend,
+				surface3_spi_resume);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id surface3_spi_acpi_match[] = {
@@ -409,7 +409,7 @@ static struct spi_driver surface3_spi_driver = {
 	.driver = {
 		.name	= "Surface3-spi",
 		.acpi_match_table = ACPI_PTR(surface3_spi_acpi_match),
-		.pm = &surface3_spi_pm_ops,
+		.pm = pm_sleep_ptr(&surface3_spi_pm_ops),
 	},
 	.probe = surface3_spi_probe,
 };
-- 
2.39.0

