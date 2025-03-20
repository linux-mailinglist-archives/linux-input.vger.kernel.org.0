Return-Path: <linux-input+bounces-10997-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5F1A69FAB
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 07:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58D2F8877D8
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 06:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5531DF25A;
	Thu, 20 Mar 2025 06:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="uipB4608";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UL6TUvx/"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6EE1DDA39;
	Thu, 20 Mar 2025 06:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742451002; cv=none; b=W9/Qts55MumOdvL7BfPLZfaqcc4kcfM6w194/zFmtxpdRAcxaifpZ/0z+bgiyCB9M58mqiXS1h1SAljWRIGef6leKFviNF+V+pM2CFZuXyMG6saFx6h7XC8e71JJ60LmXi2rrG5TG/eFkRS1310Ba5HoDCaiUVr7fgOJ7dv42xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742451002; c=relaxed/simple;
	bh=Wicg/jHdPb4cDLMSEhM6H5RyZau8fw13b7n9jKcfewo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bhmRAUJ6MZ3pRyy959VUpAhpXzmPZem/AHcdntd3+D3ddQwAnSlazQYTxa3tfyqPETSjvc2P+3if9YUli8dAaMVH4WMF8xzuwNV2sVH4nHn0PTS6oir6OVmjrQ0CokNyLtjH74I9oLNjJe2jgSjJhsqaOdPQr4Y+6eNhh3ZDcTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=uipB4608; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UL6TUvx/; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 558961140136;
	Thu, 20 Mar 2025 02:09:57 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-02.internal (MEProxy); Thu, 20 Mar 2025 02:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742450997;
	 x=1742537397; bh=7puj6GRjLoy/MCBIX7sLk3/sKAciR756bxYVuBKqsDI=; b=
	uipB4608guFa42AQu6NFLCLiET8Pw8rj7nOd2IL/SbUPivbuzcaVBS5BJfKF72rH
	CC1UHal6hXMjXxmtzP2S8qRoZ5KTWg01/ISemZehORgy+vJpXDqIQgmd/GREj+Vw
	AaAht9gTsywq/Qa3CR8lviEuhLMOh/NnrP2s1G+pn3t8X/JPd3GtaeSnoIl1mRkD
	KPwvo3JrHvuVdU478oomLydP23mDVqVlWZ9Q2n5uKtacjQEgpqO+gf3ECSLSNhRD
	W7tV/cMDwHlf3iCLYeYafT23HrVJ9ou/JaOhXrkvaA7hVC+fEZNotmgQ0x0nlBD8
	rHdNKrQdl6yhgg52cgCfjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742450997; x=
	1742537397; bh=7puj6GRjLoy/MCBIX7sLk3/sKAciR756bxYVuBKqsDI=; b=U
	L6TUvx/BTOU2pRL5FZluyIvz3M5g1JQo6tCOvle6zAHqAQKg0q2k2n8uOnCVSKxy
	UDOZ8cyP89zfwaSRL1Y81X7bL4D57kYVdvvHJ8uXPPLaeZqNh81oSt3LnefBR2Rv
	gTQjNlli8rWiQCMtdyc03FW5/ZXAncWZDScPVudaoAQU86RvIApeKoYgQHaVBdg5
	lPi31l4gNkxT23RBwiyE2zdukivkJ/4kAPelNVHD1JgC98BNcqfglFzQQVKjijU3
	ixw3DmkprGrG5KiW4SEc4p5gYWjiBeTmiSNYMrhLgJM4GAV3iBpmY1uOtn2a1gfX
	YfX+6AJnIXQ3SRKKPmBpw==
X-ME-Sender: <xms:M7HbZ66HEK0k4yagBM1m15id40tirLsx7q95ng1P9ICUCaixL2DKzA>
    <xme:M7HbZz41Tsqgiu2pDAeNGp-8FdfTpEINAkSfwyW2YUI1M0cO3744homKehPSXR1_0
    jMg4OVF5sy2MrbbAoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeejgeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfnfhukhgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrd
    guvghvqeenucggtffrrghtthgvrhhnpeevteelkeefueeuleejveetueetvefggfeuledv
    hfdvgedvheelfeelkefhgfetheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehl
    jhhonhgvshdruggvvhdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtoheplhhkmhhlsegrnhhthhgvrghsrdguvghvpdhrtghpthhtoheptghorhgv
    nhhtihhnrdgthhgrrhihsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhtihhssh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhikhhosheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthht
    oheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:M7HbZ5e3qjeH0MHF2K4nw11xZHSy6KYzdQBzBBf_k4dCNaZCp0udNQ>
    <xmx:M7HbZ3JBuYpRJvHlz96zZEMQSi7p-7e87C0b5JHH1MJVgrbFFFBOOw>
    <xmx:M7HbZ-INCe8bpLuwX7VjnwqAhLQSGW4E58S_LRCxt3zDmJDKddRnGw>
    <xmx:M7HbZ4yRkjIXMhSUs_lNhxyQwzRBtJXNs1UahEfWlZbgouXBS0m1LA>
    <xmx:NbHbZ_qKx0zm7to8H7QJiz1PDpuNxvVH51IxmEeNkkPs61yqqj_9g4kr>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 99028336007C; Thu, 20 Mar 2025 02:09:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T7649fa8ac083233c
Date: Thu, 20 Mar 2025 19:09:34 +1300
From: "Luke Jones" <luke@ljones.dev>
To: "Antheas Kapenekakis" <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Jiri Kosina" <jikos@kernel.org>,
 "Benjamin Tissoires" <bentiss@kernel.org>,
 "Corentin Chary" <corentin.chary@gmail.com>,
 "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Message-Id: <bbc18a3d-fd01-420c-b616-4a1757d4e8ed@app.fastmail.com>
In-Reply-To: <20250319191320.10092-1-lkml@antheas.dev>
References: <20250319191320.10092-1-lkml@antheas.dev>
Subject: Re: [PATCH 00/11] HID: asus: hid-asus and asus-wmi backlight unification, Z13
 QOL improvements
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Antheas,

On Thu, 20 Mar 2025, at 8:13 AM, Antheas Kapenekakis wrote:
> This is a three part series that does the following: first, it cleans up
> the hid-asus driver initialization, preventing excess renames and dmesg
> errors on ROG devices. Then, it adds support for the Z13 2025 keyboard,
> by fixing its keyboard to not be stuck in BIOS mode and enabling its fan
> key. Finally, the bigger piece of this series is the unification of the
> backlight controls between hid-asus and asus-wmi.
>
> This requires some context. First, some ROG devices expose both WMI and
> HID controls for RGB. In addition, some ROG devices (such as the Z13)
> have two AURA devices where both have backlight controls (lightbar and
> keyboard). Under Windows, Armoury Crate exposes a single brightness control
> for all Aura devices.
>
> However, currently in the linux kernel this is not the case, with asus-wmi
> and hid-asus relying on a quirk system to figure out which should control
> the backlight. But what about the other one? There might be silent
> regressions such as part of the RGB of the device not responding properly.
>
> In the Z13, this is the case, with a race condition causing the lightbar
> to control the asus::kbd_backlight device most of the time, with the
> keyboard being renamed to asus::kbd_backlight_1 and not doing anything
> under KDE controls.
>
> Here, we should note that most backlight handlers are hardcoded to check
> for backlight once, and for one backlight, during boot, so any other
> solution would require a large rewrite of userspace.

This makes me wish there was better standardization. Maybe filing some reports upstream to those various projects could get the ball rolling?

> Even when brightness controls are fixed, we still have the problem of the
> backlight key being on/off when controlled by KDE and 0/33/66/100 when
> the device has a WMI keyboard. Ideally, we would like the 0/33/66/100 to
> be done under hid as well, regardless of whether the backlight of the
> device is controlled by WMI or HID.
>
> Therefore, this is what the third part of this series does. It sets up
> asus-wmi to expose accepting listeners for the asus::kbd_backlight device
> and being the one that sets it up. Then, it makes hid-asus devices
> register a listener there, so that all of them are controlled by
> asus::kbd_backlight. Finally, it adds an event handler for keyboard keys,
> so that HID led controls are handled by the kernel instead of userspace.
> This way, even when userspace is not active the key works, and we get the
> desired behavior of 0/33/66/100 across all Aura devices (currently, that
> is keyboards, and embedded devices such as lightbars). This results
> removing the quirk system as well, eliminating a point of failure.

Nice, I'd been looking at doing something similar but unfortunately hadn't the time for it, nor the device appropriate for testing (keyboard, detachable, lightbar). TBH I wish there was a much better way in kernel to handle these sorts of lighting situations, especially given that we have laptops across vendors and models with different modes, zones, per-key, MCU mode vs software mode etc etc. There is a *very* long thread on lkml bikeshedding it all too - see https://lore.kernel.org/lkml/20231011190017.1230898-1-wse@tuxedocomputers.com/

The LampArray thing is out of scope for this, but I thought maybe worth mentioning in case you weren't aware. The major pitfall of it is that per-key devices update per-row and when you do a single key update to update a whole keyboard it sends N-Key amounts of packets..

Off-topic though. But if you have some ideas please email me.

> I tested this on an Asus Z13 2025, and testing by other devices would be
> appreciated for sure. This series is designed to be transparent to
> userspace behavior-wise compared previous kernels, with all existing
> laptops either having the same behavior or being better.

I have a handful of laptops I can test, including my old GA501, I'll get on it.

> The Z13 keyboard folio RGB controls work beautifully, with KDE led
> notifications working and doing 0/33/66/100 as expected. This also happens
> with hotplugging, as the lightbar is always available and keeps the
> endpoint alive from boot, even if the folio is not connected (a quirk
> can be added later if there is a device where this is not the case).

Very good. This will make a lot of folks happy, I suspect the Z13 is going to be a very popular device.

> The first two parts of the series can also be merged independently of the
> third part, so we can iterate on that more. Perhaps there is a better way
> to handle this cohesion,

After a quick cursory look, this looks good so far. Perhaps after review and iteration you could submit as an independent series to get those parts in quicker - but hey we can cross that when we get to it.

> Oh, by the way Luke, I developed this series with a variant of
> your Armoury series merged, and only switched to 6.14-v7 for this
> submission. You will be happy to know that there are no conflicts :)
> (at least with that version from ~January). Also, please factcheck
> my initialization sequence is correct in the 0x5d and 0x5e devices
> you added when you made that refactor last year. Are those handshakes
> needed?

I would hope the armoury driver stays out of the way of most things, I tried to make it independent. The handshakes are needed for sure, depending on device it may be partial or more, but it's always been the same ASCII right back to when I first started on this with a 2018 laptop - we never bothered with the response check though. I do forget what required the 0x5e init, I'll need to check through some old notes.

I'll apologize in advance for the time it might take me to review - I'll attempt some now for the smaller patches, but hopefully I can get some time in this weekend and we can work together to make asus stuff even better.

Cheers,
Luke.

> Antheas Kapenekakis (11):
>   HID: asus: refactor init sequence per spec
>   HID: asus: cleanup keyboard backlight check
>   HID: asus: prevent binding to all HID devices on ROG
>   HID: asus: rename keyboard3 to Z13_FOLIO
>   HID: asus: add Asus Z13 2025 Fan key
>   HID: asus: introduce small delay on Asus Z13 RGB init
>   platform/x86: asus-wmi: Add support for multiple kbd RGB handlers
>   HID: asus: listen to the asus-wmi brightness device instead of
>     creating one
>   platform/x86: asus-wmi: remove unused keyboard backlight quirk
>   platform/x86: asus-wmi: add keyboard brightness event handler
>   HID: asus: add support for the asus-wmi brightness handler
>
>  drivers/hid/hid-asus.c                     | 220 ++++++++++++---------
>  drivers/hid/hid-ids.h                      |   2 +-
>  drivers/platform/x86/asus-wmi.c            | 137 +++++++++++--
>  include/linux/platform_data/x86/asus-wmi.h |  66 +++----
>  4 files changed, 279 insertions(+), 146 deletions(-)
>
>
> base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
> -- 
> 2.48.1

