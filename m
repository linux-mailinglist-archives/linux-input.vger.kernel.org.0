Return-Path: <linux-input+bounces-6938-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E159D98BC04
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 14:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E84C1C211A2
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 12:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A8E1C2424;
	Tue,  1 Oct 2024 12:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="ZoURNHYy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4BB1BE23E;
	Tue,  1 Oct 2024 12:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727785443; cv=none; b=WmbrGw1FSCgZZfDsDgKDroIDws9afs6Ef3aCLqQoEv7sQMjpielA8nZB26ljdyr+AcR4/4LfblCCvt3lQYbrVsXAKnanOyiHmpjoETw7kp7fjlKCM7XXOtZYea/GdUp5pegLCxaRRSKWD+bwyjkPkt8MwRsfGCA+o9a13rablgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727785443; c=relaxed/simple;
	bh=Sp6G013EuOioR18dsjbhr2wwKlIFk/ih7InR1dpUIGA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Fx2R+MuSX7jDy6AD+8F9v1u9Wnsx/nERPI28/VciWpgHBOX3cHoeiNGMqkamgMMXO7qJKySYHh8yqo3S5BqaYpd5ToS3JY8MhRAXNibylEZdv7x9AxBSHQBkMOCzyiTa+3IkKoOEh2ZehpxKXSEqy7ddjyWqCcdWQG6fi5amDSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=ZoURNHYy; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.96] (pd9e59da1.dip0.t-ipconnect.de [217.229.157.161])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id BEA272FC0050;
	Tue,  1 Oct 2024 14:23:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1727785438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J9BRaS43VNCO0jEZG+GlrVHwvIo8h2VK94zwX476Pjs=;
	b=ZoURNHYyb6UjMgBEWKTimqKNOY8jo/wnxC/s1Tn357vM7KPmXqe32v7QF1j+Bc/b7UdFPa
	FvHrHc105CsRMsvZVsqwU6HWVP+WSyZ9ib+prpJjDETb9jQFysp3LXfEgX8M4ptpB01f1a
	2aGjsa5gqOBy5eiwH83ryVLsWaEPFxY=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <84b629c6-5b26-4285-9b2f-66dd1afa99e5@tuxedocomputers.com>
Date: Tue, 1 Oct 2024 14:23:57 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Armin Wolf <W_Armin@gmx.de>, Pavel Machek <pavel@ucw.cz>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, platform-driver-x86@vger.kernel.org
References: <20240926174405.110748-1-wse@tuxedocomputers.com>
 <20240926174405.110748-2-wse@tuxedocomputers.com>
 <ZvcdNXQJmc8cjifw@amd.ucw.cz> <bea39077-6104-4b59-8757-9cbe0e703e5c@gmx.de>
 <7r3zg4tcmp5ozjwyiusstgv7g4dha4wuh4kwssxpk3tkurpgo3@36laqab7lsxp>
 <58cf1777-222f-4156-9079-bcbba4a32c96@tuxedocomputers.com>
 <45qkbpaxhrv2r32hghjqoexkenktymzyjgpx2xnnxt6dmfawjt@44lrhgcnozh3>
 <586a1c41-bbe0-4912-b7c7-1716d886c198@tuxedocomputers.com>
 <5th4pisccud5s7dbia42glsnu7e5u3q7jszty6o3mjdedsd2bg@7nsvp6t2krnf>
 <b6f2244d-7567-49ac-b2db-23b632a4e181@tuxedocomputers.com>
 <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
Content-Language: en-US
In-Reply-To: <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

(sorry resend because thunderbird made it a html mail)

Hi,

Am 30.09.24 um 19:06 schrieb Benjamin Tissoires:
> On Sep 30 2024, Werner Sembach wrote:
>> [...]
>> Thinking about it, maybe it's not to bad that it only changes once udev is
>> ready, like this udev could decide if leds should be used or if it should
>> directly be passed to OpenRGB for example, giving at least some consistency
>> only changing once: i.e. firmware -> OpenRGB setting and not firmware->leds
>> setting->OpenRGB setting.
> That would work if OpenRGB gets to ship the LampArray bpf object (not
> saying that it should). Because if OpenRGB is not installed, you'll get
> a led class device, and if/when OpenRGB is installed, full LampArray
> would be presented.

The idea in my head is still that there is some kind of sysfs switch to 
enable/disable leds.

My idea is then that a udev rule shipped with OpenRGB sets this switch to 
disable before loading the BPF driver so leds never get initialized for the 
final LampArray device.

> But anyway, BPF allows to dynamically change the behaviour of the
> device, so that's IMO one bonus point of it.
>
>>> FWIW, the use of BPF only allows you to not corner yourself. If you
>>> failed at your LampArray implementation, you'll have to deal with it
>>> forever-ish. So it's perfectly sensible to use BPF as an intermediate step
>>> where you develop both userspace and kernel space and then convert back
>>> the BPF into a proper HID driver.
>> I don't really see this point: The LampArray API is defined by the HID Usage
>> Table and the report descriptor, so there is not API to mess up and
>> everything else has to be parsed dynamically by userspace anyway, so it can
>> easily be changed and userspace just adopts automatically.
>>
>> And for this case the proper HID driver is already ready.
> Yeah, except we don't have the fallback LED class. If you are confident
> enough with your implementation, then maybe yes we can include it as a
> driver from day one, but that looks like looking for troubles from my
> point of view.

To be on the safe side that we don't talk about different things: My current 
plan is that the leds subsystem builds on top of the LampArray implementation.

Like this the leds part has to be only implemented once for all LampArray 
devices be it emulated via a driver or native via firmware in the device itself.

And I feel confident that the UAPI should be that the userspace gets a hidraw 
device with a LampArray HID descriptor, and every thing else is, by the HID 
spec, dynamic anyway so I can still change my mind in implementation specifics 
there, can't I?

> After a second look at the LampArray code here... Aren't you forgetting
> the to/from CPU conversions in case you are on a little endian system?
Since this driver is for built in keyboards of x86 notebooks it isn't required 
or is it?
>> So the only point for me currently is: Is it ok to have key position/usage
>> description tables in the kernel driver or not?
> good question :)
>
> I would say, probably not in the WMI driver itself. I would rather have
> a hid-tuxedo.c HID driver that does that. But even there, we already had
> Linus complaining once regarding the report descriptors we sometimes
> insert in drivers, which are looking like opaque blobs. So it might not be
> the best either.
Isn't tuxedo_nb04_wmi_ab_virtual_lamp_array.c not something like hid-tuxedo.c? 
or should it be a separate file with just the arrays?
> Sorry I don't have a clear yes/no answer.

Hm... Well if it's no problem I would keep the current implementation with minor 
adjustments because, like i described above, I don't see a benefit now that this 
already works to rewrite it in BPF again.

If it is a problem then i don't see another way then to rewrite it in BPF.

Note: For future devices there might be more keyboard layouts added, basically 
every time the chassis form factor changes.

> Cheers,
> Benjamin
To sum up the architechture (not mutally exclusive technically)

/- leds
WMI <- WMI to LampArray Kernel driver <-switch-|
                                                \- OpenRGB

/- leds
WMI <- WMI to Custom HID Kernel driver <- Custom HID to LampArray BPF 
driver<-switch-|
\- OpenRGB

With the "switch" and "leds" implemented in hid core, automatically initialized 
every time a LampArray device pops up (regardless if it is from native firmware, 
a bpf driver or a kernel driver)

Writing this down I think it was never decided how the switch should look like:

It should not be a sysfs attribute of the leds device as the leds device should 
disappear when the switch is set away from it, but should it be a sysfs variable 
of the hid device? This would mean that hid core needs to add that switch 
variable to every hid device having a LampArray section in the descriptor.

>>> Being able to develop a kernel driver without having to reboot and
>>> being sure you won't crash your kernel is a game changer ;)
>>>
>>> Cheers,
>>> Benjamin

Best regards and sorry for the many questions,

Werner Sembach

PS: on a side node: How does hid core handle HID devices with a broken HID 
implementation fixed by bpf, if bpf is loaded after hid-core? Does the hid 
device get reinitialized by hid core once the bpf driver got loaded? If yes, is 
there a way to avoid side effects by this double initialization or is there a 
way to avoid this double initialization, like marking the device id as broken so 
that hid core- does not initialize it unless it's fixed by bpf?


