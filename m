Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10F7F3FEF7C
	for <lists+linux-input@lfdr.de>; Thu,  2 Sep 2021 16:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345436AbhIBOe6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Sep 2021 10:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345374AbhIBOe6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Sep 2021 10:34:58 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DB3C061575
        for <linux-input@vger.kernel.org>; Thu,  2 Sep 2021 07:33:59 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id z7so1245136qvi.4
        for <linux-input@vger.kernel.org>; Thu, 02 Sep 2021 07:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3KQ6G35PlxUS7qEBd1dJFqBZBO6DyHVi9jLOTG0fUuo=;
        b=bCmRwbIcwEv/bN2TDgaUTe74jMuFo8tRkUXEllgCKVgyu8/eIAXYNcmSqCW3vwrqSK
         u/nhygFLKis2UkWUnzv0mIZJRlLbBHuGjOsNtot3qGEHBogMguBe6JGeDrRmehZVIWnV
         hCmI900oEa9mE7wUR8uuOzd5EEOefm/tvVCy8Bu0YzXHAKnZiXIw3F2KW4VdZcQkwdpj
         SwwxR/U6fvb8Qz9G0bWdhD3E5+uMjEtjkr5AE5xdCwjQ96/7VE23+ppYbGU3igKZW87P
         JK8/wpaUKQKv51wQ/fQ0zcfcBykWmO3TFmZJvqtZ0MGcDR/EkF9hR/9qTVa7YnFy7Jv1
         GgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3KQ6G35PlxUS7qEBd1dJFqBZBO6DyHVi9jLOTG0fUuo=;
        b=UAVRIRQw0/BCJDGHopnZsJz5Q2tY2oM0c/Y6mGoCvQqIQh3EKXTLLKlJWQ0O0j31/Q
         jLaPND3yQtpzzlpAJJbO2AiLkx1owOmKwra5C3oq5BEhlDHhw1Xi1EPydMuqg1bdDCi+
         hQJ2DcYqnPq4tB1FcePx0QPbddchTR4ZhIUkZvaGtRcEaLkNmA7PvMPMnIqn44D63NSf
         LdzEHqNYC43ivNf4k4tCooe7jpAkYMb+p/ELdtq5P/FMLyIk8VtOYO+91WEoIqLrQKh+
         H1gBlHfGg9d8bMNHZTUkxFkpmXMtJW2ocewZeaDShlB5+hW3UVpFiAMfUOqc15dNCZAL
         j93w==
X-Gm-Message-State: AOAM531ycVPNercezscpq7gCE0sokk4D6R3AGRTAGagVNG8CyNcyCfgi
        WD2YvgSrwXgBA/CNttk0FtsI7LrOs46x1n/ehadRblJk
X-Google-Smtp-Source: ABdhPJzdMhxDRt8IbWNcW8dWE0AGyltxKNvSyDuDKWk/Nqjeuh0GhbUwlCoVVPMqRpb7RVj4cYXfCq9HQrnV2wRUvKM=
X-Received: by 2002:a0c:e412:: with SMTP id o18mr3559572qvl.57.1630593238809;
 Thu, 02 Sep 2021 07:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAGfCfjjZac9Z8X6GiSHesrQUj8_NiTPOrjCuU7P-g522pQ85Cw@mail.gmail.com>
 <CAEc3jaBspXk=mCe4xo6N5_p9_+qoUa9qiEkRdm2Y1rTahnnjyg@mail.gmail.com>
 <CAGfCfjiakgR1qRr4t1GU7Yte6qjizmoK30RkpZdyYuCf_enquQ@mail.gmail.com> <CAEc3jaB_mhxjUOT=CrGf7Nm7o+CqGcaRMDxqyCDyYVLqhRGM2A@mail.gmail.com>
In-Reply-To: <CAEc3jaB_mhxjUOT=CrGf7Nm7o+CqGcaRMDxqyCDyYVLqhRGM2A@mail.gmail.com>
From:   fei fei <cyfei1982@gmail.com>
Date:   Thu, 2 Sep 2021 22:33:47 +0800
Message-ID: <CAGfCfjg0ADpk8nDkvmpdAW4aNbxei22zsFU0VEtUb6KiS-dhPQ@mail.gmail.com>
Subject: Re: help needed in this part of code regarding FF in hid-sony.c
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
Cc:     "Colenbrander, Roelof" <roderick.colenbrander@sony.com>,
        linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Oh, I'm not familiar with linux kernel actually, if what I did is not
suitable for linux kernel space, I'll leave it just for my own use
then. And by the way, the environment I'm working on is Android device
actually, I wonder why something like this would be a drastic change.

udev rules is easy to access in linux but in Android I wonder how this
is to be done.

Anyway, get to know that you're on vacation in other mail, sorry for
occupied your precious personal time and thank you to help in my
inquiries, enjoy your vacation ^_^

On Thu, 2 Sept 2021 at 05:38, Roderick Colenbrander
<thunderbird2k@gmail.com> wrote:
>
> Hi Fei,
>
> Thanks for your interest in adding this capability. I'm not sure if
> this type of feature is desired in the Linux kernel directly. It is
> not common practice to make a controller rumble at startup (not even
> on game consoles). This driver is used in many devices (e.g. Android)
> and such change would be a drastic behavior change.
>
> If this is a behavior you would like to see for yourself, I would
> recommend not to do this kernel side. You can easily add a udev rule
> on your system to trigger a certain command upon discovery of a Sony
> game controller as well as controllers from other vendors.
>
> Thanks,
> Roderick
>
> On Mon, Aug 30, 2021 at 10:23 PM fei fei <cyfei1982@gmail.com> wrote:
> >
> > Thanks Mr. Roderick for such quick reply, and sorry for redundant
> > emails, still not familiar with how linux kenel mailing list worked.
> >
> > The purpose for doing this is to have an alternative way of
> > initialization/connection success indicator other than just the LEDs
> > in case of the leds broken/burnt, it's always better to have
> > alternative than no, isn't it?
> >
> > I'll try digging in the kernel log see if I'm lucky enough to find
> > something useful.
> >
> > For the sleep part, it's because I need to make adjustment to the
> > magnitude play duration for the initial rumble, if I take out the
> > sleep, the vibration will be long/simply no effect at all either
> > has/not has the sc->left/right = 0 part right after, thus unsuitable
> > for the initial rumble purpose(kinda weird). Never knew that it's
> > taboo to use sleep in kernel, as some articles out there suggested
> > that sleep is common in device driver.
> >
> > It's actually trouble free if I just set the initial rumble as
> > independent function, but if I insist to merge it into
> > sony_play_effect( ), how would you suggest proper way to make it
> > right? Thanks.
> >
> > Regards,
> > fei
> >
> > On Tue, 31 Aug 2021 at 07:12, Roderick Colenbrander
> > <thunderbird2k@gmail.com> wrote:
> > >
> > > Hi Fei,
> > >
> > > I'm not sure why you are trying to make such change kernel side, but
> > > of course nothing is stopping you for personal use.
> > >
> > > Kernel development is not easy and it is very easy to crash your
> > > system. I can't say what is wrong here, but among the most common
> > > issues are null pointer dereferences. If lucky the error is caught in
> > > your kernel log, which should give you some clues on where the error
> > > is coming from.
> > >
> > > Also in your changes, I see you added some sleeps. Sleeping in the
> > > kernel is taboo in a lot of places and depending on where is done can
> > > also be a thing leading to issues as well. Depending on where you
> > > tried to initiate some of this new code, the driver might not have
> > > completed fully initializing, so some variables might not be set or
> > > buffers might not be fully initialized.
> > >
> > > Thanks,
> > > Roderick
> > >
> > > On Mon, Aug 30, 2021 at 12:11 AM fei fei <cyfei1982@gmail.com> wrote:
> > > >
> > > > 4th attempt......
> > > >
> > > > Hello to Mr. Roderick or to whom it may concren,
> > > >
> > > > I am fei, a novice self-studied programming enthusiast, I need help
> > > > with hid-sony.c, but there is no relevant maintainer found in the
> > > > MAINTAINERS list, the closest is you, Mr. Roderick as the maintainer
> > > > of hid-playstation.c, so I just try my luck here, hope you don't mind.
> > > >
> > > > The scenario as follow:
> > > >
> > > > I have added a feature to make initial rumble vibrates when devices
> > > > are connected, code as follow (sony_play_effect() as reference) :
> > > >
> > > > add delay.h
> > > >
> > > > -----------------------------
> > > > #include <linux/delay.h>
> > > > -----------------------------
> > > >
> > > >
> > > >
> > > >
> > > >
> > > > define a global variable "init_rumble"
> > > >
> > > > ------------------------------
> > > > ......#define SONY_FF_SUPPORT (SIXAXIS_CONTROLLER | DUALSHOCK4_CONTROLLER)
> > > >
> > > > bool init_rumble;
> > > > #define SONY_BT_DEVICE......
> > > > ------------------------------
> > > >
> > > >
> > > >
> > > >
> > > > declare "init_rumble = true;" in sony_probe()
> > > >
> > > >
> > > > actual part
> > > >
> > > > ------------------------------
> > > > static int sony_init_ff_play(struct input_dev *dev)
> > > > {
> > > >     struct hid_device *hid = input_get_drvdata(dev);
> > > >     struct sony_sc *sc = hid_get_drvdata(hid);
> > > >
> > > >     sc->left = 255;
> > > >     sc->right = 255;
> > > >
> > > > /*needed for non bt connection or else won't work, reason unknown*/
> > > >     if (!(sc->quirks & SONY_BT_DEVICE))
> > > >           sony_schedule_work(sc, SONY_WORKER_STATE);
> > > >
> > > >     /*length-ing magnitude above*/
> > > >     msleep(350);
> > > >
> > > >     sc->left = 0;
> > > >     sc->right = 0;
> > > >     sony_schedule_work(sc, SONY_WORKER_STATE);
> > > >
> > > >     init_rumble = false;
> > > >
> > > >     return 0;
> > > > }
> > > > -------------------------------
> > > >
> > > >
> > > >
> > > >
> > > > and called from sony_init_ff()
> > > >
> > > > --------------------------------
> > > > ......input_set_capability(input_dev, EV_FF, FF_RUMBLE);
> > > >
> > > > if (init_rumble == true) {
> > > >     sony_init_ff_play(input_dev);
> > > > }
> > > >
> > > > return input_ff_create_memless(input_dev......
> > > > --------------------------------
> > > >
> > > >
> > > >
> > > >
> > > > it works flawlessly without any error. Since it's identical to
> > > > sony_play_effect(), so i just tried to merge them together into
> > > > sony_play_effect() to reduce redundancy as follow:
> > > >
> > > > ------------------------------------
> > > > static int sony_play_effect(struct input_dev *dev, void *data,
> > > >    struct ff_effect *effect)
> > > > {
> > > >     struct hid_device *hid = input_get_drvdata(dev);
> > > >     struct sony_sc *sc = hid_get_drvdata(hid);
> > > >
> > > >     if (effect->type != FF_RUMBLE)
> > > >         return 0;
> > > >
> > > >     if (init_rumble == true)
> > > >     {
> > > >           sc->left = 255;
> > > >           sc->right = 255;
> > > >
> > > >           if (!(sc->quirks & SONY_BT_DEVICE))
> > > >               sony_schedule_work(sc, SONY_WORKER_STATE);
> > > >
> > > >           msleep(400);
> > > >
> > > >           sc->left = 0;
> > > >           sc->right = 0;
> > > >           sony_schedule_work(sc, SONY_WORKER_STATE);
> > > >
> > > >           init_rumble = false;
> > > >           return 0;
> > > >     }
> > > >
> > > >     sc->left = effect->u.rumble.strong_magnitude / 256;
> > > >     sc->right = effect->u.rumble.weak_magnitude / 256;
> > > >
> > > >     sony_schedule_work(sc, SONY_WORKER_STATE);
> > > >
> > > >     return 0;
> > > > }
> > > > -----------------------------------------------
> > > >
> > > >
> > > >
> > > >
> > > > called it from sony_init_ff()
> > > >
> > > > ----------------------------------------------
> > > >  ......input_set_capability(input_dev, EV_FF, FF_RUMBLE);
> > > >
> > > >    if (init_rumble == true) {
> > > >        sony_play_effect(input_dev, NULL, NULL);
> > > >    }
> > > >
> > > > return input_ff_create_memless(input_dev......
> > > > ------------------------------------------------
> > > >
> > > >
> > > >
> > > >
> > > > but end up whole system being freezed up, what could possibly going
> > > > wrong here? Thx in advance.
> > > >
> > > > Regards,
> > > > fei
