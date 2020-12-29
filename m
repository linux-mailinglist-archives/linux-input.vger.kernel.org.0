Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF8AE2E73EB
	for <lists+linux-input@lfdr.de>; Tue, 29 Dec 2020 21:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgL2UWx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Dec 2020 15:22:53 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:10526 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgL2UWw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Dec 2020 15:22:52 -0500
Date:   Tue, 29 Dec 2020 20:22:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1609273329;
        bh=GoUgcGZGleTrOymh55QJCu+y23KAFLBlklrmgqDKxAU=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=DxgNfOFCWomjy3uZMUDnuz75E6QzuZDZnpqPbrdAf7eocaaNQVlKhUvzLnh6dOTKy
         qSqu3fG3Fmw8e5rQ8wZdOEIsTXftzEi6kPfxA7sl5iJXc1kSmz1vr0WhDdMop2kVRp
         Ly7Y2mP/NGnIn0PAQiZJCeVWSXOfOPPBH4S+Nr/Q=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 09/13] HID: playstation: add DualSense lightbar support
Message-ID: <fBgC4UXtvEBK-tKHrYrI0NI-T5ccbEbk41iSr-Cecgexf8t8BpTkukXvGBvxKtFbklXExPd8yJZbUFvoeIgtMOYpeujafDfvgCoOkABk2vg=@protonmail.com>
In-Reply-To: <CANndSKntkgKQokotUYoKrdJ4B9ucKx6FLucEgP=m0ppcxz370g@mail.gmail.com>
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-10-roderick@gaikai.com> <_n_Seien29lcWzPT6LHN7MEtqlVZpJOBRKw-qe01hEhSGbKKL7cffbmSGPjZZIN8Q4B8fInhwChsV0JB70F-wqj44ZQILevS6y3FXYaDtw8=@protonmail.com> <CANndSK=LSFyAf-7BfXJkCVrFcd7Auy64Wtqh65de6T7FkDN1Hw@mail.gmail.com> <mc1Un9RZANQ4yIfAjCv3ziQaVjEBZ6FYCWJjSygax6AZ5L0VS01uBxkmG3kGWYT2_Sf12jQ62ZVG8pwhZUqc7C9Z0L60ZwaONDkoDMhH0Yc=@protonmail.com> <CANndSKntkgKQokotUYoKrdJ4B9ucKx6FLucEgP=m0ppcxz370g@mail.gmail.com>
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

2020. december 29., kedd 20:54 keltez=C3=A9ssel, Roderick Colenbrander =
=C3=ADrta:

> On Tue, Dec 29, 2020 at 10:59 AM Barnab=C3=A1s P=C5=91cze <pobrn@protonma=
il.com> wrote:
> >
> > 2020. december 28., h=C3=A9tf=C5=91 22:26 keltez=C3=A9ssel, Roderick Co=
lenbrander =C3=ADrta:
> >
> > > [...]
> > > > > +/* Create a DualSense/DualShock4 RGB lightbar represented by a m=
ulticolor LED. */
> > > > > +static struct led_classdev_mc *ps_lightbar_create(struct ps_devi=
ce *ps_dev,
> > > > > +     int (*brightness_set)(struct led_classdev *, enum led_brigh=
tness))
> > > > > +{
> > > > > +     struct hid_device *hdev =3D ps_dev->hdev;
> > > > > +     struct led_classdev_mc *lightbar_mc_dev;
> > > > > +     struct mc_subled *mc_led_info;
> > > > > +     struct led_classdev *led_cdev;
> > > > > +     int ret;
> > > > > +
> > > > > +     lightbar_mc_dev =3D devm_kzalloc(&hdev->dev, sizeof(*lightb=
ar_mc_dev), GFP_KERNEL);
> > > > > +     if (!lightbar_mc_dev)
> > > > > +             return ERR_PTR(-ENOMEM);
> > > > > +
> > > > > +     mc_led_info =3D devm_kzalloc(&hdev->dev, 3*sizeof(*mc_led_i=
nfo), GFP_KERNEL);
> > > > > +     if (!mc_led_info)
> > > > > +             return ERR_PTR(-ENOMEM);
> > > > > +
> > > >
> > > > Is there any reason why these are dynamically allocated?
> > >
> > > No particular reason. I should probably at least not dynamically
> > > allocate 'mc_dev' and pass it in similar to regular LED registration
> > > (previously I had my regular LEDs dynamically allocated). The
> > > mc_led_info I will probably keep dynamic. It feels a bit nasty to hav=
e
> > > the caller be aware of these internal details.
> > > [...]
> >
> > Could you please elaborate what you mean by "It feels a bit nasty to ha=
ve
> > the caller be aware of these internal details."? I don't think I fully =
understand
> > what you're referring to.
> >
>
> Maybe I misunderstood your original comment. The question was why both
> 'lightbar_mc_dev' and 'mc_led_info' were dynamically allocated. I
> interpreted it as getting rid of some of the dynamic allocation as
> some wasn't needed, but not sure what you had in mind. The code now
> looks like:
>
> struct dualsense {
> ...
>         /* RGB lightbar */
>         struct led_classdev_mc lightbar; (not a pointer anymore)
> }
>
> static int ps_lightbar_register(struct ps_device *ps_dev, struct
> led_classdev_mc *lightbar_mc_dev,
>               int (*brightness_set)(struct led_classdev *, enum led_brigh=
tness))
> {
>           struct hid_device *hdev =3D ps_dev->hdev;
>           struct mc_subled *mc_led_info;
>           struct led_classdev *led_cdev;
>           int ret;
>
>           mc_led_info =3D devm_kzalloc(&hdev->dev,
> 3*sizeof(*mc_led_info), GFP_KERNEL);
>           if (!mc_led_info)
>                 return -ENOMEM;
>
>           mc_led_info[0].color_index =3D LED_COLOR_ID_RED;
> ...
>
> In here I kept 'mc_led_info' as dynamically allocated. I didn't think
> it made sense to have the caller know about it. What was your original
> idea?
> [...]

Thanks, I thought you meant something different, but this clears it up. By =
the way,
my original idea is really the simplest: have a `struct mc_subled[3]` in th=
e dualsense
struct in addition to the multicolor LED, thus no dynamic allocation (apart=
 from
allocating the dualsense struct) is necessary.
