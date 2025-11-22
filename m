Return-Path: <linux-input+bounces-16281-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAE7C7C2CF
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 03:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 437DC3A6316
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 02:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF402299AAC;
	Sat, 22 Nov 2025 02:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="fwVRHaTy"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5696253F11
	for <linux-input@vger.kernel.org>; Sat, 22 Nov 2025 02:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763778206; cv=none; b=XK99whykCbnG2NZwBy6OG7tKUt7p/KK3keShjulCCc4SpaSEj1kVjUZQGsahrP9zVFjTtV1l2t3U5+CO/V2Sz6sXWc8kiB5/q5uzT0Lds627OZG83frL6DiPmDqhdwG3CvvIJOngty7SMNfv1GhAmGELx4TCQYUOaZMSYT9drS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763778206; c=relaxed/simple;
	bh=7X3UAb7vJGrKBocXRZYQpelsQXDhWuv7OfTFv0jQii4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skcVGnW9h632CkU9WurtgKPmbwhyTfezJ1fCVGr5bqDKSGo3/dVgiY7kDCNCzXvMJ/cuam71+snaPT/+IochvldHpj0IR96DzHfvRz18vLb9/poWgMH+EakkNpl0YmXEzWc73zR3Cr2H/Thd4bQX9mcUk/JJxcw1UY+Jh+kvoWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=fwVRHaTy; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1763778198; bh=7X3UAb7vJGrKBocXRZYQpelsQXDhWuv7OfTFv0jQii4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fwVRHaTyJFiv7/iFyHreWwlel71uLwczi3LJ/h5zoJnhSqaQwZz8k82EB5CqER9L4
	 gO6P9gql3s1rGX/tLT4v5mt6xkY7hlgZGc0Y8yjheHa0T9IJnFzeFjSMHEVdhGwAe0
	 DWLidynrbiHwtK632g5Mom6hI9DiJCfHTHnmZuaHsaRhjIYqizZSXiPdIbtm2RWwtc
	 M/vfILCZi2yvPOfOdNhvI2iBAO+dlFIlZ1Rrx3yTq0fg5CHkNnokxRcjtzTKV2tC0o
	 5pkU9Ss4S5uFUHnK840VK98UpXZbAKDv2kX5NXfqsL2wGhAsdpCJilGF4AzG0qIZr/
	 IBCxLVIgJJzDQ==
Received: from [192.168.1.218] (71-212-14-89.tukw.qwest.net [71.212.14.89])
	by endrift.com (Postfix) with ESMTPSA id 5BC7DA00C;
	Fri, 21 Nov 2025 18:23:18 -0800 (PST)
Message-ID: <665df7c9-0d32-4ecd-9f4d-fff67deb5878@endrift.com>
Date: Fri, 21 Nov 2025 18:23:17 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: xpad - Change buttons the D-Pad gets mapped as to
 BTN_DPAD_*
To: Antheas Kapenekakis <lkml@antheas.dev>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Cameron Gutman <aicommander@gmail.com>, linux-input@vger.kernel.org
References: <20250702034740.124817-1-vi@endrift.com>
 <bwun7yd3uwp3cqicg2euq5swxespqjiizxlioohgdk43emzwue@hzyz7gn4vfqb>
 <CAAfxzZ0p=2REL8fhnxe5HwpPK6U7Cat7euMcRnWvUnknrok3sA@mail.gmail.com>
 <b8933438-fd43-4e58-a26d-0febb27911c4@endrift.com>
 <CAAfxzZ1xJC2QRms4RMS54JCbieupt7XmxO6bwZc0vnx0thT4Yg@mail.gmail.com>
 <rkua5gpwvwcs5nb7u6dvab7xlgkpghaw6cezk5mztdkrdc7zch@lwflpa5wfe2e>
 <CAGwozwHfnuDrYHK557oDcRNxQvKx4BRSSgkL+ev1xuKNY39JVw@mail.gmail.com>
Content-Language: en-US
From: Vicki Pfau <vi@endrift.com>
In-Reply-To: <CAGwozwHfnuDrYHK557oDcRNxQvKx4BRSSgkL+ev1xuKNY39JVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I might as well throw in my hat while I'm at it. I have several issues with how evdev handles gamepads that I've been meaning to bring up, so now's as good a time as any.

On 11/12/25 6:16 AM, Antheas Kapenekakis wrote:
> On Wed, 5 Nov 2025 at 06:04, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>>
>> On Sat, Nov 01, 2025 at 11:23:51AM -0500, Cameron Gutman wrote:
>>> On Sat, Nov 1, 2025 at 12:52 AM Vicki Pfau <vi@endrift.com> wrote:
>>>>
>>>>
>>>>
>>>> On 10/31/25 8:18 PM, Cameron Gutman wrote:
>>>>> On Sun, Jul 27, 2025 at 3:23 AM Dmitry Torokhov
>>>>> <dmitry.torokhov@gmail.com> wrote:
>>>>>>
>>>>>> On Tue, Jul 01, 2025 at 08:47:40PM -0700, Vicki Pfau wrote:
>>>>>>> Since dance pads can have both up/down or left/right pressed at the same time,
>>>>>>> by design, they are not suitable for mapping the buttons to axes. Historically,
>>>>>>> this driver mapped the D-pad to BTN_TRIGGER_HAPPY1-4 in these cases, and before
>>>>>>> that as mouse buttons. However, BTN_DPAD_* exists for this and makes far more
>>>>>>> sense than the arbitrary mapping it was before.
>>>>>>>
>>>>>>> Signed-off-by: Vicki Pfau <vi@endrift.com>
>>>>>>
>>>>>> This unfortunately changes existing mappings, but I guess new events are
>>>>>> better than old ones...
>>>>>>
>>>>>> Applied, thank you.
>>>>>
>>>>> Unfortunately this mapping change caused major userspace breakages.
>>>>
>>>> This is unfortunate, however,>
>>>>> I think it needs to be reverted.
>>>>>
>>>>> [0]: https://blog.dwickham.me.uk/why-your-xbox-360-wireless-controllers-d-pad-is-now-wrong-and-how-to-fix-it
>>>>> [1]: https://github.com/libsdl-org/SDL/issues/14324
>>>>> [2]: https://github.com/libsdl-org/SDL/pull/14339
>>>>
>>>> None of these pages suggest reverting the changes. The blog post suggests that these mappings are correct, and that the libraries need to be fixed. Reverting it is mentioned as an absolute last case scenario. The SDL issues say they need more testing, not an outright reversion.
>>>
>>> Breaking userspace is the #1 thing we cannot do as Linux kernel developers.
>>>
>>> The fact that it broke enough people to get a blog post is reason
>>> enough to revert.
>>>
>>>>
>>>> Reverting this is solely reverting to an old, uncomfortable status quo instead of actually fixing the things that broke. If this gets reverted, presumably more stuff will ship this broken code that will break if we ever fix this issue again, instead of things getting progressively fixed.
>>>>
>>>
>>> The "broken" 360 wireless mapping has been used since wireless adapter
>>> support was first implemented in 2008 [0].
>>>
>>> There's decades of software out there that already has workarounds for
>>> these devices that we must not break.
>>>
>>> We can send the proper button codes for new controllers, but I think
>>> we have to leave existing devices alone.
>>>
>>> [0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=99de0912be6f384fc31c8e8e7ba0850d0d670385
>>>
>>>> The abandonware being broken is unfortunate, but things like Steam Input exist specifically to work around issues like that.
>>>>
>>>
>>> This isn't just breaking abandonware. It's breaking the *latest*
>>> releases of SDL2 and SDL3.
>>
>> I agree that keeping the old mapping is not great idea, especially if we
>> start having newer devices using new mapping while other devices use the
>> old one. However we can't really be breaking existing user setup and now
>> that we are aware of such breakages we have to react. I am open to
>> suggestions.
>>
>> From my side I see a few options:
>>
>> 1. Introduce a module option, and allow controlling the behavior. Hope
>> distributions will flip it when updating to new version of SDL that can
>> hopefully handle this. Eventually flip the default to be the new
>> mapping.
>>
>> 2. Allow overriding mapping from userspace. Allow [main] user (SDL or
>> not) load an updated keymap if they desire to do so.
>>
>> 3. Maybe we can send both old and new events at the same time and let
>> consumers decide which ones to act upon? Eventually we can drop the old
>> mapping (maybe again having an option to use old one or implement option
>> 2 and allow loading old mapping via udev or a utility).
>>
>> 4. ???
> 
> Hi,
> jumping on this to give some background.
> 
> Currently, the way the kernel handles evdev gamepads is a bit of a
> mess, specifically when it comes to DInput.
> 
> Essentially, gamepads are consumed using the legacy js API which does
> not have event names but only button indexes. Or an evdev wrapper if
> using an SDL-like backend that does something similar.
> 
> There are no specific mappings for each index, this is different for
> every gamepad. Userspace software is supposed to know the mapping for
> each gamepad based on a heuristic. The most widespread one is the SDL
> mappings, which are also available in the form of a community database
> [1].
> 
> You can see in the button index code in the kernel that it starts with
> buttons from index BTN_JOYSTICK, goes up to KEY_MAX, then loops around
> and registers the buttons until BTN_MISC (which skips most keyboard
> buttons). Those are the buttons available in the legacy API. SDL is
> different, in that it keeps registering the buttons after BTN_MISC
> which is important for some gamepads that use KEY_MENU for e.g., the
> Xbox button. This means that it is possible to use SDL mappings with
> the joydev API while missing some buttons, but since those buttons are
> at the end and usually special functions it is a NOOP.
> 
> Dinput is where it gets interesting and why it is kind of a fruitless
> endeavor to try to rename buttons. In [3], the kernel starts
> registering buttons with HID_GD_JOYSTICK from BTN_JOYSTICK onwards, so
> all HID gamepads that do not bind to a driver have completely invalid
> evdev event names. And this is most non-XInput gamepads (around 400
> models) so no one in their right mind would rely on evdev names from
> userspace and they would instead use that mapping.
> 
> WIth that in mind, it is very important to not shift the gamepad
> button order when adding new mappings. By default, the Xbox 360 order
> is used. E.g., dont use BTN_BASE for an extra utility button like the
> hid-steam driver (which otherwise has an xbox 360 order), as because
> it is before BTN_GAMEPAD this shifts the index of all buttons by 1 and
> breaks all userspace software without a mapping (this is fixed in
> userspace now).

This itself is a huge problem. It shows a mismatch between the expectations of how evdev works and how game controllers work. evdev has named inputs and dinput/joydev has numbered. But since the ordering of the names is arbitrary, the numbering becomes a useless mess too. If adding a name in the middle breaks numbering, that highlights issues with extensibility, especially considering TRIGGER_HAPPY is at the very end of the space.

As an aside, TRIGGER_HAPPY itself is confusingly named and the name appears to be some sort of joke. I would be happy if we renamed them to BTN_EXTRA* and had the old names be aliases for the new names.

This impedance mismatch means we cannot rename things or add buttons in the middle. That is a huge issue, e.g. when new models of the same controller come out with new buttons, like when the Xbox Series controllers added the share button. This button is somewhat unceremoniously mapped to KEY_RECORD (though the HID subsystem tends to map it from arbitrary controllers as KEY_SYSRQ since it's the same as print screen). There are also guidelines saying new types of button should get new names, which seems to have been not done for quite a while, e.g. BTN_MODE being used for the guide buttons in various controllers when that has nothing to do with the mode button on older controllers.

I've been working on bringing up a new Xbox One controller driver (which has been submitted but unreviewed twice...I'm still working on improvements so it's not a huge issue, at least), but one of the biggest issues with some of the controller types is that they can support up to 64 extra buttons and 12 extra axes. There's no sensible place to map these within the evdev KEY/BTN range or the ABS range. Adding more TRIGGER_HAPPY buttons is suboptimal, and adding enough axes to the ABS range is untenable without growing the range. There just isn't a place for arbitrary extra event types whose semantic meaning is unknown or arbitrary.

The input subsystem seems to need a major rethinking of how controller mapping works. It's historically been not very important due to there not being much gaming on Linux, but with the new products with Valve over the last few years, this is a thing that needs to be done sooner rather than later.

> 
> With that in mind, commit [4] that adds button grips is also
> problematic, as those buttons are BELOW trigger-happy which used to do
> dpad buttons. If you revert just this commit, the grips will become
> dpad buttons for devices that have both.
> 
> So both commits would have to be reverted. With them together or
> without either, the button order is maintained. However, they have a
> different order within them so dpad is broken. I suspect the grip
> buttons for Xbox Elite might have a similar issue... Although I have
> not had a bug report about it.
> 
> I already received and merged a PR that fixes this from user space[5],
> and I saw that the SDL3 fix is not coming to SDL2, but i think that
> fix might leave that config stuck in the user's Steam config dir, so
> perhaps it would be prudent for me to undo it and instead just revert
> both commits.
> 
> Antheas
> 
> [1] https://github.com/mdqinc/SDL_GameControllerDB
> [2] drivers/input/joydev.c
> [3] drivers/hid/hid-input.c
> [4] Input: xpad - use new BTN_GRIP* buttons
> [5] https://github.com/ublue-os/bazzite/issues/3399
> 
>> Thanks.
>>
>> --
>> Dmitry
> 

Vicki


