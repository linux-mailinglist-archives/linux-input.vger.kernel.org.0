Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A34D48C0D8
	for <lists+linux-input@lfdr.de>; Wed, 12 Jan 2022 10:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351992AbiALJRw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jan 2022 04:17:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32177 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1351991AbiALJRw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jan 2022 04:17:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641979071;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0gs2zaLTW9dXxuzKMhz/4418adUyLD9WvDTe4/ObO4A=;
        b=C4Kim7LnWz1zWowDU7camkVlsHzywjXMxkd+KGzrfL6lnq9zBd5udkC/D6nW1wTBbLbkib
        uE0bHgDB1jFHyCS1JS9nTm6TJY7l3zLNtV1/OQ8Ib0VY6556t7mfpgecUGplxKvCkCxO52
        mscNcHLHL7c7af8CriWyS9qHvDN90r8=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-tT7yHcdxMym8zNtHDVZ3hw-1; Wed, 12 Jan 2022 04:17:50 -0500
X-MC-Unique: tT7yHcdxMym8zNtHDVZ3hw-1
Received: by mail-pl1-f198.google.com with SMTP id e10-20020a17090301ca00b001491f26bcd4so2124172plh.23
        for <linux-input@vger.kernel.org>; Wed, 12 Jan 2022 01:17:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0gs2zaLTW9dXxuzKMhz/4418adUyLD9WvDTe4/ObO4A=;
        b=P6lDYbIFgmqAja7E6oI0U0C4YxLi6Z+f6GCPdeswpkwfWzPovoCPsvRevr2xeZz0E7
         sv6s51JmYSIRPZ6s3XSA9tfhjCGynGBcBKUHND/UOkuglIqavY/oV9tV7UxU81LvzKAI
         xrxvMmP2VMNg8Mr92lYPITxFDqNe/gBpBI9K9SdDr0WeK9OiYQF8xfgf+7MPc/Xt/BvX
         4Ink0gPr/+VR79gGNNK+I5IrVJh7mdYGUyoepb9BpyY45CNT8DYdm9DRsEqghDhsabZ2
         NE1lokki1HYv516OYRnwIwYUVPti6LajESUuSsqYr9x3L8OY/ahAhb4U2Nu9Bf3zXO9X
         /0YQ==
X-Gm-Message-State: AOAM5326zyytQ7sefHJPBOGzNk3IKPayqwx3oCRzxoPIt93/tNDBq2fb
        nBO6leV+v4+QdTBIvOmWh5FN1mWdTw8WeRbSkHEvez48GD6Z8quoz/6lS+16Dw4y2bYEOtog9n0
        uIqeX/oN2XSzoX3FhfYeNFGntlqfd4K3Sd+2aEYI=
X-Received: by 2002:a63:78c5:: with SMTP id t188mr7820338pgc.363.1641979068982;
        Wed, 12 Jan 2022 01:17:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweIQqah2wAb70kixsYS+BEAEc3zemSRKKOwDsJA8yNMyWAjnX7MeEIVRJq6SnYjsBC1U7mSlhsb+wp7oJae7k=
X-Received: by 2002:a63:78c5:: with SMTP id t188mr7820312pgc.363.1641979068634;
 Wed, 12 Jan 2022 01:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20211221191743.1893185-1-acz@semihalf.com> <20211221191743.1893185-14-acz@semihalf.com>
 <Ydi4/xYdgTv9Umqh@google.com> <CAB4aORUgGcPCLZ8iWAorCPbW53Q7c-YiDC4qau-w7G9sYjCvfg@mail.gmail.com>
 <Ydye8C1MjxpHHF5P@google.com> <CAB4aORU35k1zuMPaKsa09Qr34wgurYw1F-Mpyn2WZN77+5R+7A@mail.gmail.com>
 <CAOOzhkrzawfAxbFmQb-D39cAS3tt05qL-4dpj0X+ncxEFU3z_A@mail.gmail.com> <Yd5CayeX+hsZz7ZP@google.com>
In-Reply-To: <Yd5CayeX+hsZz7ZP@google.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 12 Jan 2022 10:17:37 +0100
Message-ID: <CAO-hwJ+761zH0FqYULUtfXGvGfvutXWD+APLibBgBho6h-8LNA@mail.gmail.com>
Subject: Re: [PATCH 13/18] Input: MT - toggle ABS_PRESSURE pointer emulation
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "Sean O'Brien" <seobrien@chromium.org>,
        Angela Czubak <acz@semihalf.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        upstream@semihalf.com, Jiri Kosina <jikos@kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 12, 2022 at 3:52 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Tue, Jan 11, 2022 at 09:19:19PM -0500, Sean O'Brien wrote:
> > On Tue, Jan 11, 2022 at 12:07 PM Angela Czubak <acz@semihalf.com> wrote:
> > >
> > > On Mon, Jan 10, 2022 at 10:02 PM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > > >
> > > > On Mon, Jan 10, 2022 at 08:43:28PM +0100, Angela Czubak wrote:
> > > > > Hi Dmitry,
> > > > >
> > > > > On Fri, Jan 7, 2022 at 11:07 PM Dmitry Torokhov
> > > > > <dmitry.torokhov@gmail.com> wrote:
> > > > > >
> > > > > > Hi Angela,
> > > > > >
> > > > > > On Tue, Dec 21, 2021 at 07:17:38PM +0000, Angela Czubak wrote:
> > > > > > > Add a function to switch off ABS_PRESSURE generation if necessary.
> > > > > > > This may be helpful in case drivers want to generate ABS_PRESSURE events
> > > > > > > themselves from ABS_MT_PRESSURE.
> > > > > >
> > > > > > This needs better explanation for why it is needed. I assume this is to
> > > > > > use ABS_PRESSURE to report "true force" for devices. If this is correct
> > > > > > then I believe we should define a new flag for input_mt_init_slots()
> > > > > > and check it here and also use it to calculate the force across contacts
> > > > > > in input_mt_sync_frame().
> > > > > >
> > > > > > Or did I misunderstand the point?
> > > > > >
> > > > > I would say you understood it correctly, though to my mind it is not a
> > > > > static behaviour,
> > > >
> > > > It should be, otherwise how will userspace know the meaning of the
> > > > event?
> > > >
> > > Fair point.
> > >
> > > > > i.e. we may want to switch this kind of calculation on and off.
> > > > > Are flags intended to be modified at runtime?
> > > >
> > > > No.
> > > >
> > > > > For instance, if user decides to remove the release or press effect (previously
> > > > > uploaded by them) and there is no default one per device, then we should switch
> > > > > the haptic handling from kernel mode back to device mode.
> > > >
> > > > Why? I think if user removes effects then they do not want to have
> > > > haptics effects. I am wondering if this whole thing made too complex.
> > > >
> > > > In my mind we have following cases:
> > > >
> > > > - OS does not know about these haptics devices (touchpads). They work in
> > > >   device (?) mode and provide haptic feedback on their own.
> > > >
> > > > - OS does know about haptics devices (that includes having both kernel
> > > >   *and* userspace support for them. If one is missing then the other
> > > >   should not be enabled, it is up to the distro to make sure all pieces
> > > >   are there). In this case OS controls haptics effects all the time,
> > > >   except:
> > > >
> > > > - OS supports haptics, but switched it to device mode to allow haptics
> > > >   effect playback when waking up.
> > > >
> > > Perhaps switching between modes should be a separate discussion.
> > > Right now it seems to me that your suggestion could be that if
> > > INPUT_PROP_HAPTIC_TOUCHPAD is set it should be followed by setting
> > > something like INPUT_MT_PRESSURE_SUM in mt_flags, which should mean
> > > every ABS_PRESSURE event should actually be a sum of pressures/true forces
> > > across all slots. Does it sound right?
> > > If so, I suppose I will implement it. It should be completely independent from
> > > device/kernel mode and, what is more, if hid_haptic_init() fails for any reason
> > > the pressure sum still gets calculated.
>
> I'd say that if hid_haptic_init() fails we should not say that the
> device is INPUT_PROP_HAPTIC_TOUCHPAD (if we even decide to continue with
> the device instantiation, which we probably should not).

Agree. Userspace should know that the device is a pressure pad based
on the unit provided in ABS_MT_PRESSURE IIRC.
So setting the resolution is enough for userspace to emulate the
button clicks based on the pressure. libinput already has code for
that.

So basically, INPUT_PROP_HAPTIC_TOUCHPAD is only an indication that
the haptic is configurable. And if haptic_init() fails, it should not
expose that property.

And BTW, why "TOUCHPAD" in INPUT_PROP_HAPTIC_TOUCHPAD? The Surface
Dial could benefit from that implementation and it is not a
touchpad...

>
> > >
> > > Sean, is it OK for the device to keep kernel mode in the event no
> > > default press/release
> > > waveform is defined in the waveform list and the user removes relevant effects
> > > (after having uploaded them)? I think it was desired to remain in the
> > > device mode
> > > if no such waveforms/effects are defined and, thus, I assumed that removing
> > > following effects (in case no press/release waveforms in the waveform
> > > list) should
> > > trigger coming back to device mode.
> > > Right now it seems that switching back to device mode should be
> > > allowed only when
> > > suspending the device.
> >
> > I agree that we should switch to device-controlled mode if press/release are
> > not defined by the device, and userspace has not supplied alternative
> > waveforms for either. If we kept it in kernel-controlled mode, there would be
> > no effect for click/release. This can be achieved by userspace by emitting
> > EVIOCFFTAKECONTROL for click and release, and never sending haptic commands.
>
> What is wrong for not having effect for press/release if userspace did
> not bother to set it up? I think this is reasonably to expect that if
> user enabled support for haptic touchpad in kernel they should also have
> userspace that knows how to handle it. If we go with this requirement I
> think we will reduce a lot of complexity.
>
> Benjamin, Jiri, Peter, I'd like you to chime in please.

[FWIW, lei saved me on this one for not being Cc-ed since the
beginning of this thread]

I think we should keep it simple:
- the device configuration should be static (i.e.
ABS_PRESSURE/ABS_MT_PRESSURE, pointer emulation, button emulation,
...) always present
- userspace should pick up what it needs based on its own state:
  if there is a need to compute a total pressure, userspace is capable
of computing itself, and generates its own button press/release
- the haptic is a global state of the device, so any decision you make
is going to have corner cases with more than one userspace (or if the
userspace daemon/lib is restarted)

So to me, we should keep the kernel device emulation, export what
needs to be for userspace to make its own decision and have the haptic
side as a "nice to have" feature but distinct from the event
processing.

I didn't want to chime into this thread because I am currently working
on 2 big series that might also be helpful here:
- the first one, which is almost ready, consists in rethinking how the
HID events are processed, meaning we can ensure that some events are
always processed before others. The net benefit is that I can now
express the Win8 multitouch protocol in hid-generic without too much
pain, meaning that hid-haptic.c could be a leaf driver instead of
being an API.
The net benefit of not having hid-haptic.c as an API is that we can
always rmmod it to disable the entire haptic system if there is
something wrong.

- the second one is the eBPF bindings for HID (see
https://lore.kernel.org/all/20211215134220.1735144-1-tero.kristo@linux.intel.com/
and the other versions for some more discussions)
Basically BPF allows to avoid specific kernel APIs and userspace is in
charge of loading the bridge between its API and the device. It
definitely has the potential to solve many limitations we are seeing
now in all the various input/ff protocols IMO.

>
> >
> > This also allows for the case where userspace may want to send haptics for UX
> > effects, while still relying on the device for traditional press and release
> > haptics (in the case where the device doesn't define press/release
> > waveforms).
>
> Again, what is the difference between press/release and other UX
> effects? They seem to be the same to me...
>
> > >
> > > Now, the question would be where BTN_LEFT events should be generated.
> > > Normally it happens in hid-multitouch and I override it in hid-haptic.c
> > > This means I calculate the pressure sum as well in hid-haptic/hid-multitouch.
> > > Does anyone mind such behaviour?

Again, why is there a need to have some complex behavior there? Just
let userspace do its own fancy computation and keep it simple in the
kernel.
Well, with eBPF, you could let userspace put the BTN_LEFT emulation in
the kernel by loading a specific program, but that would be in charge
of the userspace to make this choice, not the kernel.

Cheers,
Benjamin

> > >
> > > > > Currently it
> > > > > also means
> > > > > that the driver stops generating ABS_PRESSURE events on its own and so
> > > > > input-mt layer may/should be used again (i.e. mt report pointer emulation).
> > > > > Anyhow, if it would be actually better to calculate the true force in
> > > > > input_mt_sync_frame()/input_mt_report_pointer_emulation()
> > > >
> > > (I suppose I wanted to say I would implement it in such case)
>
> Thanks.
>
> --
> Dmitry
>

