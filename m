Return-Path: <linux-input+bounces-14332-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0B3B37A7C
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 08:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F14A3BD786
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 06:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387F2280324;
	Wed, 27 Aug 2025 06:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IiUsj7Bc"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A531DE4C9;
	Wed, 27 Aug 2025 06:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756276583; cv=none; b=ZW3LM4aKO4A33LWnREn8qj7eXNTw0RrWk8XG2BCMMRmT+Q2WXXBxDSytPCAuceHas+Xtf7E1PGsUJAnAZ5G7ICadblAWEQq4OL3B2U7sqsDDG179iWdD3KVyWtk3ILFezMJ6cnNuX7NYX2WYIQvYeapFcAwUKwT4TlvLmMVG4F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756276583; c=relaxed/simple;
	bh=93mMfqRnIYONl5pXTpzQ+OBdW3kFD6MGOvhnpTBu/BU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=uU06lZ/7+xNLKXLJJxEcG0guNUJVUjvS78T1qhRUE2UH3j5FAk9GANGOKU9yiDXqjdeWcdmnEcSqlTUJi9VqmPxNqDGHQ66ZFun7ebVs79dOSPC8eJexIDz/hM9AfqJk2wPRyXrrjnZDzjAeYrbIKe4wes1n13CJp6Wnqcs5YdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IiUsj7Bc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756276578;
	bh=93mMfqRnIYONl5pXTpzQ+OBdW3kFD6MGOvhnpTBu/BU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=IiUsj7Bce0VvrXbx6mi4//QotPBM1rbFnnFc44N/767VfnumBa66oHwCFQCXu0MEd
	 bJyYI6f9mAjkT599E67Bql8OELiAV4gzDG+ZNdVF9JwNtEAvEjQ04/YycG46ytI1t7
	 Pjtb9MFX22PTqZ5HdihfzVfpT5DR+C5s2f96VsarwFo8pp/WS92ExNtxl5HWLFBoX3
	 frnSiy+MX5L9NoVx5C6UemBAZ1oNeFgDzYs4108gktl5nArV6wdlNdyWT1OzBVQb5F
	 W0D/oYjinDlL5yxWy2Xqgz8mEJXL4ogey9Nzx2zu2ZekGxLD5sk4rguZhLfJqoQv+N
	 HoAcmOZHoYfXg==
Received: from [192.168.1.90] (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7BABE17E0593;
	Wed, 27 Aug 2025 08:36:18 +0200 (CEST)
Message-ID: <c6a16e71-e431-47dd-a3d1-6a79fd7e4a37@collabora.com>
Date: Wed, 27 Aug 2025 09:36:18 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] HID: playstation: Add support for audio jack
 handling on DualSense
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
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
 <8f7242f0-c217-47e4-ad88-fc1481ca936f@collabora.com>
Content-Language: en-US
In-Reply-To: <8f7242f0-c217-47e4-ad88-fc1481ca936f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/23/25 10:17 AM, Cristian Ciocaltea wrote:
> Hi Roderick,
> 
> On 7/23/25 7:04 AM, Roderick Colenbrander wrote:
>> Hi Cristian,
>>
>> Thanks for the information on the audio patches in the sound tree. We
>> weren't familiar with that part.
> 
> I've actually mentioned that in the cover letter and changelog of this
> revision.  Couldn't do this previously because I submitted the HID series
> before the USB audio one.
> 
>> I talked a bit with my team members as well. In general audio is
>> getting some bigger attention (will see where that goes). I'm getting
>> a bit worried that the HID and usb driver need much closer coupling,
>> the current coupling not being enough.
> 
> I think we should keep things simple for now, at least until we land the
> basic support, also considering the USB part has been already merged.
> 
>> I don't know the USB audio spec too well, but it is more on the
>> digital interface and a DAC. I'm not sure on the exact circuitry on
>> the DualSense, but there is a lot of logic in the console drivers for
>> volume handling where adjustment of the volume talks to the HID layer
>> to send a new output report. I suspect they had very good reasons for
>> it (e.g. for headphone also dealing with different impedances).
>>
>> So I'm not sure how the volume control is really supposed to work, but
>> I would think to do it properly it requires some interaction between
>> the audio and HID drivers. Just letting the audio side do it right
>> now, is more about leveraging the range of the DAC I guess versus a
>> proper audio amplification stage.
> 
> Indeed, it's not possible to support hardware volume control from
> ALSA/usb-audio without involving HID.  This could be done, or at least it's
> worth investigating further, but it's not mandatory and definitely beyond
> the scope of the current work.
> 
>> Just thinking of things from the user perspective, they should have a
>> unified volume control. I don't know how other devices are doing it,
>> but I think we need to think a bit further and we need to reconsider
>> how things work....
> 
> There's a bit more complexity in here than initially anticipated, but the
> (software) volume control is not really a problem.  It's worth noting I am
> going to provide some UCM changes, part of the ALSA project:
> 
>   https://github.com/alsa-project/alsa-ucm-conf
> 
> This is to ensure proper support for audio profile switching between
> headphones/headset and internal speaker/microphone, which also addresses
> a few volume control related issues.  Those are mainly caused by the haptic
> feedback functionality, which is controlled by a pair of dedicated channels
> in a quadraphonic audio stream.  One of the UCM's main jobs is to split the
> 4.0 PCM stream into 4 mono channels or a pair of stereo (FL+FR) channels,
> depending on the active output device/profile.
> 
> The only blocker now is this HID series, which prevents us moving further.
> 
> Therefore, unless there is anything else remaining which requires urgent
> attention, could you please provide an ack for Jiri to be able to pick this
> up?

It's been over a month now since this was kind of blocked without any clear
reason, and by the end of next week I'll be on leave, which means we're
close to missing the merge window once again.

Considering the counterpart quirk in the generic USB audio driver has been
already merged since v6.17, I kindly ask for your support in getting this
into v6.18.

Thanks,
Cristian


