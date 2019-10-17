Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 159C3DB890
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502159AbfJQUmc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:42:32 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45057 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502089AbfJQUmb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:31 -0400
Received: by mail-pl1-f194.google.com with SMTP id u12so1685953pls.12;
        Thu, 17 Oct 2019 13:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fxi+sR07mhlS6Muc3/xe4kp58yCZ85m02vfZzkl7bls=;
        b=mwk9rJS3O/sLFucmG/7gve5kqkBWWhON+TpQ2aqmeO52ZWjOMiubuBN/q2JBV1it0P
         gipHxm0TDWfYb3aim/NrtxsEfOYD0Dy52CoytANllNV1cklwfFGSPGhInjZUY7QSxHRz
         IoA78nPgkq0AotgY/PvJ6Atmm57eJcqOQO+0hADz+acB3cQisyeWWIK1dxfY0NVhhHWE
         vB3XDqBwLH9ml7qnOtYoZKHJNqcqKF5wQmWns+zuWXbtW21SbOjYew7az4K/ZZT3hZ56
         ExKJJ63uofsHHR0yldF3qC5ROCNnhzLHVi6x3Ttx5/L68SDA4QadCeClguF7bxbp7BQd
         T1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fxi+sR07mhlS6Muc3/xe4kp58yCZ85m02vfZzkl7bls=;
        b=Hm39Kr7T+ohsfBhi1tMAmedvlCbPZ55y3qX3NgRPERTTs3ofUFpSD/paLGZiMxjJj2
         8cAlf5exlwJv9K9X8p40JbN8TM5dYYSrWPM7GaRJphJNotCgickapXcT9rkrvQgToPvj
         /Ptotwbhqs036EZaXZsMJraCHprOSXSp+4rDKgTMwi2zQdbFc/gjeYphKPpFrDWKk/yg
         aq1kYTFQSvjx/RTkoKjfK8zq3rBoY9bwwtWqzoPbthEK94sJLTPYEu8khSHpvaibBK0E
         C+Rxid1xkM8JRUuLHCnnwX8PVQIKrCKUN0KoVINa+D4gH8WOh6i0mBz7ZMvEVw5eAFxD
         Gmkw==
X-Gm-Message-State: APjAAAVyfDZCh3oIdsO96AI0aPk6YCDxbesxLDk4SUEdYZoW+0yY6jQu
        KXK5gAUP+mQ+JaJKcCOZIdKhzjOD
X-Google-Smtp-Source: APXvYqzf4XSgnOksu9P2edG1NQ0lwGyYaajoSSkzKKmR70FFg228zppNN9TgOLau/ptB7g06KJEIXA==
X-Received: by 2002:a17:902:b196:: with SMTP id s22mr6234860plr.10.1571344950048;
        Thu, 17 Oct 2019 13:42:30 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:29 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Alexander Shiyan <shc_work@mail.ru>,
        Allison Randal <allison@lohutok.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        =?UTF-8?q?Ronald=20Tschal=C3=A4r?= <ronald@innovation.ch>,
        Stefan Agner <stefan@agner.ch>,
        YueHaibing <yuehaibing@huawei.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 06/22] Input: clps711x-keypad - switch to using polled mode of input devices
Date:   Thu, 17 Oct 2019 13:42:00 -0700
Message-Id: <20191017204217.106453-7-dmitry.torokhov@gmail.com>
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
retiring input_polled_dev. This converts clps711x-keypad driver to use the
polling mode of standard input devices and removes dependency on
INPUT_POLLDEV.

Also use managed API when allocating input device, this allows us to remove
clps711x_keypad_remove() method.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/keyboard/Kconfig           |  1 -
 drivers/input/keyboard/clps711x-keypad.c | 70 ++++++++++--------------
 2 files changed, 29 insertions(+), 42 deletions(-)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index c6bf99d23b1a..0e7368288dae 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -190,7 +190,6 @@ config KEYBOARD_CLPS711X
 	tristate "CLPS711X Keypad support"
 	depends on OF_GPIO && (ARCH_CLPS711X || COMPILE_TEST)
 	select INPUT_MATRIXKMAP
-	select INPUT_POLLDEV
 	help
 	  Say Y here to enable the matrix keypad on the Cirrus Logic
 	  CLPS711X CPUs.
diff --git a/drivers/input/keyboard/clps711x-keypad.c b/drivers/input/keyboard/clps711x-keypad.c
index c4a5c07a4b98..019dd6ed2c29 100644
--- a/drivers/input/keyboard/clps711x-keypad.c
+++ b/drivers/input/keyboard/clps711x-keypad.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/input.h>
-#include <linux/input-polldev.h>
 #include <linux/module.h>
 #include <linux/of_gpio.h>
 #include <linux/platform_device.h>
@@ -30,10 +29,10 @@ struct clps711x_keypad_data {
 	struct clps711x_gpio_data	*gpio_data;
 };
 
-static void clps711x_keypad_poll(struct input_polled_dev *dev)
+static void clps711x_keypad_poll(struct input_dev *input)
 {
-	const unsigned short *keycodes = dev->input->keycode;
-	struct clps711x_keypad_data *priv = dev->private;
+	const unsigned short *keycodes = input->keycode;
+	struct clps711x_keypad_data *priv = input_get_drvdata(input);
 	bool sync = false;
 	int col, row;
 
@@ -61,14 +60,14 @@ static void clps711x_keypad_poll(struct input_polled_dev *dev)
 
 				if (state) {
 					set_bit(col, data->last_state);
-					input_event(dev->input, EV_MSC,
-						    MSC_SCAN, code);
+					input_event(input,
+						    EV_MSC, MSC_SCAN, code);
 				} else {
 					clear_bit(col, data->last_state);
 				}
 
 				if (keycodes[code])
-					input_report_key(dev->input,
+					input_report_key(input,
 							 keycodes[code], state);
 				sync = true;
 			}
@@ -80,7 +79,7 @@ static void clps711x_keypad_poll(struct input_polled_dev *dev)
 	}
 
 	if (sync)
-		input_sync(dev->input);
+		input_sync(input);
 }
 
 static int clps711x_keypad_probe(struct platform_device *pdev)
@@ -88,7 +87,7 @@ static int clps711x_keypad_probe(struct platform_device *pdev)
 	struct clps711x_keypad_data *priv;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct input_polled_dev *poll_dev;
+	struct input_dev *input;
 	u32 poll_interval;
 	int i, err;
 
@@ -125,53 +124,43 @@ static int clps711x_keypad_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	poll_dev = input_allocate_polled_device();
-	if (!poll_dev)
+	input = devm_input_allocate_device(dev);
+	if (!input)
 		return -ENOMEM;
 
-	poll_dev->private		= priv;
-	poll_dev->poll			= clps711x_keypad_poll;
-	poll_dev->poll_interval		= poll_interval;
-	poll_dev->input->name		= pdev->name;
-	poll_dev->input->dev.parent	= dev;
-	poll_dev->input->id.bustype	= BUS_HOST;
-	poll_dev->input->id.vendor	= 0x0001;
-	poll_dev->input->id.product	= 0x0001;
-	poll_dev->input->id.version	= 0x0100;
+	input_set_drvdata(input, priv);
+
+	input->name		= pdev->name;
+	input->dev.parent	= dev;
+	input->id.bustype	= BUS_HOST;
+	input->id.vendor	= 0x0001;
+	input->id.product	= 0x0001;
+	input->id.version	= 0x0100;
 
 	err = matrix_keypad_build_keymap(NULL, NULL, priv->row_count,
 					 CLPS711X_KEYPAD_COL_COUNT,
-					 NULL, poll_dev->input);
+					 NULL, input);
 	if (err)
-		goto out_err;
+		return err;
 
-	input_set_capability(poll_dev->input, EV_MSC, MSC_SCAN);
+	input_set_capability(input, EV_MSC, MSC_SCAN);
 	if (of_property_read_bool(np, "autorepeat"))
-		__set_bit(EV_REP, poll_dev->input->evbit);
-
-	platform_set_drvdata(pdev, poll_dev);
+		__set_bit(EV_REP, input->evbit);
 
 	/* Set all columns to low */
 	regmap_update_bits(priv->syscon, SYSCON_OFFSET, SYSCON1_KBDSCAN_MASK,
 			   SYSCON1_KBDSCAN(1));
 
-	err = input_register_polled_device(poll_dev);
-	if (err)
-		goto out_err;
-
-	return 0;
 
-out_err:
-	input_free_polled_device(poll_dev);
-	return err;
-}
+	err = input_setup_polling(input, clps711x_keypad_poll);
+	if (err)
+		return err;
 
-static int clps711x_keypad_remove(struct platform_device *pdev)
-{
-	struct input_polled_dev *poll_dev = platform_get_drvdata(pdev);
+	input_set_poll_interval(input, poll_interval);
 
-	input_unregister_polled_device(poll_dev);
-	input_free_polled_device(poll_dev);
+	err = input_register_device(input);
+	if (err)
+		return err;
 
 	return 0;
 }
@@ -188,7 +177,6 @@ static struct platform_driver clps711x_keypad_driver = {
 		.of_match_table	= clps711x_keypad_of_match,
 	},
 	.probe	= clps711x_keypad_probe,
-	.remove	= clps711x_keypad_remove,
 };
 module_platform_driver(clps711x_keypad_driver);
 
-- 
2.23.0.866.gb869b98d4c-goog

