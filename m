Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 727E73FE2EE
	for <lists+linux-input@lfdr.de>; Wed,  1 Sep 2021 21:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344377AbhIATXt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 15:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbhIATXt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 15:23:49 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 406EFC061575;
        Wed,  1 Sep 2021 12:22:52 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id u21so679896qtw.8;
        Wed, 01 Sep 2021 12:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id;
        bh=PL6tMWt+pDh+s6ofmXVwfU83Mqm7g1Pf+LEmUoSo0nE=;
        b=MFVo1MlXgegFbdtBSOiETpNBYM4IQQ/Ff6X+rjs+Eq58fO4mf/Wiv7Uc/yKVIBUC1K
         lJW/NI5xXpeGODwGLYcAdon+jVqkQ1r42UdxA1KbptUsVNA43gXmXxs+YvFUxdBwvbar
         cABlqJnFaD4QOS5iAD8SnCGsFv/cNJ53rKRT2lPBie9Rd5inQpVaKl2H58XqBPDJ4m1T
         5r0ab2Etts14Nh7oH0G4m3Ut312Jq8jweEha4XlVMyxYqiF0K9iOBs8QqmTOpDEnMCab
         TeZYgyMJYdBFsqIYgVM8WeMjTzphLSP77L5kvfsvTL9o88EWNN7qA+PGRE1sdD5cONcb
         +ZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=PL6tMWt+pDh+s6ofmXVwfU83Mqm7g1Pf+LEmUoSo0nE=;
        b=d2aO3NrO4Dx5DYY0xU9XqXCcv+fEtp11GB9DUJGbTyvyJ4LQuUZPUnsbhUXgINbFn4
         jzPootoLi8UH2B47rEgnJEkA+NRTN2+V44oeZCFAg/0sfwKPi/m3NewQhrGQdrIVtN9S
         k8l8Zz2j+Cjp7pJVR7nwhelfUamOhAzvf+G9OAkt+R4s+fK9um9SGnJAOWwoOTNexuQq
         78Uv/hojNbh7C6q06HA7YRwNidyBQvlzposQ6bdX1SikO2h/H7647Yr3OxBBe9eQW9qq
         Z80VDvceiYSosEwmh9gZoWRn4GcZWapn1hPiP1nSJjOWM07pVIJx0juEYedFN2Yz5ZG3
         5d3w==
X-Gm-Message-State: AOAM532cvdHN2UmluiqCbNzGuK4uVJAqRCZ6PuhLmXgZ2HrxLXwesMCG
        85gKKStJlAUUdyoUbDMOiFOlO8oS9ZU/7g==
X-Google-Smtp-Source: ABdhPJw976UM26Pfk0skCJY438ClwwuIVQ7TdLcV+m0un5C/vkVSL3X08dIYNdq0wUzcdnALhgFN6Q==
X-Received: by 2002:ac8:7483:: with SMTP id v3mr974432qtq.113.1630524171397;
        Wed, 01 Sep 2021 12:22:51 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:3b96:107a:e5b5:6e20:b715:596c])
        by smtp.gmail.com with ESMTPSA id w18sm436883qto.91.2021.09.01.12.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 12:22:51 -0700 (PDT)
From:   Rogerio Pimentel <rpimentel.silva@gmail.com>
To:     dmitry.torokhov@gmail.com, rpimentel.silva@gmail.com,
        hansemro@outlook.com, marex@denx.de, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: ili210x - Set the device name according to the device model
Date:   Wed,  1 Sep 2021 16:22:29 -0300
Message-Id: <20210901192229.29864-1-rpimentel.silva@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Adding the device model into the device name is useful when
applications need to set different parameters according to the
touchscreen being used, e.g. X11 calibration points.

Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
---
 drivers/input/touchscreen/ili210x.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 30576a5f2f04..ca7af4a6f588 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -19,6 +19,8 @@
 #define ILI251X_DATA_SIZE1	31
 #define ILI251X_DATA_SIZE2	20
 
+#define ILI_NAME_LEN		27
+
 /* Touchscreen commands */
 #define REG_TOUCHDATA		0x10
 #define REG_PANEL_INFO		0x20
@@ -394,6 +396,7 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	struct input_dev *input;
 	int error;
 	unsigned int max_xy;
+	char *model_name;
 
 	dev_dbg(dev, "Probing for ILI210X I2C Touschreen driver");
 
@@ -440,7 +443,11 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	i2c_set_clientdata(client, priv);
 
 	/* Setup input device */
-	input->name = "ILI210x Touchscreen";
+	input->name = "Ilitek         Touchscreen";
+	model_name = (char *)input->name;
+	snprintf(model_name, ILI_NAME_LEN, "Ilitek %s Touchscreen",
+	id->name);
+	input->name = model_name;
 	input->id.bustype = BUS_I2C;
 
 	/* Multi touch */
@@ -487,10 +494,10 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 }
 
 static const struct i2c_device_id ili210x_i2c_id[] = {
-	{ "ili210x", (long)&ili210x_chip },
-	{ "ili2117", (long)&ili211x_chip },
-	{ "ili2120", (long)&ili212x_chip },
-	{ "ili251x", (long)&ili251x_chip },
+	{ .name = "ili210x", (long)&ili210x_chip },
+	{ .name = "ili2117", (long)&ili211x_chip },
+	{ .name = "ili2120", (long)&ili212x_chip },
+	{ .name = "ili251x", (long)&ili251x_chip },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ili210x_i2c_id);
-- 
2.17.1

