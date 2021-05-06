Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE79237533B
	for <lists+linux-input@lfdr.de>; Thu,  6 May 2021 13:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbhEFLyO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 May 2021 07:54:14 -0400
Received: from mail-40134.protonmail.ch ([185.70.40.134]:29598 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbhEFLyN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 May 2021 07:54:13 -0400
Date:   Thu, 06 May 2021 11:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1620301993;
        bh=YYc5fiUe0QHS2rZ02pcb8ZujlzpdTRdExJzGjfrY+BA=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=XHWyoId+t+YNO1u2VmlKq+svDFLPgw16LYw0VJuiUZmCwE+DcmmnpZ4mysu3bgcFx
         +ZHmkjhWQDfcXi6exfM2b+mzaanEpgy2LriZ29FoqpUV/0ppgoaV0Ol5Cv6XdXYpnO
         CjgW55N42QNEsvCjGed7o1OB0dfCjKjx6kerwA5g=
To:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Ash Logan <ash@heyquark.com>,
        =?utf-8?Q?Jonathan_Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 1/4] HID: wiiu-drc: Add a driver for this gamepad
Message-ID: <1DGv0iSqshLzGMDycGbSQ9hRJ7I3sNTH8O2QJQMkv2fylloDJWOLlTOKNL9P1HCi_2rb5GItJ12F8tRQPO7ylg5YqeLip2BbfpN2PKQxYDQ=@protonmail.com>
In-Reply-To: <20210502232836.26134-2-linkmauve@linkmauve.fr>
References: <20210502232836.26134-1-linkmauve@linkmauve.fr> <20210502232836.26134-2-linkmauve@linkmauve.fr>
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

> From: Ash Logan <ash@heyquark.com>
>
> This driver is for the DRC (wireless gamepad) when plugged to the DRH of
> the Wii U, a chip exposing it as a USB device.
>
> This first patch exposes the buttons and sticks of this device, so that
> it can act as a plain game controller.
>
> Signed-off-by: Ash Logan <ash@heyquark.com>
> Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> ---
>  drivers/hid/Kconfig        |   7 +
>  drivers/hid/Makefile       |   1 +
>  drivers/hid/hid-ids.h      |   1 +
>  drivers/hid/hid-quirks.c   |   3 +
>  drivers/hid/hid-wiiu-drc.c | 270 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 282 insertions(+)
>  create mode 100644 drivers/hid/hid-wiiu-drc.c
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 4bf263c2d61a..01116c315459 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -1105,6 +1105,13 @@ config HID_WACOM
>  =09  To compile this driver as a module, choose M here: the
>  =09  module will be called wacom.
>
> +config HID_WIIU_DRC
> +=09tristate "Nintendo Wii U gamepad over internal DRH"
> +=09depends on HID
> +=09help
> +=09  Support for the Wii U gamepad, when connected with the Wii U=
=E2=80=99s
> +=09  internal DRH chip.
> +
>  config HID_WIIMOTE
>  =09tristate "Nintendo Wii / Wii U peripherals"
>  =09depends on HID
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index 193431ec4db8..8fcaaeae4d65 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -134,6 +134,7 @@ wacom-objs=09=09=09:=3D wacom_wac.o wacom_sys.o
>  obj-$(CONFIG_HID_WACOM)=09=09+=3D wacom.o
>  obj-$(CONFIG_HID_WALTOP)=09+=3D hid-waltop.o
>  obj-$(CONFIG_HID_WIIMOTE)=09+=3D hid-wiimote.o
> +obj-$(CONFIG_HID_WIIU_DRC)=09+=3D hid-wiiu-drc.o
>  obj-$(CONFIG_HID_SENSOR_HUB)=09+=3D hid-sensor-hub.o
>  obj-$(CONFIG_HID_SENSOR_CUSTOM_SENSOR)=09+=3D hid-sensor-custom.o
>
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 84b8da3e7d09..fbac0dd021f1 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -916,6 +916,7 @@
>  #define USB_VENDOR_ID_NINTENDO=09=090x057e
>  #define USB_DEVICE_ID_NINTENDO_WIIMOTE=090x0306
>  #define USB_DEVICE_ID_NINTENDO_WIIMOTE2=090x0330
> +#define USB_DEVICE_ID_NINTENDO_WIIU_DRH=090x0341
>
>  #define USB_VENDOR_ID_NOVATEK=09=090x0603
>  #define USB_DEVICE_ID_NOVATEK_PCT=090x0600
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 3dd6f15f2a67..af400177537e 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -513,6 +513,9 @@ static const struct hid_device_id hid_have_special_dr=
iver[] =3D {
>  =09{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO=
_WIIMOTE) },
>  =09{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO=
_WIIMOTE2) },
>  #endif
> +#if IS_ENABLED(CONFIG_HID_WIIU_DRC)
> +=09{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO=
_WIIU_DRH) },
> +#endif
>  #if IS_ENABLED(CONFIG_HID_NTI)
>  =09{ HID_USB_DEVICE(USB_VENDOR_ID_NTI, USB_DEVICE_ID_USB_SUN) },
>  #endif
> diff --git a/drivers/hid/hid-wiiu-drc.c b/drivers/hid/hid-wiiu-drc.c
> new file mode 100644
> index 000000000000..018cbdb53a2c
> --- /dev/null
> +++ b/drivers/hid/hid-wiiu-drc.c
> @@ -0,0 +1,270 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * HID driver for Nintendo Wii U gamepad, connected via console-internal=
 DRH
> + *
> + * Copyright (C) 2021 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> + * Copyright (C) 2019 Ash Logan <ash@heyquark.com>
> + * Copyright (C) 2013 Mema Hacking
> + *
> + * Based on the excellent work at http://libdrc.org/docs/re/sc-input.htm=
l and
> + * https://bitbucket.org/memahaxx/libdrc/src/master/src/input-receiver.c=
pp .
> + * libdrc code is licensed under BSD 2-Clause.
> + * Driver based on hid-udraw-ps3.c.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/hid.h>
> +#include <linux/module.h>
> +#include "hid-ids.h"

It's usually best if you don't rely indirect includes. Include everything y=
ou use.
E.g. here linux/input.h is missing.


> +
> +#define DEVICE_NAME=09"Nintendo Wii U gamepad"
> +
> +/* Button and stick constants */
> +#define VOLUME_MIN=090
> +#define VOLUME_MAX=09255
> +#define NUM_STICK_AXES=094
> +#define STICK_MIN=09900
> +#define STICK_MAX=093200
> +
> +#define BUTTON_SYNC=09BIT(0)
> +#define BUTTON_HOME=09BIT(1)
> +#define BUTTON_MINUS=09BIT(2)
> +#define BUTTON_PLUS=09BIT(3)
> +#define BUTTON_R=09BIT(4)
> +#define BUTTON_L=09BIT(5)
> +#define BUTTON_ZR=09BIT(6)
> +#define BUTTON_ZL=09BIT(7)
> +#define BUTTON_DOWN=09BIT(8)
> +#define BUTTON_UP=09BIT(9)
> +#define BUTTON_RIGHT=09BIT(10)
> +#define BUTTON_LEFT=09BIT(11)
> +#define BUTTON_Y=09BIT(12)
> +#define BUTTON_X=09BIT(13)
> +#define BUTTON_B=09BIT(14)
> +#define BUTTON_A=09BIT(15)
> +
> +#define BUTTON_TV=09BIT(21)
> +#define BUTTON_R3=09BIT(22)
> +#define BUTTON_L3=09BIT(23)
> +
> +#define BUTTON_POWER=09BIT(25)
> +
> +/*
> + * The device is setup with multiple input devices:
> + * - A joypad with the buttons and sticks.
> + */
> +
> +struct drc {
> +=09struct input_dev *joy_input_dev;
> +=09struct hid_device *hdev;
> +};
> +
> +static int drc_raw_event(struct hid_device *hdev, struct hid_report *rep=
ort,
> +=09 u8 *data, int len)
> +{
> +=09struct drc *drc =3D hid_get_drvdata(hdev);
> +=09int i;
> +=09u32 buttons;
> +
> +=09if (len !=3D 128)
> +=09=09return 0;
> +
> +=09buttons =3D (data[4] << 24) | (data[80] << 16) | (data[2] << 8) | dat=
a[3];
> +=09/* joypad */
> +=09input_report_key(drc->joy_input_dev, BTN_DPAD_RIGHT, buttons & BUTTON=
_RIGHT);
> +=09input_report_key(drc->joy_input_dev, BTN_DPAD_DOWN, buttons & BUTTON_=
DOWN);
> +=09input_report_key(drc->joy_input_dev, BTN_DPAD_LEFT, buttons & BUTTON_=
LEFT);
> +=09input_report_key(drc->joy_input_dev, BTN_DPAD_UP, buttons & BUTTON_UP=
);
> +
> +=09input_report_key(drc->joy_input_dev, BTN_EAST, buttons & BUTTON_A);
> +=09input_report_key(drc->joy_input_dev, BTN_SOUTH, buttons & BUTTON_B);
> +=09input_report_key(drc->joy_input_dev, BTN_NORTH, buttons & BUTTON_X);
> +=09input_report_key(drc->joy_input_dev, BTN_WEST, buttons & BUTTON_Y);
> +
> +=09input_report_key(drc->joy_input_dev, BTN_TL, buttons & BUTTON_L);
> +=09input_report_key(drc->joy_input_dev, BTN_TL2, buttons & BUTTON_ZL);
> +=09input_report_key(drc->joy_input_dev, BTN_TR, buttons & BUTTON_R);
> +=09input_report_key(drc->joy_input_dev, BTN_TR2, buttons & BUTTON_ZR);
> +
> +=09input_report_key(drc->joy_input_dev, BTN_Z, buttons & BUTTON_TV);
> +=09input_report_key(drc->joy_input_dev, BTN_THUMBL, buttons & BUTTON_L3)=
;
> +=09input_report_key(drc->joy_input_dev, BTN_THUMBR, buttons & BUTTON_R3)=
;
> +
> +=09input_report_key(drc->joy_input_dev, BTN_SELECT, buttons & BUTTON_MIN=
US);
> +=09input_report_key(drc->joy_input_dev, BTN_START, buttons & BUTTON_PLUS=
);
> +=09input_report_key(drc->joy_input_dev, BTN_MODE, buttons & BUTTON_HOME)=
;
> +
> +=09input_report_key(drc->joy_input_dev, BTN_DEAD, buttons & BUTTON_POWER=
);
> +
> +=09for (i =3D 0; i < NUM_STICK_AXES; i++) {
> +=09=09s16 val =3D (data[7 + 2*i] << 8) | data[6 + 2*i];
> +=09=09/* clamp */
> +=09=09if (val < STICK_MIN)
> +=09=09=09val =3D STICK_MIN;
> +=09=09if (val > STICK_MAX)
> +=09=09=09val =3D STICK_MAX;

There's `clamp()` in linux/minmax.h, you might want to use that.


> +
> +=09=09switch (i) {
> +=09=09case 0:
> +=09=09=09input_report_abs(drc->joy_input_dev, ABS_X, val);
> +=09=09=09break;
> +=09=09case 1:
> +=09=09=09input_report_abs(drc->joy_input_dev, ABS_Y, val);
> +=09=09=09break;
> +=09=09case 2:
> +=09=09=09input_report_abs(drc->joy_input_dev, ABS_RX, val);
> +=09=09=09break;
> +=09=09case 3:
> +=09=09=09input_report_abs(drc->joy_input_dev, ABS_RY, val);
> +=09=09=09break;
> +=09=09default:
> +=09=09=09break;
> +=09=09}
> +=09}
> +
> +=09input_report_abs(drc->joy_input_dev, ABS_VOLUME, data[14]);
> +
> +=09input_sync(drc->joy_input_dev);
> +
> +=09/* let hidraw and hiddev handle the report */
> +=09return 0;
> +}
> +
> +static int drc_open(struct input_dev *dev)
> +{
> +=09struct drc *drc =3D input_get_drvdata(dev);
> +
> +=09return hid_hw_open(drc->hdev);
> +}
> +
> +static void drc_close(struct input_dev *dev)
> +{
> +=09struct drc *drc =3D input_get_drvdata(dev);
> +
> +=09hid_hw_close(drc->hdev);
> +}
> +
> +static struct input_dev *allocate_and_setup(struct hid_device *hdev,
> +=09=09const char *name)
> +{
> +=09struct input_dev *input_dev;
> +
> +=09input_dev =3D devm_input_allocate_device(&hdev->dev);
> +=09if (!input_dev)
> +=09=09return NULL;
> +
> +=09input_dev->name =3D name;
> +=09input_dev->phys =3D hdev->phys;
> +=09input_dev->dev.parent =3D &hdev->dev;
> +=09input_dev->open =3D drc_open;
> +=09input_dev->close =3D drc_close;
> +=09input_dev->uniq =3D hdev->uniq;
> +=09input_dev->id.bustype =3D hdev->bus;
> +=09input_dev->id.vendor  =3D hdev->vendor;
> +=09input_dev->id.product =3D hdev->product;
> +=09input_dev->id.version =3D hdev->version;
> +=09input_set_drvdata(input_dev, hid_get_drvdata(hdev));
> +
> +=09return input_dev;
> +}
> +
> +static bool drc_setup_joypad(struct drc *drc,
> +=09=09struct hid_device *hdev)
> +{
> +=09struct input_dev *input_dev;
> +
> +=09input_dev =3D allocate_and_setup(hdev, DEVICE_NAME " Joypad");
> +=09if (!input_dev)
> +=09=09return false;
> +
> +=09input_dev->evbit[0] =3D BIT(EV_KEY) | BIT(EV_ABS);

`input_set_abs_params()` already sets EV_ABS.


> +
> +=09set_bit(BTN_DPAD_RIGHT, input_dev->keybit);
> +=09set_bit(BTN_DPAD_DOWN, input_dev->keybit);
> +=09set_bit(BTN_DPAD_LEFT, input_dev->keybit);
> +=09set_bit(BTN_DPAD_UP, input_dev->keybit);
> +=09set_bit(BTN_EAST, input_dev->keybit);
> +=09set_bit(BTN_SOUTH, input_dev->keybit);
> +=09set_bit(BTN_NORTH, input_dev->keybit);
> +=09set_bit(BTN_WEST, input_dev->keybit);
> +=09set_bit(BTN_TL, input_dev->keybit);
> +=09set_bit(BTN_TL2, input_dev->keybit);
> +=09set_bit(BTN_TR, input_dev->keybit);
> +=09set_bit(BTN_TR2, input_dev->keybit);
> +=09set_bit(BTN_THUMBL, input_dev->keybit);
> +=09set_bit(BTN_THUMBR, input_dev->keybit);
> +=09set_bit(BTN_SELECT, input_dev->keybit);
> +=09set_bit(BTN_START, input_dev->keybit);
> +=09set_bit(BTN_MODE, input_dev->keybit);
> +
> +=09/* These two buttons are actually TV control and Power. */
> +=09set_bit(BTN_Z, input_dev->keybit);
> +=09set_bit(BTN_DEAD, input_dev->keybit);

You could use `input_set_capability(device, EV_KEY, ...)` (potentially in a=
 loop)
instead of manually setting the bits. And then `input_dev->evbit[0] =3D BIT=
(EV_KEY) | BIT(EV_ABS);`
would be unnecessary.


> +
> +=09input_set_abs_params(input_dev, ABS_X, STICK_MIN, STICK_MAX, 0, 0);
> +=09input_set_abs_params(input_dev, ABS_Y, STICK_MIN, STICK_MAX, 0, 0);
> +=09input_set_abs_params(input_dev, ABS_RX, STICK_MIN, STICK_MAX, 0, 0);
> +=09input_set_abs_params(input_dev, ABS_RY, STICK_MIN, STICK_MAX, 0, 0);
> +=09input_set_abs_params(input_dev, ABS_VOLUME, VOLUME_MIN, VOLUME_MAX, 0=
, 0);
> +
> +=09drc->joy_input_dev =3D input_dev;
> +
> +=09return true;
> +}
> +
> +static int drc_probe(struct hid_device *hdev, const struct hid_device_id=
 *id)
> +{
> +=09struct drc *drc;
> +=09int ret;
> +
> +=09drc =3D devm_kzalloc(&hdev->dev, sizeof(struct drc), GFP_KERNEL);
> +=09if (!drc)
> +=09=09return -ENOMEM;
> +
> +=09drc->hdev =3D hdev;
> +
> +=09hid_set_drvdata(hdev, drc);
> +
> +=09ret =3D hid_parse(hdev);
> +=09if (ret) {
> +=09=09hid_err(hdev, "parse failed\n");
> +=09=09return ret;
> +=09}
> +
> +=09if (!drc_setup_joypad(drc, hdev)) {
> +=09=09hid_err(hdev, "could not allocate interface\n");
> +=09=09return -ENOMEM;
> +=09}
> +
> +=09ret =3D input_register_device(drc->joy_input_dev);
> +=09if (ret) {
> +=09=09hid_err(hdev, "failed to register interface\n");
> +=09=09return ret;
> +=09}
> +
> +=09ret =3D hid_hw_start(hdev, HID_CONNECT_HIDRAW | HID_CONNECT_DRIVER);

As far as I'm aware, `hid_hw_start()` should be called before `hid_hw_open(=
)`.
Since you register the input device first, I think it is possible that `hid=
_hw_open()`
will be called first.


> +=09if (ret) {
> +=09=09hid_err(hdev, "hw start failed\n");
> +=09=09return ret;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static const struct hid_device_id drc_devices[] =3D {
> +=09{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_WIIU_=
DRH) },
> +=09{ }
> +};
> +MODULE_DEVICE_TABLE(hid, drc_devices);
> +
> +static struct hid_driver drc_driver =3D {
> +=09.name =3D "hid-wiiu-drc",
> +=09.id_table =3D drc_devices,
> +=09.raw_event =3D drc_raw_event,
> +=09.probe =3D drc_probe,
> +};
> +module_hid_driver(drc_driver);
> +
> +MODULE_AUTHOR("Ash Logan <ash@heyquark.com>");
> +MODULE_DESCRIPTION("Nintendo Wii U gamepad driver");
> +MODULE_LICENSE("GPL");
> --
> 2.31.1


Regards,
Barnab=C3=A1s P=C5=91cze
