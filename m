Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDF4375328
	for <lists+linux-input@lfdr.de>; Thu,  6 May 2021 13:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhEFLqi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 May 2021 07:46:38 -0400
Received: from mail-40131.protonmail.ch ([185.70.40.131]:28059 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbhEFLqi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 May 2021 07:46:38 -0400
Date:   Thu, 06 May 2021 11:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1620301538;
        bh=3u9w0S02lElumc849S027sGDoyNBcaYpLiQcA89EfZk=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=A35m4WykM6URjvkR/VJjwTCx+lgPYzNxMm7rBLd2ojikEDLm98H/w2J/eIojUhy3n
         xsLawAO/SlFFUTW8QRE8R/YC+jGNewMqtz6NeL6w0I3N04qTiLliQAdPevPBqFFso6
         Cf4OJlwplvzKYHtvvkJow0DbJp5fqa6q1Lb9RtX4=
To:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Ash Logan <ash@heyquark.com>,
        =?utf-8?Q?Jonathan_Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 4/4] HID: wiiu-drc: Add battery reporting
Message-ID: <xyWfDYiMdzs4YJcEWHml5DErK4Qai9j-p18k6kDIPSiQcfs-imZg3SSK2eA9K-23vyjtNekA2w6nt_R6QClVddmCDVZ8CzA4tI2AjtES-TA=@protonmail.com>
In-Reply-To: <20210502232836.26134-5-linkmauve@linkmauve.fr>
References: <20210502232836.26134-1-linkmauve@linkmauve.fr> <20210502232836.26134-5-linkmauve@linkmauve.fr>
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

Hi


2021. m=C3=A1jus 3., h=C3=A9tf=C5=91 1:28 keltez=C3=A9ssel, Emmanuel Gil Pe=
yrot =C3=ADrta:

> On my DRC the values only go between 142 (battery LED blinking red
> before shutdown) and 178 (charge LED stopping), it seems to be the same
> on other units according to other testers.
>
> A spinlock is used to avoid the battery level and status from being
> reported unsynchronised.
>
> Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> ---
>  drivers/hid/hid-wiiu-drc.c | 107 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>
> diff --git a/drivers/hid/hid-wiiu-drc.c b/drivers/hid/hid-wiiu-drc.c
> index 80faaaad2bb5..119d55542e31 100644
> --- a/drivers/hid/hid-wiiu-drc.c
> +++ b/drivers/hid/hid-wiiu-drc.c
> @@ -15,6 +15,8 @@
>  #include <linux/device.h>
>  #include <linux/hid.h>
>  #include <linux/module.h>
> +#include <linux/power_supply.h>
> +#include <linux/spinlock.h>
>  #include "hid-ids.h"
>
>  #define DEVICE_NAME=09"Nintendo Wii U gamepad"
> @@ -69,6 +71,11 @@
>  #define MAGNET_MIN=09ACCEL_MIN
>  #define MAGNET_MAX=09ACCEL_MAX
>
> +/* Battery constants */
> +#define BATTERY_MIN=09142
> +#define BATTERY_MAX=09178
> +#define BATTERY_CAPACITY(val) ((val - BATTERY_MIN) * 100 / (BATTERY_MAX =
- BATTERY_MIN))

There's `fixp_linear_interpolate()` in linux/fixp-arithmetic.h,
you could use that.


> +
>  /*
>   * The device is setup with multiple input devices:
>   * - A joypad with the buttons and sticks.
> @@ -77,10 +84,17 @@
>   */
>
>  struct drc {
> +=09spinlock_t lock;

I believe a `spin_lock_init()` call is missing from the code.


> +
>  =09struct input_dev *joy_input_dev;
>  =09struct input_dev *touch_input_dev;
>  =09struct input_dev *accel_input_dev;
>  =09struct hid_device *hdev;
> +=09struct power_supply *battery;
> +=09struct power_supply_desc battery_desc;
> +
> +=09u8 battery_energy;
> +=09int battery_status;
>  };
>
>  static int drc_raw_event(struct hid_device *hdev, struct hid_report *rep=
ort,
> @@ -89,6 +103,7 @@ static int drc_raw_event(struct hid_device *hdev, stru=
ct hid_report *report,
>  =09struct drc *drc =3D hid_get_drvdata(hdev);
>  =09int i, x, y, z, pressure, base;
>  =09u32 buttons;
> +=09unsigned long flags;
>
>  =09if (len !=3D 128)
>  =09=09return 0;
> @@ -206,6 +221,17 @@ static int drc_raw_event(struct hid_device *hdev, st=
ruct hid_report *report,
>  =09input_report_abs(drc->accel_input_dev, ABS_WHEEL, (int16_t)z);
>  =09input_sync(drc->accel_input_dev);
>
> +=09/* battery */
> +=09spin_lock_irqsave(&drc->lock, flags);
> +=09drc->battery_energy =3D data[5];
> +=09if (drc->battery_energy =3D=3D BATTERY_MAX)
> +=09=09drc->battery_status =3D POWER_SUPPLY_STATUS_FULL;
> +=09else if ((data[4] & 0x40) !=3D 0)

Maybe `if (data[4] & BIT(BATTERY_CHARGING))` or `if (data[4] & BATTERY_CHAR=
GING_BIT)`
would be better.


> +=09=09drc->battery_status =3D POWER_SUPPLY_STATUS_CHARGING;
> +=09else
> +=09=09drc->battery_status =3D POWER_SUPPLY_STATUS_DISCHARGING;
> +=09spin_unlock_irqrestore(&drc->lock, flags);
> +
>  =09/* let hidraw and hiddev handle the report */
>  =09return 0;
>  }
> @@ -309,10 +335,67 @@ static bool drc_setup_accel(struct drc *drc,
>  =09return true;
>  }
>
> +static enum power_supply_property drc_battery_props[] =3D {
> +=09POWER_SUPPLY_PROP_PRESENT,
> +=09POWER_SUPPLY_PROP_CAPACITY,
> +=09POWER_SUPPLY_PROP_SCOPE,
> +=09POWER_SUPPLY_PROP_STATUS,
> +=09POWER_SUPPLY_PROP_ENERGY_NOW,
> +=09POWER_SUPPLY_PROP_ENERGY_EMPTY,
> +=09POWER_SUPPLY_PROP_ENERGY_FULL,
> +};
> +
> +static int drc_battery_get_property(struct power_supply *psy,
> +=09=09=09=09    enum power_supply_property psp,
> +=09=09=09=09    union power_supply_propval *val)
> +{
> +=09struct drc *drc =3D power_supply_get_drvdata(psy);
> +=09unsigned long flags;
> +=09int ret =3D 0;
> +=09u8 battery_energy;
> +=09int battery_status;
> +
> +=09spin_lock_irqsave(&drc->lock, flags);
> +=09battery_energy =3D drc->battery_energy;
> +=09battery_status =3D drc->battery_status;
> +=09spin_unlock_irqrestore(&drc->lock, flags);
> +
> +=09switch (psp) {
> +=09case POWER_SUPPLY_PROP_PRESENT:
> +=09=09val->intval =3D 1;
> +=09=09break;
> +=09case POWER_SUPPLY_PROP_SCOPE:
> +=09=09val->intval =3D POWER_SUPPLY_SCOPE_DEVICE;
> +=09=09break;
> +=09case POWER_SUPPLY_PROP_CAPACITY:
> +=09=09val->intval =3D BATTERY_CAPACITY(battery_energy);
> +=09=09break;
> +=09case POWER_SUPPLY_PROP_STATUS:
> +=09=09val->intval =3D battery_status;
> +=09=09break;
> +=09case POWER_SUPPLY_PROP_ENERGY_NOW:
> +=09=09val->intval =3D battery_energy;
> +=09=09break;
> +=09case POWER_SUPPLY_PROP_ENERGY_EMPTY:
> +=09=09val->intval =3D BATTERY_MIN;
> +=09=09break;
> +=09case POWER_SUPPLY_PROP_ENERGY_FULL:
> +=09=09val->intval =3D BATTERY_MAX;
> +=09=09break;
> +=09default:
> +=09=09ret =3D -EINVAL;
> +=09=09break;
> +=09}
> +=09return ret;
> +}
> +
>  static bool drc_setup_joypad(struct drc *drc,
>  =09=09struct hid_device *hdev)
>  {
>  =09struct input_dev *input_dev;
> +=09struct power_supply_config psy_cfg =3D { .drv_data =3D drc, };
> +=09int ret;
> +=09static uint8_t drc_num =3D 0;

You probably need an atomic integer here and use `atomic_fetch_inc()`
in the `devm_kasprintf()` call.


>
>  =09input_dev =3D allocate_and_setup(hdev, DEVICE_NAME " Joypad");
>  =09if (!input_dev)
> @@ -350,6 +433,30 @@ static bool drc_setup_joypad(struct drc *drc,
>
>  =09drc->joy_input_dev =3D input_dev;
>
> +=09drc->battery_desc.properties =3D drc_battery_props;
> +=09drc->battery_desc.num_properties =3D ARRAY_SIZE(drc_battery_props);
> +=09drc->battery_desc.get_property =3D drc_battery_get_property;
> +=09drc->battery_desc.type =3D POWER_SUPPLY_TYPE_BATTERY;
> +=09drc->battery_desc.use_for_apm =3D 0;
> +
> +=09/*
> +=09 * TODO: It might be better to use the interface number as the drc_nu=
m,
> +=09 * but I don=E2=80=99t know how to fetch it from here.  In userland i=
t is
> +=09 * /sys/devices/platform/latte/d140000.usb/usb3/3-1/3-1:1.?/bInterfac=
eNumber
> +=09 */

The interface number is not globally unique in any way as far as I can tell=
,
maybe the combination of the bus, port, device, interface numbers is.


> +=09drc->battery_desc.name =3D devm_kasprintf(&hdev->dev, GFP_KERNEL, "wi=
iu-drc-%i-battery", drc_num++);
> +=09if (!drc->battery_desc.name)
> +=09=09return -ENOMEM;

The function returns `bool`. You might want to change it to `int` and retur=
n
a proper errno.


> +
> +=09drc->battery =3D devm_power_supply_register(&hdev->dev, &drc->battery=
_desc, &psy_cfg);
> +=09if (IS_ERR(drc->battery)) {
> +=09=09ret =3D PTR_ERR(drc->battery);
> +=09=09hid_err(hdev, "Unable to register battery device\n");
> +=09=09return ret;
> +=09}
> +
> +=09power_supply_powers(drc->battery, &hdev->dev);
> +
>  =09return true;
>  }
>
> --
> 2.31.1


Regards,
Barnab=C3=A1s P=C5=91cze
