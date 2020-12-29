Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4FF62E7322
	for <lists+linux-input@lfdr.de>; Tue, 29 Dec 2020 20:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgL2TAZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Dec 2020 14:00:25 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:46318 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgL2TAZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Dec 2020 14:00:25 -0500
Date:   Tue, 29 Dec 2020 18:59:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1609268382;
        bh=vPJn7J1kEKFxBnc6s4Rz+y18HTaQaBq0rrKnBd4xxSk=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Mi9iFECVbTn2wsMXoe3QELmy1q1zYRK3903q55Xm6DXbAmrwx9o2TJMzGhPPafz6D
         FeBrRA//Db9jchacl3Vk+PuEj/JYAwBe1Axa5aTeQeYuywbabHy7jzIhwFIYlkHDTy
         mLTSyyQgreqERCBQylnRf61UFsuqd5xN8YdTOdcs=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 09/13] HID: playstation: add DualSense lightbar support
Message-ID: <mc1Un9RZANQ4yIfAjCv3ziQaVjEBZ6FYCWJjSygax6AZ5L0VS01uBxkmG3kGWYT2_Sf12jQ62ZVG8pwhZUqc7C9Z0L60ZwaONDkoDMhH0Yc=@protonmail.com>
In-Reply-To: <CANndSK=LSFyAf-7BfXJkCVrFcd7Auy64Wtqh65de6T7FkDN1Hw@mail.gmail.com>
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-10-roderick@gaikai.com> <_n_Seien29lcWzPT6LHN7MEtqlVZpJOBRKw-qe01hEhSGbKKL7cffbmSGPjZZIN8Q4B8fInhwChsV0JB70F-wqj44ZQILevS6y3FXYaDtw8=@protonmail.com> <CANndSK=LSFyAf-7BfXJkCVrFcd7Auy64Wtqh65de6T7FkDN1Hw@mail.gmail.com>
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

2020. december 28., h=C3=A9tf=C5=91 22:26 keltez=C3=A9ssel, Roderick Colenb=
rander =C3=ADrta:

> [...]
> > > +/* Create a DualSense/DualShock4 RGB lightbar represented by a multi=
color LED. */
> > > +static struct led_classdev_mc *ps_lightbar_create(struct ps_device *=
ps_dev,
> > > +     int (*brightness_set)(struct led_classdev *, enum led_brightnes=
s))
> > > +{
> > > +     struct hid_device *hdev =3D ps_dev->hdev;
> > > +     struct led_classdev_mc *lightbar_mc_dev;
> > > +     struct mc_subled *mc_led_info;
> > > +     struct led_classdev *led_cdev;
> > > +     int ret;
> > > +
> > > +     lightbar_mc_dev =3D devm_kzalloc(&hdev->dev, sizeof(*lightbar_m=
c_dev), GFP_KERNEL);
> > > +     if (!lightbar_mc_dev)
> > > +             return ERR_PTR(-ENOMEM);
> > > +
> > > +     mc_led_info =3D devm_kzalloc(&hdev->dev, 3*sizeof(*mc_led_info)=
, GFP_KERNEL);
> > > +     if (!mc_led_info)
> > > +             return ERR_PTR(-ENOMEM);
> > > +
> >
> > Is there any reason why these are dynamically allocated?
>
> No particular reason. I should probably at least not dynamically
> allocate 'mc_dev' and pass it in similar to regular LED registration
> (previously I had my regular LEDs dynamically allocated). The
> mc_led_info I will probably keep dynamic. It feels a bit nasty to have
> the caller be aware of these internal details.
> [...]

Could you please elaborate what you mean by "It feels a bit nasty to have
the caller be aware of these internal details."? I don't think I fully unde=
rstand
what you're referring to.

