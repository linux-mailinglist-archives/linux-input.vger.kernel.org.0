Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 367B22A0E5A
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 20:12:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgJ3TMc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 15:12:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46118 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726297AbgJ3TMc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 15:12:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604085140;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XBFiXaNj39XsUADHC7RDyTutSj/q4HGNQHJgvQLCxmE=;
        b=gTbelnJ0dOw7zPoSw3AWAPOm+XY5k6oSA1ZVM5l4j5kK9LpVUtbWHDKoSRR0fwNeX0QIw/
        y/U9vPvnG+CiHZzUPWyElsXk+OKoo52SCD2ZrUEVBS/Xo4EoarpHbeVeBr7QrEldbqZJ6N
        rOvdWIX99P8z1G6wriNhU2bHYW3s4ik=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-e_yWFHzSPjij6rCehywHgQ-1; Fri, 30 Oct 2020 15:12:19 -0400
X-MC-Unique: e_yWFHzSPjij6rCehywHgQ-1
Received: by mail-pf1-f200.google.com with SMTP id 203so5589787pfx.10
        for <linux-input@vger.kernel.org>; Fri, 30 Oct 2020 12:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XBFiXaNj39XsUADHC7RDyTutSj/q4HGNQHJgvQLCxmE=;
        b=P7FLUjflwD2tsbHX43xKUnyxoW1CpqpsPD+v+BZKgnV7CIp6o7QDEjaa7y4yhR5iwg
         /PE6h7POTaZiyvQovEqdyiPV2OJYwKw/uyHBnuIzCifQ7TAixPJv+4o1wq3+R/w4xqpM
         KgFnugOAaLvd0yjWKrmmZwcjcoMWyxSdGf0F6tROSlfLoKuvWa8DH2rYtLhwlKXuzY63
         cxatP8almpZmONXkfu0eV2MwYF2ylJaq+js+qcWjPN6166/kvFe7ZiXEzVU82JwZ+2ah
         kPwEXt8aJCrpeMfZah7Grkmc4EARraGmUiaZzIfQxS9ECVKGDRhd4TzIGjDQk/txfO+B
         eaSw==
X-Gm-Message-State: AOAM532AHiXuXK6F3ZLZ30rdOcCkkAO4caHSk+3onBQhYbBtgQMj8jy+
        IEjQq8gRFCBykjtQfr8S5w941Jmx8JNA6vhlcdSZ5YieUzEOwiTqITLzBzdX3Gb6qERd9KLLEKc
        FRPFysxuY7C2S7nwT+PSntkR7k3FAZeYZJfmdee0=
X-Received: by 2002:a63:490e:: with SMTP id w14mr3382422pga.275.1604085137787;
        Fri, 30 Oct 2020 12:12:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7oX81tGXy5zmWWvxzMzbhtIyWdYvUdA8PBADUj5CXHeRQPuitjFCWH9vEsZ801x+j0z7pVaseAlXdf3tPWR4=
X-Received: by 2002:a63:490e:: with SMTP id w14mr3382396pga.275.1604085137412;
 Fri, 30 Oct 2020 12:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201023162220.v2.1.I45b53fe84e2215946f900f5b28bab1aa9d029ac7@changeid>
 <CAO-hwJLn5XKV+cp+fCRY395uBWuX=JrxgiGSHUnJXFpTzFWu4w@mail.gmail.com> <20201030180042.GB3967106@bogus>
In-Reply-To: <20201030180042.GB3967106@bogus>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 30 Oct 2020 20:12:06 +0100
Message-ID: <CAO-hwJK8c+BrH3u5PMCndv6Jjj6K2z=4nyKMAojD09EcHjBROA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: HID: i2c-hid: Label this binding as deprecated
To:     Rob Herring <robh@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Jiri Kosina <jkosina@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        andrea@borgia.bo.it, Kai Heng Feng <kai.heng.feng@canonical.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Hans De Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 30, 2020 at 7:00 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Oct 30, 2020 at 11:51:53AM +0100, Benjamin Tissoires wrote:
> > Hi Doug,
> >
> > Foreword: I was about to say "yeah, whatever" to please Rob for once.
>
> Read my other reply first... I think we mostly agree.
>
> > But after re-reading this and more specifically patch 3 of the series,
> > that won't do. More comments inlined.
> >
> > On Sat, Oct 24, 2020 at 1:23 AM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > As pointed out by Rob Herring [1], we should have a device-specific
> > > compatible string.  This means people shouldn't be using the
> > > "i2c-over-hid" compatible string anymore, or at least not without a
> > > more specific compatible string before it.  Specifically:
> > >
> > > 1. For newly added devices we should just have the device-specific
> > >    device string (no "hid-over-i2c" fallback) and infer the timings
> > >    and hid-descr-addr from there.
> >
> > And that's a big NACK from a maintainer point of view. I know in the
> > device tree world these strings are important so that people can just
> > say "I have a device compatible with X", and go on, but in the HID
> > world that means we will have to implement one compatible struct per
> > vendor/device, which is not something I want to do.
>
> It's not really any different than PCI and USB VID/PIDs.

Well, it is, because in the USB (HID) world, there is a specification
that provides all of the entry points a device needs. In the i2c-hid
case, the only entry point a device needs, in the ACPI world is one
register address, and this is provided by ACPI itself. So in the ACPI
world, for i2c-hid devices, we don't need to recompile the driver to
support any current or new devices.

>
> > You can think of it as if you are suddenly saying that because it
> > would be easier for a few particular USB devices that need a quirk,
> > you "just" need to add the list of *all* USB HID devices that are
> > around. i2c-hid should be a driver that doesn't change unless 2 things
> > happen:
> > - there is a change in the spec
> > - there is a specific quirk required for a device that doesn't follow the spec.
>
> Or does something outside of what the spec covers.

This is solved in the ACPI case by running ACPI callbacks, and I am
more and more thinking we should mimic that for DT devices.

>
> > So if having device tree support for these means we suddenly need to
> > add every single device around in the compatible table, I would be
> > tempted to just drop the support for those new devices.
> >
> > Again, you (or anyone else) have to understand that the descriptor
> > address is just a parameter which is known at the manufacturing time,
> > but that can vary with different vendors and or products. In the ACPI
> > world, this parameter is provided in the DSDT, and there is no reason
> > for it to not be provided in the DT.
>
> Whether that makes sense as a standard 'hid-over-i2c' property is a
> separate discussion. Seems like it might be.

Actually it is not TBH. The spec doesn't mention that sleep time (or
the reset line FWIW), so it shouldn't even be seen by i2c-hid. But I
accepted maybe too much parametrization on i2c-hid, and now is
probably the time we take a step back and rewrite the code that goes
out of spec.

>
> It's trying to parameterize power sequencing to be generic and a never
> ending stream of quirk property additions that I'm against. That's based
> on the mistake of accepting those to some point in the past.
> hid-over-i2c is not special here.

Ack

>
> If we wanted to parameterize power control/sequences in DT, then we'd
> need to handle any number of controls (GPIO, regulators, clocks, power
> domains, register poking, firmware loading, etc.) in any order and
> amounts of time in between. What we'd end up needing is some programming
> language in DT (Forth anyone?).

Understood, and we are hitting the exact same problem here. The only
difference is that i2c-hid is already generic for anything but
power/reset, and this is what we are vehemently agreeing here :P

>
> > The last thing I want to see is people using device tree having to
> > recompile i2c-hid to register their own device.
>
> That's fine if they don't need extra things like power control...
>
> > If this part of the Device Tree binding is so important for the DT
> > world, then we should split up the DT bindings from i2c-hid, and have
> > some platform driver that would handle a conversion between devicetree
> > and platform data. But this driver won't be maintained by me.
> >
> > I agree adding the various sleep parameters in the platform data is
> > not good, but I prefer that over having to maintain an endless table
> > of parameters for every single i2c-hid device out there.
>
> How is match data any different from platform data? It not other than

The platform data is filled by ACPI based on the DSDT, and only a few
options are used: HID descriptor register address and irq IIRC.

The other platform data options were added more specifically to work
around the fact that DT doesn't have the language mentioned above, and
that's where dragons are coming in.

> one is all in the same file and the other adds a bunch of boilerplate
> and a pointless driver. If it's really such a maintainer burden, then
> perhaps the driver model could learn how to add match entries
> dynamically or from multiple sources (like a 2nd file of ids and
> data). Just throwing out ideas here...

I couldn't agree more (see my comment in patch 3/3 at
https://patchwork.kernel.org/project/linux-input/patch/20201023162220.v2.3.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid/#23723561
in case you were not cc-ed).

Ideally, we should split out anything DT related in the i2c-hid code,
and work around it in the same "hidden" way ACPI is: have a few
functions that could be overridden when entering into full power, or
sleep. This code could be then maintained separately from the generic
code, and we would be able to have some compatible definitions there,
without polluting the other devices. And as you mentioned, maybe we
could make this dynamic.

I honestly wish we could have this as a separate module that would be
in charge of the DT folks, but already having it as a separate file
would be a win.

Cheers,
Benjamin

>
> Rob
>

