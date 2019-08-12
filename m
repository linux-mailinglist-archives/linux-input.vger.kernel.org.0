Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E22C8A3D9
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 18:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfHLQ5w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 12:57:52 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46071 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfHLQ5v (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 12:57:51 -0400
Received: by mail-lj1-f196.google.com with SMTP id t3so10404131ljj.12;
        Mon, 12 Aug 2019 09:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7SeMd09s+ulpF0E0l+EPNEz1OvPQAsnEP5znvMORgNg=;
        b=ZADpMea8p9xjO/rsXC6j8qv4gMXRdgGJsqjdXdakWVupZAIVjRNo60iIvc0fJrqt5L
         SgGCjn2U9ecVmV5P8kC1vSN+JZaNT2fmg4h47qpq1LaDGIMUhiWnizxEcvJZkI012F5a
         TWnb3tWJRTibbP0csDZ58FiBmcC7RxSu48DIvIWEe7fB7Rd6Gzs3XPZqDxl807YY2Rse
         bEvguVQqXKDD5briz/jyBQoE7GIqOahMl9RkHs9nGkw9mIejj2QEnjHYO/5XzBzD+swG
         traRm7yV+wVOBGXY2GOgaMtdkFAHtIAVwXdXPYpzLhZa+IPGjrLZVSnOUb5mvFFbmVhO
         LJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7SeMd09s+ulpF0E0l+EPNEz1OvPQAsnEP5znvMORgNg=;
        b=qi+n1sQPYJDyoAdp3pBpvil6TrR7+DL8+Wtb4V3Tpq/ZR++FLq5OJC25Xqe1PHhVBx
         l/3N2t5VlmggYg28v1tYcAvhFBS37xvwMkobnpMI5LRUBMkase6//W/xajGTAF4GlpzQ
         ruFk0iXSSNArZIn7fjqdENzEKuds4VekNr3+sWiLDCiAliyATsEVsz1L+TjLmeDzw6/m
         f/krdpyaL7E8OgQpONeniJA4gQAfksh76YoDtAF8tAKkZ1XpyAm+6//oR7CcekGWVT05
         g/GcPV3QA30EgXLr4M8ap9r2cRtHRX2Y4/7H20l+9iCfKcREj8A38e4hi40bWnVYqREs
         HcGQ==
X-Gm-Message-State: APjAAAXlJ8TF0VknaXIf6j43WQXR6TMgDvWt1O9RMcw6SxjZ7w980yGv
        1elT+X9agoGwKUkO+QibWUSpfxEWYMV9jVLQuXM=
X-Google-Smtp-Source: APXvYqwN2azCh8o38OXXDAhw70UXHdwhQeaak2xD2Xg8qc9PrXcNYPUK3YEzsRhSPvBV+vnm8grHBNOTkzcVilsJdDo=
X-Received: by 2002:a2e:8150:: with SMTP id t16mr4728303ljg.154.1565629069266;
 Mon, 12 Aug 2019 09:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190610213106.19342-1-mail@joaomoreno.com> <CAHxFc3QC147B6j4pBztjK7stLgCveeYhJWojai_SbKNbnpC9yw@mail.gmail.com>
 <CAO-hwJ+1FyaXj0iuCjvc5R-Kqdh6PNB7Un0ko1F_NV7-f5GMdw@mail.gmail.com>
 <CAHxFc3QJ1Xkgckt1BPptXT5S1xkROVdJzHTYT=GAcHXgm5UGqg@mail.gmail.com> <CAHxFc3TjZu7_u0U3ZoB466WGNzbfYLe4ZB7C4LuKdBAwkRum5Q@mail.gmail.com>
In-Reply-To: <CAHxFc3TjZu7_u0U3ZoB466WGNzbfYLe4ZB7C4LuKdBAwkRum5Q@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@gmail.com>
Date:   Mon, 12 Aug 2019 18:57:37 +0200
Message-ID: <CAN+gG=H6O202SYXGbTG5rTMUt_X5dZyi02YFUquPaqL=FGHXwQ@mail.gmail.com>
Subject: Re: [PATCH] HID: apple: Fix stuck function keys when using FN
To:     =?UTF-8?B?Sm/Do28gTW9yZW5v?= <mail@joaomoreno.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jo=C3=A3o,

On Thu, Aug 8, 2019 at 10:35 PM Jo=C3=A3o Moreno <mail@joaomoreno.com> wrot=
e:
>
> Hi Benjamin,
>
> On Mon, 8 Jul 2019 at 22:35, Jo=C3=A3o Moreno <mail@joaomoreno.com> wrote=
:
> >
> > Hi Benjamin,
> >
> > No worries, also pretty busy over here. Didn't mean to press.
> >
> > On Mon, 1 Jul 2019 at 10:32, Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> > >
> > > Hi Jo=C3=A3o,
> > >
> > > On Sun, Jun 30, 2019 at 10:15 PM Jo=C3=A3o Moreno <mail@joaomoreno.co=
m> wrote:
> > > >
> > > > Hi Jiri & Benjamin,
> > > >
> > > > Let me know if you need something else to get this patch moving for=
ward. This
> > > > fixes an issue I hit daily, it would be great to get it fixed.
> > >
> > > Sorry for the delay, I am very busy with internal corporate stuff, an=
d
> > > I tried setting up a new CI system at home, and instead of spending a
> > > couple of ours, I am down to 2 weeks of hard work, without possibilit=
y
> > > to switch to the new right now :(
> > > Anyway.
> > >
> > > >
> > > > Thanks.
> > > >
> > > > On Mon, 10 Jun 2019 at 23:31, Joao Moreno <mail@joaomoreno.com> wro=
te:
> > > > >
> > > > > This fixes an issue in which key down events for function keys wo=
uld be
> > > > > repeatedly emitted even after the user has raised the physical ke=
y. For
> > > > > example, the driver fails to emit the F5 key up event when going =
through
> > > > > the following steps:
> > > > > - fnmode=3D1: hold FN, hold F5, release FN, release F5
> > > > > - fnmode=3D2: hold F5, hold FN, release F5, release FN
> > >
> > > Ouch :/
> > >
> >
> > Right?!
> >
> > > > >
> > > > > The repeated F5 key down events can be easily verified using xev.
> > > > >
> > > > > Signed-off-by: Joao Moreno <mail@joaomoreno.com>
> > > > > ---
> > > > >  drivers/hid/hid-apple.c | 21 +++++++++++----------
> > > > >  1 file changed, 11 insertions(+), 10 deletions(-)
> > > > >
> > > > > diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> > > > > index 1cb41992aaa1..81867a6fa047 100644
> > > > > --- a/drivers/hid/hid-apple.c
> > > > > +++ b/drivers/hid/hid-apple.c
> > > > > @@ -205,20 +205,21 @@ static int hidinput_apple_event(struct hid_=
device *hid, struct input_dev *input,
> > > > >                 trans =3D apple_find_translation (table, usage->c=
ode);
> > > > >
> > > > >                 if (trans) {
> > > > > -                       if (test_bit(usage->code, asc->pressed_fn=
))
> > > > > -                               do_translate =3D 1;
> > > > > -                       else if (trans->flags & APPLE_FLAG_FKEY)
> > > > > -                               do_translate =3D (fnmode =3D=3D 2=
 && asc->fn_on) ||
> > > > > -                                       (fnmode =3D=3D 1 && !asc-=
>fn_on);
> > > > > +                       int fn_on =3D value ? asc->fn_on :
> > > > > +                               test_bit(usage->code, asc->presse=
d_fn);
> > > > > +
> > > > > +                       if (!value)
> > > > > +                               clear_bit(usage->code, asc->press=
ed_fn);
> > > > > +                       else if (asc->fn_on)
> > > > > +                               set_bit(usage->code, asc->pressed=
_fn);
> > >
> > > I have the feeling that this is not the correct fix here.
> > >
> > > I might be wrong, but the following sequence might also mess up the
> > > driver state, depending on how the reports are emitted:
> > > - hold FN, hold F4, hold F5, release F4, release FN, release F5
> > >
> >
> > I believe this should be fine. Following the code:
> >
> > - hold FN, sets asc->fn_on to true
> > - hold F4, in the trans block fn_on will be true and we'll set the F4
> > bit in the bitmap
> > - hold F5, in the trans block fn_on will be true and we'll set the F5 b=
it
> > - release F4, in the trans block fn_on will be true (because of the bit=
map) and
> > we'll clear the F4 bit
> > - release FN, asc->fn_on will be false, but it doesn't matter since...
> > - release F5, in the trans block we'll look into the bitmap (instead
> > of asc->fn_on),
> > so fn_on will be true and we'll clear the F5 bit
> >
> > I tested it in practice using my changes:
> >
> > Interestingly the Apple keyboard doesn't seem to emit an even for F5 wh=
en F4 is
> > pressed, seems like a hardware limitation. But F6 does work. So, when I=
 execute
> > these events in that order, everything works as it should: xev reports
> > the following:
> >
> > KeyPress F4
> > KeyPress F6
> > KeyRelease F4
> > KeyRelease F6
> >
> > > The reason is that the driver only considers you have one key pressed
> > > with the modifier, and as the code changed its state based on the las=
t
> > > value.
> > >
> >
> > I believe the bitmap takes care of storing the FN state per key press. =
The
> > trick I did was to check on the global `asc->fn_on` state only when a k=
ey
> > is pressed, but check on the bitmap instead when it's released.
> >
> > Let me know what you think. Am I missing something here?
> >
> > Cheers,
> > Jo=C3=A3o.
> >
> > > IMO a better fix would:
> > >
> > > - keep the existing `trans` mapping lookout
> > > - whenever a `trans` mapping gets found:
> > >   * get both translated and non-translated currently reported values
> > > (`test_bit(keycode, input_dev->key)`)
> > >   * if one of them is set to true, then consider the keycode to be th=
e
> > > one of the key (no matter fn_on)
> > >     -> deal with `value` with the corrected keycode
> > >   * if the key was not pressed:
> > >     -> chose the keycode based on `fn_on` and `fnmode` states
> > >     and report the key press event
> > >
> > > This should remove the nasty pressed_fn state which depends on the
> > > other pressed keys.
> > >
> > > Cheers,
> > > Benjamin
> > >
> > > > > +
> > > > > +                       if (trans->flags & APPLE_FLAG_FKEY)
> > > > > +                               do_translate =3D (fnmode =3D=3D 2=
 && fn_on) ||
> > > > > +                                       (fnmode =3D=3D 1 && !fn_o=
n);
> > > > >                         else
> > > > >                                 do_translate =3D asc->fn_on;
> > > > >
> > > > >                         if (do_translate) {
> > > > > -                               if (value)
> > > > > -                                       set_bit(usage->code, asc-=
>pressed_fn);
> > > > > -                               else
> > > > > -                                       clear_bit(usage->code, as=
c->pressed_fn);
> > > > > -
> > > > >                                 input_event(input, usage->type, t=
rans->to,
> > > > >                                                 value);
> > > > >
> > > > > --
> > > > > 2.19.1
> > > > >
>
> Gave this another look and I still haven't found any issues, let me
> know if you still
> think I'm missing something. Thanks!
>

OK, I am tempted to take the patch, but I'll need to add this as a
regression test in my test-suite. This is too complex that it can
easily break next time someone looks at it.

Can you send me the report descriptors of the device using
hid-recorder from hid-tools[0].
Ideally, if you can put the faulty sequence in the logs, that would
help writing down the use case.

Cheers,
Benjamin

[0] https://gitlab.freedesktop.org/libevdev/hid-tools
