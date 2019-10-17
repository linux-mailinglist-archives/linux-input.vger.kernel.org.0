Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E208DB887
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389347AbfJQUnk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:43:40 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36790 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502683AbfJQUmq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:46 -0400
Received: by mail-pl1-f194.google.com with SMTP id j11so1706668plk.3;
        Thu, 17 Oct 2019 13:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p4qYPdv7CFoLETcuSBMJehUgVm9YqKP05FJFL0znofs=;
        b=pqLcROSwueULk1UQmRmI4xu4kebA1YY8lp01P56aYflnoLGFbt/RUOlJg0NtCglNHz
         B75T3HnKlxcyQ5zE7r+Lz033eUuBLMQtbZIDphmg1DnoABAtN9e79YvmlQZnpnMaFYsu
         bKnVvwKt+Q8iOMsYyTp7jLhgXyNF2lN2MDEm3dD8Mguy1poH/MtiUfdrmGJae1RJP19j
         sTVwAgOUh5qqj3Ez9uus6ySN/fWX/QTx0IWCbINHoh4qmbwgAQYWJKKYrNMNhAKq5dvI
         Qp4tGUEfg09sRRcSlTBR4P5aKBAX+CwyBslS8A+uzXlOxTqhlzolAcs6f1gkXplO3OfN
         ChUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p4qYPdv7CFoLETcuSBMJehUgVm9YqKP05FJFL0znofs=;
        b=ZD25+nceFGP9z3e5/Sp527/dYzE4uG3Vkh+aJCQD947Jk6bwMz+hZZbgtKXgZJ4hWM
         j73Abhe2iu+mztm+R3K49tpzFcmIGRFSpvO14CLmgatez80tTjjpXhn90kfRsJ2jkDvw
         w/cyVCRXbQqLqc8n/Nl6g6UigyJECX3R5FNGFmz6Rrz7PwISaJaxVSw8rL0YzuIZmMr2
         WKwueKlKfWFUcy5fogXSypNLASq1CA94Ru8fKKS/nfv/UO2ZN8TKIVF044BILw2UCVlt
         4HvRXV9oasoQN4AVh2H/Pm2bHE/6ldDjUb5HcEcdE9RqpZA15agmNYKJ1+iNfrvaNbCm
         r6wg==
X-Gm-Message-State: APjAAAUR/lRalu26yj+SOXgsWSJkVb974dXS+vGcIxmkM7MCVlDEzCdP
        yf2lpPMfAT9xV1RVs7ganFgBQ092
X-Google-Smtp-Source: APXvYqwDjpGzYiq0sp+iFvgp16XRF6y797HH5834RO2CuHI/TouX8uBOInGBHnJgNbUuMg8eFuOx+w==
X-Received: by 2002:a17:902:44d:: with SMTP id 71mr970453ple.320.1571344964914;
        Thu, 17 Oct 2019 13:42:44 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:43 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 17/22] Input: gpio_decoder - switch to using polled mode of input devices
Date:   Thu, 17 Oct 2019 13:42:11 -0700
Message-Id: <20191017204217.106453-18-dmitry.torokhov@gmail.com>
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
retiring input_polled_dev. This converts gpio_decoder driver to use
the polling mode of standard input devices and removes dependency on
INPUT_POLLDEV.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/misc/Kconfig        |  1 -
 drivers/input/misc/gpio_decoder.c | 42 +++++++++++++++++--------------
 2 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 102e993bbd6b..b108c992bb7a 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -290,7 +290,6 @@ config INPUT_GPIO_BEEPER
 config INPUT_GPIO_DECODER
 	tristate "Polled GPIO Decoder Input driver"
 	depends on GPIOLIB || COMPILE_TEST
-	select INPUT_POLLDEV
 	help
 	 Say Y here if you want driver to read status of multiple GPIO
 	 lines and report the encoded value as an absolute integer to
diff --git a/drivers/input/misc/gpio_decoder.c b/drivers/input/misc/gpio_decoder.c
index 1dca526e6f1a..145826a1a9a1 100644
--- a/drivers/input/misc/gpio_decoder.c
+++ b/drivers/input/misc/gpio_decoder.c
@@ -17,14 +17,12 @@
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/input.h>
-#include <linux/input-polldev.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
 struct gpio_decoder {
-	struct input_polled_dev *poll_dev;
 	struct gpio_descs *input_gpios;
 	struct device *dev;
 	u32 axis;
@@ -53,15 +51,15 @@ static int gpio_decoder_get_gpios_state(struct gpio_decoder *decoder)
 	return ret;
 }
 
-static void gpio_decoder_poll_gpios(struct input_polled_dev *poll_dev)
+static void gpio_decoder_poll_gpios(struct input_dev *input)
 {
-	struct gpio_decoder *decoder = poll_dev->private;
+	struct gpio_decoder *decoder = input_get_drvdata(input);
 	int state;
 
 	state = gpio_decoder_get_gpios_state(decoder);
 	if (state >= 0 && state != decoder->last_stable) {
-		input_report_abs(poll_dev->input, decoder->axis, state);
-		input_sync(poll_dev->input);
+		input_report_abs(input, decoder->axis, state);
+		input_sync(input);
 		decoder->last_stable = state;
 	}
 }
@@ -70,20 +68,23 @@ static int gpio_decoder_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct gpio_decoder *decoder;
-	struct input_polled_dev *poll_dev;
+	struct input_dev *input;
 	u32  max;
 	int err;
 
-	decoder = devm_kzalloc(dev, sizeof(struct gpio_decoder), GFP_KERNEL);
+	decoder = devm_kzalloc(dev, sizeof(*decoder), GFP_KERNEL);
 	if (!decoder)
 		return -ENOMEM;
 
+	decoder->dev = dev;
 	device_property_read_u32(dev, "linux,axis", &decoder->axis);
+
 	decoder->input_gpios = devm_gpiod_get_array(dev, NULL, GPIOD_IN);
 	if (IS_ERR(decoder->input_gpios)) {
 		dev_err(dev, "unable to acquire input gpios\n");
 		return PTR_ERR(decoder->input_gpios);
 	}
+
 	if (decoder->input_gpios->ndescs < 2) {
 		dev_err(dev, "not enough gpios found\n");
 		return -EINVAL;
@@ -92,22 +93,25 @@ static int gpio_decoder_probe(struct platform_device *pdev)
 	if (device_property_read_u32(dev, "decoder-max-value", &max))
 		max = (1U << decoder->input_gpios->ndescs) - 1;
 
-	decoder->dev = dev;
-	poll_dev = devm_input_allocate_polled_device(decoder->dev);
-	if (!poll_dev)
+	input = devm_input_allocate_device(dev);
+	if (!input)
 		return -ENOMEM;
 
-	poll_dev->private = decoder;
-	poll_dev->poll = gpio_decoder_poll_gpios;
-	decoder->poll_dev = poll_dev;
+	input_set_drvdata(input, decoder);
 
-	poll_dev->input->name = pdev->name;
-	poll_dev->input->id.bustype = BUS_HOST;
-	input_set_abs_params(poll_dev->input, decoder->axis, 0, max, 0, 0);
+	input->name = pdev->name;
+	input->id.bustype = BUS_HOST;
+	input_set_abs_params(input, decoder->axis, 0, max, 0, 0);
+
+	err = input_setup_polling(input, gpio_decoder_poll_gpios);
+	if (err) {
+		dev_err(dev, "failed to set up polling\n");
+		return err;
+	}
 
-	err = input_register_polled_device(poll_dev);
+	err = input_register_device(input);
 	if (err) {
-		dev_err(dev, "failed to register polled  device\n");
+		dev_err(dev, "failed to register input device\n");
 		return err;
 	}
 
-- 
2.23.0.866.gb869b98d4c-goog

