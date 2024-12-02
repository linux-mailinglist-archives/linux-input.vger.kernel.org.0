Return-Path: <linux-input+bounces-8359-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AF99E0EF4
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 23:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A79AB248CE
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 22:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15E31DF731;
	Mon,  2 Dec 2024 22:36:29 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosgizsys.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370D36F30C;
	Mon,  2 Dec 2024 22:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733178989; cv=none; b=JS8galybGLj2eEqbxBZobHhY1fyQP6JmP930s8A8WKZh6jrloOWN6WOL2GJV9N2Koe+TOVxMat8fHlS8YZdFcm9pwHQVZEz5rb9PeJn3YfIBuirteR7pXB6ZtmGdvM8jMA3XZnnBLMUuocXCqvGW7XHmnJ30xPXzJ9tLjwY3utY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733178989; c=relaxed/simple;
	bh=f5hnMyZ2RATRhxOsOkINqN46PdMenZIt2F+Y9cELyy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r/Pjqf+KeLLg6Z+zuH0M3VwP0RkflmxI3t95ZjiaC3mlwIrs0KcnL2X5rZujV2jA7HrlXARV1h8zIQq6dBILYQA45mZ1AAEfEhhWD74QSzHUDQct5G1KQhwjyXYXeETCOPfHmBA8zwDW2aw5KPTPHRQOoOIiNMHiIcCCmeY2K3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.101] (c-73-190-111-195.hsd1.wa.comcast.net [73.190.111.195])
	by host11.cruzio.com (Postfix) with ESMTPSA id E4FED273BA61;
	Mon,  2 Dec 2024 14:36:26 -0800 (PST)
Message-ID: <4f6d6f5e-f912-483b-bb8b-3a8bdae6bd17@cosmicgizmosystems.com>
Date: Mon, 2 Dec 2024 14:36:26 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ALSA: usb-audio: Add quirk for Plantronics headsets
 to fix control names
To: Takashi Iwai <tiwai@suse.de>
Cc: Jiri Kosina <jikos@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Wade Wang <wade.wang@hp.com>, Benjamin Tissoires <bentiss@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-input@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20241124203252.28701-1-linuxhid@cosmicgizmosystems.com>
 <20241124203252.28701-3-linuxhid@cosmicgizmosystems.com>
 <87frnfzmul.wl-tiwai@suse.de>
Content-Language: en-US
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
In-Reply-To: <87frnfzmul.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/24 1:25 AM, Takashi Iwai wrote:
> On Sun, 24 Nov 2024 21:32:41 +0100,
> Terry Junge wrote:
>>
>> Many Poly/Plantronics headset families name the feature, input,
>> and/or output units in a such a way to produce control names
>> that are not recognized by user space. As such, the volume and
>> mute events do not get routed to the headset's audio controls.
>>
>> As an example from a product family:
>>
>> The microphone mute control is named
>> Headset Microphone Capture Switch
>> and the headset volume control is named
>> Headset Earphone Playback Volume
>>
>> The quirk fixes these to become
>> Headset Capture Switch
>> Headset Playback Volume
>>
>> Signed-off-by: Terry Junge <linuxhid@cosmicgizmosystems.com>
> 
> Thanks, this description looks much more understandable now.
> Meanwhile...
> 
>> ---
>>  sound/usb/mixer_quirks.c | 35 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>
>> diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
>> index 8bbf070b3676..20d63efd5498 100644
>> --- a/sound/usb/mixer_quirks.c
>> +++ b/sound/usb/mixer_quirks.c
>> @@ -4215,6 +4215,37 @@ static void snd_dragonfly_quirk_db_scale(struct usb_mixer_interface *mixer,
>>  	}
>>  }
>>  
>> +static void snd_fix_plt_control_name(struct snd_kcontrol *kctl)
>> +{
>> +	static const char * const names_to_remove[] = {
>> +		"Earphone",
>> +		"Microphone",
>> +		"Receive",
>> +		"Transmit",
>> +		NULL
>> +	};
>> +	const char * const *n2r;
>> +	char *dst, *src;
>> +	size_t len;
>> +
>> +	for (n2r = names_to_remove; *n2r; ++n2r) {
>> +		dst = strstr(kctl->id.name, *n2r);
>> +		if (dst) {
>> +			src = dst + strlen(*n2r);
>> +			len = strlen(src) + 1;
>> +			if ((char *)kctl->id.name != dst && *(dst - 1) == ' ')
>> +				--dst;
>> +			memmove(dst, src, len);
>> +		}
>> +	}
>> +	if (kctl->id.name[0] == ' ') {
>> +		char rcat[sizeof(kctl->id.name)] = { "Headset" };
>> +
>> +		strlcat(rcat, kctl->id.name, sizeof(rcat));
>> +		strscpy(kctl->id.name, rcat, sizeof(kctl->id.name));
>> +	}
>> +}
> 
> ... the code itself isn't really trivial (due to the poor string
> handling by nature of C language), so it's better to put some brief
> comment what this function really does, too.

Thanks Takashi,

I'll comment the function in v2 and send it out.

> 
> 
> thanks,
> 
> Takashi


