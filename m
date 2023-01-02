Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55F2865B650
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236488AbjABSHA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:07:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236486AbjABSGd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:33 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2184DAD
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4F5AA61084
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9EE0C433D2;
        Mon,  2 Jan 2023 18:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682791;
        bh=t3XtVjo6jR8vWFZbI6nj9aLXlGbINHR9jQqeT3yIrcA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r6/1KmJCvk9k08Cp2mQz83ioOHwZmNjnTnkShzuRpQFhhBErNH3UUwV07B2zcal6W
         rtOH2KOU0jDNA6U8norDSFfglakXZ5vz7lONRKK00SxXQ3PEz9Iarb0GpUH6yNvrbN
         U+MrjosmqWPr9EeU7mO9nszNCPKKoubVzzzUvfFdYL7HqdokCY5p2N1TZC3uVNNRoC
         Zda4SU48dotyWYQZg2wLaz6ITDLHrFIL2ahDpL0Yzp3Aw4HZ4MRrt65/u0jVbG4M+z
         Bva6QgSQr8l2f2I4NGERetevwurtcHF+Qcb5f6CkIpwJZhoWzpUN6pE7cYQR4Ar3Hf
         plzF1USbh1ywQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 29/69] Input: ambakmi - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:18:02 +0000
Message-Id: <20230102181842.718010-30-jic23@kernel.org>
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
 drivers/input/serio/ambakmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/serio/ambakmi.c b/drivers/input/serio/ambakmi.c
index c391700fc4ae..8fbfa448be4a 100644
--- a/drivers/input/serio/ambakmi.c
+++ b/drivers/input/serio/ambakmi.c
@@ -170,7 +170,7 @@ static void amba_kmi_remove(struct amba_device *dev)
 	amba_release_regions(dev);
 }
 
-static int __maybe_unused amba_kmi_resume(struct device *dev)
+static int amba_kmi_resume(struct device *dev)
 {
 	struct amba_kmi_port *kmi = dev_get_drvdata(dev);
 
@@ -180,7 +180,7 @@ static int __maybe_unused amba_kmi_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(amba_kmi_dev_pm_ops, NULL, amba_kmi_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(amba_kmi_dev_pm_ops, NULL, amba_kmi_resume);
 
 static const struct amba_id amba_kmi_idtable[] = {
 	{
@@ -196,7 +196,7 @@ static struct amba_driver ambakmi_driver = {
 	.drv		= {
 		.name	= "kmi-pl050",
 		.owner	= THIS_MODULE,
-		.pm	= &amba_kmi_dev_pm_ops,
+		.pm	= pm_sleep_ptr(&amba_kmi_dev_pm_ops),
 	},
 	.id_table	= amba_kmi_idtable,
 	.probe		= amba_kmi_probe,
-- 
2.39.0

