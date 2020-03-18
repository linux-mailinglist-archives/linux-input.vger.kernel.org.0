Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47E26189AF7
	for <lists+linux-input@lfdr.de>; Wed, 18 Mar 2020 12:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbgCRLqM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Mar 2020 07:46:12 -0400
Received: from v6.sk ([167.172.42.174]:51382 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726586AbgCRLqL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Mar 2020 07:46:11 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 0D82B60EEF;
        Wed, 18 Mar 2020 11:46:10 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 2/2] Input: add driver for power button on Dell Wyse 3020
Date:   Wed, 18 Mar 2020 12:45:56 +0100
Message-Id: <20200318114556.2064-3-lkundrak@v3.sk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318114556.2064-1-lkundrak@v3.sk>
References: <20200318114556.2064-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds support for the power button attached to the Embedded Controller
on a Dell Wyse 3020 "Ariel" board.

The Embedded Controller's SPI interface is actually capable sending and
receiving the PS/2 keyboard and mouse protocol data, which looks like
a good fit for a serio driver. Howerver, I don't know of any machines where
this is actually used.

My board only has a single power button and no way to connect an actual
keyboard or a mouse. Using the atkbd driver with serio would be an overkill
and would be inconvenient for the userspace. Therefore this driver
registers an input device that is only capable of reporting the power
button presses and releases.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/input/misc/Kconfig           |  11 ++
 drivers/input/misc/Makefile          |   1 +
 drivers/input/misc/ariel-pwrbutton.c | 168 +++++++++++++++++++++++++++
 3 files changed, 180 insertions(+)
 create mode 100644 drivers/input/misc/ariel-pwrbutton.c

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 7e2e658d551c1..0b60f7fed627b 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -73,6 +73,17 @@ config INPUT_AD714X_SPI
 	  To compile this driver as a module, choose M here: the
 	  module will be called ad714x-spi.
 
+config INPUT_ARIEL_PWRBUTTON
+	tristate "Dell Wyse 3020 Power Button Driver"
+	depends on SPI
+	depends on MACH_MMP3_DT || COMPILE_TEST
+	help
+	  Say Y to enable support for reporting power button status on
+	  on Dell Wyse 3020 ("Ariel") thin client.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called ariel-pwrbutton.
+
 config INPUT_ARIZONA_HAPTICS
 	tristate "Arizona haptics support"
 	depends on MFD_ARIZONA && SND_SOC
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 8fd187f314bdf..412d09c79e24a 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_INPUT_ADXL34X)		+= adxl34x.o
 obj-$(CONFIG_INPUT_ADXL34X_I2C)		+= adxl34x-i2c.o
 obj-$(CONFIG_INPUT_ADXL34X_SPI)		+= adxl34x-spi.o
 obj-$(CONFIG_INPUT_APANEL)		+= apanel.o
+obj-$(CONFIG_INPUT_ARIEL_PWRBUTTON)	+= ariel-pwrbutton.o
 obj-$(CONFIG_INPUT_ARIZONA_HAPTICS)	+= arizona-haptics.o
 obj-$(CONFIG_INPUT_ATI_REMOTE2)		+= ati_remote2.o
 obj-$(CONFIG_INPUT_ATLAS_BTNS)		+= atlas_btns.o
diff --git a/drivers/input/misc/ariel-pwrbutton.c b/drivers/input/misc/ariel-pwrbutton.c
new file mode 100644
index 0000000000000..02b8c53d32b6f
--- /dev/null
+++ b/drivers/input/misc/ariel-pwrbutton.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: BSD-2-Clause OR GPL-2.0-or-later
+/*
+ * Dell Wyse 3020 a.k.a. "Ariel" Power Button Driver
+ *
+ * Copyright (C) 2020 Lubomir Rintel
+ */
+
+#include <linux/module.h>
+#include <linux/spi/spi.h>
+#include <linux/interrupt.h>
+#include <linux/input.h>
+
+struct ec_input_response {
+	u8 reserved;
+	u8 msg_counter:2;
+	u8 count:2;
+	u8 type:4;
+	u8 data[3];
+} __packed;
+
+struct ariel_pwrbutton {
+	struct spi_device *client;
+	struct input_dev *input;
+	u8 msg_counter:2;
+};
+
+static int ec_input_read(struct ariel_pwrbutton *priv,
+		      struct ec_input_response *response)
+{
+	u8 read_request[] = { 0x00, 0x5a, 0xa5, 0x00, 0x00 };
+	struct spi_device *spi = priv->client;
+	struct spi_transfer t = {
+		.tx_buf = read_request,
+		.rx_buf = response,
+		.len = sizeof(read_request),
+	};
+
+	compiletime_assert(sizeof(read_request) == sizeof(*response),
+			   "SPI xfer request/response size mismatch");
+
+	return spi_sync_transfer(spi, &t, 1);
+}
+
+static irqreturn_t ec_input_interrupt(int irq, void *dev_id)
+{
+	struct ariel_pwrbutton *priv = dev_id;
+	struct spi_device *spi = priv->client;
+	struct ec_input_response response;
+	int i;
+
+	if (ec_input_read(priv, &response) < 0) {
+		dev_err(&spi->dev, "EC read failed.\n");
+		return IRQ_HANDLED;
+	}
+
+	if (priv->msg_counter == response.msg_counter) {
+		dev_warn(&spi->dev, "No new data to read?\n");
+		return IRQ_HANDLED;
+	}
+
+	priv->msg_counter = response.msg_counter;
+
+	if (response.type != 0x03 && response.type != 0x0c) {
+		dev_dbg(&spi->dev, "Ignoring message that's not kbd data\n");
+		return IRQ_HANDLED;
+	}
+
+	if (response.count > ARRAY_SIZE(response.data)) {
+		response.count = ARRAY_SIZE(response.data);
+		dev_warn(&spi->dev, "Truncating a long response\n");
+	}
+
+	for (i = 0; i < response.count; i++) {
+		dev_err(&spi->dev, "scan code %02x\n", response.data[i]);
+		switch (response.data[i]) {
+		case 0x74:
+			input_report_key(priv->input, KEY_POWER, 1);
+			input_sync(priv->input);
+			break;
+		case 0xf4:
+			input_report_key(priv->input, KEY_POWER, 0);
+			input_sync(priv->input);
+			break;
+		default:
+			dev_dbg(&spi->dev, "Unknown scan code: %02x\n",
+				response.data[i]);
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int ariel_pwrbutton_probe(struct spi_device *spi)
+{
+	struct ec_input_response response;
+	struct ariel_pwrbutton *priv;
+	int ret;
+
+	if (!spi->irq) {
+		dev_err(&spi->dev, "Missing IRQ.\n");
+		return -ENXIO;
+	}
+
+	priv = devm_kzalloc(&spi->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client = spi;
+	spi_set_drvdata(spi, priv);
+
+	priv->input = devm_input_allocate_device(&spi->dev);
+	if (!priv->input)
+		return -ENOMEM;
+	priv->input->name = "Power Button";
+	priv->input->dev.parent = &spi->dev;
+	input_set_capability(priv->input, EV_KEY, KEY_POWER);
+	ret = input_register_device(priv->input);
+	if (ret) {
+		dev_err(&spi->dev, "error registering input device: %d\n", ret);
+		return ret;
+	}
+
+	ret = ec_input_read(priv, &response);
+	if (ret < 0) {
+		dev_err(&spi->dev, "EC read failed: %d\n", ret);
+		return ret;
+	}
+	priv->msg_counter = response.msg_counter;
+
+	ret = devm_request_threaded_irq(&spi->dev, spi->irq, NULL,
+					ec_input_interrupt,
+					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					"Ariel EC Input", priv);
+
+	if (ret) {
+		dev_err(&spi->dev, "Failed to request IRQ %d: %d\n",
+			spi->irq, ret);
+		return ret;
+	}
+
+	dev_info(&spi->dev, "Dell Wyse 3020 Power Button\n");
+	return 0;
+}
+
+static const struct of_device_id ariel_pwrbutton_of_match[] = {
+	{ .compatible = "dell,wyse-ariel-ec-input" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ariel_pwrbutton_of_match);
+
+static const struct spi_device_id ariel_pwrbutton_id_table[] = {
+	{ "wyse-ariel-ec-input", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(spi, ariel_pwrbutton_id_table);
+
+static struct spi_driver ariel_pwrbutton_driver = {
+	.driver = {
+		.name = "dell-wyse-ariel-ec-input",
+		.of_match_table = ariel_pwrbutton_of_match,
+	},
+	.probe = ariel_pwrbutton_probe,
+};
+module_spi_driver(ariel_pwrbutton_driver);
+
+MODULE_AUTHOR("Lubomir Rintel <lkundrak@v3.sk>");
+MODULE_DESCRIPTION("Dell Wyse 3020 Power Button Input Driver");
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.25.1

