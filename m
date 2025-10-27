Return-Path: <linux-input+bounces-15763-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C039C118D7
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 22:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 986893A7517
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 21:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A02328638;
	Mon, 27 Oct 2025 21:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b="of/djRp1"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ACB26C3A7;
	Mon, 27 Oct 2025 21:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761600371; cv=none; b=Opfng8MbfMYd/FNv6LrruIohsVtOSuswXBVNzxM5CQB7EDbUwOS0ttwnntEtykjt0CMvQOXxxwz4WNi8zk9UE1+h4BXDjOys1pYTEo6SZDrLC//3zKEvL9qbwJRHh/u9gs+Gclb7bkhXvpBxXS9cRaEHn5JsW2SmgORtzo3hdHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761600371; c=relaxed/simple;
	bh=gyEBB2hSG5vfo8Fi4KDzIKh3l1A69AxKpQX1LYQ53kE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ezvsUEccB1qS61RA3kLTiiwje+Drvo47GcfCJCkSpTbG0qxLfCZFDYCf3sZMo0pbWiOPuQCd9YQH715yfJmoAI0frjssFXi3bua8ue32iU80hfD+vjUdn3mtcX6c9ZEc1X/d+zO1uUm/60wK/jDeneAgN8gnBka42k9DPEuTKkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b=of/djRp1; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1761600360; x=1762205160; i=hendrik-noack@gmx.de;
	bh=RzM73WlVuvrBa4uhxXjIEUSvk1gZ2BTOoFOLy6RYcSk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=of/djRp1Cgy5v0IMxv4PJRVXxmj05/TN8gqtI/4EahGblIUP2rVXyYXmUjuESL53
	 GsXL2xZTCzGv+UyLYNKDtRuBv30TsLP0LYRQ6Aqg14PYWsrmW8hxZMTCELMgd6ejn
	 H1l1phJlBFUlXVnUQ0Rax24xr5E6kyxsJl7NYMnJ99ufFhJIT7+mwkMt4EjPpvE1U
	 sy+y7FugNXee9M9rIlViQrnlEMTzwixyo7yxgcjhjjXZ5ONdu9574lCF3H4k8IaFs
	 uy3APFlO5Umjp4rX+p6BHMP+tTQaDjjTNSIXKplTQuhCrurcbEM4ONer3gxGu2WVs
	 ewtyN3DwSLpmU7S9pg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ThinkPad-T420 ([80.187.116.161]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYeMj-1uhmYN0upv-00Qwbb; Mon, 27
 Oct 2025 22:26:00 +0100
From: Hendrik Noack <hendrik-noack@gmx.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Hendrik Noack <hendrik-noack@gmx.de>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Input: Add support for Wacom W9000-series penabled touchscreens
Date: Mon, 27 Oct 2025 22:25:35 +0100
Message-ID: <20251027212535.4078-2-hendrik-noack@gmx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251027212535.4078-1-hendrik-noack@gmx.de>
References: <20251027164050.113623-1-hendrik-noack@gmx.de>
 <20251027212535.4078-1-hendrik-noack@gmx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:U9S4HOCY7gy6VE17ZFDgBDVkIKO4aE/vcOWIya/0nCPYZOAlkBd
 719Nrj15fihmNOX0osQnvhMzhNb72Ii6XADWY2uUL3Ex4HI4tnTaZM3f26DysQbWOGXsxu0
 /rsSxNvTZ9wmFLc+9az+aWJj7Ar+xsSoeyQoeYyyVkLz9V4J1k4YcKaz7rSFHg221zgJqa5
 qojql7ROe/Sj8VDbgCWww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LbWPIxPfCNs=;80jVfQzKUtOGMelFc9U0epKCa25
 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

Add driver for two Wacom W9007A variants. These are penabled touchscreens
supporting passive Wacom Pens and use I2C.

Signed-off-by: Hendrik Noack <hendrik-noack@gmx.de>
=2D--
 drivers/input/touchscreen/Kconfig       |  12 +
 drivers/input/touchscreen/Makefile      |   1 +
 drivers/input/touchscreen/wacom_w9000.c | 525 ++++++++++++++++++++++++
 3 files changed, 538 insertions(+)
 create mode 100644 drivers/input/touchscreen/wacom_w9000.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen=
/Kconfig
index 7d5b72ee07fa..40f7af0a681a 100644
=2D-- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -610,6 +610,18 @@ config TOUCHSCREEN_WACOM_I2C
 	  To compile this driver as a module, choose M here: the module
 	  will be called wacom_i2c.
=20
+config TOUCHSCREEN_WACOM_W9000
+	tristate "Wacom W9000-series penabled touchscreen (I2C)"
+	depends on I2C
+	help
+	  Say Y here if you have a Wacom W9000-series penabled I2C touchscreen.
+	  This driver supports model W9007A.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called wacom_w9000.
+
 config TOUCHSCREEN_LPC32XX
 	tristate "LPC32XX touchscreen controller"
 	depends on ARCH_LPC32XX
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscree=
n/Makefile
index ab9abd151078..aa3915df83b2 100644
=2D-- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -102,6 +102,7 @@ tsc2007-$(CONFIG_TOUCHSCREEN_TSC2007_IIO)	+=3D tsc2007=
_iio.o
 obj-$(CONFIG_TOUCHSCREEN_TSC2007)	+=3D tsc2007.o
 obj-$(CONFIG_TOUCHSCREEN_WACOM_W8001)	+=3D wacom_w8001.o
 obj-$(CONFIG_TOUCHSCREEN_WACOM_I2C)	+=3D wacom_i2c.o
+obj-$(CONFIG_TOUCHSCREEN_WACOM_W9000)	+=3D wacom_w9000.o
 obj-$(CONFIG_TOUCHSCREEN_WDT87XX_I2C)	+=3D wdt87xx_i2c.o
 obj-$(CONFIG_TOUCHSCREEN_WM831X)	+=3D wm831x-ts.o
 obj-$(CONFIG_TOUCHSCREEN_WM97XX)	+=3D wm97xx-ts.o
diff --git a/drivers/input/touchscreen/wacom_w9000.c b/drivers/input/touch=
screen/wacom_w9000.c
new file mode 100644
index 000000000000..11c6c98303b8
=2D-- /dev/null
+++ b/drivers/input/touchscreen/wacom_w9000.c
@@ -0,0 +1,525 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Wacom W9000-series penabled I2C touchscreen driver
+ *
+ * Copyright (c) 2025 Hendrik Noack <hendrik-noack@gmx.de>
+ *
+ * Partially based on vendor driver:
+ *	Copyright (C) 2012, Samsung Electronics Co. Ltd.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/input/touchscreen.h>
+
+// Message length
+#define COM_COORD_NUM_MAX		12
+#define COM_QUERY_NUM_MAX		9
+
+// Commands
+#define COM_QUERY		0x2a
+
+struct wacom_w9000_variant {
+	int com_coord_num;
+	int com_query_num;
+	char *name;
+};
+
+struct wacom_w9000_data {
+	struct i2c_client *client;
+	struct input_dev *input_dev;
+	const struct wacom_w9000_variant *variant;
+	unsigned int fw_version;
+
+	struct touchscreen_properties prop;
+	unsigned int max_pressure;
+
+	struct regulator *regulator;
+
+	struct gpio_desc *flash_mode_gpio;
+	struct gpio_desc *pen_detect_gpio;
+	struct gpio_desc *pen_inserted_gpio;
+
+	unsigned int irq;
+	unsigned int pen_detect_irq;
+	unsigned int pen_insert_irq;
+
+	bool pen_inserted;
+	bool pen_detect;
+	bool pen_proximity;
+};
+
+static const struct wacom_w9000_variant wacom_w9007a_lt03 =3D {
+	.com_coord_num	=3D 8,
+	.com_query_num	=3D 9,
+	.name =3D "Wacom W9007 LT03 Digitizer",
+};
+
+static const struct wacom_w9000_variant wacom_w9007a_v1 =3D {
+	.com_coord_num	=3D 12,
+	.com_query_num	=3D 9,
+	.name =3D "Wacom W9007 V1 Digitizer",
+};
+
+static const struct of_device_id wacom_w9000_of_match[] =3D {
+	{ .compatible =3D "wacom,w9007a_lt03", .data =3D &wacom_w9007a_lt03, },
+	{ .compatible =3D "wacom,w9007a_v1", .data =3D &wacom_w9007a_v1, },
+	{},
+};
+MODULE_DEVICE_TABLE(of, wacom_w9000_of_match);
+
+static int wacom_w9000_read(struct i2c_client *client, u8 command, int le=
n, char *data)
+{
+	struct i2c_msg xfer[2];
+	bool retried =3D false;
+	int ret;
+
+	/* Write register */
+	xfer[0].addr =3D client->addr;
+	xfer[0].flags =3D 0;
+	xfer[0].len =3D 1;
+	xfer[0].buf =3D &command;
+
+	/* Read data */
+	xfer[1].addr =3D client->addr;
+	xfer[1].flags =3D I2C_M_RD;
+	xfer[1].len =3D len;
+	xfer[1].buf =3D data;
+
+retry:
+	ret =3D i2c_transfer(client->adapter, xfer, 2);
+	if (ret =3D=3D 2) {
+		ret =3D 0;
+	} else if (!retried) {
+		retried =3D true;
+		goto retry;
+	} else {
+		if (ret >=3D 0)
+			ret =3D -EIO;
+		dev_err(&client->dev, "%s: i2c transfer failed (%d)\n", __func__, ret);
+	}
+
+	return ret;
+}
+
+static int wacom_w9000_query(struct wacom_w9000_data *wacom_data)
+{
+	struct i2c_client *client =3D wacom_data->client;
+	struct device *dev =3D &wacom_data->client->dev;
+	bool retried =3D false;
+	int ret;
+	u8 data[COM_QUERY_NUM_MAX];
+
+retry:
+	ret =3D wacom_w9000_read(client, COM_QUERY, wacom_data->variant->com_que=
ry_num, data);
+	if (ret)
+		return ret;
+
+	if (data[0] =3D=3D 0x0f) {
+		wacom_data->fw_version =3D get_unaligned_be16(&data[7]);
+	} else if (!retried) {
+		retried =3D true;
+		goto retry;
+	} else {
+		return -EIO;
+	}
+
+	dev_dbg(dev, "query: %X, %X, %X, %X, %X, %X, %X, %X, %X, %d\n", data[0],=
 data[1], data[2],
+		data[3], data[4], data[5], data[6], data[7], data[8], retried);
+
+	wacom_data->prop.max_x =3D get_unaligned_be16(&data[1]);
+	wacom_data->prop.max_y =3D get_unaligned_be16(&data[3]);
+	wacom_data->max_pressure =3D get_unaligned_be16(&data[5]);
+
+	dev_dbg(dev, "max_x:%d, max_y:%d, max_pressure:%d, fw:0x%X", wacom_data-=
>prop.max_x,
+		wacom_data->prop.max_y, wacom_data->max_pressure,
+		wacom_data->fw_version);
+
+	return 0;
+}
+
+static void wacom_w9000_coord(struct wacom_w9000_data *wacom_data)
+{
+	struct i2c_client *client =3D wacom_data->client;
+	struct device *dev =3D &wacom_data->client->dev;
+	int ret;
+	u8 data[COM_COORD_NUM_MAX];
+	bool touch, rubber, side_button;
+	u16 x, y, pressure;
+	u8 distance;
+
+	ret =3D i2c_master_recv(client, data, wacom_data->variant->com_coord_num=
);
+	if (ret !=3D wacom_data->variant->com_coord_num) {
+		if (ret >=3D 0)
+			ret =3D -EIO;
+		dev_err(dev, "%s: i2c receive failed (%d)\n", __func__, ret);
+		return;
+	}
+
+	dev_dbg(dev, "data: %X, %X, %X, %X, %X, %X, %X, %X, %X, %X, %X, %X", dat=
a[0], data[1],
+		data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9],=
 data[10],
+		data[11]);
+
+	if (data[0] & BIT(7)) {
+		wacom_data->pen_proximity =3D 1;
+
+		touch =3D !!(data[0] & BIT(4));
+		side_button =3D !!(data[0] & BIT(5));
+		rubber =3D !!(data[0] & BIT(6));
+
+		x =3D get_unaligned_be16(&data[1]);
+		y =3D get_unaligned_be16(&data[3]);
+		pressure =3D get_unaligned_be16(&data[5]);
+		distance =3D data[7];
+
+		if (!((x <=3D wacom_data->prop.max_x) && (y <=3D wacom_data->prop.max_y=
))) {
+			dev_warn(dev, "Coordinates out of range x=3D%d, y=3D%d", x, y);
+			return;
+		}
+
+		touchscreen_report_pos(wacom_data->input_dev, &wacom_data->prop, x, y, =
false);
+		input_report_abs(wacom_data->input_dev, ABS_PRESSURE, pressure);
+		input_report_abs(wacom_data->input_dev, ABS_DISTANCE, distance);
+		input_report_key(wacom_data->input_dev, BTN_STYLUS, side_button);
+		input_report_key(wacom_data->input_dev, BTN_TOUCH, touch);
+		input_report_key(wacom_data->input_dev, BTN_TOOL_PEN, !rubber);
+		input_report_key(wacom_data->input_dev, BTN_TOOL_RUBBER, rubber);
+		input_sync(wacom_data->input_dev);
+	} else {
+		if (wacom_data->pen_proximity) {
+			input_report_abs(wacom_data->input_dev, ABS_PRESSURE, 0);
+			input_report_abs(wacom_data->input_dev, ABS_DISTANCE, 0);
+			input_report_key(wacom_data->input_dev, BTN_STYLUS, 0);
+			input_report_key(wacom_data->input_dev, BTN_TOUCH, 0);
+			input_report_key(wacom_data->input_dev, BTN_TOOL_PEN, 0);
+			input_report_key(wacom_data->input_dev, BTN_TOOL_RUBBER, 0);
+			input_sync(wacom_data->input_dev);
+
+			wacom_data->pen_proximity =3D 0;
+		}
+	}
+}
+
+static irqreturn_t wacom_w9000_interrupt(int irq, void *dev_id)
+{
+	struct wacom_w9000_data *wacom_data =3D dev_id;
+
+	wacom_w9000_coord(wacom_data);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t wacom_w9000_interrupt_pen_detect(int irq, void *dev_id=
)
+{
+	struct wacom_w9000_data *wacom_data =3D dev_id;
+
+	wacom_data->pen_detect =3D gpiod_get_value(wacom_data->pen_detect_gpio);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t wacom_w9000_interrupt_pen_insert(int irq, void *dev_id=
)
+{
+	struct wacom_w9000_data *wacom_data =3D dev_id;
+	struct device *dev =3D &wacom_data->client->dev;
+	int ret;
+
+	wacom_data->pen_inserted =3D gpiod_get_value(wacom_data->pen_inserted_gp=
io);
+
+	input_report_switch(wacom_data->input_dev, SW_PEN_INSERTED, wacom_data->=
pen_inserted);
+	input_sync(wacom_data->input_dev);
+
+	if (!wacom_data->pen_inserted && !regulator_is_enabled(wacom_data->regul=
ator)) {
+		ret =3D regulator_enable(wacom_data->regulator);
+		if (ret) {
+			dev_err(dev, "Failed to enable regulators: %d\n", ret);
+			return IRQ_HANDLED;
+		}
+		msleep(200);
+		enable_irq(wacom_data->irq);
+	} else if (wacom_data->pen_inserted && regulator_is_enabled(wacom_data->=
regulator)) {
+		disable_irq(wacom_data->irq);
+		regulator_disable(wacom_data->regulator);
+	}
+
+	dev_dbg(dev, "Pen inserted changed to %d", wacom_data->pen_inserted);
+
+	return IRQ_HANDLED;
+}
+
+static int wacom_w9000_open(struct input_dev *dev)
+{
+	struct wacom_w9000_data *wacom_data =3D input_get_drvdata(dev);
+	int ret;
+
+	if (!wacom_data->pen_inserted && !regulator_is_enabled(wacom_data->regul=
ator)) {
+		ret =3D regulator_enable(wacom_data->regulator);
+		if (ret) {
+			dev_err(&wacom_data->client->dev, "Failed to enable regulators: %d\n",
+				ret);
+			return ret;
+		}
+		msleep(200);
+		enable_irq(wacom_data->irq);
+	}
+	return 0;
+}
+
+static void wacom_w9000_close(struct input_dev *dev)
+{
+	struct wacom_w9000_data *wacom_data =3D input_get_drvdata(dev);
+
+	if (regulator_is_enabled(wacom_data->regulator)) {
+		disable_irq(wacom_data->irq);
+		regulator_disable(wacom_data->regulator);
+	}
+}
+
+static int wacom_w9000_probe(struct i2c_client *client)
+{
+	struct device *dev =3D &client->dev;
+	struct wacom_w9000_data *wacom_data;
+	struct input_dev *input_dev;
+	int ret;
+	u32 val;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		dev_err(dev, "i2c_check_functionality error\n");
+		return -EIO;
+	}
+
+	wacom_data =3D devm_kzalloc(dev, sizeof(struct wacom_w9000_data), GFP_KE=
RNEL);
+	if (!wacom_data)
+		return -ENOMEM;
+
+	wacom_data->variant =3D i2c_get_match_data(client);
+
+	wacom_data->client =3D client;
+
+	input_dev =3D devm_input_allocate_device(dev);
+	if (!input_dev)
+		return -ENOMEM;
+	wacom_data->input_dev =3D input_dev;
+
+	wacom_data->irq =3D client->irq;
+	i2c_set_clientdata(client, wacom_data);
+
+	wacom_data->regulator =3D devm_regulator_get(dev, "vdd");
+	if (IS_ERR(wacom_data->regulator)) {
+		ret =3D PTR_ERR(wacom_data->regulator);
+		dev_err(dev, "Failed to get regulators %d\n", ret);
+		return ret;
+	}
+
+	/* Request flash-mode line and don't go into flash mode */
+	wacom_data->flash_mode_gpio =3D devm_gpiod_get_optional(dev, "flash-mode=
", GPIOD_OUT_LOW);
+	if (IS_ERR(wacom_data->flash_mode_gpio)) {
+		ret =3D PTR_ERR(wacom_data->flash_mode_gpio);
+		dev_err(dev, "Failed to get flash-mode gpio: %d\n", ret);
+		return ret;
+	}
+
+	/* Request pdct line  */
+	wacom_data->pen_detect_gpio =3D devm_gpiod_get_optional(dev, "pdct", GPI=
OD_IN);
+	if (IS_ERR(wacom_data->pen_detect_gpio)) {
+		ret =3D PTR_ERR(wacom_data->pen_detect_gpio);
+		dev_err(dev, "Failed to get pdct gpio: %d\n", ret);
+		return ret;
+	}
+
+	/* Request pen-insert line  */
+	wacom_data->pen_inserted_gpio =3D devm_gpiod_get_optional(dev, "pen-inse=
rted", GPIOD_IN);
+	if (IS_ERR(wacom_data->pen_inserted_gpio)) {
+		ret =3D PTR_ERR(wacom_data->pen_inserted_gpio);
+		dev_err(dev, "Failed to get pen-insert gpio: %d\n", ret);
+		return ret;
+	}
+
+	ret =3D regulator_enable(wacom_data->regulator);
+	if (ret) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	msleep(200);
+
+	ret =3D wacom_w9000_query(wacom_data);
+	if (ret)
+		goto err_disable_regulators;
+
+	input_dev->name =3D wacom_data->variant->name;
+	input_dev->id.bustype =3D BUS_I2C;
+	input_dev->dev.parent =3D dev;
+	input_dev->id.vendor =3D 0x56a;
+	input_dev->id.version =3D wacom_data->fw_version;
+	input_dev->open =3D wacom_w9000_open;
+	input_dev->close =3D wacom_w9000_close;
+
+	__set_bit(EV_KEY, input_dev->evbit);
+	__set_bit(EV_ABS, input_dev->evbit);
+	__set_bit(BTN_TOUCH, input_dev->keybit);
+	__set_bit(BTN_TOOL_PEN, input_dev->keybit);
+	__set_bit(BTN_TOOL_RUBBER, input_dev->keybit);
+	__set_bit(BTN_STYLUS, input_dev->keybit);
+
+	// Calculate x and y resolution from size in devicetree
+	ret =3D device_property_read_u32(dev, "touchscreen-x-mm", &val);
+	if (ret)
+		input_abs_set_res(input_dev, ABS_X, 100);
+	else
+		input_abs_set_res(input_dev, ABS_X, wacom_data->prop.max_x / val);
+	ret =3D device_property_read_u32(dev, "touchscreen-y-mm", &val);
+	if (ret)
+		input_abs_set_res(input_dev, ABS_Y, 100);
+	else
+		input_abs_set_res(input_dev, ABS_Y, wacom_data->prop.max_y / val);
+
+	input_set_abs_params(input_dev, ABS_X, 0, wacom_data->prop.max_x, 4, 0);
+	input_set_abs_params(input_dev, ABS_Y, 0, wacom_data->prop.max_y, 4, 0);
+	input_set_abs_params(input_dev, ABS_PRESSURE, 0, wacom_data->max_pressur=
e, 0, 0);
+	input_set_abs_params(input_dev, ABS_DISTANCE, 0, 255, 0, 0);
+
+	touchscreen_parse_properties(input_dev, false, &wacom_data->prop);
+
+	ret =3D devm_request_threaded_irq(dev, wacom_data->irq, NULL, wacom_w900=
0_interrupt,
+					IRQF_ONESHOT | IRQF_NO_AUTOEN, client->name, wacom_data);
+	if (ret) {
+		dev_err(dev, "Failed to register interrupt\n");
+		goto err_disable_regulators;
+	}
+
+	if (wacom_data->pen_detect_gpio) {
+		wacom_data->pen_detect_irq =3D gpiod_to_irq(wacom_data->pen_detect_gpio=
);
+		ret =3D devm_request_threaded_irq(dev, wacom_data->pen_detect_irq, NULL=
,
+						wacom_w9000_interrupt_pen_detect, IRQF_ONESHOT |
+						IRQF_NO_AUTOEN | IRQF_TRIGGER_RISING |
+						IRQF_TRIGGER_FALLING, "wacom_pdct", wacom_data);
+		if (ret) {
+			dev_err(dev, "Failed to register pdct interrupt\n");
+			goto err_disable_regulators;
+		}
+	}
+
+	if (wacom_data->pen_inserted_gpio) {
+		input_dev->evbit[0] |=3D BIT_MASK(EV_SW);
+		input_set_capability(input_dev, EV_SW, SW_PEN_INSERTED);
+		wacom_data->pen_insert_irq =3D gpiod_to_irq(wacom_data->pen_inserted_gp=
io);
+		ret =3D devm_request_threaded_irq(dev, wacom_data->pen_insert_irq, NULL=
,
+						wacom_w9000_interrupt_pen_insert, IRQF_ONESHOT |
+						IRQF_NO_AUTOEN | IRQF_TRIGGER_RISING |
+						IRQF_TRIGGER_FALLING, "wacom_pen_insert",
+						wacom_data);
+		if (ret) {
+			dev_err(dev, "Failed to register pen-insert interrupt\n");
+			goto err_disable_regulators;
+		}
+	}
+
+	input_set_drvdata(input_dev, wacom_data);
+
+	wacom_data->pen_inserted =3D gpiod_get_value(wacom_data->pen_inserted_gp=
io);
+	if (wacom_data->pen_inserted)
+		regulator_disable(wacom_data->regulator);
+	else
+		enable_irq(wacom_data->irq);
+
+	input_report_switch(wacom_data->input_dev, SW_PEN_INSERTED, wacom_data->=
pen_inserted);
+	input_sync(wacom_data->input_dev);
+
+	if (wacom_data->pen_inserted_gpio)
+		enable_irq(wacom_data->pen_insert_irq);
+
+	if (wacom_data->pen_detect_gpio)
+		enable_irq(wacom_data->pen_detect_irq);
+
+	ret =3D input_register_device(wacom_data->input_dev);
+	if (ret) {
+		dev_err(dev, "Failed to register input device: %d\n", ret);
+		goto err_disable_regulators;
+	}
+
+	return 0;
+
+err_disable_regulators:
+	regulator_disable(wacom_data->regulator);
+	return ret;
+}
+
+static void wacom_w9000_remove(struct i2c_client *client)
+{
+	struct wacom_w9000_data *wacom_data =3D i2c_get_clientdata(client);
+
+	if (regulator_is_enabled(wacom_data->regulator))
+		regulator_disable(wacom_data->regulator);
+}
+
+static int wacom_w9000_suspend(struct device *dev)
+{
+	struct i2c_client *client =3D to_i2c_client(dev);
+	struct wacom_w9000_data *wacom_data =3D i2c_get_clientdata(client);
+	struct input_dev *input_dev =3D wacom_data->input_dev;
+
+	mutex_lock(&input_dev->mutex);
+
+	if (regulator_is_enabled(wacom_data->regulator)) {
+		disable_irq(wacom_data->irq);
+		regulator_disable(wacom_data->regulator);
+	}
+
+	mutex_unlock(&input_dev->mutex);
+
+	return 0;
+}
+
+static int wacom_w9000_resume(struct device *dev)
+{
+	struct i2c_client *client =3D to_i2c_client(dev);
+	struct wacom_w9000_data *wacom_data =3D i2c_get_clientdata(client);
+	struct input_dev *input_dev =3D wacom_data->input_dev;
+	int ret =3D 0;
+
+	mutex_lock(&input_dev->mutex);
+
+	if (!wacom_data->pen_inserted && !regulator_is_enabled(wacom_data->regul=
ator)) {
+		ret =3D regulator_enable(wacom_data->regulator);
+		if (ret) {
+			dev_err(&wacom_data->client->dev, "Failed to enable regulators: %d\n",
+				ret);
+		} else {
+			msleep(200);
+			enable_irq(wacom_data->irq);
+		}
+	}
+
+	mutex_unlock(&input_dev->mutex);
+
+	return ret;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(wacom_w9000_pm, wacom_w9000_suspend, waco=
m_w9000_resume);
+
+static const struct i2c_device_id wacom_w9000_id[] =3D {
+	{ "w9007a_lt03" },
+	{ "w9007a_v1" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, wacom_w9000_id);
+
+static struct i2c_driver wacom_w9000_driver =3D {
+	.driver =3D {
+		.name	=3D "wacom_w9000",
+		.of_match_table =3D wacom_w9000_of_match,
+		.pm	=3D pm_sleep_ptr(&wacom_w9000_pm),
+	},
+	.probe		=3D wacom_w9000_probe,
+	.remove		=3D wacom_w9000_remove,
+	.id_table	=3D wacom_w9000_id,
+};
+module_i2c_driver(wacom_w9000_driver);
+
+/* Module information */
+MODULE_AUTHOR("Hendrik Noack <hendrik-noack@gmx.de>");
+MODULE_DESCRIPTION("Wacom W9000-series penabled touchscreen driver");
+MODULE_LICENSE("GPL");
=2D-=20
2.43.0


