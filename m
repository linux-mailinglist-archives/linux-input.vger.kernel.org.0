Return-Path: <linux-input+bounces-11109-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA21A6CD5C
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 01:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A2B716A6B0
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 00:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A89623;
	Sun, 23 Mar 2025 00:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="Ax3U+lUn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZRqKRWIh"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710DC163;
	Sun, 23 Mar 2025 00:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742688320; cv=none; b=HANpS6A1b4z2B29EQbDegTQ9PP6xLPUDvIrDxYZphGbaTEjVOQDkNQyYkn69TCvIi8KfgL9Ol5H24m8qWqtmp6neJUiTBhwd6DlTMkBBgMgzD927HRXGPVP31R74sLT2g37Or3ExsppYcboV9dCClO0+0hVcPGegfmQtOLWsCWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742688320; c=relaxed/simple;
	bh=1/tYxCcZm8QuvWKkt2WQKvbfaz3dhW8xfvLH/H31khk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=muOP1dRveYOFBisIcVShXDZtyk4kPWXxOrESJeuvhwLcwkTOfp88VAlNbKe5s3rNmqS0boFr1VeEtCZc1W28oEthbLgj81ZQNzvHQowc7rbkT9y2hAgiPSBby1O042zXHFmCbM21CsGVgir3+QuhpC4DMFLl2xMX8jA9HWHgNK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=Ax3U+lUn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZRqKRWIh; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 475F9254011B;
	Sat, 22 Mar 2025 20:05:17 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 22 Mar 2025 20:05:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742688317;
	 x=1742774717; bh=BrZS0p1dXg4nkbNxxbidKu2uRHYiG5cM+dze1p1q+Vc=; b=
	Ax3U+lUnavca5vSkLJYksTD6qWN59mKTD8Hbq7WReBlbSwNE6QNsln4m1xeTnky+
	ME5IEEGLmFV2t1HcnBkS9QONdFYesZ7T81ml5ao84uQX2lI6ETAu6hcM3ipgKumz
	3tEbnacId6BF+xYbpNJDcYJAHmyr1k2W/p5hyvmPFo0NNM0vnh8AdO038nE90vJh
	71Rpcdw/RJsT3WWyO6FsR8N3kB9sO7hZEx5cT0qj8EWEpOvLKj5YtPo8bkyTwEMV
	zP+/aw5zLtUpUy4Mn9ik2hljtjbjV7y0ShRmTRBu6apviQBopHxGpNU+ejEaczk3
	IBzeTj+I3VpodB4gZB6xvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742688317; x=
	1742774717; bh=BrZS0p1dXg4nkbNxxbidKu2uRHYiG5cM+dze1p1q+Vc=; b=Z
	RqKRWIhWL63tUx1kBog6HZPJRtnj7+jjJ4UjJJycJtMUAaeAykHl8SKY3ndlPg/H
	OLZ1h8aavm5JwLHdak0/jV3ZxdLPDv/juyoLY63oNJXkrqeSC8oJ60Iba+Z4g17i
	b7ySjmenUPUBg3izy2mK75z+CjEy5pL0WRE1wm24znn8dduoAvcLc9/N/RPVvCPh
	MjuklTahTKUhB8D2zOWUmVtocVJrLRdOFrH4YVx/3KLWH25+V0+XC201xY4imj2v
	U86aKcFKSugtea+m64Iai39cIyFHibempOy9auzo9rUNAdNUGaA8oUNJKVwW0g/e
	Dn8J+X/lNQjhwyfRYKQKA==
X-ME-Sender: <xms:PFDfZzDtJePo6Nt0XaEBLyde2l2nuej8gSlymw5WymxdcHA1kdKXXw>
    <xme:PFDfZ5g5dVpp2eZ5FQvd_Fg01G84wxVLRIMt-ZsCJaUm2bQDhjL3UY9dE4INKwU-c
    KlWYwHjgdAXVAPm1OY>
X-ME-Received: <xmr:PFDfZ-ltKLVBpyzaInlUKe-8ajVpA028dhCSt8nrfM8HpHtbU6Ucj0hyEYk7QhPJnKfVk2GW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheehfeekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:PFDfZ1yOpRq8-efLJRvArEYOOKRSivibmhodmeKVuu6p1C-6hqe0dw>
    <xmx:PFDfZ4QJeFfh76AKQw2uv4U1aUbdJOHyrll4t2rZinFdRxhOs-EmcQ>
    <xmx:PFDfZ4ZBP9WwJlTv6gPgerKaIluRKVLpOvHVNH_KsmCWR4LpAINQlA>
    <xmx:PFDfZ5Tb8q5zUFdzY4NPppasozNqhJRATZM-DaCoqelgBjhFR5NFtg>
    <xmx:PVDfZ7GiYrUycvmyeY29EtUHNMXmX4nNWxSF9eDy75UhyUq99e3LvxdL>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Mar 2025 20:05:13 -0400 (EDT)
Message-ID: <8b24c489-0353-4eaf-aa34-c2d24fb09d57@ljones.dev>
Date: Sun, 23 Mar 2025 13:05:11 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/10] platform/x86: asus-wmi: remove unused keyboard
 backlight quirk
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250322102804.418000-1-lkml@antheas.dev>
 <20250322102804.418000-7-lkml@antheas.dev>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250322102804.418000-7-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/25 23:28, Antheas Kapenekakis wrote:
> The quirk for selecting whether keyboard backlight should be controlled
> by HID or WMI is not needed anymore, so remove it.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   include/linux/platform_data/x86/asus-wmi.h | 40 ----------------------
>   1 file changed, 40 deletions(-)
> 
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index ec8b0c585a63f..c513b5a732323 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -183,44 +183,4 @@ static inline void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
>   }
>   #endif
>   
> -/* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
> -static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Zephyrus"),
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Strix"),
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Flow"),
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_PRODUCT_FAMILY, "ProArt P16"),
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_BOARD_NAME, "GA403U"),
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_BOARD_NAME, "GU605M"),
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
> -		},
> -	},
> -	{ },
> -};
> -
>   #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */

I might have mentioned it already but I think you should squash this 
commit into where asus_use_hid_led_dmi_ids use is removed. It's 
something I've been asked to do on a few occasions to prevent possible 
error/warning on patch tests (unused).

Otherwise if it stays separate:

Reviewed-by: Luke D. Jones <luke@ljones.dev>


