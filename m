Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78224A5B2F
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2019 18:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbfIBQLm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Sep 2019 12:11:42 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]:54995 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbfIBQLm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Sep 2019 12:11:42 -0400
Received: by mail-wm1-f44.google.com with SMTP id k2so13725529wmj.4
        for <linux-input@vger.kernel.org>; Mon, 02 Sep 2019 09:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joaomoreno-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pRyB/3mpP1z+HIggiSeXyc7kgGoZFdcsC+A/piQ1sPQ=;
        b=yfQlspq4ZTONnFjEPndLogiMwQgUEodq5ry3i+x9q90AqvqB/qsF0WTS+iL7zvyqsA
         SQAtmjGDKRfoA4ApfUoU0gvcJkLOB56vTZPECu823mqSdWJ7PCyrxjpAWijJrJ0hSmO8
         F0lch3eqYsbIRf21MAQIT7dQei1F/6K8Dk5vUWlk5eaDk388gb4kb5LwQC838oLyJ9ec
         yQRDbcWJCX8y2HJIo9BBp15oKCs4TZOCEi3qS0iCQ44klxzhSi8Xdord7ydJ25JhNYtp
         ufydHoQormfK5XusAeFSgJyJHkWTZ7YF8geqi3aT6Oom4rZ69SUbrM5v9b2zcQlHMbH4
         DgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pRyB/3mpP1z+HIggiSeXyc7kgGoZFdcsC+A/piQ1sPQ=;
        b=uY3tnQwDy/jE02eF+JsO40goLAUEdopFzqX77iJpzq85/Zd1V8S/7HigClNs/S6N5e
         U9XgodW66gqMcSwcRc/INNEZzCENiPJQB/LIlVigpSS/ojec8+o9MB38Pb8yMSK+5w51
         +ANU1Ygy5ovpuXxAVMYDV/Q9NgUhb0boC23x8N1IwSpZbYe19XTin9IX3WbqhKraUfPn
         pRiR+ouDXNNFtBkCrOkeR/IVSfahhjr7MQATZ4tarznYEpx/70Y5LRMNCjUg8CuGtKoB
         +7Q3LJZ9SndBfemEI6WkP0eFnSZNs4zjkoR2aG2bjV2GxMprSVQSyZIiASPvgzuYpTJn
         PINw==
X-Gm-Message-State: APjAAAX4Ro5jg399ENQVYBpl53AdILHx3fktgPz8utpvCQr/kODT2o9k
        uUnvUbN5xVXPrpOogPueRW//EWHZMRvroHSfXK0rKQ==
X-Google-Smtp-Source: APXvYqwcI/m5lHyBeM+k1OULKMacQ9ix4k3Zq33EOyS7dZeh7scdKFoSHGrIw9hhLA6Bh32U4ceYvDs+rf8TODBZQcA=
X-Received: by 2002:a1c:7215:: with SMTP id n21mr8767710wmc.152.1567440697488;
 Mon, 02 Sep 2019 09:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190610213106.19342-1-mail@joaomoreno.com> <CAHxFc3QC147B6j4pBztjK7stLgCveeYhJWojai_SbKNbnpC9yw@mail.gmail.com>
 <CAO-hwJ+1FyaXj0iuCjvc5R-Kqdh6PNB7Un0ko1F_NV7-f5GMdw@mail.gmail.com>
 <CAHxFc3QJ1Xkgckt1BPptXT5S1xkROVdJzHTYT=GAcHXgm5UGqg@mail.gmail.com>
 <CAHxFc3TjZu7_u0U3ZoB466WGNzbfYLe4ZB7C4LuKdBAwkRum5Q@mail.gmail.com>
 <CAN+gG=H6O202SYXGbTG5rTMUt_X5dZyi02YFUquPaqL=FGHXwQ@mail.gmail.com>
 <bf759ce7-a0e1-0da8-ccd8-1925e5ccc184@redhat.com> <CAHxFc3QP8Jtbh0AVbj1zfUNtO+ek+PH-DG==DGfo6Dj7t7PXRA@mail.gmail.com>
 <CAO-hwJLXTd5aEvQtanfza6XoGiSwrmkCOURgDyet7wiEw0rRgA@mail.gmail.com>
In-Reply-To: <CAO-hwJLXTd5aEvQtanfza6XoGiSwrmkCOURgDyet7wiEw0rRgA@mail.gmail.com>
From:   =?UTF-8?B?Sm/Do28gTW9yZW5v?= <mail@joaomoreno.com>
Date:   Mon, 2 Sep 2019 18:11:26 +0200
Message-ID: <CAHxFc3S+5bSE32dRP9dsBosQs6eCVyGoyL+aMx28wcxryEmYSg@mail.gmail.com>
Subject: Re: [PATCH] HID: apple: Fix stuck function keys when using FN
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On Mon, 2 Sep 2019 at 17:23, Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> Hi Jo=C3=A3o,
>
> On Mon, Sep 2, 2019 at 4:44 PM Jo=C3=A3o Moreno <mail@joaomoreno.com> wro=
te:
> >
> > Hi Benjamin,
> >
> > First of all, sorry for the late reply. Turns out a newborn baby can
> > keep one quite busy, who would have known? :)
>
> heh. Well, congrats!
>
> >
> > On Tue, 27 Aug 2019 at 18:57, Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> > >
> > > Hi Jo=C3=A3o,
> > >
> > > On 8/12/19 6:57 PM, Benjamin Tissoires wrote:
> > > > Hi Jo=C3=A3o,
> > > >
> > > > On Thu, Aug 8, 2019 at 10:35 PM Jo=C3=A3o Moreno <mail@joaomoreno.c=
om> wrote:
> > > >>
> > > >> Hi Benjamin,
> > > >>
> > > >> On Mon, 8 Jul 2019 at 22:35, Jo=C3=A3o Moreno <mail@joaomoreno.com=
> wrote:
> > > >>>
> > > >>> Hi Benjamin,
> > > >>>
> > > >>> No worries, also pretty busy over here. Didn't mean to press.
> > > >>>
> > > >>> On Mon, 1 Jul 2019 at 10:32, Benjamin Tissoires
> > > >>> <benjamin.tissoires@redhat.com> wrote:
> > > >>>>
> > > >>>> Hi Jo=C3=A3o,
> > > >>>>
> > > >>>> On Sun, Jun 30, 2019 at 10:15 PM Jo=C3=A3o Moreno <mail@joaomore=
no.com> wrote:
> > > >>>>>
> > > >>>>> Hi Jiri & Benjamin,
> > > >>>>>
> > > >>>>> Let me know if you need something else to get this patch moving=
 forward. This
> > > >>>>> fixes an issue I hit daily, it would be great to get it fixed.
> > > >>>>
> > > >>>> Sorry for the delay, I am very busy with internal corporate stuf=
f, and
> > > >>>> I tried setting up a new CI system at home, and instead of spend=
ing a
> > > >>>> couple of ours, I am down to 2 weeks of hard work, without possi=
bility
> > > >>>> to switch to the new right now :(
> > > >>>> Anyway.
> > > >>>>
> > > >>>>>
> > > >>>>> Thanks.
> > > >>>>>
> > > >>>>> On Mon, 10 Jun 2019 at 23:31, Joao Moreno <mail@joaomoreno.com>=
 wrote:
> > > >>>>>>
> > > >>>>>> This fixes an issue in which key down events for function keys=
 would be
> > > >>>>>> repeatedly emitted even after the user has raised the physical=
 key. For
> > > >>>>>> example, the driver fails to emit the F5 key up event when goi=
ng through
> > > >>>>>> the following steps:
> > > >>>>>> - fnmode=3D1: hold FN, hold F5, release FN, release F5
> > > >>>>>> - fnmode=3D2: hold F5, hold FN, release F5, release FN
> > > >>>>
> > > >>>> Ouch :/
> > > >>>>
> > > >>>
> > > >>> Right?!
> > > >>>
> > > >>>>>>
> > > >>>>>> The repeated F5 key down events can be easily verified using x=
ev.
> > > >>>>>>
> > > >>>>>> Signed-off-by: Joao Moreno <mail@joaomoreno.com>
> > > >>>>>> ---
> > > >>>>>>  drivers/hid/hid-apple.c | 21 +++++++++++----------
> > > >>>>>>  1 file changed, 11 insertions(+), 10 deletions(-)
> > > >>>>>>
> > > >>>>>> diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> > > >>>>>> index 1cb41992aaa1..81867a6fa047 100644
> > > >>>>>> --- a/drivers/hid/hid-apple.c
> > > >>>>>> +++ b/drivers/hid/hid-apple.c
> > > >>>>>> @@ -205,20 +205,21 @@ static int hidinput_apple_event(struct h=
id_device *hid, struct input_dev *input,
> > > >>>>>>                 trans =3D apple_find_translation (table, usage=
->code);
> > > >>>>>>
> > > >>>>>>                 if (trans) {
> > > >>>>>> -                       if (test_bit(usage->code, asc->pressed=
_fn))
> > > >>>>>> -                               do_translate =3D 1;
> > > >>>>>> -                       else if (trans->flags & APPLE_FLAG_FKE=
Y)
> > > >>>>>> -                               do_translate =3D (fnmode =3D=
=3D 2 && asc->fn_on) ||
> > > >>>>>> -                                       (fnmode =3D=3D 1 && !a=
sc->fn_on);
> > > >>>>>> +                       int fn_on =3D value ? asc->fn_on :
> > > >>>>>> +                               test_bit(usage->code, asc->pre=
ssed_fn);
> > > >>>>>> +
> > > >>>>>> +                       if (!value)
> > > >>>>>> +                               clear_bit(usage->code, asc->pr=
essed_fn);
> > > >>>>>> +                       else if (asc->fn_on)
> > > >>>>>> +                               set_bit(usage->code, asc->pres=
sed_fn);
> > > >>>>
> > > >>>> I have the feeling that this is not the correct fix here.
> > > >>>>
> > > >>>> I might be wrong, but the following sequence might also mess up =
the
> > > >>>> driver state, depending on how the reports are emitted:
> > > >>>> - hold FN, hold F4, hold F5, release F4, release FN, release F5
> > > >>>>
> > > >>>
> > > >>> I believe this should be fine. Following the code:
> > > >>>
> > > >>> - hold FN, sets asc->fn_on to true
> > > >>> - hold F4, in the trans block fn_on will be true and we'll set th=
e F4
> > > >>> bit in the bitmap
> > > >>> - hold F5, in the trans block fn_on will be true and we'll set th=
e F5 bit
> > > >>> - release F4, in the trans block fn_on will be true (because of t=
he bitmap) and
> > > >>> we'll clear the F4 bit
> > > >>> - release FN, asc->fn_on will be false, but it doesn't matter sin=
ce...
> > > >>> - release F5, in the trans block we'll look into the bitmap (inst=
ead
> > > >>> of asc->fn_on),
> > > >>> so fn_on will be true and we'll clear the F5 bit
> > > >>>
> > > >>> I tested it in practice using my changes:
> > > >>>
> > > >>> Interestingly the Apple keyboard doesn't seem to emit an even for=
 F5 when F4 is
> > > >>> pressed, seems like a hardware limitation. But F6 does work. So, =
when I execute
> > > >>> these events in that order, everything works as it should: xev re=
ports
> > > >>> the following:
> > > >>>
> > > >>> KeyPress F4
> > > >>> KeyPress F6
> > > >>> KeyRelease F4
> > > >>> KeyRelease F6
> > > >>>
> > > >>>> The reason is that the driver only considers you have one key pr=
essed
> > > >>>> with the modifier, and as the code changed its state based on th=
e last
> > > >>>> value.
> > > >>>>
> > > >>>
> > > >>> I believe the bitmap takes care of storing the FN state per key p=
ress. The
> > > >>> trick I did was to check on the global `asc->fn_on` state only wh=
en a key
> > > >>> is pressed, but check on the bitmap instead when it's released.
> > > >>>
> > > >>> Let me know what you think. Am I missing something here?
> > > >>>
> > > >>> Cheers,
> > > >>> Jo=C3=A3o.
> > > >>>
> > > >>>> IMO a better fix would:
> > > >>>>
> > > >>>> - keep the existing `trans` mapping lookout
> > > >>>> - whenever a `trans` mapping gets found:
> > > >>>>   * get both translated and non-translated currently reported va=
lues
> > > >>>> (`test_bit(keycode, input_dev->key)`)
> > > >>>>   * if one of them is set to true, then consider the keycode to =
be the
> > > >>>> one of the key (no matter fn_on)
> > > >>>>     -> deal with `value` with the corrected keycode
> > > >>>>   * if the key was not pressed:
> > > >>>>     -> chose the keycode based on `fn_on` and `fnmode` states
> > > >>>>     and report the key press event
> > > >>>>
> > > >>>> This should remove the nasty pressed_fn state which depends on t=
he
> > > >>>> other pressed keys.
> > > >>>>
> > > >>>> Cheers,
> > > >>>> Benjamin
> > > >>>>
> > > >>>>>> +
> > > >>>>>> +                       if (trans->flags & APPLE_FLAG_FKEY)
> > > >>>>>> +                               do_translate =3D (fnmode =3D=
=3D 2 && fn_on) ||
> > > >>>>>> +                                       (fnmode =3D=3D 1 && !f=
n_on);
> > > >>>>>>                         else
> > > >>>>>>                                 do_translate =3D asc->fn_on;
> > > >>>>>>
> > > >>>>>>                         if (do_translate) {
> > > >>>>>> -                               if (value)
> > > >>>>>> -                                       set_bit(usage->code, a=
sc->pressed_fn);
> > > >>>>>> -                               else
> > > >>>>>> -                                       clear_bit(usage->code,=
 asc->pressed_fn);
> > > >>>>>> -
> > > >>>>>>                                 input_event(input, usage->type=
, trans->to,
> > > >>>>>>                                                 value);
> > > >>>>>>
> > > >>>>>> --
> > > >>>>>> 2.19.1
> > > >>>>>>
> > > >>
> > > >> Gave this another look and I still haven't found any issues, let m=
e
> > > >> know if you still
> > > >> think I'm missing something. Thanks!
> > > >>
> > > >
> > > > OK, I am tempted to take the patch, but I'll need to add this as a
> > > > regression test in my test-suite. This is too complex that it can
> > > > easily break next time someone looks at it.
> > > >
> > > > Can you send me the report descriptors of the device using
> > > > hid-recorder from hid-tools[0].
> > > > Ideally, if you can put the faulty sequence in the logs, that would
> > > > help writing down the use case.
> > > >
> > >
> > > I finally managed to get the regression tests up in
> > > https://gitlab.freedesktop.org/libevdev/hid-tools/merge_requests/52
> > >
> >
> > This is great, really cool that you can write proper tests for this. I
> > assume you don't need me to send you the report descriptors any more?
>
> It would be nice to have yours too. Just in case they differ from the
> one I have here.
>

You got it. Here's the output of the F5 faulty sequence:

# Apple, Inc Apple Keyboard
# 0x05, 0x01,                    // Usage Page (Generic Desktop)        0
# 0x09, 0x06,                    // Usage (Keyboard)                    2
# 0xa1, 0x01,                    // Collection (Application)            4
# 0x05, 0x07,                    //  Usage Page (Keyboard)              6
# 0x19, 0xe0,                    //  Usage Minimum (224)                8
# 0x29, 0xe7,                    //  Usage Maximum (231)                10
# 0x15, 0x00,                    //  Logical Minimum (0)                12
# 0x25, 0x01,                    //  Logical Maximum (1)                14
# 0x75, 0x01,                    //  Report Size (1)                    16
# 0x95, 0x08,                    //  Report Count (8)                   18
# 0x81, 0x02,                    //  Input (Data,Var,Abs)               20
# 0x95, 0x01,                    //  Report Count (1)                   22
# 0x75, 0x08,                    //  Report Size (8)                    24
# 0x81, 0x01,                    //  Input (Cnst,Arr,Abs)               26
# 0x05, 0x08,                    //  Usage Page (LEDs)                  28
# 0x19, 0x01,                    //  Usage Minimum (1)                  30
# 0x29, 0x05,                    //  Usage Maximum (5)                  32
# 0x95, 0x05,                    //  Report Count (5)                   34
# 0x75, 0x01,                    //  Report Size (1)                    36
# 0x91, 0x02,                    //  Output (Data,Var,Abs)              38
# 0x95, 0x01,                    //  Report Count (1)                   40
# 0x75, 0x03,                    //  Report Size (3)                    42
# 0x91, 0x01,                    //  Output (Cnst,Arr,Abs)              44
# 0x05, 0x07,                    //  Usage Page (Keyboard)              46
# 0x19, 0x00,                    //  Usage Minimum (0)                  48
# 0x2a, 0xff, 0x00,              //  Usage Maximum (255)                50
# 0x95, 0x05,                    //  Report Count (5)                   53
# 0x75, 0x08,                    //  Report Size (8)                    55
# 0x15, 0x00,                    //  Logical Minimum (0)                57
# 0x26, 0xff, 0x00,              //  Logical Maximum (255)              59
# 0x81, 0x00,                    //  Input (Data,Arr,Abs)               62
# 0x05, 0xff,                    //  Usage Page (Vendor Usage Page 0xff) 64
# 0x09, 0x03,                    //  Usage (Vendor Usage 0x03)          66
# 0x75, 0x08,                    //  Report Size (8)                    68
# 0x95, 0x01,                    //  Report Count (1)                   70
# 0x81, 0x02,                    //  Input (Data,Var,Abs)               72
# 0xc0,                          // End Collection                      74
#
R: 75 05 01 09 06 a1 01 05 07 19 e0 29 e7 15 00 25 01 75 01 95 08 81
02 95 01 75 08 81 01 05 08 19 01 29 05 95 05 75 01 91 02 95 01 75 03
91 01 05 07 19 00 2a ff 00 95 05 75 08 15 00 26 ff 00 81 00 05 ff 09
03 75 08 95 01 81 02 c0
N: Apple, Inc Apple Keyboard
I: 3 05ac 0221
#  LeftControl: 0 | LeftShift: 0 | LeftAlt: 0 | Left GUI: 0 |
RightControl: 0 | RightShift: 0 | RightAlt: 0 | Right GUI: 0 | #
|Keyboard ['00', '00', '00', '00', '00'] | 0xff0003:    1
E: 000000.000000 8 00 00 00 00 00 00 00 01
#  LeftControl: 0 | LeftShift: 0 | LeftAlt: 0 | Left GUI: 0 |
RightControl: 0 | RightShift: 0 | RightAlt: 0 | Right GUI: 0 | #
|Keyboard ['F5', '00', '00', '00', '00'] | 0xff0003:    1
E: 000000.216000 8 00 00 3e 00 00 00 00 01
#  LeftControl: 0 | LeftShift: 0 | LeftAlt: 0 | Left GUI: 0 |
RightControl: 0 | RightShift: 0 | RightAlt: 0 | Right GUI: 0 | #
|Keyboard ['F5', '00', '00', '00', '00'] | 0xff0003:    0
E: 000000.391958 8 00 00 3e 00 00 00 00 00
#  LeftControl: 0 | LeftShift: 0 | LeftAlt: 0 | Left GUI: 0 |
RightControl: 0 | RightShift: 0 | RightAlt: 0 | Right GUI: 0 | #
|Keyboard ['00', '00', '00', '00', '00'] | 0xff0003:    0
E: 000000.591974 8 00 00 00 00 00 00 00 00
#  LeftControl: 1 | LeftShift: 0 | LeftAlt: 0 | Left GUI: 0 |
RightControl: 0 | RightShift: 0 | RightAlt: 0 | Right GUI: 0 | #
|Keyboard ['00', '00', '00', '00', '00'] | 0xff0003:    0
E: 000001.255952 8 01 00 00 00 00 00 00 00

> >
> > > This allowed me to better understand the code, and yes, for the F-key=
s,
> > > I could not find a faulty situation with your patch.
> > >
> > > However, the same problem is happening with the arrow keys, as arrow =
up
> > > is translated to page up.
> > >
> >
> > Great catch, I can easily repro that issue as well on my keyboard.
> >
> > > We *could* adapt your patch to solve this, but I find it really hard =
to understand.
> > >
> > > How about the following diff:
> > > ---
> > > diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> > > index 81df62f48c4c..ef916c0f3c0b 100644
> > > --- a/drivers/hid/hid-apple.c
> > > +++ b/drivers/hid/hid-apple.c
> > > @@ -54,7 +54,6 @@ MODULE_PARM_DESC(swap_opt_cmd, "Swap the Option (\"=
Alt\") and Command (\"Flag\")
> > >  struct apple_sc {
> > >         unsigned long quirks;
> > >         unsigned int fn_on;
> > > -       DECLARE_BITMAP(pressed_fn, KEY_CNT);
> > >         DECLARE_BITMAP(pressed_numlock, KEY_CNT);
> > >  };
> > >
> > > @@ -181,6 +180,8 @@ static int hidinput_apple_event(struct hid_device=
 *hid, struct input_dev *input,
> > >  {
> > >         struct apple_sc *asc =3D hid_get_drvdata(hid);
> > >         const struct apple_key_translation *trans, *table;
> > > +       bool do_translate;
> > > +       u16 code =3D 0;
> > >
> > >         if (usage->code =3D=3D KEY_FN) {
> > >                 asc->fn_on =3D !!value;
> > > @@ -189,8 +190,6 @@ static int hidinput_apple_event(struct hid_device=
 *hid, struct input_dev *input,
> > >         }
> > >
> > >         if (fnmode) {
> > > -               int do_translate;
> > > -
> > >                 if (hid->product >=3D USB_DEVICE_ID_APPLE_WELLSPRING4=
_ANSI &&
> > >                                 hid->product <=3D USB_DEVICE_ID_APPLE=
_WELLSPRING4A_JIS)
> > >                         table =3D macbookair_fn_keys;
> > > @@ -202,25 +201,33 @@ static int hidinput_apple_event(struct hid_devi=
ce *hid, struct input_dev *input,
> > >                 trans =3D apple_find_translation (table, usage->code)=
;
> > >
> > >                 if (trans) {
> > > -                       if (test_bit(usage->code, asc->pressed_fn))
> > > -                               do_translate =3D 1;
> > > -                       else if (trans->flags & APPLE_FLAG_FKEY)
> > > -                               do_translate =3D (fnmode =3D=3D 2 && =
asc->fn_on) ||
> > > -                                       (fnmode =3D=3D 1 && !asc->fn_=
on);
> > > -                       else
> > > -                               do_translate =3D asc->fn_on;
> > > -
> > > -                       if (do_translate) {
> > > -                               if (value)
> > > -                                       set_bit(usage->code, asc->pre=
ssed_fn);
> > > -                               else
> > > -                                       clear_bit(usage->code, asc->p=
ressed_fn);
> > > -
> > > -                               input_event(input, usage->type, trans=
->to,
> > > -                                               value);
> > > -
> > > -                               return 1;
> > > +                       if (test_bit(trans->from, input->key))
> > > +                               code =3D trans->from;
> > > +                       if (test_bit(trans->to, input->key))
> > > +                               code =3D trans->to;
> >
> > I see, this is what you meant before. I still don't quite understand
> > what information `input->key` actually holds. Can you elaborate on
> > what it contains? How does it differ from `usage->code`?
>
> input is the input device itself (from the kernel point of view) and
> key is the bitmask of the currently reported pressed keys.
> usage->code is the HID usage (so from the hardware point of view) and
> identifies which physical key is being pressed.
> And last, asc->pressed_fn contained the bitmask of which physical key
> was pressed, while here we store which reported key is sent.
>

Oh, I see. So `input->key` contains whatever value we called `input_event`
with previously? Makes sense!

> >
> > Also, should the second `if` be an `else if` instead? We shouldn't
> > have to call `test_bit` more than once here, right? If right, then the
> > next `if` would could simply be an `else`, since the translation
> > tables should not have zeros in them.
>
> right we can do that.
>
> >
> > > +
> > > +                       if (!code) {
> > > +                               if (trans->flags & APPLE_FLAG_FKEY) {
> > > +                                       switch (fnmode) {
> > > +                                       case 1:
> > > +                                               do_translate =3D !asc=
->fn_on;
> > > +                                               break;
> > > +                                       case 2:
> > > +                                               do_translate =3D asc-=
>fn_on;
> > > +                                               break;
> > > +                                       default:
> > > +                                               /* should never happe=
n */
> > > +                                               do_translate =3D fals=
e;
> > > +                                       }
> > > +                               } else {
> > > +                                       do_translate =3D asc->fn_on;
> > > +                               }
> > > +
> > > +                               code =3D do_translate ? trans->to : t=
rans->from;
> > >                         }
> > > +
> > > +                       input_event(input, usage->type, code, value);
> > > +                       return 1;
> > >                 }
> > >
> > >                 if (asc->quirks & APPLE_NUMLOCK_EMULATION &&
> > > ---
> > >
> > > This is more or less what I suggested, minus the bug fixes.
> > >
> > > I find this easier to understand as the .pressed_fn field is not ther=
e
> > > anymore and we just rely on the actual state of the input subsystem.
> > >
> > > Comments?
> >
> > Love it. Seems to catch all the cases on my hardware. Thanks for
> > following up with the patch!
>
> Thanks I'll properly resend the patch. I guess I should keep your from
> and you can later add your signed-off-by line if you agree. (but
> likely not today, I have to pick up my girls at school, things you'll
> discover in a few years, or months for daycare :-P).
>

Sure, that works for me.

Hehe, no spoilers!

> Cheers,
> Benjamin
>
> >
> > >
> > > Cheers,
> > > Benjamin
> > >
> > >
> > > > Cheers,
> > > > Benjamin
> > > >
> > > > [0] https://gitlab.freedesktop.org/libevdev/hid-tools
> > > >
> >
> > Cheers,
> > Jo=C3=A3o

Cheers,
Jo=C3=A3o
