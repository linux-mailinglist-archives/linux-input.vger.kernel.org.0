Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5321148B2E1
	for <lists+linux-input@lfdr.de>; Tue, 11 Jan 2022 18:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241420AbiAKRHP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jan 2022 12:07:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244267AbiAKRHK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jan 2022 12:07:10 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2261C061759
        for <linux-input@vger.kernel.org>; Tue, 11 Jan 2022 09:07:09 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id m6so38885953ybc.9
        for <linux-input@vger.kernel.org>; Tue, 11 Jan 2022 09:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RoieBvZr9Ds2K/8bQiFn+5KCoZa8TpU1EiZgaLVNmkc=;
        b=4M8zhbdkLjlqMjt4r+HeJAEYMSvcefbhUXDJ+m/7sK5knySxwvnN9acOVHD0VYnVhR
         Nb0hupfgiksAgwpCikVdT7M+TvIdNGQbSw55zQysRu8Kl6+4xh+9qG+HJ7/cIMOxQksU
         vrw/8TLd9AoTiE4WJkSqa3z/sJOOGWN7bJZGyB3LAAHUWfYqxEigD2r95VBR1vLtZrfr
         jU3yC/kpXQ5TQjFOQyrWNiV9uj2fbP46l/dvDZAzdb82Xe7EzHpIFj86ZPkjLaFednIg
         PkyWF3zlFcgerqF1TCLVe5l01ckofeKnov/gYovj+RuXeHEa27WqTjc1za/gM6ef39Dl
         BGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RoieBvZr9Ds2K/8bQiFn+5KCoZa8TpU1EiZgaLVNmkc=;
        b=MopeMJf/POr+llBmkN3+iUWl641uARUGkqbf3B1WtWFzkmQ1ENvdErmIzt9FmqQJ/I
         fAdRS2Ig4yBy6GJDmbzxNuTtkTWGA/rLhBUWnyOQuUukq+QxWXtEzBOVe4jRULMc+9ji
         3a+sfyqmatuI06QMW4TySeJ0CEW25CC7zyo+nw3s6WHp4GSvnkFe1QSLTUwKTpGYJXsE
         GmYBok0Tw0uEHNp1VJzlj/wA/x/AlUgW9JefexWrjsJ2xBpq3Z6HTwMWEntFcKobUeMe
         WBJBLHsPcU6MhnfC8WD/k+uVFjBWrTy8BLXWsd1WPui5Qd+nXzuuBDBWo+EEPtC5vU/l
         dtRA==
X-Gm-Message-State: AOAM533VPrnnS7LpjD+z6tB9PdHknKNFW1D9gt+OxezMTwAmzcbvhAl3
        tPUar6kwy4n3WwOXyfFjEUYbqBbiNgFmJsnXbrIn0A==
X-Google-Smtp-Source: ABdhPJyT7m72hl8gdS1lof1otpUDlJYZIPVAZDhta6xC8zR7FKoKua1kTYxSeiUQHZFhUW8yBoBpopxWiJ2cXavbohg=
X-Received: by 2002:a25:ae64:: with SMTP id g36mr6785121ybe.748.1641920829092;
 Tue, 11 Jan 2022 09:07:09 -0800 (PST)
MIME-Version: 1.0
References: <20211221191743.1893185-1-acz@semihalf.com> <20211221191743.1893185-14-acz@semihalf.com>
 <Ydi4/xYdgTv9Umqh@google.com> <CAB4aORUgGcPCLZ8iWAorCPbW53Q7c-YiDC4qau-w7G9sYjCvfg@mail.gmail.com>
 <Ydye8C1MjxpHHF5P@google.com>
In-Reply-To: <Ydye8C1MjxpHHF5P@google.com>
From:   Angela Czubak <acz@semihalf.com>
Date:   Tue, 11 Jan 2022 18:06:57 +0100
Message-ID: <CAB4aORU35k1zuMPaKsa09Qr34wgurYw1F-Mpyn2WZN77+5R+7A@mail.gmail.com>
Subject: Re: [PATCH 13/18] Input: MT - toggle ABS_PRESSURE pointer emulation
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>, seobrien@chromium.org
Cc:     linux-input@vger.kernel.org, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 10, 2022 at 10:02 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Mon, Jan 10, 2022 at 08:43:28PM +0100, Angela Czubak wrote:
> > Hi Dmitry,
> >
> > On Fri, Jan 7, 2022 at 11:07 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > Hi Angela,
> > >
> > > On Tue, Dec 21, 2021 at 07:17:38PM +0000, Angela Czubak wrote:
> > > > Add a function to switch off ABS_PRESSURE generation if necessary.
> > > > This may be helpful in case drivers want to generate ABS_PRESSURE events
> > > > themselves from ABS_MT_PRESSURE.
> > >
> > > This needs better explanation for why it is needed. I assume this is to
> > > use ABS_PRESSURE to report "true force" for devices. If this is correct
> > > then I believe we should define a new flag for input_mt_init_slots()
> > > and check it here and also use it to calculate the force across contacts
> > > in input_mt_sync_frame().
> > >
> > > Or did I misunderstand the point?
> > >
> > I would say you understood it correctly, though to my mind it is not a
> > static behaviour,
>
> It should be, otherwise how will userspace know the meaning of the
> event?
>
Fair point.

> > i.e. we may want to switch this kind of calculation on and off.
> > Are flags intended to be modified at runtime?
>
> No.
>
> > For instance, if user decides to remove the release or press effect (previously
> > uploaded by them) and there is no default one per device, then we should switch
> > the haptic handling from kernel mode back to device mode.
>
> Why? I think if user removes effects then they do not want to have
> haptics effects. I am wondering if this whole thing made too complex.
>
> In my mind we have following cases:
>
> - OS does not know about these haptics devices (touchpads). They work in
>   device (?) mode and provide haptic feedback on their own.
>
> - OS does know about haptics devices (that includes having both kernel
>   *and* userspace support for them. If one is missing then the other
>   should not be enabled, it is up to the distro to make sure all pieces
>   are there). In this case OS controls haptics effects all the time,
>   except:
>
> - OS supports haptics, but switched it to device mode to allow haptics
>   effect playback when waking up.
>
Perhaps switching between modes should be a separate discussion.
Right now it seems to me that your suggestion could be that if
INPUT_PROP_HAPTIC_TOUCHPAD is set it should be followed by setting
something like INPUT_MT_PRESSURE_SUM in mt_flags, which should mean
every ABS_PRESSURE event should actually be a sum of pressures/true forces
across all slots. Does it sound right?
If so, I suppose I will implement it. It should be completely independent from
device/kernel mode and, what is more, if hid_haptic_init() fails for any reason
the pressure sum still gets calculated.

Sean, is it OK for the device to keep kernel mode in the event no
default press/release
waveform is defined in the waveform list and the user removes relevant effects
(after having uploaded them)? I think it was desired to remain in the
device mode
if no such waveforms/effects are defined and, thus, I assumed that removing
following effects (in case no press/release waveforms in the waveform
list) should
trigger coming back to device mode.
Right now it seems that switching back to device mode should be
allowed only when
suspending the device.

Now, the question would be where BTN_LEFT events should be generated.
Normally it happens in hid-multitouch and I override it in hid-haptic.c
This means I calculate the pressure sum as well in hid-haptic/hid-multitouch.
Does anyone mind such behaviour?

> > Currently it
> > also means
> > that the driver stops generating ABS_PRESSURE events on its own and so
> > input-mt layer may/should be used again (i.e. mt report pointer emulation).
> > Anyhow, if it would be actually better to calculate the true force in
> > input_mt_sync_frame()/input_mt_report_pointer_emulation()
>
(I suppose I wanted to say I would implement it in such case)

> Thanks.
>
> --
> Dmitry
