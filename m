Return-Path: <linux-input+bounces-11065-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64907A6C71C
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 03:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4409C188B9A8
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 02:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B2F42077;
	Sat, 22 Mar 2025 02:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="2Fto3Gjj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hgo2aGNb"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700EBAD5E;
	Sat, 22 Mar 2025 02:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742610637; cv=none; b=J9/tJHtOWQtMkFe1H7Xrwvmzcq3i5YP33eH1NqzdUGY+uMbvAVL/55q83m4ET5OOj6kPVk2UkNHuWNgShaXS2pr8ws78tN7Is8YDa/VXRd55Bx2pAYGABXVT6p4yWQYbOZ+2Oo9e/Tq3GSJWbZ1qvbwvaNhYflqoofmSu9ZA78g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742610637; c=relaxed/simple;
	bh=xW+ygZomg26f+TkgZWHGziyITQA+nu/AiVMmDk8CFXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CMe3pyAsLNreOV/MCVt2aBDVB+k7LKOGEx/Y4zrU3STblYP74O3tgBxh9KP0IsFAxg7JPrEbN7wYUEfCwjXbd8waSm/iClHYs9LZr74T+WS3jjeo/s6eq90Gxu30IliDvEeAL3Y1yzr3nZu+ELk5oW9dxD0Ez8jE8bmkH/Zhi4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=2Fto3Gjj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hgo2aGNb; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 544361140184;
	Fri, 21 Mar 2025 22:30:34 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 21 Mar 2025 22:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742610634;
	 x=1742697034; bh=2V/xbG/szpCiF4YR+lGYDgKjTrDPFQARh1ObRca62jg=; b=
	2Fto3GjjAoL+lYWDFaOYSA2e9OnpEG23ydD83uayY0I53l92Y10dAJv0V5EV+jBX
	p0kIEWyHGSHEVoYU0V0PO8Y/glHarLBggKPdXIuumT2DKcrJg0oN5TyspnYVJAEF
	JHgjkKKStuVoSbgZSFBjT6IPX39WtdyfsoLzcBD37RUCfKwR3Ak9EYOVvkpCtAp6
	Vjgm4w3ura9VMStxSxvVzCdECy0E05gbJNJFVf9hglFZyK+CTU3AQKgPR8OhoNqd
	U+4EEOkH4XGqkrI3Nj4XZFKI/ptyU64wXtZwFOM9kr0L0XTwy68Mw0uKX5WVLGYV
	8d6v+TDmtrJmd9KTYE1TUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742610634; x=
	1742697034; bh=2V/xbG/szpCiF4YR+lGYDgKjTrDPFQARh1ObRca62jg=; b=h
	go2aGNbbFWU6NFXSQSodgQNnVS5ooKj1u16KKhjI1vZRGxJ+1lUPKMu1L7FnZ1Mt
	P/+X13g8+V4jkplg6Y6wALhU1fQRyd1vkQ0Rakyj9Yr8tmI0E85Tto2D8GvCMgNT
	MNnBPeHVyAn9XlFzCA9iKv2WdEgsP3Il+Xokw0SHEsaKvFEhBrl1g8+0pxLmwHyc
	cuDpr4Gw9rCjXZEOUo145q/R8lfPxxts6zcyskmzk7fujHmNkp+ibJCrbA/Eq6yg
	5lL1kbHX3BgR4AADIyrNJqlP1BovdgmYcNJM1wANwtkSqw48KjXVVc1BRx5qhbLh
	DVYWr4SKJCMBOM7Wwe87w==
X-ME-Sender: <xms:ySDeZ_E0I_0wU5XHfNYzIxfPRRZf4ed7UmsmizMdkb0qjTx6r6p7Tw>
    <xme:ySDeZ8UssH1v54TAPTjDVn0Q7D6Ne-_79bebP-oP17u7uQVkqG8vrQPI9PHxVm5yq
    u125pb1_nqi4_kZ3hs>
X-ME-Received: <xmr:ySDeZxJmON-zmHYh23wmQFWuUvnGMf-J3MWxvM_58d3GaJ3ep-D2FL45HjJz7SDuNkyB6gEH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedvjeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddt
    vdejnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhhonh
    gvshdruggvvheqnecuggftrfgrthhtvghrnhepveduueevtdetgfehfeeliedvvdfhtdei
    hfdtkeejuddvgeeivddtkeffgeekueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghp
    thhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhkmhhlsegrnhhthh
    gvrghsrdguvghvpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekiees
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhikhhosheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepsggvnhhtihhssheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheptghorhgvnhhtihhnrdgthhgrrhihsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    ephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehilhhpohdrjhgr
    rhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:ySDeZ9ENM7C7CQUeJSpMfnr6koN5Fe6w5vZw5DhZrNr2ZsC3paL3jw>
    <xmx:ySDeZ1VsFhutqaF7JKqxlDiu-KBVnXqsvmvTCrZpiq5VBgSF7Ys_Lg>
    <xmx:ySDeZ4MaI8NHm7qxFjFrVwrx9nFGp_GaW53FuLc_gVI-dF1rTXUEWQ>
    <xmx:ySDeZ02NJR3rQRUymBELaBNbQRX1Ut5raSctOoiQhA0Om25wQbl95A>
    <xmx:yiDeZ9RE2-LfyHjaeGrSp7l8273V08_ym7aPMJ6brtvH8TMHEi4_4BmU>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Mar 2025 22:30:30 -0400 (EDT)
Message-ID: <d2746ddf-92d5-4ac8-b361-60d1ec9aabb5@ljones.dev>
Date: Sat, 22 Mar 2025 15:30:28 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] HID: asus: add RGB support to the ROG Ally units
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250320220924.5023-1-lkml@antheas.dev>
 <20250320220924.5023-12-lkml@antheas.dev>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250320220924.5023-12-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/03/25 11:09, Antheas Kapenekakis wrote:
> Apply the RGB quirk to the QOG Ally units to enable basic RGB support.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/hid/hid-asus.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 5e87923b35520..589b32b508bbf 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -1449,10 +1449,10 @@ static const struct hid_device_id asus_devices[] = {
>   	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_CLAYMORE_II_KEYBOARD),
>   	  QUIRK_ROG_CLAYMORE_II_KEYBOARD },

I need to NACK this one sorry, if only because I added the RGB control 
in hid-asus-ally as a per-LED control and it works very well. You'll see 
it once I submit that series upstream again.

The distinction between MCU mode and Software mode for RGB is frankly a 
pain in the arse. For Ally we will want software mode (per-led) as that 
allows just one USB write for all LEDs, and no need to do a set/apply to 
make the LEDs change. The benefit being that the LEDs can change rapidly 
and there will be no "blink".

I'll write more on patch 10

Cheers,
Luke.

