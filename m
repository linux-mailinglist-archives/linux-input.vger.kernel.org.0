Return-Path: <linux-input+bounces-11365-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AC0A75D15
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 00:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FDF1188A3D5
	for <lists+linux-input@lfdr.de>; Sun, 30 Mar 2025 22:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9BD1D9A49;
	Sun, 30 Mar 2025 22:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="Ipuv5bJ1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q2hEP55J"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CC1360;
	Sun, 30 Mar 2025 22:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743372703; cv=none; b=Iwk9sCvQP8juGHDesopmOGFq73RYPK/+kkOSI3WwZgLuuv4joCTCUf5C63/UAFhOQJ4+N8XwI1mFr0QaAtjI35sHZDma5WFApbz1R3ZQdVEGxkoVueuS+QWDgK85kZyi3RvKFhwGMs1OAePw1EIF/avATdLc5B8deQBe81DkaTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743372703; c=relaxed/simple;
	bh=5OYu+LPdT0zxCCut4a54c8JAWGyt/pv9NUzT3onTaqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k7TYmG1DOC3p+5LCD72Nv/MopmBY734jPsXJTyYgsVdSecGMHxoaEkYQQ2htaAeB8DDJZQSKXZpWmsiVU6I9GWJSbhSQIK4KYOhLsEaOGjhGkSfWErL5/+X01QTNo67m8FI8u4cqWBvWhVjxcB238c+bYKkUvVmBd4wvlFWMPoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=Ipuv5bJ1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q2hEP55J; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DBCF11140127;
	Sun, 30 Mar 2025 18:11:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 30 Mar 2025 18:11:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1743372699;
	 x=1743459099; bh=lNzTTxGuh6BzUDpbT5+6DHYz7KvNNl77PA84r4+mVfk=; b=
	Ipuv5bJ1YmwgIUqWh564SrrlC8MkHQ20/LvQ3km2QFG947KC30zxyOb2Wbe/kpyU
	yI2cZtpFt9DwcGtVjzNKSIhXTQ8hRiqc1wTJ5sKgOPGGPnYwhFSPynBBE/EXaJVh
	PcbIz78UeLTtT7xadvcFw9x6JR9KNrKMyBcAOT1tw2chhKqENP/7vYGNHCk/bExr
	tAF/X92St/bHgM6dKIJphxn3eXtS3y2TcHMY6/8b+lTNHfRaLXyLHJ+UoJ5EgQ3s
	n8/msdll9i74XcypZLocO0Gs0aaCjlThem9n7aVzwrSWE5yiifjocQp4SghDIhqW
	yaiZaCkNvkDvTijRactbjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743372699; x=
	1743459099; bh=lNzTTxGuh6BzUDpbT5+6DHYz7KvNNl77PA84r4+mVfk=; b=Q
	2hEP55JrRUILU6IEMONn1tQTIFpRCfHnIlhUdCttjcvGtjfisb3hbjGN9i4Ul982
	8M/kc340L3v7Vge0nEM5CBN2QmEvUockRi1sI2MfPNb5Yk6XLch7+SuxcB/9fJTd
	4R3zT74hmiM6dW5SAE6q/URcBGEZ8VRqFH/ATirVIASEAz9cvPE/moOgwwG0K8jU
	1xNya7ubVcNIE6+gbuUFSKIJkO5CbFIjys3axCvMdxzjMNhiYwmDtfqT+c85k/TM
	/D90jLnk1g7JhDE5UjSkCC5QWiByJFYmkGgmnyYOArEtETktETH1n70jR1Fg9Szs
	/evVdTccaPyXLJktJ9qcg==
X-ME-Sender: <xms:msHpZ_X1Youp5Y24nZDM7OWdzlw5ip54cVxfiGDupeTT_8qw3j0unQ>
    <xme:msHpZ3nz7r1T9QijVbLLWzbRh3yb_miWRaQ226R6BVgpC_9CbdSFfsX3vCrBZ7Lnr
    qWV8mSeEdZD4TuuxXU>
X-ME-Received: <xmr:msHpZ7a4aOaPUv4F09iXnnzu3vt8Stb__u3pCLqYd5ST6-kboaIByX-Hna91Crf1JUrdqc6o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeekvddvucetufdoteggodetrf
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
X-ME-Proxy: <xmx:msHpZ6WVNZGltVt4S3LUTDTkCSDmeLDX2b60s1osjrLsfqwZp3bucQ>
    <xmx:msHpZ5m5oj7_-D1oNd4JxXMZkH-Wlc_VUxQqkfs_E3g41PVcHeCx7Q>
    <xmx:msHpZ3cY-yX9FEJhNJq8KJEE--4INGgWQDXws_GIFMMctUOnuAyX_w>
    <xmx:msHpZzHmNfb_ky3otupe_0v3YvpWmg_VxF27muKQCFroJNZEr__b4w>
    <xmx:m8HpZ746L3xitxXW4uqhNgqW00N9ZiOXTeVMSfraoA0b_-r_eEpVTOnK>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Mar 2025 18:11:35 -0400 (EDT)
Message-ID: <648a1d1f-a222-480a-aec9-ab3e0cf790a1@ljones.dev>
Date: Mon, 31 Mar 2025 11:11:33 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/11] HID: asus: add RGB support to the ROG Ally units
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250325184601.10990-1-lkml@antheas.dev>
 <20250325184601.10990-11-lkml@antheas.dev>
Content-Language: en-NZ
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250325184601.10990-11-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/03/25 07:45, Antheas Kapenekakis wrote:
> Apply the RGB quirk to the QOG Ally units to enable basic RGB support.
> 
> Reviewed-by: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/hid/hid-asus.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index c135c9ff87b74..fa8ec237efe26 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -1424,10 +1424,10 @@ static const struct hid_device_id asus_devices[] = {
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

Hi Antheas,

I have some good news for you, ASUS got back to me, there *is* a way to 
get the feature level of a keyboard.

## 2.2. Configuration command

In order to confirm what functions are the USB device supported, host 
retrieves the
configuration information by feature report method. Therefore, the 
firmware has to
return the data (byte 0x06~) to the host.

### 2.2.1. Set feature

| Byte 0    | Byte 1    | Byte 2   | Byte 3   | Byte 4     | Byte 5  |
|-----------|-----------|----------|----------|------------|---------|
| Report ID | OP code   | Addr_L   | Addr_H   | Read ROM   | Length  |
| Report ID | 0x05      | 0x20     | 0x31     | 0x00       | 0x08    |

### 2.2.2. Get feature

| Byte 0    | Byte 1    | Byte 2   | Byte 3   | Byte 4     | Byte 5  |
|-----------|-----------|----------|----------|------------|---------|
| Report ID | 0x05      | 0x20     | 0x31     | 0x00       | 0x08    |

**Byte 6**
- 0x00: KB, 1-zone with single color
- 0x01: KB, QWERASD-partition
- 0x02: KB, 4-zone with RGB
- 0x03: KB, Per-key with RGB
- 0x04: KB, 1-zone with RGB
- Other: reserved

**Byte 7(keyboard language)**
- 0x01: US
- 0x02: UK
- 0x03: JP
- Other: reserved

I've not done anything with this myself yet, circumstances last week 
weren't great for me. If you implement this in driver I will ensure I 
get it tested as I have both single colour and rgb laptops.

What i *do* know is:

- 0x00: KB, 1-zone with single color
- 0x01: KB, QWERASD-partition
These can be standard kb_backlight

- 0x02: KB, 4-zone with RGB
- 0x03: KB, Per-key with RGB
- 0x04: KB, 1-zone with RGB
These work with the regular EC-mode RGB command for static/solid colour 
and you don't need to worry about zone/per-key. It would be good to 
document those as defines or enum or something for future.

Hope this helps.

Cheers,
Luke.

