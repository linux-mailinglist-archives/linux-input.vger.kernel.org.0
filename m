Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45CA386B23
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2019 22:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390202AbfHHUK3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Aug 2019 16:10:29 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55473 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbfHHUK3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Aug 2019 16:10:29 -0400
Received: by mail-wm1-f67.google.com with SMTP id f72so3535134wmf.5
        for <linux-input@vger.kernel.org>; Thu, 08 Aug 2019 13:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joaomoreno-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YXO2XrMQEkvCHSDYBP5IAQUANS6uEyXDlrIGYeaenS8=;
        b=Gjm5hEzlrTnz8eBZOL5X3rbSIYCV7l2XItN05uzxmEA62vtE3SGTwIHMSdhpmDmaLJ
         UU0Tp535BGhNDGB+aM1Gg3sTnAQzrw8c/CkG2z45k+NEiWMUKfap/3DZFMZ7FMzrHU3x
         SxCD9WenLFTtktJvRlw32UJJZVDAWtCDRIM2xsE16qOnIFhKdjl/oZmjgflFFSvkDORQ
         mgML+4oTBlEV8invbBdNoeusMtN3RTXC12EHjXzBG/w4cGqhRsK2ByJW0OcZJnQe80B7
         pZToTT3IEjHr5oO/ae35SK06eQczOrgvSgFfc3zIxQRTDK83vj5urJULe9IDKf+K64Mg
         6++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YXO2XrMQEkvCHSDYBP5IAQUANS6uEyXDlrIGYeaenS8=;
        b=jyYTsAElB9/t2+iz0FTEWUMECL2frXQbLTdm8Ms+L8ArFfKRN/hKn9aFMb+SZENdOs
         jjyuVcVLXO03h3yneMAHi6aA+wjGXrFnlMkWQXqor74z16DF+PPTJNLYVFg9+DukigFo
         GWoyzDjEOO9XVTktXA6GB36LxHb60UzlhbP4NMYVwkrOKWdyOym67hxL/TLMQY/lEp2u
         U1fIvGI40Hf2el1+4u+bkhuQeUkjOgH7edBl4CXLOihZTc+cIvsxbnyyCvXpl+o8ctJF
         3tB+YQ/VnUiVYt8f/PQAtluYx0fBYTi3JmqhtrxTKBrrpCbBu3jdmz7hSm8hEj9MNzYk
         9H/Q==
X-Gm-Message-State: APjAAAWl3Sj/WQz651nDjEvMap7+hooFtSWMDnsFDG7CL2ztqnEbGur5
        RMqd7NhCPcziHq5tNBImWVOgX0v+AlyQ24B2cJDlAw==
X-Google-Smtp-Source: APXvYqzyZLD635dKHSzXiNngoOVo4zAW46kbV+AbiutPRNef/hkEmhFVG8AYLb5g94MJOvyExBCJqqbQIUO1RIQJN6s=
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr6673668wml.175.1565295026862;
 Thu, 08 Aug 2019 13:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190610213106.19342-1-mail@joaomoreno.com> <CAHxFc3QC147B6j4pBztjK7stLgCveeYhJWojai_SbKNbnpC9yw@mail.gmail.com>
 <CAO-hwJ+1FyaXj0iuCjvc5R-Kqdh6PNB7Un0ko1F_NV7-f5GMdw@mail.gmail.com> <CAHxFc3QJ1Xkgckt1BPptXT5S1xkROVdJzHTYT=GAcHXgm5UGqg@mail.gmail.com>
In-Reply-To: <CAHxFc3QJ1Xkgckt1BPptXT5S1xkROVdJzHTYT=GAcHXgm5UGqg@mail.gmail.com>
From:   =?UTF-8?B?Sm/Do28gTW9yZW5v?= <mail@joaomoreno.com>
Date:   Thu, 8 Aug 2019 22:10:16 +0200
Message-ID: <CAHxFc3TjZu7_u0U3ZoB466WGNzbfYLe4ZB7C4LuKdBAwkRum5Q@mail.gmail.com>
Subject: Re: [PATCH] HID: apple: Fix stuck function keys when using FN
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On Mon, 8 Jul 2019 at 22:35, Jo=C3=A3o Moreno <mail@joaomoreno.com> wrote:
>
> Hi Benjamin,
>
> No worries, also pretty busy over here. Didn't mean to press.
>
> On Mon, 1 Jul 2019 at 10:32, Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > Hi Jo=C3=A3o,
> >
> > On Sun, Jun 30, 2019 at 10:15 PM Jo=C3=A3o Moreno <mail@joaomoreno.com>=
 wrote:
> > >
> > > Hi Jiri & Benjamin,
> > >
> > > Let me know if you need something else to get this patch moving forwa=
rd. This
> > > fixes an issue I hit daily, it would be great to get it fixed.
> >
> > Sorry for the delay, I am very busy with internal corporate stuff, and
> > I tried setting up a new CI system at home, and instead of spending a
> > couple of ours, I am down to 2 weeks of hard work, without possibility
> > to switch to the new right now :(
> > Anyway.
> >
> > >
> > > Thanks.
> > >
> > > On Mon, 10 Jun 2019 at 23:31, Joao Moreno <mail@joaomoreno.com> wrote=
:
> > > >
> > > > This fixes an issue in which key down events for function keys woul=
d be
> > > > repeatedly emitted even after the user has raised the physical key.=
 For
> > > > example, the driver fails to emit the F5 key up event when going th=
rough
> > > > the following steps:
> > > > - fnmode=3D1: hold FN, hold F5, release FN, release F5
> > > > - fnmode=3D2: hold F5, hold FN, release F5, release FN
> >
> > Ouch :/
> >
>
> Right?!
>
> > > >
> > > > The repeated F5 key down events can be easily verified using xev.
> > > >
> > > > Signed-off-by: Joao Moreno <mail@joaomoreno.com>
> > > > ---
> > > >  drivers/hid/hid-apple.c | 21 +++++++++++----------
> > > >  1 file changed, 11 insertions(+), 10 deletions(-)
> > > >
> > > > diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> > > > index 1cb41992aaa1..81867a6fa047 100644
> > > > --- a/drivers/hid/hid-apple.c
> > > > +++ b/drivers/hid/hid-apple.c
> > > > @@ -205,20 +205,21 @@ static int hidinput_apple_event(struct hid_de=
vice *hid, struct input_dev *input,
> > > >                 trans =3D apple_find_translation (table, usage->cod=
e);
> > > >
> > > >                 if (trans) {
> > > > -                       if (test_bit(usage->code, asc->pressed_fn))
> > > > -                               do_translate =3D 1;
> > > > -                       else if (trans->flags & APPLE_FLAG_FKEY)
> > > > -                               do_translate =3D (fnmode =3D=3D 2 &=
& asc->fn_on) ||
> > > > -                                       (fnmode =3D=3D 1 && !asc->f=
n_on);
> > > > +                       int fn_on =3D value ? asc->fn_on :
> > > > +                               test_bit(usage->code, asc->pressed_=
fn);
> > > > +
> > > > +                       if (!value)
> > > > +                               clear_bit(usage->code, asc->pressed=
_fn);
> > > > +                       else if (asc->fn_on)
> > > > +                               set_bit(usage->code, asc->pressed_f=
n);
> >
> > I have the feeling that this is not the correct fix here.
> >
> > I might be wrong, but the following sequence might also mess up the
> > driver state, depending on how the reports are emitted:
> > - hold FN, hold F4, hold F5, release F4, release FN, release F5
> >
>
> I believe this should be fine. Following the code:
>
> - hold FN, sets asc->fn_on to true
> - hold F4, in the trans block fn_on will be true and we'll set the F4
> bit in the bitmap
> - hold F5, in the trans block fn_on will be true and we'll set the F5 bit
> - release F4, in the trans block fn_on will be true (because of the bitma=
p) and
> we'll clear the F4 bit
> - release FN, asc->fn_on will be false, but it doesn't matter since...
> - release F5, in the trans block we'll look into the bitmap (instead
> of asc->fn_on),
> so fn_on will be true and we'll clear the F5 bit
>
> I tested it in practice using my changes:
>
> Interestingly the Apple keyboard doesn't seem to emit an even for F5 when=
 F4 is
> pressed, seems like a hardware limitation. But F6 does work. So, when I e=
xecute
> these events in that order, everything works as it should: xev reports
> the following:
>
> KeyPress F4
> KeyPress F6
> KeyRelease F4
> KeyRelease F6
>
> > The reason is that the driver only considers you have one key pressed
> > with the modifier, and as the code changed its state based on the last
> > value.
> >
>
> I believe the bitmap takes care of storing the FN state per key press. Th=
e
> trick I did was to check on the global `asc->fn_on` state only when a key
> is pressed, but check on the bitmap instead when it's released.
>
> Let me know what you think. Am I missing something here?
>
> Cheers,
> Jo=C3=A3o.
>
> > IMO a better fix would:
> >
> > - keep the existing `trans` mapping lookout
> > - whenever a `trans` mapping gets found:
> >   * get both translated and non-translated currently reported values
> > (`test_bit(keycode, input_dev->key)`)
> >   * if one of them is set to true, then consider the keycode to be the
> > one of the key (no matter fn_on)
> >     -> deal with `value` with the corrected keycode
> >   * if the key was not pressed:
> >     -> chose the keycode based on `fn_on` and `fnmode` states
> >     and report the key press event
> >
> > This should remove the nasty pressed_fn state which depends on the
> > other pressed keys.
> >
> > Cheers,
> > Benjamin
> >
> > > > +
> > > > +                       if (trans->flags & APPLE_FLAG_FKEY)
> > > > +                               do_translate =3D (fnmode =3D=3D 2 &=
& fn_on) ||
> > > > +                                       (fnmode =3D=3D 1 && !fn_on)=
;
> > > >                         else
> > > >                                 do_translate =3D asc->fn_on;
> > > >
> > > >                         if (do_translate) {
> > > > -                               if (value)
> > > > -                                       set_bit(usage->code, asc->p=
ressed_fn);
> > > > -                               else
> > > > -                                       clear_bit(usage->code, asc-=
>pressed_fn);
> > > > -
> > > >                                 input_event(input, usage->type, tra=
ns->to,
> > > >                                                 value);
> > > >
> > > > --
> > > > 2.19.1
> > > >

Gave this another look and I still haven't found any issues, let me
know if you still
think I'm missing something. Thanks!

Cheers,
Jo=C3=A3o
