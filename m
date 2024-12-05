Return-Path: <linux-input+bounces-8414-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AFC9E6062
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2024 23:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62C2B169142
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2024 22:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B7A1B87ED;
	Thu,  5 Dec 2024 22:19:10 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosgizsys.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2C45028C;
	Thu,  5 Dec 2024 22:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733437150; cv=none; b=X4erLvUBwIDLlDr0TvRMb+Pqkb/yNfsxq3tyhRG88z8yaHTestlnM45hNA3ot/AXc7h/jOjL18vYsZA82PFR68TTfdlZQ6pF9IHRUFor69PtERdQEnGZ3fCJk0tZOiqcEuWenONJ1oPDzwzwWdbYMHbMYYPbdIoBPzbYz9oqfN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733437150; c=relaxed/simple;
	bh=hzBcI6R5cAcxLtTTAZZGVktcjpOQ3gCa0TD43YWGKWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lfBNBz6QUkmmZXTlT1rlU17J9cVbBouRY+CM9K1w7C96VkI/6sR0LL1Td1KJ/n2o8EianBm6ROP/+K/Lv3+pF5LBMYYzzsZlsW9VfYxhALSSxD1523C0NR5mnBNQmxI8oueXs/CKf1Lu/X5aRAsu4G3+FcKo5ypXmrRF4snYNDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.101] (c-73-190-111-195.hsd1.wa.comcast.net [73.190.111.195])
	by host11.cruzio.com (Postfix) with ESMTPSA id 4F149295B839;
	Thu,  5 Dec 2024 14:19:01 -0800 (PST)
Message-ID: <f107e133-c536-43e5-bd4f-4fcb8a4b4c7f@cosmicgizmosystems.com>
Date: Thu, 5 Dec 2024 14:19:00 -0800
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
 <93cbb09f-1e0c-4dd8-8ddf-f46f36f4a3af@cosmicgizmosystems.com>
 <877c8gx7ev.wl-tiwai@suse.de>
Content-Language: en-US
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
In-Reply-To: <877c8gx7ev.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/3/24 10:56 PM, Takashi Iwai wrote:
> On Wed, 04 Dec 2024 06:23:30 +0100,
> Terry Junge wrote:
>>
>> On 12/2/24 11:32 PM, Takashi Iwai wrote:
>>> On Mon, 02 Dec 2024 23:35:51 +0100,
>>> Terry Junge wrote:
>>>>
>>>> On 11/25/24 12:55 AM, Takashi Iwai wrote:
>>>>> On Sun, 24 Nov 2024 21:32:39 +0100,
>>>>> Terry Junge wrote:
>>>>>>
>>>>>> Hi Jiri and Takashi,
>>>>>>
>>>>>> I'm not sure how it works with two different maintained trees
>>>>>> but this patch set needs to be applied and flow upstream together.
>>>>>>
>>>>>> If the HID patch is applied without the ALSA patch then mute sync
>>>>>> issues will occur with multiple Poly/Plantronics product families.
>>>>>
>>>>> Both patches can be applied individually, and even if only one of them
>>>>> is applied, it won't hurt.  So I guess both subsystems can take the
>>>>> corresponding one at any time.
>>>>>
>>>>
>>>> Hi Takashi,
>>>>
>>>> I've tested out the behavior with each patch individually applied and
>>>> have found that, IMHO, the mute functionality and synchronization is
>>>> worse than the current behavior with neither patch. However, with both
>>>> patches applied the mixer UI microphone mute control and the headset
>>>> mute button are fully synchronized.
>>>
>>> That's odd.  How can it worsen?  As far as I understand from the patch
>>> descriptions, the USB-audio patch corrects only the mixer volume
>>> control names, while the HID patch changes the quirk to be generalized
>>> (to be dropped the next key in a short period).  If only USB audio
>>> patch is applied, it doesn't matter as the volume binding didn't
>>> happen before the patch.  OTOH, ditto, if only HID patch is applied.
>>> Am I missing anything here?
>>
>> The USB-audio patch also corrects the names for the mixer switch controls.
>> The HID patch also adds mapping of the mute button to the KEY_MICMUTE event.
>> It's not the playback volume handling that gets worse, it's the capture
>> switch handling that gets worse.
> 
> That's what I don't understand -- how can it get worse?  The key
> binding didn't work beforehand, no?  Now HID patch handles the
> mic-mute key event, but what can it *break* without USB-audio patch?

Sorry, it's a long story...
All this describes the behavior I see with Ubuntu 24.04.1.


The current mute behavior with no patch:

Headset cannot communicate mute toggle intent to mixer
Mixer cannot communicate mute state to headset

Due to the name of the microphone mute control a software based mute control is
created that mutes the capture stream after it is received from the headset. It
is toggled on/off with the UI mixer dialog. Toggling this control is not
reflected in the headset, mute LED does not toggle, "Mute On" and "Mute Off"
prompts do not play (on some models). This mute control is totally independent
of the headset's mute state.

The headset also has a mute control that is toggled on/off with the headset mute
button. It mutes the capture stream before it is sent to the host. Mute state is
reflected in the mute LED and/or mute prompts. As the headset's mute control did
not get bound to the mixer, this mute control is also totally independent of the
software mute control.

If either of these mute controls are muted then the capture stream is muted.
Only if both controls are unmuted will the capture stream be live. So if the
user mutes with the UI mute control then they need to unmute with the UI
control. If they mute with the headset button then they need to unmute with
the headset button.


The mute behavior with only the HID patch:

Headset can communicate mute toggle intent to mixer
Mixer cannot communicate mute state to headset

A software mute control is created with the same characteristics as described
above with one addition. Not only does the software mute control toggle by using
the UI mixer dialog. It can now be toggled by the headset mute button sending the
mic-mute key event. This mute control is no longer totally independent.

The headset mute control is still as described above with the addition of
firing a mic-mute event when the mute button is pressed. So every press of the
mute button toggles the headset mute state and toggles the state of the
software mute control. This mute control is still totally independent. You can
only toggle it with the headset mute button.

So now the following scenario is possible...
Remember that if either control is muted the capture stream will be muted.

Mute using the UI dialog - software control is muted, headset control is not
Press headset mute button - headset control is muted, software control is not
Press headset mute button - software control is muted, headset control is not
...
Press headset mute button - headset control is muted, software control is not
Press headset mute button - software control is muted, headset control is not
Unmute using the UI dialog - both software and headset controls are not muted
Press headset mute button - both software and headset controls are muted
Press headset mute button - both software and headset controls are not muted

So the user should not use the UI dialog to toggle microphone mute.


The mute behavior with only the USB-audio patch:

Headset cannot communicate mute toggle intent to mixer
Mixer can communicate mute state to headset

With the names corrected the mixer now binds to the audio controls in the
headset. A software mute control is no longer created. Toggling the mute
control in the UI dialog actually sends the mute or unmute setting to
the headset's feature unit. As such, the mixer is in direct control of the
headset's mute state.

The headset mute button is not sending mic-mute events so it is unable to
request the mixer to toggle the mute state. The headset will comply with the
audio control mute/unmute commands as they come in. The headset's response to
mute button presses depends on the last audio control mute command received
from the host. If the last command was unmute then the mute button presses will
toggle the local mute state as described in earlier paragraphs. If the last
command was mute then the mute button presses will *not* unmute the headset.

So if the user mutes the microphone using the UI dialog, the headset will mute.
Then pressing the headset's mute button will result in the headset playing its
ummute prompt (beeps or "Mute Off") followed immediately by playing its mute
prompt (beeps or "Mute On") and the headset remains muted. At this point the
only way to unmute is by using the UI dialog.
 
So the user should not use the UI dialog to toggle microphone mute.
 

The mute behavior with both patches:

Headset can communicate mute toggle intent to mixer
Mixer can communicate mute state to headset

The microphone can be muted or unmuted by using the UI dialog or the headset's
mute button, in any order.


So...
Neither of the single patch scenarios is actually *broken*. The user can
mute or unmute the headset although some confusion can occur if the UI dialog
is utilized.

So it comes down to user experience and possibility for confusion to rate them
from best to worst.

Are either of the single patch scenarios better than or equal to the no patch
scenario?

thanks,

Terry

> 
>> The USB-audio patch allows the mixer to bind to the headset's mute control in
>> the feature unit and mute/un-mute the headset microphone while the HID patch
>> allows the headset to request the mixer to toggle the microphone mute state.
>>
>> Both patches are needed for microphone mute synchronization to work.
> 
> Sure, but the question is what becomes *worse* by one of them.
> 
> 
> thanks,
> 
> Takashi
> 
>>
>> thanks,
>>
>> Terry
>>
>>>
>>>> There must be a way that both patches can be tied together and be
>>>> applied simultaneously.
>>>>
>>>> If it would help, and be allowed, I can submit a single patch that
>>>> contains both changes.
>>>
>>> Applying both from the single tree is possible, sure.  One of two
>>> needs an ack from the subsystem maintainers.
>>>
>>>
>>> thanks,
>>>
>>> Takashi
>>>
>>>>
>>>> Thanks,
>>>> Terry
>>>>
>>>>>
>>>>> thanks,
>>>>>
>>>>> Takashi
>>>>>
>>>>>>
>>>>>> This patch set was tested by Wade and myself with multiple
>>>>>> Poly/Plantronics product family headsets.
>>>>>>
>>>>>> Hi Wade,
>>>>>>
>>>>>> Please feel free to add your Signed-off-by: and/or Tested-by: tags,
>>>>>> as you see fit.
>>>>>>
>>>>>> Thanks,
>>>>>> Terry
>>>>>>
>>>>>> Terry Junge (2):
>>>>>>   HID: hid-plantronics: Add mic mute mapping and generalize quirks
>>>>>>   ALSA: usb-audio: Add quirk for Plantronics headsets to fix control
>>>>>>     names
>>>>>>
>>>>>>  drivers/hid/hid-plantronics.c | 135 ++++++++++++++++------------------
>>>>>>  sound/usb/mixer_quirks.c      |  35 +++++++++
>>>>>>  2 files changed, 100 insertions(+), 70 deletions(-)
>>>>>>
>>>>>>
>>>>>> base-commit: 28eb75e178d389d325f1666e422bc13bbbb9804c
>>>>>> -- 
>>>>>> 2.43.0
>>>>>>
>>>>
>>


