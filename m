Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 282D8402DE0
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 19:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344308AbhIGRp1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 13:45:27 -0400
Received: from mail-4319.protonmail.ch ([185.70.43.19]:30877 "EHLO
        mail-4319.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344686AbhIGRpU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 13:45:20 -0400
Date:   Tue, 07 Sep 2021 17:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1631036649;
        bh=0Fxs8sLYoTH3P+jePaOb8FpwRsn8e6W6wUGgPlZz97Q=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=YnyIMqAFzFqQWueHuGpSEPnW18PQDIU6LrkGJ++pMJ5P84rqD9vReyAc42TbheWur
         tgB6QGtC6+YunklDe8puQsZpCjAGruuDbehnkI04YArl+ZEeLBEy97JKyLUbeFW85M
         frxQgdZuJJdXXlSgEOFp7tEsngbrNl5j9pNnw6Q0=
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH v4 1/2] Input: cypress-sf - Add Cypress StreetFighter touchkey driver
Message-ID: <20210907174341.422013-2-y.oudjana@protonmail.com>
In-Reply-To: <20210907174341.422013-1-y.oudjana@protonmail.com>
References: <20210907174341.422013-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds support for Cypress StreetFighter touchkey controllers such
as sf3155. This driver supports managing regulators and generating
input events.

Due to lack of documentation, this driver is entirely based on
information gathered from a driver written for an old Android kernel
fork[1][2].

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

[1] https://github.com/LineageOS/android_kernel_xiaomi_msm8996/blob/lineage=
-18.1/drivers/input/touchscreen/cyttsp_button.c
[2] https://github.com/LineageOS/android_kernel_xiaomi_msm8996/blob/lineage=
-18.1/arch/arm/boot/dts/qcom/a4-msm8996-mtp.dtsi#L291-L314
---
Changes since v3:
 - Use device_property_read_u32_array to read keycodes.
 - Read status register into integer first to check for errors.
 - Use bitmap_xor and for_each_set_bit to check for key state changes.
 - More code style fixes.
 - Add MAINTAINERS entry.
Changes since v2:
 - Code style fixes.
 - Added copyright statement.
Changes since v1:
 - Changed version variables in probe to int to allow storing error codes.

 MAINTAINERS                         |   6 +
 drivers/input/keyboard/Kconfig      |  10 ++
 drivers/input/keyboard/Makefile     |   1 +
 drivers/input/keyboard/cypress-sf.c | 219 ++++++++++++++++++++++++++++
 4 files changed, 236 insertions(+)
 create mode 100644 drivers/input/keyboard/cypress-sf.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5a61cb2d0cd4..0e6ce2b71829 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5123,6 +5123,12 @@ L:=09linux-input@vger.kernel.org
 S:=09Maintained
 F:=09drivers/input/touchscreen/cy8ctma140.c
=20
+CYPRESS STREETFIGHTER TOUCHKEYS DRIVER
+M:=09Yassine Oudjana <y.oudjana@protonmail.com>
+L:=09linux-input@vger.kernel.org
+S:=09Maintained
+F:=09drivers/input/keyboard/cypress-sf.c
+
 CYTTSP TOUCHSCREEN DRIVER
 M:=09Linus Walleij <linus.walleij@linaro.org>
 L:=09linux-input@vger.kernel.org
diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfi=
g
index e75650e98c9e..0c607da9ee10 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -788,4 +788,14 @@ config KEYBOARD_MTK_PMIC
 =09  To compile this driver as a module, choose M here: the
 =09  module will be called pmic-keys.
=20
+config KEYBOARD_CYPRESS_SF
+=09tristate "Cypress StreetFighter touchkey support"
+=09depends on I2C
+=09help
+=09  Say Y here if you want to enable support for Cypress StreetFighter
+=09  touchkeys.
+
+=09  To compile this driver as a module, choose M here: the
+=09  module will be called cypress-sf.
+
 endif
diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makef=
ile
index 1d689fdd5c00..e3c8648f834e 100644
--- a/drivers/input/keyboard/Makefile
+++ b/drivers/input/keyboard/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_KEYBOARD_BCM)=09=09+=3D bcm-keypad.o
 obj-$(CONFIG_KEYBOARD_CAP11XX)=09=09+=3D cap11xx.o
 obj-$(CONFIG_KEYBOARD_CLPS711X)=09=09+=3D clps711x-keypad.o
 obj-$(CONFIG_KEYBOARD_CROS_EC)=09=09+=3D cros_ec_keyb.o
+obj-$(CONFIG_KEYBOARD_CYPRESS_SF)=09+=3D cypress-sf.o
 obj-$(CONFIG_KEYBOARD_DAVINCI)=09=09+=3D davinci_keyscan.o
 obj-$(CONFIG_KEYBOARD_DLINK_DIR685)=09+=3D dlink-dir685-touchkeys.o
 obj-$(CONFIG_KEYBOARD_EP93XX)=09=09+=3D ep93xx_keypad.o
diff --git a/drivers/input/keyboard/cypress-sf.c b/drivers/input/keyboard/c=
ypress-sf.c
new file mode 100644
index 000000000000..dbd5d627f863
--- /dev/null
+++ b/drivers/input/keyboard/cypress-sf.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Cypress StreetFighter Touchkey Driver
+ *
+ * Copyright (c) 2021 Yassine Oudjana <y.oudjana@protonmail.com>
+ */
+
+#include <linux/bitmap.h>
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/regulator/consumer.h>
+
+#define CYPRESS_SF_DEV_NAME "cypress-sf"
+
+#define CYPRESS_SF_REG_BUTTON_STATUS=090x4a
+
+struct cypress_sf_data {
+=09struct i2c_client *client;
+=09struct input_dev *input_dev;
+=09struct regulator_bulk_data regulators[2];
+=09u32 *keycodes;
+=09unsigned long keystates;
+=09int num_keys;
+};
+
+static irqreturn_t cypress_sf_irq_handler(int irq, void *devid)
+{
+=09struct cypress_sf_data *touchkey =3D devid;
+=09unsigned long keystates, changed;
+=09bool new_state;
+=09int val, key;
+
+=09val =3D i2c_smbus_read_byte_data(touchkey->client,
+=09=09=09=09=09CYPRESS_SF_REG_BUTTON_STATUS);
+=09if (val < 0) {
+=09=09dev_err(&touchkey->client->dev, "Failed to read button status: %d",
+=09=09=09val);
+=09=09return IRQ_NONE;
+=09}
+=09keystates =3D val;
+
+=09bitmap_xor(&changed, &keystates, &touchkey->keystates,
+=09=09   touchkey->num_keys);
+
+=09for_each_set_bit(key, &changed, touchkey->num_keys) {
+=09=09new_state =3D keystates & BIT(key);
+=09=09dev_dbg(&touchkey->client->dev,
+=09=09=09=09"Key %d changed to %d", key, new_state);
+=09=09input_report_key(touchkey->input_dev,
+=09=09=09=09touchkey->keycodes[key],
+=09=09=09=09new_state);
+=09}
+
+=09input_sync(touchkey->input_dev);
+=09touchkey->keystates =3D keystates;
+
+=09return IRQ_HANDLED;
+}
+
+static int cypress_sf_probe(struct i2c_client *client,
+=09=09=09=09const struct i2c_device_id *id)
+{
+=09struct cypress_sf_data *touchkey;
+=09int key, error;
+
+=09touchkey =3D devm_kzalloc(&client->dev, sizeof(*touchkey), GFP_KERNEL);
+=09if (!touchkey)
+=09=09return -ENOMEM;
+
+=09touchkey->client =3D client;
+=09i2c_set_clientdata(client, touchkey);
+
+=09touchkey->regulators[0].supply =3D "vdd";
+=09touchkey->regulators[1].supply =3D "avdd";
+
+=09error =3D devm_regulator_bulk_get(&client->dev,
+=09=09=09=09=09ARRAY_SIZE(touchkey->regulators),
+=09=09=09=09=09touchkey->regulators);
+=09if (error) {
+=09=09dev_err(&client->dev, "Failed to get regulators: %d\n", error);
+=09=09return error;
+=09}
+
+=09touchkey->num_keys =3D device_property_read_u32_array(&client->dev,
+=09=09=09=09=09=09"linux,keycodes", NULL, 0);
+=09if (touchkey->num_keys < 0) {
+=09=09/* Default key count */
+=09=09touchkey->num_keys =3D 2;
+=09}
+
+=09touchkey->keycodes =3D devm_kzalloc(&client->dev,
+=09=09=09=09sizeof(u32) * touchkey->num_keys, GFP_KERNEL);
+=09if (!touchkey->keycodes)
+=09=09return -ENOMEM;
+
+=09error =3D device_property_read_u32_array(&client->dev, "linux,keycodes"=
,
+=09=09=09=09=09=09touchkey->keycodes,
+=09=09=09=09=09=09touchkey->num_keys);
+
+=09if (error) {
+=09=09dev_warn(&client->dev,
+=09=09=09"Failed to read keycodes: %d, using defaults\n", error);
+
+=09=09/* Default keycodes */
+=09=09touchkey->keycodes[0] =3D KEY_BACK;
+=09=09touchkey->keycodes[1] =3D KEY_MENU;
+=09}
+
+=09error =3D regulator_bulk_enable(ARRAY_SIZE(touchkey->regulators),
+=09=09=09=09=09touchkey->regulators);
+=09if (error) {
+=09=09dev_err(&client->dev, "Failed to enable regulators: %d\n", error);
+=09=09return error;
+=09}
+
+=09touchkey->input_dev =3D devm_input_allocate_device(&client->dev);
+=09if (!touchkey->input_dev) {
+=09=09dev_err(&client->dev, "Failed to allocate input device\n");
+=09=09return -ENOMEM;
+=09}
+
+=09touchkey->input_dev->name =3D CYPRESS_SF_DEV_NAME;
+=09touchkey->input_dev->id.bustype =3D BUS_I2C;
+
+=09for (key =3D 0; key < touchkey->num_keys; ++key)
+=09=09input_set_capability(touchkey->input_dev, EV_KEY,
+=09=09=09=09=09touchkey->keycodes[key]);
+
+=09error =3D input_register_device(touchkey->input_dev);
+=09if (error) {
+=09=09dev_err(&client->dev,
+=09=09=09"Failed to register input device: %d\n", error);
+=09=09return error;
+=09}
+
+=09error =3D devm_request_threaded_irq(&client->dev, client->irq,
+=09=09=09=09=09NULL, cypress_sf_irq_handler,
+=09=09=09=09=09IRQF_ONESHOT,
+=09=09=09=09=09CYPRESS_SF_DEV_NAME, touchkey);
+=09if (error) {
+=09=09dev_err(&client->dev,
+=09=09=09"Failed to register threaded irq: %d", error);
+=09=09return error;
+=09}
+
+=09return 0;
+};
+
+static int __maybe_unused cypress_sf_suspend(struct device *dev)
+{
+=09struct i2c_client *client =3D to_i2c_client(dev);
+=09struct cypress_sf_data *touchkey =3D i2c_get_clientdata(client);
+=09int error;
+
+=09disable_irq(client->irq);
+=09error =3D regulator_bulk_disable(ARRAY_SIZE(touchkey->regulators),
+=09=09=09=09=09touchkey->regulators);
+=09if (error) {
+=09=09dev_err(dev, "Failed to disable regulators: %d", error);
+=09=09enable_irq(client->irq);
+=09=09return error;
+=09}
+=09dev_dbg(dev, "Suspended device");
+
+=09return 0;
+}
+
+static int __maybe_unused cypress_sf_resume(struct device *dev)
+{
+=09struct i2c_client *client =3D to_i2c_client(dev);
+=09struct cypress_sf_data *touchkey =3D i2c_get_clientdata(client);
+=09int error;
+
+=09error =3D regulator_bulk_enable(ARRAY_SIZE(touchkey->regulators),
+=09=09=09=09=09touchkey->regulators);
+=09if (error) {
+=09=09dev_err(dev, "Failed to enable regulators: %d", error);
+=09=09return error;
+=09}
+=09enable_irq(client->irq);
+=09dev_dbg(dev, "Resumed device");
+
+=09return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(cypress_sf_pm_ops,
+=09=09=09 cypress_sf_suspend, cypress_sf_resume);
+
+static struct i2c_device_id cypress_sf_id_table[] =3D {
+=09{ CYPRESS_SF_DEV_NAME, 0 },
+=09{ }
+};
+MODULE_DEVICE_TABLE(i2c, cypress_sf_id_table);
+
+static const struct of_device_id cypress_sf_of_match[] =3D {
+=09{ .compatible =3D "cypress,sf3155", },
+=09{ },
+};
+MODULE_DEVICE_TABLE(of, cypress_sf_of_match);
+
+static struct i2c_driver cypress_sf_driver =3D {
+=09.driver =3D {
+=09=09.name =3D CYPRESS_SF_DEV_NAME,
+=09=09.pm =3D &cypress_sf_pm_ops,
+=09=09.of_match_table =3D of_match_ptr(cypress_sf_of_match),
+=09},
+=09.id_table =3D cypress_sf_id_table,
+=09.probe =3D cypress_sf_probe,
+};
+module_i2c_driver(cypress_sf_driver);
+
+MODULE_AUTHOR("Yassine Oudjana <y.oudjana@protonmail.com>");
+MODULE_DESCRIPTION("Cypress StreetFighter Touchkey Driver");
+MODULE_LICENSE("GPL v2");
--=20
2.33.0


