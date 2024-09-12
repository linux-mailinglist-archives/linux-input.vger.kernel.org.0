Return-Path: <linux-input+bounces-6440-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 650BC976A91
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2024 15:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 892D01C2155E
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2024 13:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8432B1AD262;
	Thu, 12 Sep 2024 13:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4pLhrVs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734911AB6FA;
	Thu, 12 Sep 2024 13:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726147720; cv=none; b=s93vDlMobjltMWSdHM6DBcvmZksAiO4teuqDSgGv/vv5Cd3BOQ0lBg7hPtKLm1O0jg7tkyMlBZHS06iebrrL8P1ZR+/EpXHn7O6rf9/I6lyz4BYIDrLy6EThDPx+AxZhabmTJ9cCXf9cp8bKKy3pzsIKNv1qWje82oCHKHPswGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726147720; c=relaxed/simple;
	bh=nlKcZR1vCYZsv21P1YcuJgZIUUgaz6ClBODMzA7trpY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lSqatcozHkbKkzP1u2lsfQeuxNwuc28mkHyFv6A2qjU9ri/a8Xue2Y8d/hO5mppcIeO4py9Cmf/lpjjbe29hh7i19Bz+zi62cUVlda6hWbba9kqKtVTWKeAlFooD/DS3XOa63Y72+WRxp1ZnnGgGTFRYX32Dq+ypE4w6Sa4VJaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4pLhrVs; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8d4093722bso130814166b.0;
        Thu, 12 Sep 2024 06:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726147717; x=1726752517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBPW887Enb6qxy0k7AJqACo6iO/mio8ItdP+Pf5Uvew=;
        b=c4pLhrVseq/vpmgAqfyWNCD864CoGRl21Dl17tQe7DGaW6wibmxZYHn4m3LLBZ/xTO
         4oZ7AXB8Kwv8zYcu8TobtlAgci/h01wZ9GT+c7PeNfejoy9D3ZcMFpBcr62dkRVUaODr
         9UJvNDOjIPsvgvDReV9yuokw4hIxkxMwvDIRAEX1yAkK3H/DJQjpQxGsnInO8enG8vxX
         Ftxt0IGfx6OMtjZK4QZK2DlDKHAcVfamnRvbjxwTFz9qbf5uepsz9PbsQhKslXW9e6mC
         /hPa7FDVMtHP8kC+C+24TdCFEHq/e05uJKA1jRQfj0Bu4oa5tdxd9B8x0bqyhq/3tG7O
         8MZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726147717; x=1726752517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBPW887Enb6qxy0k7AJqACo6iO/mio8ItdP+Pf5Uvew=;
        b=iKZao8cGyw3CdBVeH0AxnQJTE13xdnGkFYrSpd9akz1b2zSyxFZMPcVjqZAyH5w/O3
         EgIDVnj9ZikIKFSLEKFnuh+ss/WXmHMpgjITpT4zoknlPFi8ea7djpkCOHzfTmBGgcBS
         zlgE/oapK2aXMD9uVdBFFJbnKA9k47jSLZm1T5GITVBictVuY9rDU6ByJ7UMFoHNt5/R
         /+MplSX9/Y2rLVh0gLUK6Q0k90gqVrXLdtyVV/7mAYAmPoWoZlkrV22GwJaYGo64c9xc
         Hq4oAqMQ2Dsl34N/cf6DCpDCFFmjInDEFqqdaRv9n96WcCss5dDu3iUFPIPNBcJOn/WV
         S5Ig==
X-Forwarded-Encrypted: i=1; AJvYcCU5B+n81LuPe5Jgh8fjYAyBVed1GPUFiCuzTmiv0ViNrM3IgDfpLKZV4J+suiX7h2ZYMAqXIasSWbKJR5o=@vger.kernel.org, AJvYcCWIsRgwXLq6xKeRF1VtMoONCBqN4ej9VchlCopsL9HLmjGMee3aNvLOv4zgWIQa0SzG93TNJ8Sp9xvn@vger.kernel.org, AJvYcCXp8TEMyxTpVv6CeEsXIJWeGc4XLP5P+dHUk9JrpmNIe95fvIW1DuP+BVs1MKGySN88I52KeH17s4SGJ2rn@vger.kernel.org
X-Gm-Message-State: AOJu0YzmUf0LsxrJRWjkFmZhznGCPJcUR2P5hf4heDu8SMl7O4pPpXiD
	tNUF9StV5Jf3ejL3lRzE/rhXc9XmHfOPV0BgSiSNVSt0UFGD2vxu
X-Google-Smtp-Source: AGHT+IH/76xz4wKuR7+bN1S1lnig11MKEkvxph9u3udkjeM/eSTSBfT2/c4gVmA9SwyaZec869J1kw==
X-Received: by 2002:a17:907:6e88:b0:a86:7b71:7b74 with SMTP id a640c23a62f3a-a90296789b0mr294372866b.55.1726147715881;
        Thu, 12 Sep 2024 06:28:35 -0700 (PDT)
Received: from kuzhyl-vm.. (89-64-30-233.dynamic.chello.pl. [89.64.30.233])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25a28408sm745121166b.86.2024.09.12.06.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 06:28:35 -0700 (PDT)
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
Subject: [PATCH v7 2/2] input: add driver for Hynitron CST816X touchscreen
Date: Thu, 12 Sep 2024 15:28:23 +0200
Message-Id: <20240912132823.123409-2-kuzhylol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912132823.123409-1-kuzhylol@gmail.com>
References: <20240912132823.123409-1-kuzhylol@gmail.com>
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
index 000000000000..8c5faaa2e1d1
--- /dev/null
+++ b/drivers/input/touchscreen/hynitron-cst816x.c
@@ -0,0 +1,227 @@
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
+#define CST816X_FRAME 0x01
+
+struct cst816x_touch_info {
+	u8 gesture;
+	u8 touch;
+	__be16 abs_x;
+	__be16 abs_y;
+} __packed;
+
+struct cst816x_event_map {
+	u8 gesture;
+	u16 code;
+};
+
+struct cst816x_priv {
+	struct i2c_client *client;
+	struct gpio_desc *reset;
+	struct input_dev *input;
+	struct cst816x_event_map event_map[16];
+};
+
+static int cst816x_parse_dt_event_map(struct device *dev,
+				      struct cst816x_priv *priv)
+{
+	struct device_node *np = dev->of_node;
+	struct device_node *gst, *child;
+	u32 gesture, code;
+	u8 index;
+
+	gst = of_get_child_by_name(np, "gestures");
+	if (!gst)
+		return -ENOENT;
+
+	for_each_child_of_node(gst, child) {
+		if (of_property_read_u32(child, "cst816x,gesture", &gesture))
+			continue;
+
+		if (of_property_read_u32(child, "linux,code", &code))
+			continue;
+
+		index = gesture & 0x0F;
+
+		priv->event_map[index].gesture = gesture;
+		priv->event_map[index].code = code;
+	}
+
+	return 0;
+}
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
+	if (cst816x_i2c_read_register(priv, CST816X_FRAME, info, sizeof(*info)))
+		return false;
+
+	info->abs_x = get_unaligned_be16(&info->abs_x) & GENMASK(11, 0);
+	info->abs_y = get_unaligned_be16(&info->abs_y) & GENMASK(11, 0);
+
+	dev_dbg(&priv->client->dev, "x: %d, y: %d, t: %d, g: 0x%x\n",
+		info->abs_x, info->abs_y, info->touch, info->gesture);
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
+	priv->input->name = "Hynitron CST816X Touchscreen";
+	priv->input->phys = "input/ts";
+	priv->input->id.bustype = BUS_I2C;
+	input_set_drvdata(priv->input, priv);
+
+	for (int i = 0; i < ARRAY_SIZE(priv->event_map); i++)
+		input_set_capability(priv->input, EV_KEY,
+				     priv->event_map[i].code);
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
+static irqreturn_t cst816x_irq_cb(int irq, void *cookie)
+{
+	struct cst816x_priv *priv = cookie;
+	struct cst816x_touch_info info;
+
+	if (!cst816x_process_touch(priv, &info))
+		return IRQ_HANDLED;
+
+	if (info.touch) {
+		input_report_abs(priv->input, ABS_X, info.abs_x);
+		input_report_abs(priv->input, ABS_Y, info.abs_y);
+		input_report_key(priv->input, BTN_TOUCH, 1);
+	}
+
+	if (info.gesture) {
+		input_report_key(priv->input,
+				 priv->event_map[info.gesture & 0x0F].code,
+				 info.touch);
+
+		if (!info.touch)
+			input_report_key(priv->input, BTN_TOUCH, 0);
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
+	int error;
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
+	error = cst816x_parse_dt_event_map(dev, priv);
+	if (error)
+		dev_warn(dev, "no gestures specified in dt\n");
+
+	error = cst816x_register_input(priv);
+	if (error)
+		return dev_err_probe(dev, error, "input register failed\n");
+
+	error = devm_request_threaded_irq(dev, client->irq, NULL, cst816x_irq_cb,
+					  IRQF_ONESHOT, dev->driver->name, priv);
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


