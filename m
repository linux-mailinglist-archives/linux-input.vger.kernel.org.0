Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 842D5433C9B
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 18:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232355AbhJSQoG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 12:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbhJSQoF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 12:44:05 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9D7C06161C
        for <linux-input@vger.kernel.org>; Tue, 19 Oct 2021 09:41:52 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id l80so9091507ybf.4
        for <linux-input@vger.kernel.org>; Tue, 19 Oct 2021 09:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vk66tDoERkir2w1Tea0RzRP83gftobxq7BenhcVNir8=;
        b=KWtUW9rScG+EXdLsPq1TFJb8unSJYfrjNkZftBKO+D2yDOUMiDr2vqKlNAXV6M++tD
         yGLr1fq0+YP6zePEp25yUtdny3Q6fa0AV7SH8Cqnj00tmi6Wi51mzUtQfwN/8qBp6YJQ
         ZN9qx9eOJfoeD1lWJMU5Y2xRTTIPid5/oaPJ0lZTJYa5wmHXmkkUK23AE1Be2iTvSfb2
         o9BjtyVm8FRUdiRVreHfWI2uUyFm4PqYeNl9xLHuzgnfeW14zJYYNjK19SHPaFGm1wSz
         neZ7wTvcKSimIstHQo4cYIzbVg0HvlGX/b5RB6hg/IbmTO3oPxFmTeEtwzgHYyf6pDY+
         HB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vk66tDoERkir2w1Tea0RzRP83gftobxq7BenhcVNir8=;
        b=MREv38tOs7cjfDTkn/iWwLqTMqBmw/djP2uctu1q2NKDuwEyQgSrsaLzQRqMQDDwaE
         agU76hiDN0j1MWPHXeSMCDeFNXhBIL3G5nPEG584oKRIgLWLAiAeN0ZXOf1a1XNaVJ99
         NikvVJihOj7YYJJ1ULtBuv9+CaTolzXol6jxViN1GIvZ1p51T+qFkIbW/BVQ/qCNI0+r
         Q6TylcpnFaJIiL/MV6wIUu2hKXrjEmbJxV1nmKp7ZkdFk8Gc3C7RH6kIqxTqyGHXDaJZ
         nRmp5+N26PQ9JsR4HX48y2Knd9/gZs/MMAX2UMxzbkORQNj7m7NkB6P7ygJK7Kuzzi7L
         +1IQ==
X-Gm-Message-State: AOAM5310Dq6n1yGfPPcUR5iFB+AOPD3GrD+sURiTzdAVeXDLFTbLBk99
        59g6UmayMcPPqFiT9YqyNAHhbCOj0tK3ooOYj90=
X-Google-Smtp-Source: ABdhPJy4NjgApivfhwly2jH7mK2hfSE1sIyyqs9zrPkIadsi7wUkiV5WtSyp9XW9nWunuWTBcSV+qxyIwsKPSvwyB7g=
X-Received: by 2002:a25:3245:: with SMTP id y66mr37771512yby.332.1634661711443;
 Tue, 19 Oct 2021 09:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210911173639.5688-1-djogorchock@gmail.com> <nycvar.YFH.7.76.2110191054080.12554@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2110191142160.12554@cbobk.fhfr.pm> <CAO-hwJLACSdEFxA+KDCUFKwU_=zM-j6=UDT4GD4b5PY9jW8rjQ@mail.gmail.com>
In-Reply-To: <CAO-hwJLACSdEFxA+KDCUFKwU_=zM-j6=UDT4GD4b5PY9jW8rjQ@mail.gmail.com>
From:   Daniel Ogorchock <djogorchock@gmail.com>
Date:   Tue, 19 Oct 2021 12:41:40 -0400
Message-ID: <CAEVj2tnNMgvRaWZ-43bZbVydoTUUjFcS+7wiL_1D_UnH4HChXQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/16] HID: nintendo
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <thunderbird2k@gmail.com>,
        Billy Laws <blaws05@gmail.com>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        Siarhei Vishniakou <svv@google.com>, s.jegen@gmail.com,
        Carl Mueller <carmueller@gmail.com>,
        "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
        Bastien Nocera <hadess@hadess.net>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On Tue, Oct 19, 2021 at 6:19 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Tue, Oct 19, 2021 at 11:44 AM Jiri Kosina <jikos@kernel.org> wrote:
> >
> > On Tue, 19 Oct 2021, Jiri Kosina wrote:
> >
> > > > Rebased onto Linus' tree (sha 926de8c4326c14fcf35f1de142019043597a4fac)
> > > > Depends on Roderick's patch to add the player LED defines:
> > > > https://patchwork.kernel.org/project/linux-input/patch/20210908165539.3102929-3-roderick.colenbrander@sony.com/
> > >
> > > I just got Ack for the joydev part from Dmitry.
> > >
> > > v16 is now queued in hid.git#for-5.16/nintendo
> >
> > Benjamin noticed that I pushed wrong version of the branch -- the one that
> > still doesn't contain the LED_FUNCTION_PLAYER[1-5] defines, which I've had
> > staged here locally, waiting for Pavel's Ack (which is taking time,
> > unfortunately).
> >
> > So please ignore this branch for now, I'll push v2 once that situation is
> > cleared out.
> >
> > CCing Pavel as well here to make him aware of the issues this is causing
> > all over the place (see .e.g my mail [1] from yesterday).
> >
> > [1] https://lore.kernel.org/all/nycvar.YFH.7.76.2110181739310.12554@cbobk.fhfr.pm/
> >
>
> I am also jumping on this to raise a concern I recently had with all
> of the work we do for HID devices in the kernel regarding game
> controllers.
>
> Foreword: this is definitely not a NACK on the series, but more trying
> to open a discussion to take a step back.
>
> The SDL developers recently took a hard turn in how they are handling
> game controllers on Linux: libsdl now directly talks to hidraw or
> libusb to handle the controllers in user space, bypassing the kernel
> processing.
> Which means that a game working on a recent SDL release already has
> the PS5 player LEDs ready for instance.
>
> I think that part of this work was the integration of the steam client
> database, which already supports a lot of fix ups for game
> controllers.
>
> So I am starting to wonder if we are not adding dead code in the
> kernel, because both steam and SDL will disable the input handling of
> the controllers when they open the hidraw node (IIRC about what was
> done in this series).
>
> I know that Android/Chrome is interested in having actual input nodes
> created, but are they the sole users of those now?
> What is the benefit of having game controllers in the kernel?
>
> I am opening the discussion and we probably want to bring in the SDL
> folks here too. But I'd like to have some sort of confirmation that
> these series which are adding game controllers are not just adding
> dead code.
>
> Cheers,
> Benjamin
>

I agree that interactions with sdl are in a strange state where it
essentially bypasses kernel control over the controller. I'm not
really a fan of that technique when there's a specific kernel driver,
since it removes the ability for multiple applications to share the
input (e.g. if I wanted to bind one of the buttons on my controller as
a push-to-talk key in voip software while still using the controller
in a game). I understand why this technique was used, since it allows
for predictable cross-platform code from the sdl perspective.

The patch series follows the example of the hid-sony driver in
modifying the version field to allow userspace to detect the use of
the kernel driver, which gives userspace the option of behaving
differently if a kernel hid driver is in use for a game controller.

That said, I don't believe kernel game controller drivers are
amounting to dead code, since there are userspace applications using
evdev rather than libsdl for their controller inputs. A couple
examples specific to hid-nintendo:
https://github.com/DanielOgorchock/joycond
https://github.com/joaorb64/joycond-cemuhook

I know that several people use these kernel drivers alongside game
console emulators with evdev backends (e.g. dolphin, higan, etc.).

I'd personally like to see fewer cases of applications taking sole
control over the input devices, maybe keying off the version field
change mentioned above to determine their behavior. I understand that
is a tougher sell when the userspace driver implementation predates
the kernel driver's existence.

- Daniel Ogorchock
