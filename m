Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84CE53EC7B1
	for <lists+linux-input@lfdr.de>; Sun, 15 Aug 2021 08:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233827AbhHOG1c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Aug 2021 02:27:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:42900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231238AbhHOG1c (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Aug 2021 02:27:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77254604AC;
        Sun, 15 Aug 2021 06:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629008823;
        bh=cysp8KIrPvcit/KtdSQUoq6sd85l0Beo/ZLWB5WHkws=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=oUA50JeSrZWhlspcB/8XBI3FwOU1UiTDlEPPuOcVyph//QN9ywSXkz+KL0ARqxGAO
         AISMNgw9DxMxesxNVN3pHwd6HqUwsu3f9z9da2EgPvA046dycwAS/dz6PtJNkvPQBq
         E1H9nBer0mv4+KLAFwODiDuw2MRa/babTVRze9JpdNd3ILYjoDTr57EhopmmA9n83g
         RZQp0+Tjg2k3tD1DaLRJdFti4lBsIK049CJWuJckeBBBOed4Bzxzg+BQHJRrLQZEkp
         z/llxcr1JmU1y4FiF3o+lUu9vzcQGDftzNqceBQlE040qtxdN0qnBDuoKnZDkEae8N
         eR3ZMoSBSS1Aw==
References: <20210812001250.1709418-1-dmanti@microsoft.com>
 <CAO-hwJK1Jt+T_ZsvPj0=+hEt3XnALfnkmB++Kdk7bZV9FgE0Cg@mail.gmail.com>
 <87lf56inxm.fsf@kernel.org>
 <CAO-hwJ+36wji=nWKxW-GFBj=o3yovr__3s+03SDdPHq1jO4WwQ@mail.gmail.com>
 <87eeayj5b3.fsf@kernel.org>
 <CAO-hwJL_gea6tRswrfWzZu5q1me10-C7sAy3fC4YYnTceV+nLA@mail.gmail.com>
 <87bl61k8mh.fsf@kernel.org>
 <CAO-hwJKG_Gy-2znZ6zbdLCK91hx5prsAr65akSicRH04TKfpbw@mail.gmail.com>
User-agent: mu4e 1.6.3; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Dmitry Antipov <daantipov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        jeff.glaum@microsoft.com, Dmitry Antipov <dmanti@microsoft.com>
Subject: Re: [PATCH] HID: Support Microsoft Surface Duo SPI-based touch
 controller driver as a module.
Date:   Sun, 15 Aug 2021 09:18:39 +0300
In-reply-to: <CAO-hwJKG_Gy-2znZ6zbdLCK91hx5prsAr65akSicRH04TKfpbw@mail.gmail.com>
Message-ID: <87im072pfw.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Hi,

Benjamin Tissoires <benjamin.tissoires@redhat.com> writes:
>> Benjamin Tissoires <benjamin.tissoires@redhat.com> writes:
>> >> Benjamin Tissoires <benjamin.tissoires@redhat.com> writes:
>> >> >> > On Thu, Aug 12, 2021 at 2:13 AM Dmitry Antipov <daantipov@gmail.com> wrote:
>> >> >> >>
>> >> >> >> Surface Duo uses a touch digitizer that communicates to the main SoC via SPI
>> >> >> >> and presents itself as a HID device. This patch contains the changes needed
>> >> >> >> for the driver to work as a module: HID Core affordances for SPI devices,
>> >> >> >> addition of the new Device IDs, and a new quirk in hid-microsoft. The driver
>> >> >> >> itself is being prepared for a submission in the near future.
>> >> >> >>
>> >> >> >> Signed-off-by: Dmitry Antipov dmanti@microsoft.com
>> >> >> >
>> >> >> > Though I really appreciate seeing a microsoft.com submission, the
>> >> >> > commit description makes me wonder if we should not postpone the
>> >> >> > inclusion of this patch with the "submission in the near future".
>> >> >> >
>> >> >> > AFAIK, HID is not SPI aware. So basically, we are introducing dead
>> >> >> > code in the upstream kernel if we take this patch.
>> >> >>
>> >> >> Right, unfortunately spec isn't public yet (albeit having products
>> >> >> shipped using it and a driver available in a public tree somewhere I
>> >> >> couldn't find).
>> >> >>
>> >> >> I _do_ have one question though:
>> >> >>
>> >> >> Is there a way to tell hid core that $this device wants hidraw? If we
>> >> >
>> >> > Depending on what you want and can do I can think of several solutions:
>> >> > - add a quirk for this device (either at boot time, either in
>> >> > hid-quirks.c) There must be one that tells to only bind to hidraw
>> >> > - provide an out of the tree driver that declares the BUS:VID:PID, and
>> >> > start the HID device with HIDRAW only.
>> >>
>> >> sounds good
>> >
>> > I did some more digging this morning.
>> >
>> > The quirk option is not especially good, there is no "hidraw only" quirk.
>> > However, there is a "HID_QUIRK_HAVE_SPECIAL_DRIVER" that prevents
>> > hid-generic from binding to your device. This has the same effect as
>> > adding the device in the hid-quirks.c in this submission, so for
>> > development purposes, if the device is messed up by hid-generic, I
>> > would advise to add this quirk (maybe from the development spi
>> > transport driver as a temporary work around).
>> >
>> > To have the device bound to hidraw only, then yes, if you provide a
>> > simple out of the tree module that binds to this module, hid-generic
>> > will release the device and let this out of the tree module deal with
>> > it.
>> >
>> > AFAICT, the hid-core changes you are asking here should not block the
>> > development process if they are not merged. You'll get an "UNKOWN" bus
>> > in the logs, and the SPI_HID_DEVICE macro can be defined in the out of
>> > the tree driver.
>>
>> that's correct, indeed.
>>
>> >> >> remove the hid-microsoft changes, hid-generic will pick the device as
>> >> >> expected, but this really needs hidraw. Any hints?
>> >> >
>> >> > I am fine with the hid-microsoft changes, I just want them in a
>> >> > separate commit. But I don't see why we would take only the first one
>> >> > without the SPI transport and the hid-microsoft code...
>> >> >
>> >> > Basically: not sure why you need hidraw for it.
>> >>
>> >> Yeah, the touch controller is "peculiar". It sends to the host raw
>> >> frames which needs to be processed by a userspace application. We don't
>> >> get coordinates, pressure, etc. We get raw values from the touch
>> >> digitizer; these are passed to a daemon which runs your usual filters
>> >> (palm rejection, denoising, yada yada yada) and produces the actual
>> >> touch inputs. Those are, in turn, given to uinput.
>> >>
>> >
>> > In that case, maybe hidraw is not the best way to forward the events.
>> >
>> > V4L has a capability to export raw touch events. You can have a look
>> > at drivers/input/rmi4/rmi_f54.c, drivers/input/touchscreen/sur40.c or
>> > drivers/input/touchscreen/atmel_mxt_ts.c for some examples.
>> > The nice thing is you'll get parallel processing and DMA between the
>> > kernel and userspace. Also, there must be userspace tools around that
>> > are already capable of dealing with that kind of input. Though I also
>> > understand the need to have your own sauce.
>>
>> Right, I saw those but I'm not sure it applies to spi-hid. OTOH, maybe
>> spi-hid is just a dumb transport and the V4L2 interface would be
>> implemented in a hid-microsoft-surface.c driver, or something.
>
> Right. I think you said it all there: spi-hid is the transport layer,
> then all per-device logic/behaviour needs to be in the hid driver :)
> So V4L2 should go into hid-microsoft.c (or another one if that makes
> it too hard to melt the 2 together).

makes sense to me, thanks :-)

>> Just to make things clear, the way spi-hid works is like shown
>> below. First the enumeration phase:
>>
>> 1. power on & reset deassert
>> 2. device asserts interrupt
>> 3. Linux sends ack
>> 4. device responds with a header
>> 5. Linux sends ack (containing body size)
>> 6. device responds with Reset Response
>> 7. Linux requests device descriptor
>> 8. device asserts interrupts
>> 9. Linux sends ack
>> 11. device responds with header
>> 12. Linux sends ack (with body size)
>> 13. device responds with device descriptor
>>
>> Then an actual transfer.
>>
>> 1. User touches the digitizer
>> 2. device asserts interrupt
>> 3. Linux sends ack
>> 4. device responds with a header
>> 5. Linux sends ack (containing body size)
>> 6. device responds with Data packet (raw digitizer matrix read)
>>
>> As you can see, there's no polling at a constant rate. Everything is
>> driven by the device's interrrupts. Also, this is a transport layer
>> meaning we can have a touch controller, or a keyboard, or a joystick, or
>> whatever HID device on top of this.
>
> Yes, this is pretty much like i2c-hid.

true, I think i2c-hid doesn't require the IRQ for enumeration, though.

>> There are also some "hazards" allowed by the spec. For example, the
>> interrupt is edge triggered and the interrupt can be reasserted after
>> completion of the ACK prior to the body data portion. I.e., the
>> following is perfectly valid behavior (assuming rising edge IRQs):
>>
>>         __                __     ____
>> IRQ  __/  \______________/  \___/    \_______
>>
>>          ACK              ACK
>> MOSI __/XXXXX\__________/XXXXX\______________
>>
>>                  header             body
>> MISO ___________/XXXXXX\_________/XXXXXXXX\__
>>
>>
>> There's also the possibility that the device can reset at any time. The
>> spec calls these "Device Initiated Reset". The idea for this is to cope
>> with e.g. such as static discharge causing the touch controller to
>> reset and so on.
>>
>> These two little features make it rather hard to make sure that Linux
>> won't loose any interrupt events and still deal with the fact that the
>> device can reset at unexpected times. The way we've been dealing with
>> this in the past was to teardown and recreate the HID device from
>> scratch. This can result in race conditions between the IRQ handler and
>> a workqueue which offloads the work of recreating the device. There's a
>> possibility of race between kernel and userspace here.
>
> Indeed, this is not ideal.
> IIRC, i2c-hid also has to cope with device initiated resets, but I am
> not sure I have seen them in real life. So I think we just paper over
> it :(

yeah, the thing is that it _can_ happen :-) Imagine the user has some
considerable static charge (somewhat common during winter months, at
least) when they touch the screen they could discharge enough
electricity to cause a reset in the touch controller (sure, it's also a
function of HW design, but there's always a limit to protection
circuitry).

>> Remember that we don't know, ahead of time, which device is attached to
>> the bus, we have to fetch the device descriptor to get VID/PID pair in
>> order to start the entire machinery.
>
> Yep, this is exactly what we have for I2C, USB and Bluetooth.

Right

>> I'm saying this because it's very likely that when we submit this driver
>> publicly (after cleaning it up a bit) we end up creating a bigger
>> discussion of how to support this new transport layer. We'll work
>> through the comments, of course, but at the same time we want to reduce
>> the amount of out-of-tree code we're keeping (for reasons which should
>> be obvious :-)
>
> Yeah, no worries. But again, spi-hid should just bring up the device
> and forward the events.
> Adding a mechanism to ensure the IRQs are not lost is probably its
> responsibility, but deciding what to do in case of a device initiated
> reset is not.

I think this the key information that we "missed". We ended up trying to
treat the reset inside spi-hid and it's, well, hard :-)

> It should forward that information to HID core (maybe by adding a new
> API in hid-core and in hid_drivers), and what needs to be done is
> decided by the leaf driver (hid-microsoft).

fair enough. A device initiated reset will cause reenumeration,
btw. Shouldn't we just destroy the hid device?

> I bet hid-generic doesn't care, but hid-microsoft (or hid-multitouch)
> will. It will then be up to this driver to decide what to do.
>
> Unfortunately, unless you work on i2c-hid to detect device initiated
> resets we won't be able to accept a new HID API without users :(
> However, nothing prevents you from the out-of-the-tree driver to add a
> hook to hid-microsoft to directly call some internal API (but that
> would not be upstreamable, of course).

right, we're probably start working with what we have today.

>> That being said, we'll have a look at the V4L2 interface for touch
>> devices and check how well it would fit for our touch controller :-)
>
> Thanks! The one thing I am not entirely sure is if V4L2 requires
> polling. But with DMA, there is a chance we can just update the
> buffers as the interrupts come in and let the V4L2 userspace client do
> a regular polling (sorry, don't know enough of that area).

hmm, that may create problems. Because the touch controller is
forwarding raw buffers, the reports can get pretty big. IIRC, our
maximum input report size is 8kiB. If we assume 60Hz frequency on
digitizer sampling, that's 480kiB/sec of data (max).

> One last thing: please note that there is a HID test-suite at
> https://gitlab.freedesktop.org/libevdev/hid-tools. Ideally, any change
> in hid-core should have a matching test added there.
> The test suite is using uhid, so that also means that you are welcome
> to add surface tests there too (though there is no V4L2 support yet),
> but beware that hid-microsoft should be entirely relying on HID for
> communication and should not directly talk to SPI/USB/I2C because we
> don't have those transport layers when emulating devices.

nice, that's cool and will be helpful :-)

> BTW, there is something I always wanted to use in HID but never found
> a good implementation: eBPF. If V4L2 doesn't work with your needs, I
> wonder if you could not get the raw events through BPF in your
> userspace code. There is a chance you'll get a faster transfer rate
> than using hidraw. Maybe.

sounds fun, indeed. Need to check on availability of eBPF in the
downstream kernels.

-- 
balbi
