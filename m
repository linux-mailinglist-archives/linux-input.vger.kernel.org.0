Return-Path: <linux-input+bounces-11104-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F9BA6CD46
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 00:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7238E3A4AAF
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 23:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96391EBA14;
	Sat, 22 Mar 2025 23:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="PsYBDCC2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="0vY4ODdI"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBC81BC5C;
	Sat, 22 Mar 2025 23:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742686258; cv=none; b=toJZWA+YcOtEyk8bRKJfqBvpXtD11tJi3jnTS2VxwCy2ZIWbMZ0qTRj3mGwlfGUYCwntGbrdlMKmvnNOHkIG4M5DaVaJUGQWrt4iRlwcBLSP/KfbyJPCbESDocldgTEk2hsS7ViFkRszXV/lYH3VW7fcBVqRAoYAKLgJ1PVCObY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742686258; c=relaxed/simple;
	bh=v5mzlptr8jp2jPndKYqlh890HucofGBkZMOypkqch4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LzlHdb+BfzNZfeZ4s6+/ZJambNRa/eicljk4qJGBEldcV1RADjxNd0AqzYDIH+7IF43XHZDAeEPFTTNq7CcnCZWUZXI9UIdT7EiMb/WE6edg0DDeS64HeEJgoZzNGSsXwhb0yPZN3OsC6jnv9Rn+XmUaUw8prIK74PDFiAETX/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=PsYBDCC2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=0vY4ODdI; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BE1A52540123;
	Sat, 22 Mar 2025 19:30:55 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 22 Mar 2025 19:30:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742686255;
	 x=1742772655; bh=2HIHF4hYWDttXtVGZPiuF/iuxW0fBb3KbQ3X6mRqFrU=; b=
	PsYBDCC2NmnacuEA4TtuS5uMTM/EWhnHWEW3ktwfYVA+U3erCy1LduMe5pnZU3wo
	V+0f5VF88dEt/c2D6aIhgqBSdQ47ZrxRrvYqqL/Tg+/u/MkKYXlusxgFbGvsypDm
	oaZXZFy2M3aSkiop0B7AyZMI0M9PHxLMXepy2kfIv5HtkDKV53fts7dIyTh7dSJS
	NtN57H27IFL9EL74xQKS+JeUq0wdwaorrdiZxdt/ZIAO4ZHHIeLSVpK6aZ7Edjuw
	m9mwPjLkhb39aeyTkLUP/n9qn5fkFpI/+e8QGiF2srCTI9M5hm9h9WJ3x/uj5qzh
	NbtpEr6Yh8xglpfsZ+EvDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742686255; x=
	1742772655; bh=2HIHF4hYWDttXtVGZPiuF/iuxW0fBb3KbQ3X6mRqFrU=; b=0
	vY4ODdISTse1Wz2JP0YaIvxv1A03o0GaoeUFMm7E7SrKZfcFI2t5P44FQA3MUZup
	n7jT1cJ1rZhS6IBiz+bPp/Mx4cj4I3nFZ2QbSr3Xj3CLyeFSopIr6CSMi3BQqxhD
	rkOfDQZias6S6CaZqe0GBQctiVuwP20HpcZ53heGEJZcr8SeMyjrXPqivOt6uxsq
	K9XVWrRf08DZUjMaUIEgzWMs86ZnKN/gNCGlUf7Hsc04AUf4M0ddgQvN9PSPz737
	CSG9ucz7QMW2ri36GIK5rGhEuLSucd/dsqR2Zo3m8Gu6ILMozrpTOMLT4iEyUMHq
	y6lN7PSElb5Bou1CVKttw==
X-ME-Sender: <xms:L0jfZ2f-SNcr3kxIzQVia4nCXsLzW-h6eEYObXGvM5cpAeoST2SILw>
    <xme:L0jfZwP4jl_Ed4cRbW6s_K2TQBDAJ4eFDDcEWSCyIPQ-ECw-oVodjMwYDHAG8txiS
    QPz9y4j5nWPJ02-VZQ>
X-ME-Received: <xmr:L0jfZ3ij1laLUoZ2iR_TVTEHfx4kfCFLWslKxRZCCOOF6G1g3mabHTqkylGCSuNmlZsR2noh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheehfeduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:L0jfZz_WxNeByc_8ll6JHSpTtg-te0bHtdU_0C0rX23INwnd3X38Nw>
    <xmx:L0jfZyuXoxfdPS_MhjASe2fqqYkB3JJoC6HkoAr-ez-ZjO903vVt_Q>
    <xmx:L0jfZ6GbAjHKvMWFyXi8TD88iVI2bjSRJwOxw7pVbEQV07Y-HkuqfQ>
    <xmx:L0jfZxN7-L4A8wxN0cUrO1lfqRcXfx_XKpmLEISTc8LCMmnT_bjEKA>
    <xmx:L0jfZwBa1QMRHIxDKRLqjX50hw2HDvYWaNTl63BPR9zpPpzd3cRqXeRx>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Mar 2025 19:30:51 -0400 (EDT)
Message-ID: <7d366439-72be-401f-af5b-01547cbfecd8@ljones.dev>
Date: Sun, 23 Mar 2025 12:30:49 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] HID: Asus: add Z13 folio to generic group for
 multitouch to work
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250322102804.418000-1-lkml@antheas.dev>
 <20250322102804.418000-4-lkml@antheas.dev>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250322102804.418000-4-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/25 23:27, Antheas Kapenekakis wrote:
> The Asus Z13 folio has a multitouch touchpad that needs to bind
> to the hid-multitouch driver in order to work properly. So bind
> it to the HID_GROUP_GENERIC group to release the touchpad and
> move it to the bottom so that the comment applies to it.
> 
> While at it, change the generic KEYBOARD3 name to Z13_FOLIO.
> 
> Reviewed-by: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---

Never been clear on tag order but I've always put authors at top. Just 
something I noticed as it's different to what i do.

>   drivers/hid/hid-asus.c | 6 +++---
>   drivers/hid/hid-ids.h  | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 96461321c191c..e97fb76eda619 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -1319,9 +1319,6 @@ static const struct hid_device_id asus_devices[] = {
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
>   	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> -	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> -	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD3),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
>   	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> @@ -1351,6 +1348,9 @@ static const struct hid_device_id asus_devices[] = {
>   	 * Note bind to the HID_GROUP_GENERIC group, so that we only bind to the keyboard
>   	 * part, while letting hid-multitouch.c handle the touchpad.
>   	 */
> +	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> +		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO),
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>   	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>   		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD) },
>   	{ }
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 7e400624908e3..b1fe7582324ff 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -209,7 +209,7 @@
>   #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD3 0x1822
>   #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD	0x1866
>   #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2	0x19b6
> -#define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD3	0x1a30
> +#define USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO		0x1a30
>   #define USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR		0x18c6
>   #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY		0x1abe
>   #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X		0x1b4c


