Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4082DB878
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503102AbfJQUmx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:42:53 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43969 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503004AbfJQUmw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:52 -0400
Received: by mail-pf1-f195.google.com with SMTP id a2so2367254pfo.10;
        Thu, 17 Oct 2019 13:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ds3G9FC0CpY1fgUg7Wus7vKJj7ThQbDWX2QzY5C/6q0=;
        b=OyXVm1JDEyJk8c/QlnGaThqWEmWDu/Iyv569RjAgsGUes6zgtZyuRQ4T5KNzDcQgJv
         9KEjsjTe948KgIn/KYs6bYtdDlOiaLEwmDZRVsvKZsp9hbmYMjhwJzmx0+x0ix+xYcT6
         wOjPTsXw1Y7FI4Q+IK/mncyx+5e55Csk8pfzRUd4RNFfa6Cs9kBUVnxeU8sFhbYtbRL7
         COL2vG1TYJaQ+a4fPP/hlmDJLUUHH+qsoIeQ9zTgK1Ea4w0CVODq99CbZfiKQmxi9KB9
         duBXmsUb5gQmOi/7UZ6DpPC0weierdL536SFvQaw5tg0H+Mln/uu6y5BlY28tv5eTXkr
         Zs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ds3G9FC0CpY1fgUg7Wus7vKJj7ThQbDWX2QzY5C/6q0=;
        b=bj3yGyuVkR6EWYc0NlPKmM+2quLrwYFQYuJOur211kpnKOCcfJDAqU8kLB2ZtkRMgF
         OUSprCE1u/NGsABfFqms8M7KiUKIDij7KHWjckDXco9f1HvBQAfnoMffkv4+J2ZuyJi0
         hCgno4DrFXr9W9W5S9G7KRUUO5N5NUz8bMaOCzI4+10jOgIsQufkbMfwH4Gjcdo/B9ZI
         bt5zD+yULv/f4MogE8fo1rk5m3q/ZCvC7bOLUwARGU3MxYJTImuVrMboePqxuQLSV7H6
         wutbceXazBjFS8hDc0hJOUtQm4AvkRA7eeBwEX6x8eEesZklT7195hdBZu2AdQ0cMqHp
         zf/g==
X-Gm-Message-State: APjAAAX4YpBZO5va9ZzHd6RhCBedClQ4VsIEJ8ERsCxWJ+iNwUsDBGCB
        hsHGs/hjApNoK4ll9/owhg5i9CsI
X-Google-Smtp-Source: APXvYqw5jhqwnF/JJWYXhizL1iPuN5xVmMPI63oZqQ+KNqheNo82aL5C6DGxpyEyHSDecG6AXcnuNQ==
X-Received: by 2002:a17:90a:8d82:: with SMTP id d2mr6730121pjo.31.1571344970491;
        Thu, 17 Oct 2019 13:42:50 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:49 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Alexios Zavras <alexios.zavras@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 22/22] Input: kxtj9 - switch to using polled mode of input devices
Date:   Thu, 17 Oct 2019 13:42:16 -0700
Message-Id: <20191017204217.106453-23-dmitry.torokhov@gmail.com>
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
retiring input_polled_dev. This converts kxtj9 driver to use the polling
mode of standard input devices and removes dependency on INPUT_POLLDEV.

note that with regular input devices handling polling, there is no longer a
benefit in having separate INPUT_KXTJ9_POLLED_MODE config option.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

---

 drivers/input/misc/Kconfig |   7 --
 drivers/input/misc/kxtj9.c | 152 +++++++++----------------------------
 2 files changed, 37 insertions(+), 122 deletions(-)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 438ec07e3b62..7e2e658d551c 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -404,13 +404,6 @@ config INPUT_KXTJ9
 	  To compile this driver as a module, choose M here: the module will
 	  be called kxtj9.
 
-config INPUT_KXTJ9_POLLED_MODE
-	bool "Enable polling mode support"
-	depends on INPUT_KXTJ9
-	select INPUT_POLLDEV
-	help
-	  Say Y here if you need accelerometer to work in polling mode.
-
 config INPUT_POWERMATE
 	tristate "Griffin PowerMate and Contour Jog support"
 	depends on USB_ARCH_HAS_HCD
diff --git a/drivers/input/misc/kxtj9.c b/drivers/input/misc/kxtj9.c
index a86544d575f8..52313c6e3fb3 100644
--- a/drivers/input/misc/kxtj9.c
+++ b/drivers/input/misc/kxtj9.c
@@ -11,7 +11,6 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/input/kxtj9.h>
-#include <linux/input-polldev.h>
 
 #define NAME			"kxtj9"
 #define G_MAX			8000
@@ -71,9 +70,6 @@ struct kxtj9_data {
 	struct i2c_client *client;
 	struct kxtj9_platform_data pdata;
 	struct input_dev *input_dev;
-#ifdef CONFIG_INPUT_KXTJ9_POLLED_MODE
-	struct input_polled_dev *poll_dev;
-#endif
 	unsigned int last_poll_interval;
 	u8 shift;
 	u8 ctrl_reg1;
@@ -282,48 +278,6 @@ static void kxtj9_input_close(struct input_dev *dev)
 	kxtj9_disable(tj9);
 }
 
-static void kxtj9_init_input_device(struct kxtj9_data *tj9,
-					      struct input_dev *input_dev)
-{
-	__set_bit(EV_ABS, input_dev->evbit);
-	input_set_abs_params(input_dev, ABS_X, -G_MAX, G_MAX, FUZZ, FLAT);
-	input_set_abs_params(input_dev, ABS_Y, -G_MAX, G_MAX, FUZZ, FLAT);
-	input_set_abs_params(input_dev, ABS_Z, -G_MAX, G_MAX, FUZZ, FLAT);
-
-	input_dev->name = "kxtj9_accel";
-	input_dev->id.bustype = BUS_I2C;
-}
-
-static int kxtj9_setup_input_device(struct kxtj9_data *tj9)
-{
-	struct input_dev *input_dev;
-	int err;
-
-	input_dev = devm_input_allocate_device(&tj9->client->dev);
-	if (!input_dev) {
-		dev_err(&tj9->client->dev, "input device allocate failed\n");
-		return -ENOMEM;
-	}
-
-	tj9->input_dev = input_dev;
-
-	input_dev->open = kxtj9_input_open;
-	input_dev->close = kxtj9_input_close;
-	input_set_drvdata(input_dev, tj9);
-
-	kxtj9_init_input_device(tj9, input_dev);
-
-	err = input_register_device(tj9->input_dev);
-	if (err) {
-		dev_err(&tj9->client->dev,
-			"unable to register input polled device %s: %d\n",
-			tj9->input_dev->name, err);
-		return err;
-	}
-
-	return 0;
-}
-
 /*
  * When IRQ mode is selected, we need to provide an interface to allow the user
  * to change the output data rate of the part.  For consistency, we are using
@@ -389,12 +343,10 @@ static struct attribute_group kxtj9_attribute_group = {
 	.attrs = kxtj9_attributes
 };
 
-
-#ifdef CONFIG_INPUT_KXTJ9_POLLED_MODE
-static void kxtj9_poll(struct input_polled_dev *dev)
+static void kxtj9_poll(struct input_dev *input)
 {
-	struct kxtj9_data *tj9 = dev->private;
-	unsigned int poll_interval = dev->poll_interval;
+	struct kxtj9_data *tj9 = input_get_drvdata(input);
+	unsigned int poll_interval = input_get_poll_interval(input);
 
 	kxtj9_report_acceleration_data(tj9);
 
@@ -404,61 +356,6 @@ static void kxtj9_poll(struct input_polled_dev *dev)
 	}
 }
 
-static void kxtj9_polled_input_open(struct input_polled_dev *dev)
-{
-	struct kxtj9_data *tj9 = dev->private;
-
-	kxtj9_enable(tj9);
-}
-
-static void kxtj9_polled_input_close(struct input_polled_dev *dev)
-{
-	struct kxtj9_data *tj9 = dev->private;
-
-	kxtj9_disable(tj9);
-}
-
-static int kxtj9_setup_polled_device(struct kxtj9_data *tj9)
-{
-	int err;
-	struct input_polled_dev *poll_dev;
-
-	poll_dev = devm_input_allocate_polled_device(&tj9->client->dev);
-	if (!poll_dev) {
-		dev_err(&tj9->client->dev,
-			"Failed to allocate polled device\n");
-		return -ENOMEM;
-	}
-
-	tj9->poll_dev = poll_dev;
-	tj9->input_dev = poll_dev->input;
-
-	poll_dev->private = tj9;
-	poll_dev->poll = kxtj9_poll;
-	poll_dev->open = kxtj9_polled_input_open;
-	poll_dev->close = kxtj9_polled_input_close;
-
-	kxtj9_init_input_device(tj9, poll_dev->input);
-
-	err = input_register_polled_device(poll_dev);
-	if (err) {
-		dev_err(&tj9->client->dev,
-			"Unable to register polled device, err=%d\n", err);
-		return err;
-	}
-
-	return 0;
-}
-
-#else
-
-static inline int kxtj9_setup_polled_device(struct kxtj9_data *tj9)
-{
-	return -ENOSYS;
-}
-
-#endif
-
 static void kxtj9_platform_exit(void *data)
 {
 	struct kxtj9_data *tj9 = data;
@@ -494,6 +391,7 @@ static int kxtj9_probe(struct i2c_client *client,
 	const struct kxtj9_platform_data *pdata =
 			dev_get_platdata(&client->dev);
 	struct kxtj9_data *tj9;
+	struct input_dev *input_dev;
 	int err;
 
 	if (!i2c_check_functionality(client->adapter,
@@ -538,15 +436,44 @@ static int kxtj9_probe(struct i2c_client *client,
 	tj9->ctrl_reg1 = tj9->pdata.res_12bit | tj9->pdata.g_range;
 	tj9->last_poll_interval = tj9->pdata.init_interval;
 
+	input_dev = devm_input_allocate_device(&client->dev);
+	if (!input_dev) {
+		dev_err(&client->dev, "input device allocate failed\n");
+		return -ENOMEM;
+	}
+
+	input_set_drvdata(input_dev, tj9);
+	tj9->input_dev = input_dev;
+
+	input_dev->name = "kxtj9_accel";
+	input_dev->id.bustype = BUS_I2C;
+
+	input_dev->open = kxtj9_input_open;
+	input_dev->close = kxtj9_input_close;
+
+	input_set_abs_params(input_dev, ABS_X, -G_MAX, G_MAX, FUZZ, FLAT);
+	input_set_abs_params(input_dev, ABS_Y, -G_MAX, G_MAX, FUZZ, FLAT);
+	input_set_abs_params(input_dev, ABS_Z, -G_MAX, G_MAX, FUZZ, FLAT);
+
+	if (client->irq <= 0) {
+		err = input_setup_polling(input_dev, kxtj9_poll);
+		if (err)
+			return err;
+	}
+
+	err = input_register_device(input_dev);
+	if (err) {
+		dev_err(&client->dev,
+			"unable to register input polled device %s: %d\n",
+			input_dev->name, err);
+		return err;
+	}
+
 	if (client->irq) {
 		/* If in irq mode, populate INT_CTRL_REG1 and enable DRDY. */
 		tj9->int_ctrl |= KXTJ9_IEN | KXTJ9_IEA | KXTJ9_IEL;
 		tj9->ctrl_reg1 |= DRDYE;
 
-		err = kxtj9_setup_input_device(tj9);
-		if (err)
-			return err;
-
 		err = devm_request_threaded_irq(&client->dev, client->irq,
 						NULL, kxtj9_isr,
 						IRQF_TRIGGER_RISING |
@@ -563,11 +490,6 @@ static int kxtj9_probe(struct i2c_client *client,
 			dev_err(&client->dev, "sysfs create failed: %d\n", err);
 			return err;
 		}
-
-	} else {
-		err = kxtj9_setup_polled_device(tj9);
-		if (err)
-			return err;
 	}
 
 	return 0;
-- 
2.23.0.866.gb869b98d4c-goog

