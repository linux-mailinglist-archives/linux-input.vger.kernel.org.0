Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4391447B4A
	for <lists+linux-input@lfdr.de>; Mon,  8 Nov 2021 08:44:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236405AbhKHHrG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Nov 2021 02:47:06 -0500
Received: from mga07.intel.com ([134.134.136.100]:15775 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234009AbhKHHrF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Nov 2021 02:47:05 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10161"; a="295621650"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="295621650"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2021 23:44:21 -0800
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="641333695"
Received: from nlissex-mobl1.amr.corp.intel.com (HELO [10.249.33.10]) ([10.249.33.10])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2021 23:44:18 -0800
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
From:   Tero Kristo <tero.kristo@linux.intel.com>
Message-ID: <b5ff1493-e4a8-f652-604a-b97a68f35ced@linux.intel.com>
Date:   Mon, 8 Nov 2021 09:44:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJ+=GL6MrJdh754bUF5_ciJqNvPxcLUstSLD+AfCH2VKdw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

Thanks for your feedback! Couple of quick replies below.

On 05/11/2021 20:22, Benjamin Tissoires wrote:
> Hi Tero,
>
> [just a quick note, I am supposed to be on holiday this week]
>
> On Thu, Nov 4, 2021 at 2:38 PM Tero Kristo <tero.kristo@linux.intel.com> wrote:
>> Hi,
>>
>> This series is an RFC for USI (Universal Stylus Interface) style pen
>> support. This is based on documentation from USB org describing the HID
>> usage tables for digitizers (page 0x0D) and experimentation with actual
>> USI capable controllers.
>>
>> This series introduces the USI support with a new HID driver, which
>> applies the controller specific quirks. The most problematic part of the
>> USI support is handling of the pen parameters (color, line width, line
>> style), which are not immediately available from the controller from pen
>> down event, but must be cached and queried separately from the controller.
>> In addition to that, when a get-feature report is sent to the
>> controller, there is a delay before the proper value is reported out; it
>> is not part of the feature report coming back immediately.
>> Most of the code in the driver is to handle this (otherwise we could
>> just use hid-generic.)
>>
>> This also boils down to the reason why this series is an RFC, I would like
>> to receive some feedback which option to pick for programming of the new
>> values for the programmable pen parameters; whether to parse the input
>> events so userspace can directly write the new values to the input event
>> file handle, or whether to use IOCTL. Patches #7 / #8 are sort of optional
>> choices towards this, but are there to show that both approaches can be
>> done. Direct write to evdev causes some confusion on the driver level
>> though, thus patch #7 is there to avoid some of that introducing new
>> input events for writing the parameters. IOCTL might be the cleanest
>> approach and I am slightly leaning towards that myself (see patch #8,
>> this would need to be squashed and cleaned up a bit though but would
>> effectively get rid of some code from patch #6 and completely rid patch #7.)
> This series unfortunately raised quite a few red flags for me, and I
> am glad this is just an RFC.
> Let me enumerate them first and discuss a little bit more about those:
>   1. USI is supposed to be generic, so why is there a new driver for it
> instead of being handled by hid-input.c?
>   2. new MSC_EVENTS are created without Dmitry or Peter being CC-ed
>   3. new ioctls???
>   4. direct write to evdev to write parameters
>   5. patch 1/8 doesn't compile without 5/8
>   6. no tests :)
>
> 1. new driver
> After quickly reading the RFC, I think the main issue there is that we
> are now having a transducer index which is incompatible with the way
> input and evedev works nowadays. Yay, we have a new hid-multitouch for
> pen :(
>
> Wacom has been dealing with that situation for years by tweaking the
> protocol and by just emitting a different serial number (roughly). I
> think the safest approach would be to keep the existing protocol
> running so that our user space can handle it properly.
>
> I'd need to read the rest of the code more carefully, but if we could
> have a basic generic handling (without the fancy features like
> changing the pen style/color) I'd be happier.

The USI pen support is partially compatible with existing input 
framework, e.g. co-ordinates + touch events work out of box with 
no-modification to the kernel whatsoever, just by using hid-generic 
driver. What is missing completely is the new features; 
color/width/style. It would be possible to move all these to the 
hid-input driver obviously, I don't think there is anything to prevent 
that. And, I could split up the series so that in the initial patches we 
would only support reporting current color/width/style parameters, and 
add the programmability as a subsequent patch if that would be better. 
It would also be possible to move parts of the code to the input 
subsystem from HID (some initial patches from our side were done this 
way, but I don't think this is necessary.)

>
> 2. MSC_* events
> there is an issue with those: they are not cached like the ABS_* ones.
> Meaning that each report will wake up userspace for something which
> basically doesn't change.
> I know ABS_* is saturated, but I'd like to have reviews from others on
> what could be done here instead of just using MSC_* as a new ABS_*
In my tests, it seems like MSC_* from the USI pens with these patches 
only get reported to userspace if something changes. Otherwise they do 
not get through at all. I have a small quirk in the driver to address 
this for a case where a new userspace handle is opened while pen is 
already in use; it does not get the params reported at all unless I 
flush the current entries out (by reporting a bogus value followed 
immediately by the real value.) Anyways, ABS events would be fine for 
the parameters also I believe if this is desirable.
>
> 3. ioctls
> this is problematic to me. Any new kernel ABI is problematic to me,
> and I'd much rather not add any new ones.
I agree I am torn between the ioctl / direct evdev write. Both have 
their bad sides to them, thus I provided sort of support for both. :)
>
> My new set of mind is because of the recent work I have been
> conducting regarding eBPF.
> Basically I managed to have eBPF programs handling the device
> configuration and event processing in a local branch.
> I should be able to push a WIP next week, but basically this should
> allow me to not have to deal with new kernel APIs besides the generic
> eBPF one.
> We can imagine a generic hid-input.c processing for those tablets, and
> have a new userspace component that loads an eBPF program with its own
> userspace API which is capable of the fancy features.
>
> For instance, my current playground is setting the haptic feedback of
> the Surface Dial depending on the resolution I set on it.
>
> Furthermore, ioctls on a new cdev means that the classic userspace
> libraries will not have access to it without some heavy tuning in the
> systemd space (libinput only has read/write access to
> /dev/input/event*).

So, you are saying it would be possible to use this to support the USI 
pen parameters also somehow? I can take a look at this once available.

>
> 4. direct write to evdev
>
> We enabled that once for LEDs, and it's a pain to maintain. Maybe we
> can make a use case for it but given that you don't seem very
> enthusiastic about it too, I wonder if this is not a dead end.
Well, we need to be able to program the pen parameters somehow from 
userspace, I am open to any suggestions how this could/should be done.
>
> 5. patch ordering doesn't compile
> I guess this is just a rebase hiccup. Not an issue for an RFC
Yeah sorry about that. Will fix all those for next rev.
>
> 6. tests
> For these kinds of new classes of devices, I'd like to have tests in
> the https://gitlab.freedesktop.org/libevdev/hid-tools repository.
> There is already an initial MR for tablet support (!115 in this
> project), and we should extend it with more tests.
Ok I can take a look at these, thanks for the pointer. I am quite new to 
the input side of things and have been using whatever I have been able 
to craft myself, or found via googling.
>
> I'd happily help with those tests if you could share the report
> descriptors and some device dumps made with the hid-recorder tool from
> that repository.

Yeah, I can share these in your preferred format once I figure out the 
test tools. I have been using some custom tools to parse things myself 
so far (mostly kernel traces for both HID + I2C subsystem where my USI 
controller is connected.)

-Tero

>
>> The driver has been tested with chromebooks that contain either Goodix
>> or Elan manufactured USI capable touchscreen controllers in them.
>>
>> Any feedback appreciated!
> I'll try to have a deeper look next week (though it seems a few bits
> stacked up during my week off, sigh).
>
> Cheers,
> Benjamin
>
>> -Tero
>>
>>
