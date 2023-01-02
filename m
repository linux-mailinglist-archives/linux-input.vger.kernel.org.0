Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB00665B64E
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236448AbjABSG4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236480AbjABSGb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:06:31 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68E255BB
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:06:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 72169B80DE3
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0436DC433D2;
        Mon,  2 Jan 2023 18:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682788;
        bh=g7UO7iKHYk0zDfciAqVRrsAYuaIPGXqDb8Nz8BCx4bs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CbVX+zF6IUFfHT/mIlBVehdut3KTB6g7wtmUapr+kcfEJGRXBo2+fBaoDS7iuYSeB
         bX6OIm770bDpR6YAwc+1AEAmMObO7EyB3ZyOF56P2ELjsdH21HmmSwY1baOicoukx8
         FAODKAEeaVWNC4qxCVZ8Hk740TfV1g34pLF7uOjpn636Wn4aW9are61DI3au/QNFKq
         EaCj6UO8rttrWEnpEo3DNKxWdQ9HxAJo1QLBNC8mjpd1nMQ4dVieAzAvOHU5YivKJi
         Nk+iSRoK4ZamjFHYEFceroL2MVUEy5uRfwykkGHnmEiz/vSVaXGEmmjxNk485Xbu7/
         GD0Wf1eLd7X+A==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Raul E Rangel <rrangel@chromium.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 26/69] Input: elan_i2c_core - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Mon,  2 Jan 2023 18:17:59 +0000
Message-Id: <20230102181842.718010-27-jic23@kernel.org>
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
Cc: Raul E Rangel <rrangel@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/mouse/elan_i2c_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 76729ada1582..5f0d75a45c80 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -1328,7 +1328,7 @@ static int elan_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused elan_suspend(struct device *dev)
+static int elan_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct elan_tp_data *data = i2c_get_clientdata(client);
@@ -1365,7 +1365,7 @@ static int __maybe_unused elan_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused elan_resume(struct device *dev)
+static int elan_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct elan_tp_data *data = i2c_get_clientdata(client);
@@ -1394,7 +1394,7 @@ static int __maybe_unused elan_resume(struct device *dev)
 	return error;
 }
 
-static SIMPLE_DEV_PM_OPS(elan_pm_ops, elan_suspend, elan_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(elan_pm_ops, elan_suspend, elan_resume);
 
 static const struct i2c_device_id elan_id[] = {
 	{ DRIVER_NAME, 0 },
@@ -1418,7 +1418,7 @@ MODULE_DEVICE_TABLE(of, elan_of_match);
 static struct i2c_driver elan_driver = {
 	.driver = {
 		.name	= DRIVER_NAME,
-		.pm	= &elan_pm_ops,
+		.pm	= pm_sleep_ptr(&elan_pm_ops),
 		.acpi_match_table = ACPI_PTR(elan_acpi_id),
 		.of_match_table = of_match_ptr(elan_of_match),
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-- 
2.39.0

