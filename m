Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9B9A5A78
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2019 17:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731948AbfIBPXl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Mon, 2 Sep 2019 11:23:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52878 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731303AbfIBPXl (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Sep 2019 11:23:41 -0400
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 4545481F13
        for <linux-input@vger.kernel.org>; Mon,  2 Sep 2019 15:23:40 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id z20so10768188qtn.12
        for <linux-input@vger.kernel.org>; Mon, 02 Sep 2019 08:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Z/ceVOdWQ2MOcVCIN1JJmvHNo95U72tYxU3+oIAiIzs=;
        b=oSgP7qDUHh+zs/xazh6BHdcXT2+vioKK2RHP9AiNBiQJF77wKNZdM6J6yLsq2QlcF/
         8uy2zj9VXhROKltcftNFJduoxjZCK9fQc+XsmB8ri1PmDOqf9+86XxXO952Gh88d2P5e
         kamLe1wGDRbVt8ozyEFwSVg0OmBZPhV5HkadRyUBDdSGcQq3RshL1WkxBsSwzKogj5vN
         nZ7WsvqaJzmO7+08A0tWe0la+a+KB9ZVeoGiptz6owYmK5u4xVFBG4SQ3P8Iefibv6VW
         Thc6uv7z0D2Rzh/QGbJsbEvn4qPchfDU1ErcpsDeV8Bsqq/eNfzpv5n8zXrYIadIoGK5
         ajzQ==
X-Gm-Message-State: APjAAAUrnJo4m1qLPmxRSQUPC6CUsiIQXOnp9l5aAY4KEGL1r+vQjJfY
        /meuvFgI4KY9dvEtGsaD8pFk4Yc2D6wIAqHBujr6ue8cqdNRMgr5wbjOyTAixwsi4HewnvMwwZM
        0WmgtvIXwEDKk9PaW//pjzN0LltEOL10ZOt+b4Bo=
X-Received: by 2002:ac8:c86:: with SMTP id n6mr28974110qti.345.1567437819535;
        Mon, 02 Sep 2019 08:23:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyT/Gx+37EX+7r7Dfhmk64PapFvc3m4OFJ5p0GUTXK9991PaBeLupwhpMPcOB3N9WfEZk4noRlcvUMfMY8TWN8=
X-Received: by 2002:ac8:c86:: with SMTP id n6mr28974095qti.345.1567437819282;
 Mon, 02 Sep 2019 08:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190610213106.19342-1-mail@joaomoreno.com> <CAHxFc3QC147B6j4pBztjK7stLgCveeYhJWojai_SbKNbnpC9yw@mail.gmail.com>
 <CAO-hwJ+1FyaXj0iuCjvc5R-Kqdh6PNB7Un0ko1F_NV7-f5GMdw@mail.gmail.com>
 <CAHxFc3QJ1Xkgckt1BPptXT5S1xkROVdJzHTYT=GAcHXgm5UGqg@mail.gmail.com>
 <CAHxFc3TjZu7_u0U3ZoB466WGNzbfYLe4ZB7C4LuKdBAwkRum5Q@mail.gmail.com>
 <CAN+gG=H6O202SYXGbTG5rTMUt_X5dZyi02YFUquPaqL=FGHXwQ@mail.gmail.com>
 <bf759ce7-a0e1-0da8-ccd8-1925e5ccc184@redhat.com> <CAHxFc3QP8Jtbh0AVbj1zfUNtO+ek+PH-DG==DGfo6Dj7t7PXRA@mail.gmail.com>
In-Reply-To: <CAHxFc3QP8Jtbh0AVbj1zfUNtO+ek+PH-DG==DGfo6Dj7t7PXRA@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 2 Sep 2019 17:23:28 +0200
Message-ID: <CAO-hwJLXTd5aEvQtanfza6XoGiSwrmkCOURgDyet7wiEw0rRgA@mail.gmail.com>
Subject: Re: [PATCH] HID: apple: Fix stuck function keys when using FN
To:     =?UTF-8?B?Sm/Do28gTW9yZW5v?= <mail@joaomoreno.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi João,

On Mon, Sep 2, 2019 at 4:44 PM João Moreno <mail@joaomoreno.com> wrote:
>
> Hi Benjamin,
>
> First of all, sorry for the late reply. Turns out a newborn baby can
> keep one quite busy, who would have known? :)

heh. Well, congrats!

>
> On Tue, 27 Aug 2019 at 18:57, Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > Hi João,
> >
> > On 8/12/19 6:57 PM, Benjamin Tissoires wrote:
> > > Hi João,
> > >
> > > On Thu, Aug 8, 2019 at 10:35 PM João Moreno <mail@joaomoreno.com> wrote:
> > >>
> > >> Hi Benjamin,
> > >>
> > >> On Mon, 8 Jul 2019 at 22:35, João Moreno <mail@joaomoreno.com> wrote:
> > >>>
> > >>> Hi Benjamin,
> > >>>
> > >>> No worries, also pretty busy over here. Didn't mean to press.
> > >>>
> > >>> On Mon, 1 Jul 2019 at 10:32, Benjamin Tissoires
> > >>> <benjamin.tissoires@redhat.com> wrote:
> > >>>>
> > >>>> Hi João,
> > >>>>
> > >>>> On Sun, Jun 30, 2019 at 10:15 PM João Moreno <mail@joaomoreno.com> wrote:
> > >>>>>
> > >>>>> Hi Jiri & Benjamin,
> > >>>>>
> > >>>>> Let me know if you need something else to get this patch moving forward. This
> > >>>>> fixes an issue I hit daily, it would be great to get it fixed.
> > >>>>
> > >>>> Sorry for the delay, I am very busy with internal corporate stuff, and
> > >>>> I tried setting up a new CI system at home, and instead of spending a
> > >>>> couple of ours, I am down to 2 weeks of hard work, without possibility
> > >>>> to switch to the new right now :(
> > >>>> Anyway.
> > >>>>
> > >>>>>
> > >>>>> Thanks.
> > >>>>>
> > >>>>> On Mon, 10 Jun 2019 at 23:31, Joao Moreno <mail@joaomoreno.com> wrote:
> > >>>>>>
> > >>>>>> This fixes an issue in which key down events for function keys would be
> > >>>>>> repeatedly emitted even after the user has raised the physical key. For
> > >>>>>> example, the driver fails to emit the F5 key up event when going through
> > >>>>>> the following steps:
> > >>>>>> - fnmode=1: hold FN, hold F5, release FN, release F5
> > >>>>>> - fnmode=2: hold F5, hold FN, release F5, release FN
> > >>>>
> > >>>> Ouch :/
> > >>>>
> > >>>
> > >>> Right?!
> > >>>
> > >>>>>>
> > >>>>>> The repeated F5 key down events can be easily verified using xev.
> > >>>>>>
> > >>>>>> Signed-off-by: Joao Moreno <mail@joaomoreno.com>
> > >>>>>> ---
> > >>>>>>  drivers/hid/hid-apple.c | 21 +++++++++++----------
> > >>>>>>  1 file changed, 11 insertions(+), 10 deletions(-)
> > >>>>>>
> > >>>>>> diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> > >>>>>> index 1cb41992aaa1..81867a6fa047 100644
> > >>>>>> --- a/drivers/hid/hid-apple.c
> > >>>>>> +++ b/drivers/hid/hid-apple.c
> > >>>>>> @@ -205,20 +205,21 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
> > >>>>>>                 trans = apple_find_translation (table, usage->code);
> > >>>>>>
> > >>>>>>                 if (trans) {
> > >>>>>> -                       if (test_bit(usage->code, asc->pressed_fn))
> > >>>>>> -                               do_translate = 1;
> > >>>>>> -                       else if (trans->flags & APPLE_FLAG_FKEY)
> > >>>>>> -                               do_translate = (fnmode == 2 && asc->fn_on) ||
> > >>>>>> -                                       (fnmode == 1 && !asc->fn_on);
> > >>>>>> +                       int fn_on = value ? asc->fn_on :
> > >>>>>> +                               test_bit(usage->code, asc->pressed_fn);
> > >>>>>> +
> > >>>>>> +                       if (!value)
> > >>>>>> +                               clear_bit(usage->code, asc->pressed_fn);
> > >>>>>> +                       else if (asc->fn_on)
> > >>>>>> +                               set_bit(usage->code, asc->pressed_fn);
> > >>>>
> > >>>> I have the feeling that this is not the correct fix here.
> > >>>>
> > >>>> I might be wrong, but the following sequence might also mess up the
> > >>>> driver state, depending on how the reports are emitted:
> > >>>> - hold FN, hold F4, hold F5, release F4, release FN, release F5
> > >>>>
> > >>>
> > >>> I believe this should be fine. Following the code:
> > >>>
> > >>> - hold FN, sets asc->fn_on to true
> > >>> - hold F4, in the trans block fn_on will be true and we'll set the F4
> > >>> bit in the bitmap
> > >>> - hold F5, in the trans block fn_on will be true and we'll set the F5 bit
> > >>> - release F4, in the trans block fn_on will be true (because of the bitmap) and
> > >>> we'll clear the F4 bit
> > >>> - release FN, asc->fn_on will be false, but it doesn't matter since...
> > >>> - release F5, in the trans block we'll look into the bitmap (instead
> > >>> of asc->fn_on),
> > >>> so fn_on will be true and we'll clear the F5 bit
> > >>>
> > >>> I tested it in practice using my changes:
> > >>>
> > >>> Interestingly the Apple keyboard doesn't seem to emit an even for F5 when F4 is
> > >>> pressed, seems like a hardware limitation. But F6 does work. So, when I execute
> > >>> these events in that order, everything works as it should: xev reports
> > >>> the following:
> > >>>
> > >>> KeyPress F4
> > >>> KeyPress F6
> > >>> KeyRelease F4
> > >>> KeyRelease F6
> > >>>
> > >>>> The reason is that the driver only considers you have one key pressed
> > >>>> with the modifier, and as the code changed its state based on the last
> > >>>> value.
> > >>>>
> > >>>
> > >>> I believe the bitmap takes care of storing the FN state per key press. The
> > >>> trick I did was to check on the global `asc->fn_on` state only when a key
> > >>> is pressed, but check on the bitmap instead when it's released.
> > >>>
> > >>> Let me know what you think. Am I missing something here?
> > >>>
> > >>> Cheers,
> > >>> João.
> > >>>
> > >>>> IMO a better fix would:
> > >>>>
> > >>>> - keep the existing `trans` mapping lookout
> > >>>> - whenever a `trans` mapping gets found:
> > >>>>   * get both translated and non-translated currently reported values
> > >>>> (`test_bit(keycode, input_dev->key)`)
> > >>>>   * if one of them is set to true, then consider the keycode to be the
> > >>>> one of the key (no matter fn_on)
> > >>>>     -> deal with `value` with the corrected keycode
> > >>>>   * if the key was not pressed:
> > >>>>     -> chose the keycode based on `fn_on` and `fnmode` states
> > >>>>     and report the key press event
> > >>>>
> > >>>> This should remove the nasty pressed_fn state which depends on the
> > >>>> other pressed keys.
> > >>>>
> > >>>> Cheers,
> > >>>> Benjamin
> > >>>>
> > >>>>>> +
> > >>>>>> +                       if (trans->flags & APPLE_FLAG_FKEY)
> > >>>>>> +                               do_translate = (fnmode == 2 && fn_on) ||
> > >>>>>> +                                       (fnmode == 1 && !fn_on);
> > >>>>>>                         else
> > >>>>>>                                 do_translate = asc->fn_on;
> > >>>>>>
> > >>>>>>                         if (do_translate) {
> > >>>>>> -                               if (value)
> > >>>>>> -                                       set_bit(usage->code, asc->pressed_fn);
> > >>>>>> -                               else
> > >>>>>> -                                       clear_bit(usage->code, asc->pressed_fn);
> > >>>>>> -
> > >>>>>>                                 input_event(input, usage->type, trans->to,
> > >>>>>>                                                 value);
> > >>>>>>
> > >>>>>> --
> > >>>>>> 2.19.1
> > >>>>>>
> > >>
> > >> Gave this another look and I still haven't found any issues, let me
> > >> know if you still
> > >> think I'm missing something. Thanks!
> > >>
> > >
> > > OK, I am tempted to take the patch, but I'll need to add this as a
> > > regression test in my test-suite. This is too complex that it can
> > > easily break next time someone looks at it.
> > >
> > > Can you send me the report descriptors of the device using
> > > hid-recorder from hid-tools[0].
> > > Ideally, if you can put the faulty sequence in the logs, that would
> > > help writing down the use case.
> > >
> >
> > I finally managed to get the regression tests up in
> > https://gitlab.freedesktop.org/libevdev/hid-tools/merge_requests/52
> >
>
> This is great, really cool that you can write proper tests for this. I
> assume you don't need me to send you the report descriptors any more?

It would be nice to have yours too. Just in case they differ from the
one I have here.

>
> > This allowed me to better understand the code, and yes, for the F-keys,
> > I could not find a faulty situation with your patch.
> >
> > However, the same problem is happening with the arrow keys, as arrow up
> > is translated to page up.
> >
>
> Great catch, I can easily repro that issue as well on my keyboard.
>
> > We *could* adapt your patch to solve this, but I find it really hard to understand.
> >
> > How about the following diff:
> > ---
> > diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> > index 81df62f48c4c..ef916c0f3c0b 100644
> > --- a/drivers/hid/hid-apple.c
> > +++ b/drivers/hid/hid-apple.c
> > @@ -54,7 +54,6 @@ MODULE_PARM_DESC(swap_opt_cmd, "Swap the Option (\"Alt\") and Command (\"Flag\")
> >  struct apple_sc {
> >         unsigned long quirks;
> >         unsigned int fn_on;
> > -       DECLARE_BITMAP(pressed_fn, KEY_CNT);
> >         DECLARE_BITMAP(pressed_numlock, KEY_CNT);
> >  };
> >
> > @@ -181,6 +180,8 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
> >  {
> >         struct apple_sc *asc = hid_get_drvdata(hid);
> >         const struct apple_key_translation *trans, *table;
> > +       bool do_translate;
> > +       u16 code = 0;
> >
> >         if (usage->code == KEY_FN) {
> >                 asc->fn_on = !!value;
> > @@ -189,8 +190,6 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
> >         }
> >
> >         if (fnmode) {
> > -               int do_translate;
> > -
> >                 if (hid->product >= USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
> >                                 hid->product <= USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS)
> >                         table = macbookair_fn_keys;
> > @@ -202,25 +201,33 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
> >                 trans = apple_find_translation (table, usage->code);
> >
> >                 if (trans) {
> > -                       if (test_bit(usage->code, asc->pressed_fn))
> > -                               do_translate = 1;
> > -                       else if (trans->flags & APPLE_FLAG_FKEY)
> > -                               do_translate = (fnmode == 2 && asc->fn_on) ||
> > -                                       (fnmode == 1 && !asc->fn_on);
> > -                       else
> > -                               do_translate = asc->fn_on;
> > -
> > -                       if (do_translate) {
> > -                               if (value)
> > -                                       set_bit(usage->code, asc->pressed_fn);
> > -                               else
> > -                                       clear_bit(usage->code, asc->pressed_fn);
> > -
> > -                               input_event(input, usage->type, trans->to,
> > -                                               value);
> > -
> > -                               return 1;
> > +                       if (test_bit(trans->from, input->key))
> > +                               code = trans->from;
> > +                       if (test_bit(trans->to, input->key))
> > +                               code = trans->to;
>
> I see, this is what you meant before. I still don't quite understand
> what information `input->key` actually holds. Can you elaborate on
> what it contains? How does it differ from `usage->code`?

input is the input device itself (from the kernel point of view) and
key is the bitmask of the currently reported pressed keys.
usage->code is the HID usage (so from the hardware point of view) and
identifies which physical key is being pressed.
And last, asc->pressed_fn contained the bitmask of which physical key
was pressed, while here we store which reported key is sent.

>
> Also, should the second `if` be an `else if` instead? We shouldn't
> have to call `test_bit` more than once here, right? If right, then the
> next `if` would could simply be an `else`, since the translation
> tables should not have zeros in them.

right we can do that.

>
> > +
> > +                       if (!code) {
> > +                               if (trans->flags & APPLE_FLAG_FKEY) {
> > +                                       switch (fnmode) {
> > +                                       case 1:
> > +                                               do_translate = !asc->fn_on;
> > +                                               break;
> > +                                       case 2:
> > +                                               do_translate = asc->fn_on;
> > +                                               break;
> > +                                       default:
> > +                                               /* should never happen */
> > +                                               do_translate = false;
> > +                                       }
> > +                               } else {
> > +                                       do_translate = asc->fn_on;
> > +                               }
> > +
> > +                               code = do_translate ? trans->to : trans->from;
> >                         }
> > +
> > +                       input_event(input, usage->type, code, value);
> > +                       return 1;
> >                 }
> >
> >                 if (asc->quirks & APPLE_NUMLOCK_EMULATION &&
> > ---
> >
> > This is more or less what I suggested, minus the bug fixes.
> >
> > I find this easier to understand as the .pressed_fn field is not there
> > anymore and we just rely on the actual state of the input subsystem.
> >
> > Comments?
>
> Love it. Seems to catch all the cases on my hardware. Thanks for
> following up with the patch!

Thanks I'll properly resend the patch. I guess I should keep your from
and you can later add your signed-off-by line if you agree. (but
likely not today, I have to pick up my girls at school, things you'll
discover in a few years, or months for daycare :-P).

Cheers,
Benjamin

>
> >
> > Cheers,
> > Benjamin
> >
> >
> > > Cheers,
> > > Benjamin
> > >
> > > [0] https://gitlab.freedesktop.org/libevdev/hid-tools
> > >
>
> Cheers,
> João
