Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCB2B3EB25E
	for <lists+linux-input@lfdr.de>; Fri, 13 Aug 2021 10:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239782AbhHMIM3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Aug 2021 04:12:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53655 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239668AbhHMIM3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Aug 2021 04:12:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628842322;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fbTt90mLgXKyeOCvvJEfCrrlVgz1iAqqy+NA9ybguTo=;
        b=O29Zgehl90kN5S6YPypd9WbQYvDbkwLiZ958iOmqhLal4KbCzYsOfsYzR1MjITaDvE+U7d
        sYfm8t/cRGsIMcxy03SGXh6NmAKbXvjC/GAEScH1xtn890CZuUE30lKxjDB3OljEglN6aY
        s98ZDf3aN9C9gGzeEjP1lwfE6aCib9o=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-2f8PcHOvNQikClbWjN_-9g-1; Fri, 13 Aug 2021 04:12:01 -0400
X-MC-Unique: 2f8PcHOvNQikClbWjN_-9g-1
Received: by mail-pl1-f197.google.com with SMTP id p7-20020a170902b087b029012c2879a885so5643913plr.6
        for <linux-input@vger.kernel.org>; Fri, 13 Aug 2021 01:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fbTt90mLgXKyeOCvvJEfCrrlVgz1iAqqy+NA9ybguTo=;
        b=fRouia3eAw2f5GUFjlHIjIxAjDwqIxtI/O/iWn20FsDOB7iNwcL+0T7InhjHaxS0Xl
         Qj28CjR/l0F4t19Eb4qF4aryE14RtrrNa/USYy1UX/voOOZ5GNaaOUPMcwwARl6jp3Cy
         qF2ihdKtUNRDmIptdrGLk1S0Ciqvnqejp4VACw7RJRQkCh2bXWkeYDxZoaqMY2DqbhlL
         Cxs3jrMX8m3XKgYMGsixQgEgbYasZD1J0aFTS1Ds8Q334y0HsoTIsY82GEzWLFtcYujn
         Usou4BIPhCnYEzHgT91p6z8bA1atJZWPtEI8fYtzwa+Q38hdoKrl9PVBGLHfq06QnAtT
         S6jg==
X-Gm-Message-State: AOAM531drpnMaPJF12tBslkPBtTGAaoT6mDnueTVPdg0xNtkG/UyXC4U
        vkjJA3SoLjou3zYB0QmhB5ETZEGjJnWK4SKNk6Ih144xcszCC1J4wVgOBPjgMBd1OLXB94jyOxY
        q17lpaBE7QntLterPmAwst8vCLOcCsGwh2f7A44I=
X-Received: by 2002:a65:5288:: with SMTP id y8mr1266199pgp.275.1628842319997;
        Fri, 13 Aug 2021 01:11:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5Bs7Fm+/mUYfdHsQ/DFN+VVsvxYvwpu8i0zjaUXzCKlwSc0RG1dJozuMx6wc/tBFvjpzN67SFDYj3xQ53QqM=
X-Received: by 2002:a65:5288:: with SMTP id y8mr1266180pgp.275.1628842319645;
 Fri, 13 Aug 2021 01:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210812001250.1709418-1-dmanti@microsoft.com>
 <CAO-hwJK1Jt+T_ZsvPj0=+hEt3XnALfnkmB++Kdk7bZV9FgE0Cg@mail.gmail.com>
 <87lf56inxm.fsf@kernel.org> <CAO-hwJ+36wji=nWKxW-GFBj=o3yovr__3s+03SDdPHq1jO4WwQ@mail.gmail.com>
 <87eeayj5b3.fsf@kernel.org>
In-Reply-To: <87eeayj5b3.fsf@kernel.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 13 Aug 2021 10:11:48 +0200
Message-ID: <CAO-hwJL_gea6tRswrfWzZu5q1me10-C7sAy3fC4YYnTceV+nLA@mail.gmail.com>
Subject: Re: [PATCH] HID: Support Microsoft Surface Duo SPI-based touch
 controller driver as a module.
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Dmitry Antipov <daantipov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        jeff.glaum@microsoft.com, Dmitry Antipov <dmanti@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 13, 2021 at 7:13 AM Felipe Balbi <balbi@kernel.org> wrote:
>
>
> Hi,
>
> Benjamin Tissoires <benjamin.tissoires@redhat.com> writes:
> >> > On Thu, Aug 12, 2021 at 2:13 AM Dmitry Antipov <daantipov@gmail.com> wrote:
> >> >>
> >> >> Surface Duo uses a touch digitizer that communicates to the main SoC via SPI
> >> >> and presents itself as a HID device. This patch contains the changes needed
> >> >> for the driver to work as a module: HID Core affordances for SPI devices,
> >> >> addition of the new Device IDs, and a new quirk in hid-microsoft. The driver
> >> >> itself is being prepared for a submission in the near future.
> >> >>
> >> >> Signed-off-by: Dmitry Antipov dmanti@microsoft.com
> >> >
> >> > Though I really appreciate seeing a microsoft.com submission, the
> >> > commit description makes me wonder if we should not postpone the
> >> > inclusion of this patch with the "submission in the near future".
> >> >
> >> > AFAIK, HID is not SPI aware. So basically, we are introducing dead
> >> > code in the upstream kernel if we take this patch.
> >>
> >> Right, unfortunately spec isn't public yet (albeit having products
> >> shipped using it and a driver available in a public tree somewhere I
> >> couldn't find).
> >>
> >> I _do_ have one question though:
> >>
> >> Is there a way to tell hid core that $this device wants hidraw? If we
> >
> > Depending on what you want and can do I can think of several solutions:
> > - add a quirk for this device (either at boot time, either in
> > hid-quirks.c) There must be one that tells to only bind to hidraw
> > - provide an out of the tree driver that declares the BUS:VID:PID, and
> > start the HID device with HIDRAW only.
>
> sounds good

I did some more digging this morning.

The quirk option is not especially good, there is no "hidraw only" quirk.
However, there is a "HID_QUIRK_HAVE_SPECIAL_DRIVER" that prevents
hid-generic from binding to your device. This has the same effect as
adding the device in the hid-quirks.c in this submission, so for
development purposes, if the device is messed up by hid-generic, I
would advise to add this quirk (maybe from the development spi
transport driver as a temporary work around).

To have the device bound to hidraw only, then yes, if you provide a
simple out of the tree module that binds to this module, hid-generic
will release the device and let this out of the tree module deal with
it.

AFAICT, the hid-core changes you are asking here should not block the
development process if they are not merged. You'll get an "UNKOWN" bus
in the logs, and the SPI_HID_DEVICE macro can be defined in the out of
the tree driver.

>
> >> remove the hid-microsoft changes, hid-generic will pick the device as
> >> expected, but this really needs hidraw. Any hints?
> >
> > I am fine with the hid-microsoft changes, I just want them in a
> > separate commit. But I don't see why we would take only the first one
> > without the SPI transport and the hid-microsoft code...
> >
> > Basically: not sure why you need hidraw for it.
>
> Yeah, the touch controller is "peculiar". It sends to the host raw
> frames which needs to be processed by a userspace application. We don't
> get coordinates, pressure, etc. We get raw values from the touch
> digitizer; these are passed to a daemon which runs your usual filters
> (palm rejection, denoising, yada yada yada) and produces the actual
> touch inputs. Those are, in turn, given to uinput.
>

In that case, maybe hidraw is not the best way to forward the events.

V4L has a capability to export raw touch events. You can have a look
at drivers/input/rmi4/rmi_f54.c, drivers/input/touchscreen/sur40.c or
drivers/input/touchscreen/atmel_mxt_ts.c for some examples.
The nice thing is you'll get parallel processing and DMA between the
kernel and userspace. Also, there must be userspace tools around that
are already capable of dealing with that kind of input. Though I also
understand the need to have your own sauce.

Cheers,
Benjamin

