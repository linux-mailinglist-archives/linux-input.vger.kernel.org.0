Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D454025DD
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 11:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244725AbhIGJC6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 05:02:58 -0400
Received: from mail-4319.protonmail.ch ([185.70.43.19]:37799 "EHLO
        mail-4319.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245159AbhIGJC4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 05:02:56 -0400
Date:   Tue, 07 Sep 2021 09:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1631005283;
        bh=VX4z0nZhRbkOu8FN8dekK+/P0JFwsoSYZ5ci1w9PVKo=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=KWUCZsCVchTrT743cdlTDPBkyQpp6BQ1w9bS6ePycJ1VXk2m53/t/OzCSp8tXWYN4
         ZYbfXUDGDu+N1Bz+V8++Hkvu2Qdm4nsDnmA1WglhVh4keALxMgTXfqtrFSFriAJNmI
         DmCwYkGmoG2NMg9/px463M1wrTdiDDXflBMGNQ48=
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH v3 1/2] Input: cypress-sf - Add Cypress StreetFighter touchkey driver
Message-ID: <SO32ZQ.ZZ96JBE1E2N91@protonmail.com>
In-Reply-To: <YTW1zso4zW4RC6N0@google.com>
References: <20210901165231.236728-1-y.oudjana@protonmail.com> <20210901165231.236728-2-y.oudjana@protonmail.com> <YTW1zso4zW4RC6N0@google.com>
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



On Mon, Sep 6 2021 at 10:31:42 +0400, Dmitry Torokhov=20
<dmitry.torokhov@gmail.com> wrote:
> Hi Yassine,
>=20
> On Wed, Sep 01, 2021 at 04:52:58PM +0000, Yassine Oudjana wrote:
>>  This adds support for Cypress StreetFighter touchkey controllers=20
>> such as sf3155.
>>  This driver supports managing regulators and generating input=20
>> events.
>>=20
>>  Due to lack of documentation, this driver is entirely based on=20
>> information
>>  gathered from a driver written for an old Android kernel fork[1][2].
>>=20
>>  Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>=20
> Thank you for the patch. Please run your patches through=20
> checkpatch.pl.

Sure.

> See additional comments below.
>=20
>=20
>>=20
>>  [1]=20
>> https://github.com/LineageOS/android_kernel_xiaomi_msm8996/blob/lineage-=
18.1/drivers/input/touchscreen/cyttsp_button.c
>>  [2]=20
>> https://github.com/LineageOS/android_kernel_xiaomi_msm8996/blob/lineage-=
18.1/arch/arm/boot/dts/qcom/a4-msm8996-mtp.dtsi#L291-L314
>>  ---
>>  Changes since v2:
>>   - Code style fixes.
>>   - Added copyright statement.
>>  Changes since v1:
>>   - Changed version variables in probe to int to allow storing error=20
>> codes.
>>=20
>>   drivers/input/keyboard/Kconfig      |  10 ++
>>   drivers/input/keyboard/Makefile     |   1 +
>>   drivers/input/keyboard/cypress-sf.c | 223=20
>> ++++++++++++++++++++++++++++
>>   3 files changed, 234 insertions(+)
>>   create mode 100644 drivers/input/keyboard/cypress-sf.c
>>=20
>>  diff --git a/drivers/input/keyboard/Kconfig=20
>> b/drivers/input/keyboard/Kconfig
>>  index 40a070a2e7f5..6f3fbea8b803 100644
>>  --- a/drivers/input/keyboard/Kconfig
>>  +++ b/drivers/input/keyboard/Kconfig
>>  @@ -788,4 +788,14 @@ config KEYBOARD_MTK_PMIC
>>   =09  To compile this driver as a module, choose M here: the
>>   =09  module will be called pmic-keys.
>>=20
>>  +config KEYBOARD_CYPRESS_SF
>>  +=09tristate "Cypress StreetFighter touchkey support"
>>  +=09depends on I2C
>>  +=09help
>>  +=09  Say Y here if you want to enable support for Cypress=20
>> StreetFighter
>>  +=09  touchkeys.
>>  +
>>  +=09  To compile this driver as a module, choose M here: the
>>  +=09  module will be called cypress-sf.
>>  +
>>   endif
>>  diff --git a/drivers/input/keyboard/Makefile=20
>> b/drivers/input/keyboard/Makefile
>>  index 1d689fdd5c00..e3c8648f834e 100644
>>  --- a/drivers/input/keyboard/Makefile
>>  +++ b/drivers/input/keyboard/Makefile
>>  @@ -17,6 +17,7 @@ obj-$(CONFIG_KEYBOARD_BCM)=09=09+=3D bcm-keypad.o
>>   obj-$(CONFIG_KEYBOARD_CAP11XX)=09=09+=3D cap11xx.o
>>   obj-$(CONFIG_KEYBOARD_CLPS711X)=09=09+=3D clps711x-keypad.o
>>   obj-$(CONFIG_KEYBOARD_CROS_EC)=09=09+=3D cros_ec_keyb.o
>>  +obj-$(CONFIG_KEYBOARD_CYPRESS_SF)=09+=3D cypress-sf.o
>>   obj-$(CONFIG_KEYBOARD_DAVINCI)=09=09+=3D davinci_keyscan.o
>>   obj-$(CONFIG_KEYBOARD_DLINK_DIR685)=09+=3D dlink-dir685-touchkeys.o
>>   obj-$(CONFIG_KEYBOARD_EP93XX)=09=09+=3D ep93xx_keypad.o
>>  diff --git a/drivers/input/keyboard/cypress-sf.c=20
>> b/drivers/input/keyboard/cypress-sf.c
>>  new file mode 100644
>>  index 000000000000..f2862547f633
>>  --- /dev/null
>>  +++ b/drivers/input/keyboard/cypress-sf.c
>>  @@ -0,0 +1,223 @@
>>  +// SPDX-License-Identifier: GPL-2.0-only
>>  +/*
>>  + * Cypress StreetFighter Touchkey Driver
>>  + *
>>  + * Copyright (c) 2021 Yassine Oudjana <y.oudjana@protonmail.com>
>>  + */
>>  +
>>  +#include <linux/bitops.h>
>>  +#include <linux/device.h>
>>  +#include <linux/i2c.h>
>>  +#include <linux/input.h>
>>  +#include <linux/interrupt.h>
>>  +#include <linux/module.h>
>>  +#include <linux/pm.h>
>>  +#include <linux/regulator/consumer.h>
>>  +
>>  +#define CYPRESS_SF_DEV_NAME "cypress-sf"
>>  +
>>  +#define CYPRESS_SF_REG_FW_VERSION=090x46
>>  +#define CYPRESS_SF_REG_HW_VERSION=090x48
>>  +#define CYPRESS_SF_REG_BUTTON_STATUS=090x4a
>>  +
>>  +struct cypress_sf_data {
>>  +=09struct i2c_client *client;
>>  +=09struct input_dev *input_dev;
>>  +=09struct regulator_bulk_data regulators[2];
>>  +=09u32 *keycodes;
>>  +=09unsigned long keystates;
>>  +=09int num_keys;
>>  +};
>>  +
>>  +static irqreturn_t cypress_sf_irq_handler(int irq, void *devid)
>>  +{
>>  +=09struct cypress_sf_data *touchkey =3D devid;
>>  +=09unsigned long keystates;
>>  +=09bool curr_state, new_state;
>>  +=09int key;
>>  +
>>  +=09keystates =3D i2c_smbus_read_byte_data(touchkey->client,
>>  +=09=09=09=09=09CYPRESS_SF_REG_BUTTON_STATUS);
>>  +=09if (keystates < 0) {
>=20
> keystates is declared as unsigned, so this condition will never=20
> trigger.

Right. I'll change it.

>=20
>>  +=09=09dev_err(&touchkey->client->dev, "Failed to read button status");
>>  +=09=09return IRQ_NONE;
>>  +=09}
>>  +
>>  +=09for(key =3D 0; key < touchkey->num_keys; ++key) {
>>  +=09=09curr_state =3D test_bit(key, &touchkey->keystates);
>>  +=09=09new_state =3D test_bit(key, &keystates);
>>  +
>>  +=09=09if(curr_state ^ new_state) {
>=20
> Instead of this please do
>=20
> =09bitmap_xor(&changed, &keystates, &touchkey->keystates,
> =09=09   touchkey->num_keys);
> =09for_each_set_bit(key, &changed, touchkey->num_keys) {
> =09=09...
> =09}
>=20

Noted.

>>  +=09=09=09dev_dbg(&touchkey->client->dev,\
>>  +=09=09=09=09"Key %d changed to %d", key, new_state);
>>  +=09=09=09input_report_key(touchkey->input_dev,
>>  +=09=09=09=09=09touchkey->keycodes[key],
>>  +=09=09=09=09=09new_state);
>>  +=09=09}
>>  +=09}
>>  +=09input_sync(touchkey->input_dev);
>>  +=09touchkey->keystates =3D keystates;
>>  +
>>  +=09return IRQ_HANDLED;
>>  +}
>>  +
>>  +static int cypress_sf_probe(struct i2c_client *client,
>>  +=09=09=09=09const struct i2c_device_id *id)
>>  +{
>>  +=09struct cypress_sf_data *touchkey;
>>  +=09int hw_version, fw_version;
>>  +=09int i, ret;
>>  +
>>  +=09touchkey =3D devm_kzalloc(&client->dev, sizeof(*touchkey),=20
>> GFP_KERNEL);
>>  +=09if(!touchkey)
>>  +=09=09return -ENOMEM;
>>  +
>>  +=09touchkey->client =3D client;
>>  +=09i2c_set_clientdata(client, touchkey);
>>  +
>>  +=09touchkey->regulators[0].supply =3D "vdd";
>>  +=09touchkey->regulators[1].supply =3D "avdd";
>>  +
>>  +=09ret =3D devm_regulator_bulk_get(&client->dev,
>>  +=09=09=09=09=09ARRAY_SIZE(touchkey->regulators),
>>  +=09=09=09=09=09touchkey->regulators);
>>  +=09if(ret) {
>>  +=09=09dev_err(&client->dev, "Failed to get regulators: %d\n", ret);
>>  +=09=09return ret;
>>  +=09}
>>  +
>>  +=09touchkey->num_keys =3D=20
>> of_property_count_elems_of_size(client->dev.of_node,
>>  +=09=09=09=09=09=09=09"linux,keycodes",
>>  +=09=09=09=09=09=09=09sizeof(u32));
>=20
> Please use device_property_* API instead of of_property_*.

Noted.

>>  +=09if(touchkey->num_keys < 0)
>>  +=09=09/* Default key count */
>>  +=09=09touchkey->num_keys =3D 2;
>>  +
>>  +=09touchkey->keycodes =3D devm_kzalloc(&client->dev,
>>  +=09=09=09=09sizeof(u32) * touchkey->num_keys, GFP_KERNEL);
>>  +=09if(!touchkey->keycodes)
>>  +=09=09return -ENOMEM;
>>  +
>>  +=09ret =3D of_property_read_u32_array(client->dev.of_node,=20
>> "linux,keycodes",
>>  +=09=09=09=09=09=09touchkey->keycodes, touchkey->num_keys);
>>  +
>>  +=09if(touchkey->num_keys < 0) {
>>  +=09=09/* Default keycodes */
>>  +=09=09touchkey->keycodes[0] =3D KEY_BACK;
>>  +=09=09touchkey->keycodes[1] =3D KEY_MENU;
>>  +=09}
>>  +
>>  +=09ret =3D regulator_bulk_enable(ARRAY_SIZE(touchkey->regulators),
>>  +=09=09=09=09=09touchkey->regulators);
>=20
> Please call variables that carry error core or 0 for success 'error'.

I'll rename them.

>=20
>>  +=09if(ret) {
>>  +=09=09dev_err(&client->dev, "Failed to enable regulators: %d\n", ret);
>>  +=09=09return ret;
>>  +=09}
>>  +
>>  +=09touchkey->input_dev =3D devm_input_allocate_device(&client->dev);
>>  +=09if(!touchkey->input_dev) {
>>  +=09=09dev_err(&client->dev, "Failed to allocate input device\n");
>>  +=09=09return -ENOMEM;
>>  +=09}
>>  +
>>  +=09touchkey->input_dev->name =3D CYPRESS_SF_DEV_NAME;
>>  +=09touchkey->input_dev->id.bustype =3D BUS_I2C;
>>  +
>>  +=09hw_version =3D i2c_smbus_read_byte_data(touchkey->client,
>>  +=09=09=09=09CYPRESS_SF_REG_HW_VERSION);
>>  +=09fw_version =3D i2c_smbus_read_word_data(touchkey->client,
>>  +=09=09=09=09CYPRESS_SF_REG_FW_VERSION);
>>  +=09if(hw_version < 0 || fw_version < 0)
>>  +=09=09dev_warn(&client->dev, "Failed to read versions\n");
>>  +=09else
>>  +=09=09dev_info(&client->dev, "HW version %d, FW version %d\n",
>>  +=09=09=09=09hw_version, fw_version);
>=20
> Why is this needed?

I was using it as an indicator for success finding the chip, but it=20
isn't
strictly needed. I'll remove it.

>=20
>>  +
>>  +=09for(i =3D 0; i < touchkey->num_keys; ++i)
>>  +=09=09input_set_capability(touchkey->input_dev, EV_KEY,
>>  +=09=09=09=09=09touchkey->keycodes[i]);
>>  +
>>  +=09ret =3D input_register_device(touchkey->input_dev);
>>  +=09if(ret) {
>>  +=09=09dev_err(&client->dev,
>>  +=09=09=09"Failed to register input device: %d\n", ret);
>>  +=09=09return ret;
>>  +=09}
>>  +
>>  +=09ret =3D devm_request_threaded_irq(&client->dev, client->irq,
>>  +=09=09=09=09=09NULL, cypress_sf_irq_handler,
>>  +=09=09=09=09=09IRQF_ONESHOT,
>>  +=09=09=09=09=09CYPRESS_SF_DEV_NAME, touchkey);
>>  +=09if(ret) {
>>  +=09=09dev_err(&client->dev,
>>  +=09=09=09"Failed to register threaded irq: %d", ret);
>>  +=09=09return ret;
>>  +=09}
>>  +
>>  +=09return 0;
>>  +};
>>  +
>>  +static int __maybe_unused cypress_sf_suspend(struct device *dev) {
>>  +=09struct i2c_client *client =3D to_i2c_client(dev);
>>  +=09struct cypress_sf_data *touchkey =3D i2c_get_clientdata(client);
>>  +=09int ret;
>>  +
>>  +=09disable_irq(client->irq);
>>  +=09ret =3D regulator_bulk_disable(ARRAY_SIZE(touchkey->regulators),
>>  +=09=09=09=09=09touchkey->regulators);
>>  +=09if(ret) {
>>  +=09=09dev_err(dev, "Failed to disable regulators: %d", ret);
>>  +=09=09enable_irq(client->irq);
>>  +=09=09return ret;
>>  +=09}
>>  +=09dev_dbg(dev, "Suspended device");
>>  +
>>  +=09return 0;
>>  +}
>>  +
>>  +static int __maybe_unused cypress_sf_resume(struct device *dev) {
>>  +=09struct i2c_client *client =3D to_i2c_client(dev);
>>  +=09struct cypress_sf_data *touchkey =3D i2c_get_clientdata(client);
>>  +=09int ret;
>>  +
>>  +=09ret =3D regulator_bulk_enable(ARRAY_SIZE(touchkey->regulators),
>>  +=09=09=09=09=09touchkey->regulators);
>>  +=09if(ret) {
>>  +=09=09dev_err(dev, "Failed to enable regulators: %d", ret);
>>  +=09=09return ret;
>>  +=09}
>>  +=09enable_irq(client->irq);
>>  +=09dev_dbg(dev, "Resumed device");
>>  +
>>  +=09return 0;
>>  +}
>>  +
>>  +static SIMPLE_DEV_PM_OPS(cypress_sf_pm_ops,
>>  +=09=09=09 cypress_sf_suspend, cypress_sf_resume);
>>  +
>>  +static struct i2c_device_id cypress_sf_id_table[] =3D {
>>  +=09{ CYPRESS_SF_DEV_NAME, 0 },
>>  +=09{ }
>>  +};
>>  +MODULE_DEVICE_TABLE(i2c, cypress_sf_id_table);
>>  +
>>  +static const struct of_device_id cypress_sf_of_match[] =3D {
>>  +=09{ .compatible =3D "cypress,sf3155", },
>>  +=09{ },
>>  +};
>>  +MODULE_DEVICE_TABLE(of, cypress_sf_of_match);
>>  +
>>  +static struct i2c_driver cypress_sf_driver =3D {
>>  +=09.driver =3D {
>>  +=09=09.name =3D CYPRESS_SF_DEV_NAME,
>>  +=09=09.pm =3D &cypress_sf_pm_ops,
>>  +=09=09.of_match_table =3D of_match_ptr(cypress_sf_of_match),
>>  +=09},
>>  +=09.id_table =3D cypress_sf_id_table,
>>  +=09.probe =3D cypress_sf_probe,
>>  +};
>>  +module_i2c_driver(cypress_sf_driver);
>>  +
>>  +MODULE_AUTHOR("Yassine Oudjana <y.oudjana@protonmail.com>");
>>  +MODULE_DESCRIPTION("Cypress StreetFighter Touchkey Driver");
>>  +MODULE_LICENSE("GPL v2");
>>  --
>>  2.33.0
>>=20
>>=20
>=20
> Thanks.
>=20
> --
> Dmitry

Thanks for the review!
Yassine



