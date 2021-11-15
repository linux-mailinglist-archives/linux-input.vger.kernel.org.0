Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F9B4509A4
	for <lists+linux-input@lfdr.de>; Mon, 15 Nov 2021 17:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbhKOQeC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Nov 2021 11:34:02 -0500
Received: from mga17.intel.com ([192.55.52.151]:12244 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231872AbhKOQdr (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Nov 2021 11:33:47 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="214196699"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
   d="txt'?scan'208";a="214196699"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 08:30:51 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
   d="txt'?scan'208";a="644883195"
Received: from cbenthin-mobl.amr.corp.intel.com (HELO [10.249.34.66]) ([10.249.34.66])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 08:30:48 -0800
Subject: Re: [RFC 0/8] HID: add support for USI style pens
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
References: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
 <CAO-hwJ+=GL6MrJdh754bUF5_ciJqNvPxcLUstSLD+AfCH2VKdw@mail.gmail.com>
 <b5ff1493-e4a8-f652-604a-b97a68f35ced@linux.intel.com>
 <CAO-hwJL0keXdmRMTU6HHMBmaCROrR2jhoT_Z68dqa2xwbFOOpg@mail.gmail.com>
From:   Tero Kristo <tero.kristo@linux.intel.com>
Message-ID: <828f0b42-2878-118c-f424-57c690f062c6@linux.intel.com>
Date:   Mon, 15 Nov 2021 18:30:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJL0keXdmRMTU6HHMBmaCROrR2jhoT_Z68dqa2xwbFOOpg@mail.gmail.com>
Content-Type: multipart/mixed;
 boundary="------------22D4392629C051B756244171"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a multi-part message in MIME format.
--------------22D4392629C051B756244171
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Benjamin,

On 09/11/2021 19:02, Benjamin Tissoires wrote:
> Hi Tero,
>
> On Mon, Nov 8, 2021 at 8:44 AM Tero Kristo <tero.kristo@linux.intel.com> wrote:
>> Hi Benjamin,
>>
>> Thanks for your feedback! Couple of quick replies below.
>>
>> On 05/11/2021 20:22, Benjamin Tissoires wrote:
>>> Hi Tero,
>>>
>>> [just a quick note, I am supposed to be on holiday this week]
>>>
>>> On Thu, Nov 4, 2021 at 2:38 PM Tero Kristo <tero.kristo@linux.intel.com> wrote:
>>>> Hi,
>>>>
>>>> This series is an RFC for USI (Universal Stylus Interface) style pen
>>>> support. This is based on documentation from USB org describing the HID
>>>> usage tables for digitizers (page 0x0D) and experimentation with actual
>>>> USI capable controllers.
>>>>
>>>> This series introduces the USI support with a new HID driver, which
>>>> applies the controller specific quirks. The most problematic part of the
>>>> USI support is handling of the pen parameters (color, line width, line
>>>> style), which are not immediately available from the controller from pen
>>>> down event, but must be cached and queried separately from the controller.
>>>> In addition to that, when a get-feature report is sent to the
>>>> controller, there is a delay before the proper value is reported out; it
>>>> is not part of the feature report coming back immediately.
>>>> Most of the code in the driver is to handle this (otherwise we could
>>>> just use hid-generic.)
>>>>
>>>> This also boils down to the reason why this series is an RFC, I would like
>>>> to receive some feedback which option to pick for programming of the new
>>>> values for the programmable pen parameters; whether to parse the input
>>>> events so userspace can directly write the new values to the input event
>>>> file handle, or whether to use IOCTL. Patches #7 / #8 are sort of optional
>>>> choices towards this, but are there to show that both approaches can be
>>>> done. Direct write to evdev causes some confusion on the driver level
>>>> though, thus patch #7 is there to avoid some of that introducing new
>>>> input events for writing the parameters. IOCTL might be the cleanest
>>>> approach and I am slightly leaning towards that myself (see patch #8,
>>>> this would need to be squashed and cleaned up a bit though but would
>>>> effectively get rid of some code from patch #6 and completely rid patch #7.)
>>> This series unfortunately raised quite a few red flags for me, and I
>>> am glad this is just an RFC.
>>> Let me enumerate them first and discuss a little bit more about those:
>>>    1. USI is supposed to be generic, so why is there a new driver for it
>>> instead of being handled by hid-input.c?
>>>    2. new MSC_EVENTS are created without Dmitry or Peter being CC-ed
>>>    3. new ioctls???
>>>    4. direct write to evdev to write parameters
>>>    5. patch 1/8 doesn't compile without 5/8
>>>    6. no tests :)
>>>
>>> 1. new driver
>>> After quickly reading the RFC, I think the main issue there is that we
>>> are now having a transducer index which is incompatible with the way
>>> input and evedev works nowadays. Yay, we have a new hid-multitouch for
>>> pen :(
>>>
>>> Wacom has been dealing with that situation for years by tweaking the
>>> protocol and by just emitting a different serial number (roughly). I
>>> think the safest approach would be to keep the existing protocol
>>> running so that our user space can handle it properly.
>>>
>>> I'd need to read the rest of the code more carefully, but if we could
>>> have a basic generic handling (without the fancy features like
>>> changing the pen style/color) I'd be happier.
>> The USI pen support is partially compatible with existing input
>> framework, e.g. co-ordinates + touch events work out of box with
>> no-modification to the kernel whatsoever, just by using hid-generic
>> driver. What is missing completely is the new features;
>> color/width/style. It would be possible to move all these to the
>> hid-input driver obviously, I don't think there is anything to prevent
>> that. And, I could split up the series so that in the initial patches we
>> would only support reporting current color/width/style parameters, and
>> add the programmability as a subsequent patch if that would be better.
>> It would also be possible to move parts of the code to the input
>> subsystem from HID (some initial patches from our side were done this
>> way, but I don't think this is necessary.)
> I think I'd like to see the common behavior in hid-input.c, yes. This
> is mostly because other drivers will be able to use that for free
> (hid-multitouch for devices that are both touch and pen capable for
> instance).
I have looked at this a bit now, and mostly the initial patches in this 
series are good for the purpose, just need to ditch #6+ and replace 
those with something for programming the pen parameters via BPF. I will 
clean up whatever I have atm and post that as RFCv2.
> We can deal with the programmability from userspace later.
>
> As for merging part of the code from HID to input, I'd like to see
> what you are talking about.

The split was mostly for programming the pen parameters. It had 
callbacks to hid-core though, and the API wasn't too clean between 
hid<->input subsystem in this case. Anyways, if BPF is preferred way to 
handle the programming of pen parameters, this split between hid<->input 
is not needed.

>
>>> 2. MSC_* events
>>> there is an issue with those: they are not cached like the ABS_* ones.
>>> Meaning that each report will wake up userspace for something which
>>> basically doesn't change.
>>> I know ABS_* is saturated, but I'd like to have reviews from others on
>>> what could be done here instead of just using MSC_* as a new ABS_*
>> In my tests, it seems like MSC_* from the USI pens with these patches
>> only get reported to userspace if something changes. Otherwise they do
>> not get through at all. I have a small quirk in the driver to address
>> this for a case where a new userspace handle is opened while pen is
>> already in use; it does not get the params reported at all unless I
>> flush the current entries out (by reporting a bogus value followed
>> immediately by the real value.) Anyways, ABS events would be fine for
>> the parameters also I believe if this is desirable.
> That is by design. When a userspace program opens a device node, it
> has to query its current state by running a few ioctls.
> We have libevdev for that that simplifies everything for the userspace.
> libevdev does a lot more than just that, and every userspace program
> should use it to not have to deal with SYN_DROPPED and other
> subtleties in the protocol.

Ok, that seems fine. I need to check how to compile / patch libevdev 
myself to accommodate the changes needed. What is your recommendation 
for the pen events? Use ABS_x at the end of range (0x40+), or stay with 
MSC_x? Either way, I need to allocate some event numbers for these.

>
>>> 3. ioctls
>>> this is problematic to me. Any new kernel ABI is problematic to me,
>>> and I'd much rather not add any new ones.
>> I agree I am torn between the ioctl / direct evdev write. Both have
>> their bad sides to them, thus I provided sort of support for both. :)
>>> My new set of mind is because of the recent work I have been
>>> conducting regarding eBPF.
>>> Basically I managed to have eBPF programs handling the device
>>> configuration and event processing in a local branch.
>>> I should be able to push a WIP next week, but basically this should
>>> allow me to not have to deal with new kernel APIs besides the generic
>>> eBPF one.
>>> We can imagine a generic hid-input.c processing for those tablets, and
>>> have a new userspace component that loads an eBPF program with its own
>>> userspace API which is capable of the fancy features.
>>>
>>> For instance, my current playground is setting the haptic feedback of
>>> the Surface Dial depending on the resolution I set on it.
>>>
>>> Furthermore, ioctls on a new cdev means that the classic userspace
>>> libraries will not have access to it without some heavy tuning in the
>>> systemd space (libinput only has read/write access to
>>> /dev/input/event*).
>> So, you are saying it would be possible to use this to support the USI
>> pen parameters also somehow? I can take a look at this once available.
> Yeah, basically once you load the ebpf program in the kernel, you have
> a shared memory with userspace that you can use to create your own
> API.
> You could even ditch entirely the input subsystem and do the
> processing in the eBPF program and pull the data from that shared
> memory.
>
> The way I see is the following:
> - hid-tools (or maybe an other repo, not sure there) is responsible
> for holding the list of bpf programs that we need to maintain (it's
> the new upstream for those kind of quirks)
> - we have one or more userspace program to load those eBPF program as
> an intrinsic in udev
> - those userspace program could be a one shot (attach a bpf program,
> pin it and return)
> - but userspace program could also present any RPC mechanism (dbus,
> unix pipe, etc)
>
> The advantage here is that we can control the API from the userspace:
> if we do not use it anymore, we can just ditch the eBPF program (or
> not load it). We can also rely on classic lib versioning or dbus
> versioning.
>
> I just pushed a branch "hid-bpf-2" at
> https://gitlab.freedesktop.org/bentiss/hid/-/commits/hid-bpf-2 with
> the first examples. The interesting commits are between the tip and
> the `build` branch.

I did experiment with this a bit, and looked at the code. So, it seems 
like there is possibility for raw_event re-mapping which would be needed 
to fix some quirks for the current USI controllers, so it seems I can do 
whatever needed with the support available there. However, I did run 
into some problems while trying out the hid-bpf samples myself; they 
seem to fail either during the object load or bpf program attach phases. 
Are the new samples tested, and with what clang version? There seem to 
be plenty of pitfalls with the clang version used. And yes, at least 
some of the other programs under samples/bpf/ do work for me so I do 
believe I am compiling these properly.

>
>>> 4. direct write to evdev
>>>
>>> We enabled that once for LEDs, and it's a pain to maintain. Maybe we
>>> can make a use case for it but given that you don't seem very
>>> enthusiastic about it too, I wonder if this is not a dead end.
>> Well, we need to be able to program the pen parameters somehow from
>> userspace, I am open to any suggestions how this could/should be done.
>>> 5. patch ordering doesn't compile
>>> I guess this is just a rebase hiccup. Not an issue for an RFC
>> Yeah sorry about that. Will fix all those for next rev.
>>> 6. tests
>>> For these kinds of new classes of devices, I'd like to have tests in
>>> the https://gitlab.freedesktop.org/libevdev/hid-tools repository.
>>> There is already an initial MR for tablet support (!115 in this
>>> project), and we should extend it with more tests.
>> Ok I can take a look at these, thanks for the pointer. I am quite new to
>> the input side of things and have been using whatever I have been able
>> to craft myself, or found via googling.
>>> I'd happily help with those tests if you could share the report
>>> descriptors and some device dumps made with the hid-recorder tool from
>>> that repository.
>> Yeah, I can share these in your preferred format once I figure out the
>> test tools. I have been using some custom tools to parse things myself
>> so far (mostly kernel traces for both HID + I2C subsystem where my USI
>> controller is connected.)
> Maybe just add a new test in
> https://gitlab.freedesktop.org/libevdev/hid-tools/-/blob/master/tests/test_tablet.py
> like https://gitlab.freedesktop.org/libevdev/hid-tools/-/commit/7fa34c2c86e1380eb9c233422567b24a0fd6541f
>
> To extract the report descriptor, use `sudo hid-recorder` at the root
> of this repo, and copy the line starting with `R:` or use your
> favorite tool :).

Attached the rdesc for now, I can record things once we figure out which 
event codes to use (got the hid-tools working with my buildroot env.)

-Tero


>
> Cheers,
> Benjamin
>
>> -Tero
>>
>>>> The driver has been tested with chromebooks that contain either Goodix
>>>> or Elan manufactured USI capable touchscreen controllers in them.
>>>>
>>>> Any feedback appreciated!
>>> I'll try to have a deeper look next week (though it seems a few bits
>>> stacked up during my week off, sigh).
>>>
>>> Cheers,
>>> Benjamin
>>>
>>>> -Tero
>>>>
>>>>

--------------22D4392629C051B756244171
Content-Type: text/plain; charset=UTF-8;
 name="rdesc-acer.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="rdesc-acer.txt"

UjogMTE3NCAwNSAwZCAwOSAwNCBhMSAwMSA4NSAwMSAwOSAyMiBhMSAwMiAwOSA0MiAxNSAw
MCAyNSAwMSA3NSAwMSA5NSAwMSA4MSAwMiA3NSAwMSA4MSAwMyA3NSAwNiAwOSA1MSAyNSAz
ZiA4MSAwMiAyNiBmZiAwMCA3NSAwOCA1NSAwZiA2NSAxMSAzNSAwMCA0NSBmZiAwOSA0OCA4
MSAwMiAwOSA0OSA4MSAwMiAwOSAzMCA4MSAwMiA5NSAwMSAwNSAwMSBhNCAyNiBjZiAwZiA3
NSAxMCA1NSAwZiA2NSAxMSAwOSAzMCAzNSAwMCA0NiAyNiAwMSA5NSAwMSA4MSAwMiAyNiA3
NyAwYSA0NiBhNiAwMCAwOSAzMSA4MSAwMiBiNCBjMCAwNSAwZCAwOSAyMiBhMSAwMiAwNSAw
ZCAwOSA0MiAxNSAwMCAyNSAwMSA3NSAwMSA5NSAwMSA4MSAwMiA3NSAwMSA4MSAwMyA3NSAw
NiAwOSA1MSAyNSAzZiA4MSAwMiAyNiBmZiAwMCA3NSAwOCA1NSAwZiA2NSAxMSAzNSAwMCA0
NSBmZiAwOSA0OCA4MSAwMiAwOSA0OSA4MSAwMiAwOSAzMCA4MSAwMiA5NSAwMSAwNSAwMSBh
NCAyNiBjZiAwZiA3NSAxMCA1NSAwZiA2NSAxMSAwOSAzMCAzNSAwMCA0NiAyNiAwMSA5NSAw
MSA4MSAwMiAyNiA3NyAwYSA0NiBhNiAwMCAwOSAzMSA4MSAwMiBiNCBjMCAwNSAwZCAwOSAy
MiBhMSAwMiAwNSAwZCAwOSA0MiAxNSAwMCAyNSAwMSA3NSAwMSA5NSAwMSA4MSAwMiA3NSAw
MSA4MSAwMyA3NSAwNiAwOSA1MSAyNSAzZiA4MSAwMiAyNiBmZiAwMCA3NSAwOCA1NSAwZiA2
NSAxMSAzNSAwMCA0NSBmZiAwOSA0OCA4MSAwMiAwOSA0OSA4MSAwMiAwOSAzMCA4MSAwMiA5
NSAwMSAwNSAwMSBhNCAyNiBjZiAwZiA3NSAxMCA1NSAwZiA2NSAxMSAwOSAzMCAzNSAwMCA0
NiAyNiAwMSA5NSAwMSA4MSAwMiAyNiA3NyAwYSA0NiBhNiAwMCAwOSAzMSA4MSAwMiBiNCBj
MCAwNSAwZCAwOSAyMiBhMSAwMiAwNSAwZCAwOSA0MiAxNSAwMCAyNSAwMSA3NSAwMSA5NSAw
MSA4MSAwMiA3NSAwMSA4MSAwMyA3NSAwNiAwOSA1MSAyNSAzZiA4MSAwMiAyNiBmZiAwMCA3
NSAwOCA1NSAwZiA2NSAxMSAzNSAwMCA0NSBmZiAwOSA0OCA4MSAwMiAwOSA0OSA4MSAwMiAw
OSAzMCA4MSAwMiA5NSAwMSAwNSAwMSBhNCAyNiBjZiAwZiA3NSAxMCA1NSAwZiA2NSAxMSAw
OSAzMCAzNSAwMCA0NiAyNiAwMSA5NSAwMSA4MSAwMiAyNiA3NyAwYSA0NiBhNiAwMCAwOSAz
MSA4MSAwMiBiNCBjMCAwNSAwZCAwOSAyMiBhMSAwMiAwNSAwZCAwOSA0MiAxNSAwMCAyNSAw
MSA3NSAwMSA5NSAwMSA4MSAwMiA3NSAwMSA4MSAwMyA3NSAwNiAwOSA1MSAyNSAzZiA4MSAw
MiAyNiBmZiAwMCA3NSAwOCA1NSAwZiA2NSAxMSAzNSAwMCA0NSBmZiAwOSA0OCA4MSAwMiAw
OSA0OSA4MSAwMiAwOSAzMCA4MSAwMiA5NSAwMSAwNSAwMSBhNCAyNiBjZiAwZiA3NSAxMCA1
NSAwZiA2NSAxMSAwOSAzMCAzNSAwMCA0NiAyNiAwMSA5NSAwMSA4MSAwMiAyNiA3NyAwYSA0
NiBhNiAwMCAwOSAzMSA4MSAwMiBiNCBjMCAwNSAwZCAwOSA1NCAyNSA3ZiA5NiAwMSAwMCA3
NSAwOCA4MSAwMiA4NSAwYSAwOSA1NSAyNSAwYSBiMSAwMiA4NSA0NCAwNiAwMCBmZiAwOSBj
NSAxNiAwMCAwMCAyNiBmZiAwMCA3NSAwOCA5NiAwMCAwMSBiMSAwMiBjMCAwNiBmZiAwMSAw
OSAwMSBhMSAwMSA4NSAwMiAxNiAwMCAwMCAyNiBmZiAwMCA3NSAwOCA5NSA0MCAwOSAwMCA4
MSAwMiBjMCAwNiAwMCBmZiAwOSAwMSBhMSAwMSA4NSAwMyA3NSAwOCA5NSAyMCAwOSAwMSA5
MSAwMiBjMCAwNiAwMCBmZiAwOSAwMSBhMSAwMSA4NSAwNiAwOSAwMyA3NSAwOCA5NSAxMiA5
MSAwMiAwOSAwNCA3NSAwOCA5NSAwMyBiMSAwMiBjMCAwNiAwMSBmZiAwOSAwMSBhMSAwMSA4
NSAwNCAxNSAwMCAyNiBmZiAwMCA3NSAwOCA5NSAxMyAwOSAwMCA4MSAwMiBjMCAwNSAwZCAw
OSAwMiBhMSAwMSA4NSAwNyAzNSAwMCAwOSAyMCBhMSAwMCAwOSAzMiAwOSA0MiAwOSA0NCAw
OSAzYyAwOSA0NSAxNSAwMCAyNSAwMSA3NSAwMSA5NSAwNSA4MSAwMiA5NSAwMyA4MSAwMyAw
NSAwMSAwOSAzMCA3NSAxMCA5NSAwMSBhNCA1NSAwZiA2NSAxMSA0NiAyNiAwMSAyNiAxYyA0
OCA4MSA0MiAwOSAzMSA0NiBhNiAwMCAyNiBiYyAyZiA4MSA0MiBiNCAwNSAwZCAwOSAzMCAy
NiAwMCAxMCA4MSAwMiA3NSAwOCA5NSAwMSAwOSAzYiAyNSA2NCA4MSA0MiAwOSAzOCAxNSAw
MCAyNSAwMiA4MSAwMiAwOSA1YyAyNiBmZiAwMCA4MSAwMiAwOSA1ZSA4MSAwMiAwOSA3MCBh
MSAwMiAxNSAwMSAyNSAwNiAwOSA3MiAwOSA3MyAwOSA3NCAwOSA3NSAwOSA3NiAwOSA3NyA4
MSAyMCAwOSA1YiAyNSBmZiA3NSA0MCA4MSAwMiBjMCAwNiAwMCBmZiA3NSAwOCA5NSAwMiAw
OSAwMSA4MSAwMiBjMCAwNSAwZCA4NSA2MCAwOSA4MSBhMSAwMiAwOSAzOCA3NSAwOCA5NSAw
MSAxNSAwMCAyNSAwMiA4MSAwMiAwOSA4MSAxNSAwMSAyNSAwNCAwOSA4MiAwOSA4MyAwOSA4
NCAwOSA4NSA4MSAyMCBjMCA4NSA2MSAwOSA1YyBhMSAwMiAxNSAwMCAyNiBmZiAwMCA3NSAw
OCA5NSAwMSAwOSAzOCBiMSAwMiAwOSA1YyAyNiBmZiAwMCBiMSAwMiAwOSA1ZCA3NSAwMSA5
NSAwMSAyNSAwMSBiMSAwMiA5NSAwNyBiMSAwMyBjMCA4NSA2MiAwOSA1ZSBhMSAwMiAwOSAz
OCAxNSAwMCAyNSAwMiA3NSAwOCA5NSAwMSBiMSAwMiAwOSA1ZSAyNiBmZiAwMCBiMSAwMiAw
OSA1ZiA3NSAwMSAyNSAwMSBiMSAwMiA3NSAwNyBiMSAwMyBjMCA4NSA2MyAwOSA3MCBhMSAw
MiA3NSAwOCA5NSAwMSAxNSAwMCAyNSAwMiAwOSAzOCBiMSAwMiAwOSA3MCBhMSAwMiAyNSAw
NiAwOSA3MiAwOSA3MyAwOSA3NCAwOSA3NSAwOSA3NiAwOSA3NyBiMSAyMCBjMCAwOSA3MSA3
NSAwMSAyNSAwMSBiMSAwMiA3NSAwNyBiMSAwMyBjMCA4NSA2NCAwOSA4MCAxNSAwMCAyNSBm
ZiA3NSA0MCA5NSAwMSBiMSAwMiA4NSA2NSAwOSA0NCBhMSAwMiAwOSAzOCA3NSAwOCA5NSAw
MSAyNSAwMiBiMSAwMiAxNSAwMSAyNSAwMyAwOSA0NCBhMSAwMiAwOSBhNCAwOSA0NCAwOSA1
YSAwOSA0NSAwOSBhMyBiMSAyMCBjMCAwOSA1YSBhMSAwMiAwOSBhNCAwOSA0NCAwOSA1YSAw
OSA0NSAwOSBhMyBiMSAyMCBjMCAwOSA0NSBhMSAwMiAwOSBhNCAwOSA0NCAwOSA1YSAwOSA0
NSAwOSBhMyBiMSAyMCBjMCBjMCA4NSA2NiA3NSAwOCA5NSAwMSAwNSAwZCAwOSA5MCBhMSAw
MiAwOSAzOCAyNSAwMiBiMSAwMiAwOSA5MSA3NSAxMCAyNiBmZiAwZiBiMSAwMiAwOSA5MiA3
NSA0MCAyNSBmZiBiMSAwMiAwNSAwNiAwOSAyYSA3NSAwOCAyNiBmZiAwMCBhMSAwMiAwOSAy
ZCBiMSAwMiAwOSAyZSBiMSAwMiBjMCBjMCA4NSA2NyAwNSAwNiAwOSAyYiBhMSAwMiAwNSAw
ZCAyNSAwMiAwOSAzOCBiMSAwMiAwNSAwNiAwOSAyYiBhMSAwMiAwOSAyZCAyNiBmZiAwMCBi
MSAwMiAwOSAyZSBiMSAwMiBjMCBjMCA4NSA2OCAwNiAwMCBmZiAwOSAwMSBhMSAwMiAwNSAw
ZCAwOSAzOCA3NSAwOCA5NSAwMSAyNSAwMiBiMSAwMiAwNiAwMCBmZiAwOSAwMSA3NSAxMCAy
NyBmZiBmZiAwMCAwMCBiMSAwMiBjMCA4NSA2OSAwNSAwZCAwOSAzOCA3NSAwOCA5NSAwMSAx
NSAwMCAyNSAwMiBiMSAwMiBjMCAwNiAwMCBmZiAwOSA4MSBhMSAwMSA4NSAxNyA3NSAwOCA5
NSAxZiAwOSAwNSA4MSAwMiBjMAoKCg==
--------------22D4392629C051B756244171--
