Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB79E48C0A1
	for <lists+linux-input@lfdr.de>; Wed, 12 Jan 2022 10:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351881AbiALJDI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jan 2022 04:03:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238265AbiALJDI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jan 2022 04:03:08 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3DAFC06173F
        for <linux-input@vger.kernel.org>; Wed, 12 Jan 2022 01:03:07 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id v186so4525600ybg.1
        for <linux-input@vger.kernel.org>; Wed, 12 Jan 2022 01:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AfZVk+WDg2JoyvKbXzjnd4lu4wghNAIwwzEcwPuOW0Y=;
        b=I2/0+Bq63xYBrKJGwrkQZj2yPTpnEKvFBbmBvrw5+AARtJrb8ryNbTd8vyoxkpmDxH
         eGSXivQ0Of9mPegQbTd4fZFn30mqZbOrrywoQhnFN3aSWkuXagbzt9Ml0IkinsX3gcXS
         HsQ7gGP8q9fElcia6HALZdqj8w66/YXVg2yt9COBpJEfdQbchFSdPxzaf2GcajGiR+hH
         dgq8pml60vvF10+G+6T1C/J4sC1pC3yeUzkuaqqbIG/DTQ//ucTmW6IxfOnQMXnILK2Z
         De5hN9NzaJFAXuyDgeNCTnbYSxjTY1wMmANlwbC0IzcBh4au2cHEOCOKtUTK0jFOOG1V
         Gmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AfZVk+WDg2JoyvKbXzjnd4lu4wghNAIwwzEcwPuOW0Y=;
        b=hL4cW3Ouq++YpKMSIyzwwcppAV5hzMwaEvL55VHUb1ezkUjQ2VAgmk19HVG9Fe3jcb
         cOhQF1OUqk6wXD80Yc6n/62DLtZ9Vw4eIWBwYdXP23RIeanj/ih7eNU1rClWAKy/CbVV
         xux/gcmGy0KvOLtQcwU/4zd3R3MEWHOhF+HbecGOfBnNdDcD792j+zyVjRDn6r4CqsVu
         NSWb8o8CwpfskGDL9XMDP07OuUEjyJsgud+9bebH5gmKdMUqXZhCxdhl12R7uMSb+BAA
         ft/FWl0C26Yf5CYivdJtBypM0yRPgeWD68liN/qq1i9NbWWKiVbQhJUHQW8Ch9pbsXN3
         3JzA==
X-Gm-Message-State: AOAM531DKoOlClSuKVdptOE4AbAgTBJZ7RyqJyFvWJAvuVkGr0vzyW7x
        qZWBJMKD3zF9t6cdY2o4jBIsAQ20o7+FAYAVx0U1DQ==
X-Google-Smtp-Source: ABdhPJxwXFGx81h7W8eGovZgB5srjQI3iSXu6z3M/PWi3KPiERt0gdwWOt95TbKxodbB3AdAOEMkKQvAtxOQUsCNEOo=
X-Received: by 2002:a5b:281:: with SMTP id x1mr10719545ybl.41.1641978186949;
 Wed, 12 Jan 2022 01:03:06 -0800 (PST)
MIME-Version: 1.0
References: <20211221191743.1893185-1-acz@semihalf.com> <20211221191743.1893185-14-acz@semihalf.com>
 <Ydi4/xYdgTv9Umqh@google.com> <CAB4aORUgGcPCLZ8iWAorCPbW53Q7c-YiDC4qau-w7G9sYjCvfg@mail.gmail.com>
 <Ydye8C1MjxpHHF5P@google.com> <CAB4aORU35k1zuMPaKsa09Qr34wgurYw1F-Mpyn2WZN77+5R+7A@mail.gmail.com>
 <CAOOzhkrzawfAxbFmQb-D39cAS3tt05qL-4dpj0X+ncxEFU3z_A@mail.gmail.com> <Yd5CayeX+hsZz7ZP@google.com>
In-Reply-To: <Yd5CayeX+hsZz7ZP@google.com>
From:   Angela Czubak <acz@semihalf.com>
Date:   Wed, 12 Jan 2022 10:02:54 +0100
Message-ID: <CAB4aORUVFS+=KnWJnTeJLcDycMk7xBgbgeZtX5NK=BPJbEUk_w@mail.gmail.com>
Subject: Re: [PATCH 13/18] Input: MT - toggle ABS_PRESSURE pointer emulation
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "Sean O'Brien" <seobrien@chromium.org>,
        linux-input@vger.kernel.org, upstream@semihalf.com,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
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
>
It would still be a haptic touchpad, I suppose; the fact that
initialization failed isn't going
to do anything with the device, really, rather some failure in memory
allocation etc.
If you are worried about how the userspace can be sure that
initialization succeeded,
if hid_haptic_init() succeeds then the device should report EV_FF
events, otherwise not.
From my point of view it would be also somewhat unnecessary for
hid_haptic_init()
failure to break device instantiation as it would mean that the touchpad gets
nonfunctional.
Please let me know if there are any known obstacles that should discourage us
from using the device after failed hid_haptic_init() or you have some
more thoughts on
INPUT_PROP_HAPTIC_TOUCHPAD.
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
>
Dmitry, just to be sure, are you suggesting that kernel should not
trigger haptic feedback
at all as well?
I suppose most of the cases a haptic device will supply waveforms for
press and release in
its waveformlist (exposed in autotrigger report) and so the kernel
will use them.
I am just mentioning a case where switching back to device/autonomous
mode would be
somehow justifiable.
> >
> > This also allows for the case where userspace may want to send haptics for UX
> > effects, while still relying on the device for traditional press and release
> > haptics (in the case where the device doesn't define press/release
> > waveforms).
>
> Again, what is the difference between press/release and other UX
> effects? They seem to be the same to me...
>
I suppose the userspace may want the user to feel a different
sensation at times.
For instance, let's say that user tries to click on a button/switch
that is blocked for them
(perhaps this option is not allowed by their admin?). The userspace
may want to trigger
a different haptic effect to let them know in yet another way that
their actions haven't
succeeded, something is prohibited etc.
Sean, you may have some better real-life applications, perhaps it
should be you to
explain this point more clearly.
> > >
> > > Now, the question would be where BTN_LEFT events should be generated.
> > > Normally it happens in hid-multitouch and I override it in hid-haptic.c
> > > This means I calculate the pressure sum as well in hid-haptic/hid-multitouch.
> > > Does anyone mind such behaviour?
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
