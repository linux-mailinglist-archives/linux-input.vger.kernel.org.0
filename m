Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B40A48BD0B
	for <lists+linux-input@lfdr.de>; Wed, 12 Jan 2022 03:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236083AbiALCTd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jan 2022 21:19:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348393AbiALCTc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jan 2022 21:19:32 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C076C06173F
        for <linux-input@vger.kernel.org>; Tue, 11 Jan 2022 18:19:32 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id q8so1495866wra.12
        for <linux-input@vger.kernel.org>; Tue, 11 Jan 2022 18:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EBO/ndTHR38LS3gmjHh5IPnOTF7pyravw1J3GlWTPrI=;
        b=Y+zocmfTN6h/js5T628AeBwTEl7ZC41X3Ezt/rEvXorU0KqWtojnQ4hfv1LotlIphT
         j74Fl4568LMfvI0KYz2AwTRbEe4xMRT16nDF6cMi+AYqHrXoNwD5NddHf2lpqQAln71j
         +r8J3RVEZmLHKdqauPLoRmo9kxAo8TlnM8ICA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EBO/ndTHR38LS3gmjHh5IPnOTF7pyravw1J3GlWTPrI=;
        b=aCTm3X/SM0TnI7T/7FDhektouQNTGY6BuXieqF5qLtOORkU27GQJLc/nZc4V23Cbuh
         DQEwFrmIl7drUBAko0E49NGfLaQ0S/SrQTr5uWljZXDbtXFFiD3iz8+LH3db+3nEocEv
         2GJL4jzF+/M2tLMEZV3AYJv2b9124hNbnxQNafFmnOW72kHnFqBv5z/ESudK8p+AqwFS
         Ablgv322Dqp88cUnb4H1Bn7cYo9TzBu9VQM5CGWrCCCnHoTtMDK/npJk5WyuGDSTBvdT
         aSufBqVipSI6gIBhpeqvDzTRL/Avoyr+BiY9dnqlyPAn6YVyiemWl2KSrfkvbwWxGwQN
         fmRA==
X-Gm-Message-State: AOAM530VFfk9KQqPcHdjG082bgPOauxLlMheEctA6BVEqVJzr4NaP+22
        BNuP5puOuDmlWhFxYFxHQygg/LIzayTpNflMlxRkq2X8JZFjdA==
X-Google-Smtp-Source: ABdhPJzviDjdPjsO26NYQMlM392qAOE1h/CdYj9YcyU6gm2RR6ok2YL8aeauzH0KCk2KCaVa9xmxXMWA3H0aCFh7ZLM=
X-Received: by 2002:a05:6000:1687:: with SMTP id y7mr5937606wrd.636.1641953970722;
 Tue, 11 Jan 2022 18:19:30 -0800 (PST)
MIME-Version: 1.0
References: <20211221191743.1893185-1-acz@semihalf.com> <20211221191743.1893185-14-acz@semihalf.com>
 <Ydi4/xYdgTv9Umqh@google.com> <CAB4aORUgGcPCLZ8iWAorCPbW53Q7c-YiDC4qau-w7G9sYjCvfg@mail.gmail.com>
 <Ydye8C1MjxpHHF5P@google.com> <CAB4aORU35k1zuMPaKsa09Qr34wgurYw1F-Mpyn2WZN77+5R+7A@mail.gmail.com>
In-Reply-To: <CAB4aORU35k1zuMPaKsa09Qr34wgurYw1F-Mpyn2WZN77+5R+7A@mail.gmail.com>
From:   "Sean O'Brien" <seobrien@chromium.org>
Date:   Tue, 11 Jan 2022 21:19:19 -0500
Message-ID: <CAOOzhkrzawfAxbFmQb-D39cAS3tt05qL-4dpj0X+ncxEFU3z_A@mail.gmail.com>
Subject: Re: [PATCH 13/18] Input: MT - toggle ABS_PRESSURE pointer emulation
To:     Angela Czubak <acz@semihalf.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 11, 2022 at 12:07 PM Angela Czubak <acz@semihalf.com> wrote:
>
> On Mon, Jan 10, 2022 at 10:02 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Mon, Jan 10, 2022 at 08:43:28PM +0100, Angela Czubak wrote:
> > > Hi Dmitry,
> > >
> > > On Fri, Jan 7, 2022 at 11:07 PM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > > >
> > > > Hi Angela,
> > > >
> > > > On Tue, Dec 21, 2021 at 07:17:38PM +0000, Angela Czubak wrote:
> > > > > Add a function to switch off ABS_PRESSURE generation if necessary.
> > > > > This may be helpful in case drivers want to generate ABS_PRESSURE events
> > > > > themselves from ABS_MT_PRESSURE.
> > > >
> > > > This needs better explanation for why it is needed. I assume this is to
> > > > use ABS_PRESSURE to report "true force" for devices. If this is correct
> > > > then I believe we should define a new flag for input_mt_init_slots()
> > > > and check it here and also use it to calculate the force across contacts
> > > > in input_mt_sync_frame().
> > > >
> > > > Or did I misunderstand the point?
> > > >
> > > I would say you understood it correctly, though to my mind it is not a
> > > static behaviour,
> >
> > It should be, otherwise how will userspace know the meaning of the
> > event?
> >
> Fair point.
>
> > > i.e. we may want to switch this kind of calculation on and off.
> > > Are flags intended to be modified at runtime?
> >
> > No.
> >
> > > For instance, if user decides to remove the release or press effect (previously
> > > uploaded by them) and there is no default one per device, then we should switch
> > > the haptic handling from kernel mode back to device mode.
> >
> > Why? I think if user removes effects then they do not want to have
> > haptics effects. I am wondering if this whole thing made too complex.
> >
> > In my mind we have following cases:
> >
> > - OS does not know about these haptics devices (touchpads). They work in
> >   device (?) mode and provide haptic feedback on their own.
> >
> > - OS does know about haptics devices (that includes having both kernel
> >   *and* userspace support for them. If one is missing then the other
> >   should not be enabled, it is up to the distro to make sure all pieces
> >   are there). In this case OS controls haptics effects all the time,
> >   except:
> >
> > - OS supports haptics, but switched it to device mode to allow haptics
> >   effect playback when waking up.
> >
> Perhaps switching between modes should be a separate discussion.
> Right now it seems to me that your suggestion could be that if
> INPUT_PROP_HAPTIC_TOUCHPAD is set it should be followed by setting
> something like INPUT_MT_PRESSURE_SUM in mt_flags, which should mean
> every ABS_PRESSURE event should actually be a sum of pressures/true forces
> across all slots. Does it sound right?
> If so, I suppose I will implement it. It should be completely independent from
> device/kernel mode and, what is more, if hid_haptic_init() fails for any reason
> the pressure sum still gets calculated.
>
> Sean, is it OK for the device to keep kernel mode in the event no
> default press/release
> waveform is defined in the waveform list and the user removes relevant effects
> (after having uploaded them)? I think it was desired to remain in the
> device mode
> if no such waveforms/effects are defined and, thus, I assumed that removing
> following effects (in case no press/release waveforms in the waveform
> list) should
> trigger coming back to device mode.
> Right now it seems that switching back to device mode should be
> allowed only when
> suspending the device.

I agree that we should switch to device-controlled mode if press/release are
not defined by the device, and userspace has not supplied alternative
waveforms for either. If we kept it in kernel-controlled mode, there would be
no effect for click/release. This can be achieved by userspace by emitting
EVIOCFFTAKECONTROL for click and release, and never sending haptic commands.

This also allows for the case where userspace may want to send haptics for UX
effects, while still relying on the device for traditional press and release
haptics (in the case where the device doesn't define press/release
waveforms).
>
> Now, the question would be where BTN_LEFT events should be generated.
> Normally it happens in hid-multitouch and I override it in hid-haptic.c
> This means I calculate the pressure sum as well in hid-haptic/hid-multitouch.
> Does anyone mind such behaviour?
>
> > > Currently it
> > > also means
> > > that the driver stops generating ABS_PRESSURE events on its own and so
> > > input-mt layer may/should be used again (i.e. mt report pointer emulation).
> > > Anyhow, if it would be actually better to calculate the true force in
> > > input_mt_sync_frame()/input_mt_report_pointer_emulation()
> >
> (I suppose I wanted to say I would implement it in such case)
>
> > Thanks.
> >
> > --
> > Dmitry
