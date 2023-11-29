Return-Path: <linux-input+bounces-335-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B347FD8AB
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 14:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BF67B213A7
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 13:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91280210F0;
	Wed, 29 Nov 2023 13:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HuuG7Tf7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BDBBE6
	for <linux-input@vger.kernel.org>; Wed, 29 Nov 2023 05:51:52 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50bb92811c0so929492e87.1
        for <linux-input@vger.kernel.org>; Wed, 29 Nov 2023 05:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701265910; x=1701870710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/WsO25oVrNPSsIiQTRTA56r+srmgXJ6yKUYJL3dXxU=;
        b=HuuG7Tf7zaHE5IiomQ84G4gfp08KZq4Rm8CUrdMwwhqxobWiN7vxGFigvfZEJ8yMZk
         l9cJowSGUASU3Do1lwjg0vYJrfQVdZJhmNeBqdBf3rYHnAr+FrmRyvq/oMlDu1wrv5qZ
         6bfe2Ix2CMQA7PSAWq1xU+hpojML9x+Db3jy0f1vmvD8w2+4guMmG8RMLp4lztyfRqwg
         yCjTjNqjeuUqXOQehka2+XU1PQiT0gHDerH7/AU/0Dbf0sSImIsPsF2zUAHPCtnsqKmQ
         3MYa71cJ9sPufJWUcxKCQWXDw0/fNG8GOp6XLyB5MkaeFpbzQGcKddKmz8qOWYe7QiT5
         7tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701265910; x=1701870710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/WsO25oVrNPSsIiQTRTA56r+srmgXJ6yKUYJL3dXxU=;
        b=CXR6KZKv7r9CiJ6qZL7AwGmTS8ZoEpEerEvbSy5EayoHxx2YDIIp6RujzTqcWO5Pa7
         +tu1Ns2u6vWPueau7UtWmFuxZ0z+vot59D9IXOt+l29ZjP6cRCnkbi081pWxsGFJLCTO
         Dph708SxFcj7wbMYOmdBg6PnHbXx1FIXgEk/iVf4W8TRvpOcVbVhk5mNE9+HEsJXOU4I
         QJNgQJvVlVqD+wVYcajypi3DoAht6Prag+API/8cnRCR8TqMbIJbDtZSvVZilt9RLVdI
         gInMBoG6pOU621gifOdMhW4D3ckTTz0vIuUPoXvDrscpjSqUPFTlUpjGVkOypxc5VoQJ
         ujJw==
X-Gm-Message-State: AOJu0YxEbmTNWim/B2X92Vcq38T/LV1MYlXgGsZw/XtTxxKp9eMUKPbO
	8aGqOuw7IWCdkb0KPZDT8/xXHGT8MMzxXETDfeo=
X-Google-Smtp-Source: AGHT+IFVCeLnx8W6HKSTMwYGJPSCe8mFdeYYyeec+lswRttmQ9fnaE+G2h7GmlMFe82v3ymxpxF4aA==
X-Received: by 2002:a05:6512:2812:b0:50a:a6ea:405f with SMTP id cf18-20020a056512281200b0050aa6ea405fmr6596712lfb.4.1701265910170;
        Wed, 29 Nov 2023 05:51:50 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a28-20020ac2521c000000b0050ab88758b8sm2164280lfl.84.2023.11.29.05.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 05:51:49 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 14:51:48 +0100
Subject: [PATCH 4/4] Input: as5011 - Convert to GPIO descriptor
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-input-v1-4-9433162914a3@linaro.org>
References: <20231129-descriptors-input-v1-0-9433162914a3@linaro.org>
In-Reply-To: <20231129-descriptors-input-v1-0-9433162914a3@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

This driver does not have any in-tree users but is passing a
legacy GPIO number through platform data.

Convert it to use a GPIO descriptor, new users or outoftree
users can easily be implemented using GPIO descriptor tables
or software nodes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/joystick/as5011.c | 24 +++++++++++-------------
 include/linux/input/as5011.h    |  1 -
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/input/joystick/as5011.c b/drivers/input/joystick/as5011.c
index bf8b1cc0ea9c..f1822c19a289 100644
--- a/drivers/input/joystick/as5011.c
+++ b/drivers/input/joystick/as5011.c
@@ -13,7 +13,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/input.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/input/as5011.h>
 #include <linux/slab.h>
@@ -61,7 +61,7 @@ MODULE_LICENSE("GPL");
 struct as5011_device {
 	struct input_dev *input_dev;
 	struct i2c_client *i2c_client;
-	unsigned int button_gpio;
+	struct gpio_desc *button_gpiod;
 	unsigned int button_irq;
 	unsigned int axis_irq;
 };
@@ -114,7 +114,7 @@ static int as5011_i2c_read(struct i2c_client *client,
 static irqreturn_t as5011_button_interrupt(int irq, void *dev_id)
 {
 	struct as5011_device *as5011 = dev_id;
-	int val = gpio_get_value_cansleep(as5011->button_gpio);
+	int val = gpiod_get_value_cansleep(as5011->button_gpiod);
 
 	input_report_key(as5011->input_dev, BTN_JOYSTICK, !val);
 	input_sync(as5011->input_dev);
@@ -248,7 +248,6 @@ static int as5011_probe(struct i2c_client *client)
 
 	as5011->i2c_client = client;
 	as5011->input_dev = input_dev;
-	as5011->button_gpio = plat_data->button_gpio;
 	as5011->axis_irq = plat_data->axis_irq;
 
 	input_dev->name = "Austria Microsystem as5011 joystick";
@@ -262,18 +261,20 @@ static int as5011_probe(struct i2c_client *client)
 	input_set_abs_params(as5011->input_dev, ABS_Y,
 		AS5011_MIN_AXIS, AS5011_MAX_AXIS, AS5011_FUZZ, AS5011_FLAT);
 
-	error = gpio_request(as5011->button_gpio, "AS5011 button");
-	if (error < 0) {
-		dev_err(&client->dev, "Failed to request button gpio\n");
+	as5011->button_gpiod = devm_gpiod_get(&client->dev, NULL, GPIOD_IN);
+	if (IS_ERR(as5011->button_gpiod)) {
+		error = PTR_ERR(as5011->button_gpiod);
+		dev_err(&client->dev, "Failed to request button GPIO\n");
 		goto err_free_mem;
 	}
+	gpiod_set_consumer_name(as5011->button_gpiod, "AS5011 button");
 
-	irq = gpio_to_irq(as5011->button_gpio);
+	irq = gpiod_to_irq(as5011->button_gpiod);
 	if (irq < 0) {
 		dev_err(&client->dev,
 			"Failed to get irq number for button gpio\n");
 		error = irq;
-		goto err_free_button_gpio;
+		goto err_free_mem;
 	}
 
 	as5011->button_irq = irq;
@@ -286,7 +287,7 @@ static int as5011_probe(struct i2c_client *client)
 	if (error < 0) {
 		dev_err(&client->dev,
 			"Can't allocate button irq %d\n", as5011->button_irq);
-		goto err_free_button_gpio;
+		goto err_free_mem;
 	}
 
 	error = as5011_configure_chip(as5011, plat_data);
@@ -317,8 +318,6 @@ static int as5011_probe(struct i2c_client *client)
 	free_irq(as5011->axis_irq, as5011);
 err_free_button_irq:
 	free_irq(as5011->button_irq, as5011);
-err_free_button_gpio:
-	gpio_free(as5011->button_gpio);
 err_free_mem:
 	input_free_device(input_dev);
 	kfree(as5011);
@@ -332,7 +331,6 @@ static void as5011_remove(struct i2c_client *client)
 
 	free_irq(as5011->axis_irq, as5011);
 	free_irq(as5011->button_irq, as5011);
-	gpio_free(as5011->button_gpio);
 
 	input_unregister_device(as5011->input_dev);
 	kfree(as5011);
diff --git a/include/linux/input/as5011.h b/include/linux/input/as5011.h
index 5fba52a56cd6..5705d5de3aea 100644
--- a/include/linux/input/as5011.h
+++ b/include/linux/input/as5011.h
@@ -7,7 +7,6 @@
  */
 
 struct as5011_platform_data {
-	unsigned int button_gpio;
 	unsigned int axis_irq; /* irq number */
 	unsigned long axis_irqflags;
 	char xp, xn; /* threshold for x axis */

-- 
2.34.1


