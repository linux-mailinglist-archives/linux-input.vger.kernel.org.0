Return-Path: <linux-input+bounces-8650-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F149F5AC7
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2024 00:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0D5916795D
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 23:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB961DF969;
	Tue, 17 Dec 2024 23:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Pza1AoRc"
X-Original-To: linux-input@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762B21E489
	for <linux-input@vger.kernel.org>; Tue, 17 Dec 2024 23:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734479655; cv=none; b=oDgUBPXkB5eNRxFUtNyFRsvnRwBcZ7hg0i/uBXtOYjhAq5IZcH/h3eSr4ik0ml7lABn9lNXzg++rj1fgHAwA7Vi83spf9RYX2mvht1XrQG9BEJVw3uDBV7evYtWDIskuE0AcE3tHhduiceS15j2vRuoUG/TsxH6dasFpH+imPRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734479655; c=relaxed/simple;
	bh=HoP1fsRzZzqsyElQl9cEKdqmIR33GjcpZFNUL3iDwRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MSeuK742WPn+lgwgrhn/S8cWZfuzPfo1OibFOiu3wKj35i+MxrFBee32Sj08AkYWGWd2ibUvpi4U2CKE3YnvWHqmv4IILT+ZSyNRI2DZKhv5iAI09PR85bZr2pHNj6jBvBSvBaVknnIqVUliPMqWs9uFPhTiTKWRsa+gMXkVXHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Pza1AoRc; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <51d07520-a60b-43d0-b7f2-7584c629caa0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734479649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/3irPPV2xZzk0hZTyS9bEZnS31ak7XYMG6B7SkGJ0gM=;
	b=Pza1AoRciFPA9pyurLJ2KhpbmlRUAOOYTIvkbvQRo3SM16D8ntRINTZ//7ZCj6iKGEbmEh
	fqen9C2y1tO5+UmkVRh6frpFENYQgjWpo8ALiD5/hcXewnzcIjxN8NWLXoNsyNeFD9crc4
	rfc5Ke7Ju6nCpjRJE6EWyHVfSf88OQc=
Date: Tue, 17 Dec 2024 17:20:13 -0600
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Takashi Iwai <tiwai@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
 srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
 conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
 broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, tiwai@suse.com, robh@kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <edfeb642-297e-42bb-ad09-cbf74f995514@quicinc.com>
 <2024111655-approve-throwback-e7df@gregkh>
 <2f512d8d-e5f3-4bdd-8172-37114a382a69@quicinc.com>
 <875xoi3wqw.wl-tiwai@suse.de>
 <d0da6552-238a-41be-b596-58da6840efbb@quicinc.com>
 <CF49CA0A-4562-40BC-AA98-E550E39B366A@linux.dev>
 <65273bba-5ec1-44ea-865b-fb815afccc91@intel.com>
 <fbc04c06-c210-416b-9b77-a6bd8a71a637@quicinc.com>
 <9d95e6fa-afcb-4445-9fe3-e0eed95ec953@intel.com>
 <d7c52a11-bd2b-4cce-a0c2-6dc2dadfeaa3@quicinc.com>
 <3d9932fa-dbc3-4393-862f-92916e6e821c@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <3d9932fa-dbc3-4393-862f-92916e6e821c@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 12/10/24 9:18 AM, Cezary Rojewski wrote:
> On 2024-12-06 1:28 AM, Wesley Cheng wrote:
>>
>> On 12/4/2024 2:01 PM, Cezary Rojewski wrote:
>>> On 2024-12-03 9:38 PM, Wesley Cheng wrote:
>>>> Hi Cezary,
>>>>
>>>> On 12/3/2024 8:17 AM, Cezary Rojewski wrote:
> 
> ...
> 
>>>>> UAOL is one of our priorities right now and some (e.g.: me) prefer to not pollute their mind with another approaches until what they have in mind is crystalized. In short, I'd vote for a approach where USB device has a ASoC representative in sound/soc/codecs/ just like it is the case for HDAudio. Either that or at least a ASoC-component representative, a dependency for UAOL-capable card to enumerate.
>>>>>
>>>>
>>>> Just to clarify, "struct snd_soc_usb" does have some correlation with our "codec" entity within the QCOM ASoC design.  This would be the q6usb driver.
>>>>
>>>>
>>>>> Currently struct snd_soc_usb does not represent any component at all. Lack of codec representative, component representative and, given my current understanding, mixed dependency of sound/usb on sound/soc/soc-usb does lead to hard-to-understand ASoC solution.
>>>>
>>>>
>>>> IMO the dependency on USB SND is necessary, so that we can leverage all the pre-existing sequences used to identify USB audio devices, and have some ability to utilize USB HCD APIs as well within the offload driver.
>>>
>>> So, while I do not have patches in shape good enough to be shared, what we have in mind is closer to existing HDAudio solution and how it is covered in both ALSA and ASoC.
>>>
>>> A ASoC sound card is effectively a combination of instances of struct snd_soc_component. Think of it as an MFD device. Typically at least two components are needed:
>>>
>>> - platform component, e.g.: for representing DSP-capable device
>>> - codec component, e.g.: for representing the codec device
>>>
>>> USB could be represented by such a component, listed as a dependency of a sound card. By component I literally mean it extending the base struct:
>>>
>>> stuct snd_soc_usb {
>>>      struct snd_soc_component base;
>>>      (...)
>>> };
>>>
>>> In my opinion HDAudio is a good example of how to mesh existing ALSA-based implementation with ASoC. Full, well implemented behaviour of HDAudio codec device drivers is present at sound/pci/hda/patch_*.c and friends. That part of devoid of any ASoC members. At the same time, an ASoC wrapper is present at sound/soc/codecs/hda.c. It will represent each and every HDAudio codec device on the HDAudio bus as a ASoC-component. This follows the ASoC design and thus is easy understand for any daily ASoC user, at least in my opinion.
>>>
>>> Next, the USB Audio Offload streams are a limited resource but I do not see a reason to not treat it as a pool. Again, HDAudio comes into picture. The HDAudio streams are assigned and released with help of HDAudio library, code found in sound/hda/hdac_stream.c. In essence, as long as UAOL-capable streaming is allowed, a pcm->open() could approach a UAOL-lib (? component perhaps?) and perform ->assign(). If no resources available, fallback to the non-offloaded case.
>>>
>>> While I have not commented on the kcontrol part, the above means that our current design does go into a different direction. We'd like to avoid stream-assignment hardcoding i.e.: predefining who owns a UAOL-capable stream if possible.
>>>
>>>
>>
>> Thanks for sharing the implementation for HDA.  I did take a look to the best of my ability on how the HDAudio library was built, and I see the differences that are there with the current proposal.  However, I think modifying the current design to something like that would also require the QCOM ASoC side to change a bit too.  As mentioned by Pierre, I think its worthwhile to see if we can get the initial changes in, which is the major part of the challenge.  For the most part, I think we could eventually refactor soc-usb to behave similarly to what hda_bind.c is doing.  Both entities are the ones that handle linking (or creation in case of HDA) of ASoC components.  The one major factor I can see is that within the HDA implementation vs USB SND is that, for USB, hot plugging is a common practice, and that's a scenario that will probably need more discussion if we do make that shift.
>>
>>
>> Anyway, I just wanted to acknowledge the technical details that are utilized by HDAudio, and that we could potentially get there with USB SoC as well.
> 
> Hello,
> 
> 
> After analyzing the USB for some time to get an even better understanding of what's present in this series, I arrived at a conclusion that indeed, the approach present here clearly differs from what I would call _by the book_ approach for hardware-based USB Audio offloading.
> 
> All sections below refer to the public xHCI spec [1].
> A high-level bullets for the probing procedure:
> 
> 1. xHCI root and resources probe() as they do today
> 2. xHCI reads HCCPARAMS2 (section 5.3.9) and checks GSC bit
> 2a. If GSC==0, the UAOL enumeration halts
> 
> 3. xHCI sends GET_EXTPROP_TRB with ECI=1 to retrieve capabilities supported (section 4.6.17 and Table 4-3)
> 3a. If AUDIO_SIDEBAND bit is not set, the UAOL enumeration halts
> 
> 4. Create a platform_device instance. This instance will act as a bridge between USB and ASoC world. For simplicity, let's call it usb-component, a representative of USB in struct snd_soc_component.
> 
> 5. On the platform_device->probe() the device requests information about resources available from xHCI (section 7.9.1.1), ECI=1, SubType=001
> 6. Allocate a list of streams per device or list per endpoint supported based on the data retrieved with the followup TRB of SubType=010.
> 
> (things get more complicated here, stopping)
> 
> Now, any time a sound card with bound usb-component would begin PCM operation, starting with substream->open(), the component would first check if the device and/or the endpoint has resources necessary to support offloading. If not, it would fallback to the non-offloaded case.

It's not really a fallback in the mutually exclusion sense. Even if the resources are present, the non-offloaded path shall always be usable.

> I do not see implementation for any TRBs I mentioned above here. The HCCPARAMS2 seem to be ignored too. At the same time, I'm unsure about the "interrupters" piece. I believe they make the approach present here somehow work, yet may not be required by the _by the book_ approach at all.

There are clearly platform-specific differences in the way the offloaded resources are exposed. The public xHCI spec may not be enough to describe all cases, and the interrupt mechanism is different as well. 

The xHCI spec also only tells whether offloaded is possible at a high-level, but there are additional dependencies on DSP firmware/topology to expose those streams. In other words, when those extended bits are not set then offload if not possible, but if they are there's still a number of dependencies that need to be checked.



