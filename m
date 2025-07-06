Return-Path: <linux-input+bounces-13395-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 251F4AFA63C
	for <lists+linux-input@lfdr.de>; Sun,  6 Jul 2025 17:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 693C1179359
	for <lists+linux-input@lfdr.de>; Sun,  6 Jul 2025 15:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53BB028850F;
	Sun,  6 Jul 2025 15:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZD6KVCMW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28417188713;
	Sun,  6 Jul 2025 15:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751816681; cv=none; b=Va490y6l4Ule3IebF02legAbrV+fnUGE6BNxWF7euqPgwqjXuPEBKSjr5vqDz8Uj02HxQxiUqdzEck8d0wah0cNR+2QjGea6LLtSxmtH5zX7Oua2sUOEv7pvDYKrgYjvKs5zFUzUR0v5S3rHfN/g4z0vSPpCmhC0qCNdAw6sf14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751816681; c=relaxed/simple;
	bh=OAXSfM1q4mwnjfzOJDcIW29QWaOD3stuJlIiWrp9S5M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=crQYEVjZu9p4yhhc+ip6JEYK50yZFi5WJUMglavcE2KboY9QNkKL5mlObdkKM7kH3r5d0Z7WGhOoAkuNlIrU1QqbWV8b9t0npXOVwDeaS++CyC5TbvlWK/bf3ZuEiYZ7KzgHbSD4d+iowy6eEUbxi+B8nsGNt9LV+cH+OpqZenk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZD6KVCMW; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60c01b983b6so4262820a12.0;
        Sun, 06 Jul 2025 08:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751816676; x=1752421476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KevM39GjWdbzClq+4VKdHzm0cz2Zjh6ii4GaT6doUYI=;
        b=ZD6KVCMWsiEEyMxb4NJIzo6HbWwKvfeK4+fGIA/Al698OeEAf7c+CRk2CfNWVvyeIg
         AS1VRBR0LxEAdkVO8iMm56S6wF/Ro/w6crl3R6JD5Hc4FBLeBo14mHQEhq6nF/BbNk5l
         JJYiQL65rDRqnGHz6uGjzh/5QvL5R9PvJ8tXrPXTJI2nUiu/mZ5o56A8YPh9srDn79H9
         VZb1Af+XTi+2gxA3p/VNYhu08Rz3Y+hB7YXT3EBwsIAWlo1f0JsQVdLgiTlBoqAgi51x
         4lo+zFb72e8wZMxwiWSQ4pSUG4y/GczWM/0a13JY4yIigr2SIWfvHjTozxZ8Cy926q5x
         vbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751816676; x=1752421476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KevM39GjWdbzClq+4VKdHzm0cz2Zjh6ii4GaT6doUYI=;
        b=ckolUcwlgF21nmrbEria/CLpRmXHH/v7rRgAC9XTvnOo4BSt8JSVSOlO/cZVl+pxTZ
         vJQqtuGkyC7M9ih1oKDLJ/bh+WAyRzevLOAaO4g/yehDFJj/RNyfwXI6UUZiDSWXieQy
         4rhJzb0pKA3n+xRCntTtcEh9iiw1aEkdaNqXzHCqHogqWorrUG+hynyIhIDRsB5Ujso5
         HY6Zs+irYud+K7EEyqD4YRIXUEBScuE3hrGXSKYYAM3CHZSe4j8hrN6nWoSylYIXLkVB
         YZ2VcDIoxJdo8g2km2XKtuWAjkyoxuI397oD+c5tJA4YGidFOG+3mZ1R+NtAdpdpgENM
         /RCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdZTMr/INZcGa4Kdc/vsrJQM1G1cnMD9qMBjgn+DQJi32k/PDVewsfq34Q41obZsuMvmLIOe/2q7L83ss=@vger.kernel.org, AJvYcCVp7f8MDJYM1BYrIrVD+D1s3kA5nBqeLNLTlzr9+51Sml/2CLlBYe38e6VRD6/m+EUjk2XusWMoYvADPGCI@vger.kernel.org, AJvYcCXW/2f6IKqJ2+E8UxVZmuN/lynLru7xmr7d+TxJ8QoWebSqFo1XOxTG+Z8pav8yonU8Ue7GGtyinltY@vger.kernel.org
X-Gm-Message-State: AOJu0YxP6l7n8Gvf8qYsSErnxOY4r1IWFq9FCIl9g2lj83QKZ28cayTC
	a6rrbQwgDp3orSOl8QbS1JeNyFndXLol518Furqfu6LcLZLU3KJ8Z/6N
X-Gm-Gg: ASbGnct1JrSvmpnZDd4qlCTbe3GHaUR41TiNJdIPqR4WG2pNiF+f4GklkYuLOgcA6BJ
	zqfS7kHsLMynjItNUCDHAxis1qZ6ztXNPXgfM6BC7xYolpm9fAt1npkzaaOU/1GhQSZydCfOqWP
	RPzkEFTA7+6g9ezGiHOPgpxTKjnooEyYVMEdQ/r2Zm1wFK7gCdkt6rmpcz0nL7rUD0iUBEiity+
	ZkdP/ddhI5rvLosr50uqzB5o9xcyyGP5i4ZvYeUGX/T3Em3XmfjpR2UJvEyPyxsb4w/QZtTh7JM
	l3KoyaQM6/WqRkcRJICpTmHD3H/Qj62k3gDgKBWUr0E3C+RVQ3Fxc7YPUamVBkGLeSh+2pMdvOC
	U0HL8pMwlXruknTfac2mdjMynfnWlLdgRO449tpudtjwBBqX/WKxnrA==
X-Google-Smtp-Source: AGHT+IH+9SYsEs7ZQSVBLWtwv5QWs2k7tSCy5lJU7MN7vSC94plV/GOeincUk0s/JtENYMvuqUUoyA==
X-Received: by 2002:a05:6402:26d4:b0:60c:3ecd:5140 with SMTP id 4fb4d7f45d1cf-60fcc4e7a06mr8016500a12.0.1751816676045;
        Sun, 06 Jul 2025 08:44:36 -0700 (PDT)
Received: from kuzhyl-vm.mshome.net (46.205.205.61.nat.ftth.dynamic.t-mobile.pl. [46.205.205.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb1fb083sm4026953a12.62.2025.07.06.08.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 08:44:35 -0700 (PDT)
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
Subject: [PATCH v9 2/2] input: add hynitron cst816x series
Date: Sun,  6 Jul 2025 17:44:30 +0200
Message-Id: <20250706154430.357948-2-kuzhylol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250706154430.357948-1-kuzhylol@gmail.com>
References: <20250706154430.357948-1-kuzhylol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce support for the Hynitron CST816x series touchscreen controller
used for 240×240 1.28-inch Round LCD Display Module manufactured
by Waveshare Electronics. The driver is designed based on an Arduino
implementation marked as under MIT License. This driver is written
for a particular round display based on the CST816S controller, which
is not compatiable with existing driver for Hynitron controllers.

Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
---
Changes in v9:
 - Do not treat TOUCH as a gesture. Use BTN_TOUCH to indicate active touch slots.
 - Use u16 for coordinate values to align with the expected input types
 - Add cst816x_gest_to_idx() to map gesture ID to keycodes[i] event
 - Simplify input reporting order by reporting coordinates first
 - Reword cst816x_touch's fields: "gesture" to "gest", and "touch" to "active"
 - Rename *desc argument to *tch

Changes in v8:
 - Change driver's name to: Hynitron CST816x Series Touchscreen
 - Simplify DT gesture mapping for better consistency:
 linux,code[0-15]: event_map[gest_id] -> linux,keycodes[0-15]: keycode[gest_id]
 - Treat TOUCH as a user-defined gesture
 - Minor rewords: error/rc to ret, CST816X_FRAME to CST816X_RD_REG

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
 drivers/input/touchscreen/hynitron-cst816x.c | 243 +++++++++++++++++++
 3 files changed, 256 insertions(+)
 create mode 100644 drivers/input/touchscreen/hynitron-cst816x.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 196905162945..8c32aeaf6efa 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -465,6 +465,18 @@ config TOUCHSCREEN_HYNITRON_CSTXXX
 	  To compile this driver as a module, choose M here: the
 	  module will be called hynitron-cstxxx.
 
+config TOUCHSCREEN_HYNITRON_CST816X
+	tristate "Hynitron CST816x series touchscreen"
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
index 000000000000..0de9bb6a6ef5
--- /dev/null
+++ b/drivers/input/touchscreen/hynitron-cst816x.c
@@ -0,0 +1,243 @@
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
+#define CST816X_RD_REG 0x01
+#define CST816X_NUM_KEYS 5
+
+struct cst816x_touch {
+	u8 gest;
+	u8 active;
+	u16 abs_x;
+	u16 abs_y;
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
+static u8 cst816x_gest_idx(u8 gest)
+{
+	u8 index;
+
+	switch (gest) {
+	case 0x01: // Slide up gesture
+	case 0x02: // Slide down gesture
+	case 0x03: // Slide left gesture
+	case 0x04: // Slide right gesture
+		index = gest;
+		break;
+	case 0x0c: // Long press gesture
+	default:
+		index = CST816X_NUM_KEYS;
+		break;
+	}
+
+	return index - 1;
+}
+
+static bool cst816x_process_touch(struct cst816x_priv *priv,
+				  struct cst816x_touch *tch)
+{
+	if (cst816x_i2c_read_register(priv, CST816X_RD_REG, tch, sizeof(*tch)))
+		return false;
+
+	tch->abs_x = get_unaligned_be16(&tch->abs_x) & GENMASK(11, 0);
+	tch->abs_y = get_unaligned_be16(&tch->abs_y) & GENMASK(11, 0);
+
+	dev_dbg(&priv->client->dev, "x: %u, y: %u, t: %u, g: 0x%x\n",
+		tch->abs_x, tch->abs_y, tch->active, tch->gest);
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
+	input_set_capability(priv->input, EV_KEY, BTN_TOUCH);
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
+	struct cst816x_touch tch;
+
+	if (!cst816x_process_touch(priv, &tch))
+		return IRQ_HANDLED;
+
+	input_report_abs(priv->input, ABS_X, tch.abs_x);
+	input_report_abs(priv->input, ABS_Y, tch.abs_y);
+
+	if (tch.gest) {
+		input_report_key(priv->input,
+				 priv->keycode[cst816x_gest_idx(tch.gest)],
+				 tch.active);
+	}
+
+	input_report_key(priv->input, BTN_TOUCH, tch.active);
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


