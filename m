Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A54DD66ACCF
	for <lists+linux-input@lfdr.de>; Sat, 14 Jan 2023 18:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbjANRDB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Jan 2023 12:03:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjANRC6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Jan 2023 12:02:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90ABFA5E7
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 09:02:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CCA7660C01
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 17:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD577C433F1;
        Sat, 14 Jan 2023 17:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673715776;
        bh=nlMdMd2y95nj+GZ/gHWmoFqd9EX1t22cq2MbuMZ/G7E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ceXMsYhyjxEztwVmRhkcE0RQbHQc7KkBa1llJqIoWcDduEqRgPj/qUKaVjgr+Kpz/
         y+qxDCFTVewr2ubuIiXWK12nQX4AbCHwAS0Ey7sfxydV6zTn3BuXHqs1N5/D5dhrSb
         5vPMtab6UCw4lo7Pi7oqVq6I+468ydIQvQFmH6R9rEU10koKlGJkQ4Ec+hRIC3wTAV
         tdSjVogfN8nDsYH+MfLuDvg1kSWiurRwKbdL62DGNYWiJKIb0X36vomYFJRROYBKQd
         Tr7ummUwRbnibHKYwXHM9T/AE1vdPXD73ib/CgPKKGnqYSicflFNALR0P2Bbp33k/b
         6QX7aiCfM1Hmw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     jic23@kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Lyude Paul <lyude@redhat.com>,
        Andrew Duggan <aduggan@synaptics.com>
Subject: [PATCH 05/16] Input: rmi4 - switch to SYSTEM_SLEEP/RUNTIME_PM_OPS() and pm_ptr()
Date:   Sat, 14 Jan 2023 17:16:09 +0000
Message-Id: <20230114171620.42891-6-jic23@kernel.org>
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

SET_SYSTEM_SLEEP_PM_OPS() and SET_RUNTIME_PM_OPS() are deprecated
as they requires explicit protection against unused function warnings.
The new combination of pm_ptr() and SYSTEM_SLEEP_PM_OPS() /
RUNTIME_PM_OPS() allows the compiler to see the functions,
thus suppressing the warning, but still allowing the unused code to
be removed. Thus also drop the #ifdef guards.

Whilst all 3 sets of callbacks are similar, there are small differences
that make it challenging to use a single pm_dev_ops structure - hence
leave the duplication as it stands.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Andrew Duggan <aduggan@synaptics.com>
---
 drivers/input/rmi4/rmi_i2c.c   | 11 +++--------
 drivers/input/rmi4/rmi_smbus.c | 15 +++++++--------
 drivers/input/rmi4/rmi_spi.c   | 11 +++--------
 3 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/drivers/input/rmi4/rmi_i2c.c b/drivers/input/rmi4/rmi_i2c.c
index f2b75c6d3224..d69569ce8d8d 100644
--- a/drivers/input/rmi4/rmi_i2c.c
+++ b/drivers/input/rmi4/rmi_i2c.c
@@ -287,7 +287,6 @@ static int rmi_i2c_probe(struct i2c_client *client)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int rmi_i2c_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -323,9 +322,7 @@ static int rmi_i2c_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
-#ifdef CONFIG_PM
 static int rmi_i2c_runtime_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -361,12 +358,10 @@ static int rmi_i2c_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops rmi_i2c_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rmi_i2c_suspend, rmi_i2c_resume)
-	SET_RUNTIME_PM_OPS(rmi_i2c_runtime_suspend, rmi_i2c_runtime_resume,
-			   NULL)
+	SYSTEM_SLEEP_PM_OPS(rmi_i2c_suspend, rmi_i2c_resume)
+	RUNTIME_PM_OPS(rmi_i2c_runtime_suspend, rmi_i2c_runtime_resume, NULL)
 };
 
 static const struct i2c_device_id rmi_id[] = {
@@ -378,7 +373,7 @@ MODULE_DEVICE_TABLE(i2c, rmi_id);
 static struct i2c_driver rmi_i2c_driver = {
 	.driver = {
 		.name	= "rmi4_i2c",
-		.pm	= &rmi_i2c_pm,
+		.pm	= pm_ptr(&rmi_i2c_pm),
 		.of_match_table = of_match_ptr(rmi_i2c_of_match),
 	},
 	.id_table	= rmi_id,
diff --git a/drivers/input/rmi4/rmi_smbus.c b/drivers/input/rmi4/rmi_smbus.c
index 8a9ee2bd7402..4bf0e1df6a4a 100644
--- a/drivers/input/rmi4/rmi_smbus.c
+++ b/drivers/input/rmi4/rmi_smbus.c
@@ -344,7 +344,7 @@ static void rmi_smb_remove(struct i2c_client *client)
 	rmi_unregister_transport_device(&rmi_smb->xport);
 }
 
-static int __maybe_unused rmi_smb_suspend(struct device *dev)
+static int rmi_smb_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct rmi_smb_xport *rmi_smb = i2c_get_clientdata(client);
@@ -357,7 +357,7 @@ static int __maybe_unused rmi_smb_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused rmi_smb_runtime_suspend(struct device *dev)
+static int rmi_smb_runtime_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct rmi_smb_xport *rmi_smb = i2c_get_clientdata(client);
@@ -370,7 +370,7 @@ static int __maybe_unused rmi_smb_runtime_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused rmi_smb_resume(struct device *dev)
+static int rmi_smb_resume(struct device *dev)
 {
 	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
 	struct rmi_smb_xport *rmi_smb = i2c_get_clientdata(client);
@@ -388,7 +388,7 @@ static int __maybe_unused rmi_smb_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rmi_smb_runtime_resume(struct device *dev)
+static int rmi_smb_runtime_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct rmi_smb_xport *rmi_smb = i2c_get_clientdata(client);
@@ -402,9 +402,8 @@ static int __maybe_unused rmi_smb_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rmi_smb_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rmi_smb_suspend, rmi_smb_resume)
-	SET_RUNTIME_PM_OPS(rmi_smb_runtime_suspend, rmi_smb_runtime_resume,
-			   NULL)
+	SYSTEM_SLEEP_PM_OPS(rmi_smb_suspend, rmi_smb_resume)
+	RUNTIME_PM_OPS(rmi_smb_runtime_suspend, rmi_smb_runtime_resume, NULL)
 };
 
 static const struct i2c_device_id rmi_id[] = {
@@ -416,7 +415,7 @@ MODULE_DEVICE_TABLE(i2c, rmi_id);
 static struct i2c_driver rmi_smb_driver = {
 	.driver = {
 		.name	= "rmi4_smbus",
-		.pm	= &rmi_smb_pm,
+		.pm	= pm_ptr(&rmi_smb_pm),
 	},
 	.id_table	= rmi_id,
 	.probe_new	= rmi_smb_probe,
diff --git a/drivers/input/rmi4/rmi_spi.c b/drivers/input/rmi4/rmi_spi.c
index c82edda66b23..c5c5e7f3401e 100644
--- a/drivers/input/rmi4/rmi_spi.c
+++ b/drivers/input/rmi4/rmi_spi.c
@@ -447,7 +447,6 @@ static int rmi_spi_probe(struct spi_device *spi)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int rmi_spi_suspend(struct device *dev)
 {
 	struct spi_device *spi = to_spi_device(dev);
@@ -473,9 +472,7 @@ static int rmi_spi_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
-#ifdef CONFIG_PM
 static int rmi_spi_runtime_suspend(struct device *dev)
 {
 	struct spi_device *spi = to_spi_device(dev);
@@ -501,12 +498,10 @@ static int rmi_spi_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops rmi_spi_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rmi_spi_suspend, rmi_spi_resume)
-	SET_RUNTIME_PM_OPS(rmi_spi_runtime_suspend, rmi_spi_runtime_resume,
-			   NULL)
+	SYSTEM_SLEEP_PM_OPS(rmi_spi_suspend, rmi_spi_resume)
+	RUNTIME_PM_OPS(rmi_spi_runtime_suspend, rmi_spi_runtime_resume, NULL)
 };
 
 static const struct spi_device_id rmi_id[] = {
@@ -518,7 +513,7 @@ MODULE_DEVICE_TABLE(spi, rmi_id);
 static struct spi_driver rmi_spi_driver = {
 	.driver = {
 		.name	= "rmi4_spi",
-		.pm	= &rmi_spi_pm,
+		.pm	= pm_ptr(&rmi_spi_pm),
 		.of_match_table = of_match_ptr(rmi_spi_of_match),
 	},
 	.id_table	= rmi_id,
-- 
2.39.0

