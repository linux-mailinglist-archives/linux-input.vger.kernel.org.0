Return-Path: <linux-input+bounces-13168-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD06AECEA4
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 18:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42DAC3B484C
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 16:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CD02185AA;
	Sun, 29 Jun 2025 16:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBUI2Wrk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEE65227;
	Sun, 29 Jun 2025 16:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751214350; cv=none; b=hJHGNlJeUFj7DOqkmNMgrsZgR843n492lACSoUb8ixWxOzhPphle+RpUh8kW+ktjsfa1zA0Lvyf6J82iu4PJggxXRwi5gY0X6NJYeI/1Bvy4eBHUZR4bnQoKTRaEJnGbabo3WLLxTanDBpQPzMLme8PoW38X2pGKi2Oaa+pr/Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751214350; c=relaxed/simple;
	bh=SrSe9e0bsBaJ2h9UWyduJX6jK+k1cZMYKZRU6xgg1ZI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hwfMPsqyIsvNO1VJbLCJwR5qRuTnELOl0el8jKfpnECmeUCw605eOy4CBMB/a2Tv0eD/xEHvwm2oYuPppFAXtYq++SmHe04iO1uBp1y/kTVBL/39/D7a7DdDRTBeK3Ie+UMAdSpiXwPZfNibBQqg9kWgqU2llRB9ocuxPrvAyQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBUI2Wrk; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad574992fcaso225770566b.1;
        Sun, 29 Jun 2025 09:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751214347; x=1751819147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lAkGVH1R9GLCnlY2/YPVJU4tofp3VsaKPYrX5XErbI=;
        b=IBUI2WrkxD//d1rMZmaJA38ZZLzhkmX8QBhA3/KJAWlqaEGPQbnZscrA6IJ3oTus2G
         eYB8ZENmXp676h1P9t1WuQMsWt8QNCNTNooVw5QOnxH13DHOu3ihEujVrq+ce3gt+uxm
         IWSvlr3tpKW4mTywx9ztX1vxttt3Myma7BK7H1E74DHUf4V5GS0/qT4HITyhM/s+wLUH
         jtCDrchTvfllstFPTes3GiQ5TYSlAMGCJ4EknjNDFpZF6o+A0VvjWMphNhWIudPSVIV2
         rFWw/nP1uGZkifb2bFO1jZobcEnPVV7Y29oMUoPqCHpWhc9ES+Tw6Ck4Rql5Dz2XyQ9L
         PUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751214347; x=1751819147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lAkGVH1R9GLCnlY2/YPVJU4tofp3VsaKPYrX5XErbI=;
        b=YZWGEZEbtEsTOasJQBqhLJh+LVWzIr3Pa8xUzfNS5BVtSqAxVrMOiirbWRb3B3WeAP
         G55HmC0GI4cQY1WVwn/AMmBK8the8CL917wsEP/Ubai8BExNoKU28k+bB3srIANu6wH0
         Ftd0xFH1si6HtkZSBRJxZBrQsH8Cjz8QjX4WHk5fO7AgLZk24dLZzAo9S13c8NX4p0Ep
         WTrwvR/LH+VrS1LVuxD9uOeiDwX+dDAinjEt3OuJke2L0366Vs6XMHsDpl5PosPFw5P9
         0RMUQ+EshLk/Qbl5abD9/qAV8A2gDwDC7ldKKVet0AUDSpEbS1qk+ro9UK8MrDAfSxsz
         DDKg==
X-Forwarded-Encrypted: i=1; AJvYcCUW6/bvlEUtJ3iaMPlXki6u0ij32dfVKAIu149v8D1PVG5ONNQ/m5jDt0jvLLDWUM+x4AXdBrOydE72WUk=@vger.kernel.org, AJvYcCVklUxJN2Eul0tUN+xC69eEour3SgxEI7ykApY+MsTrOovNawbZNfqDtxwBMku8a0fs+uzrROcQVLal@vger.kernel.org, AJvYcCXY4lbkQdaAPWFMySGxi/j/Mwt2U5TiETyv8idvlPi6N9BhzQkCurCSJhGW5whXP6JRANLVgDGcHsXXdE8m@vger.kernel.org
X-Gm-Message-State: AOJu0YyQPo6HRphHtWiBlxvPT51tRhYgz/o29J2bGnZNoAnA2Vq263JT
	15VH+V5f4wSj/5nJzKBzr/eg2kLIEEUBIlgzNKADoIe+iZBtqukUulmrljXk7w5x
X-Gm-Gg: ASbGncsnxjwfa1KqfsWReXhTMKJTohTML9JNB1wRcch31CX6AEQDPoUDd/gk2HwJf1v
	+UfNj4RnLjF8viVAeAsu+aYXCp2sttMy7Iyj17oOYO29nR0FEI/DPjzHCZ/HlZPI5ZCxBsS3XRX
	Rn5kqFy+WEUHCrN4VaFs5XSvM2buo4lw2LeI+SlWPkzN4t9drFHkL+A0xk45v7gjSRJ3JTvNwHc
	GrfTs5Fx1tJRXTUVNex4uSqSksXRW93S2KgLS0cVMAOjAF94LwBeXcb3/NkaIv0x6uhEVf8i/5L
	DNVbQUKeUmD81LY7TePn7ov2a9dqzeOT3T7fk6L7gvhkac0cMsYx0zo+Ac21BROaTLgnTjUbbmg
	eb6zWp3ejL4RHjStQ4HGxr9y6iUrMB+6dQwI=
X-Google-Smtp-Source: AGHT+IF8J327rBM/wOFGsJEncMGqnKp2cBFCdlm9z35kEHPgH/l/6MU2q0IFrCnFuHYx5lg9/1cH6Q==
X-Received: by 2002:a17:907:3d0c:b0:ade:3bec:ea30 with SMTP id a640c23a62f3a-ae34fd18410mr866119166b.1.1751214346830;
        Sun, 29 Jun 2025 09:25:46 -0700 (PDT)
Received: from kuzhyl-vm.home (46.205.205.61.nat.ftth.dynamic.t-mobile.pl. [46.205.205.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a02csm514505466b.70.2025.06.29.09.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 09:25:46 -0700 (PDT)
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Janne Grunau <j@jannau.net>,
	Igor Opaniuk <igor.opaniuk@gmail.com>,
	Neal Gompa <neal@gompa.dev>,
	Jeff LaBundy <jeff@labundy.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Oleh Kuzhylnyi <kuzhylol@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/2] input: add hynitron cst816x series touchscreen
Date: Sun, 29 Jun 2025 18:25:23 +0200
Message-Id: <20250629162523.291887-2-kuzhylol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250629162523.291887-1-kuzhylol@gmail.com>
References: <20250629162523.291887-1-kuzhylol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce support for the Hynitron CST816X series touchscreen controller
used for 240×240 1.28-inch Round LCD Display Module manufactured
by Waveshare Electronics. The driver is designed based on an Arduino
implementation marked as under MIT License. This driver is written
for a particular round display based on the CST816S controller, which
is not compatiable with existing driver for Hynitron controllers.

Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
---
Changes in v8:
 - Add array of Linux input event codes to map gestures in DT bindings
 - Reword function names and error messages
 - Wrap coordinates reporting between touch press and release
 - Minor reword in Kconfig

Changes in v7:
 - Update commit based on Jeffs's feedback:
 - Move event_map table to Device Tree
 - Implement DT parsing functionality
 - Use "int" type for iterators
 - Get rid of "*dev" entry from private struct
 - Use touch_info directly as a buffer for I2C
 - Fix coding style tweaks

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
 drivers/input/touchscreen/hynitron-cst816x.c | 227 +++++++++++++++++++
 3 files changed, 240 insertions(+)
 create mode 100644 drivers/input/touchscreen/hynitron-cst816x.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 91a2b584dab1..c2c115804c92 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -466,6 +466,18 @@ config TOUCHSCREEN_HYNITRON_CSTXXX
 	  To compile this driver as a module, choose M here: the
 	  module will be called hynitron-cstxxx.
 
+config TOUCHSCREEN_HYNITRON_CST816X
+	tristate "Hynitron CST816x touchscreen"
+	depends on I2C
+	help
+	  Say Y here if you have a touchscreen using a Hynitron
+	  CST816x series touchscreen controller.
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
index 97a025c6a377..6805ab60f016 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -50,6 +50,7 @@ obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_I2C)	+= goodix_berlin_i2c.o
 obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_SPI)	+= goodix_berlin_spi.o
 obj-$(CONFIG_TOUCHSCREEN_HIDEEP)	+= hideep.o
 obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX)	+= hynitron_cstxxx.o
+obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CST816X)	+= hynitron-cst816x.o
 obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
 obj-$(CONFIG_TOUCHSCREEN_ILITEK)	+= ilitek_ts_i2c.o
 obj-$(CONFIG_TOUCHSCREEN_IMAGIS)	+= imagis.o
diff --git a/drivers/input/touchscreen/hynitron-cst816x.c b/drivers/input/touchscreen/hynitron-cst816x.c
new file mode 100644
index 000000000000..e7a235a2b25d
--- /dev/null
+++ b/drivers/input/touchscreen/hynitron-cst816x.c
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for I2C connected Hynitron CST816x Series Touchscreen
+ *
+ * Copyright (C) 2025 Oleh Kuzhylnyi <kuzhylol@gmail.com>
+ */
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/unaligned.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+
+#define CST816X_NUM_KEYS 16
+#define CST816X_RD_REG 0x01
+#define CST816X_TOUCH 0x00
+
+struct cst816x_touch_desc {
+	u8 gesture;
+	u8 touch;
+	__be16 abs_x;
+	__be16 abs_y;
+} __packed;
+
+struct cst816x_priv {
+	struct i2c_client *client;
+	struct gpio_desc *reset;
+	struct input_dev *input;
+	unsigned int keycode[CST816X_NUM_KEYS];
+	unsigned int keycodemax;
+};
+
+static int cst816x_parse_keycodes(struct device *dev, struct cst816x_priv *priv)
+{
+	int ret;
+
+	if (device_property_present(dev, "linux,keycodes")) {
+		ret = device_property_count_u32(dev, "linux,keycodes");
+		if (ret < 0) {
+			dev_err(dev, "failed to count keys: %d\n", ret);
+			return ret;
+		} else if (ret > ARRAY_SIZE(priv->keycode)) {
+			dev_err(dev, "too many keys defined: %d\n", ret);
+			return -EINVAL;
+		}
+		priv->keycodemax = ret;
+
+		ret = device_property_read_u32_array(dev, "linux,keycodes",
+						     priv->keycode,
+						     priv->keycodemax);
+		if (ret) {
+			dev_err(dev, "failed to read keycodes: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int cst816x_i2c_read_register(struct cst816x_priv *priv, u8 reg,
+				     void *buf, size_t len)
+{
+	int ret;
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
+	ret = i2c_transfer(priv->client->adapter, xfer, ARRAY_SIZE(xfer));
+	if (ret != ARRAY_SIZE(xfer)) {
+		ret = ret < 0 ? ret : -EIO;
+		dev_err(&priv->client->dev, "i2c rx err: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static bool cst816x_process_touch(struct cst816x_priv *priv,
+				  struct cst816x_touch_desc *desc)
+{
+	if (cst816x_i2c_read_register(priv, CST816X_RD_REG, desc, sizeof(*desc)))
+		return false;
+
+	desc->abs_x = get_unaligned_be16(&desc->abs_x) & GENMASK(11, 0);
+	desc->abs_y = get_unaligned_be16(&desc->abs_y) & GENMASK(11, 0);
+
+	dev_dbg(&priv->client->dev, "x: %u, y: %u, t: %u, g: 0x%x\n",
+		desc->abs_x, desc->abs_y, desc->touch, desc->gesture);
+
+	return true;
+}
+
+static int cst816x_register_input(struct cst816x_priv *priv)
+{
+	priv->input = devm_input_allocate_device(&priv->client->dev);
+	if (!priv->input)
+		return -ENOMEM;
+
+	priv->input->name = "Hynitron CST816x Series Touchscreen";
+	priv->input->phys = "input/ts";
+	priv->input->id.bustype = BUS_I2C;
+	input_set_drvdata(priv->input, priv);
+
+	input_set_abs_params(priv->input, ABS_X, 0, 240, 0, 0);
+	input_set_abs_params(priv->input, ABS_Y, 0, 240, 0, 0);
+
+	for (int i = 0; i < priv->keycodemax; i++) {
+		if (priv->keycode[i] == KEY_RESERVED)
+			continue;
+
+		input_set_capability(priv->input, EV_KEY, priv->keycode[i]);
+	}
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
+static irqreturn_t cst816x_irq_cb(int irq, void *cookie)
+{
+	struct cst816x_priv *priv = cookie;
+	struct cst816x_touch_desc desc;
+
+	if (!cst816x_process_touch(priv, &desc))
+		return IRQ_HANDLED;
+
+	if (desc.touch) {
+		input_report_key(priv->input, priv->keycode[CST816X_TOUCH], 1);
+		input_report_abs(priv->input, ABS_X, desc.abs_x);
+		input_report_abs(priv->input, ABS_Y, desc.abs_y);
+	}
+
+	if (desc.gesture) {
+		input_report_key(priv->input, priv->keycode[desc.gesture & 0x0F],
+				 desc.touch);
+
+		if (!desc.touch)
+			input_report_key(priv->input,
+					 priv->keycode[CST816X_TOUCH], 0);
+	}
+
+	input_sync(priv->input);
+
+	return IRQ_HANDLED;
+}
+
+static int cst816x_probe(struct i2c_client *client)
+{
+	struct cst816x_priv *priv;
+	struct device *dev = &client->dev;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client = client;
+
+	priv->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->reset))
+		return dev_err_probe(dev, PTR_ERR(priv->reset),
+				     "gpio reset request failed\n");
+
+	if (priv->reset)
+		cst816x_reset(priv);
+
+	ret = cst816x_parse_keycodes(dev, priv);
+	if (ret)
+		dev_warn(dev, "no gestures found in dt\n");
+
+	ret = cst816x_register_input(priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "input register failed\n");
+
+	ret = devm_request_threaded_irq(dev, client->irq, NULL, cst816x_irq_cb,
+					IRQF_ONESHOT, dev->driver->name, priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "irq request failed\n");
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
+MODULE_DESCRIPTION("Hynitron CST816x Series Touchscreen Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


