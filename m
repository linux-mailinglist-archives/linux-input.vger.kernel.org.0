Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 693F72E732F
	for <lists+linux-input@lfdr.de>; Tue, 29 Dec 2020 20:13:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgL2TNf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Dec 2020 14:13:35 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:52660 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbgL2TNf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Dec 2020 14:13:35 -0500
Date:   Tue, 29 Dec 2020 19:12:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1609269172;
        bh=U12bqB4G8YzGXSkybBhoBvoeNxokBjk4GYd/+OGvR18=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=lQHZyQpHmF8Wx2MtNCO4JnJ/dRVrtWr+gjrYWZiv30cebgCVee2poSPRALTdKbKtc
         fsomtQaDYjwcDnBqKCzSxLLFXYWfC3UzoK8IuWyCwakIpzYHq/13za4dq8MNx0E2JZ
         j9Nz1JDkmbJh6Kq40QUHZqVqs5pZieQ2lMkow6po=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 01/13] HID: playstation: initial DualSense USB support.
Message-ID: <8rsKxzY-iTczahhdGPIJKVLelQDsVzynWy9njvI9ZaOE-1qQbbE3yXMhLztiPzkkgvMPSwwb_B_rDX-YYKxir9lXR1h1CyPAIdtGABmzaco=@protonmail.com>
In-Reply-To: <CANndSKkV5HNtR=CkDekmt8xeNjSdS0Kvws5d0MQcdHV1Bf8diw@mail.gmail.com>
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-2-roderick@gaikai.com> <UjCauECbGit_XggmgM71Kv0ThBi0MgxkFW7ZczFePrg1vxi21QA05fw9YAAu9i10oBgg-E7VqouP2FtX-fNdqFUUvIDqy_v6uwkX31PYFpg=@protonmail.com> <CANndSKkV5HNtR=CkDekmt8xeNjSdS0Kvws5d0MQcdHV1Bf8diw@mail.gmail.com>
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

2020. december 28., h=C3=A9tf=C5=91 0:04 keltez=C3=A9ssel, Roderick Colenbr=
ander =C3=ADrta:

> [...]
> > > +     struct dualsense_input_report *ds_report;
> > > +     uint8_t value;
> > > +
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
> > > +     input_report_abs(ds->gamepad, ABS_X, ds_report->x);
> > > +     input_report_abs(ds->gamepad, ABS_Y, ds_report->y);
> > > +     input_report_abs(ds->gamepad, ABS_RX, ds_report->rx);
> > > +     input_report_abs(ds->gamepad, ABS_RY, ds_report->ry);
> > > +     input_report_abs(ds->gamepad, ABS_Z, ds_report->z);
> > > +     input_report_abs(ds->gamepad, ABS_RZ, ds_report->rz);
> > > +
> > > +     value =3D ds_report->buttons[0] & DS_BUTTONS0_HAT_SWITCH;
> > > +     if (value > 7)
> > > +             value =3D 8; /* center */
> > > +     input_report_abs(ds->gamepad, ABS_HAT0X, ps_gamepad_hat_mapping=
[value].x);
> > > +     input_report_abs(ds->gamepad, ABS_HAT0Y, ps_gamepad_hat_mapping=
[value].y);
> > > +
> > > +     input_report_key(ds->gamepad, BTN_WEST, ds_report->buttons[0] &=
 DS_BUTTONS0_SQUARE);
> > > +     input_report_key(ds->gamepad, BTN_SOUTH, ds_report->buttons[0] =
& DS_BUTTONS0_CROSS);
> > > +     input_report_key(ds->gamepad, BTN_EAST, ds_report->buttons[0] &=
 DS_BUTTONS0_CIRCLE);
> > > +     input_report_key(ds->gamepad, BTN_NORTH, ds_report->buttons[0] =
& DS_BUTTONS0_TRIANGLE);
> > > +     input_report_key(ds->gamepad, BTN_TL, ds_report->buttons[1] & D=
S_BUTTONS1_L1);
> > > +     input_report_key(ds->gamepad, BTN_TR, ds_report->buttons[1] & D=
S_BUTTONS1_R1);
> > > +     input_report_key(ds->gamepad, BTN_TL2, ds_report->buttons[1] & =
DS_BUTTONS1_L2);
> > > +     input_report_key(ds->gamepad, BTN_TR2, ds_report->buttons[1] & =
DS_BUTTONS1_R2);
> > > +     input_report_key(ds->gamepad, BTN_SELECT, ds_report->buttons[1]=
 & DS_BUTTONS1_CREATE);
> > > +     input_report_key(ds->gamepad, BTN_START, ds_report->buttons[1] =
& DS_BUTTONS1_OPTIONS);
> > > +     input_report_key(ds->gamepad, BTN_THUMBL, ds_report->buttons[1]=
 & DS_BUTTONS1_L3);
> > > +     input_report_key(ds->gamepad, BTN_THUMBR, ds_report->buttons[1]=
 & DS_BUTTONS1_R3);
> > > +     input_report_key(ds->gamepad, BTN_MODE, ds_report->buttons[2] &=
 DS_BUTTONS2_PS_HOME);
> >
> > Possibly this could be replaced with a loop? I have something like this=
 in mind:
> >
> > ```
> > struct ps_gamepad_button {
> >   unsigned int code;
> >   uint8_t button_idx;
> >   uint8_t mask;
> > } ps_gamepad_buttons[] =3D {...};
> >
> > for (...) {
> >   struct ps_gamepad_button *b =3D ...;
> >   input_report_key(...);
> > }
> > ```
> >
> > Or is there any reason why the unrolled version is preffered that I'm m=
issing?
>
> It can be done from a loop. Main reason for unrolled was that it is
> actually less code and potentially a tiny bit faster, but I bet a
> compiler would have unrolled it anyway. I don't know what I want to do
> here. Being explicit feels nice (other drivers do something similar).
> [...]

I agree that the compiler would've probably unrolled it. I'd personally con=
sider
the loop version to be shorter as I'd not consider the static array "code" =
-
it's really just data initialization. Anyways, may I suggest then to align =
the
parameters so that the given parameter of each call starts in the same colu=
mn?
I think it helps readability a good deal.
