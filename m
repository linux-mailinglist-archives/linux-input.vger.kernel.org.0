Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C90B2E332B
	for <lists+linux-input@lfdr.de>; Mon, 28 Dec 2020 00:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgL0XFQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Dec 2020 18:05:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbgL0XFQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Dec 2020 18:05:16 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F67C061794
        for <linux-input@vger.kernel.org>; Sun, 27 Dec 2020 15:04:35 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id b9so5999644qtr.2
        for <linux-input@vger.kernel.org>; Sun, 27 Dec 2020 15:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/uhuVQZOCjSkBlOhSYw4ksVjL7ArWD6r65rHwbzHapg=;
        b=utIy7C2b6OO3D9nce7yGDX387Ptv7ao5zgkgAkn6TcziNAZnyZmhBb8W6oUZbCftko
         vC1ueQAc/Z4eYd2vcMBhxP8921GJ/2LEIoVwJOp48XIC7pX51LceDxgg2rqFO0a6wfZO
         zTark9Moclk0Y7eciifBHEgL60EsbgyODBBt0VQrFBdsdJMx3WvbFvdXP8LBp38lsAR2
         qteB2uz0TEDKvr9AD4Gyb5pLdokCbYv04RHph6ZJxfOG0rfuaHkeEtrfZjHG0geMk2Iw
         5l7ZTfhleGJ2/KP2v3tzYwInUFV9aZcv2V5G5ToFtsoY1WKOL+JeJUcoczwZUks28FUd
         z9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/uhuVQZOCjSkBlOhSYw4ksVjL7ArWD6r65rHwbzHapg=;
        b=aAuSo3zO2jIUCgKEd/cae/UhnSA5hUPmv4hNZHZEFqPijACE5YFOhLmXwYkDGOCTjs
         41IZICJR+rTqMdmMAn+5lCQxjUkBVnKZ2Vd02wy18PpfqSe0ZOv8V4iIFDKtoc5omqfN
         K1Z7WSnPiRZRjBLSV7XglQpmzIex8PNfVTaiFItbOWXS6EhWTUz6WLuO20Q+OgcGpdH5
         +fpYrBXVon0fIysLzxPdWUF6xVMVlVohvpohA3DO9bsIfmnlA71l4r5Uz66Goo1dntdt
         cLioAf5lZ6ySta8XwP1mHyZcg2z+X6/4PlgK0TGGt6gozq/9jpuL6f5FD0hP7bDeVaT5
         lsoA==
X-Gm-Message-State: AOAM53359pGv9xLgDuDb74lbRlfpKOxaN+BxWXS5ESpt+Mam9peG8u8Y
        uWhzxHJo2jdyVDkSrQirMMvnmH8pr/xeOTpJ0P3Y5A==
X-Google-Smtp-Source: ABdhPJytcX1zJH8kWRrzlk6Fjyx1wNe2vpJSUh/uF2JBXnfHCNC9HbPTkM6XaEFSUAjIXAxnkUk7g4uoEeWIl4twWjQ=
X-Received: by 2002:ac8:46c8:: with SMTP id h8mr41965564qto.17.1609110274421;
 Sun, 27 Dec 2020 15:04:34 -0800 (PST)
MIME-Version: 1.0
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-2-roderick@gaikai.com>
 <UjCauECbGit_XggmgM71Kv0ThBi0MgxkFW7ZczFePrg1vxi21QA05fw9YAAu9i10oBgg-E7VqouP2FtX-fNdqFUUvIDqy_v6uwkX31PYFpg=@protonmail.com>
In-Reply-To: <UjCauECbGit_XggmgM71Kv0ThBi0MgxkFW7ZczFePrg1vxi21QA05fw9YAAu9i10oBgg-E7VqouP2FtX-fNdqFUUvIDqy_v6uwkX31PYFpg=@protonmail.com>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Sun, 27 Dec 2020 15:04:23 -0800
Message-ID: <CANndSKkV5HNtR=CkDekmt8xeNjSdS0Kvws5d0MQcdHV1Bf8diw@mail.gmail.com>
Subject: Re: [PATCH 01/13] HID: playstation: initial DualSense USB support.
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Barnab=C3=A1s,

Thanks for your review.

On Sun, Dec 27, 2020 at 8:24 AM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> Hi
>
>
> 2020. december 19., szombat 7:23 keltez=C3=A9ssel, Roderick Colenbrander =
=C3=ADrta:
>
> > [...]
> > diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstatio=
n.c
> > new file mode 100644
> > index 000000000000..8dbd0ae7e082
> > --- /dev/null
> > +++ b/drivers/hid/hid-playstation.c
> > @@ -0,0 +1,317 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + *  HID driver for Sony DualSense(TM) controller.
> > + *
> > + *  Copyright (c) 2020 Sony Interactive Entertainment
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/hid.h>
> > +#include <linux/input/mt.h>
> > +#include <linux/module.h>
> > +#include <linux/crc32.h>
> > +#include <asm/unaligned.h>
> > +
>
> I believe it would be preferable to keep the list of includes lexicograph=
ically
> sorted.
>
>
> > +#include "hid-ids.h"
> > +
> > +/* Base class for playstation devices. */
> > +struct ps_device {
> > +     struct hid_device *hdev;
> > +
> > +     int (*parse_report)(struct ps_device *dev, struct hid_report *rep=
ort, u8 *data, int size);
> > +};
> > +
> > +#define DS_INPUT_REPORT_USB                  0x01
> > +
> > +/* Button masks for DualSense input report. */
> > +#define DS_BUTTONS0_HAT_SWITCH       GENMASK(3, 0)
> > +#define DS_BUTTONS0_SQUARE   BIT(4)
> > +#define DS_BUTTONS0_CROSS    BIT(5)
> > +#define DS_BUTTONS0_CIRCLE   BIT(6)
> > +#define DS_BUTTONS0_TRIANGLE BIT(7)
> > +#define DS_BUTTONS1_L1               BIT(0)
> > +#define DS_BUTTONS1_R1               BIT(1)
> > +#define DS_BUTTONS1_L2               BIT(2)
> > +#define DS_BUTTONS1_R2               BIT(3)
> > +#define DS_BUTTONS1_CREATE   BIT(4)
> > +#define DS_BUTTONS1_OPTIONS  BIT(5)
> > +#define DS_BUTTONS1_L3               BIT(6)
> > +#define DS_BUTTONS1_R3               BIT(7)
> > +#define DS_BUTTONS2_PS_HOME  BIT(0)
> > +#define DS_BUTTONS2_TOUCHPAD BIT(1)
>
> I believe it would be preferable to explicitly include everything you nee=
d
> and not to count on other headers indirectly including it for you. In thi=
s
> case `linux/bits.h` is not included.
>
>
> > [...]
> > +/* Common gamepad buttons across DualShock 3 / 4 and DualSense.
> > + * Note: for device with a touchpad, touchpad button is not included
> > + *        as it will be part of the touchpad device.
> > + */
> > +static int ps_gamepad_buttons[] =3D {
>
> Any reason why it's not `const`?

It should be const.

>
>
> > +     BTN_WEST, /* Square */
> > +     BTN_NORTH, /* Triangle */
> > +     BTN_EAST, /* Circle */
> > +     BTN_SOUTH, /* Cross */
> > +     BTN_TL, /* L1 */
> > +     BTN_TR, /* R1 */
> > +     BTN_TL2, /* L2 */
> > +     BTN_TR2, /* R2 */
> > +     BTN_SELECT, /* Create (PS5) / Share (PS4) */
> > +     BTN_START, /* Option */
> > +     BTN_THUMBL, /* L3 */
> > +     BTN_THUMBR, /* R3 */
> > +     BTN_MODE, /* PS Home */
> > +};
> > [...]
> > +static struct input_dev *ps_allocate_input_dev(struct hid_device *hdev=
, const char *name_suffix)
> > +{
> > +     struct input_dev *input_dev;
> > +
> > +     input_dev =3D devm_input_allocate_device(&hdev->dev);
> > +     if (!input_dev)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     input_dev->id.bustype =3D hdev->bus;
> > +     input_dev->id.vendor =3D hdev->vendor;
> > +     input_dev->id.product =3D hdev->product;
> > +     input_dev->id.version =3D hdev->version;
> > +     input_dev->uniq =3D hdev->uniq;
> > +
> > +     if (name_suffix) {
> > +             input_dev->name =3D devm_kasprintf(&hdev->dev, GFP_KERNEL=
, "%s %s", hdev->name,
> > +                             name_suffix);
> > +             if (!input_dev->name)
> > +                     return ERR_PTR(-ENOMEM);
> > +     } else
> > +             input_dev->name =3D hdev->name;
> > +
>
> As per [1], please use braces around the body of the `else`.
>
>
> > +     input_set_drvdata(input_dev, hdev);
> > +
> > +     return input_dev;
> > +}
> > [...]
> > +static int dualsense_parse_report(struct ps_device *ps_dev, struct hid=
_report *report,
> > +             u8 *data, int size)
> > +{
> > +     struct hid_device *hdev =3D ps_dev->hdev;
> > +     struct dualsense *ds =3D (struct dualsense *)ps_dev;
>
> I believe `container_of(ps_dev, struct dualsense, base)` would be prefera=
ble here
> (and everywhere this pattern emerges).

Agreed.

>
> > +     struct dualsense_input_report *ds_report;
> > +     uint8_t value;
> > +
> > +     /* DualSense in USB uses the full HID report for reportID 1, but
> > +      * Bluetooth uses a minimal HID report for reportID 1 and reports
> > +      * the full report using reportID 49.
> > +      */
> > +     if (report->id =3D=3D DS_INPUT_REPORT_USB && hdev->bus =3D=3D BUS=
_USB) {
> > +             ds_report =3D (struct dualsense_input_report *)&data[1];
> > +     } else {
> > +             hid_err(hdev, "Unhandled reportID=3D%d\n", report->id);
> > +             return -1;
> > +     }
> > +
> > +     input_report_abs(ds->gamepad, ABS_X, ds_report->x);
> > +     input_report_abs(ds->gamepad, ABS_Y, ds_report->y);
> > +     input_report_abs(ds->gamepad, ABS_RX, ds_report->rx);
> > +     input_report_abs(ds->gamepad, ABS_RY, ds_report->ry);
> > +     input_report_abs(ds->gamepad, ABS_Z, ds_report->z);
> > +     input_report_abs(ds->gamepad, ABS_RZ, ds_report->rz);
> > +
> > +     value =3D ds_report->buttons[0] & DS_BUTTONS0_HAT_SWITCH;
> > +     if (value > 7)
> > +             value =3D 8; /* center */
> > +     input_report_abs(ds->gamepad, ABS_HAT0X, ps_gamepad_hat_mapping[v=
alue].x);
> > +     input_report_abs(ds->gamepad, ABS_HAT0Y, ps_gamepad_hat_mapping[v=
alue].y);
> > +
> > +     input_report_key(ds->gamepad, BTN_WEST, ds_report->buttons[0] & D=
S_BUTTONS0_SQUARE);
> > +     input_report_key(ds->gamepad, BTN_SOUTH, ds_report->buttons[0] & =
DS_BUTTONS0_CROSS);
> > +     input_report_key(ds->gamepad, BTN_EAST, ds_report->buttons[0] & D=
S_BUTTONS0_CIRCLE);
> > +     input_report_key(ds->gamepad, BTN_NORTH, ds_report->buttons[0] & =
DS_BUTTONS0_TRIANGLE);
> > +     input_report_key(ds->gamepad, BTN_TL, ds_report->buttons[1] & DS_=
BUTTONS1_L1);
> > +     input_report_key(ds->gamepad, BTN_TR, ds_report->buttons[1] & DS_=
BUTTONS1_R1);
> > +     input_report_key(ds->gamepad, BTN_TL2, ds_report->buttons[1] & DS=
_BUTTONS1_L2);
> > +     input_report_key(ds->gamepad, BTN_TR2, ds_report->buttons[1] & DS=
_BUTTONS1_R2);
> > +     input_report_key(ds->gamepad, BTN_SELECT, ds_report->buttons[1] &=
 DS_BUTTONS1_CREATE);
> > +     input_report_key(ds->gamepad, BTN_START, ds_report->buttons[1] & =
DS_BUTTONS1_OPTIONS);
> > +     input_report_key(ds->gamepad, BTN_THUMBL, ds_report->buttons[1] &=
 DS_BUTTONS1_L3);
> > +     input_report_key(ds->gamepad, BTN_THUMBR, ds_report->buttons[1] &=
 DS_BUTTONS1_R3);
> > +     input_report_key(ds->gamepad, BTN_MODE, ds_report->buttons[2] & D=
S_BUTTONS2_PS_HOME);
>
> Possibly this could be replaced with a loop? I have something like this i=
n mind:
>
> ```
> struct ps_gamepad_button {
>   unsigned int code;
>   uint8_t button_idx;
>   uint8_t mask;
> } ps_gamepad_buttons[] =3D {...};
>
> for (...) {
>   struct ps_gamepad_button *b =3D ...;
>   input_report_key(...);
> }
> ```
>
> Or is there any reason why the unrolled version is preffered that I'm mis=
sing?

It can be done from a loop. Main reason for unrolled was that it is
actually less code and potentially a tiny bit faster, but I bet a
compiler would have unrolled it anyway. I don't know what I want to do
here. Being explicit feels nice (other drivers do something similar).

>
> > +     input_sync(ds->gamepad);
> > +
> > +     return 0;
> > +}
> > +
> > +static struct ps_device *dualsense_create(struct hid_device *hdev)
> > +{
> > +     struct dualsense *ds;
> > +     int ret;
> > +
> > +     ds =3D devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
> > +     if (!ds)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     /* Patch version to allow userspace to distinguish between
> > +      * hid-generic vs hid-playstation axis and button mapping.
> > +      */
> > +     hdev->version |=3D 0x8000;
>
> Maybe that '0x8000' could be given a name?

Will do so. Calling it for now 'HID_PLAYSTATION_VERSION_PATCH' or
something like that.

>
>
> > +
> > +     ds->base.hdev =3D hdev;
> > +     ds->base.parse_report =3D dualsense_parse_report;
> > +     hid_set_drvdata(hdev, ds);
> > +
> > +     ds->gamepad =3D ps_gamepad_create(hdev);
> > +     if (IS_ERR(ds->gamepad)) {
> > +             ret =3D PTR_ERR(ds->gamepad);
> > +             goto err;
> > +     }
> > +
> > +     return (struct ps_device *)ds;
>
> I believe using `&ds->base` instead of `(struct ps_device *)ds` would be =
somewhat
> better as it does not subvert the type system as much.

Thanks, yeah that's cleaner.

>
>
> > +
> > +err:
> > +     return ERR_PTR(ret);
> > +}
> > +
> > +static int ps_raw_event(struct hid_device *hdev, struct hid_report *re=
port,
> > +             u8 *data, int size)
> > +{
> > +     struct ps_device *dev =3D hid_get_drvdata(hdev);
> > +
> > +     if (dev && dev->parse_report)
> > +             return dev->parse_report(dev, report, data, size);
> > +
> > +     return 0;
> > +}
> > +
> > +static int ps_probe(struct hid_device *hdev, const struct hid_device_i=
d *id)
> > +{
> > +     struct ps_device *dev;
> > +     int ret;
> > +
> > +     ret =3D hid_parse(hdev);
> > +     if (ret) {
> > +             hid_err(hdev, "parse failed\n");
> > +             return ret;
> > +     }
> > +
> > +     ret =3D hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> > +     if (ret) {
> > +             hid_err(hdev, "hw start failed\n");
> > +             return ret;
> > +     }
> > +
> > +     ret =3D hid_hw_open(hdev);
> > +     if (ret) {
> > +             hid_err(hdev, "hw open failed\n");
> > +             goto err_stop;
> > +     }
> > +
> > +     if (hdev->product =3D=3D USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
> > +             dev =3D dualsense_create(hdev);
> > +             if (IS_ERR(dev)) {
> > +                     hid_err(hdev, "Failed to create dualsense.\n");
> > +                     ret =3D PTR_ERR(dev);
> > +                     goto err_close;
> > +             }
> > +     } else {
>
> When would this be possible?

It isn't possible right now. A colleague really wanted me to add (I
originally didn't have it in an internal build), but I don't mind
taking it out.

>
>
> > +             hid_err(hdev, "Unhandled device\n");
> > +             ret =3D -EINVAL;
>
> Assuming it's possible, I believe `-ENODEV` is a better error code here.
>
>
> > +             goto err_close;
> > +     }
> > +
> > +     return ret;
> > +
> > +err_close:
> > +     hid_hw_close(hdev);
> > +err_stop:
> > +     hid_hw_stop(hdev);
> > +     return ret;
> > +}
> > [...]
> > +static const struct hid_device_id ps_devices[] =3D {
> > +     { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTR=
OLLER),
> > +             .driver_data =3D 0 },
> > [...]
>
> `.driver_data` would be initialized to zero anyways, why is it necessary =
to do
> so explicitly?

It is not needed.

>
>
> [1]: https://www.kernel.org/doc/html/latest/process/coding-style.html
>
>
> Regards,
> Barnab=C3=A1s P=C5=91cze

Regards,
Roderick
