Return-Path: <linux-input+bounces-11118-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBB8A6CE00
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 07:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0887C16F1B7
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 06:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F486201021;
	Sun, 23 Mar 2025 06:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="dANbKYsr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="el7zuu2z"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23371DFF7;
	Sun, 23 Mar 2025 06:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742711386; cv=none; b=EOynzpN1Yofs/0uwDDCUrffMdEzYWROH43HoAUHgwCTQOXwu2cj+ezrY3FRBSgyhBd3uguTLdigSuhVOXxYrtJU6qBkwJNhP/M9e/CxNkNv0t4oETIsocWnUOwZSl8+jgxShi+TV1Bi73zQ7x2Br8CasSLR78GOJDWn7XeJd+BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742711386; c=relaxed/simple;
	bh=ZB59SAlTAIjqdmyqoHQ4idigM2u6t4rdwdpkIKmx7ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C2vCq7mNKArU4zhKSiMD+KP31yU5CNhjh2jzaIsdtyCI61a/EmjrSpgbbjj+Ny+cR2dZltMNEzILPW2chzkxzZm+Qmto2UC9moTosbmESYMp83xlE0Agxy00OsZojWaJLa/ejQ1tu1Cr0SpaXIJgHFETHpBdsxb0AhGbPLfhyJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=dANbKYsr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=el7zuu2z; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id D14FE1382D75;
	Sun, 23 Mar 2025 02:29:43 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sun, 23 Mar 2025 02:29:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742711383;
	 x=1742797783; bh=uyt6zaXIk2dJafBDLPUE9Q/yRJaG2eg6aAORdIP4u6s=; b=
	dANbKYsrmmgq2bbLFs4MlObWJYVMjCpe9tK43+37bHm6VH/DZ250tJ9RlU2hUuMb
	fdGJenAKmEag4Syl8nYm9tQaZitbDhK/LH0sdKMWkug8TfTJlO3dIx0zu6HH5Suy
	Jbv+99XcOQNGBMnc2Xu1gRNhnQTZbTrUUhaxKhA4qdJJu94ZlBPTA3attTMNj044
	HpQ6yg20/v6RUDU4+54IeFOciJOlwc4+k32aD530mSTg8jQ/ho129mJp86MByTpV
	xZcsOwM4uaE010yfawntlEPWQDbXbGiOiCQDQptd4YKiW/AFeia98B3pz0GLq6rj
	lGc6ZR2ekMnsjwuaG4VCwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742711383; x=
	1742797783; bh=uyt6zaXIk2dJafBDLPUE9Q/yRJaG2eg6aAORdIP4u6s=; b=e
	l7zuu2zflYpCp2PEt+4gjEDUbEAhYX025zyTV4xwhTdVkwC5lCThRHqFIbuAHXRK
	17+brMV8HDRD/e6OLuK23pAfCZ64+ZSNTBs0lLztWWeOM+LKq50NXNLtUgT0nUBM
	jKjVdXz0CVI1Wv7/Y6IPM2+KycUMPtUmdgJhNRQAL8TKbOmziL09rWlKUv4LBM6d
	Zz03zDEhgAYoyU9iy3rsP/OmDGqEEFkY1lqvyL+vBeIXW7T8guf2DykUOmvSwNGb
	sGdpy6LD8eT3x/ZI/f1nHpxc5XVHbbPmzWsaiKR5+5/d7yopb1OoVL79mrynZ/W0
	4Fy9bBs5oHr+bLHety+oA==
X-ME-Sender: <xms:V6rfZyk1K1shuqal4pi67tJeLBc6G4ODhTG1b4_2wGvkEnbKqFwsUA>
    <xme:V6rfZ52U6npwT0qlxJYt2CqDnN8PSTvZONSBF-SaYW39NWDmS84jG5uJvGvaKsMpr
    sFKDUokt9vxJZ7jyK8>
X-ME-Received: <xmr:V6rfZwqtgjVeA8PrWVlgcSqyikaupxjXJE_03gPsQ7WinoPa5Ojlpq2dc8WPYu05V4H2_Gi1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheeiudegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:V6rfZ2kVNqanzrqtDKrk-rHipDiVhw7OVoQETVDh34eaaIH0AeWa5Q>
    <xmx:V6rfZw04U2ODq-EvspDtzyCddblJWtraGQXxeXLVfcxmxU4vDVP7tA>
    <xmx:V6rfZ9snrYFaLzwV3drAFhT0kBNmOnwQQ5_I8fLnKtgEfBPldxtBLQ>
    <xmx:V6rfZ8VLCuPczJ352DntPKW60gfBEkpiNkdmK3BrpUHd6BYwkAuvzg>
    <xmx:V6rfZxLsvvunpsq9gmNydYaI9D48UMo5kWdxHngNEP9xB8xEH2OcoDYM>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Mar 2025 02:29:39 -0400 (EDT)
Message-ID: <26a3849e-1345-40bc-8b42-25f96ff17430@ljones.dev>
Date: Sun, 23 Mar 2025 19:29:37 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] HID: asus: add RGB support to the ROG Ally units
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250322102804.418000-1-lkml@antheas.dev>
 <20250322102804.418000-11-lkml@antheas.dev>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250322102804.418000-11-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/25 23:28, Antheas Kapenekakis wrote:
> Apply the RGB quirk to the QOG Ally units to enable basic RGB support.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/hid/hid-asus.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 9d8ccfde5912e..1a9cd7f513282 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -1433,10 +1433,10 @@ static const struct hid_device_id asus_devices[] = {
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

This is fine. We can deal with reverting later if required, but even 
with my hid-asus-ally work as is, it doesn't affect it.

Reviewed-by: Luke D. Jones <luke@ljones.dev>

