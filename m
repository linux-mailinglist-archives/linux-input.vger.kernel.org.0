Return-Path: <linux-input+bounces-6299-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5129706E9
	for <lists+linux-input@lfdr.de>; Sun,  8 Sep 2024 13:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 171C41C20B43
	for <lists+linux-input@lfdr.de>; Sun,  8 Sep 2024 11:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0109E1531CA;
	Sun,  8 Sep 2024 11:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAvtz01o"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D168026AC2;
	Sun,  8 Sep 2024 11:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725795049; cv=none; b=ZefC3mZAd7JRrSv+/y4xTPBoGznI+sAARnrkLSl/E+X5RFtf2gjZsJ0JbriozX24UGNaHGWz0nV0w7dZU8QZ9HAEuE60MwWSb33TXehRLFHKjvX9+/TgtUTjXy70sWTPF1a8vWxdA6gzSNcc3RuAmE2cyFGDC/8e8C9YU47uDjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725795049; c=relaxed/simple;
	bh=4mrK3V0qn43GteR73aNI4i3OwmaghQKA05Nb30C6z3k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UIlUbkuv4Hj+oIVkp8rM5RyJRe58dLW4l59+cDM20kTe98zgr1tra2ZZiXSP9lDgw/+Y0Fw4GK6cnkPXHViHNBCAITZ7+x8q5CWiAJO71NTLEev7dSBdzeSadKylpaR4unUekwZuvzkHGp9IIK8t4TjTSxiJqnkFH8j5YlMrVLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAvtz01o; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53661a131b4so915528e87.1;
        Sun, 08 Sep 2024 04:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725795046; x=1726399846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdGZi+C/4BPCMItsyTdB+YpIU5ZBIXWHwvmweQBm0UY=;
        b=QAvtz01oSM2j11gdRbZV6tY2MIsSHRXGOUHjVsdzcVfIr4CIZSR+haQBpb/8GYpJsj
         M/wuH3H7DBnEF5KMhaq4u18Z/D88AvfFegTpkuNi9QP6gWsMF6/Gn9ArYX48F4Bt/x0Z
         gg+URgXlzwfnXSt3vzxkfDxKJRgeL3XSj+zUXlnG14jAhJEkLzwiUBz88/g3wRbd6qKL
         aHFoiRw7/Jl6ppW5wfcMMmlmyA4+a8BNTZTi28GRPnSORmi/gdPIRAiHiQz636OfOMdI
         FIHCfO3Jm8pDY9QNqyoLtf7e5iXxZpPFCqvwBKZc/vIfoeYbBi6K5rEF8IbKD/LUfYLB
         yQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725795046; x=1726399846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdGZi+C/4BPCMItsyTdB+YpIU5ZBIXWHwvmweQBm0UY=;
        b=MGzlvId8z/i/vRHWam3VkLKQ63Xu/qCjMj9FMkFvzDCHcWNeUEfiweIdzsqV3yAj8a
         mn5LYyal3doLFns4psM7UMc06eLnnrgsfOY588+zopTKKj3y6WesVYTWYy4Y3krD/7vf
         fSd+9sRIOt3bCRiK1I0MKpqYxlPc1qG1W2IpIzqheCp+SnWIVznGDw0KPlrR+lhHN1Td
         zkdL6yVwxve5z5EN5p//YXubVc4dmNLZkh6+ksUiCwAXJnD6l/3+xOnYLxt47b/3CdRJ
         pWpiqptw/4VJI/7P1xNlnwOhepaqj7/ozoWPcKQLRY+311h21BumcIv6tADjwjUvAynB
         nEGw==
X-Forwarded-Encrypted: i=1; AJvYcCUs9w6QoVtTK+acHzzxweWAPpMp0e2pHT61FvG4wK8xQS2XqQHgp9JV5a+x/wheMlkxtt+ADsqd7Z/e1byb@vger.kernel.org, AJvYcCVv6WWU+FmLFsrffBJ0rdN1ky39yVgGQM8i5TBtLxK96yanxwDDhNw+qanfIN6O+dP26Vm0OpGWsh/NgkU=@vger.kernel.org, AJvYcCWIcxHttMmT8cT2FWF3hy/tvj7UlMZkCTEd1txgvi2/dJ+S7wucAtqpIxX0ss0E2IL2N83s4VlBGSBp@vger.kernel.org
X-Gm-Message-State: AOJu0YyI4O410CrroWlEM63uCIxD2ocNYqIbRshEgPKGf7Dh/BVSKwqa
	VxqI4rW8eFSfrcet8weNxzgR9xR3Ud8lMDR+RX+IH4KCv4Wc0IQt
X-Google-Smtp-Source: AGHT+IF5C1HiE0cE2YtlcF/k1+toXI/TlS+KXrLqMxpJ3QIJukiqcwCaHeEZ6VAlZEBncI2M8VQU/g==
X-Received: by 2002:a05:6512:3ca6:b0:536:55a8:6f78 with SMTP id 2adb3069b0e04-536587b032amr5382482e87.17.1725795044899;
        Sun, 08 Sep 2024 04:30:44 -0700 (PDT)
Received: from kuzhyl-vm.. (89-64-30-233.dynamic.chello.pl. [89.64.30.233])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f903fccsm386929e87.235.2024.09.08.04.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 04:30:44 -0700 (PDT)
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
Subject: [PATCH v5 2/2] input: add driver for Hynitron CST816X touchscreen
Date: Sun,  8 Sep 2024 13:30:27 +0200
Message-Id: <20240908113027.69471-2-kuzhylol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240908113027.69471-1-kuzhylol@gmail.com>
References: <20240908113027.69471-1-kuzhylol@gmail.com>
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


