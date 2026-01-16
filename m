Return-Path: <linux-input+bounces-17152-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F76D387D9
	for <lists+linux-input@lfdr.de>; Fri, 16 Jan 2026 21:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B7C2301D9C4
	for <lists+linux-input@lfdr.de>; Fri, 16 Jan 2026 20:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48ACE2F3618;
	Fri, 16 Jan 2026 20:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hVBcTEWz"
X-Original-To: linux-input@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F912F12AF
	for <linux-input@vger.kernel.org>; Fri, 16 Jan 2026 20:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596280; cv=none; b=toqrx1nfMRBJaiO95mMI/l50ZHN6bNOd+7yL3AKbWUafI3JuTlJUMqQUaXovVEXgqMv26wrmw67D3ME+KwByWyDGJocXSTrj0akKNVZo3+JD9E6fTvvU3oB2MgxszaCqnXW1crLvLDputOMvNbBwDP6rYRN/3vzh68HYQWDZz1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596280; c=relaxed/simple;
	bh=M8LkTKRkLec0STYo/DU8PaDAmjRAFKXbQLuojTz1Dbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SP1+ooZyu796wvEbyT2tb0azO/uS9bsEC6aYmZ2UF1gWkACX5REW/4v57AZy5AO8ZKPHYQAD1E5tB0APHTGS3iKUh3u9IRbI7P84L1eiWoqOwUFrvfoTaBkwR12Z9+rIJoERu3dDl36I1tnjZZ2J2kmd3pNmpmK5BQgewwsiTYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hVBcTEWz; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <14407ba9-34f1-4114-bfb3-043b53ea7769@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768596265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n3lnLpdcVciN6Vt5b33M7WFN7rUWFTE1TjkraXuEkcY=;
	b=hVBcTEWzeHTrwRzKD7YupGRB/hb8c5YOVZpyWBQh6/R7wM69qT6uEQOprS4y7KE8BFUIR6
	Nv37zjvw+JtzhnjSB6YjNOwyAnJ4XcYUZEOHtIyyH2RNT/rWFgl4MRoN/w3oK7HlKvoy+T
	p8BrqrCom19l98LdCIZnZMQIjZB9NNI=
Date: Fri, 16 Jan 2026 21:44:21 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v11 02/11] HID: asus: initialize additional endpoints only
 for legacy devices
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20260116133150.5606-1-lkml@antheas.dev>
 <20260116133150.5606-3-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260116133150.5606-3-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/16/26 14:31, Antheas Kapenekakis wrote:

> Currently, ID1/ID2 initializations are performed for all NKEY devices.
> However, ID1 initializations are only required for RGB control and are
> only supported for RGB capable devices. ID2 initializations are only
> required for initializing the Anime display endpoint which is only
> supported on devices with an Anime display. Both of these
> initializations are out of scope for this driver (this is a brightness
> control and keyboard shortcut driver) and they should not be performed
> for devices that do not support them in any case.
>
> At the same time, there are older NKEY devices that have only been
> tested with these initializations in the kernel and it is not possible
> to recheck them. There is a possibility that especially with the ID1
> initialization, certain laptop models might have their shortcuts stop
> working (currently unproven).
>
> For an abundance of caution, only initialize ID1/ID2 for those older
> NKEY devices by introducing a quirk for them and replacing the NKEY
> quirk in the block that performs the inits with that.
>
> In addition, as these initializations might not be supported by the
> affected devices, change the function to not bail if they fail.
>
> Acked-by: Benjamin Tissoires <bentiss@kernel.org>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 323e6302bac5..dc7af12cf31a 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -90,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
>  #define QUIRK_ROG_ALLY_XPAD		BIT(13)
> +#define QUIRK_ROG_NKEY_LEGACY		BIT(14)
These past days I have taken a look at new 2025 models and they do make use of ID2,
and won't do harm sending ID1 either. I think you can safely remove the if and send regardless.

At least 2023 models like mine that don't support ID2 will simply reply with 0xFF 0xFF and the rest 0x00.
No consequences.

Regardless the name is wrong: mine is a 2023 rog strix with
ID 0b05:19b6ASUSTek Computer, Inc. N-KEY Device
and surely isn't legacy.
>  
>  #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>  						 QUIRK_NO_INIT_REPORTS | \
> @@ -652,14 +653,9 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>  	if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>  		return -ENODEV;
>  
> -	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> -		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> -		if (ret < 0)
> -			return ret;
> -
> -		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> -		if (ret < 0)
> -			return ret;
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
> +		asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> +		asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
>  	}
>  
>  	if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> @@ -1376,10 +1372,10 @@ static const struct hid_device_id asus_devices[] = {
>  	  QUIRK_USE_KBD_BACKLIGHT },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>  	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>  	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>  	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
>  	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },

