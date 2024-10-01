Return-Path: <linux-input+bounces-6979-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6036598C3C0
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 18:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB7EC1F2263E
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 16:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFC31C8FCF;
	Tue,  1 Oct 2024 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="g6Uhmxdv"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855F82A1D2;
	Tue,  1 Oct 2024 16:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727801132; cv=none; b=gTxc+I38GOvPtlsNFU0D95tplvTzlxCXduzr+MqGDgAPVhAk9TjpLjlBN4ifXdJ5j2+jMfGGNupXdBnSq7HaFClU/PsVK4nsqC/MPnX2LWlag+8Xza7/hb3LIV/k7x57xmffVnOWKhwBv4zTfm+KYp/IQcSMuk1VLmYnboZic4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727801132; c=relaxed/simple;
	bh=T2AW7SYQT42VpoDF+BSfwnfy2HV9T0p9R4hxgtgnFvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jW7KF/qSwgCwr/M+Xc+F+o/yUXv+LI9wlSWcTIkKJwEgZtBSp+OEstw9o2h7rHKVKtgaHkOUaOZG1mPluA1dS580Aus1zZ8FQOGDqzVdn1VzFjZJhRszo3s37C8I8rA64h07u24fTKc6WD2Vd2DdPXw5sjxbQEueY4iIrx5WHqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=g6Uhmxdv; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1727801109; x=1728405909; i=w_armin@gmx.de;
	bh=VFFGtJUdZlr+WUxr+iUNuFeGiB+Cc6julC+NXoLDYFE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=g6Uhmxdv20+Q7vvS0wM4XgbBcShHVrkSQ8KBHP0GM2EIEdCd/NTkxFTKMcJnqrMd
	 jNXKL0IzUG62ZIWmD7Wy8ekMOBPFwLjMsP/Ps0rNR0YkqiWdzq20kD/GNatiLcoHp
	 tSvz4d93yTjK7K7mPlzY18w2ilp0HJiogNyF6J/wG5rU/+Y++0bQr6fG/PbBQE0a5
	 HYQuhUTHWwp2HvMYGvLuwP9zaf7vX4ijRPPxVoTshjD9ZrcNXc8EM5CuFX39RMi70
	 mAmyMmb9OUKNTJMzHIyOipX4sXoZ4g7jQgpgeH5ao3seUanMvYVNF3Crn4yQuGQo2
	 ClfOYzSA4OFdQY2r7A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MS3il-1sTwY22AHr-00Y8hu; Tue, 01
 Oct 2024 18:45:09 +0200
Message-ID: <c4e0beb6-acd1-45fa-ad47-f5cf9df89b11@gmx.de>
Date: Tue, 1 Oct 2024 18:45:07 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Benjamin Tissoires <bentiss@kernel.org>,
 Werner Sembach <wse@tuxedocomputers.com>
Cc: Pavel Machek <pavel@ucw.cz>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, platform-driver-x86@vger.kernel.org
References: <ZvcdNXQJmc8cjifw@amd.ucw.cz>
 <bea39077-6104-4b59-8757-9cbe0e703e5c@gmx.de>
 <7r3zg4tcmp5ozjwyiusstgv7g4dha4wuh4kwssxpk3tkurpgo3@36laqab7lsxp>
 <58cf1777-222f-4156-9079-bcbba4a32c96@tuxedocomputers.com>
 <45qkbpaxhrv2r32hghjqoexkenktymzyjgpx2xnnxt6dmfawjt@44lrhgcnozh3>
 <586a1c41-bbe0-4912-b7c7-1716d886c198@tuxedocomputers.com>
 <5th4pisccud5s7dbia42glsnu7e5u3q7jszty6o3mjdedsd2bg@7nsvp6t2krnf>
 <b6f2244d-7567-49ac-b2db-23b632a4e181@tuxedocomputers.com>
 <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
 <84b629c6-5b26-4285-9b2f-66dd1afa99e5@tuxedocomputers.com>
 <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MWcehhxFtpbrIHKj529+Ipi+Yj/8ag+8Pv38lzWBHa35Yp7XqK4
 QI6jU+usw86r7UJSXFyZNklXCcLmqezuzgJ5H/cTU5JnZ4j2/eXXSWH3j7kVwxLMdxQ/8EE
 wmbCQZwl1QNp7msY2gHu02vp489WfTdUsTnhhjvXqt6P5vUWnrexuq0jAtU58LEp9Zah8XQ
 Ny1WFMoIyDgYtGXIyTLgQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4ZGSYjricpY=;ulNEXWMoQIUBAxIxABMeFCTncDp
 4JKYiQynjvLPdjemsakl6iZ5NGj9T/sFNsA5Bw8NP2nLcCjLqrOE8u0+BHesFd5qbH2YJ3Kyj
 ocS1AFpkGCraP3h3D5gZvPEVP2u+pQ9CEj3myt2LmBgdrrAm46mdtLurOaUe69EVKJcDlGTLB
 0Anmcc6Poh39fCRETsbOZ3E1tdLbYLGwLXBurPKjE8Zl+NwdN47EwUD/iChvMOiTix3VQE05S
 E2qpnFOHlThhwVHtsfCeiCjF6ZltmGoGIC+3XVDU1FNLxh/x7wW+zetRoePD8nRB3AOFNJ7P3
 XtCN7RvXbUtgnFYCyI/4GewfzZCTuLk20ZjcgfpxQQV6CPMKEDTU7y8tiJbHjG8YG9+OYky1I
 zY6QyHtBi6q10U6DFgMCxTpwwB4blO7+OqOZT7kEiik7KbKzOeNTTcOGZ95x1Gk64M6pRyPiU
 P3bAFN2uYA/DQ3afND+0Lz1JM7dpsSLv6Zf5gWP0FcinScig+pn6JAkkW8fheqrmqhc4ZYyxN
 7gtARLcA9S9PoHoBCpHPjP2dYmq+By9LUrYK0gcvr/MSVEoNBoewpNSg1wzMuC+mHq4ngJPat
 PHf7d3FJ9jJvJv9k2JYsWnsglcw7KqTbvTa1Ws/yMY1syYwiQrUGBKeBSZadEhjk0L4v8a+OS
 eFeEpk09/H+8PnZsM9hcG6g+kP025QhCNbLUncMsgvuVPobH7HLvFpPFepk8RvuTTspgshm+V
 CVvGcI+CEkQOLhoBCNJWqB+oazXITL0COk+1aN43mscNHi0Pb+hc3E6XCy+8Zd+7Igv9AnkUR
 L/heai5BSwf72nde+eMrn7lA==

Am 01.10.24 um 15:41 schrieb Benjamin Tissoires:

> On Oct 01 2024, Werner Sembach wrote:
>> (sorry resend because thunderbird made it a html mail)
>>
>> Hi,
>>
>> Am 30.09.24 um 19:06 schrieb Benjamin Tissoires:
>>> On Sep 30 2024, Werner Sembach wrote:
>>>> [...]
>>>> Thinking about it, maybe it's not to bad that it only changes once ud=
ev is
>>>> ready, like this udev could decide if leds should be used or if it sh=
ould
>>>> directly be passed to OpenRGB for example, giving at least some consi=
stency
>>>> only changing once: i.e. firmware -> OpenRGB setting and not firmware=
->leds
>>>> setting->OpenRGB setting.
>>> That would work if OpenRGB gets to ship the LampArray bpf object (not
>>> saying that it should). Because if OpenRGB is not installed, you'll ge=
t
>>> a led class device, and if/when OpenRGB is installed, full LampArray
>>> would be presented.
>> The idea in my head is still that there is some kind of sysfs switch to
>> enable/disable leds.
> FWIW, I'm never a big fan of sysfs. They become UAPI and we are screwed
> without possibility to change them...

Why not having a simple led driver for HID LampArray devices which exposes=
 the
whole LampArray as a single LED?

If userspace wants to have direct control over the underlying LampArray de=
vice,
it just needs to unbind the default driver (maybe udev can be useful here?=
).

>> My idea is then that a udev rule shipped with OpenRGB sets this switch =
to
>> disable before loading the BPF driver so leds never get initialized for=
 the
>> final LampArray device.
> FWIW, udev-hid-bpf can inject a udev property into a HID-BPF. So
> basically we can have a udev property set (or not) by openrgb which
> makes the BPF program decide whether to present the keyboard as
> LampArray or not.

I do not think that using HID-BPF makes sense here, since the underlying H=
ID device
is already purely virtual.

Using HID-BPF on top of the already virtual HID device would be a bit stra=
nge.

>>> But anyway, BPF allows to dynamically change the behaviour of the
>>> device, so that's IMO one bonus point of it.
>>>
>>>>> FWIW, the use of BPF only allows you to not corner yourself. If you
>>>>> failed at your LampArray implementation, you'll have to deal with it
>>>>> forever-ish. So it's perfectly sensible to use BPF as an intermediat=
e step
>>>>> where you develop both userspace and kernel space and then convert b=
ack
>>>>> the BPF into a proper HID driver.
>>>> I don't really see this point: The LampArray API is defined by the HI=
D Usage
>>>> Table and the report descriptor, so there is not API to mess up and
>>>> everything else has to be parsed dynamically by userspace anyway, so =
it can
>>>> easily be changed and userspace just adopts automatically.
>>>>
>>>> And for this case the proper HID driver is already ready.
>>> Yeah, except we don't have the fallback LED class. If you are confiden=
t
>>> enough with your implementation, then maybe yes we can include it as a
>>> driver from day one, but that looks like looking for troubles from my
>>> point of view.
>> To be on the safe side that we don't talk about different things: My cu=
rrent
>> plan is that the leds subsystem builds on top of the LampArray
>> implementation.
> I would say that the HID subsystem knows how to translate LampArray into
> a subset of LEDs. But I think that's what you are saying.
>
>> Like this the leds part has to be only implemented once for all LampArr=
ay
>> devices be it emulated via a driver or native via firmware in the devic=
e
>> itself.
> yep, that's the plan. However, not sure how to fit LampArray into LED.

Maybe the LED driver can present the whole LampArry as a single RGB LED. T=
his
might be enough for basic LED control (on/off, changing color, ...).

For advanced LED control (effects, large number of LEDs, ...) userspace ca=
n just
unbind the default LED driver and use hidraw to drive the LampArray themse=
lf.

>> And I feel confident that the UAPI should be that the userspace gets a
>> hidraw device with a LampArray HID descriptor, and every thing else is,=
 by
>> the HID spec, dynamic anyway so I can still change my mind in implement=
ation
>> specifics there, can't I?
> Yeah... I think?
>
>  From my point of view we are just bikeshedding on to where put that
> "firmware" extension, in WMI, in HID (kernel with a subdriver), or
> externally in BPF.
>
Just a insane idea: can Tuxedo change the ACPI code supplied by the BIOS?

>>> After a second look at the LampArray code here... Aren't you forgettin=
g
>>> the to/from CPU conversions in case you are on a little endian system?
>> Since this driver is for built in keyboards of x86 notebooks it isn't
>> required or is it?
> Good point. Let's just hope you don't start shipping a LE laptop with
> the same keyboard hardware :)

I believe we should do those CPU conversions regardless, so future driver =
developers
have good examples to copy from.

>>>> So the only point for me currently is: Is it ok to have key position/=
usage
>>>> description tables in the kernel driver or not?
>>> good question :)
>>>
>>> I would say, probably not in the WMI driver itself. I would rather hav=
e
>>> a hid-tuxedo.c HID driver that does that. But even there, we already h=
ad
>>> Linus complaining once regarding the report descriptors we sometimes
>>> insert in drivers, which are looking like opaque blobs. So it might no=
t be
>>> the best either.
>> Isn't tuxedo_nb04_wmi_ab_virtual_lamp_array.c not something like
>> hid-tuxedo.c? or should it be a separate file with just the arrays?
> It is, in a way. I think it's more a question for Hans and the other
> platform maintainers, whether they would accept this.

Is there a possibility to query the physical keyboard layout using the WMI=
 interface?

>>> Sorry I don't have a clear yes/no answer.
>> Hm... Well if it's no problem I would keep the current implementation w=
ith
>> minor adjustments because, like i described above, I don't see a benefi=
t now
>> that this already works to rewrite it in BPF again.
>>
>> If it is a problem then i don't see another way then to rewrite it in B=
PF.
>>
>> Note: For future devices there might be more keyboard layouts added,
>> basically every time the chassis form factor changes.
> If the WMI part doesn't change, then maybe having BPF would be easier
> for you in the future. Adding a HID-BPF file would cost basically
> nothing, and it'll be out of band with the kernel, meaning you can ship
> it in already running kernels (assuming the same WMI driver doesn't need
> any updates).
>
>>> Cheers,
>>> Benjamin
>> To sum up the architechture (not mutally exclusive technically)
>>
>> /- leds
>> WMI <- WMI to LampArray Kernel driver <-switch-|
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \- OpenRGB
>>
>> /- leds
>> WMI <- WMI to Custom HID Kernel driver <- Custom HID to LampArray BPF
>> driver<-switch-|
>> \- OpenRGB
>>
>> With the "switch" and "leds" implemented in hid core, automatically
>> initialized every time a LampArray device pops up (regardless if it is =
from
>> native firmware, a bpf driver or a kernel driver)
>>
>> Writing this down I think it was never decided how the switch should lo=
ok like:
>>
>> It should not be a sysfs attribute of the leds device as the leds devic=
e
>> should disappear when the switch is set away from it, but should it be =
a
>> sysfs variable of the hid device? This would mean that hid core needs t=
o add
>> that switch variable to every hid device having a LampArray section in =
the
>> descriptor.
> Again, not a big fan of the sysfs, because it's UAPI and need root to
> trigger it (though the udev rule sort this one out).
> BPF allows already to re-enumerate the device with a different look and
> feel, so it seems more appropriate to me.
>
> Also, having a sysfs that depends on the report descriptor basically
> means that we will lose it whenever we re-enumerate it (kind of what the
> LED problem you mentioned above). So we would need to have a sysfs on
> *every* HID devices???
>
> Actually, what would work is (ignoring the BPF bikeshedding for Tuxedos
> HW):
> - a device presents a report descriptor with LampArray (wherever it
>    comes from)
> - hid-led.c takes over it (assuming we extend it for LampArray), and
>    creates a few LEDs based on the Input usage (one global rgb color for
>    regular keys, another one for the few other LEDs known to userspace)
> - when openRGB is present (special udev property), a BPF program is
>    inserted that only contains a report descriptor fixup that prevent th=
e
>    use of hid-led.c

Can we just manually unbind the hid-led driver?

> - the device gets re-enumerated, cleaning the in-kernel leds, and only
>    present the LampArray through hidraw, waiting for OpenRGB to take
>    over.
> - at any time we can remove the BPF and restore the LEDs functionality
>    of hid-led.c
>
>>>>> Being able to develop a kernel driver without having to reboot and
>>>>> being sure you won't crash your kernel is a game changer ;)
>>>>>
>>>>> Cheers,
>>>>> Benjamin
>> Best regards and sorry for the many questions,
>>
>> Werner Sembach
>>
>> PS: on a side node: How does hid core handle HID devices with a broken =
HID
>> implementation fixed by bpf, if bpf is loaded after hid-core? Does the =
hid
>> device get reinitialized by hid core once the bpf driver got loaded? If=
 yes,
>> is there a way to avoid side effects by this double initialization or i=
s
>> there a way to avoid this double initialization, like marking the devic=
e id
>> as broken so that hid core- does not initialize it unless it's fixed by=
 bpf?
> - broken HID device:
>    it depends on what you call "broken" HID device. If the report
>    descriptor is boggus, hid-core will reject the device and will not
>    present it to user space (by returning -EINVAL).
>    If the device is sensible in terms of HID protocol, it will present i=
t
>    to userspace, but the fact that it creates an input node or LED or
>    whatever just depends on what is inside the report descriptor.
>
> - HID-BPF:
>    HID-BPF is inserted between the device itself and the rest of the
>    in-kernel HID stack.
>    Whenever you load and attach (or detach) a BPF program which has a
>    report descriptor fixup, HID-core will reconnect the device,
>    re-enumerate it (calling ->probe()), and will re-present it to
>    userspace as if it were a new device (you get all uevents).
>
> - double initialization:
>    nowadays hid-generic doesn't do anything on the device itself except
>    calling the powerup/powerdown, by calling ->start and ->stop on the
>    HID transport driver. It's not a problem on 99% of the devices AFAICT=
.
>    technically, if the report descriptor is bogus, start/stop won't be
>    called, but you'll get an error in the dmesg. So if you really want t=
o
>    rely on that "broken" scenario we can always add a specific quirk in
>    HID to not spew that error.
>
> Cheers,
> Benjamin
>
> PPS: sorry for pushing that hard on HID-BPF, but I can see that it fits
> all of the requirements here:
> - need to be dynamic
> - still unsure of the userspace implementation, meaning that userspace
>    might do something wrong, which might require kernel changes
> - possibility to extend later the kernel API
> - lots of fun :)

