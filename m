Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0448873E
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2019 02:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729993AbfHJAUv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 20:20:51 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45594 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729942AbfHJAUv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 20:20:51 -0400
Received: by mail-pg1-f193.google.com with SMTP id o13so46601788pgp.12;
        Fri, 09 Aug 2019 17:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8AKZ5ZD0HUb8LkssG7Ft9LWK+6m+2SfNidG2892+3TM=;
        b=mAKWJ4Q4nWL5AE6DWehwIuHbsEV4e18977+HmXRP7kEUBCpa2fMhZqCsIl1lHBRSXv
         rmTJFjcEyeKqyBliWEtOlU/f3Qms4gmxTYaM058CAhbJOuyx09i20kf707CzcjADg2o8
         GYGdkpIzxeEot8rhQyojkA7qX0pe7vRvZs8WZPATwpQ57WEcRdyIHVAo7XsI2qHh6isP
         ZqG5pasTywiekLa14N0BDq+J5J7O+mSuu74Mfa5Pj5JyIbNv47dNACMTKRqCQA4L/SUi
         Yirq3Nka2WhTdaiC+5vCk3sPNFqe01/5GLyoyF9xnCJQHwUyd3lNt4LoSSGiMhbqyRgZ
         yDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8AKZ5ZD0HUb8LkssG7Ft9LWK+6m+2SfNidG2892+3TM=;
        b=R+wEXvh9Ke9PE6uf99629WNBIV0vxk/3VVa4VwikWQcs1LYTcEC60xZTW17w/E4JTU
         W/Hn/v1o3FnrEluvXIf//xmmEA2b2oMkNzBNYaIgDOIbrI2YS8JB8AqAwhXONyFUiYO4
         zwJgoA1RXnV2h42TgldYmfrbTkrBdzxZVzrHmHIf26HpFJIxRYFL1Bw/NC88E8hayumE
         8TD+EtATfdd0JB76OmwGwiY8Y4/Pnzx6XiM5GSoIZctce6SsLki9Y1q7mW/3sXfGt3rS
         Y5zDQSVHDDflH9tokqycJBTcwTcu/Raf84D3wl99c1BZczjyRNn8qYasZ0KGLXjAgTUl
         +oAg==
X-Gm-Message-State: APjAAAWe7CsovXQtx7pmVU1NLV26BOwG81qUVz22fTmje7wy9MmUtwB6
        mEe6i/w4WPdp9nAZjm/feEc=
X-Google-Smtp-Source: APXvYqzTedRggf3DNG2VvUT0DjG1eNYzP0emSchE5jNLHYuUggDe6BYLp16LTVGCGKsr7xdtbimaZA==
X-Received: by 2002:a62:874d:: with SMTP id i74mr23928434pfe.94.1565396449781;
        Fri, 09 Aug 2019 17:20:49 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v185sm110701150pfb.14.2019.08.09.17.20.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 17:20:49 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] Input: bu21013_ts - use interrupt from I2C client
Date:   Fri,  9 Aug 2019 17:20:36 -0700
Message-Id: <20190810002039.95876-9-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
References: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead of trying to map INT GPIO to interrupt, let's use one supplied by
I2C client. If there is none - bail. This will also allow us to treat INT
GPIO as optional, as per the binding.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 .../bindings/input/touchscreen/bu21013.txt    |  6 +++-
 drivers/input/touchscreen/bu21013_ts.c        | 35 ++++++++++---------
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt b/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt
index 43899fc36ecf..7ddb5de8343d 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt
@@ -4,6 +4,8 @@ Required properties:
  - compatible              : "rohm,bu21013_tp"
  - reg                     : I2C device address
  - reset-gpios             : GPIO pin enabling (selecting) chip (CS)
+ - interrupt-parent        : the phandle for the gpio controller
+ - interrupts              : (gpio) interrupt to which the chip is connected
 
 Optional properties:
  - touch-gpios             : GPIO pin registering a touch event
@@ -19,7 +21,9 @@ Example:
 		bu21013_tp@5c {
 			compatible = "rohm,bu21013_tp";
 			reg = <0x5c>;
-			touch-gpio = <&gpio2 20 0x4>;
+			interrupt-parent = <&gpio2>;
+			interrupts <&20 IRQ_TYPE_LEVEL_LOW>;
+			touch-gpio = <&gpio2 20 GPIO_ACTIVE_LOW>;
 			avdd-supply = <&ab8500_ldo_aux1_reg>;
 
 			rohm,touch-max-x = <384>;
diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
index 79de7327a460..d745643861cb 100644
--- a/drivers/input/touchscreen/bu21013_ts.c
+++ b/drivers/input/touchscreen/bu21013_ts.c
@@ -141,7 +141,6 @@
  * @regulator: pointer to the Regulator used for touch screen
  * @cs_gpiod: chip select GPIO line
  * @int_gpiod: touch interrupt GPIO line
- * @irq: interrupt number the device is using
  * @touch_x_max: maximum X coordinate reported by the device
  * @touch_y_max: maximum Y coordinate reported by the device
  * @x_flip: indicates that the driver should invert X coordinate before
@@ -158,7 +157,6 @@ struct bu21013_ts {
 	struct regulator *regulator;
 	struct gpio_desc *cs_gpiod;
 	struct gpio_desc *int_gpiod;
-	unsigned int irq;
 	u32 touch_x_max;
 	u32 touch_y_max;
 	bool x_flip;
@@ -252,7 +250,8 @@ static irqreturn_t bu21013_gpio_irq(int irq, void *device_data)
 		if (unlikely(ts->touch_stopped))
 			break;
 
-		keep_polling = gpiod_get_value(ts->int_gpiod);
+		keep_polling = ts->int_gpiod ?
+			gpiod_get_value(ts->int_gpiod) : false;
 		if (keep_polling)
 			usleep_range(2000, 2500);
 	} while (keep_polling);
@@ -419,6 +418,11 @@ static int bu21013_probe(struct i2c_client *client,
 		return -EIO;
 	}
 
+	if (!client->irq) {
+		dev_err(&client->dev, "No IRQ set up\n");
+		return -EINVAL;
+	}
+
 	ts = devm_kzalloc(&client->dev, sizeof(*ts), GFP_KERNEL);
 	if (!ts)
 		return -ENOMEM;
@@ -491,14 +495,17 @@ static int bu21013_probe(struct i2c_client *client,
 	}
 
 	/* Named "INT" on the chip, DT binding is "touch" */
-	ts->int_gpiod = devm_gpiod_get(&client->dev, "touch", GPIOD_IN);
+	ts->int_gpiod = devm_gpiod_get_optional(&client->dev,
+						"touch", GPIOD_IN);
 	error = PTR_ERR_OR_ZERO(ts->int_gpiod);
 	if (error) {
 		if (error != -EPROBE_DEFER)
 			dev_err(&client->dev, "failed to get INT GPIO\n");
 		return error;
 	}
-	gpiod_set_consumer_name(ts->int_gpiod, "BU21013 INT");
+
+	if (ts->int_gpiod)
+		gpiod_set_consumer_name(ts->int_gpiod, "BU21013 INT");
 
 	/* configure the touch panel controller */
 	error = bu21013_init_chip(ts);
@@ -507,16 +514,12 @@ static int bu21013_probe(struct i2c_client *client,
 		return error;
 	}
 
-	ts->irq = gpiod_to_irq(ts->int_gpiod);
-	error = devm_request_threaded_irq(&client->dev, ts->irq,
+	error = devm_request_threaded_irq(&client->dev, client->irq,
 					  NULL, bu21013_gpio_irq,
-					  IRQF_TRIGGER_FALLING |
-						IRQF_SHARED |
-						IRQF_ONESHOT,
-					  DRIVER_TP, ts);
+					  IRQF_ONESHOT, DRIVER_TP, ts);
 	if (error) {
 		dev_err(&client->dev, "request irq %d failed\n",
-			ts->irq);
+			client->irq);
 		return error;
 	}
 
@@ -549,9 +552,9 @@ static int __maybe_unused bu21013_suspend(struct device *dev)
 
 	ts->touch_stopped = true;
 	if (device_may_wakeup(&client->dev))
-		enable_irq_wake(ts->irq);
+		enable_irq_wake(client->irq);
 	else
-		disable_irq(ts->irq);
+		disable_irq(client->irq);
 
 	regulator_disable(ts->regulator);
 
@@ -579,9 +582,9 @@ static int __maybe_unused bu21013_resume(struct device *dev)
 	ts->touch_stopped = false;
 
 	if (device_may_wakeup(&client->dev))
-		disable_irq_wake(ts->irq);
+		disable_irq_wake(client->irq);
 	else
-		enable_irq(ts->irq);
+		enable_irq(client->irq);
 
 	return 0;
 }
-- 
2.23.0.rc1.153.gdeed80330f-goog

