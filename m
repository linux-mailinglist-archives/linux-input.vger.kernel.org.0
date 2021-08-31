Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84CE23FC219
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 07:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232527AbhHaFYK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Aug 2021 01:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhHaFYJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Aug 2021 01:24:09 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A553EC061575
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 22:23:14 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id ew6so9726542qvb.5
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 22:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4LBfzhJuKaaDbcIGHB0GmHTxy6kwg+27+3V9AdYGKUE=;
        b=l40WNCvhyLzKByvLZcxagGehSVlE3+avoLukmKX+V6KLs3cc3OY+7SIlMTfrKhAABr
         F21vhzM9INqvYoVss7H/DB0jyOalrDuT1drO7XGNn2mHxPLIM5CK/ibI9vk/QKL+wiI1
         TYfXMzQXAfm+Em1qLw/Tvi+6IgMy5rsRaL49E7o717aQ3uyRPwiDeZNonhshaFLRMKRA
         ccok2f17zj8q6/dUY4qREx24eWVuhDlqSirqBBj7lBcbBlT7erqbW9BqhQetugiAKSMo
         yoXfQD5IctFddPuKjQQPqjeAqJB3m7/scrNeJlEDPHXKrDe6MBeSTxcJX+31mQI+iN3+
         gT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4LBfzhJuKaaDbcIGHB0GmHTxy6kwg+27+3V9AdYGKUE=;
        b=lUkLCrCNepKqIONFffOZJpq/ZYFsTkF2HQOkWB9w+hEUinTPQQC4C/12hlRwno545H
         DCRNsV3AGyNAJcjNoQnSSEdK6if02X65lO3AKbZS9uoQBzwComG4ZAE2YJYZOiDykwl1
         9GsMQDRGN3w9Inx1ycfSlcJYoTrfTf7TlXlsFfYqwsWp1Ypm/3vV/92T3a3M09RxWAGE
         oqVdP+kIanbuaBSKM8pWJKIH+7OVBzITKmPalxkqHRGZpKhpy4JyXmspZE3+Ljow8k1c
         C2S9PqQAOUdYYAeQ0ap/DMgqkibAkSMe+1uVYctLb1VjRlOpR8qHkI//aJBW7YUSsRTL
         /1uw==
X-Gm-Message-State: AOAM531PzDxdtyU0peVjt6aXhzd4r8udEByKfyZcdLmgmgTv6S5Z49cx
        3HLB0eP+De+fse8ArssBm/Wm+yz5umSUxPr0E6A=
X-Google-Smtp-Source: ABdhPJzyyXC8UuohqytR9JGOf8zyfM48U708egQXAuLVuszMSE5b2lxnrzUzusfWKpLBgvlFqFh37rVKSfy0rX9dsUc=
X-Received: by 2002:a05:6214:54b:: with SMTP id ci11mr26680365qvb.24.1630387393790;
 Mon, 30 Aug 2021 22:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAGfCfjjZac9Z8X6GiSHesrQUj8_NiTPOrjCuU7P-g522pQ85Cw@mail.gmail.com>
 <CAEc3jaBspXk=mCe4xo6N5_p9_+qoUa9qiEkRdm2Y1rTahnnjyg@mail.gmail.com>
In-Reply-To: <CAEc3jaBspXk=mCe4xo6N5_p9_+qoUa9qiEkRdm2Y1rTahnnjyg@mail.gmail.com>
From:   fei fei <cyfei1982@gmail.com>
Date:   Tue, 31 Aug 2021 13:23:02 +0800
Message-ID: <CAGfCfjiakgR1qRr4t1GU7Yte6qjizmoK30RkpZdyYuCf_enquQ@mail.gmail.com>
Subject: Re: help needed in this part of code regarding FF in hid-sony.c
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
Cc:     "Colenbrander, Roelof" <roderick.colenbrander@sony.com>,
        linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks Mr. Roderick for such quick reply, and sorry for redundant
emails, still not familiar with how linux kenel mailing list worked.

The purpose for doing this is to have an alternative way of
initialization/connection success indicator other than just the LEDs
in case of the leds broken/burnt, it's always better to have
alternative than no, isn't it?

I'll try digging in the kernel log see if I'm lucky enough to find
something useful.

For the sleep part, it's because I need to make adjustment to the
magnitude play duration for the initial rumble, if I take out the
sleep, the vibration will be long/simply no effect at all either
has/not has the sc->left/right = 0 part right after, thus unsuitable
for the initial rumble purpose(kinda weird). Never knew that it's
taboo to use sleep in kernel, as some articles out there suggested
that sleep is common in device driver.

It's actually trouble free if I just set the initial rumble as
independent function, but if I insist to merge it into
sony_play_effect( ), how would you suggest proper way to make it
right? Thanks.

Regards,
fei

On Tue, 31 Aug 2021 at 07:12, Roderick Colenbrander
<thunderbird2k@gmail.com> wrote:
>
> Hi Fei,
>
> I'm not sure why you are trying to make such change kernel side, but
> of course nothing is stopping you for personal use.
>
> Kernel development is not easy and it is very easy to crash your
> system. I can't say what is wrong here, but among the most common
> issues are null pointer dereferences. If lucky the error is caught in
> your kernel log, which should give you some clues on where the error
> is coming from.
>
> Also in your changes, I see you added some sleeps. Sleeping in the
> kernel is taboo in a lot of places and depending on where is done can
> also be a thing leading to issues as well. Depending on where you
> tried to initiate some of this new code, the driver might not have
> completed fully initializing, so some variables might not be set or
> buffers might not be fully initialized.
>
> Thanks,
> Roderick
>
> On Mon, Aug 30, 2021 at 12:11 AM fei fei <cyfei1982@gmail.com> wrote:
> >
> > 4th attempt......
> >
> > Hello to Mr. Roderick or to whom it may concren,
> >
> > I am fei, a novice self-studied programming enthusiast, I need help
> > with hid-sony.c, but there is no relevant maintainer found in the
> > MAINTAINERS list, the closest is you, Mr. Roderick as the maintainer
> > of hid-playstation.c, so I just try my luck here, hope you don't mind.
> >
> > The scenario as follow:
> >
> > I have added a feature to make initial rumble vibrates when devices
> > are connected, code as follow (sony_play_effect() as reference) :
> >
> > add delay.h
> >
> > -----------------------------
> > #include <linux/delay.h>
> > -----------------------------
> >
> >
> >
> >
> >
> > define a global variable "init_rumble"
> >
> > ------------------------------
> > ......#define SONY_FF_SUPPORT (SIXAXIS_CONTROLLER | DUALSHOCK4_CONTROLLER)
> >
> > bool init_rumble;
> > #define SONY_BT_DEVICE......
> > ------------------------------
> >
> >
> >
> >
> > declare "init_rumble = true;" in sony_probe()
> >
> >
> > actual part
> >
> > ------------------------------
> > static int sony_init_ff_play(struct input_dev *dev)
> > {
> >     struct hid_device *hid = input_get_drvdata(dev);
> >     struct sony_sc *sc = hid_get_drvdata(hid);
> >
> >     sc->left = 255;
> >     sc->right = 255;
> >
> > /*needed for non bt connection or else won't work, reason unknown*/
> >     if (!(sc->quirks & SONY_BT_DEVICE))
> >           sony_schedule_work(sc, SONY_WORKER_STATE);
> >
> >     /*length-ing magnitude above*/
> >     msleep(350);
> >
> >     sc->left = 0;
> >     sc->right = 0;
> >     sony_schedule_work(sc, SONY_WORKER_STATE);
> >
> >     init_rumble = false;
> >
> >     return 0;
> > }
> > -------------------------------
> >
> >
> >
> >
> > and called from sony_init_ff()
> >
> > --------------------------------
> > ......input_set_capability(input_dev, EV_FF, FF_RUMBLE);
> >
> > if (init_rumble == true) {
> >     sony_init_ff_play(input_dev);
> > }
> >
> > return input_ff_create_memless(input_dev......
> > --------------------------------
> >
> >
> >
> >
> > it works flawlessly without any error. Since it's identical to
> > sony_play_effect(), so i just tried to merge them together into
> > sony_play_effect() to reduce redundancy as follow:
> >
> > ------------------------------------
> > static int sony_play_effect(struct input_dev *dev, void *data,
> >    struct ff_effect *effect)
> > {
> >     struct hid_device *hid = input_get_drvdata(dev);
> >     struct sony_sc *sc = hid_get_drvdata(hid);
> >
> >     if (effect->type != FF_RUMBLE)
> >         return 0;
> >
> >     if (init_rumble == true)
> >     {
> >           sc->left = 255;
> >           sc->right = 255;
> >
> >           if (!(sc->quirks & SONY_BT_DEVICE))
> >               sony_schedule_work(sc, SONY_WORKER_STATE);
> >
> >           msleep(400);
> >
> >           sc->left = 0;
> >           sc->right = 0;
> >           sony_schedule_work(sc, SONY_WORKER_STATE);
> >
> >           init_rumble = false;
> >           return 0;
> >     }
> >
> >     sc->left = effect->u.rumble.strong_magnitude / 256;
> >     sc->right = effect->u.rumble.weak_magnitude / 256;
> >
> >     sony_schedule_work(sc, SONY_WORKER_STATE);
> >
> >     return 0;
> > }
> > -----------------------------------------------
> >
> >
> >
> >
> > called it from sony_init_ff()
> >
> > ----------------------------------------------
> >  ......input_set_capability(input_dev, EV_FF, FF_RUMBLE);
> >
> >    if (init_rumble == true) {
> >        sony_play_effect(input_dev, NULL, NULL);
> >    }
> >
> > return input_ff_create_memless(input_dev......
> > ------------------------------------------------
> >
> >
> >
> >
> > but end up whole system being freezed up, what could possibly going
> > wrong here? Thx in advance.
> >
> > Regards,
> > fei
