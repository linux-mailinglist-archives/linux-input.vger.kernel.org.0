Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE033EB3C9
	for <lists+linux-input@lfdr.de>; Fri, 13 Aug 2021 12:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239972AbhHMKEy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Aug 2021 06:04:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41520 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239757AbhHMKEx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Aug 2021 06:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628849066;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2nfTEA0LaNfzBk1GXvlK+EZgoVX/sNCovieyp7JwaT0=;
        b=jNJEYeSn2yavJ6LnTYJmh2VovFr8+imXbdTTd8wlmXAQlxXqZQ86EpH0ZPcmH0W9t9c9n2
        uglC4RDmJhpX7T73B0AT/Jnh3tGRTbf70XFpK57lZzizn/2Th9L9Czh+VCIjcbHAiONdRa
        6Gy2t3GMOiDSohbQz655zj08CfiavD0=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-l6ALiLq3NXiYisH8ofGieg-1; Fri, 13 Aug 2021 06:04:25 -0400
X-MC-Unique: l6ALiLq3NXiYisH8ofGieg-1
Received: by mail-pl1-f197.google.com with SMTP id u6-20020a170902bf46b029012c971d6226so4611283pls.21
        for <linux-input@vger.kernel.org>; Fri, 13 Aug 2021 03:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2nfTEA0LaNfzBk1GXvlK+EZgoVX/sNCovieyp7JwaT0=;
        b=QCBtCqxde9ljynDElKNoaUoIsAOr4P6SKaojIU8KkSVume8Fzno5hDmhTk4LgdQi7w
         T6ktJEd/H/Hd59698JnFYOjL7VUUrevGQ8v3QeN0d1vDTpsSYIsvb+Uos7vJpViOH27g
         3guZZFohEx5Lv/LZvEBHrdS/p+IkGPHFVlrZalWDzKLPkmwYWpxXU87GgT0w0DSSUP8T
         PmND7Vpr5uC44htvIwdLOsplSqVYPb31w3BALQbSu8FnmIHsvGkLOG7nB11ARS9Vvnwa
         JJoWGC24msElsUL5wNh+TZG4s/PUEOz8FjaLnnUSjJiCzEFofwJUNUE+EZQQ6xzIlofY
         57AQ==
X-Gm-Message-State: AOAM530zJxFJ2rB1V5dqcRihMMmLFv5MgrutrsZT5q+LnnI6LdOwUYVS
        Vht5R8p5wJqnbUv4K3mqfAYy74k8p0RGal7MNHcw5RenAyY3ALN5uE8PsDJazGaQxbL9zGoR1Wa
        hxs8a4VAbbmY9x55Qy7ZBCAJCGtqaKmeMPmHnOLs=
X-Received: by 2002:a65:6894:: with SMTP id e20mr1597165pgt.419.1628849064151;
        Fri, 13 Aug 2021 03:04:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiJLz4Fl4ntbHi4AZFdsbpbfGFPNEnUOHmSo564ez979EtDg3yh4SJfj/Abe7Bh+bL4VdcvWxAksg3EH8KQfc=
X-Received: by 2002:a65:6894:: with SMTP id e20mr1597153pgt.419.1628849063830;
 Fri, 13 Aug 2021 03:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210812001250.1709418-1-dmanti@microsoft.com>
 <CAO-hwJK1Jt+T_ZsvPj0=+hEt3XnALfnkmB++Kdk7bZV9FgE0Cg@mail.gmail.com>
 <87lf56inxm.fsf@kernel.org> <CAO-hwJ+36wji=nWKxW-GFBj=o3yovr__3s+03SDdPHq1jO4WwQ@mail.gmail.com>
 <87eeayj5b3.fsf@kernel.org> <CAO-hwJL_gea6tRswrfWzZu5q1me10-C7sAy3fC4YYnTceV+nLA@mail.gmail.com>
 <87bl61k8mh.fsf@kernel.org>
In-Reply-To: <87bl61k8mh.fsf@kernel.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 13 Aug 2021 12:04:12 +0200
Message-ID: <CAO-hwJKG_Gy-2znZ6zbdLCK91hx5prsAr65akSicRH04TKfpbw@mail.gmail.com>
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

On Fri, Aug 13, 2021 at 11:16 AM Felipe Balbi <balbi@kernel.org> wrote:
>
>
> Hi,
>
> Benjamin Tissoires <benjamin.tissoires@redhat.com> writes:
> >> Benjamin Tissoires <benjamin.tissoires@redhat.com> writes:
> >> >> > On Thu, Aug 12, 2021 at 2:13 AM Dmitry Antipov <daantipov@gmail.com> wrote:
> >> >> >>
> >> >> >> Surface Duo uses a touch digitizer that communicates to the main SoC via SPI
> >> >> >> and presents itself as a HID device. This patch contains the changes needed
> >> >> >> for the driver to work as a module: HID Core affordances for SPI devices,
> >> >> >> addition of the new Device IDs, and a new quirk in hid-microsoft. The driver
> >> >> >> itself is being prepared for a submission in the near future.
> >> >> >>
> >> >> >> Signed-off-by: Dmitry Antipov dmanti@microsoft.com
> >> >> >
> >> >> > Though I really appreciate seeing a microsoft.com submission, the
> >> >> > commit description makes me wonder if we should not postpone the
> >> >> > inclusion of this patch with the "submission in the near future".
> >> >> >
> >> >> > AFAIK, HID is not SPI aware. So basically, we are introducing dead
> >> >> > code in the upstream kernel if we take this patch.
> >> >>
> >> >> Right, unfortunately spec isn't public yet (albeit having products
> >> >> shipped using it and a driver available in a public tree somewhere I
> >> >> couldn't find).
> >> >>
> >> >> I _do_ have one question though:
> >> >>
> >> >> Is there a way to tell hid core that $this device wants hidraw? If we
> >> >
> >> > Depending on what you want and can do I can think of several solutions:
> >> > - add a quirk for this device (either at boot time, either in
> >> > hid-quirks.c) There must be one that tells to only bind to hidraw
> >> > - provide an out of the tree driver that declares the BUS:VID:PID, and
> >> > start the HID device with HIDRAW only.
> >>
> >> sounds good
> >
> > I did some more digging this morning.
> >
> > The quirk option is not especially good, there is no "hidraw only" quirk.
> > However, there is a "HID_QUIRK_HAVE_SPECIAL_DRIVER" that prevents
> > hid-generic from binding to your device. This has the same effect as
> > adding the device in the hid-quirks.c in this submission, so for
> > development purposes, if the device is messed up by hid-generic, I
> > would advise to add this quirk (maybe from the development spi
> > transport driver as a temporary work around).
> >
> > To have the device bound to hidraw only, then yes, if you provide a
> > simple out of the tree module that binds to this module, hid-generic
> > will release the device and let this out of the tree module deal with
> > it.
> >
> > AFAICT, the hid-core changes you are asking here should not block the
> > development process if they are not merged. You'll get an "UNKOWN" bus
> > in the logs, and the SPI_HID_DEVICE macro can be defined in the out of
> > the tree driver.
>
> that's correct, indeed.
>
> >> >> remove the hid-microsoft changes, hid-generic will pick the device as
> >> >> expected, but this really needs hidraw. Any hints?
> >> >
> >> > I am fine with the hid-microsoft changes, I just want them in a
> >> > separate commit. But I don't see why we would take only the first one
> >> > without the SPI transport and the hid-microsoft code...
> >> >
> >> > Basically: not sure why you need hidraw for it.
> >>
> >> Yeah, the touch controller is "peculiar". It sends to the host raw
> >> frames which needs to be processed by a userspace application. We don't
> >> get coordinates, pressure, etc. We get raw values from the touch
> >> digitizer; these are passed to a daemon which runs your usual filters
> >> (palm rejection, denoising, yada yada yada) and produces the actual
> >> touch inputs. Those are, in turn, given to uinput.
> >>
> >
> > In that case, maybe hidraw is not the best way to forward the events.
> >
> > V4L has a capability to export raw touch events. You can have a look
> > at drivers/input/rmi4/rmi_f54.c, drivers/input/touchscreen/sur40.c or
> > drivers/input/touchscreen/atmel_mxt_ts.c for some examples.
> > The nice thing is you'll get parallel processing and DMA between the
> > kernel and userspace. Also, there must be userspace tools around that
> > are already capable of dealing with that kind of input. Though I also
> > understand the need to have your own sauce.
>
> Right, I saw those but I'm not sure it applies to spi-hid. OTOH, maybe
> spi-hid is just a dumb transport and the V4L2 interface would be
> implemented in a hid-microsoft-surface.c driver, or something.

Right. I think you said it all there: spi-hid is the transport layer,
then all per-device logic/behaviour needs to be in the hid driver :)
So V4L2 should go into hid-microsoft.c (or another one if that makes
it too hard to melt the 2 together).

>
> Just to make things clear, the way spi-hid works is like shown
> below. First the enumeration phase:
>
> 1. power on & reset deassert
> 2. device asserts interrupt
> 3. Linux sends ack
> 4. device responds with a header
> 5. Linux sends ack (containing body size)
> 6. device responds with Reset Response
> 7. Linux requests device descriptor
> 8. device asserts interrupts
> 9. Linux sends ack
> 11. device responds with header
> 12. Linux sends ack (with body size)
> 13. device responds with device descriptor
>
> Then an actual transfer.
>
> 1. User touches the digitizer
> 2. device asserts interrupt
> 3. Linux sends ack
> 4. device responds with a header
> 5. Linux sends ack (containing body size)
> 6. device responds with Data packet (raw digitizer matrix read)
>
> As you can see, there's no polling at a constant rate. Everything is
> driven by the device's interrrupts. Also, this is a transport layer
> meaning we can have a touch controller, or a keyboard, or a joystick, or
> whatever HID device on top of this.

Yes, this is pretty much like i2c-hid.

>
> There are also some "hazards" allowed by the spec. For example, the
> interrupt is edge triggered and the interrupt can be reasserted after
> completion of the ACK prior to the body data portion. I.e., the
> following is perfectly valid behavior (assuming rising edge IRQs):
>
>         __                __     ____
> IRQ  __/  \______________/  \___/    \_______
>
>          ACK              ACK
> MOSI __/XXXXX\__________/XXXXX\______________
>
>                  header             body
> MISO ___________/XXXXXX\_________/XXXXXXXX\__
>
>
> There's also the possibility that the device can reset at any time. The
> spec calls these "Device Initiated Reset". The idea for this is to cope
> with e.g. such as static discharge causing the touch controller to
> reset and so on.
>
> These two little features make it rather hard to make sure that Linux
> won't loose any interrupt events and still deal with the fact that the
> device can reset at unexpected times. The way we've been dealing with
> this in the past was to teardown and recreate the HID device from
> scratch. This can result in race conditions between the IRQ handler and
> a workqueue which offloads the work of recreating the device. There's a
> possibility of race between kernel and userspace here.

Indeed, this is not ideal.
IIRC, i2c-hid also has to cope with device initiated resets, but I am
not sure I have seen them in real life. So I think we just paper over
it :(

>
> Remember that we don't know, ahead of time, which device is attached to
> the bus, we have to fetch the device descriptor to get VID/PID pair in
> order to start the entire machinery.

Yep, this is exactly what we have for I2C, USB and Bluetooth.

>
> I'm saying this because it's very likely that when we submit this driver
> publicly (after cleaning it up a bit) we end up creating a bigger
> discussion of how to support this new transport layer. We'll work
> through the comments, of course, but at the same time we want to reduce
> the amount of out-of-tree code we're keeping (for reasons which should
> be obvious :-)

Yeah, no worries. But again, spi-hid should just bring up the device
and forward the events.
Adding a mechanism to ensure the IRQs are not lost is probably its
responsibility, but deciding what to do in case of a device initiated
reset is not.
It should forward that information to HID core (maybe by adding a new
API in hid-core and in hid_drivers), and what needs to be done is
decided by the leaf driver (hid-microsoft).

I bet hid-generic doesn't care, but hid-microsoft (or hid-multitouch)
will. It will then be up to this driver to decide what to do.

Unfortunately, unless you work on i2c-hid to detect device initiated
resets we won't be able to accept a new HID API without users :(
However, nothing prevents you from the out-of-the-tree driver to add a
hook to hid-microsoft to directly call some internal API (but that
would not be upstreamable, of course).

>
> That being said, we'll have a look at the V4L2 interface for touch
> devices and check how well it would fit for our touch controller :-)

Thanks! The one thing I am not entirely sure is if V4L2 requires
polling. But with DMA, there is a chance we can just update the
buffers as the interrupts come in and let the V4L2 userspace client do
a regular polling (sorry, don't know enough of that area).

One last thing: please note that there is a HID test-suite at
https://gitlab.freedesktop.org/libevdev/hid-tools. Ideally, any change
in hid-core should have a matching test added there.
The test suite is using uhid, so that also means that you are welcome
to add surface tests there too (though there is no V4L2 support yet),
but beware that hid-microsoft should be entirely relying on HID for
communication and should not directly talk to SPI/USB/I2C because we
don't have those transport layers when emulating devices.

BTW, there is something I always wanted to use in HID but never found
a good implementation: eBPF. If V4L2 doesn't work with your needs, I
wonder if you could not get the raw events through BPF in your
userspace code. There is a chance you'll get a faster transfer rate
than using hidraw. Maybe.

Cheers,
Benjamin

>
> cheers
>
> --
> balbi
>

