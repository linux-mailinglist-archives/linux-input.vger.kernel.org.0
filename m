Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30C462E31D2
	for <lists+linux-input@lfdr.de>; Sun, 27 Dec 2020 17:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgL0QZ2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Dec 2020 11:25:28 -0500
Received: from mail-02.mail-europe.com ([51.89.119.103]:35348 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbgL0QZ1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Dec 2020 11:25:27 -0500
Date:   Sun, 27 Dec 2020 16:23:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1609086241;
        bh=zL89iIix75Uc5MlP1rnrtbJQkL86oDyl+OdOpPw0cIU=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=OIPAre99cwdFKWojisRN0a6HYB7lj/wWUA0A4nc/J537bBcW9+K2xkRnyjs3lzzJT
         0BdNNVxxveSNiF4Py8TqPq3Fe3gqB0VmHZ3so1+WdPcnTCUfZ3/6GLrWgEqLSQUL5w
         TNZfWHTyTrt6DyZQ1N0YIH+jyZdB+Yptzdubj6VI=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 01/13] HID: playstation: initial DualSense USB support.
Message-ID: <UjCauECbGit_XggmgM71Kv0ThBi0MgxkFW7ZczFePrg1vxi21QA05fw9YAAu9i10oBgg-E7VqouP2FtX-fNdqFUUvIDqy_v6uwkX31PYFpg=@protonmail.com>
In-Reply-To: <20201219062336.72568-2-roderick@gaikai.com>
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-2-roderick@gaikai.com>
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


2020. december 19., szombat 7:23 keltez=C3=A9ssel, Roderick Colenbrander =
=C3=ADrta:

> [...]
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> new file mode 100644
> index 000000000000..8dbd0ae7e082
> --- /dev/null
> +++ b/drivers/hid/hid-playstation.c
> @@ -0,0 +1,317 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  HID driver for Sony DualSense(TM) controller.
> + *
> + *  Copyright (c) 2020 Sony Interactive Entertainment
> + */
> +
> +#include <linux/device.h>
> +#include <linux/hid.h>
> +#include <linux/input/mt.h>
> +#include <linux/module.h>
> +#include <linux/crc32.h>
> +#include <asm/unaligned.h>
> +

I believe it would be preferable to keep the list of includes lexicographic=
ally
sorted.


> +#include "hid-ids.h"
> +
> +/* Base class for playstation devices. */
> +struct ps_device {
> +=09struct hid_device *hdev;
> +
> +=09int (*parse_report)(struct ps_device *dev, struct hid_report *report,=
 u8 *data, int size);
> +};
> +
> +#define DS_INPUT_REPORT_USB=09=09=090x01
> +
> +/* Button masks for DualSense input report. */
> +#define DS_BUTTONS0_HAT_SWITCH=09GENMASK(3, 0)
> +#define DS_BUTTONS0_SQUARE=09BIT(4)
> +#define DS_BUTTONS0_CROSS=09BIT(5)
> +#define DS_BUTTONS0_CIRCLE=09BIT(6)
> +#define DS_BUTTONS0_TRIANGLE=09BIT(7)
> +#define DS_BUTTONS1_L1=09=09BIT(0)
> +#define DS_BUTTONS1_R1=09=09BIT(1)
> +#define DS_BUTTONS1_L2=09=09BIT(2)
> +#define DS_BUTTONS1_R2=09=09BIT(3)
> +#define DS_BUTTONS1_CREATE=09BIT(4)
> +#define DS_BUTTONS1_OPTIONS=09BIT(5)
> +#define DS_BUTTONS1_L3=09=09BIT(6)
> +#define DS_BUTTONS1_R3=09=09BIT(7)
> +#define DS_BUTTONS2_PS_HOME=09BIT(0)
> +#define DS_BUTTONS2_TOUCHPAD=09BIT(1)

I believe it would be preferable to explicitly include everything you need
and not to count on other headers indirectly including it for you. In this
case `linux/bits.h` is not included.


> [...]
> +/* Common gamepad buttons across DualShock 3 / 4 and DualSense.
> + * Note: for device with a touchpad, touchpad button is not included
> + *        as it will be part of the touchpad device.
> + */
> +static int ps_gamepad_buttons[] =3D {

Any reason why it's not `const`?


> +=09BTN_WEST, /* Square */
> +=09BTN_NORTH, /* Triangle */
> +=09BTN_EAST, /* Circle */
> +=09BTN_SOUTH, /* Cross */
> +=09BTN_TL, /* L1 */
> +=09BTN_TR, /* R1 */
> +=09BTN_TL2, /* L2 */
> +=09BTN_TR2, /* R2 */
> +=09BTN_SELECT, /* Create (PS5) / Share (PS4) */
> +=09BTN_START, /* Option */
> +=09BTN_THUMBL, /* L3 */
> +=09BTN_THUMBR, /* R3 */
> +=09BTN_MODE, /* PS Home */
> +};
> [...]
> +static struct input_dev *ps_allocate_input_dev(struct hid_device *hdev, =
const char *name_suffix)
> +{
> +=09struct input_dev *input_dev;
> +
> +=09input_dev =3D devm_input_allocate_device(&hdev->dev);
> +=09if (!input_dev)
> +=09=09return ERR_PTR(-ENOMEM);
> +
> +=09input_dev->id.bustype =3D hdev->bus;
> +=09input_dev->id.vendor =3D hdev->vendor;
> +=09input_dev->id.product =3D hdev->product;
> +=09input_dev->id.version =3D hdev->version;
> +=09input_dev->uniq =3D hdev->uniq;
> +
> +=09if (name_suffix) {
> +=09=09input_dev->name =3D devm_kasprintf(&hdev->dev, GFP_KERNEL, "%s %s"=
, hdev->name,
> +=09=09=09=09name_suffix);
> +=09=09if (!input_dev->name)
> +=09=09=09return ERR_PTR(-ENOMEM);
> +=09} else
> +=09=09input_dev->name =3D hdev->name;
> +

As per [1], please use braces around the body of the `else`.


> +=09input_set_drvdata(input_dev, hdev);
> +
> +=09return input_dev;
> +}
> [...]
> +static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_r=
eport *report,
> +=09=09u8 *data, int size)
> +{
> +=09struct hid_device *hdev =3D ps_dev->hdev;
> +=09struct dualsense *ds =3D (struct dualsense *)ps_dev;

I believe `container_of(ps_dev, struct dualsense, base)` would be preferabl=
e here
(and everywhere this pattern emerges).


> +=09struct dualsense_input_report *ds_report;
> +=09uint8_t value;
> +
> +=09/* DualSense in USB uses the full HID report for reportID 1, but
> +=09 * Bluetooth uses a minimal HID report for reportID 1 and reports
> +=09 * the full report using reportID 49.
> +=09 */
> +=09if (report->id =3D=3D DS_INPUT_REPORT_USB && hdev->bus =3D=3D BUS_USB=
) {
> +=09=09ds_report =3D (struct dualsense_input_report *)&data[1];
> +=09} else {
> +=09=09hid_err(hdev, "Unhandled reportID=3D%d\n", report->id);
> +=09=09return -1;
> +=09}
> +
> +=09input_report_abs(ds->gamepad, ABS_X, ds_report->x);
> +=09input_report_abs(ds->gamepad, ABS_Y, ds_report->y);
> +=09input_report_abs(ds->gamepad, ABS_RX, ds_report->rx);
> +=09input_report_abs(ds->gamepad, ABS_RY, ds_report->ry);
> +=09input_report_abs(ds->gamepad, ABS_Z, ds_report->z);
> +=09input_report_abs(ds->gamepad, ABS_RZ, ds_report->rz);
> +
> +=09value =3D ds_report->buttons[0] & DS_BUTTONS0_HAT_SWITCH;
> +=09if (value > 7)
> +=09=09value =3D 8; /* center */
> +=09input_report_abs(ds->gamepad, ABS_HAT0X, ps_gamepad_hat_mapping[value=
].x);
> +=09input_report_abs(ds->gamepad, ABS_HAT0Y, ps_gamepad_hat_mapping[value=
].y);
> +
> +=09input_report_key(ds->gamepad, BTN_WEST, ds_report->buttons[0] & DS_BU=
TTONS0_SQUARE);
> +=09input_report_key(ds->gamepad, BTN_SOUTH, ds_report->buttons[0] & DS_B=
UTTONS0_CROSS);
> +=09input_report_key(ds->gamepad, BTN_EAST, ds_report->buttons[0] & DS_BU=
TTONS0_CIRCLE);
> +=09input_report_key(ds->gamepad, BTN_NORTH, ds_report->buttons[0] & DS_B=
UTTONS0_TRIANGLE);
> +=09input_report_key(ds->gamepad, BTN_TL, ds_report->buttons[1] & DS_BUTT=
ONS1_L1);
> +=09input_report_key(ds->gamepad, BTN_TR, ds_report->buttons[1] & DS_BUTT=
ONS1_R1);
> +=09input_report_key(ds->gamepad, BTN_TL2, ds_report->buttons[1] & DS_BUT=
TONS1_L2);
> +=09input_report_key(ds->gamepad, BTN_TR2, ds_report->buttons[1] & DS_BUT=
TONS1_R2);
> +=09input_report_key(ds->gamepad, BTN_SELECT, ds_report->buttons[1] & DS_=
BUTTONS1_CREATE);
> +=09input_report_key(ds->gamepad, BTN_START, ds_report->buttons[1] & DS_B=
UTTONS1_OPTIONS);
> +=09input_report_key(ds->gamepad, BTN_THUMBL, ds_report->buttons[1] & DS_=
BUTTONS1_L3);
> +=09input_report_key(ds->gamepad, BTN_THUMBR, ds_report->buttons[1] & DS_=
BUTTONS1_R3);
> +=09input_report_key(ds->gamepad, BTN_MODE, ds_report->buttons[2] & DS_BU=
TTONS2_PS_HOME);

Possibly this could be replaced with a loop? I have something like this in =
mind:

```
struct ps_gamepad_button {
  unsigned int code;
  uint8_t button_idx;
  uint8_t mask;
} ps_gamepad_buttons[] =3D {...};

for (...) {
  struct ps_gamepad_button *b =3D ...;
  input_report_key(...);
}
```

Or is there any reason why the unrolled version is preffered that I'm missi=
ng?


> +=09input_sync(ds->gamepad);
> +
> +=09return 0;
> +}
> +
> +static struct ps_device *dualsense_create(struct hid_device *hdev)
> +{
> +=09struct dualsense *ds;
> +=09int ret;
> +
> +=09ds =3D devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
> +=09if (!ds)
> +=09=09return ERR_PTR(-ENOMEM);
> +
> +=09/* Patch version to allow userspace to distinguish between
> +=09 * hid-generic vs hid-playstation axis and button mapping.
> +=09 */
> +=09hdev->version |=3D 0x8000;

Maybe that '0x8000' could be given a name?


> +
> +=09ds->base.hdev =3D hdev;
> +=09ds->base.parse_report =3D dualsense_parse_report;
> +=09hid_set_drvdata(hdev, ds);
> +
> +=09ds->gamepad =3D ps_gamepad_create(hdev);
> +=09if (IS_ERR(ds->gamepad)) {
> +=09=09ret =3D PTR_ERR(ds->gamepad);
> +=09=09goto err;
> +=09}
> +
> +=09return (struct ps_device *)ds;

I believe using `&ds->base` instead of `(struct ps_device *)ds` would be so=
mewhat
better as it does not subvert the type system as much.


> +
> +err:
> +=09return ERR_PTR(ret);
> +}
> +
> +static int ps_raw_event(struct hid_device *hdev, struct hid_report *repo=
rt,
> +=09=09u8 *data, int size)
> +{
> +=09struct ps_device *dev =3D hid_get_drvdata(hdev);
> +
> +=09if (dev && dev->parse_report)
> +=09=09return dev->parse_report(dev, report, data, size);
> +
> +=09return 0;
> +}
> +
> +static int ps_probe(struct hid_device *hdev, const struct hid_device_id =
*id)
> +{
> +=09struct ps_device *dev;
> +=09int ret;
> +
> +=09ret =3D hid_parse(hdev);
> +=09if (ret) {
> +=09=09hid_err(hdev, "parse failed\n");
> +=09=09return ret;
> +=09}
> +
> +=09ret =3D hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> +=09if (ret) {
> +=09=09hid_err(hdev, "hw start failed\n");
> +=09=09return ret;
> +=09}
> +
> +=09ret =3D hid_hw_open(hdev);
> +=09if (ret) {
> +=09=09hid_err(hdev, "hw open failed\n");
> +=09=09goto err_stop;
> +=09}
> +
> +=09if (hdev->product =3D=3D USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
> +=09=09dev =3D dualsense_create(hdev);
> +=09=09if (IS_ERR(dev)) {
> +=09=09=09hid_err(hdev, "Failed to create dualsense.\n");
> +=09=09=09ret =3D PTR_ERR(dev);
> +=09=09=09goto err_close;
> +=09=09}
> +=09} else {

When would this be possible?


> +=09=09hid_err(hdev, "Unhandled device\n");
> +=09=09ret =3D -EINVAL;

Assuming it's possible, I believe `-ENODEV` is a better error code here.


> +=09=09goto err_close;
> +=09}
> +
> +=09return ret;
> +
> +err_close:
> +=09hid_hw_close(hdev);
> +err_stop:
> +=09hid_hw_stop(hdev);
> +=09return ret;
> +}
> [...]
> +static const struct hid_device_id ps_devices[] =3D {
> +=09{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLE=
R),
> +=09=09.driver_data =3D 0 },
> [...]

`.driver_data` would be initialized to zero anyways, why is it necessary to=
 do
so explicitly?


[1]: https://www.kernel.org/doc/html/latest/process/coding-style.html


Regards,
Barnab=C3=A1s P=C5=91cze
