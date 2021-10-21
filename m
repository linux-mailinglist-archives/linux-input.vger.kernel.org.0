Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A31EE435DF0
	for <lists+linux-input@lfdr.de>; Thu, 21 Oct 2021 11:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbhJUJaJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Oct 2021 05:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231342AbhJUJaH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Oct 2021 05:30:07 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C1E8C06161C;
        Thu, 21 Oct 2021 02:27:52 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id d125so28159509iof.5;
        Thu, 21 Oct 2021 02:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6GpVmv67zcd/KI50WQ1qQJ95/dLiNlM3ZWZOII9XIa0=;
        b=nzoZGl6siilugrLLcm8C58eOQDyw8c0m6120nRh/G27l43bL9bliTsLMCtm13nO7DN
         F3Ul/Cno9DIBOnasbCctL9dYDwATMcF2E/+sLAhwaAtYFA9Y4q1nJIDH1xOJXP0U++22
         5G9O4wjchS0yVEHmEOrFJ+LCy0FYJgQhzV60lRkceQN7ShEhsBN+qF32mrhrAyf171He
         ZllUmty4ARWzLBK5Pm70BBA2k40uE1gMEizteXpp/b+l5XAhMbk1G+rfG+D+8NeI3nqz
         dvUEmp1WAHLKDafUIBjKOl+mIyBYnoRyWVkUdcXwOhrCest3Hw4ZlmdxZgU7ZV4v/RNF
         W9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6GpVmv67zcd/KI50WQ1qQJ95/dLiNlM3ZWZOII9XIa0=;
        b=a/zbTVcjkHXVYedfyGaz394uFFEpgQQtowHbNqtnY+VRhxOygeAhrqMW0NwAskGba1
         +fua1XEBEUshtha24vtY5HjdWYClHGqo/YQ8kcUkuXfyhh56Bqsd9jnyBukaTCZfKPVM
         xHC6HBPvigNRkbG5btM0Vf5xX7Y7BN90bz0a3htjr1lWRWwilcAv3dKIC30E9nd1ykhE
         I49gJHEj8KbU8AOqkOCx2HW2sXDyzvS9edGtlFwigSNYM8K1t7rtfxtWOaUHNIQU38iB
         kfxF2ieLdRqgmXxhIjXExm0+T2NW+9b8rvNSUrerr5GSIdTavHiUzCHUIGt9ZYbHuN/b
         nnYQ==
X-Gm-Message-State: AOAM533qh+j1sbvF6xrk9NIOYxRep2Lply0ShQTk5OmrRUjED2w1ff02
        urSo3bkWTuJIx9MGH28+FY9/Qro2MmeXAKh8vgv5YWZ7xzLT0OIH
X-Google-Smtp-Source: ABdhPJxN2tv7+pO/Fc3xNrPfOq8kz/NX86VjS18bPGc/nuD7U4AMmXBs3gmZ6PXuBQN2iYSd8Cx+Sf51Top+TGpApww=
X-Received: by 2002:a05:6602:2599:: with SMTP id p25mr3215194ioo.90.1634808471435;
 Thu, 21 Oct 2021 02:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211009114313.17967-1-alistair@alistair23.me>
 <CAF8JNh+OUzvAHA9tBrH2d_WxWPXRgiunhGO5KV4-fqVG+tUOyQ@mail.gmail.com>
 <YW4kgnI0DQHj4sw4@google.com> <CAKmqyKMrb=Uz0+-ycj0HkAKJYdRU11Dc+24+KJw_j3MHT=2+yw@mail.gmail.com>
 <YW9rRUsxPHTjeOGT@google.com> <CAKmqyKMpMCb4gLyp94rCgVBU3eccjafD8nF7y6o+oU6D-OHvTQ@mail.gmail.com>
 <YW97lwsMrLHetJGy@google.com> <CAO-hwJKSxVFAiAriWU0No7sFxzo9XB1-T9LFeF5Zn27B8erFPA@mail.gmail.com>
 <CAKmqyKN0fhJOGZwg6LKag=8fVsANBUNg39Gfr5qdJyUJu1AVrw@mail.gmail.com> <CAO-hwJJ4kF880TVKNFy6wb5d-Q4+eCSuFfgP+=6+eTuN9eoNKA@mail.gmail.com>
In-Reply-To: <CAO-hwJJ4kF880TVKNFy6wb5d-Q4+eCSuFfgP+=6+eTuN9eoNKA@mail.gmail.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Thu, 21 Oct 2021 19:27:25 +1000
Message-ID: <CAKmqyKNrSyLjwM4HAtupbp=S7wnUrCM+o7DrS1p7wxkqcwKctA@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] HID: wacom_sys: Add support for flipping the data values
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ping Cheng <pinglinux@gmail.com>,
        Alistair Francis <alistair@alistair23.me>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>, Jiri Kosina <jikos@kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 20, 2021 at 10:04 PM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Wed, Oct 20, 2021 at 1:34 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Wed, Oct 20, 2021 at 5:40 PM Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> > >
> > > On Wed, Oct 20, 2021 at 4:14 AM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > > >
> > > > On Wed, Oct 20, 2021 at 11:44:50AM +1000, Alistair Francis wrote:
> > > > > On Wed, Oct 20, 2021 at 11:05 AM Dmitry Torokhov
> > > > > <dmitry.torokhov@gmail.com> wrote:
> > > > > >
> > > > > > On Wed, Oct 20, 2021 at 09:33:13AM +1000, Alistair Francis wrote:
> > > > > > > On Tue, Oct 19, 2021 at 11:51 AM Dmitry Torokhov
> > > > > > > <dmitry.torokhov@gmail.com> wrote:
> > > > > > > >
> > > > > > > > We already have touchscreen-inverted-x/y defined in
> > > > > > > > Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml,
> > > > > > > > why are they not sufficient?
> > > > > > >
> > > > > > > The touchscreen-* properties aren't applied to HID devices though, at
> > > > > > > least not that I can tell.
> > > > > >
> > > > > > No, they are not currently, but that does not mean we need to establish
> > > > > > a new set of properties (property names) for HID case.
> > > > >
> > > > > I can update the names to use the existing touchscreen ones.
> > > > >
> > > > > Do you have a hint of where this should be implemented though?
> > > > >
> > > > > Right now (without "HID: wacom: Add support for the AG14 Wacom
> > > > > device") the wacom touchscreen is just registered as a generic HID
> > > > > device. I don't see any good place in hid-core, hid-input or
> > > > > hid-generic to invert the input values for this.
> > > >
> > > > I think the transformation should happen in
> > > > hid-multitouch.c::mt_process_slot() using helpers from
> > > > include/linux/input/touchscreen.h
> > > >
> > > > I think the more challenging question is to how pass/attach struct
> > > > touchscreen_properties * to the hid device (i expect the properties will
> > > > be attached to i2c-hid device, but maybe we could create a sub-node of
> > > > it and attach properties there.
> > > >
> > >
> > > Sorry but I don't like that very much. This would mean that we have an
> > > out of band information that needs to be carried over to
> > > HID-generic/multitouch and having tests for it is going to be harder.
> > > I would rather have userspace deal with the rotation if we do not have
> > > the information from the device itself.
> >
> > My 2c below
> >
> > >
> > > Foreword: I have been given a hammer, so I see nails everywhere.
> > >
> > > The past 3 weeks I have been working on implementing some eBPF hooks
> > > in the HID subsystem. This would IMO be the best solution here: a udev
> > > hwdb rule sees that there is the not-wacom PID/VID (and maybe the
> > > platform or parses the OF properties if they are available in the
> >
> > I'm not sure we have a specific VID/PID to work with here. The VID is
> > generic AFAIK, not sure about the PID though. Maybe someone from Wacom
> > could confirm either way.
>
> It actually doesn't really matter. What matters is that there is a way
> to know that this device needs to be rotated, being through DT
> properties that would be exported through sysfs, or a hwdb entry that
> matches on the product, the platform or something else.
>
> >
> > > sysfs) and adds a couple of functions in the HID stack to rotate the
> > > screen. The advantage is that we do not need to add a new kernel API
> >
> > I would say that touchscreen-inverted-x/y isn't a new API, it's
> > commonly used. To me it makes sense that it's supported for all
> > touchscreens.
>
> Well, it's new in the HID world, and this is opening the pandora box:
> the patch adds only the equivalent of touchscreen-inverted-x/y, but
> not touchscreen-swapped-x-y. So you can not actually rotate a screen
> by 90 degrees.
>
> Inverting a value on an axis is easy. Swapping 2 axes is way harder in
> the HID world, because you have to interpret the report descriptor
> differently.
>
> Also, the patch adds 3 new properties: flip-tilt-x/y and flip-distance.

This patch does yes, but I'm happy to just drop this to the invert
touchscreen properties.

> The tilt and distance would be easy, but suddenly we need to also add
> pressure, and all of the other HID definitions. This is going to be
> endless. It took me a while to understand Rob's point regarding
> generic properties, but we are exactly entering this territory: this
> is an endless chase and will never end.
>
> I would much rather have a device specific quirk that would be
> triggered by the DT than adding generic properties like that.

That works for me!

A HID_QUIRK_XY_INVERT would work for me and seems useful for others in
the future as well.

I managed to figure out how to do this, I'll send a patch soon.

>
> Also, hid-multitouch is the most tested driver through the hid-tools
> test suite: https://gitlab.freedesktop.org/libevdev/hid-tools
> I am not sure how I can add tests for those properties in a generic
> way (the creation of the "virtual DT" is going to be problematic).
>
> On the contrary, a device specific quirk can easily be tested without
> having to mess too much with the hid subsystem.

Great!

Alistair

>
> >
> > > anymore, the disadvantage is that we need userspace to "fix" the
> > > kernel behaviour (so at boot, this might be an issue).
> >
> > That's a pain for me. I'm still stuck with the vendors userspace as I
> > need their propiritory eInk driver code. It also seems like a hassle
> > for different distros to handle this (compared to just in the DT).
>
> I understand the pain. But I am not talking about a 1 kernel cycle
> release timeframe. More like 6-12 months to bring in all the pieces
> together. Distributions have no issues with udev most of the time
> (even those that stuck to the old pre-systemd fork), and it would not
> be different than having a udev intrinsic that tags the pen with
> ID_INPUT_TABLET so libinput and others can deal with it.
>
> Cheers,
> Benjamin
>
> >
> > Alistair
> >
> > >
> > > I am not at the point where I can share the code as there is a lot of
> > > rewriting and my last attempt is resulting in a page fault, but I'd be
> > > happy to share it more once that hiccup is solved.
> > >
> > > Cheers,
> > > Benjamin
> > >
> >
>
