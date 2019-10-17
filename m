Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76E7BDB877
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503026AbfJQUmv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:42:51 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45152 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502953AbfJQUmt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:49 -0400
Received: by mail-pf1-f196.google.com with SMTP id y72so2361447pfb.12;
        Thu, 17 Oct 2019 13:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vAKokueiClfgZWoQCwU8Jqzeem8xmhIKqG8ZDiQeajw=;
        b=Z/tCFqJZa3I/4A0KsK3WCQ/C81WwubeVJRmnywGwef2pwV/hdLrBaJgsq9kU2uIeLJ
         bnG0t3ls8hgwX0VXXMzH1hkYJngOLZMn20F28VSnQ2r0URsV6b+MTZ3newLpB5Kb+14U
         CT/CSxJJM9Wp9RpD1AWZ8Z5CmKDcXpxBOuHsKd33slbKH67tQHu2927Kk4iRhrp2cQGQ
         XmDijMACki6S8Wp0GjlcubP4awb7fqB53748fOWmEcRJ3D2Tqvlmzaw2CE81nt3fUq9p
         LljZ0f/ot3LJLvrpG4mw3d51ST0KHo8vz7xifta9geDsvH/sOkwTR9Vz8ESHqIodjo3G
         ScUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vAKokueiClfgZWoQCwU8Jqzeem8xmhIKqG8ZDiQeajw=;
        b=p56lAOBrNU//aXSSD9DhzoedRoLulIQYaJJuFLkrddcE2c7wY7EIq2tbiMqyriqkYu
         ebcCJz19/geEpfWlSfUinxaKpTl/suV6JfD6CRyNr2XN1FQs2GbMehE6O5Rxgjp9ILMO
         QJRXUkM7uXmPc6NXLGj7Dpv98UVKVFUFW7ykgHS8ebCKggF5Gw89oIsMbeExLF7VS3qI
         QI0QjUPjqdTRRmHUS4YwmddqgERHDJSViSBGhjBN5m6zPeuhcSTZFVhxUjhoAr/I2WMt
         TB+98xRZzUwnIAdos4MDk9iF4SbUkLKi3fTxQ5INEtXfZ5Scrf38lksgn2xA+L3n4M9u
         b8hw==
X-Gm-Message-State: APjAAAUQYrCgEYAPUlhzVZBHXN2woGvsWa/DDry8uwsm2Ov1GiCj64R1
        23F6A3DSB6ohnspFVxh3S+P9eksv
X-Google-Smtp-Source: APXvYqzH9x3QO97QM5v5WDXftzGu4GhSKU97aN9yWLR1958al8HyrCnk+VADoa/38Jwj5CAFQLKWGw==
X-Received: by 2002:a17:90a:e001:: with SMTP id u1mr6682395pjy.102.1571344968381;
        Thu, 17 Oct 2019 13:42:48 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:47 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Brian Masney <masneyb@onstation.org>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Luca Weiss <luca@z3ntu.xyz>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Richard Fontana <rfontana@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 20/22] Input: bma150 - switch to using polled mode of input devices
Date:   Thu, 17 Oct 2019 13:42:14 -0700
Message-Id: <20191017204217.106453-21-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
References: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We have added polled mode to the normal input devices with the intent of
retiring input_polled_dev. This converts bma150 driver to use the polling
mode of standard input devices and removes dependency on INPUT_POLLDEV.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/misc/Kconfig  |   1 -
 drivers/input/misc/bma150.c | 155 ++++++++++--------------------------
 2 files changed, 44 insertions(+), 112 deletions(-)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index e1309cb190e1..438ec07e3b62 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -100,7 +100,6 @@ config INPUT_ATMEL_CAPTOUCH
 config INPUT_BMA150
 	tristate "BMA150/SMB380 acceleration sensor support"
 	depends on I2C
-	select INPUT_POLLDEV
 	help
 	  Say Y here if you have Bosch Sensortec's BMA150 or SMB380
 	  acceleration sensor hooked to an I2C bus.
diff --git a/drivers/input/misc/bma150.c b/drivers/input/misc/bma150.c
index d65b008a3c7a..a9d984da95f3 100644
--- a/drivers/input/misc/bma150.c
+++ b/drivers/input/misc/bma150.c
@@ -14,7 +14,6 @@
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
-#include <linux/input-polldev.h>
 #include <linux/interrupt.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
@@ -123,7 +122,6 @@
 
 struct bma150_data {
 	struct i2c_client *client;
-	struct input_polled_dev *input_polled;
 	struct input_dev *input;
 	u8 mode;
 };
@@ -336,13 +334,16 @@ static irqreturn_t bma150_irq_thread(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static void bma150_poll(struct input_polled_dev *dev)
+static void bma150_poll(struct input_dev *input)
 {
-	bma150_report_xyz(dev->private);
+	struct bma150_data *bma150 = input_get_drvdata(input);
+
+	bma150_report_xyz(bma150);
 }
 
-static int bma150_open(struct bma150_data *bma150)
+static int bma150_open(struct input_dev *input)
 {
+	struct bma150_data *bma150 = input_get_drvdata(input);
 	int error;
 
 	error = pm_runtime_get_sync(&bma150->client->dev);
@@ -362,44 +363,18 @@ static int bma150_open(struct bma150_data *bma150)
 	return 0;
 }
 
-static void bma150_close(struct bma150_data *bma150)
+static void bma150_close(struct input_dev *input)
 {
+	struct bma150_data *bma150 = input_get_drvdata(input);
+
 	pm_runtime_put_sync(&bma150->client->dev);
 
 	if (bma150->mode != BMA150_MODE_SLEEP)
 		bma150_set_mode(bma150, BMA150_MODE_SLEEP);
 }
 
-static int bma150_irq_open(struct input_dev *input)
-{
-	struct bma150_data *bma150 = input_get_drvdata(input);
-
-	return bma150_open(bma150);
-}
-
-static void bma150_irq_close(struct input_dev *input)
-{
-	struct bma150_data *bma150 = input_get_drvdata(input);
-
-	bma150_close(bma150);
-}
-
-static void bma150_poll_open(struct input_polled_dev *ipoll_dev)
-{
-	struct bma150_data *bma150 = ipoll_dev->private;
-
-	bma150_open(bma150);
-}
-
-static void bma150_poll_close(struct input_polled_dev *ipoll_dev)
-{
-	struct bma150_data *bma150 = ipoll_dev->private;
-
-	bma150_close(bma150);
-}
-
 static int bma150_initialize(struct bma150_data *bma150,
-				       const struct bma150_cfg *cfg)
+			     const struct bma150_cfg *cfg)
 {
 	int error;
 
@@ -439,78 +414,14 @@ static int bma150_initialize(struct bma150_data *bma150,
 	return bma150_set_mode(bma150, BMA150_MODE_SLEEP);
 }
 
-static void bma150_init_input_device(struct input_dev *idev)
-{
-	idev->name = BMA150_DRIVER;
-	idev->phys = BMA150_DRIVER "/input0";
-	idev->id.bustype = BUS_I2C;
-
-	idev->evbit[0] = BIT_MASK(EV_ABS);
-	input_set_abs_params(idev, ABS_X, ABSMIN_ACC_VAL, ABSMAX_ACC_VAL, 0, 0);
-	input_set_abs_params(idev, ABS_Y, ABSMIN_ACC_VAL, ABSMAX_ACC_VAL, 0, 0);
-	input_set_abs_params(idev, ABS_Z, ABSMIN_ACC_VAL, ABSMAX_ACC_VAL, 0, 0);
-}
-
-static int bma150_register_input_device(struct bma150_data *bma150)
-{
-	struct input_dev *idev;
-	int error;
-
-	idev = devm_input_allocate_device(&bma150->client->dev);
-	if (!idev)
-		return -ENOMEM;
-
-	bma150_init_input_device(idev);
-
-	idev->open = bma150_irq_open;
-	idev->close = bma150_irq_close;
-	input_set_drvdata(idev, bma150);
-
-	bma150->input = idev;
-
-	error = input_register_device(idev);
-	if (error)
-		return error;
-
-	return 0;
-}
-
-static int bma150_register_polled_device(struct bma150_data *bma150)
-{
-	struct input_polled_dev *ipoll_dev;
-	int error;
-
-	ipoll_dev = devm_input_allocate_polled_device(&bma150->client->dev);
-	if (!ipoll_dev)
-		return -ENOMEM;
-
-	ipoll_dev->private = bma150;
-	ipoll_dev->open = bma150_poll_open;
-	ipoll_dev->close = bma150_poll_close;
-	ipoll_dev->poll = bma150_poll;
-	ipoll_dev->poll_interval = BMA150_POLL_INTERVAL;
-	ipoll_dev->poll_interval_min = BMA150_POLL_MIN;
-	ipoll_dev->poll_interval_max = BMA150_POLL_MAX;
-
-	bma150_init_input_device(ipoll_dev->input);
-
-	bma150->input_polled = ipoll_dev;
-	bma150->input = ipoll_dev->input;
-
-	error = input_register_polled_device(ipoll_dev);
-	if (error)
-		return error;
-
-	return 0;
-}
-
 static int bma150_probe(struct i2c_client *client,
-				  const struct i2c_device_id *id)
+			const struct i2c_device_id *id)
 {
 	const struct bma150_platform_data *pdata =
 			dev_get_platdata(&client->dev);
 	const struct bma150_cfg *cfg;
 	struct bma150_data *bma150;
+	struct input_dev *idev;
 	int chip_id;
 	int error;
 
@@ -550,11 +461,39 @@ static int bma150_probe(struct i2c_client *client,
 	if (error)
 		return error;
 
-	if (client->irq > 0) {
-		error = bma150_register_input_device(bma150);
+	idev = devm_input_allocate_device(&bma150->client->dev);
+	if (!idev)
+		return -ENOMEM;
+
+	input_set_drvdata(idev, bma150);
+	bma150->input = idev;
+
+	idev->name = BMA150_DRIVER;
+	idev->phys = BMA150_DRIVER "/input0";
+	idev->id.bustype = BUS_I2C;
+
+	idev->open = bma150_open;
+	idev->close = bma150_close;
+
+	input_set_abs_params(idev, ABS_X, ABSMIN_ACC_VAL, ABSMAX_ACC_VAL, 0, 0);
+	input_set_abs_params(idev, ABS_Y, ABSMIN_ACC_VAL, ABSMAX_ACC_VAL, 0, 0);
+	input_set_abs_params(idev, ABS_Z, ABSMIN_ACC_VAL, ABSMAX_ACC_VAL, 0, 0);
+
+	if (client->irq <= 0) {
+		error = input_setup_polling(idev, bma150_poll);
 		if (error)
 			return error;
 
+		input_set_poll_interval(idev, BMA150_POLL_INTERVAL);
+		input_set_min_poll_interval(idev, BMA150_POLL_MIN);
+		input_set_max_poll_interval(idev, BMA150_POLL_MAX);
+	}
+
+	error = input_register_device(idev);
+	if (error)
+		return error;
+
+	if (client->irq > 0) {
 		error = devm_request_threaded_irq(&client->dev, client->irq,
 					NULL, bma150_irq_thread,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
@@ -565,10 +504,6 @@ static int bma150_probe(struct i2c_client *client,
 				client->irq, error);
 			return error;
 		}
-	} else {
-		error = bma150_register_polled_device(bma150);
-		if (error)
-			return error;
 	}
 
 	i2c_set_clientdata(client, bma150);
@@ -585,8 +520,7 @@ static int bma150_remove(struct i2c_client *client)
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int bma150_suspend(struct device *dev)
+static int __maybe_unused bma150_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct bma150_data *bma150 = i2c_get_clientdata(client);
@@ -594,14 +528,13 @@ static int bma150_suspend(struct device *dev)
 	return bma150_set_mode(bma150, BMA150_MODE_SLEEP);
 }
 
-static int bma150_resume(struct device *dev)
+static int __maybe_unused bma150_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct bma150_data *bma150 = i2c_get_clientdata(client);
 
 	return bma150_set_mode(bma150, BMA150_MODE_NORMAL);
 }
-#endif
 
 static UNIVERSAL_DEV_PM_OPS(bma150_pm, bma150_suspend, bma150_resume, NULL);
 
-- 
2.23.0.866.gb869b98d4c-goog

