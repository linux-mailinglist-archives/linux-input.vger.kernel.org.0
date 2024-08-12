Return-Path: <linux-input+bounces-5531-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7799D94FA38
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 01:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDEBEB215EF
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 23:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5E519AA56;
	Mon, 12 Aug 2024 23:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHJDxtcr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0DF175D59;
	Mon, 12 Aug 2024 23:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723504993; cv=none; b=iH76s0S9D0/0QKby3t5KAaIs9obwSz9U3H28BL1dI8AOStfe9V7VplvlW53ghfmGl/o8lm8nlAxwvmXlawPtkuqE4rsm57cO9gbm+OeHkZVywE7LjKYGTwsZHe0LPL35UXWOltPSRUt+VmYCyJ/SbWuZsXBX5Uq/TnA7izQVb10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723504993; c=relaxed/simple;
	bh=ufNczk7mvm4Xeh1QV9XQiocP3RZBSWQXVbdXvMtSlW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MzMh1pdFAYnYtW17bIlXi8gDvziUW1MtAsaFhGJzapyaQsSFTxoEQilBRbJ35afJOU9xMDSGBlv5ClaQVX901F0zWdl8XagWcz0n4O23DresUwvf+m/hGWdGH5ejgBviiTleQTNAPVyLYe+J9SqLfcGSlzCqACMAFIcB9moyUMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHJDxtcr; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f01ec08d6so6722759e87.2;
        Mon, 12 Aug 2024 16:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723504989; x=1724109789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsJ9DiPIOTtwfDuQ/gAwnuPZp+awCW9269FRmFv+nUU=;
        b=kHJDxtcrjbgG2ai+iISPMJD6IWWErsyhUPe1rQLCYsIteHbxgtIvBFGIR6s7OedS/n
         C76whm+UCT/BoNV5ozYQJ2dfETskHuRXyJptO8iMbl+mOiK7boBHR2XHJkYD+7OcK3vi
         /Z5yHehOnqtoiQ1RoKz+M+ZlvNkPfTOCyvGVUwy5W+4aAKnJ2nIOPTDRqHYGfT+7done
         Qm05gNYoiAK6n9Fefb1qJRn/SYAyo6GeA1r2ffFWsnueGm+ukZCt3Td8uPMi41vUNGyo
         +tZeVs/Jq5Jycr6RhpTy0TR/RwdZ/PPE3MVHnBLOd+dQ6FHTsW8M/l/wIN8ZuhNcuDGe
         k6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723504989; x=1724109789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsJ9DiPIOTtwfDuQ/gAwnuPZp+awCW9269FRmFv+nUU=;
        b=Ekx6uELAI+DLUfObsa1Bc27y4fdoGHBBHpVm8Evlk9xb80T43WAEIljlLOMoofy6xC
         SVMHuXiu90TxXnNQ3NsvlX1y279DlQk1WYk0b9y/99mRKHC7oPiu3PuJom4BK6+2k9eN
         UriucDghHSA240hobn9cUvyTrFnV+jllkjN69gwfYxMONGxm9LrssqpvqjZ5mg/5g7CP
         8EX9xLl0yl+daDajiT4ZuCbkWnugV/mX/f3EO7jBETPdTwK/oYssrkVlavXQg+JWDCPT
         gxhuGFwG2tPvxBwwbxZfN2mCZCaJcO7R5s/zCJZWK70yx9jEF/XLebGUQmFQOhgCRR3L
         GiqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4GkNNLQ7IMfpVZ1Ca8HWQunktXiJ1ajaoTCNoZE2552oC5w1E3UP8BOBoch67StyKbkT83GC1VNTCuNjP9FSU7It/R82gVwKD3Qeyp58PFQOZMMu4xd+y570r1at60jmqSzxIm1qD9Q==
X-Gm-Message-State: AOJu0YyGEkBZJ4ROYb8NykM2BBxeccstIEH/8fLITsHdEfDULYMGiI7v
	dCFOEpM0j80aoSF+2gMI8Ao5R+oPRXDnqeM/gC/sWFjnD5PM9td/mbjMaNA4
X-Google-Smtp-Source: AGHT+IHYlUSMseWKZwSLYYffYoXsSxbXyLfCt0sMq78pce04Wxs2hX2OpjI7g4y9bhma7ZL/KODw3w==
X-Received: by 2002:ac2:4c4d:0:b0:52e:fdeb:9381 with SMTP id 2adb3069b0e04-53213680faamr1157839e87.43.1723504989215;
        Mon, 12 Aug 2024 16:23:09 -0700 (PDT)
Received: from [127.0.1.1] (89-64-30-233.dynamic.chello.pl. [89.64.30.233])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200f1aaddsm869265e87.182.2024.08.12.16.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 16:23:08 -0700 (PDT)
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
Date: Tue, 13 Aug 2024 01:22:40 +0200
Subject: [PATCH 2/2] input: add driver for Hynitron CST816X touchscreen
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240813-b4-cst816s-b4-v1-2-78a03cbef328@gmail.com>
References: <20240813-b4-cst816s-b4-v1-0-78a03cbef328@gmail.com>
In-Reply-To: <20240813-b4-cst816s-b4-v1-0-78a03cbef328@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, igor.opaniuk@gmail.com, 
 Oleh Kuzhylnyi <kuzhylol@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723504986; l=9435;
 i=kuzhylol@gmail.com; s=20240813; h=from:subject:message-id;
 bh=ufNczk7mvm4Xeh1QV9XQiocP3RZBSWQXVbdXvMtSlW0=;
 b=zK6aNmIroSIDuCW+HP5IDEsZrpB9BoaC8BoKBIZ9SX5bMW82axdvmq1+MfNIfuMcWRYjn1GKB
 d9higUrE70VCZfOg0VXLi1p8cB0wYxJHdaXTWfxV7IvIx7IeVLFSDYM
X-Developer-Key: i=kuzhylol@gmail.com; a=ed25519;
 pk=/eJ3W7RpmVR/qw4I/gsAD36uT8x/VUHRj7nyehKlG2s=

Introduce support for the Hynitron CST816X touchscreen controller
used for 240×240 1.28-inch Round LCD Display Module manufactured
by Waveshare Electronics. The driver is designed based on an Arduino
implementation marked as under MIT License. This driver is written
for a particular round display based on the CST816S controller, which
is not compatiable with existing driver for Hynitron controllers.

Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
---
 drivers/input/touchscreen/Kconfig            |  12 ++
 drivers/input/touchscreen/Makefile           |   1 +
 drivers/input/touchscreen/hynitron-cst816x.c | 258 +++++++++++++++++++++++++++
 3 files changed, 271 insertions(+)

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
index 000000000000..8e2587727e1c
--- /dev/null
+++ b/drivers/input/touchscreen/hynitron-cst816x.c
@@ -0,0 +1,258 @@
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
+	struct i2c_client *client;
+	struct i2c_msg xfer[2];
+	int rc;
+
+	client = priv->client;
+
+	xfer[0].addr = client->addr;
+	xfer[0].flags = 0;
+	xfer[0].buf = &reg;
+	xfer[0].len = sizeof(reg);
+
+	xfer[1].addr = client->addr;
+	xfer[1].flags = I2C_M_RD;
+	xfer[1].buf = buf;
+	xfer[1].len = len;
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
+static int cst816x_process_touch(struct cst816x_priv *priv,
+				 struct cst816x_touch_info *info)
+{
+	u8 raw[8];
+	int rc;
+
+	rc = cst816x_i2c_read_register(priv, CST816X_FRAME, raw, sizeof(raw));
+	if (!rc) {
+		info->gesture = raw[0];
+		info->touch = raw[1];
+		info->abs_x = ((raw[2] & 0x0F) << 8) | raw[3];
+		info->abs_y = ((raw[4] & 0x0F) << 8) | raw[5];
+
+		dev_dbg(priv->dev, "x: %d, y: %d, t: %d, g: 0x%x\n",
+			info->abs_x, info->abs_y, info->touch, info->gesture);
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
+	gpiod_set_value_cansleep(priv->reset, 1);
+	msleep(50);
+	gpiod_set_value_cansleep(priv->reset, 0);
+	msleep(100);
+}
+
+static void report_gesture_event(const struct cst816x_priv *priv,
+				 enum cst816x_gestures gesture, bool touch)
+{
+	u16 key = event_map[gesture & 0x0F].code;
+
+	if (key != KEY_RESERVED)
+		input_report_key(priv->input, key, touch);
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
+	struct cst816x_touch_info info;
+
+	if (!cst816x_process_touch(priv, &info)) {
+		if (info.touch) {
+			input_report_abs(priv->input, ABS_X, info.abs_x);
+			input_report_abs(priv->input, ABS_Y, info.abs_y);
+			input_report_key(priv->input, BTN_TOUCH, 1);
+		}
+
+		if (info.gesture)
+			report_gesture_event(priv, info.gesture, info.touch);
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
2.30.2


