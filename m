Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F02B82EF1AA
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 12:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbhAHLyI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 06:54:08 -0500
Received: from mail1.protonmail.ch ([185.70.40.18]:44412 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbhAHLyH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jan 2021 06:54:07 -0500
Date:   Fri, 08 Jan 2021 11:53:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610106804;
        bh=QkXjOk+oEqzHJXBAQoicxDfJlfjwkLQ+kvSADp/o3q8=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=JbMeW1yNArj116ugl351pfLRkSzpwiMScCI+E3MpU9x4fjZyJ+u+GeKmTo0HQzW06
         7tFMMK76BqxItKoFazb7aCHmZ1sIKN4H9TO4QQJfXRb2/eNkc8ZmQCIhdt06d3PBP0
         edzrT0Bu9QSkssv+TaPQN5OrnebiRbE6hNm8j+34=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 01/13] HID: playstation: initial DualSense USB support.
Message-ID: <w_A9vpbh55iLS0YEpmqTZ6WE6UcbP4S46COj8QWhG8qf95MZRWoZ2HdjzNurmMYYfzAuLOzw0KLX0bpob3YBsOh-ZPSvlXOj3YOqrfRBtDk=@protonmail.com>
In-Reply-To: <CANndSKmuqD=Ls2UAEjzrzNKH1GV9rfjqu_+gzxRiGcf3oHmFcQ@mail.gmail.com>
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-2-roderick@gaikai.com> <WPROyPA6bw7Qd6BoSwn5qrj7_PMada9lEMUE8Q4kNYXbohSn9fXrFhZIrTKmjmDEn3FDNwyfDPkY-7xYdUnLz6dIvPZvr-up0NsMdJweZ0A=@protonmail.com> <CANndSKmuqD=Ls2UAEjzrzNKH1GV9rfjqu_+gzxRiGcf3oHmFcQ@mail.gmail.com>
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


2021. janu=C3=A1r 8., p=C3=A9ntek 8:12 keltez=C3=A9ssel, Roderick Colenbran=
der =C3=ADrta:

> [...]
> > > +static int dualsense_parse_report(struct ps_device *ps_dev, struct h=
id_report *report,
> > > +             u8 *data, int size)
> > > +{
> > > +     struct hid_device *hdev =3D ps_dev->hdev;
> > > +     struct dualsense *ds =3D container_of(ps_dev, struct dualsense,=
 base);
> > > +     struct dualsense_input_report *ds_report;
> > > +     uint8_t value;
> > > +
> >
> > I think `size` should be checked somewhere around here.
> >
> >
> > > +     /* DualSense in USB uses the full HID report for reportID 1, bu=
t
> > > +      * Bluetooth uses a minimal HID report for reportID 1 and repor=
ts
> > > +      * the full report using reportID 49.
> > > +      */
> > > +     if (report->id =3D=3D DS_INPUT_REPORT_USB && hdev->bus =3D=3D B=
US_USB) {
> > > +             ds_report =3D (struct dualsense_input_report *)&data[1]=
;
> > > +     } else {
> > > +             hid_err(hdev, "Unhandled reportID=3D%d\n", report->id);
> > > +             return -1;
> > > +     }
> > > +
> > > +     input_report_abs(ds->gamepad, ABS_X,  ds_report->x);
> > > +     input_report_abs(ds->gamepad, ABS_Y,  ds_report->y);
> > > +     input_report_abs(ds->gamepad, ABS_RX, ds_report->rx);
> > > +     input_report_abs(ds->gamepad, ABS_RY, ds_report->ry);
> > > +     input_report_abs(ds->gamepad, ABS_Z,  ds_report->z);
> > > +     input_report_abs(ds->gamepad, ABS_RZ, ds_report->rz);
> > > +
> > > +     value =3D ds_report->buttons[0] & DS_BUTTONS0_HAT_SWITCH;
> > > +     if (value > 7)
> > > +             value =3D 8; /* center */
> >
> > This seems a bit flimsy to me, it relies on a different part of the cod=
e
> > being in a certain way that is not enforced by anything
>
> What do you mean with not enforced? I'm not saying I'm a big fan of
> the code, but HATs seem to work like this. The DualShock4/DualSense
> describe it in their HID descriptors with a logical minimum value of 0
> and a max value of 7.

What I really meant is that I think it would be better to somehow decrease
the chances of unintentionally breaking the code by providing stronger
guarantees that `ps_gamepad_hat_mapping[value]` will not be an out of bound=
s
access. E.g. checking with static_assert that it has 9 elements, using
ARRAY_SIZE() in some way in the condition, etc. I'm not trying to say it's
very probable, but I think it's easily preventable and thus it should be do=
ne.

By "not enforced", I meant that there are no compile time or even runtime g=
uarantees
that the `ps_gamepad_hat_mapping` contains as many elements as expected by =
this
part of the code.


>
> The code is very similar to hid-input.c:
>
> static const struct {
> __s32 x;
> __s32 y;
> }  hid_hat_to_axis[] =3D {{ 0, 0}, { 0,-1}, { 1,-1}, { 1, 0}, { 1, 1}, {
> 0, 1}, {-1, 1}, {-1, 0}, {-1,-1}};
>
> int hat_dir =3D usage->hat_dir;
> if (!hat_dir)
>     hat_dir =3D (value - usage->hat_min) * 8 / (usage->hat_max -
> usage->hat_min + 1) + 1;
> if (hat_dir < 0 || hat_dir > 8) hat_dir =3D 0;
> input_event(input, usage->type, usage->code    , hid_hat_to_axis[hat_dir]=
.x);
> input_event(input, usage->type, usage->code + 1, hid_hat_to_axis[hat_dir]=
.y);
>
> Main difference seems to be that this code places {0, 0} at the start
> and adds a "+1" to avoid having to set the value to "8" when out of
> range.
>
>  I'd probably do something
> > like this:
> >
> > enum {
> >   HAT_DIR_W =3D 0,
> >   HAT_DIR_NW,
> >   ...
> >   HAT_DIR_SW,
> >   HAT_DIR_NONE,
> > };
> >
> > static const struct {int x; int y; } ps_gamepad_hat_mapping[] =3D {
> >   [HAT_DIR_W] =3D {0, -1},
> >   ...
> >   [HAT_DIR_NONE] =3D {0, 0},
> > };
> >
> > and then
> >
> > if (value >=3D ARRAY_SIZE(ps_gamepad_hat_mapping))
> >   value =3D HAT_DIR_NONE;
> >
> > Please consider it. By the way, are values 9..15 actually sent by the c=
ontroller?
>
> See above. They are not sent. The Hat Switch in the report descriptor
> is reported with a logical minimum of 0 and a max of 8.
>
> >
> > > +     input_report_abs(ds->gamepad, ABS_HAT0X, ps_gamepad_hat_mapping=
[value].x);
> > > +     input_report_abs(ds->gamepad, ABS_HAT0Y, ps_gamepad_hat_mapping=
[value].y);
> > > +
> > > +     input_report_key(ds->gamepad, BTN_WEST,   ds_report->buttons[0]=
 & DS_BUTTONS0_SQUARE);
> > > +     input_report_key(ds->gamepad, BTN_SOUTH,  ds_report->buttons[0]=
 & DS_BUTTONS0_CROSS);
> > > +     input_report_key(ds->gamepad, BTN_EAST,   ds_report->buttons[0]=
 & DS_BUTTONS0_CIRCLE);
> > > +     input_report_key(ds->gamepad, BTN_NORTH,  ds_report->buttons[0]=
 & DS_BUTTONS0_TRIANGLE);
> > > +     input_report_key(ds->gamepad, BTN_TL,     ds_report->buttons[1]=
 & DS_BUTTONS1_L1);
> > > +     input_report_key(ds->gamepad, BTN_TR,     ds_report->buttons[1]=
 & DS_BUTTONS1_R1);
> > > +     input_report_key(ds->gamepad, BTN_TL2,    ds_report->buttons[1]=
 & DS_BUTTONS1_L2);
> > > +     input_report_key(ds->gamepad, BTN_TR2,    ds_report->buttons[1]=
 & DS_BUTTONS1_R2);
> > > +     input_report_key(ds->gamepad, BTN_SELECT, ds_report->buttons[1]=
 & DS_BUTTONS1_CREATE);
> > > +     input_report_key(ds->gamepad, BTN_START,  ds_report->buttons[1]=
 & DS_BUTTONS1_OPTIONS);
> > > +     input_report_key(ds->gamepad, BTN_THUMBL, ds_report->buttons[1]=
 & DS_BUTTONS1_L3);
> > > +     input_report_key(ds->gamepad, BTN_THUMBR, ds_report->buttons[1]=
 & DS_BUTTONS1_R3);
> > > +     input_report_key(ds->gamepad, BTN_MODE,   ds_report->buttons[2]=
 & DS_BUTTONS2_PS_HOME);
> > > +     input_sync(ds->gamepad);
> > > +
> > > +     return 0;
> > > +}
> [...]


Regards,
Barnab=C3=A1s P=C5=91cze
