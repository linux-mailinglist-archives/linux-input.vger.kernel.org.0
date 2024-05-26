Return-Path: <linux-input+bounces-3846-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9195D8CF621
	for <lists+linux-input@lfdr.de>; Sun, 26 May 2024 23:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06254B216F1
	for <lists+linux-input@lfdr.de>; Sun, 26 May 2024 21:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA67113A248;
	Sun, 26 May 2024 21:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rt1rDe5W"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C798F139D00;
	Sun, 26 May 2024 21:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716758696; cv=none; b=eZxyDAEML4DqvAyFlwS0gA56Xpn888n+YabW+WIC16z4dkgyoQ+aNddyQRJGipfb4RhQ1IfP7Hd/gNJixbPzcD1CfKHjUE+YLpnrAwYM4uzoyik792L1+srTSobeYxnot8yGvghWRX5503zzeqeZmdtsAHUnfyeDRGBGzcHfHng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716758696; c=relaxed/simple;
	bh=uZ39KIbWJ8d7A2MhC1kIGNvMH8Bm0uXEpnAWuCr8jPE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fod79wLXOF2jg/ocqSnskHzYlwBhiE1A87dRti1wK3QL41EJ57x4M6/n4W1Axa+J7Fmx69q6gc7kTpRux8NXzFauXVXD9fc8hrXgGgCru65SbfexCN99UnCCpyG5O4X1DxZcKM0JwXuFOWS8N1OrPCH1SG3774QsBdUSYN0wLYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rt1rDe5W; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57857e0f45cso2480709a12.1;
        Sun, 26 May 2024 14:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716758693; x=1717363493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZD4KnpsZe+1fwVEBLmQxNQ3vyqVmLh7NO03oOECCVqY=;
        b=Rt1rDe5WmdKKfmtGIGYbmhUf1SGBqDpi11ZBPj5YpY2+ppCAWFGi8XfZq6NYmpfdVq
         Pyvqwjjq34pSh0X5xAg0oSeUauxmY2ZAJZFB1PvkpYWleUVKzTtj18BcEL7WaJM6BYm7
         Ak3rrZFgaE+8NmXb6LSDAwKcPzWcRMJ32JkpHkKlC7Fo+BxmoQxxtcm6MtWhp3cRPcCu
         HCydGGngHOYV3A3JVMcYumrwU8yj5K5CyT64wSERAv9XqsKQz2rEJtdcZJIkQkb3meZG
         Kkgc+0Cz0HVDVJPHsBOTuQA0HUslg5NNUkDozhibJLNxoemv9NbWYqM6MUzG9fZSLime
         Eyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716758693; x=1717363493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZD4KnpsZe+1fwVEBLmQxNQ3vyqVmLh7NO03oOECCVqY=;
        b=todPJ2CENy0pwXc7luCYnMKTLdLLfz5qyUv3a3996Eusp6aN9krbgLR4JAvdHC1X1V
         ZJmuR1ytZHhhNyyTkp5nFxxM/K/vyeCHzOHeWxKd1To877GjcrBwS7+R5/0yfcLVuUBx
         8pUAC+Y/UMrKv8LXMVs7KTdNJNDuNhmu7pUzPcZ4wqU25+y3hWoeFsEabgXXplFW5CcW
         P0Yg0Pn92V5RSmcDi1ybR6ku4vbvXudUPwenofy2H2bzORFnFcLoqoedfPk+hVJZgd+s
         AiCcsKIs4RUqzEq4uumtqgib1M/t+Dq9HJ+aNgqHfUoj8Gul7ixTeHDLZbMLl6lePbkh
         HQLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI5MB2wDN5wWyxk4bZtRh2TZmrN6rF/06JKRDjngjKn+EucRiT+1zbMVM4aLycAdOsrWoSjHYKrox7u6tS6u5Q6AIahIZaTGNrXL5qZKxyBjD9PyfminViMCSGBb80F+o55scOCsGgAw==
X-Gm-Message-State: AOJu0YztndJJXbzqJodg19/hHbGiCHjZcg02mvIvESaRR87eOr3OZXse
	gU1YU04nZcnh0LfFmZ0xcC3IHItcvtxp3U24Dv9t4N9tJFrZiGL+Pk+Hjw==
X-Google-Smtp-Source: AGHT+IGIJlRzEMS916ayVUC+xxdHJmNW7PpZcdIayTPguYZyK9+umiNlNW8nUJicT5Qj1uR7hJdF3Q==
X-Received: by 2002:a17:907:971c:b0:a62:cecd:26e3 with SMTP id a640c23a62f3a-a62cecd2767mr227821366b.39.1716758692795;
        Sun, 26 May 2024 14:24:52 -0700 (PDT)
Received: from kuzhyl-vm.. (89-64-18-73.dynamic.chello.pl. [89.64.18.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c817088sm418093066b.24.2024.05.26.14.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 14:24:52 -0700 (PDT)
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
To: linux-input@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kuzhylol@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jeff@labundy.com,
	neil.armstrong@linaro.org,
	hdegoede@redhat.com,
	artur.serhiienko@gmail.com,
	igor.opaniuk@gmail.com
Subject: [PATCH v3 2/2] input: add driver for Hynitron CST816X touchscreen
Date: Sun, 26 May 2024 23:24:42 +0200
Message-Id: <20240526212443.8496-2-kuzhylol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240526212443.8496-1-kuzhylol@gmail.com>
References: <20240526212443.8496-1-kuzhylol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce support for the Hynitron CST816X touchscreen controller
used for 240×240 1.28-inch Round LCD Display Module manufactured
by Waveshare Electronics. The driver is designed based on an Arduino
implementation marked as under MIT License. This driver is written
for a particular round display based on the CST816S controller, which
is not compatiable with existing driver for Hynitron controllers.

Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
---

Changes in v3:
 - Drop timer and delayed work
 - Process touch in threaded IRQ context
 - Fix chip reset sequence
 - Move input_register() before devm_request_threaded_irq()
 - Re-arrange and document input reporting
 - Set u16 data type for event_code
 - Remove double tap event to prevent continuous double side sliding

 drivers/input/touchscreen/Kconfig            |  12 +
 drivers/input/touchscreen/Makefile           |   1 +
 drivers/input/touchscreen/hynitron-cst816x.c | 257 +++++++++++++++++++
 3 files changed, 270 insertions(+)
 create mode 100644 drivers/input/touchscreen/hynitron-cst816x.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index c821fe3ee794..02f40d0fbac0 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -481,6 +481,18 @@ config TOUCHSCREEN_HYNITRON_CSTXXX
 	  To compile this driver as a module, choose M here: the
 	  module will be called hynitron-cstxxx.
 
+config TOUCHSCREEN_HYNITRON_CST816X
+	tristate "Hynitron CST816X touchscreen support"
+	depends on I2C
+	help
+	  Say Y here if you have a touchscreen using a Hynitron
+	  CST816X touchscreen controller.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called hynitron-cst816x.
+
 config TOUCHSCREEN_ILI210X
 	tristate "Ilitek ILI210X based touchscreen"
 	depends on I2C
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index a81cb5aa21a5..a92a87417a97 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_CORE)	+= goodix_berlin_core.o
 obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_I2C)	+= goodix_berlin_i2c.o
 obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_SPI)	+= goodix_berlin_spi.o
 obj-$(CONFIG_TOUCHSCREEN_HIDEEP)	+= hideep.o
+obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CST816X)	+= hynitron-cst816x.o
 obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX)	+= hynitron_cstxxx.o
 obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
 obj-$(CONFIG_TOUCHSCREEN_ILITEK)	+= ilitek_ts_i2c.o
diff --git a/drivers/input/touchscreen/hynitron-cst816x.c b/drivers/input/touchscreen/hynitron-cst816x.c
new file mode 100644
index 000000000000..5bb85ec1d60e
--- /dev/null
+++ b/drivers/input/touchscreen/hynitron-cst816x.c
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for I2C connected Hynitron CST816X Touchscreen
+ *
+ * Copyright (C) 2024 Oleh Kuzhylnyi <kuzhylol@gmail.com>
+ */
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+
+enum cst816x_registers {
+	CST816X_FRAME = 0x01,
+	CST816X_MOTION = 0xEC,
+};
+
+enum cst816x_gestures {
+	CST816X_SWIPE_UP = 0x01,
+	CST816X_SWIPE_DOWN = 0x02,
+	CST816X_SWIPE_LEFT = 0x03,
+	CST816X_SWIPE_RIGHT = 0x04,
+	CST816X_SINGLE_TAP = 0x05,
+	CST816X_LONG_PRESS = 0x0C,
+};
+
+struct cst816x_touch_info {
+	u8 gesture;
+	u8 touch;
+	u8 abs_x;
+	u8 abs_y;
+} __packed;
+
+struct cst816x_priv {
+	struct device *dev;
+	struct i2c_client *client;
+	struct gpio_desc *reset;
+	struct input_dev *input;
+	struct cst816x_touch_info info;
+
+	u8 rxtx[8];
+};
+
+struct cst816x_event_mapping {
+	enum cst816x_gestures gesture;
+	u16 event_code;
+};
+
+static const struct cst816x_event_mapping cst816x_event_map[] = {
+	{CST816X_SWIPE_UP, BTN_FORWARD},
+	{CST816X_SWIPE_DOWN, BTN_BACK},
+	{CST816X_SWIPE_LEFT, BTN_LEFT},
+	{CST816X_SWIPE_RIGHT, BTN_RIGHT},
+	{CST816X_SINGLE_TAP, BTN_TOUCH},
+	{CST816X_LONG_PRESS, BTN_TOOL_TRIPLETAP}
+};
+
+static int cst816x_i2c_read_register(struct cst816x_priv *priv, u8 reg)
+{
+	struct i2c_client *client;
+	struct i2c_msg xfer[2];
+	int rc;
+
+	client = priv->client;
+
+	xfer[0].addr = client->addr;
+	xfer[0].flags = 0;
+	xfer[0].len = sizeof(reg);
+	xfer[0].buf = &reg;
+
+	xfer[1].addr = client->addr;
+	xfer[1].flags = I2C_M_RD;
+	xfer[1].len = sizeof(priv->rxtx);
+	xfer[1].buf = priv->rxtx;
+
+	rc = i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer));
+	if (rc != ARRAY_SIZE(xfer)) {
+		if (rc >= 0)
+			rc = -EIO;
+	} else {
+		rc = 0;
+	}
+
+	if (rc < 0)
+		dev_err(&client->dev, "i2c rx err: %d\n", rc);
+
+	return rc;
+}
+
+static int cst816x_process_touch(struct cst816x_priv *priv)
+{
+	u8 *raw;
+	int rc;
+
+	rc = cst816x_i2c_read_register(priv, CST816X_FRAME);
+	if (!rc) {
+		raw = priv->rxtx;
+
+		priv->info.gesture = raw[0];
+		priv->info.touch = raw[1];
+		priv->info.abs_x = ((raw[2] & 0x0F) << 8) | raw[3];
+		priv->info.abs_y = ((raw[4] & 0x0F) << 8) | raw[5];
+
+		dev_dbg(priv->dev, "x: %d, y: %d, t: %d, g: 0x%x\n",
+			priv->info.abs_x, priv->info.abs_y, priv->info.touch,
+			priv->info.gesture);
+	}
+
+	return rc;
+}
+
+static int cst816x_register_input(struct cst816x_priv *priv)
+{
+	priv->input = devm_input_allocate_device(priv->dev);
+	if (!priv->input)
+		return -ENOMEM;
+
+	priv->input->name = "Hynitron CST816X Touchscreen";
+	priv->input->phys = "input/ts";
+	priv->input->id.bustype = BUS_I2C;
+	input_set_drvdata(priv->input, priv);
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(cst816x_event_map); i++) {
+		input_set_capability(priv->input, EV_KEY,
+				     cst816x_event_map[i].event_code);
+	}
+
+	input_set_abs_params(priv->input, ABS_X, 0, 240, 0, 0);
+	input_set_abs_params(priv->input, ABS_Y, 0, 240, 0, 0);
+
+	return input_register_device(priv->input);
+}
+
+static void cst816x_reset(struct cst816x_priv *priv)
+{
+	gpiod_set_value_cansleep(priv->reset, 1);
+	msleep(50);
+	gpiod_set_value_cansleep(priv->reset, 0);
+	msleep(100);
+}
+
+static void report_gesture_event(const struct cst816x_priv *priv,
+				 enum cst816x_gestures gesture, bool touch)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(cst816x_event_map); i++) {
+		if (cst816x_event_map[i].gesture == gesture) {
+			input_report_key(priv->input,
+					 cst816x_event_map[i].event_code,
+					 touch);
+			break;
+		}
+	}
+
+	if (!touch)
+		input_report_key(priv->input, BTN_TOUCH, 0);
+}
+
+/*
+ * Supports five gestures: TOUCH, LEFT, RIGHT, FORWARD, BACK, and LONG_PRESS.
+ * Reports surface interaction, sliding coordinates and finger detachment.
+ *
+ * 1. TOUCH Gesture Scenario:
+ *
+ * [x/y] [touch] [gesture] [Action] [Report ABS] [Report Key]
+ *  x y   true    0x00      Touch    ABS_X_Y      BTN_TOUCH
+ *  x y   true    0x00      Slide    ABS_X_Y
+ *  x y   false   0x05      Gesture               BTN_TOUCH
+ *
+ * 2. LEFT, RIGHT, FORWARD, BACK, and LONG_PRESS Gestures Scenario:
+ *
+ * [x/y] [touch] [gesture] [Action] [Report ABS] [Report Key]
+ *  x y   true    0x00      Touch    ABS_X_Y      BTN_TOUCH
+ *  x y   true    0x01      Gesture  ABS_X_Y      BTN_FORWARD
+ *  x y   true    0x01      Slide    ABS_X_Y
+ *  x y   false   0x01      Detach                BTN_FORWARD | BTN_TOUCH
+ */
+static irqreturn_t cst816x_irq_cb(int irq, void *cookie)
+{
+	struct cst816x_priv *priv = (struct cst816x_priv *)cookie;
+
+	if (!cst816x_process_touch(priv)) {
+		if (priv->info.touch) {
+			input_report_abs(priv->input, ABS_X, priv->info.abs_x);
+			input_report_abs(priv->input, ABS_Y, priv->info.abs_y);
+			input_report_key(priv->input, BTN_TOUCH, 1);
+		}
+
+		if (priv->info.gesture)
+			report_gesture_event(priv, priv->info.gesture,
+					     priv->info.touch);
+
+		input_sync(priv->input);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int cst816x_probe(struct i2c_client *client)
+{
+	struct cst816x_priv *priv;
+	struct device *dev = &client->dev;
+	int rc;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->client = client;
+
+	priv->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->reset))
+		return dev_err_probe(dev, PTR_ERR(priv->reset),
+				     "reset gpio not found\n");
+
+	cst816x_reset(priv);
+
+	rc = cst816x_register_input(priv);
+	if (rc)
+		return dev_err_probe(dev, rc, "input register failed\n");
+
+	rc = devm_request_threaded_irq(dev, client->irq, NULL, cst816x_irq_cb,
+				       IRQF_ONESHOT, dev->driver->name, priv);
+	if (rc)
+		return dev_err_probe(dev, rc, "irq request failed\n");
+
+	return 0;
+}
+
+static const struct i2c_device_id cst816x_id[] = {
+	{ .name = "cst816s", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, cst816x_id);
+
+static const struct of_device_id cst816x_of_match[] = {
+	{ .compatible = "hynitron,cst816s", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cst816x_of_match);
+
+static struct i2c_driver cst816x_driver = {
+	.driver = {
+		.name = "cst816x",
+		.of_match_table = cst816x_of_match,
+	},
+	.id_table = cst816x_id,
+	.probe = cst816x_probe,
+};
+
+module_i2c_driver(cst816x_driver);
+
+MODULE_AUTHOR("Oleh Kuzhylnyi <kuzhylol@gmail.com>");
+MODULE_DESCRIPTION("Hynitron CST816X Touchscreen Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


