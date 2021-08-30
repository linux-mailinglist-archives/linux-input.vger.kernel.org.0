Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8CA3FBF4A
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 01:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238883AbhH3XNf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 19:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232217AbhH3XNf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 19:13:35 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 436A6C061575
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 16:12:41 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id k78so28140995ybf.10
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 16:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jrAweHPYQ9HPLEvkOg2uzi3tI+1e6ZqPh5Gh9OntgSY=;
        b=VRh5nzP0kD2OeyHqZ+U43GG2yG47+zEhi+IQ71Hv3YOWCfNHcnt/MZz7HhoHqUvQcZ
         DnBnNP68vDv36uqDn1/BCs5dXrMUJIevHanLS8ylbHm9PmyC1coSlso6DC+DSE3FRonX
         ONlBgmpEH2TncoBnUgM9PZnKx9v2HW91c15gA4G3rbOG1cAPlkqqtWVYpA3hErHXcIO3
         kCm/mOKpc9SfXeUCDgqc0iLBsjCXe3JrhsF9KCybojO6aQO51mVS5dy8CQliCxWSpJLp
         qt8FbnVFoHN1JqjADxFMHYacy8GubhHJnagRsM0AeWuv9XMrrBaKlPif0RVYJxuCUxqB
         hGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jrAweHPYQ9HPLEvkOg2uzi3tI+1e6ZqPh5Gh9OntgSY=;
        b=G+k08X+I/eAMdNvMRzUY/X0IQjlKsuqG2osHbQG/wctt5g8tlFBKxopfjz/VUbIfhI
         J7O96km/AYdEB6o24XrEMggFlTG1HjyDKdZ96zF8l2eSVFMM+Bk1XkDRfqjoJTO1k58D
         rlQPAmoI4XhVNq3sCzdlwsT0LTpUICSpEOuXvc9xNJ6zi7HVb1ld6XV2HOPha+2TmB4c
         /BjJBCTKTts8o9qDcv4mM1cimXrJwPp8Lg+9XilFvt2+fyljs+IAWBvnTXGrGn2tByV+
         QW69Or7xtu/CGBNBb/Z6MAVimlsOZCBKeamN6SkGA1OB6UNasiNw6H+wJxKLWzil2T38
         GpBA==
X-Gm-Message-State: AOAM530eNssv4doIOiekk9j5fY74dgiGWJ4lZytXyeigVo3nS9vb8t6c
        YATzhmGeMPgCky7QmOLaC7dr0wjCaupCdNxqnl0=
X-Google-Smtp-Source: ABdhPJxnOyPOuFjg4afOzyY8UHglb/xB9WxeLPipPDRMmMnx1DkOR/0CEobdwMhTASJ4asU/yYKF7LDo3Ogiz55Kv+o=
X-Received: by 2002:a25:fc5:: with SMTP id 188mr27357305ybp.51.1630365160510;
 Mon, 30 Aug 2021 16:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAGfCfjjZac9Z8X6GiSHesrQUj8_NiTPOrjCuU7P-g522pQ85Cw@mail.gmail.com>
In-Reply-To: <CAGfCfjjZac9Z8X6GiSHesrQUj8_NiTPOrjCuU7P-g522pQ85Cw@mail.gmail.com>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Mon, 30 Aug 2021 16:12:29 -0700
Message-ID: <CAEc3jaBspXk=mCe4xo6N5_p9_+qoUa9qiEkRdm2Y1rTahnnjyg@mail.gmail.com>
Subject: Re: help needed in this part of code regarding FF in hid-sony.c
To:     fei fei <cyfei1982@gmail.com>
Cc:     "Colenbrander, Roelof" <roderick.colenbrander@sony.com>,
        linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Fei,

I'm not sure why you are trying to make such change kernel side, but
of course nothing is stopping you for personal use.

Kernel development is not easy and it is very easy to crash your
system. I can't say what is wrong here, but among the most common
issues are null pointer dereferences. If lucky the error is caught in
your kernel log, which should give you some clues on where the error
is coming from.

Also in your changes, I see you added some sleeps. Sleeping in the
kernel is taboo in a lot of places and depending on where is done can
also be a thing leading to issues as well. Depending on where you
tried to initiate some of this new code, the driver might not have
completed fully initializing, so some variables might not be set or
buffers might not be fully initialized.

Thanks,
Roderick

On Mon, Aug 30, 2021 at 12:11 AM fei fei <cyfei1982@gmail.com> wrote:
>
> 4th attempt......
>
> Hello to Mr. Roderick or to whom it may concren,
>
> I am fei, a novice self-studied programming enthusiast, I need help
> with hid-sony.c, but there is no relevant maintainer found in the
> MAINTAINERS list, the closest is you, Mr. Roderick as the maintainer
> of hid-playstation.c, so I just try my luck here, hope you don't mind.
>
> The scenario as follow:
>
> I have added a feature to make initial rumble vibrates when devices
> are connected, code as follow (sony_play_effect() as reference) :
>
> add delay.h
>
> -----------------------------
> #include <linux/delay.h>
> -----------------------------
>
>
>
>
>
> define a global variable "init_rumble"
>
> ------------------------------
> ......#define SONY_FF_SUPPORT (SIXAXIS_CONTROLLER | DUALSHOCK4_CONTROLLER)
>
> bool init_rumble;
> #define SONY_BT_DEVICE......
> ------------------------------
>
>
>
>
> declare "init_rumble = true;" in sony_probe()
>
>
> actual part
>
> ------------------------------
> static int sony_init_ff_play(struct input_dev *dev)
> {
>     struct hid_device *hid = input_get_drvdata(dev);
>     struct sony_sc *sc = hid_get_drvdata(hid);
>
>     sc->left = 255;
>     sc->right = 255;
>
> /*needed for non bt connection or else won't work, reason unknown*/
>     if (!(sc->quirks & SONY_BT_DEVICE))
>           sony_schedule_work(sc, SONY_WORKER_STATE);
>
>     /*length-ing magnitude above*/
>     msleep(350);
>
>     sc->left = 0;
>     sc->right = 0;
>     sony_schedule_work(sc, SONY_WORKER_STATE);
>
>     init_rumble = false;
>
>     return 0;
> }
> -------------------------------
>
>
>
>
> and called from sony_init_ff()
>
> --------------------------------
> ......input_set_capability(input_dev, EV_FF, FF_RUMBLE);
>
> if (init_rumble == true) {
>     sony_init_ff_play(input_dev);
> }
>
> return input_ff_create_memless(input_dev......
> --------------------------------
>
>
>
>
> it works flawlessly without any error. Since it's identical to
> sony_play_effect(), so i just tried to merge them together into
> sony_play_effect() to reduce redundancy as follow:
>
> ------------------------------------
> static int sony_play_effect(struct input_dev *dev, void *data,
>    struct ff_effect *effect)
> {
>     struct hid_device *hid = input_get_drvdata(dev);
>     struct sony_sc *sc = hid_get_drvdata(hid);
>
>     if (effect->type != FF_RUMBLE)
>         return 0;
>
>     if (init_rumble == true)
>     {
>           sc->left = 255;
>           sc->right = 255;
>
>           if (!(sc->quirks & SONY_BT_DEVICE))
>               sony_schedule_work(sc, SONY_WORKER_STATE);
>
>           msleep(400);
>
>           sc->left = 0;
>           sc->right = 0;
>           sony_schedule_work(sc, SONY_WORKER_STATE);
>
>           init_rumble = false;
>           return 0;
>     }
>
>     sc->left = effect->u.rumble.strong_magnitude / 256;
>     sc->right = effect->u.rumble.weak_magnitude / 256;
>
>     sony_schedule_work(sc, SONY_WORKER_STATE);
>
>     return 0;
> }
> -----------------------------------------------
>
>
>
>
> called it from sony_init_ff()
>
> ----------------------------------------------
>  ......input_set_capability(input_dev, EV_FF, FF_RUMBLE);
>
>    if (init_rumble == true) {
>        sony_play_effect(input_dev, NULL, NULL);
>    }
>
> return input_ff_create_memless(input_dev......
> ------------------------------------------------
>
>
>
>
> but end up whole system being freezed up, what could possibly going
> wrong here? Thx in advance.
>
> Regards,
> fei
