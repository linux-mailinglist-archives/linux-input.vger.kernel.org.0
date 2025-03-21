Return-Path: <linux-input+bounces-11044-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A44EAA6B1E7
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 01:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76E3B16E406
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 00:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0642E136A;
	Fri, 21 Mar 2025 00:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="sImAQHkO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ex/3rUK5"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03ACA31;
	Fri, 21 Mar 2025 00:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742515425; cv=none; b=t12VJP6zIKFyrd17wj3vYDoQsx1aRjhwnmgInF75xcfZVZxQioo17aGPDQBMYSyJ0gRxmrl08iQvSecv0VvkOMM1WdUy+2e/VLpc/KOPnK2IGnsyH0goGLvSn3II97XFPk5D/FK+k+PNXlD0bZBPDIaXGLZwUmVZvj3X6d90kVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742515425; c=relaxed/simple;
	bh=YVVExZ4uXPFvKlzCxFMuO5fta5Y7q8V5FM82C6tglec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2vk+3zZENSY1MpKmCEt/SzJq4jfObg+4O7m2r9+oyi5LJ7mvVHPxgzqAVjgpCEURzn8ySVKxdt33ZriRgy0MVAbcmoSobgGsGZ5lNl0w0e78SOvpHQ1KVPnugMVFTWlOf6pCOVOhA+VQ/vtaOWxcsGN8l4HrAC7hSSHk42q3m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=sImAQHkO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ex/3rUK5; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7D0892540212;
	Thu, 20 Mar 2025 20:03:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 20 Mar 2025 20:03:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742515422;
	 x=1742601822; bh=jEAGesP69jNcKCnY9yJ4sWh56EFVFEO6vdfnyRkWMtA=; b=
	sImAQHkOHJAA1xkDdvWe46ED7P/aJ1/3Wi2aFv3TlAN/WedWdAeaavZFkB1/rJMM
	kbKXhAR74D6QsAke6hPPZXYfB0aXL0qQ6azTn5g/4lvJdKRBwrhtKhLZ8ZolrIfu
	VwW4ZTUZ5Ugx4IX3t9dcDefutJuHH/VdQNz6sz3rD9CQ9TgOqRxJQ9zyQExb5N4f
	9ykZn0ArhSWGD/RnAPRLhU6qPQIsw9cjr/kyzN4IuO9RPFbOg0Q2g2O661jkn86/
	ePz3MAHwKEycjgg5pCmcanTXGYWG3pQE1ijIvnn90hgPHz/3WnT9zJb5o6yCiJqD
	9hWERsWU+4slZur2eTL2KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742515422; x=
	1742601822; bh=jEAGesP69jNcKCnY9yJ4sWh56EFVFEO6vdfnyRkWMtA=; b=E
	x/3rUK5jBr7ErsJClBMAOHPiSE4sfoYQMFDEAe/tAp+QsRlbali+M/+WMmBRbjsl
	NeACwZIyAcWEoHiJ2E1LiemvrV+DO+teg+UX/nRei1Bv4bNKpLNtZ8OyDL1RFaEQ
	wy/L++4DD6qZSRJILNOnmlkNi0uYf6CcP1IgTYWZhyS5nd7UoM+uHsjE775d0cxg
	bABisJ3iy3dg6ae0DyEEjs4EGZra8odMb2kvGeM+El2gQX1nWyIocq9m2l3iO1lk
	/sFoGEzOqGT6aLdNDT4G/8UL6cdp+KWcpLXDqLeXgf/5szGduFx6toedtD9Go7cB
	JluNpn9rw/22LakQQflPQ==
X-ME-Sender: <xms:3azcZwKqo-FQsgp7z4COAdAcBouo8rx1eJIElIadgwvOk0OuPKDKvQ>
    <xme:3azcZwJLO9ufW4XWDuHFXDUA6NvSqa_pdO2lCFmnxrajAse7VuZmyD7yKtrd_UVUa
    SF8j3PeGMGiFkk5B68>
X-ME-Received: <xmr:3azcZwsU23ZhRSUO5XjAymEsfPrIet5X6oqekKPyYaPyZz5B0e26CLd36OT2GY5v5YrSz81F>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeelieduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:3azcZ9bWULgf_Jhu_ylCs15OzkRhhmISVK_SFuQecvD_yeRFW_KSrg>
    <xmx:3azcZ3aB-_giWaEPxUpwiifICX53jQEYUrfSKQSjER2uTWhT8_Ou5A>
    <xmx:3azcZ5C_FCdn_TTOTwTeTp1A3lbiU6Mvzlao8CGZsLbd9vuJeCn_WQ>
    <xmx:3azcZ9aBTjMtGNQutCU174axcev8qluk5RFMkJ4ZXXZNyoFx4C9f2Q>
    <xmx:3qzcZ1MVc1BnNA7Q9BX9Wb_dzeUHVAMTUvWwYmZhPBN_ieLXV0O5x0i3>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 20:03:36 -0400 (EDT)
Message-ID: <a9697222-59ed-4673-aff6-ae4ca50bb824@ljones.dev>
Date: Fri, 21 Mar 2025 13:03:33 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] HID: Asus: Add RGB Support to Asus Z13, Ally, unify
 backlight asus-wmi, and Z13 QOL
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250320220924.5023-1-lkml@antheas.dev>
Content-Language: en-NZ
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250320220924.5023-1-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/03/25 11:09, Antheas Kapenekakis wrote:
> This is a three part series which does the following:
>    - Clean init sequence, fix the keyboard of the Z13 (touchpad,fan button)
>    - Unifies backlight handling to happen under asus-wmi so that all Aura
>      devices have synced brightness controls and the backlight button works
>      properly when it is on a USB laptop keyboard instead of one w/ WMI.
>    - Adds RGB support to hid-asus, solid colors only, and for the ROG Ally
>      units and the Asus Z13 2025 first.
> 
> For context, see cover letter of V1.
> 
> The last two patches are still a bit experimental, the rest is getting to
> be pretty stable by now. I will test my Ally in the weekend. Also, I am
> not a fan of the asus-0003:0B05:1A30.0001-led name, so suggestions would
> be appreciated.
> 
> ---
> V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/

Hi Antheas, just a very quick note before I review - did you forget to 
add `-v2` to git format-patch? Don't do it now, it's just a reminder for 
next version.

Also I guess asus_brt_ means asus_bright_, but maybe we can rename to 
asus_led_ or even asus_rgbw_? I think something a tad more descriptive 
while still keeping the length down would help future contributors 
quickly understand intent. I'll mention it again when I get to that 
actual patch during test and review.

Looks like good progress so far.

Cheers,
Luke.

> Changes since V1:
>    - Add basic RGB support on hid-asus, (Z13/Ally) tested in KDE/Z13
>    - Fix ifdef else having an invalid signature (reported by kernel robot)
>    - Restore input arguments to init and keyboard function so they can
>      be re-used for RGB controls.
>    - Remove Z13 delay (it did not work to fix the touchpad) and replace it
>      with a HID_GROUP_GENERIC quirk to allow hid-multitouch to load. Squash
>      keyboard rename into it.
>    - Unregister brightness listener before removing work queue to avoid
>      a race condition causing corruption
>    - Remove spurious mutex unlock in asus_brt_event
>    - Place mutex lock in kbd_led_set after LED_UNREGISTERING check to avoid
>      relocking the mutex and causing a deadlock when unregistering leds
>    - Add extra check during unregistering to avoid calling unregister when
>      no led device is registered.
>    - Temporarily HID_QUIRK_INPUT_PER_APP from the ROG endpoint as it causes
>      the driver to create 4 RGB handlers per device. I also suspect some
>      extra events sneak through (KDE had the @@@@@@).
> 
> Antheas Kapenekakis (11):
>    HID: asus: refactor init sequence per spec
>    HID: asus: prevent binding to all HID devices on ROG
>    HID: asus: add Asus Z13 2025 Fan key
>    HID: Asus: add Z13 folio to generic group for multitouch to work
>    platform/x86: asus-wmi: Add support for multiple kbd RGB handlers
>    HID: asus: listen to the asus-wmi brightness device instead of
>      creating one
>    platform/x86: asus-wmi: remove unused keyboard backlight quirk
>    platform/x86: asus-wmi: add keyboard brightness event handler
>    HID: asus: add support for the asus-wmi brightness handler
>    HID: asus: add basic RGB support
>    HID: asus: add RGB support to the ROG Ally units
> 
>   drivers/hid/hid-asus.c                     | 342 ++++++++++++++++-----
>   drivers/hid/hid-ids.h                      |   2 +-
>   drivers/platform/x86/asus-wmi.c            | 138 ++++++++-
>   include/linux/platform_data/x86/asus-wmi.h |  67 ++--
>   4 files changed, 411 insertions(+), 138 deletions(-)
> 
> 
> base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1


