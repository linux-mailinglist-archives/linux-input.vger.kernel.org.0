Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F32712C7998
	for <lists+linux-input@lfdr.de>; Sun, 29 Nov 2020 15:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgK2Oc2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Nov 2020 09:32:28 -0500
Received: from mail.v3.sk ([167.172.186.51]:57044 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725830AbgK2Oc2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Nov 2020 09:32:28 -0500
X-Greylist: delayed 591 seconds by postgrey-1.27 at vger.kernel.org; Sun, 29 Nov 2020 09:32:26 EST
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 499EBDF887;
        Sun, 29 Nov 2020 14:19:02 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id oWM5rMAvEjYo; Sun, 29 Nov 2020 14:19:01 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 9D46BE06C5;
        Sun, 29 Nov 2020 14:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id IdLlscF9W8UV; Sun, 29 Nov 2020 14:19:01 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 4C7A8DF932;
        Sun, 29 Nov 2020 14:19:01 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 2/2] Input: add driver for power button on Dell Wyse 3020
Date:   Sun, 29 Nov 2020 15:21:45 +0100
Message-Id: <20201129142145.1526022-3-lkundrak@v3.sk>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201129142145.1526022-1-lkundrak@v3.sk>
References: <20201129142145.1526022-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds support for the power button attached to the Embedded Controlle=
r
on a Dell Wyse 3020 "Ariel" board.

The Embedded Controller's SPI interface is actually capable sending and
receiving the PS/2 keyboard and mouse protocol data, which looks like
a good fit for a serio driver. Howerver, I don't know of any machines whe=
re
this is actually used.

My board only has a single power button and no way to connect an actual
keyboard or a mouse. Using the atkbd driver with serio would be an overki=
ll
and would be inconvenient for the userspace. Therefore this driver
registers an input device that is only capable of reporting the power
button presses and releases.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v1:
- Do away bitfields in order to be endian independent

 drivers/input/misc/Kconfig           |  11 ++
 drivers/input/misc/Makefile          |   1 +
 drivers/input/misc/ariel-pwrbutton.c | 165 +++++++++++++++++++++++++++
 3 files changed, 177 insertions(+)
 create mode 100644 drivers/input/misc/ariel-pwrbutton.c

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 362e8a01980cd..e7bb572e15182 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -73,6 +73,17 @@ config INPUT_AD714X_SPI
 	  To compile this driver as a module, choose M here: the
 	  module will be called ad714x-spi.
=20
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
index a48e5f2d859d4..062cea9f181c9 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_INPUT_ADXL34X)		+=3D adxl34x.o
 obj-$(CONFIG_INPUT_ADXL34X_I2C)		+=3D adxl34x-i2c.o
 obj-$(CONFIG_INPUT_ADXL34X_SPI)		+=3D adxl34x-spi.o
 obj-$(CONFIG_INPUT_APANEL)		+=3D apanel.o
+obj-$(CONFIG_INPUT_ARIEL_PWRBUTTON)	+=3D ariel-pwrbutton.o
 obj-$(CONFIG_INPUT_ARIZONA_HAPTICS)	+=3D arizona-haptics.o
 obj-$(CONFIG_INPUT_ATI_REMOTE2)		+=3D ati_remote2.o
 obj-$(CONFIG_INPUT_ATLAS_BTNS)		+=3D atlas_btns.o
diff --git a/drivers/input/misc/ariel-pwrbutton.c b/drivers/input/misc/ar=
iel-pwrbutton.c
new file mode 100644
index 0000000000000..502bc6a65f657
--- /dev/null
+++ b/drivers/input/misc/ariel-pwrbutton.c
@@ -0,0 +1,165 @@
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
+#define RESP_COUNTER(response)	(response.header & 0x3)
+#define RESP_SIZE(response)	((response.header >> 2) & 0x3)
+#define RESP_TYPE(response)	((response.header >> 4) & 0xf)
+
+struct ec_input_response {
+	u8 reserved;
+	u8 header;
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
+	u8 read_request[] =3D { 0x00, 0x5a, 0xa5, 0x00, 0x00 };
+	struct spi_device *spi =3D priv->client;
+	struct spi_transfer t =3D {
+		.tx_buf =3D read_request,
+		.rx_buf =3D response,
+		.len =3D sizeof(read_request),
+	};
+
+	compiletime_assert(sizeof(read_request) =3D=3D sizeof(*response),
+			   "SPI xfer request/response size mismatch");
+
+	return spi_sync_transfer(spi, &t, 1);
+}
+
+static irqreturn_t ec_input_interrupt(int irq, void *dev_id)
+{
+	struct ariel_pwrbutton *priv =3D dev_id;
+	struct spi_device *spi =3D priv->client;
+	struct ec_input_response response;
+	int i;
+
+	if (ec_input_read(priv, &response) < 0) {
+		dev_err(&spi->dev, "EC read failed.\n");
+		return IRQ_HANDLED;
+	}
+
+	if (priv->msg_counter =3D=3D RESP_COUNTER(response)) {
+		dev_warn(&spi->dev, "No new data to read?\n");
+		return IRQ_HANDLED;
+	}
+
+	priv->msg_counter =3D RESP_COUNTER(response);
+
+	if (RESP_TYPE(response) !=3D 0x3 && RESP_TYPE(response) !=3D 0xc) {
+		dev_dbg(&spi->dev, "Ignoring message that's not kbd data\n");
+		return IRQ_HANDLED;
+	}
+
+	for (i =3D 0; i < RESP_SIZE(response); i++) {
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
+	priv =3D devm_kzalloc(&spi->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client =3D spi;
+	spi_set_drvdata(spi, priv);
+
+	priv->input =3D devm_input_allocate_device(&spi->dev);
+	if (!priv->input)
+		return -ENOMEM;
+	priv->input->name =3D "Power Button";
+	priv->input->dev.parent =3D &spi->dev;
+	input_set_capability(priv->input, EV_KEY, KEY_POWER);
+	ret =3D input_register_device(priv->input);
+	if (ret) {
+		dev_err(&spi->dev, "error registering input device: %d\n", ret);
+		return ret;
+	}
+
+	ret =3D ec_input_read(priv, &response);
+	if (ret < 0) {
+		dev_err(&spi->dev, "EC read failed: %d\n", ret);
+		return ret;
+	}
+	priv->msg_counter =3D RESP_COUNTER(response);
+
+	ret =3D devm_request_threaded_irq(&spi->dev, spi->irq, NULL,
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
+static const struct of_device_id ariel_pwrbutton_of_match[] =3D {
+	{ .compatible =3D "dell,wyse-ariel-ec-input" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ariel_pwrbutton_of_match);
+
+static const struct spi_device_id ariel_pwrbutton_id_table[] =3D {
+	{ "wyse-ariel-ec-input", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(spi, ariel_pwrbutton_id_table);
+
+static struct spi_driver ariel_pwrbutton_driver =3D {
+	.driver =3D {
+		.name =3D "dell-wyse-ariel-ec-input",
+		.of_match_table =3D ariel_pwrbutton_of_match,
+	},
+	.probe =3D ariel_pwrbutton_probe,
+};
+module_spi_driver(ariel_pwrbutton_driver);
+
+MODULE_AUTHOR("Lubomir Rintel <lkundrak@v3.sk>");
+MODULE_DESCRIPTION("Dell Wyse 3020 Power Button Input Driver");
+MODULE_LICENSE("Dual BSD/GPL");
--=20
2.28.0

