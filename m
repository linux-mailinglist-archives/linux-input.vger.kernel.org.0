Return-Path: <linux-input+bounces-13663-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7298B0EBBE
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 09:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C9CD1C848CE
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 07:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350822798FF;
	Wed, 23 Jul 2025 07:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RARh2nkq"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956542737FD;
	Wed, 23 Jul 2025 07:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753255068; cv=none; b=aWnqtrf8EbR9Fk9mdbuhvL2ehA+8ePiX4ZSmrqz5AL2YDHTKg7dqYzCPmIcJONuT2N+guHwYcyAGTqRK3w6ikWqRmsMUc+M5tcPaIJ6wtq3Z88HqdN8Sn+SB4UxkrBkTlZ29mjFR6A8sjE4gOtvZE4iC6nDSsorcmuA+07Ux7nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753255068; c=relaxed/simple;
	bh=cnpFwqtc6Y53T2fgw8zx+lBZ2C1VYR3ohHxDgwMEpu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mf4xiAfoeQAWO6P66BEdhUVPBOj8xQ6IIaZguByvURlFiSs9M9AqCjgDD4z5U43f7c5shD3yEHLSX3VcxhmhxBCgtFKcvN+tmAo2nC9JYMRJWJ625s4K5ZBFXiDculVVCQKJMmz4dvf5mVR9szhrAAQxM8QoRiWTFEmoliQZ+fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RARh2nkq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753255057;
	bh=cnpFwqtc6Y53T2fgw8zx+lBZ2C1VYR3ohHxDgwMEpu0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RARh2nkqfkHr96RzaLJrayd2mks6TxkI9/Wjz+bUT6pkmsm+DunvKOibJA5kU/p0n
	 uRauuuWOHZNEfW0zD1dSzrITcywl+w14TmyTfXUnjmTkPi2rUvni4376J1CVZD4uvZ
	 o5rbVVuXUFMKTV608THu+0ZaE3E33oZJ9LIBoalYFaCvbzBJ9bid8zQ7w85XF9RIjZ
	 qXKeG6EDiIQGSl8C90C4OxD4dRkVoXB44/w/Vetn3HXMYkEIEq9BZWfPlIQSBIXSEA
	 cmA8ewd6wj6ho/VZhMO1pIkFgNkeIAHGshkjU/vGz7lVhi1BH60hmn0bRyvYgULapy
	 WDVhfrEaG/f0Q==
Received: from [192.168.1.90] (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6CE8A17E0062;
	Wed, 23 Jul 2025 09:17:37 +0200 (CEST)
Message-ID: <8f7242f0-c217-47e4-ad88-fc1481ca936f@collabora.com>
Date: Wed, 23 Jul 2025 10:17:36 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] HID: playstation: Add support for audio jack
 handling on DualSense
To: Roderick Colenbrander <thunderbird2k@gmail.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
 <s4596421-sr43-893r-o90r-86nr588sp32q@xreary.bet>
 <74d4675d-d6f5-41ed-b715-f62fb569df5d@collabora.com>
 <CAEc3jaAFV_PXdFAX9th4-hhKNAhBKdVCNP+Qf8nH=g8FwoCabQ@mail.gmail.com>
 <CAEc3jaAGP3HV_+tGLHWZXA-baD4HkA2nYWGxpmox4cuZMh+ksw@mail.gmail.com>
 <CAEc3jaD8tUNW6hkPHDp=iGmdwD5m3uKg0vNtyZr-u1mmPSAkVQ@mail.gmail.com>
 <ab1c06b1-9b79-426a-a43b-cf5a89688770@collabora.com>
 <CAEc3jaDsX8OSVskO6-Rsvn12BbV2-8ZjhV+tPaRpu9Nai3czEg@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAEc3jaDsX8OSVskO6-Rsvn12BbV2-8ZjhV+tPaRpu9Nai3czEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Roderick,

On 7/23/25 7:04 AM, Roderick Colenbrander wrote:
> Hi Cristian,
> 
> Thanks for the information on the audio patches in the sound tree. We
> weren't familiar with that part.

I've actually mentioned that in the cover letter and changelog of this
revision.  Couldn't do this previously because I submitted the HID series
before the USB audio one.

> I talked a bit with my team members as well. In general audio is
> getting some bigger attention (will see where that goes). I'm getting
> a bit worried that the HID and usb driver need much closer coupling,
> the current coupling not being enough.

I think we should keep things simple for now, at least until we land the
basic support, also considering the USB part has been already merged.

> I don't know the USB audio spec too well, but it is more on the
> digital interface and a DAC. I'm not sure on the exact circuitry on
> the DualSense, but there is a lot of logic in the console drivers for
> volume handling where adjustment of the volume talks to the HID layer
> to send a new output report. I suspect they had very good reasons for
> it (e.g. for headphone also dealing with different impedances).
> 
> So I'm not sure how the volume control is really supposed to work, but
> I would think to do it properly it requires some interaction between
> the audio and HID drivers. Just letting the audio side do it right
> now, is more about leveraging the range of the DAC I guess versus a
> proper audio amplification stage.

Indeed, it's not possible to support hardware volume control from
ALSA/usb-audio without involving HID.  This could be done, or at least it's
worth investigating further, but it's not mandatory and definitely beyond
the scope of the current work.

> Just thinking of things from the user perspective, they should have a
> unified volume control. I don't know how other devices are doing it,
> but I think we need to think a bit further and we need to reconsider
> how things work....

There's a bit more complexity in here than initially anticipated, but the
(software) volume control is not really a problem.  It's worth noting I am
going to provide some UCM changes, part of the ALSA project:

  https://github.com/alsa-project/alsa-ucm-conf

This is to ensure proper support for audio profile switching between
headphones/headset and internal speaker/microphone, which also addresses
a few volume control related issues.  Those are mainly caused by the haptic
feedback functionality, which is controlled by a pair of dedicated channels
in a quadraphonic audio stream.  One of the UCM's main jobs is to split the
4.0 PCM stream into 4 mono channels or a pair of stereo (FL+FR) channels,
depending on the active output device/profile.

The only blocker now is this HID series, which prevents us moving further.

Therefore, unless there is anything else remaining which requires urgent
attention, could you please provide an ack for Jiri to be able to pick this
up?

Thanks,
Cristian

> Thanks,
> Roderick
> 
> On Tue, Jul 22, 2025 at 1:03 AM Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>>
>> Hi Roderick,
>>
>> On 7/22/25 9:18 AM, Roderick Colenbrander wrote:
>>> Hi Cristian and Jiri,
>>>
>>> One thing I forgot to bring up is whether it is best to have the audio
>>> plug logic have its separate input device or have it be part of an
>>> existing (e.g. main gamepad). The patch currently creates a separate
>>> input device. Originally we added multiple input devices (gamepad,
>>> touchpad and sensors) due to axes and button collisions really.
>>>
>>> For this feature there is no collision. There are not many devices in
>>> the kernel, which support these audio EV_SW. I see for example the
>>> Switch 2 controller has a mini jack port as well. Some xbox
>>> controllers too (though audio not supported in the kernel from a quick
>>> glance or at least no HID or xpad driver features for them).
>>>
>>> I don't have a strong opinion yet. Initial feeling was perhaps have it
>>> on the 'main' input device. But on the other hand, I'm not sure what
>>> software is normally listening for these kinds of EV_SW events. What
>>> would be listening for this like a pipewire?
>>
>> For now this is going to be used by the usb-audio driver which contains a
>> quirk [1] creating the jack controls for headphone and headset mic,
>> respectively.  This will further setup an input handler for each of them in
>> order to intercept the related hotplug events.
>>
>> But it can be also used directly from ALSA/pipewire, e.g. for monitoring,
>> hence it think it's best to keep it as an audio dedicated input device.
>>
>> Regards,
>> Cristian
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/sound/usb/mixer_quirks.c#n540

