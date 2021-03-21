Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC2334354E
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 23:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbhCUWBC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 18:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbhCUWAu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 18:00:50 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72101C061574;
        Sun, 21 Mar 2021 15:00:50 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so7509835pjb.2;
        Sun, 21 Mar 2021 15:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kzBFnnS54n0KuszsZ/rIwrnM8XTvY8tIK8mV06s3FGc=;
        b=VgPy4DaOn65+/cQIeilZjF/4iSZsZDYP7RxmLKSmaS1X22aJ238+VzTVEkWcFjdqdh
         PyEx4Cn3O/1Eid0g5+A99Tu6pYfyX5tVQLcuzBMfu3SmPA8zbbSiuyaUJG/u3ImcKB5P
         EfHO5bk0qAsZk+kv18HkaQqjXlznWCCwAu9rS5IkPXEQUpZpzpciRNCXcIQw4ec0lUIK
         XUzkqy2Ggoj/ftc2hn4dbL2Y6iTC6OLKQeK1RCz+qdZP5M6XfMLCybcMRgaGWDjDvFkl
         Az7ChYUtv3jTlNbl1cw9ERozutTIXnPhGyq/AmaEjm/to6SdMxcAfuRlErzqh7znZVTU
         OQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kzBFnnS54n0KuszsZ/rIwrnM8XTvY8tIK8mV06s3FGc=;
        b=ma07WOxuBjUVKqyvTwdRxKScehcx0th0XLLnmfy8F6oMdBKddAxE2LKMRiQrWIgjPa
         sn2mr8/NjbloFYaeuHNQdEFwIz6Tsn9xzx7zYor3GvYYOUUOaKK2wTvDqE0WjXKK2zv6
         kqscvImIetrVi71Yb84WSHbaxxUNdpboAXnjOBo9w9joLBiExoZnnaJI3FFxw4pDpQZG
         VE3k21Pd9tDzssWNBWh/8CyjpstMulUvlS/eC6INPtljpZZpq/MHDvWsislRQFD4c1pR
         l5N6PI04oSOvdFCRAQfAOH24BzhRPRYX7yUBU37kLsIBqhyIu9JTj5GqCi6X63YCmCLT
         GjuQ==
X-Gm-Message-State: AOAM531s3jdtgilp4t0WaYz0nLjMRpy1r8bqSMQp895cy5vGp8M1NRss
        aIZx9Om0d9q3AdISsCPQpgqIKH8BZnI=
X-Google-Smtp-Source: ABdhPJxR15TYOxfvUOz7YLjIn10PNTZMDe3FMJoDPjjoz/fk6UpcIql1dQbUBU0GVBZYLIxDmIgtGw==
X-Received: by 2002:a17:90b:10a:: with SMTP id p10mr9862882pjz.148.1616364049299;
        Sun, 21 Mar 2021 15:00:49 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id w17sm10617557pgg.41.2021.03.21.15.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 15:00:48 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH 2/2] Input: wacom_i2c - switch to using managed resources
Date:   Sun, 21 Mar 2021 15:00:43 -0700
Message-Id: <20210321220043.318239-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210321220043.318239-1-dmitry.torokhov@gmail.com>
References: <20210321220043.318239-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This simplifies error unwinding path and allows us to get rid of
remove() method.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/wacom_i2c.c | 55 +++++++++------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 609ff84e7693..22826c387da5 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -145,15 +145,16 @@ static void wacom_i2c_close(struct input_dev *dev)
 }
 
 static int wacom_i2c_probe(struct i2c_client *client,
-				     const struct i2c_device_id *id)
+			   const struct i2c_device_id *id)
 {
+	struct device *dev = &client->dev;
 	struct wacom_i2c *wac_i2c;
 	struct input_dev *input;
 	struct wacom_features features = { 0 };
 	int error;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
-		dev_err(&client->dev, "i2c_check_functionality error\n");
+		dev_err(dev, "i2c_check_functionality error\n");
 		return -EIO;
 	}
 
@@ -161,21 +162,22 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	if (error)
 		return error;
 
-	wac_i2c = kzalloc(sizeof(*wac_i2c), GFP_KERNEL);
-	input = input_allocate_device();
-	if (!wac_i2c || !input) {
-		error = -ENOMEM;
-		goto err_free_mem;
-	}
+	wac_i2c = devm_kzalloc(dev, sizeof(*wac_i2c), GFP_KERNEL);
+	if (!wac_i2c)
+		return -ENOMEM;
 
 	wac_i2c->client = client;
+
+	input = devm_input_allocate_device(dev);
+	if (!input)
+		return -ENOMEM;
+
 	wac_i2c->input = input;
 
 	input->name = "Wacom I2C Digitizer";
 	input->id.bustype = BUS_I2C;
 	input->id.vendor = 0x56a;
 	input->id.version = features.fw_version;
-	input->dev.parent = &client->dev;
 	input->open = wacom_i2c_open;
 	input->close = wacom_i2c_close;
 
@@ -194,12 +196,11 @@ static int wacom_i2c_probe(struct i2c_client *client,
 
 	input_set_drvdata(input, wac_i2c);
 
-	error = request_threaded_irq(client->irq, NULL, wacom_i2c_irq,
-				     IRQF_ONESHOT, "wacom_i2c", wac_i2c);
+	error = devm_request_threaded_irq(dev, client->irq, NULL, wacom_i2c_irq,
+					  IRQF_ONESHOT, "wacom_i2c", wac_i2c);
 	if (error) {
-		dev_err(&client->dev,
-			"Failed to enable IRQ, error: %d\n", error);
-		goto err_free_mem;
+		dev_err(dev, "Failed to request IRQ: %d\n", error);
+		return error;
 	}
 
 	/* Disable the IRQ, we'll enable it in wac_i2c_open() */
@@ -207,31 +208,10 @@ static int wacom_i2c_probe(struct i2c_client *client,
 
 	error = input_register_device(wac_i2c->input);
 	if (error) {
-		dev_err(&client->dev,
-			"Failed to register input device, error: %d\n", error);
-		goto err_free_irq;
+		dev_err(dev, "Failed to register input device: %d\n", error);
+		return error;
 	}
 
-	i2c_set_clientdata(client, wac_i2c);
-	return 0;
-
-err_free_irq:
-	free_irq(client->irq, wac_i2c);
-err_free_mem:
-	input_free_device(input);
-	kfree(wac_i2c);
-
-	return error;
-}
-
-static int wacom_i2c_remove(struct i2c_client *client)
-{
-	struct wacom_i2c *wac_i2c = i2c_get_clientdata(client);
-
-	free_irq(client->irq, wac_i2c);
-	input_unregister_device(wac_i2c->input);
-	kfree(wac_i2c);
-
 	return 0;
 }
 
@@ -268,7 +248,6 @@ static struct i2c_driver wacom_i2c_driver = {
 	},
 
 	.probe		= wacom_i2c_probe,
-	.remove		= wacom_i2c_remove,
 	.id_table	= wacom_i2c_id,
 };
 module_i2c_driver(wacom_i2c_driver);
-- 
2.31.0.rc2.261.g7f71774620-goog

