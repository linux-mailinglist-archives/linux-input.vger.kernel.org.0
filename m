Return-Path: <linux-input+bounces-5343-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C369F947D9D
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 17:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79D01284CFA
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 15:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4016B15B0EB;
	Mon,  5 Aug 2024 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V1U2hr0t"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CACE15B0E4
	for <linux-input@vger.kernel.org>; Mon,  5 Aug 2024 15:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722870210; cv=none; b=eZ8LHaVYfeyBsPYrmWBFT/j0dNJBAZSkzPDj82khl1lhqQjD7x9XL9qAL+zgYp5fqPW5Q/2m3beWDoTiPYBgyeybHkxtG7PbTEC0k+mYpS/8h9c6ZApt5gEdWtXSptXAmJTBnX/nCrLpRRnfX0TBsoZPHI5U8GABox6QPrAGucs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722870210; c=relaxed/simple;
	bh=8NCvRCPszDP770NVWQjH0bVN8l1lKGt9mQp6iLY0crY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RGEV4qrBHsYuIHvfmK7kwS/oxYUjqRlS+QoReBDtYjnyCaUE1+h7hQm4UpkbnI1h7ygbv/j0joSfGpF6yw2JNzvyaquoQBJEDw5cOpfk3TMTvsiz6g1wWMxqslLpZHWW5zatSsYuvYWjRbdcCfbWMHvKvyuIUkKKlyJ/+1eERRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V1U2hr0t; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722870207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UFIfN5jKOq5ZhTYRJtUZ4L4CMUsrG3a4wMcH/m481CA=;
	b=V1U2hr0tPsHPCFHfqYWQGtavpI8AcumhMkM8zopcB8sEb0DVkYFac34lKXwHBQlcKjTW5F
	DNaFp97RYldPl4X24ls/pgnU9p7qhNsO5i+mGi6y0FTiMtgQFALJ7HDZ4OMRA399zEkbmb
	OlESfChC1ZMTjwQstVWDZuP0ac26aM0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-8Yoe7AEPP_eDxok9Q3ItZA-1; Mon, 05 Aug 2024 11:03:25 -0400
X-MC-Unique: 8Yoe7AEPP_eDxok9Q3ItZA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-57c93227bbeso9448608a12.3
        for <linux-input@vger.kernel.org>; Mon, 05 Aug 2024 08:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722870204; x=1723475004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UFIfN5jKOq5ZhTYRJtUZ4L4CMUsrG3a4wMcH/m481CA=;
        b=Dx0oCRGqX24Vp4LYya8x9B6IWjXxjcOrrSr9Zu6y6y+pdwZRkoJOECQU517KkU2eIa
         6W977WJ4u45KIAvEpakhyO1ziIyZ6LdSggLdtmYqjcgEU9b/iUeRycLxer/8ixSlDgr1
         vb8l5qQJaKcyE7zIJO2O2tJho6nL31ccdZJ3zbWZfrJfPuPvNu0ZljinjZPkaytkG1ol
         MjKfE3yCZR9SG7nrMOXUGrpYilPItX3qHMubighKDvtnNkrNj/f5LBujU2sdOGIIqhVv
         za1JBJHLWxtKTBATpBAcyp45FZRM+HNsau7P+5dqAxE7169DB0zGGd7PyCG7jFcEMlwW
         g/vw==
X-Forwarded-Encrypted: i=1; AJvYcCUfVkQ1trvVInVqnbfzrtaP7qmgupcEsGUS3vBNUQ9jS6VS17G8j69kXe15ejW8EWYZyq4552Z8PkV1lSnEfBGBLMkqYSFV0lxyrRM=
X-Gm-Message-State: AOJu0YwQdaFU4iLoVpAJ73iDJ92rll+LinoA8dZBo1VXPJ/PtrRuOZWx
	A0c6j0BSwmQvWoK2KYbPzzBAq0loBSNEd764Ley2Gpxp0P3C2KlI4d72TbuHNI2LsKxpYja/N02
	nbyoVH4iW4RKXvDDVspiMzjK3TYQ30zDQsZBS4byAXIij9AkPsxVasXbgASk6
X-Received: by 2002:a05:6402:1617:b0:5a1:6c50:a35 with SMTP id 4fb4d7f45d1cf-5b7f59e2356mr7216107a12.37.1722870203799;
        Mon, 05 Aug 2024 08:03:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGY4KvQ0+BJEnLI9rO5TIRdEj8vWqOtH9qDmkKXjoU3ZGyyFKD/pz1M9a/Cdq0PuEf2NFAzXg==
X-Received: by 2002:a05:6402:1617:b0:5a1:6c50:a35 with SMTP id 4fb4d7f45d1cf-5b7f59e2356mr7216079a12.37.1722870203228;
        Mon, 05 Aug 2024 08:03:23 -0700 (PDT)
Received: from [192.168.211.203] ([109.38.139.91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b83bf3b99dsm4986110a12.91.2024.08.05.08.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 08:03:22 -0700 (PDT)
Message-ID: <0fc180ae-a5df-4199-a428-b108bff0415b@redhat.com>
Date: Mon, 5 Aug 2024 17:03:21 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] hid-asus: use hid for brightness control on
 keyboard
To: "Luke D. Jones" <luke@ljones.dev>, platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org, jikos@kernel.org, bentiss@kernel.org,
 linux-input@vger.kernel.org
References: <20240713074733.77334-1-luke@ljones.dev>
 <20240713074733.77334-2-luke@ljones.dev>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240713074733.77334-2-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/13/24 9:47 AM, Luke D. Jones wrote:
> On almost all ASUS ROG series laptops the MCU used for the USB keyboard
> also has a HID packet used for setting the brightness. This is usually
> the same as the WMI method. But in some laptops the WMI method either
> is missing or doesn't work, so we should default to the HID control.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> ---
>  drivers/hid/hid-asus.c                     |  7 +++++
>  drivers/platform/x86/asus-wmi.c            |  3 +-
>  include/linux/platform_data/x86/asus-wmi.h | 36 ++++++++++++++++++++++
>  3 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 37e6d25593c2..af57a5f03193 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -492,12 +492,19 @@ static void asus_kbd_backlight_work(struct work_struct *work)
>   */
>  static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
>  {
> +	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
>  	u32 value;
>  	int ret;
>  
>  	if (!IS_ENABLED(CONFIG_ASUS_WMI))
>  		return false;
>  
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
> +			dmi_check_system(asus_use_hid_led_dmi_ids)) {
> +		hid_info(hdev, "using HID for asus::kbd_backlight\n");
> +		return false;
> +	}
> +
>  	ret = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS,
>  				       ASUS_WMI_DEVID_KBD_BACKLIGHT, 0, &value);
>  	hid_dbg(hdev, "WMI backlight check: rc %d value %x", ret, value);
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 3f9b6285c9a6..799d928c7d3d 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1681,7 +1681,8 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>  			goto error;
>  	}
>  
> -	if (!kbd_led_read(asus, &led_val, NULL)) {
> +	if (!kbd_led_read(asus, &led_val, NULL) && !dmi_check_system(asus_use_hid_led_dmi_ids)) {
> +		pr_info("using asus-wmi for asus::kbd_backlight\n");
>  		asus->kbd_led_wk = led_val;
>  		asus->kbd_led.name = "asus::kbd_backlight";
>  		asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 3eb5cd6773ad..74b32e1d6735 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -4,6 +4,7 @@
>  
>  #include <linux/errno.h>
>  #include <linux/types.h>
> +#include <linux/dmi.h>
>  
>  /* WMI Methods */
>  #define ASUS_WMI_METHODID_SPEC	        0x43455053 /* BIOS SPECification */
> @@ -160,4 +161,39 @@ static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>  }
>  #endif
>  
> +/* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
> +static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Zephyrus"),
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Strix"),
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Flow"),
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "GA403U"),
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "GU605M"),
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
> +		},
> +	},
> +	{ },
> +};
> +
>  #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */


