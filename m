Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8997FDB86E
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502376AbfJQUmf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:42:35 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34056 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502279AbfJQUme (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:34 -0400
Received: by mail-pf1-f193.google.com with SMTP id b128so2392399pfa.1;
        Thu, 17 Oct 2019 13:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B0s3tKuBk+lp7xcyPBRGt1DsIYJknXV6umHFo5h/I8Y=;
        b=hhV1i9KhFm+6Jd1qKeNUgzZv5U/kStM3dgMATNPV7INUHysvn1Vn/jhlU/Ybb7Ab6V
         ae92VWqfu816kHM1nQtZjiuyV5IMgVbnLmItxXo5Sa6A2n4c/bQbTNgOjzJbvyxRwkKB
         XKEiAPyRNecUBHUSqG4fuAraNDe4LIjr/chypOBI0qqQFdMaQGee/MLIGyDP6LIxIeN1
         eCSGYPAWqQ4MJ1u8nNEC84edr09I8m7FJmgw2LbZ0nQdj9CezswR0eWw8eyeCk/nqsMC
         tIRXN5JRjpRfRvkSe2IrtsE4KQhN7IP5HU8ndD4FH6+6B+wUh4yn+HTGIdEQT1O5WoG8
         71mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B0s3tKuBk+lp7xcyPBRGt1DsIYJknXV6umHFo5h/I8Y=;
        b=n5SAjxZ5DtrpLRZ+8A2XuAms+Y8AU1Tcm6bV+Np10/o36WIWgtmzXqyDg/dtedlvat
         Ow+K4OyDAnBcBlivfN/64FU28LxjoOiE1l0sKuA3h3wENUnH9Rmddv/CaZpXeCx5SVl+
         ZJ79wfcSkVnobagl+hP5pTJ4at4niYkMYr0sK6uFZ+k5aA4Z6QOYr8T5kKRdDIH3o19E
         4FTrp7xa/k/D8/EdQIicr17rM5XLo48ae2sabOD/FIFIOcbZq5Ru+Gc5eMgBPoIlPeWN
         gUj7n87iX65izTsdV/Q0Paxza5TQ7/Ge7odQChoZTx//JfO8+gPKi9yIBzFna7B9GL4J
         Bdzg==
X-Gm-Message-State: APjAAAUfuKRqdNkbMQZ40WDQnSijFbwGSzrSAM78ra9wRliOhnp9I0eH
        CuyaN+1XlRDGyGk7iaSY+CM0DTZl
X-Google-Smtp-Source: APXvYqz8Qo2V1zykS+Ng5NTW0WOgCtwowevyvaZ7Y0HPzvzwb0JdfI5aakXai4hO12XtpT3FJgbxLw==
X-Received: by 2002:a62:4ed6:: with SMTP id c205mr2272074pfb.208.1571344952567;
        Thu, 17 Oct 2019 13:42:32 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:31 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        =?UTF-8?q?Ronald=20Tschal=C3=A4r?= <ronald@innovation.ch>,
        Stefan Agner <stefan@agner.ch>,
        YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 08/22] Input: gpio_keys_polled - switch to using polled mode of input devices
Date:   Thu, 17 Oct 2019 13:42:02 -0700
Message-Id: <20191017204217.106453-9-dmitry.torokhov@gmail.com>
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
retiring input_polled_dev. This converts gpio_keys_polled driver to use
the polling mode of standard input devices and removes dependency on
INPUT_POLLDEV.

Note that we still keep polled and non-polled gpio-keys drivers separate,
as they are different enough and mixing them up would make the code pretty
confusing.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/keyboard/Kconfig            |  1 -
 drivers/input/keyboard/gpio_keys_polled.c | 65 ++++++++++++-----------
 2 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 54b1905ebbfe..2856b4f72b12 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -248,7 +248,6 @@ config KEYBOARD_GPIO
 config KEYBOARD_GPIO_POLLED
 	tristate "Polled GPIO buttons"
 	depends on GPIOLIB
-	select INPUT_POLLDEV
 	help
 	  This driver implements support for buttons connected
 	  to GPIO pins that are not capable of generating interrupts.
diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index 465eecfa6b3f..4c93b85773ad 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -16,7 +16,6 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/input.h>
-#include <linux/input-polldev.h>
 #include <linux/ioport.h>
 #include <linux/platform_device.h>
 #include <linux/gpio.h>
@@ -34,7 +33,7 @@ struct gpio_keys_button_data {
 };
 
 struct gpio_keys_polled_dev {
-	struct input_polled_dev *poll_dev;
+	struct input_dev *input;
 	struct device *dev;
 	const struct gpio_keys_platform_data *pdata;
 	unsigned long rel_axis_seen[BITS_TO_LONGS(REL_CNT)];
@@ -42,12 +41,11 @@ struct gpio_keys_polled_dev {
 	struct gpio_keys_button_data data[0];
 };
 
-static void gpio_keys_button_event(struct input_polled_dev *dev,
+static void gpio_keys_button_event(struct input_dev *input,
 				   const struct gpio_keys_button *button,
 				   int state)
 {
-	struct gpio_keys_polled_dev *bdev = dev->private;
-	struct input_dev *input = dev->input;
+	struct gpio_keys_polled_dev *bdev = input_get_drvdata(input);
 	unsigned int type = button->type ?: EV_KEY;
 
 	if (type == EV_REL) {
@@ -66,7 +64,7 @@ static void gpio_keys_button_event(struct input_polled_dev *dev,
 	}
 }
 
-static void gpio_keys_polled_check_state(struct input_polled_dev *dev,
+static void gpio_keys_polled_check_state(struct input_dev *input,
 					 const struct gpio_keys_button *button,
 					 struct gpio_keys_button_data *bdata)
 {
@@ -74,10 +72,10 @@ static void gpio_keys_polled_check_state(struct input_polled_dev *dev,
 
 	state = gpiod_get_value_cansleep(bdata->gpiod);
 	if (state < 0) {
-		dev_err(dev->input->dev.parent,
+		dev_err(input->dev.parent,
 			"failed to get gpio state: %d\n", state);
 	} else {
-		gpio_keys_button_event(dev, button, state);
+		gpio_keys_button_event(input, button, state);
 
 		if (state != bdata->last_state) {
 			bdata->count = 0;
@@ -86,11 +84,10 @@ static void gpio_keys_polled_check_state(struct input_polled_dev *dev,
 	}
 }
 
-static void gpio_keys_polled_poll(struct input_polled_dev *dev)
+static void gpio_keys_polled_poll(struct input_dev *input)
 {
-	struct gpio_keys_polled_dev *bdev = dev->private;
+	struct gpio_keys_polled_dev *bdev = input_get_drvdata(input);
 	const struct gpio_keys_platform_data *pdata = bdev->pdata;
-	struct input_dev *input = dev->input;
 	int i;
 
 	memset(bdev->rel_axis_seen, 0, sizeof(bdev->rel_axis_seen));
@@ -101,10 +98,10 @@ static void gpio_keys_polled_poll(struct input_polled_dev *dev)
 
 		if (bdata->count < bdata->threshold) {
 			bdata->count++;
-			gpio_keys_button_event(dev, &pdata->buttons[i],
+			gpio_keys_button_event(input, &pdata->buttons[i],
 					       bdata->last_state);
 		} else {
-			gpio_keys_polled_check_state(dev, &pdata->buttons[i],
+			gpio_keys_polled_check_state(input, &pdata->buttons[i],
 						     bdata);
 		}
 	}
@@ -122,18 +119,20 @@ static void gpio_keys_polled_poll(struct input_polled_dev *dev)
 	input_sync(input);
 }
 
-static void gpio_keys_polled_open(struct input_polled_dev *dev)
+static int gpio_keys_polled_open(struct input_dev *input)
 {
-	struct gpio_keys_polled_dev *bdev = dev->private;
+	struct gpio_keys_polled_dev *bdev = input_get_drvdata(input);
 	const struct gpio_keys_platform_data *pdata = bdev->pdata;
 
 	if (pdata->enable)
 		pdata->enable(bdev->dev);
+
+	return 0;
 }
 
-static void gpio_keys_polled_close(struct input_polled_dev *dev)
+static void gpio_keys_polled_close(struct input_dev *input)
 {
-	struct gpio_keys_polled_dev *bdev = dev->private;
+	struct gpio_keys_polled_dev *bdev = input_get_drvdata(input);
 	const struct gpio_keys_platform_data *pdata = bdev->pdata;
 
 	if (pdata->disable)
@@ -232,7 +231,6 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 	struct fwnode_handle *child = NULL;
 	const struct gpio_keys_platform_data *pdata = dev_get_platdata(dev);
 	struct gpio_keys_polled_dev *bdev;
-	struct input_polled_dev *poll_dev;
 	struct input_dev *input;
 	int error;
 	int i;
@@ -255,19 +253,13 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	poll_dev = devm_input_allocate_polled_device(dev);
-	if (!poll_dev) {
-		dev_err(dev, "no memory for polled device\n");
+	input = devm_input_allocate_device(dev);
+	if (!input) {
+		dev_err(dev, "no memory for input device\n");
 		return -ENOMEM;
 	}
 
-	poll_dev->private = bdev;
-	poll_dev->poll = gpio_keys_polled_poll;
-	poll_dev->poll_interval = pdata->poll_interval;
-	poll_dev->open = gpio_keys_polled_open;
-	poll_dev->close = gpio_keys_polled_close;
-
-	input = poll_dev->input;
+	input_set_drvdata(input, bdev);
 
 	input->name = pdata->name ?: pdev->name;
 	input->phys = DRV_NAME"/input0";
@@ -277,6 +269,9 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 	input->id.product = 0x0001;
 	input->id.version = 0x0100;
 
+	input->open = gpio_keys_polled_open;
+	input->close = gpio_keys_polled_close;
+
 	__set_bit(EV_KEY, input->evbit);
 	if (pdata->rep)
 		__set_bit(EV_REP, input->evbit);
@@ -353,11 +348,19 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 
 	fwnode_handle_put(child);
 
-	bdev->poll_dev = poll_dev;
+	bdev->input = input;
 	bdev->dev = dev;
 	bdev->pdata = pdata;
 
-	error = input_register_polled_device(poll_dev);
+	error = input_setup_polling(input, gpio_keys_polled_poll);
+	if (error) {
+		dev_err(dev, "unable to set up polling, err=%d\n", error);
+		return error;
+	}
+
+	input_set_poll_interval(input, pdata->poll_interval);
+
+	error = input_register_device(input);
 	if (error) {
 		dev_err(dev, "unable to register polled device, err=%d\n",
 			error);
@@ -366,7 +369,7 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 
 	/* report initial state of the buttons */
 	for (i = 0; i < pdata->nbuttons; i++)
-		gpio_keys_polled_check_state(poll_dev, &pdata->buttons[i],
+		gpio_keys_polled_check_state(input, &pdata->buttons[i],
 					     &bdev->data[i]);
 
 	input_sync(input);
-- 
2.23.0.866.gb869b98d4c-goog

