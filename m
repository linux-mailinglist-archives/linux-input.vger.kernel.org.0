Return-Path: <linux-input+bounces-11224-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CEAA701DD
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 14:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BABB017C257
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 13:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513552676E3;
	Tue, 25 Mar 2025 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1+v2VVw"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291AD2676DE;
	Tue, 25 Mar 2025 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742908385; cv=none; b=cpuZa/lEOgLoBx8HaQ6Knk5sdCOBe35VtP/5CZO53a+Uz2lPnx4H40aD1cE1BukcC7FTshlYULkU3GYy09t3n4dYBv9jZrI7jPhCOCpm0NX2I59jOq0b2DqpcZusu5OpopSDyyxy7TFBePcrKwQRzFJTsG8cbc7RJeTgDFA9t3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742908385; c=relaxed/simple;
	bh=LbCFI+SPyht74Ijlp27Gug9FjyQ0K7+yJfydNyjPGuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3LYpI8EKZJ7GDOfAaTAy5pg42xdkXnViY9zMR1hK7ZQv1HptK88zeh9KyYcVUpTt+yRwssgEy9KAiSMC1Oc61SDxpptMmiY7+2qQT3P3ybn0xDHVb4jZ+fd003cU///Vl6sKvYgQUQnBnOM6TzHfL4Hy/XNtD/E04qrbF46OHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1+v2VVw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B2DC4CEE4;
	Tue, 25 Mar 2025 13:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742908385;
	bh=LbCFI+SPyht74Ijlp27Gug9FjyQ0K7+yJfydNyjPGuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m1+v2VVwos/7AysiAFKWLbWz2klba90oMRBVsfbFWR4WBnuG8kNIsfHym941rtK8v
	 oLLbTaXcO9FRT/gAOCaBEz/kxxSB6PXW6TPTCvdYSKnNKNU642FO6viK1oU8mx1qwb
	 9pChwvI4Rk/ENVcr/TcNj2kLFWtpKGD62F+Yw5+nvUDuRMDQvcsYnPSMtw/QdxzE8c
	 eItk9VXmKUdRgEYsIlsazmsfbIsBAXyTnwIz3LR18qD6xwlU5xWoV7VnPTI43Vplrj
	 E/aaJ1HfjjpOVyob7L8/Y9ko8EVcGzdKPC/GqSc7tC2NZ5F0oyaeYdJTs5rIWTCb/Y
	 Ic3IhkPma86yA==
Date: Tue, 25 Mar 2025 14:13:00 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
Cc: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Kerem Karabay <kekrby@gmail.com>, 
	Orlando Chamberlain <orlandoch.dev@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH RESEND 5/5] HID: multitouch: add device ID for Apple
 Touch Bar
Message-ID: <vx6hvspvlfsv3palzvjpvsrmkl6s7qut366bhxq3tcwvyf7z63@drzftehh2rew>
References: <ECE4880B-2A87-4147-B83B-2D832639F3B2@live.com>
 <90644A22-3136-4D4E-864E-7F7210D0C713@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90644A22-3136-4D4E-864E-7F7210D0C713@live.com>

On Mar 10 2025, Aditya Garg wrote:
> From: Kerem Karabay <kekrby@gmail.com>
> 
> This patch adds the device ID of Apple Touch Bar found on x86 MacBook Pros
> to the hid-multitouch driver.
> 
> Note that this is device ID is for T2 Macs. Testing on T1 Macs would be
> appreciated.
> 
> Signed-off-by: Kerem Karabay <kekrby@gmail.com>
> Co-developed-by: Aditya Garg <gargaditya08@live.com>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>  drivers/hid/Kconfig          |  1 +
>  drivers/hid/hid-multitouch.c | 25 +++++++++++++++++++++----
>  2 files changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index dfc245867..727a2ed0d 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -743,6 +743,7 @@ config HID_MULTITOUCH
>  	  Say Y here if you have one of the following devices:
>  	  - 3M PCT touch screens
>  	  - ActionStar dual touch panels
> +	  - Apple Touch Bar on x86 MacBook Pros
>  	  - Atmel panels
>  	  - Cando dual touch panels
>  	  - Chunghwa panels
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 66e33a482..078ceef62 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -221,6 +221,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
>  #define MT_CLS_GOOGLE				0x0111
>  #define MT_CLS_RAZER_BLADE_STEALTH		0x0112
>  #define MT_CLS_SMART_TECH			0x0113
> +#define MT_CLS_APPLE_TOUCHBAR			0x0114
>  #define MT_CLS_SIS				0x0457
>  
>  #define MT_DEFAULT_MAXCONTACT	10
> @@ -406,6 +407,12 @@ static const struct mt_class mt_classes[] = {
>  			MT_QUIRK_CONTACT_CNT_ACCURATE |
>  			MT_QUIRK_SEPARATE_APP_REPORT,
>  	},
> +	{ .name = MT_CLS_APPLE_TOUCHBAR,
> +		.quirks = MT_QUIRK_HOVERING |
> +			MT_QUIRK_SLOT_IS_CONTACTID_MINUS_ONE |
> +			MT_QUIRK_APPLE_TOUCHBAR,
> +		.maxcontacts = 11,
> +	},
>  	{ .name = MT_CLS_SIS,
>  		.quirks = MT_QUIRK_NOT_SEEN_MEANS_UP |
>  			MT_QUIRK_ALWAYS_VALID |
> @@ -1807,6 +1814,15 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  		}
>  	}
>  
> +	ret = hid_parse(hdev);
> +	if (ret != 0)
> +		return ret;
> +
> +	if (mtclass->name == MT_CLS_APPLE_TOUCHBAR &&
> +	    !hid_find_field(hdev, HID_INPUT_REPORT,
> +			    HID_DG_TOUCHPAD, HID_DG_TRANSDUCER_INDEX))
> +		return -ENODEV;
> +

That hunk and the one below make me very nervous. Is there any reason
preventing you to keep hid_parse() at the same place?

The rest of the series looks fine as everything seems properly guarded
by MT_CLS_APPLE_TOUCHBAR.

Cheers,
Benjamin

>  	td = devm_kzalloc(&hdev->dev, sizeof(struct mt_device), GFP_KERNEL);
>  	if (!td) {
>  		dev_err(&hdev->dev, "cannot allocate multitouch data\n");
> @@ -1854,10 +1870,6 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  
>  	timer_setup(&td->release_timer, mt_expired_timeout, 0);
>  
> -	ret = hid_parse(hdev);
> -	if (ret != 0)
> -		return ret;
> -
>  	if (mtclass->quirks & MT_QUIRK_FIX_CONST_CONTACT_ID)
>  		mt_fix_const_fields(hdev, HID_DG_CONTACTID);
>  
> @@ -2339,6 +2351,11 @@ static const struct hid_device_id mt_devices[] = {
>  		MT_USB_DEVICE(USB_VENDOR_ID_XIROKU,
>  			USB_DEVICE_ID_XIROKU_CSR2) },
>  
> +	/* Apple Touch Bar */
> +	{ .driver_data = MT_CLS_APPLE_TOUCHBAR,
> +		HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
> +			USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY) },
> +
>  	/* Google MT devices */
>  	{ .driver_data = MT_CLS_GOOGLE,
>  		HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_GOOGLE,
> -- 
> 2.43.0
> 

