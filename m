Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7557075C203
	for <lists+linux-input@lfdr.de>; Fri, 21 Jul 2023 10:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjGUIuq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jul 2023 04:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjGUIup (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jul 2023 04:50:45 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD1E02D60
        for <linux-input@vger.kernel.org>; Fri, 21 Jul 2023 01:50:42 -0700 (PDT)
Received: from [192.168.178.22] ([88.217.70.24]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MVeDs-1qWdCM2UjM-00RZ6G; Fri, 21 Jul 2023 10:50:38 +0200
Message-ID: <a2a33c0a-bc99-44ae-d730-bfad14401f6f@rdorf.de>
Date:   Fri, 21 Jul 2023 10:50:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Need information to implement correct handling of the GSP 370
 wireless headset
To:     Rahul Rameshbabu <rrameshbabu@nvidia.com>
Cc:     linux-input@vger.kernel.org
References: <e01dbcd2-3ce3-ebaf-e685-3b89601ae55a@rdorf.de>
 <f26c2aab-7c89-d6e4-b8c1-f6740e08b034@rdorf.de> <87r0p2rnhx.fsf@nvidia.com>
Content-Language: de-DE
From:   Werner Sembach <werner@rdorf.de>
In-Reply-To: <87r0p2rnhx.fsf@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:GoEHLL4q54PgJsYsxN2d0NqmsHhmDqZqJP4bt8XptRs5mcYeXjE
 6YO8ujEHs7Ph+zuuKo9bUfTNrNJ6eKGPWSclTAMMY1tl3YYLwBKbTq9IIy5PiPrIcKXoumL
 7vk+evOqQdC4w5wBGXWv1yjjPxzIL89FXaJkVQI6MRtrmS1L5Al+M+gfXtNOX0CLGM3Zv17
 1JnVr2YCuh1+TQAPZJong==
UI-OutboundReport: notjunk:1;M01:P0:+zi9MMZSYHU=;f3i6doFypjegs0n79ewmCf0/AJ7
 JbrpOoVroVIJVh+xvp6YJUNkrMS6I/0e8ZaNQiPW3g5iOKdjzO3qGIyiaFtJuf3RCrA+Rda+8
 JnbBSRLuVXfB3iS5mbe2G2cpu8kXiMRfBR9i+tet20AZDb+GvzdzclUd9cgX/88umLQnsbNLQ
 5e9wdzfVXJV+BB6YMilXzFGkyl3kWL8q1jeXu9ek5CGGGYMX2ip9IKZuIZazcY2KZgP28vAh6
 Dz6EYqMEfflnZeiVotURT4ntHwKrFPh2CD/XlJxzhxDN6g9Bp18KJ5W1X59ULXp6cP2foog/t
 hT82svvG7ZiuWKRmjtsdqHPnqByxxO9pr9Se+I4cImdXIqHP93HYIvTy3DuXmPps+AXNG/1VO
 kEusJ5Ufy7R65PcF6EUJm07Taz3gbK4FoQTZqvs0S3Xz+ukgToL0wdUrcXUREFqNvvHQR7svK
 svc7S/BJVkk5ZF+38FZuj9QsFXdLKImvZL51AxDNrjaebWlJVrAu4XbP8rAsP10W6ZkHVJAkR
 Ik2dyQ6nSXK65yKFaUTBPEdZjwQUbP1+4c2sgL3SHgRjKTanfpA4sLI2vPh0FEQUXwOOuufeh
 IYnDB5n8LqgfzmX/GnVHBEJ0Pxw1PUq4N3r5BuCmiPihttRgVk90WvT5DwIvVxANzVByxZcXF
 7ULBug0SGsUOrLQYs1z6E1Yvx1u18p6/TWXPGOUgog==
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am 21.07.23 um 04:45 schrieb Rahul Rameshbabu:
> On Fri, 07 Jul, 2023 23:22:58 +0200 Werner Sembach <werner@rdorf.de> wrote:
>> Am 07.07.23 um 23:12 schrieb Werner Sembach:
>>> Hi,
>>>
>>> The EPOS GSP 370 wireless headset has a volume control knob on the headset.
>>> Turning this has 2 effects on Linux:
>>>
>>> - The volume gets adjusted in firmware
>>>
>>> - A volume up/down key event is sent to the OS and the volume is adjustet on
>>> the OS level (the dongle registers both as a audio device and an usb keyboard
>>> to do this)
>>>
>>> This double volume adjust is ofc not the intended behavior and induces all
>>> kinds of wiredness, like the os is already displaying 100% volume but you can
>>> still turn it higher because the firmware has not yet reached max volume.
> What you will likely want to do is implement a custom USB mixer quirk
> for the audio device advertised by the USB dongle. I delve into this
> more in the section discussing which subsystem would be appropriate for
> this.
Thank you very much for giving me the starting points, now I only need 
to find some time to work on this.
>
>>> Running Wireshark on Windows and Linux I recognized that Windows is sending
>>> "URB_CONTROL out" events to the dongle on volume adjust, which Linux doesn't,
>>> these events have a paylode that seems to encode a volume value in 2 byte with
>>> little endianess.
>>>
>>> I'm unsure if I can attach pcap file or if it will get blocked in the list so
>>> i will send them as a reply.
>> As I thought: The pcapng files are to big for the mailing list. When someone is
>> interested let me know how I can send them (should I open a Bugzilla Ticket for
>> it?).
>>> So my 2 questions are:
>>>
>>> - What are these USB "URB_CONTROL out" events? (Does not seem to be HID
>>> reports?)
> URB stands for USB Request Block. You are specifically working with the
> USB layer here rather than the HID layer that abstracts away the lower
> level transport interface.
>
> URB in general is a system (OS) - defined format for interacting with
> the core host controller driver in the OS stack. This means the
> implementation of sending requests to the USB hub driver in Linux and
> Windows differ. You may want to understand the specific requests made by
> the Windows USB client driver for the headset and implement an
> equivalent driver using the URB API of the linux kernel.
>
> Generic Overview
>
>    * https://wiki.osdev.org/Universal_Serial_Bus#Host_Controller_Driver
>
> Linux specific information
>
>    * https://static.lwn.net/images/pdf/LDD3/ch13.pdf
>    * https://docs.kernel.org/driver-api/usb/URB.html
>    * https://docs.kernel.org/driver-api/usb/writing_usb_driver.html
>
> Windows specific information
>
>    * https://learn.microsoft.com/en-us/windows-hardware/drivers/usbcon/usb-control-transfer
>
>>> - In which subsystem would I want to implement them? Or should this be handled
>>> in userspace?
> I am guessing you would not need to add any additional support for the
> USB keyboard device advertised by the dongle. It's working fine and
> advertising media keys to the system as you expect. Your goal now more
> likely is to send USB requests to the headset (dongle) whenever the
> volume level is changed for the audio device through the system. I
> assume such a "driver" (quirk) would live under sound/usb in the kernel
> tree just like sound/usb/mixer_scarlett.c,
> sound/usb/mixer_scarlett_gen2.c, and other usb mixer implementations in
> the kernel. Specifically in sound/usb/mixer_scarlett.c, I think you will
> find the add_output_ctls function to be a helpful reference for defining
> a new volume control that properly controls the device firmware volume
> level based on the ALSA PCM level set in the kernel by user interaction
> with the userspace audio component on his/her system. You will see all
> these mixer implementations then get instantiated in
> sound/usb/mixer_quirks.c in the snd_usb_mixer_apply_create_quirk
> function.
>
>>> Bast regards,
>>>
>>> Werner
>>>
> Might want to ask the alsa-devel mailing list about how to go about
> handling the device firmware audio control as well in the linux audio
> stack if you did not find this explanation suitable for getting
> started/want to inquire further about the ALSA kernel architecture.
>
>    https://www.alsa-project.org/wiki/Mailing-lists
I will do that when the first question undoubtly pop up once I start 
reading the mixer_* source code ^^.
>
> -- Rahul Rameshbabu
