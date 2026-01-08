Return-Path: <linux-input+bounces-16859-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9EAD00D9E
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 04:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB16F3001634
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 03:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C54F25A659;
	Thu,  8 Jan 2026 03:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="ml0uQwt2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rLdHgt+I"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5923A0B36;
	Thu,  8 Jan 2026 03:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767842675; cv=none; b=eQFT3M61ghUUayDiEFY2uXkSrp6ONkxDWr54pQFMe5QRx5gdoVr2gIA+4GdPnzILwffShIOeJEpDB098cnX8Tac86iK3YDvrvhBJPrWLJXRf4J422PPfCF4JDDZOQWdVo9t1MuZJqN0mnnotbZ7tdjoQGtxIaG22jSmxr+Cf0kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767842675; c=relaxed/simple;
	bh=wKU4HYJn/yM0dSUC5OOu0cT+S2Uo45f7kKFmEGXgTqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtyUHdLA7lyZNt5OyusbPyuARRi6KhxEmvZXphUtVWoDlzC6Oo7ZjS1Xzg/YhVtR4pgpQrATZl5+c8uS20su0xgKug4IHwJdzrCfVAo68P+hWkVwtWH3gt7oEpHUg39hsdjBNOva74cW3TlLJOe8AVbkdErJUPG2irX7+DYtpFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=ml0uQwt2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rLdHgt+I; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5DA3D14001AC;
	Wed,  7 Jan 2026 22:24:31 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 07 Jan 2026 22:24:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767842671;
	 x=1767929071; bh=sNKq70LCd3y5q5F5QW2+D0D/jpDMivUlFV8XZoA+bCA=; b=
	ml0uQwt2DFNkXmZVCQSpolj0pUw1h6ESSFGWLFExUkHFGZIlqxDWQz/7tDdNoitt
	W1jgzGZz1bp41pIPaJ8YJjlYvIG/WpcNeWMqxv5PlxabfeGcnHe+OJDqlRBjoTBJ
	LjMxeJH/vkMqNXPoGrgQxZTWdvTKauw8SRj9iblgoSLmbHlensAig/QOazx7GU9p
	BMhoi2YtstcMW/H2PpG1GL9GU3O2nPr2zwlsqJ3o9ARSf6uHcc6/E+GMTDjftMn3
	c5xIC33tQ20nkGUjxBfR85HNsFf6ks/JayoKUW4vk5HY+WoEYxa+ult1pO5taUAC
	IhYbo3ofyRrBHFdn/8IeEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767842671; x=
	1767929071; bh=sNKq70LCd3y5q5F5QW2+D0D/jpDMivUlFV8XZoA+bCA=; b=r
	LdHgt+I54KETjNwDKPz/81glOAGN6+Wtzk1n8QOCqFxTvv4JeXgG9NbZh46TVwkH
	KwnuVVhWrAsoivD5TY2hLdR6M4voP/xWDEFwQsb9KuFelNp8kGkMD/FAbhWUyEsD
	ss6HphGCQ6J7iYflJqowuFMwFD8qZPU5Ha652jdaSiOnXvrj1lGyI94jaFjvbni3
	Jh1p6mI4S0X5fRVSfuGxwkpyhmx3vaSwWQjxSEFrRQnKsnc+VUg1x8pCYPntOmDG
	lTjtz0/gz49mQYq4k7imXjhRWhVufREa3zm4/dq/7thNdJoH15Deaqn0UNSsTqtC
	pDAu/lKFkEZb7+2bjrvRw==
X-ME-Sender: <xms:byNfae-rwC3QyJF3Tv4A5IQ-o-t73bhjdefNYARl6j1zV-Y-PEo_tA>
    <xme:byNfaUtm2DCs2tjZNCxqYp0Z3-wuwaN7DnH15bZEJHqIEB9rdwJroKJ7cYSfP57mJ
    -nVzsVFsWXaj6WVBiLY4h_APopGzk8ITkC6473tICFBUXUcoqsYBNY>
X-ME-Received: <xmr:byNfae1Y7yK5crdowRacOnwEV34_rxeq7GpjPh0vrlsXQwjP3-cyTChcOtS5TCc9KTHeLJFSoB6PyZrNVeNK7vK8SgJnxIYmKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdegkeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtugfgjgesthekre
    dttddtjeenucfhrhhomheprfgvthgvrhcujfhuthhtvghrvghruceophgvthgvrhdrhhhu
    thhtvghrvghrseifhhhoqdhtrdhnvghtqeenucggtffrrghtthgvrhhnpedtkeefjeefie
    ehhfefteelieevvdeufeekjeduleeutddutdeihffhledvleetvdenucffohhmrghinhep
    gidqphhlrghnvgdrohhrghdpfhgrlhgtohhnqdgsmhhsrdgtohhmpdhkvghrnhgvlhdroh
    hrghdpfihinhgvhhhqrdhorhhgpdhgihhthhhusgdrtghomhdpfhhrvggvuggvshhkthho
    phdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvthdpnhgspghrtghpthht
    ohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhmrghsiidrphgrkh
    hulhgrrdhofhhitghjrghlnhihsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughmihht
    rhihrdhtohhrohhkhhhovhesghhmrghilhdrtghomhdprhgtphhtthhopegtohhrsggvth
    eslhifnhdrnhgvthdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopegsvghnthhishhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihesvghn
    ughrihhfthdrtghomh
X-ME-Proxy: <xmx:byNfaZTbuywystardQLdvEOQAiloSJRLEZjAW8nCPwhYKdWdoiwDlw>
    <xmx:byNfaSc4LiHGCXao-14g9rLaK_i8fFuSZvDHFeGJSDV2GuCSL2pvLw>
    <xmx:byNfaad4jZ-gTCpznX3Q2Lp0qwlpCLaWPCDCy45hHkz7fJdWkawm1g>
    <xmx:byNfac2s5AzOFg4kIRrDbvE3AWUj9upZ-aUNIyi3g-iucr0fxv5qcQ>
    <xmx:byNfaT5JGtTs9rlisLLVNUMyYpbk0ZeH-CQsFkJ-zKvnqIP_OXQIZ6He>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jan 2026 22:24:27 -0500 (EST)
Date: Thu, 8 Jan 2026 13:24:22 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Cc: dmitry.torokhov@gmail.com, corbet@lwn.net, jikos@kernel.org, 
	bentiss@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, vi@endrift.com, linux-kernel@altimeter.info
Subject: Re: [RFC PATCH 0/6] Input: New EV_BTN event for generic buttons
Message-ID: <aV8eksQWbJcCehdy@quokka>
References: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>

On Sun, Jan 04, 2026 at 10:31:26PM +0100, Tomasz Pakuła wrote:
> This patch series adds EV_BTN and it's handling to the input system. It's main
> focus is to add a simple event for generic buttons, not relying on defined
> usages and meanings.
> 
> Joysticks unlike keyboards, mice and even gamepads (though that's debatable)
> define arbitrary number of buttons that don't mean anything. They can be used
> in any kind of software, but mainly games, by assigning them manually to
> functions. Some games even carry default presets for devices based on their USB
> VID:PID pairs.
> 
> The more important issue that this is trying to solve is the longstanding
> problem of limited button support in Linux. The use for arbitrary number of
> buttons wasn't considered some 20 years ago because Linux wasn't a good platform
> for gaming. First, Joystick and Gamepad ranges were limited to 16 buttons, later
> extended by 40 additional usages in the TRIGGER_HAPPY range. By allowing the
> usages to be incremented up to KEY_MAX, Joysticks were able to expose up to 80
> buttons for the past 15 years or so.
> 
> Many simracing, simflight etc. devices actually expose way more then that. 128
> is a pretty common number with even more in the wild. Usually the numbers get so
> big to support things like positional rotary switches as one such rotary can
> have 12+ positions. My Moza GS V2P wheel has 5 such rotaries and that's not
> counting other buttons.
> 
> Doing something about this limit was brought up maaany times in the past:
> https://forums.x-plane.org/forums/topic/299033-xp12-linux-winwing-orion-2-throttle-has-too-many-buttons/?page=1
> https://forum.falcon-bms.com/topic/26403/solved-winwing-orion-2-on-linux-only-80-buttons-detected
> https://lore.kernel.org/linux-input/CACa7zynMpa3BOJUW=s_Tj1TwH5txDQOuta5Fph45PYhDOtQQ3g@mail.gmail.com/
> https://lore.kernel.org/linux-input/20200710065112.18286-1-cpuwolf@gmail.com/#r
> https://lore.kernel.org/linux-input/20240802201001.406898-1-tomasz.pakula.oficjalny@gmail.com/
> https://lore.kernel.org/linux-input/20250201113906.769162-11-tomasz.pakula.oficjalny@gmail.com/
> https://lore.kernel.org/linux-input/20251119163844.1343-1-Hunter.Moore@garmin.com/
> https://lore.kernel.org/linux-input/20251220194100.GA12646@altimeter-info/
> https://lore.kernel.org/linux-input/665df7c9-0d32-4ecd-9f4d-fff67deb5878@endrift.com/
> 
> But some considerations:
> 
> 1. Usages have their actual meanings and we shouldn't use them willy-nilly to add
> more buttons, even if that approach works with naive approaches use by SDL and
> Wine alike.

fwiw, we *already* add those usages willy-nilly for a rather large
proportion of devices. any HID device with the Button usage page will
convert from HID button 4 to BTN_SIDE and then the rest of the stack
pretends this was a conscious choice. Which leads to hilarities that
BTN_SIDE is actually the back button and BTN_BACK is just... button 7
(or button 11 thanks to X11 history). Which then again leads to
hilarities that sending BTN_BACK to indicate a back action may or may
not have an effect, I recently had a bug like this in mutter/gtk's tablet
handling. IOW, it's quite messy anyway.

So what I (think I) would like is to use EV_BTN in addition with EV_KEY
to signal purely numbered buttons but *also* which buttons have the
exact semantic meaning. The logic becomes:

If an EV_KEY $code is just a numbered button it *also* sends EV_BTN
$number. 
If an EV_KEY $code is a fixed semantic meaning (e.g. BTN_BACK) it does
*not* send an EV_BTN $number.

Then we can have a mapping in the device that maps from EV_BTN to EV_KEY
code, obtained via some EVIOCBTNKEYCODE() ioctl. The hypothetical
example of a device with 3 numbered buttons and a fixed BTN_BACK would
be: EV_BTN count of 3, EV_KEY bits for left/middle/right and back.

nbuttons = EVIOCBTNCNT()
EVIOCBTNKEYCODE(0, nbuttons) returns [BTN_LEFT, BTN_RIGHT, BTN_MIDDLE]

A sequence with right and back down would look like this:

Event: time 1767559522.509446, type 6 (EV_BTN), button 2, value 1
Event: time 1767559522.509446, type 6 (EV_KEY), code 0x110 (BTN_RIGHT), value 1
Event: time 1767559522.509446, type 6 (EV_KEY), code 0x110 (BTN_BACK), value 1
Event: time 1767559522.509446, type 4 (EV_MSC), code 4 (MSC_SCAN), value 9000c
Event: time 1767559522.509446, -------------- SYN_REPORT ------------

And userspace can ignore BTN_RIGHT thanks to that mapping but BTN_BACK
retains its semantic meaning. This is flexible enough even though I'm
not sure how many devices will mix the two.

Does that make sense?

Cheers,
  Peter


> 2. Extending the KEY_MAX will cause additional issues when it comes to bitmask
> sizes, mapping usages and reading them afterward. Basically, we're moving the
> goalpost somewhere, but a device that would define 1024 buttons would break
> things again.
> 
> I must give HUGE thanks to Dmitry for forcing this into my head to a point where
> I actually understood the whole issue.
> 
> Thus, I thought up of a best, long-term solution to this problem. I do think
> EV_BTN should be a first-class event so it can be as easy to handle as possible.
> If there's a need, it could be hooked up for Gamepads as well as HID gamepads do
> the same thing and only expose raw buttons without specific usages. The usages
> are a best guess when handling generic ones and only custom drivers can actually
> assign proper buttons like BTN_A, THUMBL etc.
> 
> In the future, the Joystick usages could be completely removed and joysticks
> could rely ONLY on the new event. For now, the old way is kept to not break
> compatibility.
> 
> I'm eagerly waiting for comments, recommendations and critique. Currently, there
> isn't a way to poll states of all buttons like with EVIOCGKEY but I'm not sure
> if it's needed? I added INPUT_MAX_KEYS just for some sane limits BUT I don't see
> a real use for it. Instead of this define, we could just use U16_MAX. 65k of
> buttons ought to be enough for ANYBODY :D
> 
> Companion changes to consumers that already show the working state of this patch series:
> Wine: https://gitlab.winehq.org/wine/wine/-/merge_requests/9853
> SDL: https://github.com/libsdl-org/SDL/pull/14758
> evtest: https://gitlab.freedesktop.org/libevdev/evtest/-/merge_requests/25
> 
> Tested with my Moza Racing R9 and Moza Universal Hub (both expose 128 usable
> buttons). hid-universal-pidff driver was disabled for testing as it contains
> usage range hack.
> 
> Sneak peek from updated evtest:
> 
> Event: time 1767559522.509446, type 6 (EV_BTN), button 12, value 1
> Event: time 1767559522.509446, type 4 (EV_MSC), code 4 (MSC_SCAN), value 9000c
> Event: time 1767559522.509446, type 1 (EV_KEY), code 299 (BTN_BASE6), value 1
> Event: time 1767559522.509446, -------------- SYN_REPORT ------------
> Event: time 1767559522.656447, type 6 (EV_BTN), button 12, value 0
> Event: time 1767559522.656447, type 4 (EV_MSC), code 4 (MSC_SCAN), value 9000c
> Event: time 1767559522.656447, type 1 (EV_KEY), code 299 (BTN_BASE6), value 0
> Event: time 1767559522.656447, -------------- SYN_REPORT ------------
> Event: time 1767559523.737498, type 6 (EV_BTN), button 112, value 1
> Event: time 1767559523.737498, -------------- SYN_REPORT ------------
> Event: time 1767559523.807477, type 6 (EV_BTN), button 112, value 0
> Event: time 1767559523.807477, -------------- SYN_REPORT ------------
> 
> Tomasz Pakuła (6):
>   Input: Introduce EV_BTN event for generic buttons
>   Input: Add info about EV_BTN
>   Input: Fire EV_BTN if found in ev_bit
>   Input: Assign EV_BTN event to HID Joysticks
>   Input: Realign rest of the HID_UP_BUTTON cases
>   Input: Add EVIOCGBTNCNT
> 
>  Documentation/input/event-codes.rst    |  5 ++
>  drivers/hid/hid-input.c                | 77 +++++++++++++++++---------
>  drivers/input/evdev.c                  |  5 ++
>  drivers/input/input.c                  | 10 ++++
>  include/linux/input.h                  |  4 ++
>  include/uapi/linux/input-event-codes.h |  1 +
>  include/uapi/linux/input.h             |  1 +
>  7 files changed, 77 insertions(+), 26 deletions(-)
> 
> --
> 2.52.0
> 

