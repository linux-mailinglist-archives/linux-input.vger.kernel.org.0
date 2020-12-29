Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB3062E734C
	for <lists+linux-input@lfdr.de>; Tue, 29 Dec 2020 20:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgL2Tza (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Dec 2020 14:55:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgL2Tza (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Dec 2020 14:55:30 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 167EAC061574
        for <linux-input@vger.kernel.org>; Tue, 29 Dec 2020 11:54:49 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id p14so12298171qke.6
        for <linux-input@vger.kernel.org>; Tue, 29 Dec 2020 11:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tAHFW1CBaNLQ1dzYrERrNdAhUKfUF0OEmiHPUZdPpbw=;
        b=wJhpS5LNyRbcGAZOls8O3S1ojdHyWhR8jWhLyZYcr9mdAAuk/G3ofKP9y3DmaG0umo
         gcLzAX9vzXrlCuZSJr56u5A/V9237EYeTGSbeUh9ks55UwQQ5rrVav5sh/o7IJoY3Ejw
         FjBlWzbn0TKw0FjeBNpXAWl/ZzOcOYcpOy5Z7kunnpYuwXjJBqle/+8Xr7gd4N0thQef
         YpT1mAEebMGG2+QwFGEQ+2W2ghit/f92tUN+BUSAt0Fn14KXgRQq/Vk3RMe+cjbOoYPV
         A8ZbBeGL/RUIxVfdGigrzzPiaDMgNNQi3WIHduxhoufrrbJWkPfjMtro1b8OHRqJDZok
         Q6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tAHFW1CBaNLQ1dzYrERrNdAhUKfUF0OEmiHPUZdPpbw=;
        b=k+mjuM7cQaro5MyTWmA8FEvrmLPvDIKa2rup0VLNmn63vWQMbtpljZXbpR0EjRJawH
         cPbLwJGtKux8YaiKQRTpHfUccsaWzT4yrVSjiY6uSOKK7wEnwPKkVXPEhd+SvOqpbGGj
         G3Yr+XQOBW1M1SRIP7UG705yS0thcNIbs7lvu1m16p8P7N1bL/USo/Wo7/Xj8RpnD16M
         iHVGElPGpPuJ5V7hz1jFVy5hbRjMXw9nrjlkA/Spm6GCPx3LhYYIK2arlY8FnkM0iLRr
         YGpvmWURLXKJD8Y+GJOC1pAs1KImkoJ3k6OQdTGvLMKxub7CZZFqDdYbwiGvorkFrogu
         AEFw==
X-Gm-Message-State: AOAM533PLd7/8TXV748Uh8mXR04WgsL5vm9kfO1Rw7Vrh16Q/4C5oG+n
        XzA7FDKQomNLv9iaALXuNNliG3hNc0z/U2mtpaLcvg==
X-Google-Smtp-Source: ABdhPJxVEeAP+f4Vys4ORYJODgTJxLTnIswNHKOTDKr7k4vJPUjOMLQvLNuBxhudSeg87NR0A5GAiMs6T8fzEX3lvMs=
X-Received: by 2002:a37:bd01:: with SMTP id n1mr50797570qkf.469.1609271688987;
 Tue, 29 Dec 2020 11:54:48 -0800 (PST)
MIME-Version: 1.0
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-10-roderick@gaikai.com>
 <_n_Seien29lcWzPT6LHN7MEtqlVZpJOBRKw-qe01hEhSGbKKL7cffbmSGPjZZIN8Q4B8fInhwChsV0JB70F-wqj44ZQILevS6y3FXYaDtw8=@protonmail.com>
 <CANndSK=LSFyAf-7BfXJkCVrFcd7Auy64Wtqh65de6T7FkDN1Hw@mail.gmail.com> <mc1Un9RZANQ4yIfAjCv3ziQaVjEBZ6FYCWJjSygax6AZ5L0VS01uBxkmG3kGWYT2_Sf12jQ62ZVG8pwhZUqc7C9Z0L60ZwaONDkoDMhH0Yc=@protonmail.com>
In-Reply-To: <mc1Un9RZANQ4yIfAjCv3ziQaVjEBZ6FYCWJjSygax6AZ5L0VS01uBxkmG3kGWYT2_Sf12jQ62ZVG8pwhZUqc7C9Z0L60ZwaONDkoDMhH0Yc=@protonmail.com>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Tue, 29 Dec 2020 11:54:38 -0800
Message-ID: <CANndSKntkgKQokotUYoKrdJ4B9ucKx6FLucEgP=m0ppcxz370g@mail.gmail.com>
Subject: Re: [PATCH 09/13] HID: playstation: add DualSense lightbar support
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

On Tue, Dec 29, 2020 at 10:59 AM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail=
.com> wrote:
>
> 2020. december 28., h=C3=A9tf=C5=91 22:26 keltez=C3=A9ssel, Roderick Cole=
nbrander =C3=ADrta:
>
> > [...]
> > > > +/* Create a DualSense/DualShock4 RGB lightbar represented by a mul=
ticolor LED. */
> > > > +static struct led_classdev_mc *ps_lightbar_create(struct ps_device=
 *ps_dev,
> > > > +     int (*brightness_set)(struct led_classdev *, enum led_brightn=
ess))
> > > > +{
> > > > +     struct hid_device *hdev =3D ps_dev->hdev;
> > > > +     struct led_classdev_mc *lightbar_mc_dev;
> > > > +     struct mc_subled *mc_led_info;
> > > > +     struct led_classdev *led_cdev;
> > > > +     int ret;
> > > > +
> > > > +     lightbar_mc_dev =3D devm_kzalloc(&hdev->dev, sizeof(*lightbar=
_mc_dev), GFP_KERNEL);
> > > > +     if (!lightbar_mc_dev)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +
> > > > +     mc_led_info =3D devm_kzalloc(&hdev->dev, 3*sizeof(*mc_led_inf=
o), GFP_KERNEL);
> > > > +     if (!mc_led_info)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +
> > >
> > > Is there any reason why these are dynamically allocated?
> >
> > No particular reason. I should probably at least not dynamically
> > allocate 'mc_dev' and pass it in similar to regular LED registration
> > (previously I had my regular LEDs dynamically allocated). The
> > mc_led_info I will probably keep dynamic. It feels a bit nasty to have
> > the caller be aware of these internal details.
> > [...]
>
> Could you please elaborate what you mean by "It feels a bit nasty to have
> the caller be aware of these internal details."? I don't think I fully un=
derstand
> what you're referring to.
>

Maybe I misunderstood your original comment. The question was why both
'lightbar_mc_dev' and 'mc_led_info' were dynamically allocated. I
interpreted it as getting rid of some of the dynamic allocation as
some wasn't needed, but not sure what you had in mind. The code now
looks like:

struct dualsense {
...
        /* RGB lightbar */
        struct led_classdev_mc lightbar; (not a pointer anymore)
}

static int ps_lightbar_register(struct ps_device *ps_dev, struct
led_classdev_mc *lightbar_mc_dev,
              int (*brightness_set)(struct led_classdev *, enum led_brightn=
ess))
{
          struct hid_device *hdev =3D ps_dev->hdev;
          struct mc_subled *mc_led_info;
          struct led_classdev *led_cdev;
          int ret;

          mc_led_info =3D devm_kzalloc(&hdev->dev,
3*sizeof(*mc_led_info), GFP_KERNEL);
          if (!mc_led_info)
                return -ENOMEM;

          mc_led_info[0].color_index =3D LED_COLOR_ID_RED;
...

In here I kept 'mc_led_info' as dynamically allocated. I didn't think
it made sense to have the caller know about it. What was your original
idea?

Regards,
Roderick
