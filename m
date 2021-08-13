Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D39BB3EB342
	for <lists+linux-input@lfdr.de>; Fri, 13 Aug 2021 11:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239035AbhHMJQg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Aug 2021 05:16:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:35286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239500AbhHMJQg (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Aug 2021 05:16:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61F3A6104F;
        Fri, 13 Aug 2021 09:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628846169;
        bh=f/mrxsCpa4Bi21QBSYD20oz9d43sAthk5IDvd6342Lk=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=gdSIg7SU0MKwRjQDJCh38cSJJsmTev2Wj1DiAyIJDYo4Mc26X6Rnh8z7ZxAirhDLS
         +fAtEbj0T2FFIUyMA3PbAMBbv8veZW4w8sMuN7ubUGENVZ+rZUER+jdaMpDCcG405u
         UFbhZZtJNhAF0e3c9XpzgVTgqtYu/lYR7yODpoQ43me7SLqpLmEiSuLtz4s85wv1+Q
         9huBsI437fq4CMgGRjGj6U2YRSPaKXM9MrV5v60gnW22ujzsYoZAy0mHImvBYDP4iZ
         Sj0EghKxROKFGSU5miwu4Yu4svsT5Mv6qFvY20+vFGMeW27gng7+cV+rjCvDyTo4U/
         EjJ8XDb9aU1Kg==
References: <20210812001250.1709418-1-dmanti@microsoft.com>
 <CAO-hwJK1Jt+T_ZsvPj0=+hEt3XnALfnkmB++Kdk7bZV9FgE0Cg@mail.gmail.com>
 <87lf56inxm.fsf@kernel.org>
 <CAO-hwJ+36wji=nWKxW-GFBj=o3yovr__3s+03SDdPHq1jO4WwQ@mail.gmail.com>
 <87eeayj5b3.fsf@kernel.org>
 <CAO-hwJL_gea6tRswrfWzZu5q1me10-C7sAy3fC4YYnTceV+nLA@mail.gmail.com>
User-agent: mu4e 1.6.2; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Dmitry Antipov <daantipov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        jeff.glaum@microsoft.com, Dmitry Antipov <dmanti@microsoft.com>
Subject: Re: [PATCH] HID: Support Microsoft Surface Duo SPI-based touch
 controller driver as a module.
Date:   Fri, 13 Aug 2021 11:55:10 +0300
In-reply-to: <CAO-hwJL_gea6tRswrfWzZu5q1me10-C7sAy3fC4YYnTceV+nLA@mail.gmail.com>
Message-ID: <87bl61k8mh.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Hi,

Benjamin Tissoires <benjamin.tissoires@redhat.com> writes:
>> Benjamin Tissoires <benjamin.tissoires@redhat.com> writes:
>> >> > On Thu, Aug 12, 2021 at 2:13 AM Dmitry Antipov <daantipov@gmail.com> wrote:
>> >> >>
>> >> >> Surface Duo uses a touch digitizer that communicates to the main SoC via SPI
>> >> >> and presents itself as a HID device. This patch contains the changes needed
>> >> >> for the driver to work as a module: HID Core affordances for SPI devices,
>> >> >> addition of the new Device IDs, and a new quirk in hid-microsoft. The driver
>> >> >> itself is being prepared for a submission in the near future.
>> >> >>
>> >> >> Signed-off-by: Dmitry Antipov dmanti@microsoft.com
>> >> >
>> >> > Though I really appreciate seeing a microsoft.com submission, the
>> >> > commit description makes me wonder if we should not postpone the
>> >> > inclusion of this patch with the "submission in the near future".
>> >> >
>> >> > AFAIK, HID is not SPI aware. So basically, we are introducing dead
>> >> > code in the upstream kernel if we take this patch.
>> >>
>> >> Right, unfortunately spec isn't public yet (albeit having products
>> >> shipped using it and a driver available in a public tree somewhere I
>> >> couldn't find).
>> >>
>> >> I _do_ have one question though:
>> >>
>> >> Is there a way to tell hid core that $this device wants hidraw? If we
>> >
>> > Depending on what you want and can do I can think of several solutions:
>> > - add a quirk for this device (either at boot time, either in
>> > hid-quirks.c) There must be one that tells to only bind to hidraw
>> > - provide an out of the tree driver that declares the BUS:VID:PID, and
>> > start the HID device with HIDRAW only.
>>
>> sounds good
>
> I did some more digging this morning.
>
> The quirk option is not especially good, there is no "hidraw only" quirk.
> However, there is a "HID_QUIRK_HAVE_SPECIAL_DRIVER" that prevents
> hid-generic from binding to your device. This has the same effect as
> adding the device in the hid-quirks.c in this submission, so for
> development purposes, if the device is messed up by hid-generic, I
> would advise to add this quirk (maybe from the development spi
> transport driver as a temporary work around).
>
> To have the device bound to hidraw only, then yes, if you provide a
> simple out of the tree module that binds to this module, hid-generic
> will release the device and let this out of the tree module deal with
> it.
>
> AFAICT, the hid-core changes you are asking here should not block the
> development process if they are not merged. You'll get an "UNKOWN" bus
> in the logs, and the SPI_HID_DEVICE macro can be defined in the out of
> the tree driver.

that's correct, indeed.

>> >> remove the hid-microsoft changes, hid-generic will pick the device as
>> >> expected, but this really needs hidraw. Any hints?
>> >
>> > I am fine with the hid-microsoft changes, I just want them in a
>> > separate commit. But I don't see why we would take only the first one
>> > without the SPI transport and the hid-microsoft code...
>> >
>> > Basically: not sure why you need hidraw for it.
>>
>> Yeah, the touch controller is "peculiar". It sends to the host raw
>> frames which needs to be processed by a userspace application. We don't
>> get coordinates, pressure, etc. We get raw values from the touch
>> digitizer; these are passed to a daemon which runs your usual filters
>> (palm rejection, denoising, yada yada yada) and produces the actual
>> touch inputs. Those are, in turn, given to uinput.
>>
>
> In that case, maybe hidraw is not the best way to forward the events.
>
> V4L has a capability to export raw touch events. You can have a look
> at drivers/input/rmi4/rmi_f54.c, drivers/input/touchscreen/sur40.c or
> drivers/input/touchscreen/atmel_mxt_ts.c for some examples.
> The nice thing is you'll get parallel processing and DMA between the
> kernel and userspace. Also, there must be userspace tools around that
> are already capable of dealing with that kind of input. Though I also
> understand the need to have your own sauce.

Right, I saw those but I'm not sure it applies to spi-hid. OTOH, maybe
spi-hid is just a dumb transport and the V4L2 interface would be
implemented in a hid-microsoft-surface.c driver, or something.

Just to make things clear, the way spi-hid works is like shown
below. First the enumeration phase:

1. power on & reset deassert
2. device asserts interrupt
3. Linux sends ack
4. device responds with a header
5. Linux sends ack (containing body size)
6. device responds with Reset Response
7. Linux requests device descriptor
8. device asserts interrupts
9. Linux sends ack
11. device responds with header
12. Linux sends ack (with body size)
13. device responds with device descriptor

Then an actual transfer.

1. User touches the digitizer
2. device asserts interrupt
3. Linux sends ack
4. device responds with a header
5. Linux sends ack (containing body size)
6. device responds with Data packet (raw digitizer matrix read)

As you can see, there's no polling at a constant rate. Everything is
driven by the device's interrrupts. Also, this is a transport layer
meaning we can have a touch controller, or a keyboard, or a joystick, or
whatever HID device on top of this.

There are also some "hazards" allowed by the spec. For example, the
interrupt is edge triggered and the interrupt can be reasserted after
completion of the ACK prior to the body data portion. I.e., the
following is perfectly valid behavior (assuming rising edge IRQs):

        __                __     ____
IRQ  __/  \______________/  \___/    \_______

         ACK              ACK
MOSI __/XXXXX\__________/XXXXX\______________

                 header             body
MISO ___________/XXXXXX\_________/XXXXXXXX\__


There's also the possibility that the device can reset at any time. The
spec calls these "Device Initiated Reset". The idea for this is to cope
with e.g. such as static discharge causing the touch controller to
reset and so on.

These two little features make it rather hard to make sure that Linux
won't loose any interrupt events and still deal with the fact that the
device can reset at unexpected times. The way we've been dealing with
this in the past was to teardown and recreate the HID device from
scratch. This can result in race conditions between the IRQ handler and
a workqueue which offloads the work of recreating the device. There's a
possibility of race between kernel and userspace here.

Remember that we don't know, ahead of time, which device is attached to
the bus, we have to fetch the device descriptor to get VID/PID pair in
order to start the entire machinery.

I'm saying this because it's very likely that when we submit this driver
publicly (after cleaning it up a bit) we end up creating a bigger
discussion of how to support this new transport layer. We'll work
through the comments, of course, but at the same time we want to reduce
the amount of out-of-tree code we're keeping (for reasons which should
be obvious :-)

That being said, we'll have a look at the V4L2 interface for touch
devices and check how well it would fit for our touch controller :-)

cheers

-- 
balbi
