Return-Path: <linux-input+bounces-11063-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 061B0A6C6F0
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 02:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FC1C7A88FC
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 01:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C79A5234;
	Sat, 22 Mar 2025 01:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="dWlcz99P";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="X977S+bV"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F509258A;
	Sat, 22 Mar 2025 01:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742607106; cv=none; b=gVrrxLPwiMcrPy99kg+Libc22YixVhNSTZLjRms6BHWJU3MYGWCzGOQY3nNVjgCX9oDv8vRgM50XW5TsbqXCdCzrEIQeFYX0MeWpz6f9z0cNvGTZFdfLFQSZWHYwVmQCxpW14LlmHMwK+HekwDF/tXidyHXb5B8i6MgiZt1LGrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742607106; c=relaxed/simple;
	bh=OYnA3JyfWazDaBC5rsgE12wzV8ZoqYbBHOXA4cJgxDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XSu1wiJOWmSsJ9sHg+9Ke9Bqp3n/8ViQE4tFWgDfGgUzjie8kexLdufnzbGDLatwExp0zkifOV4VAGj6GabkywSYm7QRqBr5WTLVZPopSgQQLsv1/by5b2zZaXDHHxM7hyRss03KbARVLNtgK4Weyd+sXP5hcg2M1aAmWlv5oaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=dWlcz99P; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=X977S+bV; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id EB3D011400F5;
	Fri, 21 Mar 2025 21:31:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Fri, 21 Mar 2025 21:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742607102;
	 x=1742693502; bh=QfeiCm/jbhV2+/8QZqsamnLkMHeChIyhwx0F6Pfi/FI=; b=
	dWlcz99PpnkFmZUzg0aGhRaQ2nwxJ4AuWp/yklfOsZS6jeYyZfsJiGAAKFMsOt8l
	LRsoBvr4aS2lXQRpOTTcoOyzSmctlRSMrBlYrewAbEQS0p22p9jrbb0U3Jv08nsq
	TpyjshJEg83xNEyA7grglow2ifmwl9hNNlOCMCnodwokTSA1Lxad6TdJzfj6AUdo
	VWSBYS+6RJtkg63wDmUrJfRWswHau7j7ZkYkQLfTJ8z7TzRjHRWv5GBroaY0Ahpv
	94RSLMbUfPntXKNjV+u3GK25W55Dp8yT8F0qfV8+9Bd+LgwPyaCbCjzKTYwKzl+i
	xvyAsOlynUUxgLk40ewJ+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742607102; x=
	1742693502; bh=QfeiCm/jbhV2+/8QZqsamnLkMHeChIyhwx0F6Pfi/FI=; b=X
	977S+bV6aV2/yPoQt0WKlFgTJnNAnT4sVdbKfgDUN2BMU4fUUPcyaet0PMPCpK9E
	e+dMQrDBJ1MbsUQLHidXtj41IPcawRChSFqDjY3eTtjgDjQQhgFP7yddk8j2cLP4
	2qMCNaCxPINAulDwk8CO9wQct//UisiaSMaHSTDNTMgiUkI9vb2EthHHGojscu/O
	7+hBWTZEXhAVuY0L7apW0yraN7byB6VvUDWLrh7/UtYvRF6FQ41VbhNgdPjbTpKA
	wBXtL33JjpqnI7BN+4IYBdZZzD2Kwy3XDcyNTuE8QR23LuwR3Y9mxyrfc48tzKBc
	fJvLgEWBpX4toGmizXMow==
X-ME-Sender: <xms:_hLeZ7UG_-Fwld98PzmGLu4_NU_zb3JUg8FEorWTDbut-Bo1PJq7OQ>
    <xme:_hLeZzmVbsZvOhuSXPAYzuGxfXB7QyrWUexObZlCB1jbJLFxpmIvVrmyLAs1Mum7E
    aFeMAzGKyZvZjsFRbo>
X-ME-Received: <xmr:_hLeZ3YXE82Ma_F--cV74JxneweA9NurXg0yJZ8dajkBnecrVX2MIYGdt0et28YLbPAvUb_Z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedvieeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:_hLeZ2Vt4LE06p7tWePoWLOC1MMKIuLycWm0rpDZ8kmUbg1FLcPdzw>
    <xmx:_hLeZ1kWNwoq6uvoqjCLSTb310wn8QBnZMxY9avMLj4B16gQmNBpXA>
    <xmx:_hLeZzcWeyC0oNXTdSYwVdpUboVdKD150Sw2bS2FYGuzoYilQkRR3A>
    <xmx:_hLeZ_FwrwlVLZKpgpEM0vNgP9EuRQpthOp2-pHUFfk9vpyvXrfvQg>
    <xmx:_hLeZ37JLlH16It7Bxay5mK_gVOh0vXIgl0WbXxvu2acvt2KFc_Rl4Jp>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Mar 2025 21:31:38 -0400 (EDT)
Message-ID: <aeacafa2-2155-4cd1-9a1b-cd2ee7634497@ljones.dev>
Date: Sat, 22 Mar 2025 14:31:36 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] HID: asus: rename keyboard3 to Z13_FOLIO
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250319191320.10092-1-lkml@antheas.dev>
 <20250319191320.10092-5-lkml@antheas.dev>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250319191320.10092-5-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/25 08:13, Antheas Kapenekakis wrote:
> Rename the generic keyboard3 to Z13_FOLIO as it refers to the folio of
> the Z13. Both 2023 and 2025 variants.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/hid/hid-asus.c | 2 +-
>   drivers/hid/hid-ids.h  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 490a7ea369961..cdd9d9c4fc95f 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -1332,7 +1332,7 @@ static const struct hid_device_id asus_devices[] = {
>   	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
>   	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> -	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD3),
> +	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO),
>   	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
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

Hi Antheas,

I checked history of the Z13 and use of the 0x1a30 PID and it appears 
only the Z13 folio ever used this PID.


Reviewed-by: Luke D. Jones <luke@ljones.dev>


>   #define USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR		0x18c6
>   #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY		0x1abe
>   #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X		0x1b4c


