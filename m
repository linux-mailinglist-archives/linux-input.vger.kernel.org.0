Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD628927D
	for <lists+linux-input@lfdr.de>; Sun, 11 Aug 2019 18:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbfHKQLI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 11 Aug 2019 12:11:08 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35437 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfHKQLI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 11 Aug 2019 12:11:08 -0400
Received: by mail-pf1-f196.google.com with SMTP id u14so48553343pfn.2;
        Sun, 11 Aug 2019 09:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=xydlxVWQzJhifAst3WcnlXEWdBAWf0idhBT3jbI1sqI=;
        b=Fn3SaMvIxOs7NYOL3xIslrO2lTU6asHwS39r2RMJWqTUEvRn0Ww7/1S2NZH2oGmpmG
         u7JPJjbbEF02XakqmcSgXr/EctLg0g0uHG9ZjZilrHR7gZ8UX2CInMULTQLjdu4SnGHQ
         w/ThesO6ld748cXzd2QhXrfT1WSd8t1dHWBF/d+Ccd1Kb+Vmee88kTyqxUywBVmxUG+f
         VvGJP9KLxEtpZYObNKZ4aOZewIyREkXRzMCZxIgajgIWIeDDnQIY3CkTODV7fA5RtwQN
         SMkryG3DRbFKQubuBkrcGbvx3N3Kflk+pwYVaaI7fFst3kucQDouax9Ehc3XGhUVGIYW
         7iPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=xydlxVWQzJhifAst3WcnlXEWdBAWf0idhBT3jbI1sqI=;
        b=UoeF1fbZkFtkTa6VeRT1G8Ir9BEfqk7v8ENNnnTwgwxylY1wY5ZthaxZehk8ChL0cj
         lnbbX623ms9Cvn3IQtgdQ9Ps833r9SAPPWBHjkVBxJFFc1FHEmdarqueRIftmTmOD9tE
         IHl88BDnG6qUHkt7ddAd1KK9gSidd2QguS8ysJw4FHIhfZnlms+CqFOLQyVavx8FhB0s
         R1OCUXmWoWIHflIqZYgRYF/l25tyy/goIG73XblAOVVR1PJsNg94Evx6Z1mUmXFvmzj8
         HPmqMKba3XqFPUuF6Pn9Uzsycij71oYm6uWsCMJT2hAin1RTFnhIBPB4GkU3c3wV271I
         whgA==
X-Gm-Message-State: APjAAAXRySIBWnxVJ5XqHQiSoENLSbGRWWOcgmmu2+TDU53US+2hqihs
        YNjIKWqrxV3IQLCrvjl5hM6I0zc/
X-Google-Smtp-Source: APXvYqwcLa7+gWrKGr5IouYaPIO0RNNKBBSfZC21hIgl/18cSRZObAm73/eFRaKWhSj60LrZxCtulg==
X-Received: by 2002:a17:90b:911:: with SMTP id bo17mr1801947pjb.40.1565539866930;
        Sun, 11 Aug 2019 09:11:06 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id j9sm9662429pfe.103.2019.08.11.09.11.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 11 Aug 2019 09:11:06 -0700 (PDT)
Date:   Sun, 11 Aug 2019 09:11:04 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: ili210x - switch to using threaded IRQ
Message-ID: <20190811161104.GA43556@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Let's switch the driver to using threaded IRQ so that we do not need to
manage the interrupt and work separately, and we do not acknowledge
interrupt until we finished handling it completely.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/ili210x.c | 89 +++++++++++++----------------
 1 file changed, 40 insertions(+), 49 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index e9006407c9bc..5a37d1eff2af 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -1,20 +1,20 @@
 // SPDX-License-Identifier: GPL-2.0-only
-#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
-#include <linux/interrupt.h>
-#include <linux/slab.h>
 #include <linux/input.h>
 #include <linux/input/mt.h>
 #include <linux/input/touchscreen.h>
-#include <linux/delay.h>
-#include <linux/workqueue.h>
-#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/slab.h>
 #include <asm/unaligned.h>
 
 #define ILI210X_TOUCHES		2
 #define ILI251X_TOUCHES		10
-#define DEFAULT_POLL_PERIOD	20
+
+#define ILI2XXX_POLL_PERIOD	20
 
 /* Touchscreen commands */
 #define REG_TOUCHDATA		0x10
@@ -36,12 +36,11 @@ enum ili2xxx_model {
 struct ili210x {
 	struct i2c_client *client;
 	struct input_dev *input;
-	unsigned int poll_period;
-	struct delayed_work dwork;
 	struct gpio_desc *reset_gpio;
 	struct touchscreen_properties prop;
 	enum ili2xxx_model model;
 	unsigned int max_touches;
+	bool stop;
 };
 
 static int ili210x_read_reg(struct i2c_client *client, u8 reg, void *buf,
@@ -170,43 +169,36 @@ static bool ili210x_report_events(struct ili210x *priv, u8 *touchdata)
 	return contact;
 }
 
-static void ili210x_work(struct work_struct *work)
+static irqreturn_t ili210x_irq(int irq, void *irq_data)
 {
-	struct ili210x *priv = container_of(work, struct ili210x,
-					    dwork.work);
+	struct ili210x *priv = irq_data;
 	struct i2c_client *client = priv->client;
 	u8 touchdata[64] = { 0 };
 	bool touch;
-	int error = -EINVAL;
-
-	if (priv->model == MODEL_ILI210X) {
-		error = ili210x_read_reg(client, REG_TOUCHDATA,
-					 touchdata, sizeof(touchdata));
-	} else if (priv->model == MODEL_ILI251X) {
-		error = ili210x_read_reg(client, REG_TOUCHDATA,
-					 touchdata, 31);
-		if (!error && touchdata[0] == 2)
-			error = ili210x_read(client, &touchdata[31], 20);
-	}
-
-	if (error) {
-		dev_err(&client->dev,
-			"Unable to get touchdata, err = %d\n", error);
-		return;
-	}
-
-	touch = ili210x_report_events(priv, touchdata);
+	int error;
 
-	if (touch)
-		schedule_delayed_work(&priv->dwork,
-				      msecs_to_jiffies(priv->poll_period));
-}
+	do {
+		if (priv->model == MODEL_ILI210X) {
+			error = ili210x_read_reg(client, REG_TOUCHDATA,
+						 touchdata, sizeof(touchdata));
+		} else if (priv->model == MODEL_ILI251X) {
+			error = ili210x_read_reg(client, REG_TOUCHDATA,
+						 touchdata, 31);
+			if (!error && touchdata[0] == 2)
+				error = ili210x_read(client,
+						     &touchdata[31], 20);
+		}
 
-static irqreturn_t ili210x_irq(int irq, void *irq_data)
-{
-	struct ili210x *priv = irq_data;
+		if (error) {
+			dev_err(&client->dev,
+				"Unable to get touchdata, err = %d\n", error);
+			break;
+		}
 
-	schedule_delayed_work(&priv->dwork, 0);
+		touch = ili210x_report_events(priv, touchdata);
+		if (touch)
+			msleep(ILI2XXX_POLL_PERIOD);
+	} while (!priv->stop && touch);
 
 	return IRQ_HANDLED;
 }
@@ -253,11 +245,12 @@ static void ili210x_power_down(void *data)
 	gpiod_set_value_cansleep(reset_gpio, 1);
 }
 
-static void ili210x_cancel_work(void *data)
+static void ili210x_stop(void *data)
 {
 	struct ili210x *priv = data;
 
-	cancel_delayed_work_sync(&priv->dwork);
+	/* Tell ISR to quit even if there is a contact. */
+	priv->stop = true;
 }
 
 static int ili210x_i2c_probe(struct i2c_client *client,
@@ -305,8 +298,6 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 
 	priv->client = client;
 	priv->input = input;
-	priv->poll_period = DEFAULT_POLL_PERIOD;
-	INIT_DELAYED_WORK(&priv->dwork, ili210x_work);
 	priv->reset_gpio = reset_gpio;
 	priv->model = model;
 	if (model == MODEL_ILI210X)
@@ -336,18 +327,18 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	touchscreen_parse_properties(input, true, &priv->prop);
 	input_mt_init_slots(input, priv->max_touches, INPUT_MT_DIRECT);
 
-	error = devm_add_action(dev, ili210x_cancel_work, priv);
-	if (error)
-		return error;
-
-	error = devm_request_irq(dev, client->irq, ili210x_irq, 0,
-				 client->name, priv);
+	error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
+					  IRQF_ONESHOT, client->name, priv);
 	if (error) {
 		dev_err(dev, "Unable to request touchscreen IRQ, err: %d\n",
 			error);
 		return error;
 	}
 
+	error = devm_add_action_or_reset(dev, ili210x_stop, priv);
+	if (error)
+		return error;
+
 	error = devm_device_add_group(dev, &ili210x_attr_group);
 	if (error) {
 		dev_err(dev, "Unable to create sysfs attributes, err: %d\n",
-- 
2.23.0.rc1.153.gdeed80330f-goog


-- 
Dmitry
