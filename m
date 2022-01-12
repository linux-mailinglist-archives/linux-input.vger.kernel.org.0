Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41D9C48BD6E
	for <lists+linux-input@lfdr.de>; Wed, 12 Jan 2022 03:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348927AbiALCwd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jan 2022 21:52:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236450AbiALCwc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jan 2022 21:52:32 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB02C06173F
        for <linux-input@vger.kernel.org>; Tue, 11 Jan 2022 18:52:32 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id ie23-20020a17090b401700b001b38a5318easo2199278pjb.2
        for <linux-input@vger.kernel.org>; Tue, 11 Jan 2022 18:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4cpbFJIU3Anl07+nXYTZr+cH8esWAFSfEv7HmwwaxjY=;
        b=L/oc0QMU6lJ+SACoOHc0qo+bJ10FTBRTvmRw0seqkkTljM0e8ohyJvCbiozQwhWYwe
         jjnNO04mmiNgtaYMrGhtcSl3PSzoUUvI+BTDQc1Y7UFjSPXzgchSnWcu6HfA47lEC7mb
         baCzk+J995aKUgrtUmXtQ9IIzOBc/y53i32g5JTnkwDDVA57hq2xolSsw4HllvigzRtI
         79IAEIOcM4M9Emo7OsNasSZeYdH4Wk7YBpXg13Iq7ZjyVgMq065xXXKrClfpJkIPXR6k
         fgSU6n0ntsXDXtL++HFYv9jIJrIl2jLDLs3Z/DLaLHA53wxzGG0H3aemMNlmeUxvAz+9
         07Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4cpbFJIU3Anl07+nXYTZr+cH8esWAFSfEv7HmwwaxjY=;
        b=U0KJz8+decd8qf/O1P6rOd6r1kEujgewckGLlACbqgFQMXvqDJZ7z9eQcvhtwbwqH0
         J5kQpzQx6kK3yx3gcov9r+Iq6NcJ95oZtoG/hn9VxWVplRRM/NraGnILIFgVX9nEXxnQ
         3QjqfIWj+Evu3v9NwCpwHPwJyI6FfF2E+xdwTvv/hhgevq/ObXLlGsEwa29SOHL9VuUv
         mIoz5XzRLJiRxwVifJGhFEuVEDSeJgTamcfS0Zp8yln0BLFpBpx/zH1ObokujTD+pI5p
         xNQWONxnDI4OBvaN1l42Gnj1FmTnFrHmPigKWoVRs5hmu77Uxp+FLljWb9Vdxcbe27jt
         QnYQ==
X-Gm-Message-State: AOAM533OybRHFlZQZh8s1AkebIKDSt0/O2uUus2c/2h31mj5djlVSaQP
        /ZsaMjuvQ+YyPjAeC+7ejps=
X-Google-Smtp-Source: ABdhPJx1GnouAGAcsRQ5y7QIu90GoqJJf4yYsFJ2K1i0zCDkkis30JnGDTtjIvO2JLkdmWBtn6ElLA==
X-Received: by 2002:a05:6a00:230d:b0:49f:b8ad:ae23 with SMTP id h13-20020a056a00230d00b0049fb8adae23mr7219498pfh.80.1641955951450;
        Tue, 11 Jan 2022 18:52:31 -0800 (PST)
Received: from google.com ([2620:15c:202:201:3a9e:1b17:6ee4:bab6])
        by smtp.gmail.com with ESMTPSA id e3sm644516pgl.59.2022.01.11.18.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 18:52:30 -0800 (PST)
Date:   Tue, 11 Jan 2022 18:52:27 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sean O'Brien <seobrien@chromium.org>
Cc:     Angela Czubak <acz@semihalf.com>, linux-input@vger.kernel.org,
        upstream@semihalf.com,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>
Subject: Re: [PATCH 13/18] Input: MT - toggle ABS_PRESSURE pointer emulation
Message-ID: <Yd5CayeX+hsZz7ZP@google.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
 <20211221191743.1893185-14-acz@semihalf.com>
 <Ydi4/xYdgTv9Umqh@google.com>
 <CAB4aORUgGcPCLZ8iWAorCPbW53Q7c-YiDC4qau-w7G9sYjCvfg@mail.gmail.com>
 <Ydye8C1MjxpHHF5P@google.com>
 <CAB4aORU35k1zuMPaKsa09Qr34wgurYw1F-Mpyn2WZN77+5R+7A@mail.gmail.com>
 <CAOOzhkrzawfAxbFmQb-D39cAS3tt05qL-4dpj0X+ncxEFU3z_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOOzhkrzawfAxbFmQb-D39cAS3tt05qL-4dpj0X+ncxEFU3z_A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 11, 2022 at 09:19:19PM -0500, Sean O'Brien wrote:
> On Tue, Jan 11, 2022 at 12:07 PM Angela Czubak <acz@semihalf.com> wrote:
> >
> > On Mon, Jan 10, 2022 at 10:02 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > On Mon, Jan 10, 2022 at 08:43:28PM +0100, Angela Czubak wrote:
> > > > Hi Dmitry,
> > > >
> > > > On Fri, Jan 7, 2022 at 11:07 PM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:
> > > > >
> > > > > Hi Angela,
> > > > >
> > > > > On Tue, Dec 21, 2021 at 07:17:38PM +0000, Angela Czubak wrote:
> > > > > > Add a function to switch off ABS_PRESSURE generation if necessary.
> > > > > > This may be helpful in case drivers want to generate ABS_PRESSURE events
> > > > > > themselves from ABS_MT_PRESSURE.
> > > > >
> > > > > This needs better explanation for why it is needed. I assume this is to
> > > > > use ABS_PRESSURE to report "true force" for devices. If this is correct
> > > > > then I believe we should define a new flag for input_mt_init_slots()
> > > > > and check it here and also use it to calculate the force across contacts
> > > > > in input_mt_sync_frame().
> > > > >
> > > > > Or did I misunderstand the point?
> > > > >
> > > > I would say you understood it correctly, though to my mind it is not a
> > > > static behaviour,
> > >
> > > It should be, otherwise how will userspace know the meaning of the
> > > event?
> > >
> > Fair point.
> >
> > > > i.e. we may want to switch this kind of calculation on and off.
> > > > Are flags intended to be modified at runtime?
> > >
> > > No.
> > >
> > > > For instance, if user decides to remove the release or press effect (previously
> > > > uploaded by them) and there is no default one per device, then we should switch
> > > > the haptic handling from kernel mode back to device mode.
> > >
> > > Why? I think if user removes effects then they do not want to have
> > > haptics effects. I am wondering if this whole thing made too complex.
> > >
> > > In my mind we have following cases:
> > >
> > > - OS does not know about these haptics devices (touchpads). They work in
> > >   device (?) mode and provide haptic feedback on their own.
> > >
> > > - OS does know about haptics devices (that includes having both kernel
> > >   *and* userspace support for them. If one is missing then the other
> > >   should not be enabled, it is up to the distro to make sure all pieces
> > >   are there). In this case OS controls haptics effects all the time,
> > >   except:
> > >
> > > - OS supports haptics, but switched it to device mode to allow haptics
> > >   effect playback when waking up.
> > >
> > Perhaps switching between modes should be a separate discussion.
> > Right now it seems to me that your suggestion could be that if
> > INPUT_PROP_HAPTIC_TOUCHPAD is set it should be followed by setting
> > something like INPUT_MT_PRESSURE_SUM in mt_flags, which should mean
> > every ABS_PRESSURE event should actually be a sum of pressures/true forces
> > across all slots. Does it sound right?
> > If so, I suppose I will implement it. It should be completely independent from
> > device/kernel mode and, what is more, if hid_haptic_init() fails for any reason
> > the pressure sum still gets calculated.

I'd say that if hid_haptic_init() fails we should not say that the
device is INPUT_PROP_HAPTIC_TOUCHPAD (if we even decide to continue with
the device instantiation, which we probably should not).

> >
> > Sean, is it OK for the device to keep kernel mode in the event no
> > default press/release
> > waveform is defined in the waveform list and the user removes relevant effects
> > (after having uploaded them)? I think it was desired to remain in the
> > device mode
> > if no such waveforms/effects are defined and, thus, I assumed that removing
> > following effects (in case no press/release waveforms in the waveform
> > list) should
> > trigger coming back to device mode.
> > Right now it seems that switching back to device mode should be
> > allowed only when
> > suspending the device.
> 
> I agree that we should switch to device-controlled mode if press/release are
> not defined by the device, and userspace has not supplied alternative
> waveforms for either. If we kept it in kernel-controlled mode, there would be
> no effect for click/release. This can be achieved by userspace by emitting
> EVIOCFFTAKECONTROL for click and release, and never sending haptic commands.

What is wrong for not having effect for press/release if userspace did
not bother to set it up? I think this is reasonably to expect that if
user enabled support for haptic touchpad in kernel they should also have
userspace that knows how to handle it. If we go with this requirement I
think we will reduce a lot of complexity.

Benjamin, Jiri, Peter, I'd like you to chime in please.

> 
> This also allows for the case where userspace may want to send haptics for UX
> effects, while still relying on the device for traditional press and release
> haptics (in the case where the device doesn't define press/release
> waveforms).

Again, what is the difference between press/release and other UX
effects? They seem to be the same to me...

> >
> > Now, the question would be where BTN_LEFT events should be generated.
> > Normally it happens in hid-multitouch and I override it in hid-haptic.c
> > This means I calculate the pressure sum as well in hid-haptic/hid-multitouch.
> > Does anyone mind such behaviour?
> >
> > > > Currently it
> > > > also means
> > > > that the driver stops generating ABS_PRESSURE events on its own and so
> > > > input-mt layer may/should be used again (i.e. mt report pointer emulation).
> > > > Anyhow, if it would be actually better to calculate the true force in
> > > > input_mt_sync_frame()/input_mt_report_pointer_emulation()
> > >
> > (I suppose I wanted to say I would implement it in such case)

Thanks.

-- 
Dmitry
