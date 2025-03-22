Return-Path: <linux-input+bounces-11064-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EBCA6C715
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 03:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19E2B7A3C7E
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 02:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB3C42AB0;
	Sat, 22 Mar 2025 02:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="cPjiKEVr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RWVNg52N"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2BCB644;
	Sat, 22 Mar 2025 02:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742609329; cv=none; b=kJfxNeepQO7pVdW1We7vEzkqkPfJTY4mVILW7dS1p4HXKAlyut+tYNDt4JwSyUFSyyeDvk21jzEbVmE3XHuv3WBV/XFAOiVM/+kdMhnUzwxC80KRn655RKYoul4GIngnpa3GlOM4MBE6NG0MzOiEYl12YfsO52Xd/HUcdYUnzg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742609329; c=relaxed/simple;
	bh=+TIQCuUr6qUCQofdlwG6N/RgKB2xFGYaX+9vbcjNrtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c9I8b7tTcVG5paV7smFdYBHBkr0qQfT955RFSVhxBlNLODMDjWTe+7rNu1hCNqgPk8zt4HdXUccm8EUdnSj0In754QmF4N1zgyFS9Xc8SCszwzMNe87seGmWxfVPO0MMOiS9KFGyeEqsDMyqgZRW0JEoKplQ3HNV3BM8kiXSiPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=cPjiKEVr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RWVNg52N; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 055A81140100;
	Fri, 21 Mar 2025 22:08:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 21 Mar 2025 22:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742609325;
	 x=1742695725; bh=owzLzdJ7aAL8ofWb+RHv5TBKWPaz6GLE9l6Q8vhDBhI=; b=
	cPjiKEVrg9ip03905n3YOc+yn4Yi1t5EdpbB/NY0idcAa1Nq85GgVo0Y0F9T2H/8
	FfCrZBLUr0DYhVVpDC2jHp8svyQGF1KFuMIB8HZ8Xpv0DWIPhQmf0LzFng90HafI
	Mb4h+iPtEuYRLOenzwbKMv3RFZHpZNaP3/YQmtX+IqsC3wY64fSy/jQrciyYcX6W
	PN8Qg9MuXUXYLYbh1KJoyIpnTWb3uouyS20D+zAmRy4szTh5xtV8tnjk/rRfxdig
	TQZaov64Qi55SDDgtLF8jiP5lx+QQkKou5nYTRM+JJqB5OcrLfu0rDKoFMEXPkz1
	JYEisSWLtsIs1WQXOt0j6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742609325; x=
	1742695725; bh=owzLzdJ7aAL8ofWb+RHv5TBKWPaz6GLE9l6Q8vhDBhI=; b=R
	WVNg52N/cXrUAjSwzHyiEV2wmK8hqeIsOIw48E7mLH6sGYpKqW3dcA2bHLiw5Wnf
	+Ypdbb3DmYOsAevREFWzen7ohUZD5HljSs02doQWN0A8xR3MDK2b5ZgIAlaXFDVp
	zFNn7Sj6wriQ32jmfDWPYhJw+AZecUdv3rOIWIENMHH6Uols1I3fgL2r22eOQKcI
	B5uJqMNnpeIN0DdxMLxx2YIErc9AIjRQrKX2BE76AHzhZESVlqjrDOdzu6xcQCD3
	Td980YV5TNyjhqkoH4PaxGjGXaexq84DUyDb71qgYkcHkDHX/wZCJH7G+sd05kdS
	P3hH0Xum3iF4tdhkL8QMQ==
X-ME-Sender: <xms:rRveZ1ZN9V2zco4z7J6iEolhyoFJYSvszl-1-Y43HCrQTIcXv1yyYQ>
    <xme:rRveZ8ZNK4zPWqs3fPvjbzXyum2NellkW8SwJZpYIemnMjCevV_Qf1w9EqWr8rT4S
    YQdsSjiIVns820JJE0>
X-ME-Received: <xmr:rRveZ39ZOPR1vLEkXTKSoG6GVi-tK0-pPBZi1DB675pSz2UZamI6KCjjW-xuUqyG_0FMtF1q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedvjeefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:rRveZzqhXYQnr_w1oRf5r3PJkueFiz_lcOEr4oce1wRuo0sxzD2j0g>
    <xmx:rRveZwqGc6QpAzu6QB1KaxRX8ufUa-ARsEcB2WUeNeKlwEcuasjfQg>
    <xmx:rRveZ5Squ42yWPFWLv9RYCqCO9V0L8saN87fv8iQjg2_bNk_zx31Sw>
    <xmx:rRveZ4oqNv8yLXVtGg1MYT1ePYmIn1aGFXxRjMaXO8KeJE2NNdFxHg>
    <xmx:rRveZ8efPNgUISyublK3Ul9Os_5d08587bREmbszwkjHWy1t2ni8fiBk>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Mar 2025 22:08:41 -0400 (EDT)
Message-ID: <ceae02cf-0f5e-49b6-a42d-607416a9cc0f@ljones.dev>
Date: Sat, 22 Mar 2025 15:08:39 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] HID: Asus: add Z13 folio to generic group for
 multitouch to work
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250320220924.5023-1-lkml@antheas.dev>
 <20250320220924.5023-5-lkml@antheas.dev>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250320220924.5023-5-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/03/25 11:09, Antheas Kapenekakis wrote:
> The Asus Z13 folio has a multitouch touchpad that needs to bind
> to the hid-multitouch driver in order to work properly. So bind
> it to the HID_GROUP_GENERIC group to release the touchpad and
> move it to the bottom so that the comment applies to it.
> 
> While at it, change the generic KEYBOARD3 name to Z13_FOLIO.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/hid/hid-asus.c | 6 +++---
>   drivers/hid/hid-ids.h  | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index b61b53d5ef240..beb7df823b18e 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -1335,9 +1335,6 @@ static const struct hid_device_id asus_devices[] = {
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
>   	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> -	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> -	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD3),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
>   	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> @@ -1367,6 +1364,9 @@ static const struct hid_device_id asus_devices[] = {
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

Sorry, I got mixed up in Thunderbird since the V2 prefix is missing and 
was reviewing wrong series, I'll archive the last series to prevent 
confusing myself.

Reviewed-by: Luke D. Jones <luke@ljones.dev>


