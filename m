Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA5DD49B97C
	for <lists+linux-input@lfdr.de>; Tue, 25 Jan 2022 18:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344398AbiAYQ7t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Jan 2022 11:59:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1587067AbiAYQ5l (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Jan 2022 11:57:41 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1521AC06176A
        for <linux-input@vger.kernel.org>; Tue, 25 Jan 2022 08:56:30 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id 23so63444652ybf.7
        for <linux-input@vger.kernel.org>; Tue, 25 Jan 2022 08:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bwg1+MbF6nQcF67kiwVJxTyVEApFWhKPyOngVONrtE0=;
        b=PaSW+WT+MIxqR9c9m3RlTVpchvwkGHEs9f/NTzrclqSNuM5hyDGAKB9DTMXOyQiC3K
         KmVYt7u9GxgUggzxakBvEOyL3Wa7/1tJEtsFPNbcqtRSGrkFLkrcW1aEIJoNUoAwAb+f
         M2wtLbMhARPKGLDgJ9N7Nh97rE6W7DNeUtD41DGWOoNQ1k7cBTsfYZDvc2FyOjnhziAW
         G+ODgBhEQvJLIlgH9YZ6dlX3jnqHo5qjUwrQFFwUUg5n3maFahK6JF0icnyze0xdhxdd
         ZfHOyHr935yrHbljDj1bLsy/IYEgsvo4+AFWzqAbzO5Yv9ZmrZr3WWGo/7p36ZlkhYFL
         jyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bwg1+MbF6nQcF67kiwVJxTyVEApFWhKPyOngVONrtE0=;
        b=rFecxqbZFv8mN+mrWFqgUvyxGEgwWM9TjViHbzJG/OsxRGZ4zm/is0MacFZ+Qr93BK
         n/Lvtn7j6GpVpaDlr8ArYCyRL1EtIZhA+tcDampDI91Y56yYnXKopLChSRZO4PbSLjA9
         8AhMwYFsJqE/zd+2KSwG8/h9JN0x6UBWvDgkFGjeI0hX5bwKIWuBC3k2S4qmSsn8GsA3
         /vHGbGKWIXslNdjrVWQzljVzJ89CK930691MXyD5tARpFeaUpk9BL86bQ5Jbq4n099Ze
         Z+Pn4Y1s7mXSerSujBonHjn4LYS8uUKfWLrN+dZI4MDph4YpVASR9+KDpQ9MTD0nLn+c
         G77Q==
X-Gm-Message-State: AOAM533mCVQ2st4+32/4fZofUA8CEbA68HGQ2ek9hFPD/sRM2Hre3xen
        4RwjIrOZVuA3eoMdntGwKaWi6Oiaw+nZNQAjY4GzcQ==
X-Google-Smtp-Source: ABdhPJx/RItTreStK3blEjb31GTWPNHxPJmtGMUmGga8bJkg/DbZwKYtkRxzc8wu5u8/7uNCR23eG1bLkI5LjJS3nU0=
X-Received: by 2002:a5b:281:: with SMTP id x1mr29925525ybl.41.1643129789215;
 Tue, 25 Jan 2022 08:56:29 -0800 (PST)
MIME-Version: 1.0
References: <20211221191743.1893185-1-acz@semihalf.com> <20211221191743.1893185-14-acz@semihalf.com>
 <Ydi4/xYdgTv9Umqh@google.com> <CAB4aORUgGcPCLZ8iWAorCPbW53Q7c-YiDC4qau-w7G9sYjCvfg@mail.gmail.com>
 <Ydye8C1MjxpHHF5P@google.com> <CAB4aORU35k1zuMPaKsa09Qr34wgurYw1F-Mpyn2WZN77+5R+7A@mail.gmail.com>
 <CAOOzhkrzawfAxbFmQb-D39cAS3tt05qL-4dpj0X+ncxEFU3z_A@mail.gmail.com>
 <Yd5CayeX+hsZz7ZP@google.com> <YepOXFQUrMB/TNDX@quokka>
In-Reply-To: <YepOXFQUrMB/TNDX@quokka>
From:   Angela Czubak <acz@semihalf.com>
Date:   Tue, 25 Jan 2022 17:56:17 +0100
Message-ID: <CAB4aORUn6b47qxqr6Sre6U5dSwnS3bjOkPOyh7iM826mZ_mSJg@mail.gmail.com>
Subject: Re: [PATCH 13/18] Input: MT - toggle ABS_PRESSURE pointer emulation
To:     Peter Hutterer <peter.hutterer@who-t.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Sean O'Brien" <seobrien@chromium.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        upstream@semihalf.com, Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Peter, Dmitry, Benjamin, Sean,

On Fri, Jan 21, 2022 at 7:10 AM Peter Hutterer <peter.hutterer@who-t.net> wrote:
>
> On Tue, Jan 11, 2022 at 06:52:27PM -0800, Dmitry Torokhov wrote:
> > On Tue, Jan 11, 2022 at 09:19:19PM -0500, Sean O'Brien wrote:
> > > On Tue, Jan 11, 2022 at 12:07 PM Angela Czubak <acz@semihalf.com> wrote:
> > > >
> > > > On Mon, Jan 10, 2022 at 10:02 PM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:
> > > > >
> > > > > On Mon, Jan 10, 2022 at 08:43:28PM +0100, Angela Czubak wrote:
> > > > > > Hi Dmitry,
> > > > > >
> > > > > > On Fri, Jan 7, 2022 at 11:07 PM Dmitry Torokhov
> > > > > > <dmitry.torokhov@gmail.com> wrote:
> > > > > > >
> > > > > > > Hi Angela,
> > > > > > >
> > > > > > > On Tue, Dec 21, 2021 at 07:17:38PM +0000, Angela Czubak wrote:
> > > > > > > > Add a function to switch off ABS_PRESSURE generation if necessary.
> > > > > > > > This may be helpful in case drivers want to generate ABS_PRESSURE events
> > > > > > > > themselves from ABS_MT_PRESSURE.
> > > > > > >
> > > > > > > This needs better explanation for why it is needed. I assume this is to
> > > > > > > use ABS_PRESSURE to report "true force" for devices. If this is correct
> > > > > > > then I believe we should define a new flag for input_mt_init_slots()
> > > > > > > and check it here and also use it to calculate the force across contacts
> > > > > > > in input_mt_sync_frame().
> > > > > > >
> > > > > > > Or did I misunderstand the point?
> > > > > > >
> > > > > > I would say you understood it correctly, though to my mind it is not a
> > > > > > static behaviour,
> > > > >
> > > > > It should be, otherwise how will userspace know the meaning of the
> > > > > event?
> > > > >
> > > > Fair point.
> > > >
> > > > > > i.e. we may want to switch this kind of calculation on and off.
> > > > > > Are flags intended to be modified at runtime?
> > > > >
> > > > > No.
> > > > >
> > > > > > For instance, if user decides to remove the release or press effect (previously
> > > > > > uploaded by them) and there is no default one per device, then we should switch
> > > > > > the haptic handling from kernel mode back to device mode.
> > > > >
> > > > > Why? I think if user removes effects then they do not want to have
> > > > > haptics effects. I am wondering if this whole thing made too complex.
> > > > >
> > > > > In my mind we have following cases:
> > > > >
> > > > > - OS does not know about these haptics devices (touchpads). They work in
> > > > >   device (?) mode and provide haptic feedback on their own.
> > > > >
> > > > > - OS does know about haptics devices (that includes having both kernel
> > > > >   *and* userspace support for them. If one is missing then the other
> > > > >   should not be enabled, it is up to the distro to make sure all pieces
> > > > >   are there). In this case OS controls haptics effects all the time,
> > > > >   except:
> > > > >
> > > > > - OS supports haptics, but switched it to device mode to allow haptics
> > > > >   effect playback when waking up.
> > > > >
> > > > Perhaps switching between modes should be a separate discussion.
> > > > Right now it seems to me that your suggestion could be that if
> > > > INPUT_PROP_HAPTIC_TOUCHPAD is set it should be followed by setting
> > > > something like INPUT_MT_PRESSURE_SUM in mt_flags, which should mean
> > > > every ABS_PRESSURE event should actually be a sum of pressures/true forces
> > > > across all slots. Does it sound right?
> > > > If so, I suppose I will implement it. It should be completely independent from
> > > > device/kernel mode and, what is more, if hid_haptic_init() fails for any reason
> > > > the pressure sum still gets calculated.
> >
> > I'd say that if hid_haptic_init() fails we should not say that the
> > device is INPUT_PROP_HAPTIC_TOUCHPAD (if we even decide to continue with
> > the device instantiation, which we probably should not).
> >
> > > >
> > > > Sean, is it OK for the device to keep kernel mode in the event no
> > > > default press/release
> > > > waveform is defined in the waveform list and the user removes relevant effects
> > > > (after having uploaded them)? I think it was desired to remain in the
> > > > device mode
> > > > if no such waveforms/effects are defined and, thus, I assumed that removing
> > > > following effects (in case no press/release waveforms in the waveform
> > > > list) should
> > > > trigger coming back to device mode.
> > > > Right now it seems that switching back to device mode should be
> > > > allowed only when
> > > > suspending the device.
> > >
> > > I agree that we should switch to device-controlled mode if press/release are
> > > not defined by the device, and userspace has not supplied alternative
> > > waveforms for either. If we kept it in kernel-controlled mode, there would be
> > > no effect for click/release. This can be achieved by userspace by emitting
> > > EVIOCFFTAKECONTROL for click and release, and never sending haptic commands.
> >
> > What is wrong for not having effect for press/release if userspace did
> > not bother to set it up? I think this is reasonably to expect that if
> > user enabled support for haptic touchpad in kernel they should also have
> > userspace that knows how to handle it. If we go with this requirement I
> > think we will reduce a lot of complexity.
> >
> > Benjamin, Jiri, Peter, I'd like you to chime in please.
> >
> > >
> > > This also allows for the case where userspace may want to send haptics for UX
> > > effects, while still relying on the device for traditional press and release
> > > haptics (in the case where the device doesn't define press/release
> > > waveforms).
> >
> > Again, what is the difference between press/release and other UX
> > effects? They seem to be the same to me...
>
> Agree with Dmitry here - have a sensible default in the kernel and if
> userspace changes it, it's now userspace's problem to do it right. Anything
> more complex is just making things more complicated for niche cases that may
> never happen.
>

Could you please relate to the following statements/questions? I would like to
make sure I am nearer to your understanding of how the things should be.
I wouldn't say they constitute my plan, I am just wondering if shared effects
are acceptable at all since their handling seems questionable.

1. Kernel mode - is it OK to have any default at all? Or would you rather say
   it's userspace's responsibility to issue force feedback entirely? I am just
   wondering how much simplification you would actually prefer to have.
   In the current patchset the kernel can issue haptic feedback itself
   (based on the pressure/force sums calculated).
2. The patches introduce shared effects. This allows userspace to modify
   kernel mode behaviour, i.e. the waveforms it issues when press/release
   has been detected, which means both uploading and erasing those
   effects is possible.
   On the other hand, closing event fd triggers removing effects uploaded for
   that fd. I would assume removing shared effects is allowed as well
   since we can update them with upload. Should it be disallowed/prohibited?
   I mean that perhaps erasing shared effects should never really take place
   as we may end up removing something that has not been altered by
   userspace.
   I am worried since simply opening and closing the event file could possibly
   cause a change in behaviour if we actually let effects be completely
   removed.
3. Switching to kernel mode should happen at the instantiation and then only
   during suspend/resume cycle. If the shared press/release effect gets
   removed (even caused by input device flush), then we don't want any haptic
   feedback in kernel mode anyway.
4. Should I just not care and not sum the pressures across all slots? It just
   seemed to me there was a reason to choose one slot and pass it as
   ABS_PRESSURE in input-mt.c, and I just suspected it would be more
   logical to pass the sum of forces if the unit suggests it is force.

> Cheers,
>   Peter
