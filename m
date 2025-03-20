Return-Path: <linux-input+bounces-10998-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A37A6A032
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 08:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24527464099
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 07:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703A41EF388;
	Thu, 20 Mar 2025 07:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="zU7bBz6y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="l6dwD4jH"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A041E2613;
	Thu, 20 Mar 2025 07:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742454669; cv=none; b=OShqTqhBHLb9h4bvGGmtcLHWA5Ze9R1vQh++a4jyIKwJL461lFfKKeA4uJzoARTlWP2bjO7IDGrfxRHwTH20C7/0+6DPiR/rvAb1HvALnBb7OINb+6qpR+zfFAbDW5znLVewzB1ZqpuoXYR2acJQfdT8flpQQ2rf16YcXGc2Ol8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742454669; c=relaxed/simple;
	bh=Xi0X8Fd9ACjm+tmfsTSI7pJ5BONPXN51TssS66JBaUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p83e6PYXtqozAlsPrhwpjajlJj/y9u1n24wGq8eNZ6I6EkFbMxNneIJXIjmFfcGvEAxL2rPU++SsrvAiIBBEmt/exJEzNd2K962lcyaJ9KuDpAacxT+01lv32cUzdltSCMcVdklSdNB8CftYuoUNi0ru1fErfHOzCbB/oMfw1+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=zU7bBz6y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=l6dwD4jH; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 69E9211401AE;
	Thu, 20 Mar 2025 03:11:06 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 20 Mar 2025 03:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742454666;
	 x=1742541066; bh=tjjIYe5KJakbRzF9kyZSLy2U+I/YDadXEl6G0mZ0sg0=; b=
	zU7bBz6yiB/JEJFQfau/SBmZhSIjxjxAbtPA8rN2uQ2J4w8hLIdIhBU7qBTLiRas
	beCQGwLj/+aAZ+VO/mOJsHzzalagnIbIAngvLmTn6zBzxNjAelJ2dTpM1x+E9Ibm
	PvnXzv1WW9glbmV+gppwUumzDqkjfPZQ1P2j0AQylgQz56xCT/k/x+q+eXbALP8x
	ldGim1nzMPSEhMe2lJNB5XDFUea2ECG/+nSf+PeXbKOtItZzinSWI2BDGE2pY9J0
	MJSijNJx5Dle4+/pAyRDdlr5jX609zdPzxxk1laOyrHr6SS0oPghvIYRL/XTpYQF
	fWyM+U58de/6hjtNjXYg4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742454666; x=
	1742541066; bh=tjjIYe5KJakbRzF9kyZSLy2U+I/YDadXEl6G0mZ0sg0=; b=l
	6dwD4jH0dtytRF9ctmst0E5wdMOzvwc7SyF0rC4ycqAYcbW8qQ4gogKe24N7h/47
	JC552oXloHvCgGhYPyuj9B9XW5Obv5A98/xRWDMSNbNZ0gLZehxR0L8ZyCJfXaIa
	CXbMqEH3wERVRdH5P/xFrfjCT9ymYAOF7tILgIKHXDEPT7ZiJPjoBP5r5dVgIzUR
	InUgkQPxe7Me6ifEDdJ+gtrww+EJ7wHbvtXADBcp23idszTdsArWyGEOgYWtLIhS
	coCOKccLOCNPw38lwvgC5shsxVmK6poqUNSe0sWheXWpMjR2JfFiLeLJiNr9ez9R
	7wDH7B+ylHY5I+M/HguqA==
X-ME-Sender: <xms:ib_bZ9ykVLsWRlp7GMdIR1ROah3iND-L5bi1nimN1nm08hgpRjqcIA>
    <xme:ib_bZ9T17dmSxQfCxRzjdgfkk2G1vgyOC_LHAj_qO9znLxAALNiLr7RWzMFVdcZ7f
    8ZB2eMsUzj6TiH7JVM>
X-ME-Received: <xmr:ib_bZ3V7_gOfMUekRcVxXxI1hUSgYf1EbrCfwHhhbGGtC_AhndnEEz9ZcdMMS2Ob1htF0WJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeejheejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:ib_bZ_gaBeEkA1lyeELg9haQPciT8I1877PICTw7OgV9yugAxE3yhg>
    <xmx:ib_bZ_APS45rJRzDkCE4XmHEc7WnTkrgouIWmoiKeqj2BYsOXWxryA>
    <xmx:ib_bZ4IFblhQupEVs6bKJbKf6dOj8in4MAG9ICjI1W49WC_vPhoVxA>
    <xmx:ib_bZ-C1QMIVFxsgrTItfAX6gDpsOgLyww_Aote-OolFNzpB0LMW8w>
    <xmx:ir_bZz0rRwllV_qgMn4Ld3FfrmY3ztz0hyeT1CE_zUTBVuC0s_7iSpvH>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 03:11:00 -0400 (EDT)
Message-ID: <2341cca8-4f3e-48dc-a97c-aec2a27e3f05@ljones.dev>
Date: Thu, 20 Mar 2025 20:10:58 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] platform/x86: asus-wmi: remove unused keyboard
 backlight quirk
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250319191320.10092-1-lkml@antheas.dev>
 <20250319191320.10092-10-lkml@antheas.dev>
Content-Language: en-NZ
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250319191320.10092-10-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/25 08:13, Antheas Kapenekakis wrote:
> The quirk for selecting whether keyboard backlight should be controlled
> by HID or WMI is not needed anymore, so remove it.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   include/linux/platform_data/x86/asus-wmi.h | 40 ----------------------
>   1 file changed, 40 deletions(-)
> 
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 42e963b70acdb..add04524031d8 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -183,44 +183,4 @@ static inline void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
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

I think this can be squashed in to patch 8 as it looks likely to cause 
an "unused" warning or error? I'll defer to others though.

Cheers,
Luke.


