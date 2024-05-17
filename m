Return-Path: <linux-input+bounces-3725-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 823228C836F
	for <lists+linux-input@lfdr.de>; Fri, 17 May 2024 11:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A12761C206FD
	for <lists+linux-input@lfdr.de>; Fri, 17 May 2024 09:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DE2219E1;
	Fri, 17 May 2024 09:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kS5jmFu6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C8720B02
	for <linux-input@vger.kernel.org>; Fri, 17 May 2024 09:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715938060; cv=none; b=FwovoqwSDpa/iUE0J1Rb/Jd/0WvR71ahcsqsmidCg5pGHWbb0y9lHJUvbSytbKJo4OgJD8OBFPiNp4HsJTstHngNA12waJlkTRIlDXzwHYCQ4h7Nb+uteFS5OafHizvA7DIxlSapJ4FxpzPIxlr/5pM/dfqeMMvuNPA287yjKH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715938060; c=relaxed/simple;
	bh=4MCS+2UqKLlRSu/9FDuodTOZTLlI7o5qmi+a9KGWjLc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mVUbAOwHL0r5G5Rd6gZOboZzAFOMxY0f9YiChFCTlHftkdeOYM0HWliz7ubbJmhZcXgPUmpBg0HdWkjOnNdMGV9qYiyQq9H57UO2MqVStjcziYT6v3NFI5rpxvhAle+Qg/PgzPFjeBvH+fMRcLiPj05CYql6+uDrGwc+rgeDeuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kS5jmFu6; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-520f9d559f6so2248843e87.3
        for <linux-input@vger.kernel.org>; Fri, 17 May 2024 02:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715938057; x=1716542857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a2THyuBN1cg9BXm1R1M07/KKQdD6176keD8z4tn+sQE=;
        b=kS5jmFu6JTdSzCZpEqm98QoHQ8O2jSmeU83JY26vRRadoZ4N5h4AKbIav9/Kn1WkrZ
         57cwOdmuOFLEap91LfFU5rHwHHu1lBCujd82fcozIJaZBIrD6mT6E1TCZKB46qIEewJa
         WCCr7PM/E/sSyaP6fde3jIlrVeZTGqCXCUNTglMtyhYd69Nf/r7JM+xZy26pBGuH1nWi
         2pcnTNWJyKs1IVJ5xCJFIeaA03BDeV/nnoHiHfri0gJusKUJZrItsJBam/1AC23zDguw
         kt9TyX1sEX0qMd1adFVg3W394yymva5X6K4XEyTBFkGVb3XRoHRwBdTbc8p1pwNSlbK4
         /bLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715938057; x=1716542857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2THyuBN1cg9BXm1R1M07/KKQdD6176keD8z4tn+sQE=;
        b=O+Pvl8yT1O9C8maD9XP/we4lCv/4Dg2EwUvPsh9wTL+fp6qaGTfLoEJivXJ88cwYnE
         PJA1NQFkzjfaStJuoOApb7VBSC0DTY9i/meZrjWg07Q8x2MqJ8kbb/FHA7KLD7HtzKuf
         Hwml3dgLZSX2eJomXZudQVaLdF+3tQqpXhciJLyJpKas6jYsn2VPCElzjT7XOVgWMTlm
         nZaUBRDpdVj9tmJBZjKWtO3zGO8PypTPEc/BCLVdC25bzvtxNkcEntXsrwOl1nn+P4+4
         HvQXCAeRY6FXawXlbVGgVtF06a0M4aqqGAhxVv8/87HUaUXf0zUEfU+7ll8840Ssyxk2
         jXDA==
X-Gm-Message-State: AOJu0YwDQvXNwtq9mAv/q4dE7lVoyh0UbFXJ2u/OtNNwrLo7W1irmOpk
	2OzYB8Ux03Rv7rpheE/HoEzII+zprEjpiaHWjYbD1r30SCk5VJiIvtrUsg==
X-Google-Smtp-Source: AGHT+IFo1sUrIY40lUpVsnRLM2XmLTAly2yOBH5sFICEDZY680qVdXP4E3BK0jm+Kz0MmFXmQT1FJQ==
X-Received: by 2002:ac2:4911:0:b0:523:8e3a:51a with SMTP id 2adb3069b0e04-5238e3a06f3mr4971426e87.29.1715938056466;
        Fri, 17 May 2024 02:27:36 -0700 (PDT)
Received: from kuzhyl-vm.localdomain (89-64-18-73.dynamic.chello.pl. [89.64.18.73])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-523b261ace6sm645977e87.8.2024.05.17.02.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 02:27:36 -0700 (PDT)
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
To: linux-input@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	artur.serhiienko@gmail.com,
	igor.opaniuk@gmail.com,
	Oleh Kuzhylnyi <kuzhylol@gmail.com>
Subject: [PATCH 1/2] input: add driver for Hynitron CST816X touchscreen
Date: Fri, 17 May 2024 11:27:31 +0200
Message-Id: <20240517092732.47715-1-kuzhylol@gmail.com>
X-Mailer: git-send-email 2.34.1
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
 drivers/input/touchscreen/Kconfig            |  12 +
 drivers/input/touchscreen/Makefile           |   1 +
 drivers/input/touchscreen/hynitron-cst816x.c | 390 +++++++++++++++++++
 3 files changed, 403 insertions(+)
 create mode 100644 drivers/input/touchscreen/hynitron-cst816x.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index c821fe3ee794..e36b07877010 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -481,6 +481,18 @@ config TOUCHSCREEN_HYNITRON_CSTXXX
 	  To compile this driver as a module, choose M here: the
 	  module will be called hynitron-cstxxx.
 
+config TOUCHSCREEN_HYNITRON_CST816X
+	tristate "Hynitron CST816X based touchscreen support"
+	depends on I2C
+	help
+	  Say Y here if you have a touchscreen using a Hynitron
+	  cst816x touchscreen controller.
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
index 000000000000..675b40e9be17
--- /dev/null
+++ b/drivers/input/touchscreen/hynitron-cst816x.c
@@ -0,0 +1,390 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for I2C connected CST816X touchsreen
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
+#define CST816X_EVENT_TIMEOUT_MS 50
+
+enum cst816x_commands {
+	CST816X_SET_DOUBLE_TAP = 0x01,
+	CST816X_SET_STANDBY_MODE = 0x03,
+};
+
+enum cst816x_registers {
+	CST816X_FRAME = 0x01,
+	CST816X_MOTION = 0xEC,
+	CST816X_STANDBY = 0xA5,
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
+
+	int irq;
+};
+
+struct cst816x_gesture_mapping {
+	enum cst816_gesture_code gesture_code;
+	size_t event_code;
+};
+
+static const struct cst816x_gesture_mapping cst816x_gesture_map[] = {
+	{CST816X_SWIPE, BTN_WHEEL},
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
+static int cst816x_regs_setup(struct cst816x_priv *priv)
+{
+	int rc;
+
+	rc = cst816x_i2c_write_reg(priv, CST816X_MOTION, CST816X_DOUBLE_TAP);
+	if (rc < 0)
+		dev_err(priv->dev, "register setup err: %d\n", rc);
+	else
+		rc = 0;
+
+	return rc;
+}
+
+static void report_gesture_event(struct cst816x_priv *priv,
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
+	} else {
+		dev_warn(priv->dev, "request was dropped\n");
+	}
+
+	return rc;
+}
+
+static int cst816x_register_input(struct cst816x_priv *priv)
+{
+	int rc;
+
+	priv->input = devm_input_allocate_device(priv->dev);
+	if (!priv->input) {
+		rc = -ENOMEM;
+		dev_err(priv->dev, "input device alloc err: %d\n", rc);
+		goto err;
+	}
+
+	priv->input->name = "CST816X Touchscreen";
+	priv->input->phys = "input/ts";
+	priv->input->id.bustype = BUS_I2C;
+	input_set_drvdata(priv->input, priv);
+
+	for (u8 i = 0; i < ARRAY_SIZE(cst816x_gesture_map); i++) {
+		input_set_capability(priv->input, EV_KEY,
+				     cst816x_gesture_map[i].event_code);
+	}
+
+	input_set_abs_params(priv->input, ABS_X, 0, CST816X_MAX_X, 0, 0);
+	input_set_abs_params(priv->input, ABS_Y, 0, CST816X_MAX_Y, 0, 0);
+	input_set_capability(priv->input, EV_ABS, ABS_X);
+	input_set_capability(priv->input, EV_ABS, ABS_Y);
+
+	rc = input_register_device(priv->input);
+	if (rc) {
+		dev_err(priv->dev, "input registration err: %d\n", rc);
+		goto err;
+	}
+err:
+	return rc;
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
+static int cst816x_suspend(struct device *dev)
+{
+	struct cst816x_priv *priv = i2c_get_clientdata(to_i2c_client(dev));
+
+	disable_irq(priv->irq);
+	del_timer_sync(&priv->timer);
+	flush_delayed_work(&priv->dw);
+
+	return cst816x_i2c_write_reg(priv, CST816X_STANDBY,
+				     CST816X_SET_STANDBY_MODE);
+}
+
+static int cst816x_resume(struct device *dev)
+{
+	struct cst816x_priv *priv = i2c_get_clientdata(to_i2c_client(dev));
+	int rc;
+
+	cst816x_reset(priv);
+	rc = cst816x_regs_setup(priv);
+	if (!rc)
+		enable_irq(priv->irq);
+
+	return rc;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(cst816x_pm_ops, cst816x_suspend, cst816x_resume);
+
+static int cst816x_probe(struct i2c_client *client)
+{
+	struct cst816x_priv *priv;
+	struct device *dev = &client->dev;
+	int rc;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv) {
+		rc = -ENOMEM;
+		dev_err(dev, "devm alloc failed: %d\n", rc);
+		goto err;
+	}
+
+	INIT_DELAYED_WORK(&priv->dw, cst816x_dw_cb);
+	timer_setup(&priv->timer, cst816x_timer_cb, 0);
+
+	priv->dev = dev;
+	priv->client = client;
+
+	priv->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (priv->reset == NULL) {
+		rc = -EIO;
+		dev_err(dev, "reset GPIO request failed\n");
+		goto err;
+	}
+
+	if (priv->reset)
+		cst816x_reset(priv);
+
+	rc = cst816x_regs_setup(priv);
+	if (rc)
+		goto err;
+
+	rc = cst816x_register_input(priv);
+	if (rc)
+		goto err;
+
+	client->irq = of_irq_get(dev->of_node, 0);
+	if (client->irq <= 0) {
+		rc = -EINVAL;
+		dev_err(dev, "get parent IRQ err: %d\n", rc);
+		goto destroy_input;
+	}
+
+	if (client->irq <= 0) {
+		dev_err(dev, "IRQ pin is missing\n");
+		goto destroy_input;
+	}
+
+	rc = devm_request_threaded_irq(dev, client->irq, NULL,
+				       cst816x_irq_cb,
+				       IRQF_ONESHOT | IRQF_NO_AUTOEN,
+				       dev->driver->name, priv);
+	if (!rc) {
+		priv->irq = client->irq;
+		enable_irq(priv->irq);
+	} else {
+		dev_err(dev, "IRQ probe err: %d\n", client->irq);
+	}
+
+destroy_input:
+	if (rc)
+		input_unregister_device(priv->input);
+
+err:
+	return rc;
+}
+
+static const struct i2c_device_id cst816x_id[] = {
+	{ "cst816s", 0 },
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
+		.pm = pm_sleep_ptr(&cst816x_pm_ops),
+	},
+	.id_table = cst816x_id,
+	.probe = cst816x_probe,
+};
+
+module_i2c_driver(cst816x_driver);
+
+MODULE_AUTHOR("Oleh Kuzhylnyi <kuzhylol@gmail.com>");
+MODULE_DESCRIPTION("CST816X Touchscreen Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


