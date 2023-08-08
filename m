Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB5C2774D28
	for <lists+linux-input@lfdr.de>; Tue,  8 Aug 2023 23:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbjHHVk2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Aug 2023 17:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjHHVk1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Aug 2023 17:40:27 -0400
X-Greylist: delayed 344 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Aug 2023 14:40:26 PDT
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D862E10C
        for <linux-input@vger.kernel.org>; Tue,  8 Aug 2023 14:40:26 -0700 (PDT)
Received: from [192.168.0.23] (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id DB287A161;
        Tue,  8 Aug 2023 14:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
        t=1691530482; bh=uHOSUa7/sEJ3I1FTqMI4ntfE3gsnaQNj7uozDXTVJfM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=jGw7nx/z4u5q4DMl5qKh5ksqjz50nyq5x7MaYID7ODCbvIC6Vi/lxdRs+Eo7Ba1dN
         5tU2lb5QX4vd9UqGOv2TcmHHLbXIDF3agI9pxWMu8y9HkwwHs4D4sIhWXLlmg87Ju2
         wnJTXcxTUpaggKeIlNvJDT5OWOZd3WhjLf4GceuCwq36mdb+hM1HpWAc5Z2XEJRwk2
         opNhJ8wAdAmF6Z6wyKz4dhCIZXVkEjcYYOmNMXLTG0To5kQmqLhLMYsVZ8GoU/OxPP
         uoBZvPyUgxv7K1XKdhrie/YMzYmDnRT4HCBjdENd/416ek+iWwyi8IQC8J6UcpYndG
         23mM3eCmJl9+A==
Message-ID: <2b0086a0-3d82-fb3a-c027-34f84a8ef795@endrift.com>
Date:   Tue, 8 Aug 2023 14:34:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Proposal: Add a means to disable kernel driver logic when
 associated hidraw is opened
Content-Language: en-US
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Pierre-Loup Griffais <pgriffais@valvesoftware.com>
References: <a3b1f768-27e9-c9d5-ad2c-c56a48522d41@endrift.com>
 <CAO-hwJLcWMujHXaCKdW9n2Y21rtg=7gMkzzd0K95DyC9y3W_Mw@mail.gmail.com>
 <CAO-hwJ+4Hctv6QVSyZxKMCbDt-kFJpwU0iL6+yK60NRvwQihbQ@mail.gmail.com>
From:   Vicki Pfau <vi@endrift.com>
In-Reply-To: <CAO-hwJ+4Hctv6QVSyZxKMCbDt-kFJpwU0iL6+yK60NRvwQihbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On 4/25/23 07:52, Benjamin Tissoires wrote:
> On Mon, Apr 24, 2023 at 3:07=E2=80=AFPM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
>>
>> Hi Vicki,
>>
>> On Fri, Apr 21, 2023 at 4:36=E2=80=AFAM Vicki Pfau <vi@endrift.com> wr=
ote:
>>>
>>> Hello,
>>>
>>> Following up on a conversation from last year (cf. https://lore.kerne=
l.org/linux-input/CAO-hwJLfY+D0NyCUCncrjcXETKwOBqj1CuHtB_mtGhYfKV0Bww@mai=
l.gmail.com/) about how to approach differing opinions about how drivers =
should work between userspace and kernel, we're looking for a way to effe=
ctively stop the kernel from doing anything "smart" with a a HID device, =
e.g. a hid-sony device, when the associated hidraw is opened. At the mome=
nt, we have a specialized daemon that will find the mouse evdev associate=
d with the controller when it's created and inhibit it, but this is anyth=
ing but ideal and only handles the mouse itself, not the kernel logic in =
general. You can also see the hackish way this is implemented in the hid-=
steam driver, which uses an intermediary hid ll_driver to intercept the o=
pen and close commands and stop passing data if the hidraw gets opened. I=
 consider this implementation to be very much a hack and an anti-pattern,=
 and I think other HID implementers would agree, but I'm not sure there's=
 a cleaner way to detect this in the kernel at the moment.
>>>
>>> I see a bit of a difference of opinion as to what should be happening=
 here between developers on our end and the kernel end. Our position is "=
we have a userspace driver that does everything we want, we'd like the ke=
rnel to stop trying to be smart when our driver is active", and I expect =
the kernel developer opinion is "why should you have a userspace driver a=
t all when our kernel driver is fine, and if it's not you can upstream pa=
tches?", so there's probably some need to find a middle ground if we want=
 things to work well for users in the end.
>>
>> The main problem we have here, is that if userspace is actively using
>> hidraw to configure the device, the kernel is not aware, and thus its
>> state will be wrong. So my initial reaction is "we need to have ad-hoc=

>> and opt-in functionality for these, because the states the kernel
>> needs to monitor will differ from one device to one other". But this
>> opt-in could (should) be controlled from userspace through eBPF.
>>
>> OTOH, maybe the simplest solution would be to entirely unbind the
>> device from the kernel driver when steam opens and rebinds it when it
>> closes. This way the kernel will reinitialize the device itself
>> properly and keep its state coherent. We can think of multiple
>> solutions for disabling the driver and still keeping hidraw open, and
>> guess what, eBPF is one of them :)
>>
>> Note though that disabling the kernel module might require some
>> changes in the kernel driver itself, so maybe that's not the best path=

>> too. (eBPF can not change any quirks on a given device, but maybe that=

>> is something we can think of).
>>
>>>
>>> We'd previously discussed an ioctl for the hidraw, or perhaps an eBPF=
 approach, though I think at the time of that discussion, eBPF wasn't mat=
ure for the HID subsystem. I don't know the current state of that, or if =
it's possible to do this with just write access to the hidraw device (the=
 ideal case for how we want to handle this--root is pretty much out of th=
e question for an "ideal case"). Since we still don't have a good answer =
for this, as far as I'm aware, I'd like to try to reach an approach that'=
s amicable for both sides.
>>
>> Good timing. Kernel 6.3 was out just yesterday, and HID-BPF is in :)
>> (well, not all use cases I envisioned are implemented, but at least
>> the bulk is there).
>>
>>>
>>> I know that the ioctl approach meant having to introduce logic for pr=
ograms in userspace, but in this specific case, and possibly others, that=
's actually what we're looking for. Further, the reason root is out is be=
cause Steam isn't the OS (in most cases), and we want this to only happen=
 when Steam is running. Having to run a daemon as root underneath Steam w=
ould require something like a setuid binary or custom sudo/polkit rules, =
which of course need root to set up anyway. So while eBPF may fit some us=
e cases, e.g. full control over the system via DE or systemd, etc, it's n=
ot what we're looking for here.
>>
>> I think you are dismissing eBPF too quickly :)
>>
>> Basically, eBPF doesn't require you to have a daemon loaded: you can
>> load the BPF program, attach it to the device, pin it in the kernel
>> and close your eBPF loader. So all you need is a new udev rule that
>> calls for a program to load the eBPF program just at plugging time.
>> Eventually, for such  "no-daemon" programs, the kernel itself will
>> load those programs, and userspace can just override them if they are
>> not up to date.
>>
>> Which means that when you load the eBPF program, you just "patched"
>> the kernel with your current API.
>>
>> [Side note: my push for eBPF is because this is exactly the kind of
>> use case I envisioned for it: an app (or set of apps) wants to tweak
>> the kernel behavior only when it is started, and wants to be in
>> control. If this app wants to change some behaviour, fixing the eBPF
>> program is way simpler and can be done in sync with the app update
>> rather than updating the API introduced in the kernel]
>>
>> I think the following (in pseudo-ish-code) would work for
> [...]
>=20
> I got a working WIP at
> https://gitlab.freedesktop.org/bentiss/udev-hid-bpf/-/tree/hidraw-close=

>=20
> I need a couple of kernel changes to allow for the introspection of
> the hidraw device from the struct hid_device and to let
> hid-playstation go with the events.
>=20
> We probably still want the opt-in capability, so we'd also need the
> hid_hw_request() BPF hook set up, but this should give you an idea
> that BPF could be a simple and elegant solution.
>=20
> Cheers,
> Benjamin
>=20

Thanks for preparing this proof of concept. Does it require kernel 6.3 to=
 work? For the time being I'm trying to get something going on 6.1, and a=
m relying on a user space daemon to manage the `inhibited` node directly.=
 I was hoping to switch over to a more crash-resistant method of doing th=
is, but if it requires 6.2 or 6.3, I will probably have to stick with thi=
s for the time being. I'll switch over to an approach like this when poss=
ible, but I'm not sure when that will be.

Thanks,
Vicki
