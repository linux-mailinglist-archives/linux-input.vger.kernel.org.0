Return-Path: <linux-input+bounces-8377-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F15D19E3309
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 06:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C291D1667DD
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 05:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D16916A395;
	Wed,  4 Dec 2024 05:23:39 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosgizsys.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86865145B2C;
	Wed,  4 Dec 2024 05:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733289819; cv=none; b=EHLPQxN8dmzHm2HCAwmRpmtG5RyuhvVh1ueOfZIW74FObl8UhkXxHRTYaFWkIRhXFQhk/FV79wkraFRzIL1E9tTexd/bGOKylUgF1apZCy4KKkuka9ehsHBmph3lUxJdLhy5L877wR6jrsvZAiOZapnmR+V5hw4LFhGqsHAvCQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733289819; c=relaxed/simple;
	bh=y4z5BjSn6j9STTqTQXIvStKSNO0kr79zXIRV5ZejEq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PuJ5SNVQ2vJmh0fjS3Noz9myXg+hkpCMBVC9wrp9jWu+4X2htton3SF0Szcx9syDaWwpSDLz5SdA6PVpomsYOwmDpsCtt88ypVqk7eJmi4oBySvx1m29dclPeVOdGLPPULsnybopg7tUOYmiLjEqTsxSUKro9rqzo2/rMbYdDOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.101] (c-73-190-111-195.hsd1.wa.comcast.net [73.190.111.195])
	by host11.cruzio.com (Postfix) with ESMTPSA id BEC8A21637E3;
	Tue,  3 Dec 2024 21:23:30 -0800 (PST)
Message-ID: <93cbb09f-1e0c-4dd8-8ddf-f46f36f4a3af@cosmicgizmosystems.com>
Date: Tue, 3 Dec 2024 21:23:30 -0800
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
 <dc2bef93-9d74-4700-82e4-575e462dbc16@cosmicgizmosystems.com>
 <87jzchz0g1.wl-tiwai@suse.de>
Content-Language: en-US
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
In-Reply-To: <87jzchz0g1.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/2/24 11:32 PM, Takashi Iwai wrote:
> On Mon, 02 Dec 2024 23:35:51 +0100,
> Terry Junge wrote:
>>
>> On 11/25/24 12:55 AM, Takashi Iwai wrote:
>>> On Sun, 24 Nov 2024 21:32:39 +0100,
>>> Terry Junge wrote:
>>>>
>>>> Hi Jiri and Takashi,
>>>>
>>>> I'm not sure how it works with two different maintained trees
>>>> but this patch set needs to be applied and flow upstream together.
>>>>
>>>> If the HID patch is applied without the ALSA patch then mute sync
>>>> issues will occur with multiple Poly/Plantronics product families.
>>>
>>> Both patches can be applied individually, and even if only one of them
>>> is applied, it won't hurt.  So I guess both subsystems can take the
>>> corresponding one at any time.
>>>
>>
>> Hi Takashi,
>>
>> I've tested out the behavior with each patch individually applied and
>> have found that, IMHO, the mute functionality and synchronization is
>> worse than the current behavior with neither patch. However, with both
>> patches applied the mixer UI microphone mute control and the headset
>> mute button are fully synchronized.
> 
> That's odd.  How can it worsen?  As far as I understand from the patch
> descriptions, the USB-audio patch corrects only the mixer volume
> control names, while the HID patch changes the quirk to be generalized
> (to be dropped the next key in a short period).  If only USB audio
> patch is applied, it doesn't matter as the volume binding didn't
> happen before the patch.  OTOH, ditto, if only HID patch is applied.
> Am I missing anything here?

The USB-audio patch also corrects the names for the mixer switch controls.
The HID patch also adds mapping of the mute button to the KEY_MICMUTE event.
It's not the playback volume handling that gets worse, it's the capture
switch handling that gets worse.

The USB-audio patch allows the mixer to bind to the headset's mute control in
the feature unit and mute/un-mute the headset microphone while the HID patch
allows the headset to request the mixer to toggle the microphone mute state.

Both patches are needed for microphone mute synchronization to work.

thanks,

Terry

> 
>> There must be a way that both patches can be tied together and be
>> applied simultaneously.
>>
>> If it would help, and be allowed, I can submit a single patch that
>> contains both changes.
> 
> Applying both from the single tree is possible, sure.  One of two
> needs an ack from the subsystem maintainers.
> 
> 
> thanks,
> 
> Takashi
> 
>>
>> Thanks,
>> Terry
>>
>>>
>>> thanks,
>>>
>>> Takashi
>>>
>>>>
>>>> This patch set was tested by Wade and myself with multiple
>>>> Poly/Plantronics product family headsets.
>>>>
>>>> Hi Wade,
>>>>
>>>> Please feel free to add your Signed-off-by: and/or Tested-by: tags,
>>>> as you see fit.
>>>>
>>>> Thanks,
>>>> Terry
>>>>
>>>> Terry Junge (2):
>>>>   HID: hid-plantronics: Add mic mute mapping and generalize quirks
>>>>   ALSA: usb-audio: Add quirk for Plantronics headsets to fix control
>>>>     names
>>>>
>>>>  drivers/hid/hid-plantronics.c | 135 ++++++++++++++++------------------
>>>>  sound/usb/mixer_quirks.c      |  35 +++++++++
>>>>  2 files changed, 100 insertions(+), 70 deletions(-)
>>>>
>>>>
>>>> base-commit: 28eb75e178d389d325f1666e422bc13bbbb9804c
>>>> -- 
>>>> 2.43.0
>>>>
>>


