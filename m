Return-Path: <linux-input+bounces-8360-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB50F9E0EFC
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 23:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8159B28171D
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 22:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495AF1DE89C;
	Mon,  2 Dec 2024 22:44:24 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosgizsys.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F03125B9;
	Mon,  2 Dec 2024 22:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733179464; cv=none; b=jRpgJ7mAx/UuufXdjzG7+aHpFdRFIWGOvxmOMLcV2m0VBiLGuogq0wok1V6hUVd03tozlNsIksFJ5e28vIrlW7gEP3ocEVuN7qEvUmBmuTCfxOZ8062cuuYPFLRIZNguOpDleKw91CpWD3MTmEZ8VEsTfg6K67iblHHDXC4sOmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733179464; c=relaxed/simple;
	bh=pYOX088XZJK1KGOjdZImP4IQkYwNqoZyYqNx8itMCbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+TvCQ6OkipgqOXTFFfB7j+H6WXWjBHi2TisHiPaL9QDnm0CI/NBnSf0LnrTdIGaqetcM1OuUhGHLpIxYgLNHLZzcQxUFySSMncXeQmOceagvIP+nbMed0Tk56HdxUhAUd7uiEnf+N6RuzR5sQLPLL4jHDoYyzx5DsRxEZl1kmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.101] (c-73-190-111-195.hsd1.wa.comcast.net [73.190.111.195])
	by host11.cruzio.com (Postfix) with ESMTPSA id 6B5CA272AFBE;
	Mon,  2 Dec 2024 14:35:52 -0800 (PST)
Message-ID: <dc2bef93-9d74-4700-82e4-575e462dbc16@cosmicgizmosystems.com>
Date: Mon, 2 Dec 2024 14:35:51 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Introduce Poly/Plantronics mute event support
To: Takashi Iwai <tiwai@suse.de>
Cc: Jiri Kosina <jikos@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Wade Wang <wade.wang@hp.com>, Benjamin Tissoires <bentiss@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-input@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20241124203252.28701-1-linuxhid@cosmicgizmosystems.com>
 <87h67vzo8z.wl-tiwai@suse.de>
Content-Language: en-US
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
In-Reply-To: <87h67vzo8z.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/24 12:55 AM, Takashi Iwai wrote:
> On Sun, 24 Nov 2024 21:32:39 +0100,
> Terry Junge wrote:
>>
>> Hi Jiri and Takashi,
>>
>> I'm not sure how it works with two different maintained trees
>> but this patch set needs to be applied and flow upstream together.
>>
>> If the HID patch is applied without the ALSA patch then mute sync
>> issues will occur with multiple Poly/Plantronics product families.
> 
> Both patches can be applied individually, and even if only one of them
> is applied, it won't hurt.  So I guess both subsystems can take the
> corresponding one at any time.
> 

Hi Takashi,

I've tested out the behavior with each patch individually applied and
have found that, IMHO, the mute functionality and synchronization is
worse than the current behavior with neither patch. However, with both
patches applied the mixer UI microphone mute control and the headset
mute button are fully synchronized.

There must be a way that both patches can be tied together and be
applied simultaneously.

If it would help, and be allowed, I can submit a single patch that
contains both changes.

Thanks,
Terry

> 
> thanks,
> 
> Takashi
> 
>>
>> This patch set was tested by Wade and myself with multiple
>> Poly/Plantronics product family headsets.
>>
>> Hi Wade,
>>
>> Please feel free to add your Signed-off-by: and/or Tested-by: tags,
>> as you see fit.
>>
>> Thanks,
>> Terry
>>
>> Terry Junge (2):
>>   HID: hid-plantronics: Add mic mute mapping and generalize quirks
>>   ALSA: usb-audio: Add quirk for Plantronics headsets to fix control
>>     names
>>
>>  drivers/hid/hid-plantronics.c | 135 ++++++++++++++++------------------
>>  sound/usb/mixer_quirks.c      |  35 +++++++++
>>  2 files changed, 100 insertions(+), 70 deletions(-)
>>
>>
>> base-commit: 28eb75e178d389d325f1666e422bc13bbbb9804c
>> -- 
>> 2.43.0
>>


