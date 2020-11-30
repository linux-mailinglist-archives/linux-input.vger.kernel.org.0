Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D50E2C88B5
	for <lists+linux-input@lfdr.de>; Mon, 30 Nov 2020 16:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727758AbgK3P4d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Nov 2020 10:56:33 -0500
Received: from mail.v3.sk ([167.172.186.51]:47294 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727767AbgK3P4a (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Nov 2020 10:56:30 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id BC50FE06E1;
        Mon, 30 Nov 2020 15:52:52 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id KeiXWeDLxPcx; Mon, 30 Nov 2020 15:52:52 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 1020EE06C5;
        Mon, 30 Nov 2020 15:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id aEQF7agQduk1; Mon, 30 Nov 2020 15:52:51 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id C246AE0701;
        Mon, 30 Nov 2020 15:52:51 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v3 2/2] Input: add driver for power button on Dell Wyse 3020
Date:   Mon, 30 Nov 2020 16:55:37 +0100
Message-Id: <20201130155537.1665091-3-lkundrak@v3.sk>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201130155537.1665091-1-lkundrak@v3.sk>
References: <20201130155537.1665091-1-lkundrak@v3.sk>
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
Changes since v2:
(All by the suggestions of Dmitry Torokhov. Thank you Dmitry!)
- Add more includes
- Make ariel_pwrbutton.msg_counter not a bitfield
- Include an error code in error message when ec_input_read() fails in
  the interrupt handler.
- Return from the interrupt handler from a single point.
- Remove a forgotten debug statement.
- s/ret/error/
- Return -EINVAL instead of -ENXIO when the IRQ line is not specified.
- Don't hardcode rising edge trigger, rely on DT instead
- Remove a banner print at the end of probe().

Changes since v1:
- Do away bitfields in order to be endian independent

 drivers/input/misc/Kconfig           |  11 ++
 drivers/input/misc/Makefile          |   1 +
 drivers/input/misc/ariel-pwrbutton.c | 169 +++++++++++++++++++++++++++
 3 files changed, 181 insertions(+)
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
index 0000000000000..eda86ab552b9c
--- /dev/null
+++ b/drivers/input/misc/ariel-pwrbutton.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: BSD-2-Clause OR GPL-2.0-or-later
+/*
+ * Dell Wyse 3020 a.k.a. "Ariel" Power Button Driver
+ *
+ * Copyright (C) 2020 Lubomir Rintel
+ */
+
+#include <linux/device.h>
+#include <linux/gfp.h>
+#include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/spi/spi.h>
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
+	u8 msg_counter;
+};
+
+static int ec_input_read(struct ariel_pwrbutton *priv,
+			 struct ec_input_response *response)
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
+	int error;
+	int i;
+
+	error =3D ec_input_read(priv, &response);
+	if (error < 0) {
+		dev_err(&spi->dev, "EC read failed: %d\n", error);
+		goto out;
+	}
+
+	if (priv->msg_counter =3D=3D RESP_COUNTER(response)) {
+		dev_warn(&spi->dev, "No new data to read?\n");
+		goto out;
+	}
+
+	priv->msg_counter =3D RESP_COUNTER(response);
+
+	if (RESP_TYPE(response) !=3D 0x3 && RESP_TYPE(response) !=3D 0xc) {
+		dev_dbg(&spi->dev, "Ignoring message that's not kbd data\n");
+		goto out;
+	}
+
+	for (i =3D 0; i < RESP_SIZE(response); i++) {
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
+out:
+	return IRQ_HANDLED;
+}
+
+static int ariel_pwrbutton_probe(struct spi_device *spi)
+{
+	struct ec_input_response response;
+	struct ariel_pwrbutton *priv;
+	int error;
+
+	if (!spi->irq) {
+		dev_err(&spi->dev, "Missing IRQ.\n");
+		return -EINVAL;
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
+	error =3D input_register_device(priv->input);
+	if (error) {
+		dev_err(&spi->dev, "error registering input device: %d\n", error);
+		return error;
+	}
+
+	error =3D ec_input_read(priv, &response);
+	if (error < 0) {
+		dev_err(&spi->dev, "EC read failed: %d\n", error);
+		return error;
+	}
+	priv->msg_counter =3D RESP_COUNTER(response);
+
+	error =3D devm_request_threaded_irq(&spi->dev, spi->irq, NULL,
+					  ec_input_interrupt,
+					  IRQF_ONESHOT,
+					  "Ariel EC Input", priv);
+
+	if (error) {
+		dev_err(&spi->dev, "Failed to request IRQ %d: %d\n",
+			spi->irq, error);
+		return error;
+	}
+
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

