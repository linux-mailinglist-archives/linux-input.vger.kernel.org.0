Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02C371D9F52
	for <lists+linux-input@lfdr.de>; Tue, 19 May 2020 20:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729512AbgESSZM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 May 2020 14:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729488AbgESSZI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 May 2020 14:25:08 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3728C08C5C1;
        Tue, 19 May 2020 11:25:07 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id E54B62A268F
Received: by jupiter.universe (Postfix, from userid 1000)
        id A2E294800FF; Tue, 19 May 2020 20:25:01 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv2 5/5] Input: EXC3000: Add reset gpio support
Date:   Tue, 19 May 2020 20:24:47 +0200
Message-Id: <20200519182447.73405-6-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519182447.73405-1-sebastian.reichel@collabora.com>
References: <20200519182447.73405-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add basic support for an optional reset gpio.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/input/touchscreen/exc3000.yaml   |  2 ++
 drivers/input/touchscreen/exc3000.c           | 29 +++++++++++++++----
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/exc3000.yaml b/Documentation/devicetree/bindings/input/touchscreen/exc3000.yaml
index d83b61e884df..8b70b918c7ca 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/exc3000.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/exc3000.yaml
@@ -22,6 +22,8 @@ properties:
     const: 0x2a
   interrupts:
     maxItems: 1
+  reset-gpios:
+    maxItems: 1
   touchscreen-size-x: true
   touchscreen-size-y: true
   touchscreen-inverted-x: true
diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index 1ae758bbf627..9fed66ef1719 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -8,7 +8,9 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
 #include <linux/input/mt.h>
@@ -32,6 +34,9 @@
 
 #define EXC3000_TIMEOUT_MS		100
 
+#define EXC3000_RESET_MS		10
+#define EXC3000_READY_MS		100
+
 static const struct i2c_device_id exc3000_id[];
 
 struct eeti_dev_info {
@@ -65,6 +70,7 @@ struct exc3000_data {
 	const struct eeti_dev_info *info;
 	struct input_dev *input;
 	struct touchscreen_properties prop;
+	struct gpio_desc *reset;
 	struct timer_list timer;
 	u8 buf[2 * EXC3000_LEN_FRAME];
 	struct completion wait_event;
@@ -305,16 +311,17 @@ static const struct attribute_group *exc3000_attribute_groups[] = {
 
 static int exc3000_probe(struct i2c_client *client)
 {
+	struct device *dev = &client->dev;
 	struct exc3000_data *data;
 	struct input_dev *input;
 	int error, max_xy, retry;
 
-	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
 	data->client = client;
-	data->info = device_get_match_data(&client->dev);
+	data->info = device_get_match_data(dev);
 	if (!data->info) {
 		enum eeti_dev_id eeti_dev_id =
 			i2c_match_id(exc3000_id, client)->driver_data;
@@ -324,7 +331,17 @@ static int exc3000_probe(struct i2c_client *client)
 	init_completion(&data->wait_event);
 	mutex_init(&data->query_lock);
 
-	input = devm_input_allocate_device(&client->dev);
+	data->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(data->reset))
+		return PTR_ERR(data->reset);
+
+	if (data->reset) {
+		msleep(EXC3000_RESET_MS);
+		gpiod_set_value_cansleep(data->reset, 0);
+		msleep(EXC3000_READY_MS);
+	}
+
+	input = devm_input_allocate_device(dev);
 	if (!input)
 		return -ENOMEM;
 
@@ -350,7 +367,7 @@ static int exc3000_probe(struct i2c_client *client)
 	if (error)
 		return error;
 
-	error = devm_request_threaded_irq(&client->dev, client->irq,
+	error = devm_request_threaded_irq(dev, client->irq,
 					  NULL, exc3000_interrupt, IRQF_ONESHOT,
 					  client->name, data);
 	if (error)
@@ -360,14 +377,14 @@ static int exc3000_probe(struct i2c_client *client)
 		error = exc3000_get_model(data);
 		if (!error)
 			break;
-		dev_warn(&client->dev, "Retry %d get EETI EXC3000 model: %d\n",
+		dev_warn(dev, "Retry %d get EETI EXC3000 model: %d\n",
 			 retry + 1, error);
 	}
 
 	if (error)
 		return error;
 
-	dev_dbg(&client->dev, "TS Model: %s", data->model);
+	dev_dbg(dev, "TS Model: %s", data->model);
 
 	return 0;
 }
-- 
2.26.2

