Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84D8848EFD9
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 19:26:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236376AbiANS0x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 13:26:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236007AbiANS0x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 13:26:53 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05EA4C061574
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:26:53 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id i68so11482059ybg.7
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cZUbE49yVfk0RshT1DKyW399U7R+KEBfR8c1Mrvfdgw=;
        b=fuKO01lxOyXp6Y6u1F4F0DKeZCvEHzN3xOzCGZf0C+cgWF8Y8oy+goPFqBslQde9HC
         nsv66ZHB1vV1hm5bPLp/UsgwSAfn/v4mqaopp0CGmpbk2FZcBUXC3Af+rBvvoql8rmcz
         wLPGcdqF1SV9l1ULNbFA96CwVrn7SbmAr4cMgPxojhpniOi9+ogpQsIpt1RH0mApMGGD
         qLiCz3/5To+hnSu2RVJ2b0O0HRebBFfvSqxts4WVgJBq8KZ4TfDhq+bE26rkKqOF1o+M
         DXyEDVTDHxAS2jGtrCViPbTk3Zj0lqXxt0eYGFzgK1as5PsTqrAUD765EUG5jtm8nnIW
         16vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cZUbE49yVfk0RshT1DKyW399U7R+KEBfR8c1Mrvfdgw=;
        b=HMB2NWudZ8ZXtJucrXpDB8HE2Gb/ThLNGqziDXf4ytov/ofHawmzoTxinZ+TdlVMdX
         CnIQKidl4Wp0vzggXJ+lV/SWx/QfQQTRgUFlJrhhVUVqWpV9XrDbhMFbrwXtsT0cVWwe
         QP3wa3Zjja+ZNd1+6n9oyLDwsAhJgFA1X+NCWrrM4PrN/Dqie239dRgH9cLiBteDKpev
         3ZG3wg2Lw5tsF6xz+ImdX0XILiaBV0bnfA+dAaaeqIBuoCw34FKbfSLfHQ7WXSsft9sr
         NFK6MR+jxLsS42eOzEKDT2T1/If4GdmvuG350GprS52Kv66Mn1i3/wsfADfYOD/B1CdE
         i9fQ==
X-Gm-Message-State: AOAM532w7op+FOZk5F2dCG8c7+L+PObf2J7ylq6+IOtGY/d6RrkeL++k
        15iCcb0QBk804GJHdAItmItsG6ZaB3xZRoXlgkjIdlXwDgTq8Q==
X-Google-Smtp-Source: ABdhPJyBjJzoFG81Ln1lva0OfQtDKDjfr3s7yZlWykUszXex4ET8qXJwsTfz0b48C3qwCmb8eYTojmNS0F3WsEjvkUc=
X-Received: by 2002:a25:bc0e:: with SMTP id i14mr10811776ybh.670.1642184812210;
 Fri, 14 Jan 2022 10:26:52 -0800 (PST)
MIME-Version: 1.0
References: <20211221191743.1893185-1-acz@semihalf.com> <20211221191743.1893185-14-acz@semihalf.com>
 <Ydi4/xYdgTv9Umqh@google.com> <CAB4aORUgGcPCLZ8iWAorCPbW53Q7c-YiDC4qau-w7G9sYjCvfg@mail.gmail.com>
 <Ydye8C1MjxpHHF5P@google.com> <CAB4aORU35k1zuMPaKsa09Qr34wgurYw1F-Mpyn2WZN77+5R+7A@mail.gmail.com>
 <CAOOzhkrzawfAxbFmQb-D39cAS3tt05qL-4dpj0X+ncxEFU3z_A@mail.gmail.com>
 <Yd5CayeX+hsZz7ZP@google.com> <CAO-hwJ+761zH0FqYULUtfXGvGfvutXWD+APLibBgBho6h-8LNA@mail.gmail.com>
In-Reply-To: <CAO-hwJ+761zH0FqYULUtfXGvGfvutXWD+APLibBgBho6h-8LNA@mail.gmail.com>
From:   Angela Czubak <acz@semihalf.com>
Date:   Fri, 14 Jan 2022 19:26:39 +0100
Message-ID: <CAB4aORVv_9T9S2rTdnBOGzweTDVpHjTv19_wq2KybHarjQDmnQ@mail.gmail.com>
Subject: Re: [PATCH 13/18] Input: MT - toggle ABS_PRESSURE pointer emulation
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Sean O'Brien" <seobrien@chromium.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        upstream@semihalf.com, Jiri Kosina <jikos@kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 12, 2022 at 10:17 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Wed, Jan 12, 2022 at 3:52 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Tue, Jan 11, 2022 at 09:19:19PM -0500, Sean O'Brien wrote:
> > > On Tue, Jan 11, 2022 at 12:07 PM Angela Czubak <acz@semihalf.com> wro=
te:
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
> > > > > > > On Tue, Dec 21, 2021 at 07:17:38PM +0000, Angela Czubak wrote=
:
> > > > > > > > Add a function to switch off ABS_PRESSURE generation if nec=
essary.
> > > > > > > > This may be helpful in case drivers want to generate ABS_PR=
ESSURE events
> > > > > > > > themselves from ABS_MT_PRESSURE.
> > > > > > >
> > > > > > > This needs better explanation for why it is needed. I assume =
this is to
> > > > > > > use ABS_PRESSURE to report "true force" for devices. If this =
is correct
> > > > > > > then I believe we should define a new flag for input_mt_init_=
slots()
> > > > > > > and check it here and also use it to calculate the force acro=
ss contacts
> > > > > > > in input_mt_sync_frame().
> > > > > > >
> > > > > > > Or did I misunderstand the point?
> > > > > > >
> > > > > > I would say you understood it correctly, though to my mind it i=
s not a
> > > > > > static behaviour,
> > > > >
> > > > > It should be, otherwise how will userspace know the meaning of th=
e
> > > > > event?
> > > > >
> > > > Fair point.
> > > >
> > > > > > i.e. we may want to switch this kind of calculation on and off.
> > > > > > Are flags intended to be modified at runtime?
> > > > >
> > > > > No.
> > > > >
> > > > > > For instance, if user decides to remove the release or press ef=
fect (previously
> > > > > > uploaded by them) and there is no default one per device, then =
we should switch
> > > > > > the haptic handling from kernel mode back to device mode.
> > > > >
> > > > > Why? I think if user removes effects then they do not want to hav=
e
> > > > > haptics effects. I am wondering if this whole thing made too comp=
lex.
> > > > >
> > > > > In my mind we have following cases:
> > > > >
> > > > > - OS does not know about these haptics devices (touchpads). They =
work in
> > > > >   device (?) mode and provide haptic feedback on their own.
> > > > >
> > > > > - OS does know about haptics devices (that includes having both k=
ernel
> > > > >   *and* userspace support for them. If one is missing then the ot=
her
> > > > >   should not be enabled, it is up to the distro to make sure all =
pieces
> > > > >   are there). In this case OS controls haptics effects all the ti=
me,
> > > > >   except:
> > > > >
> > > > > - OS supports haptics, but switched it to device mode to allow ha=
ptics
> > > > >   effect playback when waking up.
> > > > >
> > > > Perhaps switching between modes should be a separate discussion.
> > > > Right now it seems to me that your suggestion could be that if
> > > > INPUT_PROP_HAPTIC_TOUCHPAD is set it should be followed by setting
> > > > something like INPUT_MT_PRESSURE_SUM in mt_flags, which should mean
> > > > every ABS_PRESSURE event should actually be a sum of pressures/true=
 forces
> > > > across all slots. Does it sound right?
> > > > If so, I suppose I will implement it. It should be completely indep=
endent from
> > > > device/kernel mode and, what is more, if hid_haptic_init() fails fo=
r any reason
> > > > the pressure sum still gets calculated.
> >
> > I'd say that if hid_haptic_init() fails we should not say that the
> > device is INPUT_PROP_HAPTIC_TOUCHPAD (if we even decide to continue wit=
h
> > the device instantiation, which we probably should not).
>
> Agree. Userspace should know that the device is a pressure pad based
> on the unit provided in ABS_MT_PRESSURE IIRC.
> So setting the resolution is enough for userspace to emulate the
> button clicks based on the pressure. libinput already has code for
> that.
>

A quick glance [1] and it seems that libinput chooses to ignore ABS_MT_PRES=
SURE
it the resolution is non-zero (though I might have been looking in a
wrong place).
Mentioning just because someone might lead me to a proper place/library act=
ually
using ABS_MT_PRESSURE as force.

> So basically, INPUT_PROP_HAPTIC_TOUCHPAD is only an indication that
> the haptic is configurable. And if haptic_init() fails, it should not
> expose that property.
>
> And BTW, why "TOUCHPAD" in INPUT_PROP_HAPTIC_TOUCHPAD? The Surface
> Dial could benefit from that implementation and it is not a
> touchpad...
>

Ok, so looking back at the old discussion it seems to me that the
property originally
suggested is INPUT_PROP_FORCEPAD and it was initially intended to mean that
ABS_MT_PRESSURE events should be interpreted as force and not area/pressure=
.
In case units are grams or newtons I calculate the resolution, but it
seems that Peter
has previously stated it is not enough:

>And we can't just assume "if resolution is set, units are $foo" because
>nothing written in the last decade or so will assume that. Some extra flag
>is needed, like INPUT_PROP_FORCEPAD.

I think Benjamin originally suggested this flag so that userspace knows
ABS_MT_PRESSURE should mean force.

However, it was a very long time ago. It seems that about a year ago it was
defined that non-zero pressure resolution means units/grams is used.

It seems to me that we could assume that reporting FF_HID events implicates
how ABS_MT_PRESSURE should be interpreted, so I could get rid of this
flag, if that is what you prefer.

> >
> > > >
> > > > Sean, is it OK for the device to keep kernel mode in the event no
> > > > default press/release
> > > > waveform is defined in the waveform list and the user removes relev=
ant effects
> > > > (after having uploaded them)? I think it was desired to remain in t=
he
> > > > device mode
> > > > if no such waveforms/effects are defined and, thus, I assumed that =
removing
> > > > following effects (in case no press/release waveforms in the wavefo=
rm
> > > > list) should
> > > > trigger coming back to device mode.
> > > > Right now it seems that switching back to device mode should be
> > > > allowed only when
> > > > suspending the device.
> > >
> > > I agree that we should switch to device-controlled mode if press/rele=
ase are
> > > not defined by the device, and userspace has not supplied alternative
> > > waveforms for either. If we kept it in kernel-controlled mode, there =
would be
> > > no effect for click/release. This can be achieved by userspace by emi=
tting
> > > EVIOCFFTAKECONTROL for click and release, and never sending haptic co=
mmands.
> >
> > What is wrong for not having effect for press/release if userspace did
> > not bother to set it up? I think this is reasonably to expect that if
> > user enabled support for haptic touchpad in kernel they should also hav=
e
> > userspace that knows how to handle it. If we go with this requirement I
> > think we will reduce a lot of complexity.
> >
> > Benjamin, Jiri, Peter, I'd like you to chime in please.
>
> [FWIW, lei saved me on this one for not being Cc-ed since the
> beginning of this thread]
>
> I think we should keep it simple:
> - the device configuration should be static (i.e.
> ABS_PRESSURE/ABS_MT_PRESSURE, pointer emulation, button emulation,
> ...) always present
> - userspace should pick up what it needs based on its own state:
>   if there is a need to compute a total pressure, userspace is capable
> of computing itself, and generates its own button press/release
> - the haptic is a global state of the device, so any decision you make
> is going to have corner cases with more than one userspace (or if the
> userspace daemon/lib is restarted)
>
> So to me, we should keep the kernel device emulation, export what
> needs to be for userspace to make its own decision and have the haptic
> side as a "nice to have" feature but distinct from the event
> processing.
>
> I didn't want to chime into this thread because I am currently working
> on 2 big series that might also be helpful here:
> - the first one, which is almost ready, consists in rethinking how the
> HID events are processed, meaning we can ensure that some events are
> always processed before others. The net benefit is that I can now
> express the Win8 multitouch protocol in hid-generic without too much
> pain, meaning that hid-haptic.c could be a leaf driver instead of
> being an API.
> The net benefit of not having hid-haptic.c as an API is that we can
> always rmmod it to disable the entire haptic system if there is
> something wrong.
>
> - the second one is the eBPF bindings for HID (see
> https://lore.kernel.org/all/20211215134220.1735144-1-tero.kristo@linux.in=
tel.com/
> and the other versions for some more discussions)
> Basically BPF allows to avoid specific kernel APIs and userspace is in
> charge of loading the bridge between its API and the device. It
> definitely has the potential to solve many limitations we are seeing
> now in all the various input/ff protocols IMO.
>
> >
> > >
> > > This also allows for the case where userspace may want to send haptic=
s for UX
> > > effects, while still relying on the device for traditional press and =
release
> > > haptics (in the case where the device doesn't define press/release
> > > waveforms).
> >
> > Again, what is the difference between press/release and other UX
> > effects? They seem to be the same to me...
> >
> > > >
> > > > Now, the question would be where BTN_LEFT events should be generate=
d.
> > > > Normally it happens in hid-multitouch and I override it in hid-hapt=
ic.c
> > > > This means I calculate the pressure sum as well in hid-haptic/hid-m=
ultitouch.
> > > > Does anyone mind such behaviour?
>
> Again, why is there a need to have some complex behavior there? Just
> let userspace do its own fancy computation and keep it simple in the
> kernel.

I thought it was requested based on the following discussion [2]:

>>
>> ABS_PRESSURE may be optionally reported as the total force applied to th=
e
>> forcepad.
>>
>> The device/driver shouldn=E2=80=99t detect button clicks, this is left t=
o the userspace
>> gesture library. Accordingly, the driver should not sent BTN_* events to
>> userspace in normal operating mode. However it should still report the a=
bility
>> to produce such events, for use in autonomous mode.
>
> For backward compatibility, and to be able to debug it properly, you
> should keep the BTN_* events emulated in all cases.
> The userspace can ignore the events it doesn't want this way, but you
> will be able to debug the btn emulations on your current session
> without having to kill your compositor.
> There shouldn't be much of a head over forwarding those events, as it
> will never come alone, and will always be with an other one at least
> (pressure being 0 or less).
>
> Also, not sending BTN_TOUCH and BTN_LEFT might give some headaches to
> legacy applications.

I can remove such behaviour if I misunderstood or it is no longer valid.

> Well, with eBPF, you could let userspace put the BTN_LEFT emulation in
> the kernel by loading a specific program, but that would be in charge
> of the userspace to make this choice, not the kernel.
>
> Cheers,
> Benjamin
>
> > > >
> > > > > > Currently it
> > > > > > also means
> > > > > > that the driver stops generating ABS_PRESSURE events on its own=
 and so
> > > > > > input-mt layer may/should be used again (i.e. mt report pointer=
 emulation).
> > > > > > Anyhow, if it would be actually better to calculate the true fo=
rce in
> > > > > > input_mt_sync_frame()/input_mt_report_pointer_emulation()
> > > > >
> > > > (I suppose I wanted to say I would implement it in such case)
> >
> > Thanks.
> >
> > --
> > Dmitry
> >
>
Regards,
Angela

[1] https://gitlab.freedesktop.org/libinput/libinput/-/issues/562
[2] https://www.spinics.net/lists/linux-input/msg60983.html
