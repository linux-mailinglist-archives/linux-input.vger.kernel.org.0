Return-Path: <linux-input+bounces-15935-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA12C412DE
	for <lists+linux-input@lfdr.de>; Fri, 07 Nov 2025 18:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A2215347383
	for <lists+linux-input@lfdr.de>; Fri,  7 Nov 2025 17:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D153E329396;
	Fri,  7 Nov 2025 17:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="OnjRd5bi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E9C2EBDF0;
	Fri,  7 Nov 2025 17:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762538244; cv=none; b=AxaHar7pXLqxTx0PYulNUnYfE9VnSZd8kZeAQqREAYAQmkdWXFyJAsFRpWqfqJ2Brvr2AwMhqE+bz2VkIwiitA7ExUF/gd6v01d7/dfGxxwO3KIxYV1TxucrLM7h20rnlO4XrORv+/XB0mHVn8ZxZ5Xb9bivSYU+Qcsz7e1044U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762538244; c=relaxed/simple;
	bh=L/Eyn9JQ5eN2sTtPM3wIHo23CWqaAEii6vrSwTs3+/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LgkmJ8uegNct9yRh14bVm35SrV901qK9w3K/aUaAmztgp8tdGZEDAHaxUXLe2u3RBeY/w0Dz4DTr7+4oFLr9ANHBbLwiloo4e6sAJLoWN3Z6zSHo4Wwg+mM+tMkPO9HLvjwpooFasfiOg2TzcvLQNXF0EWmHSQKNqDC2gfKtpbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=OnjRd5bi; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (p50878061.dip0.t-ipconnect.de [80.135.128.97])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 1190E2FC0057;
	Fri,  7 Nov 2025 18:57:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1762538233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xmj221kTYd7HSOB3agFGY3mXgujovHEBeY4c+UHaR6E=;
	b=OnjRd5bixawTsEiAgPLr04Alk+TgddL+JyxoQvjAUv7UW2OiIm46iDAAhZqDufCRh4+zX7
	KlLmN3NDQEiwQ8L/nG9P6SLk79b9mVADzlPIG+cYF6jHfGc9SXsXXYiHEjiQtzca1bJF2Z
	mxXIhafP8QJO2d/Q2otN58L2Ge7eMrg=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <b0cd79db-16dc-448b-9426-0cf4566be70c@tuxedocomputers.com>
Date: Fri, 7 Nov 2025 18:57:12 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hid/hid-multitouch: Keep latency normal on deactivate
 for reactivation gesture
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251106200752.1523111-1-wse@tuxedocomputers.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20251106200752.1523111-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 06.11.25 um 20:59 schrieb Werner Sembach:
> Uniwill devices have a built in gesture in the touchpad to de- and
> reactivate it by double taping the upper left corner. This gesture stops
> working when latency is set to high, so this patch keeps the latency on
> normal.
Just a heads up: For some reason this patch breaks the touchpad on Intel 
devices. I will look into it on monday.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: stable@vger.kernel.org
> ---
> V1->V2: Use a quirk to narrow down the devices this is applied to.
>
> I have three Uniwill devices at hand right now that have at least two
> physically different touchpads, but same Vendor + Product ID combination.
> Maybe the vendor uses this product ID for all i2c connected touchpads, or
> it is used as some kind of subvendor ID to indicate Uniwill?
>
> To be able to really narrow it down to Uniwill only devices I would need to
> check DMI strings, but then I will probably narrow it down to much as I
> only know what we at TUXEDO use there.
>
>   drivers/hid/hid-multitouch.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 179dc316b4b51..470f199148057 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -76,6 +76,7 @@ MODULE_LICENSE("GPL");
>   #define MT_QUIRK_DISABLE_WAKEUP		BIT(21)
>   #define MT_QUIRK_ORIENTATION_INVERT	BIT(22)
>   #define MT_QUIRK_APPLE_TOUCHBAR		BIT(23)
> +#define MT_QUIRK_KEEP_LATENCY_ON_CLOSE	BIT(24)
>   
>   #define MT_INPUTMODE_TOUCHSCREEN	0x02
>   #define MT_INPUTMODE_TOUCHPAD		0x03
> @@ -229,6 +230,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
>   #define MT_CLS_RAZER_BLADE_STEALTH		0x0112
>   #define MT_CLS_SMART_TECH			0x0113
>   #define MT_CLS_APPLE_TOUCHBAR			0x0114
> +#define MT_CLS_UNIWILL_TOUCHPAD			0x0115
>   #define MT_CLS_SIS				0x0457
>   
>   #define MT_DEFAULT_MAXCONTACT	10
> @@ -420,6 +422,9 @@ static const struct mt_class mt_classes[] = {
>   			MT_QUIRK_APPLE_TOUCHBAR,
>   		.maxcontacts = 11,
>   	},
> +	{ .name = MT_CLS_UNIWILL_TOUCHPAD,
> +		.quirks = MT_QUIRK_KEEP_LATENCY_ON_CLOSE,
> +	},
>   	{ .name = MT_CLS_SIS,
>   		.quirks = MT_QUIRK_NOT_SEEN_MEANS_UP |
>   			MT_QUIRK_ALWAYS_VALID |
> @@ -1998,7 +2003,12 @@ static void mt_on_hid_hw_open(struct hid_device *hdev)
>   
>   static void mt_on_hid_hw_close(struct hid_device *hdev)
>   {
> -	mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_NONE);
> +	struct mt_device *td = hid_get_drvdata(hdev);
> +
> +	if (td->mtclass.quirks & MT_QUIRK_KEEP_LATENCY_ON_CLOSE)
> +		mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_NONE);
> +	else
> +		mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_NONE);
>   }
>   
>   /*
> @@ -2375,6 +2385,11 @@ static const struct hid_device_id mt_devices[] = {
>   		MT_USB_DEVICE(USB_VENDOR_ID_UNITEC,
>   			USB_DEVICE_ID_UNITEC_USB_TOUCH_0A19) },
>   
> +	/* Uniwill touchpads */
> +	{ .driver_data = MT_CLS_UNIWILL_TOUCHPAD,
> +		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
> +			   USB_VENDOR_ID_PIXART, 0x0255) },
> +
>   	/* VTL panels */
>   	{ .driver_data = MT_CLS_VTL,
>   		MT_USB_DEVICE(USB_VENDOR_ID_VTL,

