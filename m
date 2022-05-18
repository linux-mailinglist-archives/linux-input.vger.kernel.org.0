Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80CBE52C56F
	for <lists+linux-input@lfdr.de>; Wed, 18 May 2022 23:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243028AbiERVFk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 May 2022 17:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243036AbiERVFj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 May 2022 17:05:39 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E9A2573D0
        for <linux-input@vger.kernel.org>; Wed, 18 May 2022 14:05:31 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 4006B830E5;
        Wed, 18 May 2022 23:04:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1652907879;
        bh=WAxLo1k71eSwV5pd2uFctHY+eM07qoubAOtehyQ1sFk=;
        h=From:To:Cc:Subject:Date:From;
        b=hHdQcToi8aZOCH+EwNftBaxNCMcZHWze3ZWpk2qt0stn0W261bVMQMEIgJgXvvix4
         idcKY/+lJnuOQ3+PqsTqqY9Xt0POAtegwgdBDP78al285g5dTSLnKH/auHlUiSMkpy
         kViFe0zIUCZgkAQbQgU0o04+qBQzP3uYLVAORDW0F71GjRS4BWgu711EppurH/6lCK
         RQHoljzv7fsbR5nYJxHmYr59dYMPYn+G+R/r7jhfkr1J/QZsMuOJBCVYowop0ljg/w
         H+dmR1+DbuwqLuXs7VKG0aAMQ6RmMWaeaCydqxjQR7DC2SekY+OHtjrjNko0lPBIm5
         7RKyYJj3Nna8g==
From:   Marek Vasut <marex@denx.de>
To:     linux-input@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] Input: ili210x - Use one common reset implementation
Date:   Wed, 18 May 2022 23:04:23 +0200
Message-Id: <20220518210423.106555-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Rename ili251x_hardware_reset() to ili210x_hardware_reset(), change its
parameter from struct device * to struct gpio_desc *, and use it as one
single consistent reset implementation all over the driver. Also increase
the minimum reset duration to 12ms, to make sure the reset is really
within the spec.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/ili210x.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 3a48262fb3d35..e9bd36adbe47d 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -756,15 +756,12 @@ static int ili251x_firmware_reset(struct i2c_client *client)
 	return ili251x_firmware_busy(client);
 }
 
-static void ili251x_hardware_reset(struct device *dev)
+static void ili210x_hardware_reset(struct gpio_desc *reset_gpio)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct ili210x *priv = i2c_get_clientdata(client);
-
 	/* Reset the controller */
-	gpiod_set_value_cansleep(priv->reset_gpio, 1);
-	usleep_range(10000, 15000);
-	gpiod_set_value_cansleep(priv->reset_gpio, 0);
+	gpiod_set_value_cansleep(reset_gpio, 1);
+	usleep_range(12000, 15000);
+	gpiod_set_value_cansleep(reset_gpio, 0);
 	msleep(300);
 }
 
@@ -773,6 +770,7 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
 					     const char *buf, size_t count)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
 	const char *fwname = ILI251X_FW_FILENAME;
 	const struct firmware *fw;
 	u16 ac_end, df_end;
@@ -803,7 +801,7 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
 
 	dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
 
-	ili251x_hardware_reset(dev);
+	ili210x_hardware_reset(priv->reset_gpio);
 
 	error = ili251x_firmware_reset(client);
 	if (error)
@@ -858,7 +856,7 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
 	error = count;
 
 exit:
-	ili251x_hardware_reset(dev);
+	ili210x_hardware_reset(priv->reset_gpio);
 	dev_dbg(dev, "Firmware update ended, error=%i\n", error);
 	enable_irq(client->irq);
 	kfree(fwbuf);
@@ -951,9 +949,7 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 		if (error)
 			return error;
 
-		usleep_range(12000, 15000);
-		gpiod_set_value_cansleep(reset_gpio, 0);
-		msleep(160);
+		ili210x_hardware_reset(reset_gpio);
 	}
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-- 
2.35.1

