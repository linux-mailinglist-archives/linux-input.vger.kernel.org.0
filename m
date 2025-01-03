Return-Path: <linux-input+bounces-8880-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FF7A01138
	for <lists+linux-input@lfdr.de>; Sat,  4 Jan 2025 01:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BEB13A4A01
	for <lists+linux-input@lfdr.de>; Sat,  4 Jan 2025 00:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B844A36B;
	Sat,  4 Jan 2025 00:04:29 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosgizsys.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBC42F5E;
	Sat,  4 Jan 2025 00:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735949069; cv=none; b=UOvpHbEfmzjY9QvK1Tr3EXFwD9jwSwc9Q97p5TNggLyR9l5pCGAK2/8S6nVZ/0L7IH6zhnbj5g1q/66jY9DKh/xAmWm/MipmIMqHYJVWj2kMhl4cru3R5mDVyZJjk65q1TZHLuxlJULWcQ2VveCyNwXDRdqwHSDuFIIpqvniw+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735949069; c=relaxed/simple;
	bh=7LydXkYa5taeq99Ba2wzlBgoTaiTZV7yI8ZDxX6HGGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SqY/fIIuEELgGXPEf7E5AdgTEYhEzyOwrHiUPmjsHWTkaR8ph5jhK755n3/eYoEssecQmWRo+YyP2xftaxoxmmYCajCsRujgzd5AtT88bLs/70WBAHgMAJDi4YdutPJbbpeUycEgsZxuNXaYsHpb+1XTA3OYGkqFyGtpTttj/os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.101] (c-73-190-111-195.hsd1.wa.comcast.net [73.190.111.195])
	by host11.cruzio.com (Postfix) with ESMTPSA id BBA582988924;
	Fri,  3 Jan 2025 15:57:34 -0800 (PST)
Message-ID: <7da840d3-23c3-40a8-bbed-b95c807e8501@cosmicgizmosystems.com>
Date: Fri, 3 Jan 2025 15:57:34 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ALSA: usb-audio: Add quirk for Plantronics
 headsets to fix control names
To: Takashi Iwai <tiwai@suse.de>, Wade Wang <wade.wang@hp.com>
Cc: jikos@kernel.org, tiwai@suse.com, bentiss@kernel.org, perex@perex.cz,
 linux-input@vger.kernel.org, linux-sound@vger.kernel.org,
 stable@vger.kernel.org
References: <20241224065636.1870713-1-wade.wang@hp.com>
 <20241224065636.1870713-2-wade.wang@hp.com> <87msg7zyiq.wl-tiwai@suse.de>
Content-Language: en-US
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
In-Reply-To: <87msg7zyiq.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/3/25 7:51 AM, Takashi Iwai wrote:
> On Tue, 24 Dec 2024 07:56:36 +0100,
> Wade Wang wrote:
>>
>> From: Terry Junge <linuxhid@cosmicgizmosystems.com>
>>
> 
> Thanks to your updated comments, it's a bit better understandable
> now.  However, IMO, it's still too complex than needed.
> 
> Basically what we want is to make those kctl names just like "Headset
> Playback Switch" from the original "Earphone Headset Playback Switch".
> If so, a simpler code would be something like:
> 
> static void fix_plantronics_control_name(struct usb_mixer_interface *mixer,
> 					 struct snd_kcontrol *kctl)
> {
> 	static const char * const prefix_to_match[] = {
> 		"Headset", "Earphone", "Microphone", "Receive", "Transmit"
> 	};
> 	static const char * const suffix[] = {
> 		"Playback Volume", "Playback Switch",
> 		"Capture Volume", "Capture Switch"
> 	};
> 	int i;
> 	
> 	for (i = 0; i < ARRAY_SIZE(prefix_to_match); i++) {
> 		if (strstr(kctl->id.name, prefix_to_match[i]))
> 			break;
> 	}
> 	if (i >= ARRAY_SIZE(prefix_to_match))
> 		return;
> 
> 	for (i = 0; i < ARRAY_SIZE(suffix); i++) {
> 		if (strstr(kctl->id.name, suffix[i])) {
> 			usb_audio_dbg(mixer->chip, "fix kctl name %s\n",
> 				      kctl->id.name);
> 			sprintf(kctl->id.name, "Headset %s", suffix[i]);
> 			return;
> 		}
> 	}
> }
> 
> 
> One may put a space around the word if we want to make sure that it's
> a separated word, but I hope you get the idea by the example above.
> This is no hot code path and it runs only once at probe, so the code
> readability and understandability are much more important than
> efficiency, after all.
> 

No problem, I'll submit v3 with your suggestions.

Thanks,

Terry

> 
> thanks,
> 
> Takashi


