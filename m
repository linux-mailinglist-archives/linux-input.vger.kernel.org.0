Return-Path: <linux-input+bounces-3936-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 773DF8D311B
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 10:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B038292E45
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 08:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD73016A36D;
	Wed, 29 May 2024 08:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DL4cJ1cC"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39849169AF2
	for <linux-input@vger.kernel.org>; Wed, 29 May 2024 08:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716970926; cv=none; b=QB1L0+XwgO0DFjwHFOdzGo0sqGH/0zbl2E104hZ2IEIILa8I4sehQx4HYNqOudhDhP2zvVHVamx+bk0LVVdHsoEwspP5IIk3ez2jQ8ptxAaj0j5debw5Zh/8lMRyhZ6tZmEHkqT2qXs+peEinkNWe00BCErYPPv31EeeRJogQC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716970926; c=relaxed/simple;
	bh=JvJ/znY5aAJUH6CBtu3z63ozlDO6l7q/FWJId5WW5u8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H6CMrfiCPotHxLcHsCjtOb+zdeHKWBfU/pDxqZJTHdsq8rS2nSIkWtwAmSPXfUPGTF5MjiETjirVW5zS+XQzJpaB5aXx/OC2vRO/325qnUwKukef1l0FkxAFUucpw6tkmNqLBYZOE+pxwNI4nW4AnRfgrRyiSVe34MFPl7pBgjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DL4cJ1cC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716970924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=saeEBWoWqmMbGp2rBntpWc8gNzVhRyq6SnG448wWm2U=;
	b=DL4cJ1cCNvtPZZmgP4V/C5SRFK9ggR2MF6YuAz0kkWUo+IMI9dVfLqkFBxqrbK25IFKEIR
	4S7ukPK/XQWACT3YTsQE9dAu+aIxo5xA5G9xebbQt5MGci7lUmMWZR33mA2mFP6yQUsjT6
	1gwuMcwoRDJcojQP4ZPpbwF7BT7DqHc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-a6r5NtO5N3a4lCoXoISZTw-1; Wed, 29 May 2024 04:22:00 -0400
X-MC-Unique: a6r5NtO5N3a4lCoXoISZTw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a629e32f5fdso98721666b.2
        for <linux-input@vger.kernel.org>; Wed, 29 May 2024 01:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716970919; x=1717575719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=saeEBWoWqmMbGp2rBntpWc8gNzVhRyq6SnG448wWm2U=;
        b=KrmtqBbJf8NNIy9ecAlTksP/Hj9Vv5JjGLrBrs30L20XpUuFwafEwjwrbPwGT5Jjtw
         rfokFGJHZq0PSVA8GabfdFI41v5GscS0DN1bbBldUt5prXkaxZ6eHpWVEXOLUWrSmMM5
         uygIi/REfhaehnfbBkysFoqgdYPJlD2d1eD8YJgPWoWyar9XC7WlipvEknXuDH64CXea
         ++B2eH+9XK5lGWd0jCr8InP7YmmJUpmomZ0fFskFE93AHPwJCjrC5b2cxKMrFsbxllIM
         eVEzR0yv2n6CaGo/nonulV0LhH2T4trNo7axLwMeshTKUj8K0SVXvlSk3itvvgeCc/Aw
         H/YQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb/qZQkE8G7hidsdBCUDu/DCEgjqp/Ga/ujbmP2Nk67DuxgnQtRpp5otSegFuUnpu5NrTpPgiaMnXOkRTqnFL1EhVzXdyN2yexpwE=
X-Gm-Message-State: AOJu0Yxii69z35sUMsofIDXrwOyH2v7rZ0kZ5cr3m8gFxPCkkSJw4iI/
	I+zbjnWmIOPyflvhHag9oZct1t8HQ15WCjG09Mh0cLUHuNwbAqSV+J8UbU+QOaH9ecAUKn/dzyj
	/+SWLL725q+kQBQhHsIx+UQc3SKBoqHssN9WUW/B5URBTZIzUn3o1dj1kU+n5
X-Received: by 2002:a17:906:63ca:b0:a59:a9c5:e73b with SMTP id a640c23a62f3a-a62647ce012mr862583266b.46.1716970919180;
        Wed, 29 May 2024 01:21:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWk3/1wjwfIXsCmZeoXQBLcPsIitG9Fxniw+cXvQl5pRhA/ibqHffOsf0ZrQrhKZTXW5UaYw==
X-Received: by 2002:a17:906:63ca:b0:a59:a9c5:e73b with SMTP id a640c23a62f3a-a62647ce012mr862581266b.46.1716970918430;
        Wed, 29 May 2024 01:21:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8a742sm686508566b.153.2024.05.29.01.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 01:21:57 -0700 (PDT)
Message-ID: <fc082b9e-b6f7-457c-b9e5-6797a0285bc3@redhat.com>
Date: Wed, 29 May 2024 10:21:56 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] hid-asus: use hid for brightness control on
 keyboard
To: "Luke D. Jones" <luke@ljones.dev>, jikos@kernel.org
Cc: ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, bentiss@kernel.org
References: <20240529012827.146005-1-luke@ljones.dev>
 <20240529012827.146005-2-luke@ljones.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240529012827.146005-2-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Luke,

Thank you for the new version, much better.

On 5/29/24 3:28 AM, Luke D. Jones wrote:
> On almost all ASUS ROG series laptops the MCU used for the USB keyboard
> also has a HID packet used for setting the brightness. This is usually
> the same as the WMI method. But in some laptops the WMI method either
> is missing or doesn't work, so we should default to the HID control.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  drivers/hid/hid-asus.c                     |  6 ++++
>  drivers/platform/x86/asus-wmi.c            | 35 +++++++++++++++++++++-
>  include/linux/platform_data/x86/asus-wmi.h | 10 +++++++
>  3 files changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 02de2bf4f790..4cba8e143031 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -492,12 +492,18 @@ static void asus_kbd_backlight_work(struct work_struct *work)
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
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && asus_use_hid_led()) {
> +		hid_info(hdev, "using HID for asus::kbd_backlight\n");
> +		return false;
> +	}
> +
>  	ret = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS,
>  				       ASUS_WMI_DEVID_KBD_BACKLIGHT, 0, &value);
>  	hid_dbg(hdev, "WMI backlight check: rc %d value %x", ret, value);
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 3f9b6285c9a6..54cb07c79fcf 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -144,6 +144,15 @@ module_param(fnlock_default, bool, 0444);
>  
>  static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
>  
> +static const char * const use_hid_led_matches[] = {
> +	"ROG Zephyrus",
> +	"ROG Strix",
> +	"ROG Flow",
> +	"GA403",
> +	"GU605",
> +	"RC71L",
> +};
> +
>  static int throttle_thermal_policy_write(struct asus_wmi *);
>  
>  static bool ashs_present(void)
> @@ -1642,6 +1651,29 @@ static int micmute_led_set(struct led_classdev *led_cdev,
>  	return err < 0 ? err : 0;
>  }
>  
> +bool asus_use_hid_led(void)
> +{
> +	const char *product, *board;
> +	int i;
> +
> +	product = dmi_get_system_info(DMI_PRODUCT_FAMILY);
> +	if (!product)
> +		return false;
> +
> +	board = dmi_get_system_info(DMI_BOARD_NAME);
> +	if (!board)
> +		return false;
> +
> +	for (i = 0; i < ARRAY_SIZE(use_hid_led_matches); i++) {
> +		if (strstr(product, use_hid_led_matches[i]))
> +			return true;
> +		if (strstr(board, use_hid_led_matches[i]))
> +			return true;
> +	}
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(asus_use_hid_led);
> +

With the new helper in this form you are pretty much re-inventing
dmi_check_system().

So IMHO you should just replace use_hid_led_matches[] with
a dmi_system_id array and simplify asus_use_hid_led() to just
a single "dmi_check_system(asus_use_hid_led_dmi_ids)" call.

Using dmi_system_id-s also allows you to specify if the string
which is being matched should be matched against DMI_PRODUCT_FAMILY
or DMI_BOARD_NAME. Note the normal DMI_MATCH() macro to fill in
dmi_system_id array entries does non exact matching using strstr()
just like you do above.

Note you need to terminate the dmi_system_id array with an empty
{} entry.



>  static void asus_wmi_led_exit(struct asus_wmi *asus)
>  {
>  	led_classdev_unregister(&asus->kbd_led);
> @@ -1681,7 +1713,8 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>  			goto error;
>  	}
>  
> -	if (!kbd_led_read(asus, &led_val, NULL)) {
> +	if (!kbd_led_read(asus, &led_val, NULL) && !asus_use_hid_led()) {
> +		pr_info("using asus-wmi for asus::kbd_backlight\n");
>  		asus->kbd_led_wk = led_val;
>  		asus->kbd_led.name = "asus::kbd_backlight";
>  		asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 3eb5cd6773ad..6833035f7006 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -160,4 +160,14 @@ static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>  }
>  #endif
>  
> +/* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
> +#if IS_ENABLED(CONFIG_ASUS_WMI)
> +bool asus_use_hid_led(void);
> +#else
> +static inline bool asus_use_hid_led(void)
> +{
> +	return true;
> +}
> +#endif
> +
>  #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */

Regards,

Hans



