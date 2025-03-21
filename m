Return-Path: <linux-input+bounces-11048-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E99BFA6B358
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 04:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B5913B82E1
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 03:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6D31E8854;
	Fri, 21 Mar 2025 03:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="hbGNyzuo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pYQ0Uh2A"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944FB1E5B76;
	Fri, 21 Mar 2025 03:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742527748; cv=none; b=Lpj30HTalgpqZ2EZVAA23cXumToDFubzpUD3pWE3G6jH7snUJ+GzRlpRPIDLPo8v/OdFMdPQWTVy2oLX50kCqOsW9xlXdPgF4XbyKTmZ3nt/0Vi7xE4r5Fbsx0uyIEBE6QviqJC8hxDg8GlJiIHj6+P7qOCo96t5JPfBHwaMea4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742527748; c=relaxed/simple;
	bh=oJ/c0LNpf9do/WkN0FAZ3Ro6m4kIvAJPlJykLxV3558=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ju4vRsyNV3KEWgkP2LMXQXt+cGpNSK4sIMO6k7YdjGE1wd19SK7vyu5JZi38pDFMBJoskm7dDPZZ9R6nNnaP6/YCAHF9c5xzw+MwrOxU6u1lZ08t4lsq3NC0pWBeQp90kh20NPnLhq/aCYn12XsAtMRfnQi0DIygF5XUWteymHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=hbGNyzuo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pYQ0Uh2A; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 57B1C1140180;
	Thu, 20 Mar 2025 23:29:03 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 20 Mar 2025 23:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742527743;
	 x=1742614143; bh=UgpCivlD4erkuP0+cv6OC/cYz5YurYdtgdJAbyDw7yE=; b=
	hbGNyzuoY7/Jvh4KZ1t7bkgIxBJAchIQX6th8hma0LmXjaXDuhiTKwIyBVeG68Bt
	lBmTJ3mAxMksvs5gZdybZp5y8JIgUOxyGXF21HaYAo9M1uKHgZhtdjmJs5j+5wAJ
	OSBbLe8rnjcyZA9z0VlbCykq/o22anMK9PjuMLrU5xYjebsg8HguqYMQUMlDV5A3
	gLP9zyGcchC4gQvwS7GFQHSk/5qPJBPB5gRDB0HWi1Dfwlaw1B85IoC+J0jDQlYe
	99K/SIZy6PEKCdPCxtfrFx/D2jw0V+1dzXcL/tHDBVeeQVoGx9Z9x1tytksPyjR8
	sXTm8TLwwO3z82Xlye4iOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742527743; x=
	1742614143; bh=UgpCivlD4erkuP0+cv6OC/cYz5YurYdtgdJAbyDw7yE=; b=p
	YQ0Uh2AEnB7LnJK4WX6hu+0dNRp2ytX1yMEcBu9oaEOrFFstvHrrqIQ+heH/A2rM
	uxcKgj31+9UvkDV2gq3dZlX8y74Oqralj53Y2dPplL+SyNpW5YsJNrBHbHiW3och
	hI3uLtJZWNvXfKzxzTsOLyUakkHztCF7gLdfFyxNQnCatpwpMtpfCeHQyK3ZsfEH
	vmS84MtJjHlwVEtb+tJKnYISQmzpYuj6outS5zuExM8US11xr3qki0NdJK82M7G8
	6x7FBvzU3UaDIQhH6rvUJxE2Gq78covvNZK7uqUXH5MWwhS40UGWUIlbHV3GytqI
	haObgLo1AW0EROxjwwIdw==
X-ME-Sender: <xms:_tzcZ-DxQZBvUBRNDNevboM4ZeCdJsbPdSvJCJp4usPr1kUAH9oeRg>
    <xme:_tzcZ4hY2S38kUWko5kT6ikTLaQxs6aPOLWeNvuJQjoPHz2smMgG-U8H-rHKjv7aL
    k_ewY8aJe0J7wRjfhM>
X-ME-Received: <xmr:_tzcZxk61U_2mYwTo8GnGh71uEHd_Uz3_06J2qJ-ebzNsDLlWBD4bD0xRhsw7pCj3zlMMZHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedttdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddt
    vdejnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhhonh
    gvshdruggvvheqnecuggftrfgrthhtvghrnhepieegkeevveffleeftdeigeduhfekfedu
    ueeludfhheffhfdtkefhkefffeetuddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluhhk
    vgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehlkhhmlhesrghnthhhvggrshdruggvvhdprhgtphhtthhopehp
    lhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsvghn
    thhishhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhrvghnthhinhdrtghhrg
    hrhiesghhmrghilhdrtghomhdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrght
    rdgtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnth
    gvlhdrtghomh
X-ME-Proxy: <xmx:_tzcZ8ye6xHH2zqBiTnWpvHHPoq7R7aMKMiP4gQTaLTTiFbR6RWTTw>
    <xmx:_tzcZzSpUdoCa1tfNmtY5xtJxvrLmcZ5TNAOy2twKCT1P45YQUjaBQ>
    <xmx:_tzcZ3ZfoOfmwIYhh9mz4WAfATT-s5OdYjEU1QngxczbYwQbZz7m-Q>
    <xmx:_tzcZ8Q6cnza_Q1hnhk6r5eTohNHYet5W7z4cr_6eDO8L3T_YxpJ1Q>
    <xmx:_9zcZ-HamtrBxuXVyUKSVQ9BweudiWHXXzE6AX-4ISKPZtJiVg3IVVFH>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 23:28:57 -0400 (EDT)
Message-ID: <08e4df7e-47c3-4744-a53c-c098eba6f61b@ljones.dev>
Date: Fri, 21 Mar 2025 16:28:54 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] HID: Asus: Add RGB Support to Asus Z13, Ally, unify
 backlight asus-wmi, and Z13 QOL
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250320220924.5023-1-lkml@antheas.dev>
 <a9697222-59ed-4673-aff6-ae4ca50bb824@ljones.dev>
 <CAGwozwF4BwRapZ2O0UR5-RyrdrO=_r29hWkSO5xEWc0aoKxJWA@mail.gmail.com>
Content-Language: en-NZ
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <CAGwozwF4BwRapZ2O0UR5-RyrdrO=_r29hWkSO5xEWc0aoKxJWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/03/25 13:23, Antheas Kapenekakis wrote:
> On Fri, 21 Mar 2025 at 01:03, Luke D. Jones <luke@ljones.dev> wrote:
>>
>> On 21/03/25 11:09, Antheas Kapenekakis wrote:
>>> This is a three part series which does the following:
>>>     - Clean init sequence, fix the keyboard of the Z13 (touchpad,fan button)
>>>     - Unifies backlight handling to happen under asus-wmi so that all Aura
>>>       devices have synced brightness controls and the backlight button works
>>>       properly when it is on a USB laptop keyboard instead of one w/ WMI.
>>>     - Adds RGB support to hid-asus, solid colors only, and for the ROG Ally
>>>       units and the Asus Z13 2025 first.
>>>
>>> For context, see cover letter of V1.
>>>
>>> The last two patches are still a bit experimental, the rest is getting to
>>> be pretty stable by now. I will test my Ally in the weekend. Also, I am
>>> not a fan of the asus-0003:0B05:1A30.0001-led name, so suggestions would
>>> be appreciated.
>>>
>>> ---
>>> V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/
>>
>> Hi Antheas, just a very quick note before I review - did you forget to
>> add `-v2` to git format-patch? Don't do it now, it's just a reminder for
>> next version.
> 
> Yes I did. It's been a long day.

Fair enough mate, know how that feels.

>> Also I guess asus_brt_ means asus_bright_, but maybe we can rename to
>> asus_led_ or even asus_rgbw_? I think something a tad more descriptive
>> while still keeping the length down would help future contributors
>> quickly understand intent. I'll mention it again when I get to that
>> actual patch during test and review.
> 
> I am not particularly happy with brt either, I chose it because the
> events are named BRT. rgbw is a bit misleading, the notifier will
> never do RGB. Since Aura devices can hotplug they need their own led
> device. It will always passthrough brightness only. Perhaps led is
> misleading for that reason as well. Bright seems a bit weird, and
> brightness seems a bit long. So I am a bit stuck
> 
> What I think would be better is to refocus from leds, to maybe
> hid_ref. As I'd like the fan key to passthrough to asus-wmi too to
> cycle the profiles. I'd also like to tweak the profile cycling
> behavior a bit and make it customizable. But very minor changes, just
> to cycling behavior. Essentially, I want to get to a point where doing
> Fn+Fan cycles the profiles properly without userspace, and then
> userspace can take over the cycler and update the KDE slider live.

Personally I'd like to see that. I intended to do something similar last 
year but just never got a round to it. I'd rather move everything that's 
logical to move, from userspace to kernel. Custom ordering would be 
great to see, a logical profile progression etc, lets get this series 
landed first.

> However, that refactor on 6.14 for platform profiles was brutal. So I
> have to wait for fedora to get on 6.14 for me to even start thinking
> about that. Otherwise I will not be able to deploy any changes on

About that - I'm working on it also, as it needs to tie in with the PPT 
stuff, plus fan-curves. I'll keep you informed. The recent asus-armoury 
driver was a first step for it as I needed to get the PPT part in. Once 
it lands I'll submit work on the platform_profile stuff including custom 
profile.

> Bazzite. I currently carry 287 patches (~100 is XDNA+NTSYNC+platform
> profiles minus Kurt's series) for 6.13. I would also like try to
> target Thinkpads too, and maybe the Legion Go with that, but it
> depends on how much progress Derek makes on his driver by then.

Don't spread yourself too thin. I can take care of most of the (new 
feature) asus stuff (that i have hardware for testing with) leaving you 
to focus on other things if you need. Anyhow, I'll keep you in sync - 
just be aware I'll be a little slow due to work and family demands.

> As far as the Z13 is concerned, it will be this patch series + 1-3
> patches to tweak the ROG button on the side to stop acting like a wifi
> killswitch.

Ack

Cheers,
Luke.

> Antheas
> 
>> Looks like good progress so far.
>>
>> Cheers,
>> Luke.
>>
>>> Changes since V1:
>>>     - Add basic RGB support on hid-asus, (Z13/Ally) tested in KDE/Z13
>>>     - Fix ifdef else having an invalid signature (reported by kernel robot)
>>>     - Restore input arguments to init and keyboard function so they can
>>>       be re-used for RGB controls.
>>>     - Remove Z13 delay (it did not work to fix the touchpad) and replace it
>>>       with a HID_GROUP_GENERIC quirk to allow hid-multitouch to load. Squash
>>>       keyboard rename into it.
>>>     - Unregister brightness listener before removing work queue to avoid
>>>       a race condition causing corruption
>>>     - Remove spurious mutex unlock in asus_brt_event
>>>     - Place mutex lock in kbd_led_set after LED_UNREGISTERING check to avoid
>>>       relocking the mutex and causing a deadlock when unregistering leds
>>>     - Add extra check during unregistering to avoid calling unregister when
>>>       no led device is registered.
>>>     - Temporarily HID_QUIRK_INPUT_PER_APP from the ROG endpoint as it causes
>>>       the driver to create 4 RGB handlers per device. I also suspect some
>>>       extra events sneak through (KDE had the @@@@@@).
>>>
>>> Antheas Kapenekakis (11):
>>>     HID: asus: refactor init sequence per spec
>>>     HID: asus: prevent binding to all HID devices on ROG
>>>     HID: asus: add Asus Z13 2025 Fan key
>>>     HID: Asus: add Z13 folio to generic group for multitouch to work
>>>     platform/x86: asus-wmi: Add support for multiple kbd RGB handlers
>>>     HID: asus: listen to the asus-wmi brightness device instead of
>>>       creating one
>>>     platform/x86: asus-wmi: remove unused keyboard backlight quirk
>>>     platform/x86: asus-wmi: add keyboard brightness event handler
>>>     HID: asus: add support for the asus-wmi brightness handler
>>>     HID: asus: add basic RGB support
>>>     HID: asus: add RGB support to the ROG Ally units
>>>
>>>    drivers/hid/hid-asus.c                     | 342 ++++++++++++++++-----
>>>    drivers/hid/hid-ids.h                      |   2 +-
>>>    drivers/platform/x86/asus-wmi.c            | 138 ++++++++-
>>>    include/linux/platform_data/x86/asus-wmi.h |  67 ++--
>>>    4 files changed, 411 insertions(+), 138 deletions(-)
>>>
>>>
>>> base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
>>


