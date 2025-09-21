Return-Path: <linux-input+bounces-14950-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B47FB8DB7F
	for <lists+linux-input@lfdr.de>; Sun, 21 Sep 2025 15:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C06B617ED89
	for <lists+linux-input@lfdr.de>; Sun, 21 Sep 2025 13:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C4D2D1F4A;
	Sun, 21 Sep 2025 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtTzTLt0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829B82D1F42
	for <linux-input@vger.kernel.org>; Sun, 21 Sep 2025 12:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758459592; cv=none; b=a+Y+lk0Vqojbet7cSHZa1cmdT8asW+HLF9BRieQfniY3eDc5F4d3XFmAO2/aTRMG/j3BAJwlFjLe9znZOAGt8BugCBrRh3fM9pwyCnggSTpu10gkiHNQdC9o0656fS2QbmvrfBkmq+xjk8QDqglh3jd/Re8NVf5R57y/oD2wv5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758459592; c=relaxed/simple;
	bh=zcETlVdwlcZbH4DanD1CiaW+udIX7G5IS3EuHYneSeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tDdwB5S5mogtwdjozEGzlVow2p8BkPRHf6Dl+AKgp9z0h5+FeiPmMndh7PI2essF/vW23c60XGVSIcZ8yaal4kSV0SnbY2FIfQjjF2bPHCIjp/ESfu0AEpokJUnboAMTgHOPFVFDV77DWEbYL0332vzFBohenAqwdDOAB9hQV9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtTzTLt0; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-33730e1cda7so29329251fa.3
        for <linux-input@vger.kernel.org>; Sun, 21 Sep 2025 05:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758459589; x=1759064389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fR/1kJxKeUKx7FmwyB/81vUVhWRf6V9IEJEdkuhYPeI=;
        b=jtTzTLt0sBrazHVzFe/egdaXbqsexJpn21NcbvmqGbhX6h0I30NwXjACsMaSp2Lt8m
         PHf1ejLUidpwggiCgGUuCpgG0rXNaDflhg1J1HHlQW6W5DyyIwv4XhVXgmSaA75BCD7D
         yXUKQvkyv7ZCSa4Q9tBTWzCkU6ytj9/7j2r62ZKs2QaOgL4Ci0Ozv/LGbt2YkZIoi5tk
         RlO3wb6GawBCH1be625hkrEws79Spo7xm2bPot7biJgYjCBJLfMXNZRHfIbOmPGBpLgG
         gaK9sspN6tvysOcG6Tc5PNZIVh5B/odFYVCpwMP0wI5mtHsgmtb35SBUEyI4JYww8Dxj
         oA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758459589; x=1759064389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fR/1kJxKeUKx7FmwyB/81vUVhWRf6V9IEJEdkuhYPeI=;
        b=so4/P3z4ovKZhpEkwyXF53fSH4fWcZ5W30ovnEPpU05HAg174kUbviul1ys2ReHIAK
         Sb/XfXhA05ZZILuU+5igdboMx63SfKjvHy8hNMGBFknaxeSRf6HCIYX/57eyoj9huMpx
         wegklvoAnOcq7cEg19Jjy7Ir5NJ2VaXymjsRj/Lxb1vMd6fkPRZ/g2a4h3KHbGdfKZ/B
         oLhs4cDthdqJDEgsjHk/EbdjePp6vieQRTUXG6jTpcKFva45QPIlamrIOnlzvVqOEaW6
         u3KOF4tqzHcEXmDGxni0p2Z/XRlQoiqcZFFihbfXL+35YC4cu7PK46P8g//4QwCJuUrZ
         8EoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx4uBM9iIQdWPwd58Ig3O12nOaGrw4/Xt/oL8NY0y1POHdUtc9bdhEgqE47bOKYZOA2hLmHAiL1YZIeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWkuWTwbXztu1uSGOF3YX1L/DAJhWUJuiuCNzZEsgcF6P+uDnP
	vpo4bWwMotQbUHfeQGpFVakbJA9smwfP0yzOhKETkur9ZxtOYgo2Zsrz
X-Gm-Gg: ASbGncv/CEBWA5TcUvlsf4wNJldaii/m8UjJloipH2gwzCnlQTu6+OXyH9PYXVk5huJ
	awQREtAXq0W/R3iZTztWxlHFs8ntrtSoeaTAxj+fY+e5K/JdILuMurs+UWoCZyCCSEMQobgg3Kp
	0CW/keV9Zukv6J5UBb3c5lvCR7VICM+g7RTW+cukuVSwtjnAqDwpGPlpIquqnpWz4XfrMrPa3oq
	FPYUGh44ZDULx+MKRcQ4dVd8i/JKYytB9xHjs5OhdgujtXYNxjZHtobYKknr/avszDOcS64sx7f
	YaS5Y3GjbYmKDg2MPe9hjVDDWkd0F68jEA+2ud1AZuMkEAWMNeDE1fCfxSHirvN0XJLyFh4XNXz
	zo0o7R5TsGPBAgMYIC0WBRKNWX2+J+e2xOtIFmVNQpZpdFvtW0zadDaRpFUhoNc/Ql9DkxU25TQ
	==
X-Google-Smtp-Source: AGHT+IEBhkNS23QlXaxjDNY1Ilm9lDb3R6x4eEgb80h8JMbwoJZTM9X1IrmKg+FCQRWY6QdKVXVVcQ==
X-Received: by 2002:a05:651c:23d3:10b0:336:6c93:9726 with SMTP id 38308e7fff4ca-364148b4276mr25395991fa.4.1758459588312;
        Sun, 21 Sep 2025 05:59:48 -0700 (PDT)
Received: from kuzhyl-vm.home (46.205.205.154.nat.ftth.dynamic.t-mobile.pl. [46.205.205.154])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a1e079e7sm22297751fa.13.2025.09.21.05.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 05:59:47 -0700 (PDT)
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Janne Grunau <j@jannau.net>,
	Sven Peter <sven@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	Oleh Kuzhylnyi <kuzhylol@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 2/2] input: add hynitron cst816x series
Date: Sun, 21 Sep 2025 14:59:39 +0200
Message-ID: <20250921125939.249788-2-kuzhylol@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250921125939.249788-1-kuzhylol@gmail.com>
References: <20250921125939.249788-1-kuzhylol@gmail.com>
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
Changes in v10:
 - In Kconfig help text, remove word "series" to align with other
   touchscreen drivers

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
index 196905162945..b96d763673e6 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -465,6 +465,18 @@ config TOUCHSCREEN_HYNITRON_CSTXXX
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
2.43.0


