Return-Path: <linux-input+bounces-6383-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B9E973678
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 13:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31F49286B1E
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 11:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A61718FDA7;
	Tue, 10 Sep 2024 11:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eb0qxZRC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C3E18C932;
	Tue, 10 Sep 2024 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725969128; cv=none; b=NGkP1mKtPtGK/oZK2Ichx4x+r5UJUMbSgoIooMcikbeZ4au/F8A9onTal0RMuup8WNPT4USpiCJSmnhBtsxdOuMXPUKS5gPHUtApoBm4xQFOtXgB0jogFS/GO1ECcg1wM+KgG6c8jdug5x7nQHtNeRjT739HLfU1zJxyOJ8AtKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725969128; c=relaxed/simple;
	bh=ZpqNG3urr23NEi4OonQDkHHBaoF6QUyS+kFx8zNria4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uOUvKrZkN9lNF+rmXHEM83pvGU86SYKTVWIS0FE/bFcrERdUl81rVOsdBGoUy91e9PsSkXFmEjzX0VL/in1bZ7stPJzmtp8lgPM7DhsDv079uZjGDEbaJeoZrcp2pvaIUZKiiZGB/p+IhJpF2otpCXZ+OP/e5pfgQysWZ0VYBGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eb0qxZRC; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-535dc4ec181so5037701e87.3;
        Tue, 10 Sep 2024 04:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725969124; x=1726573924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95W4XCkHfmShfwc692ZJMWzRaVk4yLWxlXFSj911AOY=;
        b=eb0qxZRCVQ0vmaHnrzcZl7g0CRGitAjMPpP+F//e3Q40si2+B2S0uKA0AvHeBE6zvH
         ioW+EL1D71Bnqkwy7H0yTjqIStfIXXXSDTxiwx4q2+LiWhzALUuH5GTHBATvyhSdl436
         J0zflHPGTrSdwuoTuX8qGWc4H+vl4oFhCGwLtPEhI21dWXzB61W5mKBuakEAillDqLdC
         mKE/GrCG9lZEbRkgTi6YB6uHFZ3i0iDHtHG/OEVmSl1W3UAV/lLV41fFOwYAJfoJeoEj
         WjsEF9Gu8dYNCvyLqRCxjulZinWttJ2xFEb7RmBOopxCtQEgZ6Zf7f7BduUq5Odu7kQh
         h8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725969124; x=1726573924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95W4XCkHfmShfwc692ZJMWzRaVk4yLWxlXFSj911AOY=;
        b=AO7ZcHQiYwkoEquOXPAqfmFHGmkX6EGFL2DZ6CEkPw+zSo48rD/aAF1yvly+1GQ5G+
         3Oa2NifDCMEEomzprznLXJbXDFIC78xpwncKE14Rabz/Xtm9gWOnuVKNK91rD0zTNeaF
         Bc7CM0bIa3qtjn2/0DuoF9ocGVgXHJ9n8BtI2iSS2/jjYqByr3vzpmm7FJFmiCQMpv0+
         zZvj0trql1BDqVb7cDx+UAezqwXSnT8r/4diHIiqDBTRqRD+GY679BpDfHe3rbyy21a1
         y/YiqJ9hybx6vmqKQ6ZxoMB7K91k1Vjspsz4vH4i945Fg9vWcYnXlI7q94MttPi4g/+t
         oVWw==
X-Forwarded-Encrypted: i=1; AJvYcCUKZCxjHN95UtexJf+yxzNvEYfkEIVM70vL6TDm/zMl+ZX9SiRlgZqIA++2tHrFx10fKtbudm48HuzgXUAp@vger.kernel.org, AJvYcCUfbRVHr0DkMy4PLDs2dfMziNewEltB1rxLPM3GDoFn/vNYU28SixYG8cpmz8RnTIpYlP7GUvmHaLVF@vger.kernel.org, AJvYcCXct911qaETLtYt2AGuqbXr0T7TqeQrA2PIrwiXWP+riTP1HgP4brnhbB8opg5KOgxTgBBmlf7qYLAemKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXmBZnle/lsAFmmpxCQxhA2HJtCdrUwPY8AxTgVshdlUOtBAJ3
	py4pA+/xTgrfJZSsi7n7LBILjSNEfr5m6MFcp8k/5Qw1R7uA/bRK
X-Google-Smtp-Source: AGHT+IET1w2zb8wa/Dv5kxxnYAfb7FbTi5pu0cOuW160xg/BNCQjR+F45gQpGfPrWdUzO618hjJtzA==
X-Received: by 2002:a05:6512:3ba5:b0:533:4785:82a0 with SMTP id 2adb3069b0e04-536587a42eemr8414694e87.2.1725969124096;
        Tue, 10 Sep 2024 04:52:04 -0700 (PDT)
Received: from kuzhyl-vm.. (89-64-30-233.dynamic.chello.pl. [89.64.30.233])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f870ce0sm1122963e87.116.2024.09.10.04.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 04:52:03 -0700 (PDT)
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleh Kuzhylnyi <kuzhylol@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	igor.opaniuk@gmail.com,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v6 2/2] input: add driver for Hynitron CST816X touchscreen
Date: Tue, 10 Sep 2024 13:51:58 +0200
Message-Id: <20240910115158.74502-2-kuzhylol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910115158.74502-1-kuzhylol@gmail.com>
References: <20240910115158.74502-1-kuzhylol@gmail.com>
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

Changes in v6:
 - No code changes

Changes in v5:
 - Update commit based on Dmitry's feedback:
 - Make GPIO reset optional
 - Combine declaration and initialization for i2c_xfer
 - Return 0 explicitly where possible
 - Rename rc (return code) to error
 - Make Touch processing call return boolean
 - Improve error handling for i2c_transfer
 - Use get_unaligned_be16 for getting coordinates
 - Move touch event completeness upper to irq callback

Changes in v4:
 - Update commit based on Dmitry's feedback:
 - Move abs_x and abs_y to u16
 - Remove __packed qualifier for touch_info struct
 - Hide tiny touch irq context to stack
 - Extend cst816x_i2c_read_register() with buf and buf_size
 - Remove loop from event lookup

Changes in v3:
 - Drop timer and delayed work
 - Process touch in threaded IRQ context
 - Fix chip reset sequence
 - Move input_register() before devm_request_threaded_irq()
 - Re-arrange and document input reporting
 - Set u16 data type for event_code
 - Remove double tap event to prevent continuous double side sliding

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
 drivers/input/touchscreen/hynitron-cst816x.c | 259 +++++++++++++++++++
 3 files changed, 272 insertions(+)
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
index 000000000000..3886617e6a71
--- /dev/null
+++ b/drivers/input/touchscreen/hynitron-cst816x.c
@@ -0,0 +1,259 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for I2C connected Hynitron CST816X Touchscreen
+ *
+ * Copyright (C) 2024 Oleh Kuzhylnyi <kuzhylol@gmail.com>
+ */
+#include <asm/unaligned.h>
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
+	CST816X_RESERVED = 0xFF,
+};
+
+struct cst816x_touch_info {
+	u8 gesture;
+	u8 touch;
+	u16 abs_x;
+	u16 abs_y;
+};
+
+struct cst816x_priv {
+	struct device *dev;
+	struct i2c_client *client;
+	struct gpio_desc *reset;
+	struct input_dev *input;
+};
+
+struct cst816x_event_mapping {
+	enum cst816x_gestures gesture;
+	u16 code;
+};
+
+static const struct cst816x_event_mapping event_map[16] = {
+	{CST816X_SWIPE_UP, BTN_FORWARD},
+	{CST816X_SWIPE_DOWN, BTN_BACK},
+	{CST816X_SWIPE_LEFT, BTN_LEFT},
+	{CST816X_SWIPE_RIGHT, BTN_RIGHT},
+	{CST816X_SINGLE_TAP, BTN_TOUCH},
+	{CST816X_LONG_PRESS, BTN_TOOL_TRIPLETAP},
+	{CST816X_RESERVED, KEY_RESERVED},
+	{CST816X_RESERVED, KEY_RESERVED},
+	{CST816X_RESERVED, KEY_RESERVED},
+	{CST816X_RESERVED, KEY_RESERVED},
+	{CST816X_RESERVED, KEY_RESERVED},
+	{CST816X_RESERVED, KEY_RESERVED},
+	{CST816X_RESERVED, KEY_RESERVED},
+	{CST816X_RESERVED, KEY_RESERVED},
+	{CST816X_RESERVED, KEY_RESERVED},
+	{CST816X_RESERVED, KEY_RESERVED},
+};
+
+static int cst816x_i2c_read_register(struct cst816x_priv *priv, u8 reg,
+				     void *buf, size_t len)
+{
+	int rc;
+	struct i2c_msg xfer[] = {
+		{
+			.addr = priv->client->addr,
+			.flags = 0,
+			.buf = &reg,
+			.len = sizeof(reg),
+		},
+		{
+			.addr = priv->client->addr,
+			.flags = I2C_M_RD,
+			.buf = buf,
+			.len = len,
+		},
+	};
+
+	rc = i2c_transfer(priv->client->adapter, xfer, ARRAY_SIZE(xfer));
+	if (rc != ARRAY_SIZE(xfer)) {
+		rc = rc < 0 ? rc : -EIO;
+		dev_err(&priv->client->dev, "i2c rx err: %d\n", rc);
+		return rc;
+	}
+
+	return 0;
+}
+
+static bool cst816x_process_touch(struct cst816x_priv *priv,
+				  struct cst816x_touch_info *info)
+{
+	u8 raw[8];
+
+	if (cst816x_i2c_read_register(priv, CST816X_FRAME, raw, sizeof(raw)))
+		return false;
+
+	info->gesture = raw[0];
+	info->touch = raw[1];
+	info->abs_x = get_unaligned_be16(&raw[2]) & GENMASK(11, 0);
+	info->abs_y = get_unaligned_be16(&raw[4]) & GENMASK(11, 0);
+
+	dev_dbg(priv->dev, "x: %d, y: %d, t: %d, g: 0x%x\n", info->abs_x,
+		info->abs_y, info->touch, info->gesture);
+
+	return true;
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
+	for (unsigned int i = 0; i < ARRAY_SIZE(event_map); i++)
+		input_set_capability(priv->input, EV_KEY, event_map[i].code);
+
+	input_set_abs_params(priv->input, ABS_X, 0, 240, 0, 0);
+	input_set_abs_params(priv->input, ABS_Y, 0, 240, 0, 0);
+
+	return input_register_device(priv->input);
+}
+
+static void cst816x_reset(struct cst816x_priv *priv)
+{
+	if (priv->reset) {
+		gpiod_set_value_cansleep(priv->reset, 1);
+		msleep(50);
+		gpiod_set_value_cansleep(priv->reset, 0);
+		msleep(100);
+	}
+}
+
+static void report_gesture_event(const struct cst816x_priv *priv,
+				 enum cst816x_gestures gesture, bool touch)
+{
+	u16 key = event_map[gesture & 0x0F].code;
+
+	if (key != KEY_RESERVED)
+		input_report_key(priv->input, key, touch);
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
+	struct cst816x_priv *priv = cookie;
+	struct cst816x_touch_info info;
+
+	if (!cst816x_process_touch(priv, &info))
+		goto out;
+
+	if (info.touch) {
+		input_report_abs(priv->input, ABS_X, info.abs_x);
+		input_report_abs(priv->input, ABS_Y, info.abs_y);
+		input_report_key(priv->input, BTN_TOUCH, 1);
+	}
+
+	if (info.gesture) {
+		report_gesture_event(priv, info.gesture, info.touch);
+
+		if (!info.touch)
+			input_report_key(priv->input, BTN_TOUCH, 0);
+	}
+
+	input_sync(priv->input);
+
+out:
+	return IRQ_HANDLED;
+}
+
+static int cst816x_probe(struct i2c_client *client)
+{
+	struct cst816x_priv *priv;
+	struct device *dev = &client->dev;
+	int error;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->client = client;
+
+	priv->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->reset))
+		return dev_err_probe(dev, PTR_ERR(priv->reset),
+				     "reset gpio not found\n");
+
+	cst816x_reset(priv);
+
+	error = cst816x_register_input(priv);
+	if (error)
+		return dev_err_probe(dev, error, "input register failed\n");
+
+	error = devm_request_threaded_irq(dev, client->irq, NULL, cst816x_irq_cb,
+				       IRQF_ONESHOT, dev->driver->name, priv);
+	if (error)
+		return dev_err_probe(dev, error, "irq request failed\n");
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


