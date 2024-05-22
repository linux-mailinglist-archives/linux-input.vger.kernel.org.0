Return-Path: <linux-input+bounces-3783-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 320B08CC7BA
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 22:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3C111F21CEB
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 20:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B07C130A53;
	Wed, 22 May 2024 20:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rv4QIqgA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B6E7E575;
	Wed, 22 May 2024 20:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716410060; cv=none; b=CSwFMLbbamiJeg5mnz+PWr7wzeTZ4679QbEEeS2W4gKjnKqvR2rp/xItpqH2lWf8vutWgUfXojjIICllzXj1ZsRwyXPVdANckdHREu2bQTs7G1t895ozlO2f1PNQSQVyRPCzxRyb3EgJoPIuM3ye50KnORvS0aKqhBCmxCREk6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716410060; c=relaxed/simple;
	bh=mXwVlRh8ZlbqRziU16vy3xLWexsfSXKym8se1AvFfgY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rjCJ5NHsjnv/53XwWAst0fynmBerwvbJxVAxpcwaKxcaAbZp+/jRMv2GnivNXYBB4SqrLsY0u1/q2lMbNg+NI14W25/3TtKZp3JGj4BN4lEqRxKunNlAwv8qh6FJk36uVROaQ8KVEPvP0Yh7KhKQWqYAGa5clee+s6mCgETWKF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rv4QIqgA; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e724bc46bfso46559931fa.3;
        Wed, 22 May 2024 13:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716410057; x=1717014857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ReAR8qCzaCj4SWTQZC7+JgJfwLHGD8//uS15F2h+Q3k=;
        b=Rv4QIqgAZa7qlMFVg7RyU9qksvpQgcP962s5KRL6IAEPpajifCn2NI/ASQyi3E4bHz
         aOioLp+Zw9NA5bc6lGCVpm503xHmRvf6hgzi/Fp1pRYl6UCpJTb/rEnr6tJRbs0r+nxC
         +E/wsf+LwCptmzhC1HvqXpHKK42T3Uxf/x0vL+DPBh7X2CcurukR9nZOgItMa3ZVEp3e
         y82a+n8iZEU88/uwyxwYXCDcl4q+W9cDVumg4CDVz45N7yGuuNQ+F8rgm7iBguZA+ldH
         ERuPVCf0Ei8AcBvlrTHRg78cCAjmpq3WhdER4Nh37qAeObaGp0s4jUjjuBshRTEKRY5H
         G+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716410057; x=1717014857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ReAR8qCzaCj4SWTQZC7+JgJfwLHGD8//uS15F2h+Q3k=;
        b=cC7joArVX2XJGzYAGD5MsQJXwmb42DfWQUuhC/3vsR+fu40VWyHFTzll5LU4UOzBwC
         B4iLk754SfzbRvWftEurgXfDSvZv3HvxtNKBC2Pc6ygCxajP5dZPyLZxM0asxOV3RSW0
         cWjaM9gbwuP/Eckgm2NkorAklZPPTVthK5Nu5V1cmow8fW8etEo3qD+KOahBo3DwstXs
         yDqTqdKEpdVVQ6SZ4enOVOBYdohTrGY9xhP5t/VLnRRbOs4wp0ahT1K3tOphTIMS8bvG
         gHSnuJctU7xsjsG5uNWNsi2wIZ2UIZl3gBy4nAw9TJ09o9W4AkZI1Pu7v12Bvk9RFd4s
         pfvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfSwblN1RPL5cwehxNKHv655/wvUbj6DPZwA8mVql1SUhaV0X6jhq2pwIkhWOHaFg22Os0jh5qv1u1iMLQ17uzd/QMq/tA6v4Ck4RxTbSo9EcmNZ8KjGBN0K760VGaKjYfvq1ccDb0nA==
X-Gm-Message-State: AOJu0Yy700WXB8OYrkfZGrjRb6LV1SZUSXlOwOt/pmQD2RRcFAHhIWC9
	T8sQtpiPFD0Agj+mOewaYqUhxmn0LVq7GoouegRSgb+lplzZIHJl1ZxDq2T8
X-Google-Smtp-Source: AGHT+IExs+YGF0S6Sp2FI4k3okLmu9pAPObUev3exep7yg5EmW9Zf1/UD/YTl7/I5l1+2NRZ+4Z5Bg==
X-Received: by 2002:a2e:a0c8:0:b0:2e7:2a81:a153 with SMTP id 38308e7fff4ca-2e9494f1874mr16670741fa.24.1716410056377;
        Wed, 22 May 2024 13:34:16 -0700 (PDT)
Received: from localhost.localdomain (89-64-18-73.dynamic.chello.pl. [89.64.18.73])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e4d0ce35dcsm41575161fa.34.2024.05.22.13.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 13:34:16 -0700 (PDT)
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
To: linux-input@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	jeff@labundy.com,
	neil.armstrong@linaro.org,
	schnelle@linux.ibm.com,
	arnd@kernel.org,
	kuzhylol@gmail.com,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	artur.serhiienko@gmail.com,
	igor.opaniuk@gmail.com
Subject: [PATCH v2 2/2] input: add driver for Hynitron CST816X touchscreen
Date: Wed, 22 May 2024 17:33:47 -0300
Message-Id: <20240522203347.2263425-2-kuzhylol@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240522203347.2263425-1-kuzhylol@gmail.com>
References: <20240522203347.2263425-1-kuzhylol@gmail.com>
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

Changes in v2:
 - Apply dev_err_probe() for better error handling
 - Remove redundant printing, remove dev_warn() message spamming
 - Get rid of PM since the touchscreen goes into sleep mode automatically
 - Get rid of IRQ control and IRQF_NO_AUTOEN flag
 - Reduce timer timeout up to 10ms to handle touch events faster
 - Skip registering of non-gesture CST816X_SWIPE event
 - Shift input_register_device() as a final call in probe() callback
 - Specify name of i2c_device_id explicitly
 - Update module description and fix typo
 - Add necessary spaces between lines

 drivers/input/touchscreen/Kconfig            |  12 +
 drivers/input/touchscreen/Makefile           |   1 +
 drivers/input/touchscreen/hynitron-cst816x.c | 306 +++++++++++++++++++
 3 files changed, 319 insertions(+)
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
index 000000000000..86715c3d1872
--- /dev/null
+++ b/drivers/input/touchscreen/hynitron-cst816x.c
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for I2C connected Hynitron CST816X Touchscreen
+ *
+ * Copyright (C) 2024 Oleh Kuzhylnyi <kuzhylol@gmail.com>
+ */
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/of_irq.h>
+#include <linux/timer.h>
+
+#define CST816X_MAX_X 240
+#define CST816X_MAX_Y CST816X_MAX_X
+
+#define CST816X_EVENT_TIMEOUT_MS 10
+
+enum cst816x_registers {
+	CST816X_FRAME = 0x01,
+	CST816X_MOTION = 0xEC,
+};
+
+enum cst816_gesture_code {
+	CST816X_SWIPE = 0x00,
+	CST816X_SWIPE_UP = 0x01,
+	CST816X_SWIPE_DOWN = 0x02,
+	CST816X_SWIPE_LEFT = 0x03,
+	CST816X_SWIPE_RIGHT = 0x04,
+	CST816X_SINGLE_TAP = 0x05,
+	CST816X_DOUBLE_TAP = 0x0B,
+	CST816X_LONG_PRESS = 0x0C,
+};
+
+struct cst816x_info {
+	u8 gesture;
+	u8 x;
+	u8 y;
+};
+
+struct cst816x_priv {
+	struct device *dev;
+	struct i2c_client *client;
+	struct gpio_desc *reset;
+	struct input_dev *input;
+	struct timer_list timer;
+	struct delayed_work dw;
+	struct cst816x_info info;
+
+	u8 rxtx[8];
+};
+
+struct cst816x_gesture_mapping {
+	enum cst816_gesture_code gesture_code;
+	size_t event_code;
+};
+
+static const struct cst816x_gesture_mapping cst816x_gesture_map[] = {
+	{CST816X_SWIPE, KEY_UNKNOWN},
+	{CST816X_SWIPE_UP, KEY_UP},
+	{CST816X_SWIPE_DOWN, KEY_DOWN},
+	{CST816X_SWIPE_LEFT, KEY_LEFT},
+	{CST816X_SWIPE_RIGHT, KEY_RIGHT},
+	{CST816X_SINGLE_TAP, BTN_TOUCH},
+	{CST816X_DOUBLE_TAP, BTN_TOOL_DOUBLETAP},
+	{CST816X_LONG_PRESS, BTN_TOOL_TRIPLETAP}
+};
+
+static int cst816x_i2c_write_reg(struct cst816x_priv *priv, u8 reg, u8 cmd)
+{
+	struct i2c_client *client;
+	struct i2c_msg xfer;
+	int rc;
+
+	client = priv->client;
+
+	priv->rxtx[0] = reg;
+	priv->rxtx[1] = cmd;
+
+	xfer.addr = client->addr;
+	xfer.flags = 0;
+	xfer.len = 2;
+	xfer.buf = priv->rxtx;
+
+	rc = i2c_transfer(client->adapter, &xfer, 1);
+	if (rc != 1) {
+		if (rc >= 0)
+			rc = -EIO;
+	} else {
+		rc = 0;
+	}
+
+	if (rc < 0)
+		dev_err(&client->dev, "i2c tx err: %d\n", rc);
+
+	return rc;
+}
+
+static int cst816x_i2c_read_reg(struct cst816x_priv *priv, u8 reg)
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
+static int cst816x_setup_regs(struct cst816x_priv *priv)
+{
+	return cst816x_i2c_write_reg(priv, CST816X_MOTION, CST816X_DOUBLE_TAP);
+}
+
+static void report_gesture_event(const struct cst816x_priv *priv,
+				 enum cst816_gesture_code gesture_code,
+				 bool state)
+{
+	const struct cst816x_gesture_mapping *lookup = NULL;
+
+	for (u8 i = CST816X_SWIPE_UP; i < ARRAY_SIZE(cst816x_gesture_map); i++) {
+		if (cst816x_gesture_map[i].gesture_code == gesture_code) {
+			lookup = &cst816x_gesture_map[i];
+			break;
+		}
+	}
+
+	if (lookup)
+		input_report_key(priv->input, lookup->event_code, state);
+}
+
+static int cst816x_process_touch(struct cst816x_priv *priv)
+{
+	u8 *raw;
+	int rc;
+
+	rc = cst816x_i2c_read_reg(priv, CST816X_FRAME);
+	if (!rc) {
+		raw = priv->rxtx;
+
+		priv->info.gesture = raw[0];
+		priv->info.x = ((raw[2] & 0x0F) << 8) | raw[3];
+		priv->info.y = ((raw[4] & 0x0F) << 8) | raw[5];
+
+		dev_dbg(priv->dev, "x: %d, y: %d, gesture: 0x%x\n",
+			priv->info.x, priv->info.y, priv->info.gesture);
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
+	for (u8 i = CST816X_SWIPE_UP; i < ARRAY_SIZE(cst816x_gesture_map); i++) {
+		input_set_capability(priv->input, EV_KEY,
+				     cst816x_gesture_map[i].event_code);
+	}
+
+	input_set_abs_params(priv->input, ABS_X, 0, CST816X_MAX_X, 0, 0);
+	input_set_abs_params(priv->input, ABS_Y, 0, CST816X_MAX_Y, 0, 0);
+	input_set_capability(priv->input, EV_ABS, ABS_X);
+	input_set_capability(priv->input, EV_ABS, ABS_Y);
+
+	return input_register_device(priv->input);
+}
+
+static void cst816x_reset(struct cst816x_priv *priv)
+{
+	gpiod_set_value_cansleep(priv->reset, 0);
+	msleep(100);
+	gpiod_set_value_cansleep(priv->reset, 1);
+	msleep(100);
+}
+
+static void cst816x_timer_cb(struct timer_list *timer)
+{
+	struct cst816x_priv *priv = from_timer(priv, timer, timer);
+
+	report_gesture_event(priv, priv->info.gesture, false);
+	input_sync(priv->input);
+}
+
+static void cst816x_dw_cb(struct work_struct *work)
+{
+	struct cst816x_priv *priv =
+		container_of(work, struct cst816x_priv, dw.work);
+
+	if (!cst816x_process_touch(priv)) {
+		input_report_abs(priv->input, ABS_X, priv->info.x);
+		input_report_abs(priv->input, ABS_Y, priv->info.y);
+		report_gesture_event(priv, priv->info.gesture, true);
+		input_sync(priv->input);
+
+		mod_timer(&priv->timer,
+			  jiffies + msecs_to_jiffies(CST816X_EVENT_TIMEOUT_MS));
+	}
+}
+
+static irqreturn_t cst816x_irq_cb(int irq, void *cookie)
+{
+	struct cst816x_priv *priv = (struct cst816x_priv *)cookie;
+
+	schedule_delayed_work(&priv->dw, 0);
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
+	INIT_DELAYED_WORK(&priv->dw, cst816x_dw_cb);
+	timer_setup(&priv->timer, cst816x_timer_cb, 0);
+
+	priv->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->reset))
+		return dev_err_probe(dev, PTR_ERR(priv->reset),
+				     "reset gpio not found\n");
+
+	if (priv->reset)
+		cst816x_reset(priv);
+
+	rc = cst816x_setup_regs(priv);
+	if (rc)
+		return dev_err_probe(dev, rc, "regs setup failed\n");
+
+	client->irq = of_irq_get(dev->of_node, 0);
+	if (client->irq <= 0)
+		return dev_err_probe(dev, client->irq, "irq lookup failed\n");
+
+	rc = devm_request_threaded_irq(dev, client->irq, NULL, cst816x_irq_cb,
+				       IRQF_ONESHOT, dev->driver->name, priv);
+	if (rc)
+		return dev_err_probe(dev, client->irq, "irq request failed\n");
+
+	return cst816x_register_input(priv);
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
2.30.2


