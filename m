Return-Path: <linux-input+bounces-9241-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 971D3A113ED
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 23:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D21A418895BC
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 22:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE12211463;
	Tue, 14 Jan 2025 22:14:17 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosmicgizmosystems.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8E81487DD;
	Tue, 14 Jan 2025 22:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736892857; cv=none; b=uxn1kK5XYDeOfk8UcFPQTAiNmXSmeY3ZHXfkg2ZHV6AzhopYInjPDlKm49ZJ7LTfj02Q3lPCbh5+8nqlu0SZgvIqwIYxXrLMC6uDDoOJrOBBptyuUNJkQSvmLa2lj7Nj7shOq+iZEXhKCteWoFTyqXqZZHSu/W1rRUaV2UL0Np8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736892857; c=relaxed/simple;
	bh=8DSR3j1GnzWEYa5wNdR4ee4TBfqlTMwM7GWS6GaoF68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjhRMTORug+WIWWF6bPngtTuVKpzCLFIBKxPyI4PsU6JX0imuaKNQyZ/w2L7mL6g11X1mptQgoHXRZUrtHU64w9bEjzrx0n6HKUajIACbvFvyWggwvJ2M2bKj7kaRelQ6AQZ4Tng/ipRc7D4KLO3lXnGJmxiL8oqz1gwQ7R/YmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.101] (c-73-190-111-195.hsd1.wa.comcast.net [73.190.111.195])
	by host11.cruzio.com (Postfix) with ESMTPSA id BADAE2309BEC;
	Tue, 14 Jan 2025 14:14:13 -0800 (PST)
Message-ID: <6273ad6b-3c3c-4cc3-9b7e-1da5066d2321@cosmicgizmosystems.com>
Date: Tue, 14 Jan 2025 14:14:13 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] ALSA: usb-audio: Add quirk for Plantronics
 headsets to fix control names
To: Takashi Iwai <tiwai@suse.de>
Cc: Jiri Kosina <jikos@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Wade Wang <wade.wang@hp.com>, Benjamin Tissoires <bentiss@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-input@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250113235212.78127-1-linuxhid@cosmicgizmosystems.com>
 <20250113235212.78127-3-linuxhid@cosmicgizmosystems.com>
 <87jzaxzi24.wl-tiwai@suse.de>
Content-Language: en-US
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
In-Reply-To: <87jzaxzi24.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/14/25 4:38 AM, Takashi Iwai wrote:
> On Tue, 14 Jan 2025 00:51:59 +0100,
> Terry Junge wrote:
>>
>> +/*
>> + * Some Plantronics headsets have control names that don't meet ALSA naming
>> + * standards. This function fixes nonstandard source names. By the time
>> + * this function is called the control name should look like one of these:
>> + * "source names Playback Volume"
>> + * "source names Playback Switch"
>> + * "source names Capture Volume"
>> + * "source names Capture Switch"
>> + * If any of the trigger words are found in the name then the name will
>> + * be changed to:
>> + * "Headset Playback Volume"
>> + * "Headset Playback Switch"
>> + * "Headset Capture Volume"
>> + * "Headset Capture Switch"
>> + * depending on the current suffix.
>> + */
>> +static void snd_fix_plt_name(struct snd_usb_audio *chip,
>> +			     typeof_member(struct snd_ctl_elem_id, name) * name)
> 
> I personally find this style of argument is difficult to use.
> That said, IMO, it's better to stick with the argument
>   struct snd_ctl_elem_id *id
> and access via id->name as in your earlier patch; it's more idiomatic,
> and easier to read.
> 
So, is the coding of the rest of the function body acceptable if I just pass a
   struct snd_ctl_elem_id *id
instead of an
   unsigned char[44] *name
?

If not, what else do I need to address in V4 so it will be accepted?

thanks,

Terry
> 
> thanks,
> 
> Takashi


