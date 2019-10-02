Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27EA4C93F2
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2019 00:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfJBWAx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Oct 2019 18:00:53 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39198 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfJBWAx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Oct 2019 18:00:53 -0400
Received: by mail-pl1-f193.google.com with SMTP id s17so486157plp.6;
        Wed, 02 Oct 2019 15:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=XtJX6WehuzWp0yTsb+ruE15i0GDXa67mF2dVnQpvDrI=;
        b=holuGGpeMs4znwZ9KSU2pImhyIrp73fP32p+QbIj/sixNPbhk7myiBy5ZImLzVEhZV
         2TQa1FzXUMw2lTpDeJnKwBfT/hXRKCZS7KBPdOQuWlJ72EfeDUYg2gOu7MuvPe+V0lRj
         S/Rm9LbkkEBZhr/3dAcvbBG8atIniV/nB/L74zlmtgHXYkZKWE2mX6J3NzJbjIZjeZ1/
         RqWhSUM4pdwvvF+KU/HUyVbkkgLg2x+51AZbLn+3dW4B7yB5AuruKyZ85nVUDLM90gJb
         0XnqaVd5kTFudc9C//57Jdn7pIiXYZiEwZ0k1kaDCXyZl9wSwAbV+cbznJ2Wh2cB0/KX
         pX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=XtJX6WehuzWp0yTsb+ruE15i0GDXa67mF2dVnQpvDrI=;
        b=I3XYl0FeCnifK2kY9iq3ScbfB16UGKWHwBUQ/uys2CltiQoTFC3rFpyJgPgnYnoDAp
         z7b74b0Ts7U2PAxY/M7Ag0KvmLACEjeVn2F2JYKstj3izE/PEXDCfOcxPeo29J2YuDA0
         DcwRDRmUcJPX2YEaZYSsGywpkRcdkA2BNNLe4W7Opg9ZSQiBtL4bKQObbTQQ4y/U7gUt
         tYAghoUmfDtFEJOMJpxep2BjHXcY4WPSRMwhFiq5furBeCDfRAm+GRCyCwogynOYXr/v
         pFmq1gwQYL+k1Hj2PlSwwTgO/QWeM/wHDQKdUbT+9sOHs+JFsAsGwdlTBzkvfxw4zjSX
         OPWg==
X-Gm-Message-State: APjAAAWPUBEtI31mi7uIyMGB1H2WRnhn7POWRGWQ6uqvGKTuKn0OspHy
        5e6AMQwUHlri0iBwbOy3Yq0jdtJs
X-Google-Smtp-Source: APXvYqxVYoSP5FHk3SKVCWh6YBgbG+zTEYtdw4TNvcwR0H/9rTk5BWTZC/ehfmy1slhNtpX2bA3b9Q==
X-Received: by 2002:a17:902:6c:: with SMTP id 99mr6157111pla.89.1570053650553;
        Wed, 02 Oct 2019 15:00:50 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id g9sm202652pjl.20.2019.10.02.15.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 15:00:50 -0700 (PDT)
Date:   Wed, 2 Oct 2019 15:00:48 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: gpio_mouse - switch to using input device polling mode
Message-ID: <20191002220048.GA137235@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Now that instances of input_dev support polling mode natively,
we no longer need to create input_polled_dev instance.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/Kconfig      |  1 -
 drivers/input/mouse/gpio_mouse.c | 45 ++++++++++++++------------------
 2 files changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/input/mouse/Kconfig b/drivers/input/mouse/Kconfig
index 652c38e3c0b5..bf738d3b7fe4 100644
--- a/drivers/input/mouse/Kconfig
+++ b/drivers/input/mouse/Kconfig
@@ -381,7 +381,6 @@ config MOUSE_VSXXXAA
 config MOUSE_GPIO
 	tristate "GPIO mouse"
 	depends on GPIOLIB || COMPILE_TEST
-	select INPUT_POLLDEV
 	help
 	  This driver simulates a mouse on GPIO lines of various CPUs (and some
 	  other chips).
diff --git a/drivers/input/mouse/gpio_mouse.c b/drivers/input/mouse/gpio_mouse.c
index 461436f6f087..23507fce3a2b 100644
--- a/drivers/input/mouse/gpio_mouse.c
+++ b/drivers/input/mouse/gpio_mouse.c
@@ -8,7 +8,7 @@
 
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/input-polldev.h>
+#include <linux/input.h>
 #include <linux/gpio/consumer.h>
 #include <linux/property.h>
 #include <linux/of.h>
@@ -43,10 +43,9 @@ struct gpio_mouse {
  * Timer function which is run every scan_ms ms when the device is opened.
  * The dev input variable is set to the the input_dev pointer.
  */
-static void gpio_mouse_scan(struct input_polled_dev *dev)
+static void gpio_mouse_scan(struct input_dev *input)
 {
-	struct gpio_mouse *gpio = dev->private;
-	struct input_dev *input = dev->input;
+	struct gpio_mouse *gpio = input_get_drvdata(input);
 	int x, y;
 
 	if (gpio->bleft)
@@ -71,18 +70,17 @@ static int gpio_mouse_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct gpio_mouse *gmouse;
-	struct input_polled_dev *input_poll;
 	struct input_dev *input;
-	int ret;
+	int error;
 
 	gmouse = devm_kzalloc(dev, sizeof(*gmouse), GFP_KERNEL);
 	if (!gmouse)
 		return -ENOMEM;
 
 	/* Assign some default scanning time */
-	ret = device_property_read_u32(dev, "scan-interval-ms",
-				       &gmouse->scan_ms);
-	if (ret || gmouse->scan_ms == 0) {
+	error = device_property_read_u32(dev, "scan-interval-ms",
+					 &gmouse->scan_ms);
+	if (error || gmouse->scan_ms == 0) {
 		dev_warn(dev, "invalid scan time, set to 50 ms\n");
 		gmouse->scan_ms = 50;
 	}
@@ -112,23 +110,14 @@ static int gpio_mouse_probe(struct platform_device *pdev)
 	if (IS_ERR(gmouse->bright))
 		return PTR_ERR(gmouse->bright);
 
-	input_poll = devm_input_allocate_polled_device(dev);
-	if (!input_poll) {
-		dev_err(dev, "not enough memory for input device\n");
+	input = devm_input_allocate_device(dev);
+	if (!input)
 		return -ENOMEM;
-	}
-
-	platform_set_drvdata(pdev, input_poll);
-
-	/* set input-polldev handlers */
-	input_poll->private = gmouse;
-	input_poll->poll = gpio_mouse_scan;
-	input_poll->poll_interval = gmouse->scan_ms;
 
-	input = input_poll->input;
 	input->name = pdev->name;
 	input->id.bustype = BUS_HOST;
-	input->dev.parent = &pdev->dev;
+
+	input_set_drvdata(input, gmouse);
 
 	input_set_capability(input, EV_REL, REL_X);
 	input_set_capability(input, EV_REL, REL_Y);
@@ -139,10 +128,16 @@ static int gpio_mouse_probe(struct platform_device *pdev)
 	if (gmouse->bright)
 		input_set_capability(input, EV_KEY, BTN_RIGHT);
 
-	ret = input_register_polled_device(input_poll);
-	if (ret) {
+	error = input_setup_polling(input, gpio_mouse_scan);
+	if (error)
+		return error;
+
+	input_set_poll_interval(input, gmouse->scan_ms);
+
+	error = input_register_device(input);
+	if (error) {
 		dev_err(dev, "could not register input device\n");
-		return ret;
+		return error;
 	}
 
 	dev_dbg(dev, "%d ms scan time, buttons: %s%s%s\n",
-- 
2.23.0.444.g18eeb5a265-goog


-- 
Dmitry
