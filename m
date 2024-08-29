Return-Path: <linux-input+bounces-5993-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1429651BC
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 23:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF1121C215C8
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 21:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E0F18B491;
	Thu, 29 Aug 2024 21:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFc9oC6x"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE1A18A949;
	Thu, 29 Aug 2024 21:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724966445; cv=none; b=jrS3A/5IqX9k7mZl7/5krygPglwsilGAnQUgb9ZDdwvVx7AFqIwm/gPrLc2udPCHDHEPQn6b2gZfZvj2SQiJUMGEl34JSttU3AkzvUoGcN6fj9xqZISJkH1KsFfcoCnTMBjHaCgwU7IRxddk+yn7Yu+kENVk4V2tD/Bn3mifHnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724966445; c=relaxed/simple;
	bh=dRnhMyY49I8ctFsXtGe5a/F62TAp6N8dyGWxa8kuhGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sOY/n1Wo3crw3oLLkRwVsXp8dZUL2hm5S0HlfwhDR/9LfQzYI5bssOzmqJI7t+IkK/gN09zGj6oVUZsuc5tHTIiaCkPRPzp+XHaYog7peW3Irjz6T0v1YwmaqhzOWtIfqgKWo1IeLiqFbzUMB51BUH+48YUJdUXAZl/zbQhkXUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFc9oC6x; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f50ca18a13so13561031fa.1;
        Thu, 29 Aug 2024 14:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724966442; x=1725571242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CNS52G9gf5nwN/oN7spUpivcZOSe+Yaer5GWMcRkJs=;
        b=hFc9oC6xL4wALJqT0H30KMJUS3qiyvfraYsq40ryI3yjzpq1+wdII7fxjgdUgV2axB
         T7wJwhhbK4qORO63Uvn3ltIdtuOj5z9DHCmE0DnFhEBmRZJgFvfjjMutyId1/A12ntid
         ROs4tmgkt+CX6tO/oOv+sKidB/onlAJs4c0QYHj7KhDl/VbohJ6Y2XbDc1fScrcExCtJ
         9nOegXaCLDrrn8V3Zutxwm0PTcfhCAGVTTKmqgWdvPDd5msJi1L5LayB4zeIDaZt2kVS
         gqOErjBQppa6V2IB+m2jZZz3T7Lb574Ev19BTkUfUaMXElu21RKumiprYHrDWNxDXJxA
         wMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724966442; x=1725571242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CNS52G9gf5nwN/oN7spUpivcZOSe+Yaer5GWMcRkJs=;
        b=oIrW9jFildA7c9AMbEMzuXJ2rhh/4YTF+2v8NJNo1jrCvrOsCFQiEISPlhMA1uKjHC
         LXOnT3xkOdxgIvtHGdctNVR1ORApD0j92WVq7jaUPBM1hiWiw+1oXkKkN1aG/SsZbHOq
         IDj8EIEE6zwSKH/4Ha1ihF6U7cOykd9peSK3sYP9mtctW+PH7Mj0Kn87/PdMh9fyjrW5
         p+kO42xx1VwTfm9O4g06N0eyWJne/4Db8pqFAhENa4EJDgAt5YHEAH/a45qjbiPmD4wy
         RIpiKTeF4G7di1ZpnAxtiDifwzEzn1rlQczxlEYzWwnkpa4K8L1Rm4RxNRhO53MkbTxB
         /aNg==
X-Forwarded-Encrypted: i=1; AJvYcCVhpiW1o+9g+DIcjpJY51GbLequBVPaXnicYAZYQC9c5rTmvU1hXqELBSOFV3Rz15DNzuP6L1YpfiGxoL0L@vger.kernel.org, AJvYcCW35lR90dCYfbYnsJznAtmtDtfUAFWebNSwvjNxF3is+Hy8+i49tMb6F6aIZhpJK9Y0fCevZGJOH3n8@vger.kernel.org
X-Gm-Message-State: AOJu0YzILnl6qK5SlO17V/s9cSoynyIgLOeQMO+bTccL5Mjq+YDCWicI
	+8ixxx1GdmdvnTpBEzdWiXHVvCxgJF9996xsJsZsCFoe1n8aERnb
X-Google-Smtp-Source: AGHT+IHHyFSZ3yQ419EfMrv0FTsDa/Ap/eIPQI0AwKi3FyXQ9oSSw7ZqrFhVpzbxIER+TLkvlPw4Jw==
X-Received: by 2002:a2e:4a09:0:b0:2f3:f1a7:9813 with SMTP id 38308e7fff4ca-2f61054a1c2mr26483681fa.43.1724966440795;
        Thu, 29 Aug 2024 14:20:40 -0700 (PDT)
Received: from kuzhyl-vm.. (89-64-30-233.dynamic.chello.pl. [89.64.30.233])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15fcsm2746671fa.16.2024.08.29.14.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 14:20:40 -0700 (PDT)
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleh Kuzhylnyi <kuzhylol@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	igor.opaniuk@gmail.com,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v4 2/2] input: add driver for Hynitron CST816X touchscreen
Date: Thu, 29 Aug 2024 23:20:14 +0200
Message-Id: <20240829212014.111357-2-kuzhylol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829212014.111357-1-kuzhylol@gmail.com>
References: <20240829212014.111357-1-kuzhylol@gmail.com>
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
 drivers/input/touchscreen/hynitron-cst816x.c | 258 +++++++++++++++++++
 3 files changed, 271 insertions(+)
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
2.34.1


