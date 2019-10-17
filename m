Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 092E6DB876
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502962AbfJQUmt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:42:49 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37940 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502902AbfJQUms (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:48 -0400
Received: by mail-pl1-f195.google.com with SMTP id w8so1702233plq.5;
        Thu, 17 Oct 2019 13:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5BIGpmeokH2sY4/0NRYi8Dgb6NHFzLHS/Fu+tgAQ27o=;
        b=b8aIqbUI+I12/63O85JG9GaYo6uedNwIl8VfTpEuBFBxE/m4bCa4XEiHS5/ooQrJja
         2RrVlk0otj/5twmTfarVPgwBpU07spppv4SgF8/gg/lsFoYNn4HjfcXjtIMSXBB+jx3W
         ruD92QMS6MF6R/kcmTjB4seN+rXiEltoLWqqLjK376eOJ3Xa2epzyYCDmvXPkepsLvxX
         snP6s73ez0/84xfqnslmWgMAD8oyJq3df3tAIrD8uHCRzdZeVpiM80Hfmlo1+780rrSd
         TUeh2SLnx/MAhkqDIR1EPKMlaX5N7tEXcqS1U9HVWln9JYcxRdDzkrZfgCFpkVKNyGmN
         6s+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5BIGpmeokH2sY4/0NRYi8Dgb6NHFzLHS/Fu+tgAQ27o=;
        b=BsA4qq60pZb+PHJQZMPawJ0Im32zyhuuhOIHLb9AIzipxmZjlWiQjntC6FVlSe/OxA
         Ah6FG1UeWavchSKCWONby15cZTZt0iLstJIFmJE7hp8ghSmod0UdOHiYVJF2g/MVfi3y
         2omP/BWNjWHu/b92suA3NS5ScIt5f7GyZTlJyYrLCpCTzIuE2Fsn4uPzX0ob3jN2BDAp
         8oAnAcy1TTQT9wv219UWaO8sy9wEj9QPeoYPmiAhg8SlUi8FBSxm7YxwSpqh45USWhiS
         XIOLF+0rOr4sNRzbk8XQmuFWs/HC0Im/bqbU4neXELPDm93lpOHGnkQwUb4t+tHtXNKj
         m+Tg==
X-Gm-Message-State: APjAAAUxLO04oJCKw5oewjOl5HuP+W9QeV5YGOsF8Jjy9BPz85bR5/YD
        CHiIIGWnuxcgfhUf4IpAqUW6fSBz
X-Google-Smtp-Source: APXvYqzMrPPmPFf8xEra5/XAodpUzGqyd3bDtsf2KLXUA3HeM6peOxzXezE2E84VvGvFodf2W6YLoA==
X-Received: by 2002:a17:902:bb92:: with SMTP id m18mr5740841pls.297.1571344967359;
        Thu, 17 Oct 2019 13:42:47 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:46 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Jonathan Bakker <xc-racer2@live.ca>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 19/22] Input: bma150 - use managed resources helpers
Date:   Thu, 17 Oct 2019 13:42:13 -0700
Message-Id: <20191017204217.106453-20-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
References: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jonathan Bakker <xc-racer2@live.ca>

The driver can be cleaned up by using managed resource helpers.

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
Patchwork-Id: 10794333
[dtor: do not explicitly set parent of input device since we are using devm]
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/misc/bma150.c | 51 ++++++++++---------------------------
 1 file changed, 14 insertions(+), 37 deletions(-)

diff --git a/drivers/input/misc/bma150.c b/drivers/input/misc/bma150.c
index 735d3a46f44b..d65b008a3c7a 100644
--- a/drivers/input/misc/bma150.c
+++ b/drivers/input/misc/bma150.c
@@ -439,13 +439,11 @@ static int bma150_initialize(struct bma150_data *bma150,
 	return bma150_set_mode(bma150, BMA150_MODE_SLEEP);
 }
 
-static void bma150_init_input_device(struct bma150_data *bma150,
-						struct input_dev *idev)
+static void bma150_init_input_device(struct input_dev *idev)
 {
 	idev->name = BMA150_DRIVER;
 	idev->phys = BMA150_DRIVER "/input0";
 	idev->id.bustype = BUS_I2C;
-	idev->dev.parent = &bma150->client->dev;
 
 	idev->evbit[0] = BIT_MASK(EV_ABS);
 	input_set_abs_params(idev, ABS_X, ABSMIN_ACC_VAL, ABSMAX_ACC_VAL, 0, 0);
@@ -458,11 +456,11 @@ static int bma150_register_input_device(struct bma150_data *bma150)
 	struct input_dev *idev;
 	int error;
 
-	idev = input_allocate_device();
+	idev = devm_input_allocate_device(&bma150->client->dev);
 	if (!idev)
 		return -ENOMEM;
 
-	bma150_init_input_device(bma150, idev);
+	bma150_init_input_device(idev);
 
 	idev->open = bma150_irq_open;
 	idev->close = bma150_irq_close;
@@ -471,10 +469,8 @@ static int bma150_register_input_device(struct bma150_data *bma150)
 	bma150->input = idev;
 
 	error = input_register_device(idev);
-	if (error) {
-		input_free_device(idev);
+	if (error)
 		return error;
-	}
 
 	return 0;
 }
@@ -484,7 +480,7 @@ static int bma150_register_polled_device(struct bma150_data *bma150)
 	struct input_polled_dev *ipoll_dev;
 	int error;
 
-	ipoll_dev = input_allocate_polled_device();
+	ipoll_dev = devm_input_allocate_polled_device(&bma150->client->dev);
 	if (!ipoll_dev)
 		return -ENOMEM;
 
@@ -496,16 +492,14 @@ static int bma150_register_polled_device(struct bma150_data *bma150)
 	ipoll_dev->poll_interval_min = BMA150_POLL_MIN;
 	ipoll_dev->poll_interval_max = BMA150_POLL_MAX;
 
-	bma150_init_input_device(bma150, ipoll_dev->input);
+	bma150_init_input_device(ipoll_dev->input);
 
 	bma150->input_polled = ipoll_dev;
 	bma150->input = ipoll_dev->input;
 
 	error = input_register_polled_device(ipoll_dev);
-	if (error) {
-		input_free_polled_device(ipoll_dev);
+	if (error)
 		return error;
-	}
 
 	return 0;
 }
@@ -531,7 +525,7 @@ static int bma150_probe(struct i2c_client *client,
 		return -EINVAL;
 	}
 
-	bma150 = kzalloc(sizeof(struct bma150_data), GFP_KERNEL);
+	bma150 = devm_kzalloc(&client->dev, sizeof(*bma150), GFP_KERNEL);
 	if (!bma150)
 		return -ENOMEM;
 
@@ -544,7 +538,7 @@ static int bma150_probe(struct i2c_client *client,
 				dev_err(&client->dev,
 					"IRQ GPIO conf. error %d, error %d\n",
 					client->irq, error);
-				goto err_free_mem;
+				return error;
 			}
 		}
 		cfg = &pdata->cfg;
@@ -554,14 +548,14 @@ static int bma150_probe(struct i2c_client *client,
 
 	error = bma150_initialize(bma150, cfg);
 	if (error)
-		goto err_free_mem;
+		return error;
 
 	if (client->irq > 0) {
 		error = bma150_register_input_device(bma150);
 		if (error)
-			goto err_free_mem;
+			return error;
 
-		error = request_threaded_irq(client->irq,
+		error = devm_request_threaded_irq(&client->dev, client->irq,
 					NULL, bma150_irq_thread,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 					BMA150_DRIVER, bma150);
@@ -569,13 +563,12 @@ static int bma150_probe(struct i2c_client *client,
 			dev_err(&client->dev,
 				"irq request failed %d, error %d\n",
 				client->irq, error);
-			input_unregister_device(bma150->input);
-			goto err_free_mem;
+			return error;
 		}
 	} else {
 		error = bma150_register_polled_device(bma150);
 		if (error)
-			goto err_free_mem;
+			return error;
 	}
 
 	i2c_set_clientdata(client, bma150);
@@ -583,28 +576,12 @@ static int bma150_probe(struct i2c_client *client,
 	pm_runtime_enable(&client->dev);
 
 	return 0;
-
-err_free_mem:
-	kfree(bma150);
-	return error;
 }
 
 static int bma150_remove(struct i2c_client *client)
 {
-	struct bma150_data *bma150 = i2c_get_clientdata(client);
-
 	pm_runtime_disable(&client->dev);
 
-	if (client->irq > 0) {
-		free_irq(client->irq, bma150);
-		input_unregister_device(bma150->input);
-	} else {
-		input_unregister_polled_device(bma150->input_polled);
-		input_free_polled_device(bma150->input_polled);
-	}
-
-	kfree(bma150);
-
 	return 0;
 }
 
-- 
2.23.0.866.gb869b98d4c-goog

