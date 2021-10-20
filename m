Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9AF434A1B
	for <lists+linux-input@lfdr.de>; Wed, 20 Oct 2021 13:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbhJTLhB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Oct 2021 07:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhJTLhA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Oct 2021 07:37:00 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE966C06161C;
        Wed, 20 Oct 2021 04:34:46 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id g2so21722603ild.1;
        Wed, 20 Oct 2021 04:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LuwWBMYKa61/K2pBQF3ZeqbW3cbgjvIDhPX7Zs2NO2c=;
        b=nUARIVGe6p1+FdZv4ytMAH3Go0JLCJ0W3ZPdTgIjKrFudshahHAOGImvNdltztoQ5G
         W+owmJwrxwcg8r8toSqYMPaekcpMOqNSd95DeBGgL6mhxgIXVHIv413lZ4+3WAYXuGv+
         L6UclTiULPVTDz3gmexfBgLNVb1gdiVA0PPOm1Nh2NYYAzoI4WIJ84z8s2SzltsCsQkp
         AcNOKcYc6V87DH8oIhgSSycH7bAcIR1ieU00eS8TYAtDAFXFzHIGOUuvJZo5C7hZAc2U
         Y9vyeTKS02WZCf0Xj2wHdlwdWI9+j/2MuqfuL/80RNjYAx/SjGI/Hc3SNyensp7Lj+tN
         zfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LuwWBMYKa61/K2pBQF3ZeqbW3cbgjvIDhPX7Zs2NO2c=;
        b=xqgd+R3oxyexDq8rW6pTmI91lphPcczkOZ6QCKQCxYTsR/7Om9Jkn953vjLtD1Yb/g
         c5oJ7iZD3rSVt75AbC9FFYM8UnfOxMNpjBs1c58cp+ljsL0i1uPUur7wDQd7+V44ij0H
         A8kEtD1lCxy4+qZM2vtY462TBULwbUeP+Jn6+IeUREDn52quG5VwxAmj729gRE73z9lU
         XCGh23Qq72gBo8BmBXFf9tOXrl4ycn6L3lGLgxaky+pbis5hO/l5DeeCpy7lroGi5T1Q
         /OAy9TNbdoA6Sh75RsYS64epsJQLKKdNwic2HxQHm45ORVNhDPAdNqD9cnzPv4DpFgme
         +FHQ==
X-Gm-Message-State: AOAM5321J6fjrc/OmOG7oeDrFJaleQLiZG1VKE5A/O/jsZLwMKNb76yZ
        VQnfLDlE15P2bcmTBtQiryRN3TpmYopXidSWDP8=
X-Google-Smtp-Source: ABdhPJwJjabPU/vHmU6xQ96qJHFoDNL4noVNC4yg5CnzH6iVcUAZhHxAztK09ifOOXj7LR4wRxkwiCyei6ZU0f3J/KM=
X-Received: by 2002:a05:6e02:1885:: with SMTP id o5mr22178905ilu.221.1634729685907;
 Wed, 20 Oct 2021 04:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211009114313.17967-1-alistair@alistair23.me>
 <CAF8JNh+OUzvAHA9tBrH2d_WxWPXRgiunhGO5KV4-fqVG+tUOyQ@mail.gmail.com>
 <YW4kgnI0DQHj4sw4@google.com> <CAKmqyKMrb=Uz0+-ycj0HkAKJYdRU11Dc+24+KJw_j3MHT=2+yw@mail.gmail.com>
 <YW9rRUsxPHTjeOGT@google.com> <CAKmqyKMpMCb4gLyp94rCgVBU3eccjafD8nF7y6o+oU6D-OHvTQ@mail.gmail.com>
 <YW97lwsMrLHetJGy@google.com> <CAO-hwJKSxVFAiAriWU0No7sFxzo9XB1-T9LFeF5Zn27B8erFPA@mail.gmail.com>
In-Reply-To: <CAO-hwJKSxVFAiAriWU0No7sFxzo9XB1-T9LFeF5Zn27B8erFPA@mail.gmail.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Wed, 20 Oct 2021 21:34:20 +1000
Message-ID: <CAKmqyKN0fhJOGZwg6LKag=8fVsANBUNg39Gfr5qdJyUJu1AVrw@mail.gmail.com>
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

On Wed, Oct 20, 2021 at 5:40 PM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Wed, Oct 20, 2021 at 4:14 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Wed, Oct 20, 2021 at 11:44:50AM +1000, Alistair Francis wrote:
> > > On Wed, Oct 20, 2021 at 11:05 AM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > > >
> > > > On Wed, Oct 20, 2021 at 09:33:13AM +1000, Alistair Francis wrote:
> > > > > On Tue, Oct 19, 2021 at 11:51 AM Dmitry Torokhov
> > > > > <dmitry.torokhov@gmail.com> wrote:
> > > > > >
> > > > > > We already have touchscreen-inverted-x/y defined in
> > > > > > Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml,
> > > > > > why are they not sufficient?
> > > > >
> > > > > The touchscreen-* properties aren't applied to HID devices though, at
> > > > > least not that I can tell.
> > > >
> > > > No, they are not currently, but that does not mean we need to establish
> > > > a new set of properties (property names) for HID case.
> > >
> > > I can update the names to use the existing touchscreen ones.
> > >
> > > Do you have a hint of where this should be implemented though?
> > >
> > > Right now (without "HID: wacom: Add support for the AG14 Wacom
> > > device") the wacom touchscreen is just registered as a generic HID
> > > device. I don't see any good place in hid-core, hid-input or
> > > hid-generic to invert the input values for this.
> >
> > I think the transformation should happen in
> > hid-multitouch.c::mt_process_slot() using helpers from
> > include/linux/input/touchscreen.h
> >
> > I think the more challenging question is to how pass/attach struct
> > touchscreen_properties * to the hid device (i expect the properties will
> > be attached to i2c-hid device, but maybe we could create a sub-node of
> > it and attach properties there.
> >
>
> Sorry but I don't like that very much. This would mean that we have an
> out of band information that needs to be carried over to
> HID-generic/multitouch and having tests for it is going to be harder.
> I would rather have userspace deal with the rotation if we do not have
> the information from the device itself.

My 2c below

>
> Foreword: I have been given a hammer, so I see nails everywhere.
>
> The past 3 weeks I have been working on implementing some eBPF hooks
> in the HID subsystem. This would IMO be the best solution here: a udev
> hwdb rule sees that there is the not-wacom PID/VID (and maybe the
> platform or parses the OF properties if they are available in the

I'm not sure we have a specific VID/PID to work with here. The VID is
generic AFAIK, not sure about the PID though. Maybe someone from Wacom
could confirm either way.

> sysfs) and adds a couple of functions in the HID stack to rotate the
> screen. The advantage is that we do not need to add a new kernel API

I would say that touchscreen-inverted-x/y isn't a new API, it's
commonly used. To me it makes sense that it's supported for all
touchscreens.

> anymore, the disadvantage is that we need userspace to "fix" the
> kernel behaviour (so at boot, this might be an issue).

That's a pain for me. I'm still stuck with the vendors userspace as I
need their propiritory eInk driver code. It also seems like a hassle
for different distros to handle this (compared to just in the DT).

Alistair

>
> I am not at the point where I can share the code as there is a lot of
> rewriting and my last attempt is resulting in a page fault, but I'd be
> happy to share it more once that hiccup is solved.
>
> Cheers,
> Benjamin
>
