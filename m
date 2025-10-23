Return-Path: <linux-input+bounces-15678-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C39FC02C13
	for <lists+linux-input@lfdr.de>; Thu, 23 Oct 2025 19:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 840683A9C83
	for <lists+linux-input@lfdr.de>; Thu, 23 Oct 2025 17:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC52F34AAF2;
	Thu, 23 Oct 2025 17:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbjnHl2s"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D3A34A78F
	for <linux-input@vger.kernel.org>; Thu, 23 Oct 2025 17:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761241087; cv=none; b=hmYQDr9UaCtKThIU2i+vjWbtJwXU6hlGNcd5AW6GEZKG3l3r9fNSYFwdle07snF9oKUno/tcapYHVnQ4zcJGg4/xdI0mYENsNqkVYEqdYm/+Abth0MRDKfAqM5zIqWXa3RH4Omij8SFUq1KqY9HZkd9R6xqN2HFiQgnMeN/64uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761241087; c=relaxed/simple;
	bh=BNNNL0U4CXHmVf8J+8U3usUvmw4+zKRg8nKhDhzE3UQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i+lDjxt+xZTnNduzLGpuVESAUExecltObjXmm90PBIa9Yw9UFWggYsfGXAB6ZXZQYEnxYxiM5WrUsTuxh+XT851dDcdS4YNKBnOPCuT4c3U43IK3C76jMELYPC2skc3S1dFKVttzrFlUZd74ZOzuBWCB1I2QRT7BPs/xRogQylg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbjnHl2s; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4270a3464bcso839558f8f.2
        for <linux-input@vger.kernel.org>; Thu, 23 Oct 2025 10:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761241084; x=1761845884; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E5XlDFAkiYVtnBxHoKUh/W6R9tGtiXbQgReXGUVhCqY=;
        b=CbjnHl2s8AoIkeaLfyYnsJ+UFJnh94VbdeDH3zfz877zvIQ8fqhgb8QiZwkY3IAjSA
         Xq6G4shzoJqfjja3dwRkmPyb67bixeF15bEUv1ip7nay2BiLjqbY9w8v5dEZf9c8XHTO
         RpF4iTwzZpd3IaJZc7w7UkqzP1c0ch0f3bfYheOrmiAS7lOWO54XYLc6KivsOS5hVOG7
         QLUH/58EibGbTZihsJZRz7gPS2EETAS1U2+vSa9LmS8Am6r2gyJnJ9wrtPTZXG5dqOmf
         LJZcud8tkALkiLHXH/xx4AkdR2fYAd1TF7RPpL2zuJB6T+rrwK1QOhx6up0uOnEq2o4X
         4u0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761241084; x=1761845884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E5XlDFAkiYVtnBxHoKUh/W6R9tGtiXbQgReXGUVhCqY=;
        b=P03Ko/FmqBQJUd/c763B4zYE7xxQohtaf4PkJhiUVZ4yZclLORRagVJJVvYSN6reaD
         mnb6GBOX2Izc+/N/sWaW0xtJzEEJ0PfPm96CAbdZYwGi90o+coszdXSQhE+YCCpwaSlh
         EGsiCd01uWMA1eDCo3fnu1UBHBi/vcej4FgO9XrjHjfnJD45gm0AGETCWNWyJQW3FK+K
         whg3gfmM6XTq25RRI0xSiJxV5G/sEf4hdP44USXoQtcOlM0ZTfs6mSrvYlJZwvhpIGgg
         1uA1tW0lZT1dovtGJN2RmHyc7NBLieklIJ8WvRPaLnMYzJeIcY0LinQUAMRd2JGZbp7g
         j2Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUF632S/VYGgHkNs66wgBNMerRdDAo5U9yqzQTdE8lmh6ER81WFi9vbO+m/6FCAefqiHOu9ZZgcD/I0cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLbYypx5c5Eiz2sbTJ1DgDOHkWqzO2x7N++DZ2dZzE+MQU8by+
	c2ufGOmSuSOkcUrj2mj/fk+ovKi3a7KgIffiEpiLobpFeLOIjnabowN7
X-Gm-Gg: ASbGncv7NU98XorYpjAOfkUnJcbiOOcU3VrNZ0HkMa7hhPHNSWdOFVSmOEqxEBYdGu2
	uvrTWItuMcoDzXrKQXSa63Km7uCM53AcOX4gnc3R8RI/cxVMYm5qP7FFtdw8Eq0pfYvOTlzVHHx
	sQ+Iux/+r1ULqP2Y8rqHK5MfyqUJHm0qPyMSmqqI02zDhC4IIv2WL4oPmPphnVEfqtvZBd7+euS
	L4uVVjdPAbITah0yujqbN6lOLEAkdzQ/ekeDNTSgIiizePDVgd0lrUHxuKQNrLvxTXJlhvyF063
	ksQedrPvtZ0ceH6L8ZbUjuLZuK3yNkL9eZmkbHRzqfkx1BQ+FQaZg7n3yxVIdYHJCJx3EFOypoj
	j0i9xzXLVBkwFKnfLQc2ajJWY95VrHWfv3tBZW1Bpg2I2jTLrHqWkQ0NDYFK7QyXUxLZUpBfwE4
	lS3vQGCS3pCpw=
X-Google-Smtp-Source: AGHT+IG+NH18Fs8uvS4RwrnDeJ30YZ6KZ5D+dKbYWVTcWqduSR8Cv5M98c/yhLru7M3K4wShHifeVA==
X-Received: by 2002:a05:6000:3113:b0:427:7d6:ce80 with SMTP id ffacd0b85a97d-42707d6d1c8mr16071326f8f.29.1761241083938;
        Thu, 23 Oct 2025 10:38:03 -0700 (PDT)
Received: from [192.168.1.121] ([151.49.75.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e7630sm5075802f8f.10.2025.10.23.10.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 10:38:03 -0700 (PDT)
Message-ID: <e6328da3-8099-4540-9cb0-4fc28b359ee7@gmail.com>
Date: Thu, 23 Oct 2025 19:38:02 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] HID: asus: simplify RGB init sequence
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251018101759.4089-1-lkml@antheas.dev>
 <20251018101759.4089-2-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251018101759.4089-2-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/18/25 12:17, Antheas Kapenekakis wrote:
> Currently, RGB initialization forks depending on whether a device is
> NKEY. Then, NKEY devices are initialized using 0x5a, 0x5d, 0x5e
> endpoints, and non-NKEY devices with 0x5a and then a
> backlight check, which is omitted for NKEY devices.
>
> Remove the fork, using a common initialization sequence for both,
> where they are both only initialized with 0x5a, then checked for
> backlight support. This patch should not affect existing functionality.
>
> 0x5d and 0x5e endpoint initializations are performed by Windows
> userspace programs associated with different usages that reside under
> the vendor HID. Specifically, 0x5d is used by Armoury Crate, which
> controls RGB and 0x5e by an animation program for certain Asus laptops.
> Neither is used currently in the driver.
What benefits do we get from removing the unused initialization?

If this has never caused any troubles I don't see the reason for removing
them. Moreover the lighting protocol is known and I might as well add
support for it in the near future,
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 56 ++++++++++++++----------------------------
>  1 file changed, 19 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index a444d41e53b6..7ea1037c3979 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -638,50 +638,32 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>  	unsigned char kbd_func;
>  	int ret;
>  
> -	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> -		/* Initialize keyboard */
> -		ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> -		if (ret < 0)
> -			return ret;
> -
> -		/* The LED endpoint is initialised in two HID */
> -		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> -		if (ret < 0)
> -			return ret;
> -
> -		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> -		if (ret < 0)
> -			return ret;
> -
> -		if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> -			ret = asus_kbd_disable_oobe(hdev);
> -			if (ret < 0)
> -				return ret;
> -		}
> -
> -		if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> -			intf = to_usb_interface(hdev->dev.parent);
> -			udev = interface_to_usbdev(intf);
> -			validate_mcu_fw_version(hdev,
> -				le16_to_cpu(udev->descriptor.idProduct));
> -		}
> +	ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> +	if (ret < 0)
> +		return ret;
>  
> -	} else {
> -		/* Initialize keyboard */
> -		ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> -		if (ret < 0)
> -			return ret;
> +	/* Get keyboard functions */
> +	ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> +	if (ret < 0)
> +		return ret;
>  
> -		/* Get keyboard functions */
> -		ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> +	if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> +		ret = asus_kbd_disable_oobe(hdev);
>  		if (ret < 0)
>  			return ret;
> +	}
>  
> -		/* Check for backlight support */
> -		if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> -			return -ENODEV;
> +	if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> +		intf = to_usb_interface(hdev->dev.parent);
> +		udev = interface_to_usbdev(intf);
> +		validate_mcu_fw_version(
> +			hdev, le16_to_cpu(udev->descriptor.idProduct));
>  	}
>  
> +	/* Check for backlight support */
> +	if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> +		return -ENODEV;
> +
>  	drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
>  					      sizeof(struct asus_kbd_leds),
>  					      GFP_KERNEL);

