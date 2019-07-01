Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 647C65B6DE
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2019 10:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbfGAIc4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Mon, 1 Jul 2019 04:32:56 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37098 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbfGAIc4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jul 2019 04:32:56 -0400
Received: by mail-qt1-f196.google.com with SMTP id y57so13752906qtk.4
        for <linux-input@vger.kernel.org>; Mon, 01 Jul 2019 01:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=R/dnpSNZfbK9SytPEk8BpB1UB4x7kkm8B/EmwIRcbdc=;
        b=rF5CoERP28iAYJji24I2JlE1vLmlwdggCV6Hcrnm7szW17+IdPBt5oRmCf3U0hPn0f
         D9lClRS22OdxM4PqEbJxdMVrPGiq13qY/a9Zl0levi3Hr1IncucB9u7pw42tyksRjWrE
         odjLJ0VzFJAy+v5EBd45wP7kL7MjiP01POpp5JV42/wgv7F8g961fEL9F8aZLaExH3OR
         jLr9Subtm/SB6b6XTlnr0w6fEKanEGobyzSV8+sVjjQurObn3bTcv+8WhjssBjiXiREv
         Ym3Z11CuMz/a0clDL13NCj36R1k/NXAZ2B3XEunUq6iXQGrAw4ov4HJGGonLM4BcNZAm
         QeUQ==
X-Gm-Message-State: APjAAAUzsKgnKlPfdWd9Mzvs51DclLNV9ZeCKf5CQy3bWN/ImZg6w/1A
        78g7LcbFU659Beb+iqVgJoqcvy02Zm84E8sdQCTGLkXky/U=
X-Google-Smtp-Source: APXvYqzW82f5vK6CaNkwgffplw5LCZ0/09l48/RVKBFucEahB3Gc4BYTQuVVrqL3YwjpHxz/qh5dsu0gYSXJw31xrow=
X-Received: by 2002:ac8:275a:: with SMTP id h26mr19095323qth.345.1561969975710;
 Mon, 01 Jul 2019 01:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190610213106.19342-1-mail@joaomoreno.com> <CAHxFc3QC147B6j4pBztjK7stLgCveeYhJWojai_SbKNbnpC9yw@mail.gmail.com>
In-Reply-To: <CAHxFc3QC147B6j4pBztjK7stLgCveeYhJWojai_SbKNbnpC9yw@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 1 Jul 2019 10:32:44 +0200
Message-ID: <CAO-hwJ+1FyaXj0iuCjvc5R-Kqdh6PNB7Un0ko1F_NV7-f5GMdw@mail.gmail.com>
Subject: Re: [PATCH] HID: apple: Fix stuck function keys when using FN
To:     =?UTF-8?B?Sm/Do28gTW9yZW5v?= <mail@joaomoreno.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi João,

On Sun, Jun 30, 2019 at 10:15 PM João Moreno <mail@joaomoreno.com> wrote:
>
> Hi Jiri & Benjamin,
>
> Let me know if you need something else to get this patch moving forward. This
> fixes an issue I hit daily, it would be great to get it fixed.

Sorry for the delay, I am very busy with internal corporate stuff, and
I tried setting up a new CI system at home, and instead of spending a
couple of ours, I am down to 2 weeks of hard work, without possibility
to switch to the new right now :(
Anyway.

>
> Thanks.
>
> On Mon, 10 Jun 2019 at 23:31, Joao Moreno <mail@joaomoreno.com> wrote:
> >
> > This fixes an issue in which key down events for function keys would be
> > repeatedly emitted even after the user has raised the physical key. For
> > example, the driver fails to emit the F5 key up event when going through
> > the following steps:
> > - fnmode=1: hold FN, hold F5, release FN, release F5
> > - fnmode=2: hold F5, hold FN, release F5, release FN

Ouch :/

> >
> > The repeated F5 key down events can be easily verified using xev.
> >
> > Signed-off-by: Joao Moreno <mail@joaomoreno.com>
> > ---
> >  drivers/hid/hid-apple.c | 21 +++++++++++----------
> >  1 file changed, 11 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> > index 1cb41992aaa1..81867a6fa047 100644
> > --- a/drivers/hid/hid-apple.c
> > +++ b/drivers/hid/hid-apple.c
> > @@ -205,20 +205,21 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
> >                 trans = apple_find_translation (table, usage->code);
> >
> >                 if (trans) {
> > -                       if (test_bit(usage->code, asc->pressed_fn))
> > -                               do_translate = 1;
> > -                       else if (trans->flags & APPLE_FLAG_FKEY)
> > -                               do_translate = (fnmode == 2 && asc->fn_on) ||
> > -                                       (fnmode == 1 && !asc->fn_on);
> > +                       int fn_on = value ? asc->fn_on :
> > +                               test_bit(usage->code, asc->pressed_fn);
> > +
> > +                       if (!value)
> > +                               clear_bit(usage->code, asc->pressed_fn);
> > +                       else if (asc->fn_on)
> > +                               set_bit(usage->code, asc->pressed_fn);

I have the feeling that this is not the correct fix here.

I might be wrong, but the following sequence might also mess up the
driver state, depending on how the reports are emitted:
- hold FN, hold F4, hold F5, release F4, release FN, release F5

The reason is that the driver only considers you have one key pressed
with the modifier, and as the code changed its state based on the last
value.

IMO a better fix would:

- keep the existing `trans` mapping lookout
- whenever a `trans` mapping gets found:
  * get both translated and non-translated currently reported values
(`test_bit(keycode, input_dev->key)`)
  * if one of them is set to true, then consider the keycode to be the
one of the key (no matter fn_on)
    -> deal with `value` with the corrected keycode
  * if the key was not pressed:
    -> chose the keycode based on `fn_on` and `fnmode` states
    and report the key press event

This should remove the nasty pressed_fn state which depends on the
other pressed keys.

Cheers,
Benjamin

> > +
> > +                       if (trans->flags & APPLE_FLAG_FKEY)
> > +                               do_translate = (fnmode == 2 && fn_on) ||
> > +                                       (fnmode == 1 && !fn_on);
> >                         else
> >                                 do_translate = asc->fn_on;
> >
> >                         if (do_translate) {
> > -                               if (value)
> > -                                       set_bit(usage->code, asc->pressed_fn);
> > -                               else
> > -                                       clear_bit(usage->code, asc->pressed_fn);
> > -
> >                                 input_event(input, usage->type, trans->to,
> >                                                 value);
> >
> > --
> > 2.19.1
> >
