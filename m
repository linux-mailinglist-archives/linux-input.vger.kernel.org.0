Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE582EEDBA
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 08:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbhAHHNM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 02:13:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726312AbhAHHNM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jan 2021 02:13:12 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0498FC0612F4
        for <linux-input@vger.kernel.org>; Thu,  7 Jan 2021 23:12:31 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id 22so7725502qkf.9
        for <linux-input@vger.kernel.org>; Thu, 07 Jan 2021 23:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HmoGBIut6Ch8HO80VtEOtFiPz+uc2B7hXYnMOBJTf9I=;
        b=DSTnAnj1i9W1CmQZEScoPmca0MMAFIBJgdZAsLIKaQrNTHBKZFONKiWucv970Ly748
         FjvTbFiXVPt+a5QEvMpZ+eJ12jIcOk+NvvoMA/Mwm6Vac2DAv9ULlUMx/7+fKxOSlqPp
         jX4qkaXCB8Q8JjmA8uJgbjXJm7RRzg/d/5Hod+ZeJb/xB5BjLZ1CjDPTjWf7W8kzGd9Y
         BpgvgAuyONamikYndrFvZFHfCWOQxNo/tUB7bds1CC4IYZpp+bG+4o1+fsy2gLhlcpql
         Z/d7LfZYWB/OXfiDoP6FoetZTr5rY4CPIxh9BhmvnG9l5dufkrY6E48vsxMjz6ubBapm
         I6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HmoGBIut6Ch8HO80VtEOtFiPz+uc2B7hXYnMOBJTf9I=;
        b=pcE7E5joibi4t3iKUie0C1ObroKirhiXScG/chfbbd79Ff+Ilfap5z3ypOzb6lg9lu
         I6DE8x0KmsDgPjzgBk+KN+9jIjmzN4g/6E5MaOjiwK7EtTFodlUD6mAm+MnPsH6lLWze
         cOhCG3h510zFBTJkKsFePTB3uXb6lRP3D2T1gDrUEyAKJUpB1pZiy8mktynZAq+llnxG
         urtGMKw1XML6LmvVQPLoSQG3zyOkfEXbQV0jIbJDtWOeAg41xT5s5Ng1bQR/yNLuo65i
         8VsOwj/F2KDaPfv/lcbsSAMTOCWKv1lN45hgA0PblT5RRQCjT5NSf0fhBFnUbWtgYVyj
         IbOw==
X-Gm-Message-State: AOAM53358PfdGeOCwNjpJbaS2XBYgi7GFVXYnrrfAY7UuyQ7Wx7mDfMa
        vcdKPcu4rXKCHNfS/ViKSJnhSyXc5M0WDSEI4x+Gyf4UqAAdAg==
X-Google-Smtp-Source: ABdhPJyUR7JH8IelAPb097qySuIfOKrINkEj2xYmL1jk3jC0nTJv+OG0zXQfpnw8992B+dRa/mQWPkwKHmXfv16FklI=
X-Received: by 2002:a37:bd01:: with SMTP id n1mr2590802qkf.469.1610089950714;
 Thu, 07 Jan 2021 23:12:30 -0800 (PST)
MIME-Version: 1.0
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-2-roderick@gaikai.com>
 <WPROyPA6bw7Qd6BoSwn5qrj7_PMada9lEMUE8Q4kNYXbohSn9fXrFhZIrTKmjmDEn3FDNwyfDPkY-7xYdUnLz6dIvPZvr-up0NsMdJweZ0A=@protonmail.com>
In-Reply-To: <WPROyPA6bw7Qd6BoSwn5qrj7_PMada9lEMUE8Q4kNYXbohSn9fXrFhZIrTKmjmDEn3FDNwyfDPkY-7xYdUnLz6dIvPZvr-up0NsMdJweZ0A=@protonmail.com>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Thu, 7 Jan 2021 23:12:19 -0800
Message-ID: <CANndSKmuqD=Ls2UAEjzrzNKH1GV9rfjqu_+gzxRiGcf3oHmFcQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] HID: playstation: initial DualSense USB support.
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

Hi Barnabas,

Thanks for your suggestions.

On Thu, Jan 7, 2021 at 9:14 AM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.c=
om> wrote:
>
> Hi
>
>
> I have just a couple minor comments.
>
>
> 2021. janu=C3=A1r 2., szombat 23:30 keltez=C3=A9ssel, Roderick Colenbrand=
er =C3=ADrta:
>
> > From: Roderick Colenbrander roderick.colenbrander@sony.com
> >
> > Implement support for PlayStation DualSense gamepad in USB mode.
> > Support features include buttons and sticks, which adhere to the
> > Linux gamepad spec.
> >
> > Signed-off-by: Roderick Colenbrander roderick.colenbrander@sony.com
> > [...]
> > +/* Common gamepad buttons across DualShock 3 / 4 and DualSense.
> > + * Note: for device with a touchpad, touchpad button is not included
> > + *        as it will be part of the touchpad device.
> > + */
> > +static const int ps_gamepad_buttons[] =3D {
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
> > +
> > +static const struct {int x; int y; } ps_gamepad_hat_mapping[] =3D {
> > +     {0, -1}, {1, -1}, {1, 0}, {1, 1}, {0, 1}, {-1, 1}, {-1, 0}, {-1, =
-1},
> > +     {0, 0}
> > +};
>
> I believe the preferred way is to have a comma after each array/enum/etc.=
 element
> unless it is a terminating entry.
>
>
> > +
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
> > +     } else {
> > +             input_dev->name =3D hdev->name;
> > +     }
> > +
> > +     input_set_drvdata(input_dev, hdev);
> > +
> > +     return input_dev;
> > +}
> > +
> > +static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
> > +{
> > +     struct input_dev *gamepad;
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     gamepad =3D ps_allocate_input_dev(hdev, NULL);
> > +     if (IS_ERR(gamepad))
> > +             return ERR_PTR(-ENOMEM);
>
> I know that at the moment ENOMEM is the only possible error, but I believ=
e
> `return ERR_CAST(gamepad);` would be better. (Or even just `return gamepa=
d;`.)
>
>
> > +
> > +     input_set_abs_params(gamepad, ABS_X, 0, 255, 0, 0);
> > +     input_set_abs_params(gamepad, ABS_Y, 0, 255, 0, 0);
> > +     input_set_abs_params(gamepad, ABS_Z, 0, 255, 0, 0);
> > +     input_set_abs_params(gamepad, ABS_RX, 0, 255, 0, 0);
> > +     input_set_abs_params(gamepad, ABS_RY, 0, 255, 0, 0);
> > +     input_set_abs_params(gamepad, ABS_RZ, 0, 255, 0, 0);
> > +
> > +     input_set_abs_params(gamepad, ABS_HAT0X, -1, 1, 0, 0);
> > +     input_set_abs_params(gamepad, ABS_HAT0Y, -1, 1, 0, 0);
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(ps_gamepad_buttons); i++)
> > +             input_set_capability(gamepad, EV_KEY, ps_gamepad_buttons[=
i]);
> > +
> > +     ret =3D input_register_device(gamepad);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     return gamepad;
> > +}
> > +
> > +static int dualsense_parse_report(struct ps_device *ps_dev, struct hid=
_report *report,
> > +             u8 *data, int size)
> > +{
> > +     struct hid_device *hdev =3D ps_dev->hdev;
> > +     struct dualsense *ds =3D container_of(ps_dev, struct dualsense, b=
ase);
> > +     struct dualsense_input_report *ds_report;
> > +     uint8_t value;
> > +
>
> I think `size` should be checked somewhere around here.
>
>
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
> > +     input_report_abs(ds->gamepad, ABS_X,  ds_report->x);
> > +     input_report_abs(ds->gamepad, ABS_Y,  ds_report->y);
> > +     input_report_abs(ds->gamepad, ABS_RX, ds_report->rx);
> > +     input_report_abs(ds->gamepad, ABS_RY, ds_report->ry);
> > +     input_report_abs(ds->gamepad, ABS_Z,  ds_report->z);
> > +     input_report_abs(ds->gamepad, ABS_RZ, ds_report->rz);
> > +
> > +     value =3D ds_report->buttons[0] & DS_BUTTONS0_HAT_SWITCH;
> > +     if (value > 7)
> > +             value =3D 8; /* center */
>
> This seems a bit flimsy to me, it relies on a different part of the code
> being in a certain way that is not enforced by anything

What do you mean with not enforced? I'm not saying I'm a big fan of
the code, but HATs seem to work like this. The DualShock4/DualSense
describe it in their HID descriptors with a logical minimum value of 0
and a max value of 7.

The code is very similar to hid-input.c:

static const struct {
__s32 x;
__s32 y;
}  hid_hat_to_axis[] =3D {{ 0, 0}, { 0,-1}, { 1,-1}, { 1, 0}, { 1, 1}, {
0, 1}, {-1, 1}, {-1, 0}, {-1,-1}};

int hat_dir =3D usage->hat_dir;
if (!hat_dir)
    hat_dir =3D (value - usage->hat_min) * 8 / (usage->hat_max -
usage->hat_min + 1) + 1;
if (hat_dir < 0 || hat_dir > 8) hat_dir =3D 0;
input_event(input, usage->type, usage->code    , hid_hat_to_axis[hat_dir].x=
);
input_event(input, usage->type, usage->code + 1, hid_hat_to_axis[hat_dir].y=
);

Main difference seems to be that this code places {0, 0} at the start
and adds a "+1" to avoid having to set the value to "8" when out of
range.

 I'd probably do something
> like this:
>
> enum {
>   HAT_DIR_W =3D 0,
>   HAT_DIR_NW,
>   ...
>   HAT_DIR_SW,
>   HAT_DIR_NONE,
> };
>
> static const struct {int x; int y; } ps_gamepad_hat_mapping[] =3D {
>   [HAT_DIR_W] =3D {0, -1},
>   ...
>   [HAT_DIR_NONE] =3D {0, 0},
> };
>
> and then
>
> if (value >=3D ARRAY_SIZE(ps_gamepad_hat_mapping))
>   value =3D HAT_DIR_NONE;
>
> Please consider it. By the way, are values 9..15 actually sent by the con=
troller?

See above. They are not sent. The Hat Switch in the report descriptor
is reported with a logical minimum of 0 and a max of 8.

>
> > +     input_report_abs(ds->gamepad, ABS_HAT0X, ps_gamepad_hat_mapping[v=
alue].x);
> > +     input_report_abs(ds->gamepad, ABS_HAT0Y, ps_gamepad_hat_mapping[v=
alue].y);
> > +
> > +     input_report_key(ds->gamepad, BTN_WEST,   ds_report->buttons[0] &=
 DS_BUTTONS0_SQUARE);
> > +     input_report_key(ds->gamepad, BTN_SOUTH,  ds_report->buttons[0] &=
 DS_BUTTONS0_CROSS);
> > +     input_report_key(ds->gamepad, BTN_EAST,   ds_report->buttons[0] &=
 DS_BUTTONS0_CIRCLE);
> > +     input_report_key(ds->gamepad, BTN_NORTH,  ds_report->buttons[0] &=
 DS_BUTTONS0_TRIANGLE);
> > +     input_report_key(ds->gamepad, BTN_TL,     ds_report->buttons[1] &=
 DS_BUTTONS1_L1);
> > +     input_report_key(ds->gamepad, BTN_TR,     ds_report->buttons[1] &=
 DS_BUTTONS1_R1);
> > +     input_report_key(ds->gamepad, BTN_TL2,    ds_report->buttons[1] &=
 DS_BUTTONS1_L2);
> > +     input_report_key(ds->gamepad, BTN_TR2,    ds_report->buttons[1] &=
 DS_BUTTONS1_R2);
> > +     input_report_key(ds->gamepad, BTN_SELECT, ds_report->buttons[1] &=
 DS_BUTTONS1_CREATE);
> > +     input_report_key(ds->gamepad, BTN_START,  ds_report->buttons[1] &=
 DS_BUTTONS1_OPTIONS);
> > +     input_report_key(ds->gamepad, BTN_THUMBL, ds_report->buttons[1] &=
 DS_BUTTONS1_L3);
> > +     input_report_key(ds->gamepad, BTN_THUMBR, ds_report->buttons[1] &=
 DS_BUTTONS1_R3);
> > +     input_report_key(ds->gamepad, BTN_MODE,   ds_report->buttons[2] &=
 DS_BUTTONS2_PS_HOME);
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
> > +     hdev->version |=3D HID_PLAYSTATION_VERSION_PATCH;
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
> > +     return &ds->base;
> > +
> > +err:
> > +     return ERR_PTR(ret);
> > +}
> > [...]
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
>
> I'm still not fully seeing the purpose of this `if`. The probe should not=
 be
> called for devices not in the id_table, so this seems to me to be a long =
way
> of writing `if (true)`. Or am I missing something?

It is not used. It more there for the future, when we will add
DualShock 4 and perhaps some other devices here.

>
> > +             dev =3D dualsense_create(hdev);
> > +             if (IS_ERR(dev)) {
> > +                     hid_err(hdev, "Failed to create dualsense.\n");
>
> I think it'd be preferable if all log messages would either be lowercase =
or
> uppercase, not a mix of both. Same for punctuation. This applies to all p=
atches.
>
>
> > +                     ret =3D PTR_ERR(dev);
> > +                     goto err_close;
> > +             }
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
>
>
> Regards,
> Barnab=C3=A1s P=C5=91cze



Regards,
Roderick Colenbrander
