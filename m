Return-Path: <linux-input+bounces-15680-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B62CC02E7B
	for <lists+linux-input@lfdr.de>; Thu, 23 Oct 2025 20:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6F703AE313
	for <lists+linux-input@lfdr.de>; Thu, 23 Oct 2025 18:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7782777FC;
	Thu, 23 Oct 2025 18:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtrM9pMu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B222425782D
	for <linux-input@vger.kernel.org>; Thu, 23 Oct 2025 18:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761243811; cv=none; b=W5j5tbupEcWox4xjktaAsqL8BLstsAj+RbaxiQ8jt5yC0I5Cz0Ug44YLHm6HQ8KOiGMPsCcgaoeGu6YAi+5/eU0UcWZgvj+zrCLtALEgxHDSsAGQ7cQDx2h5pG+tx4VcaP68O5ZtGSP5CwE6i4cCQFmJSjqbFdKxhK7T/4yuo8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761243811; c=relaxed/simple;
	bh=mf1LQh7ouiwPaJE2sZ45By6xciJ0dNZeGEtPZDKnwkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SCQHImn7R3SFvP0fsRNtfl/vStiY+DtHwMyEmApvsMBOgnQHjo/gBEhiXyftduaIgR7Nf4nyTLwk6I/Gw8zvq9f0cp3vTyX6qy5/3cqXiGaUET/xMkOxNggkZ9Fv6gBpJ8YAuq6z/QJOnW0UmBsB4jq20vCY/pTmooihmjeS+kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtrM9pMu; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47103b6058fso8572875e9.1
        for <linux-input@vger.kernel.org>; Thu, 23 Oct 2025 11:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761243807; x=1761848607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/mzxglGhgwN7XjEzEvKWOF5ciu2kQBemisXVTIYesc=;
        b=VtrM9pMuskCbwBAevr9fc/G7+F6fBJZfPQZD3Q/21sw0Uf6cKdIGihjhJya+P7hXY3
         1T3wLdJ5RAJ4VHClZ2LZaCD340S9DCdlkfKDLEFIPc8FBgL2LWofEZtdcPhgSj2XdYSt
         S0kgHtpDIS+IWO4hhOq7Yt0SnRK2UjhNuumQCIuhGbCR3h4LLTrhJkQfPShoVkvsp4gu
         Y9HXVwBXUlT8VM2WNyUAXTOH4Kf6kcj2Fny5++gUZyx/AVH8KSmaYor1sjcsfiCtSxei
         wxNXUDt7sNu60WeMhjhz/UK/WuksHcrZjjV9NKjJqJp6hqmfNaYD/YcTierKYiZf9EyT
         Vntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761243807; x=1761848607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/mzxglGhgwN7XjEzEvKWOF5ciu2kQBemisXVTIYesc=;
        b=LpSk/Qa0t1Xe01mTC8iXrho3Z/WK/FaORpGGQYAM6PIyTzdYVpChbTKxprbAZG0Nk3
         l4zaf32HlVFIrurslertk/DURPhOkO/5ijIWlz9n/cSdwSCxB+jGkTQ4Isp6Y0USbA40
         2NLhEJwRmCRU9jc/hl6kJaEsWAVqe0UoPobLpAqvuyLJWiO6VaqUYJVvzZCEVGp1leVg
         J9TBG/zPs0A8zN6z+HlDm4L/+zkUaIM/24ym+XlKB1x29v7jPaZpVKat27r4LO7brkqP
         zUBuFAFhJOKI/UoNDir3SMDj617zux2/RiApB+4nOR5YDlft8+pL2OOkERM+6yF4ZDJQ
         +3Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVaFRg+kycPiC8ji/Mm7L0hM5DvBywoMqZABSXk417woySn9H4/KXBAgQgFLc04QD3fduc3o/WUIV5tcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAcLxLOKUBUpE418OH2IfuuvggV8EJOaw0/SAonlwQKcU0cp8i
	Y47upAYNbWmrrHv1uuKQrqaPcXG4u3NwqZ4Zbkme4YU5rUGdQPzr4Jx5
X-Gm-Gg: ASbGncvnIzJae7SNz7BVPXzxrExLrn5J24AzE+rVeSSNGCTkHcmGFgVdNuK+T7d2F4d
	2qDA7CfUKWxg9Vc+AMIeo8RDzyTbaaglplUB6/Lhm0L5a48uBu3OJ2elfO2QrM6yO8EuC2NzKdp
	qr2HWGHZeA8ITxXiXIjn0zlQkKqZmD1nwzD0kImps7PepO6MEgJ5bYlr2hYFJlVUXpEZ2efrPde
	qtUfJt4TyTzc5MLNaOUDbxlDTTLEMysCMMT6fXbYES061r0w9PS6fI8wz4ANSAKE3/pcF/KmTvk
	xQguBvvXmGKmc4B7qZLUJYVrZtWXZxq0ymYWtWoz+Hb+UiiUZXLpEwStL7jPELquc7YUta0FA5q
	Azmf0AsU0Z0/aFOWNX0nbSjPPc5Xbw1cySxsjEjLiFz2L/GLR3xzqu4AahVNf18sDV21R6G48xO
	tS7XAlghHygr/TEA+kkniNNw==
X-Google-Smtp-Source: AGHT+IHQwmwFvaNe5JBDv0W3vPG6Nj+7QvXR/M86n/O9p3aQHOz7ugIePPe6RhVUkuxoFYu5OG17EQ==
X-Received: by 2002:a05:600c:3e8c:b0:46f:a8fd:c0dc with SMTP id 5b1f17b1804b1-475c3f96944mr72318045e9.3.1761243806792;
        Thu, 23 Oct 2025 11:23:26 -0700 (PDT)
Received: from [192.168.1.121] ([151.49.75.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4342946sm109377795e9.10.2025.10.23.11.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 11:23:26 -0700 (PDT)
Message-ID: <f1d2dece-6e51-4092-9f2e-58dc93508a25@gmail.com>
Date: Thu, 23 Oct 2025 20:23:25 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/9] HID: asus: prevent binding to all HID devices on
 ROG
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251018101759.4089-1-lkml@antheas.dev>
 <20251018101759.4089-5-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251018101759.4089-5-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/18/25 12:17, Antheas Kapenekakis wrote:
> Currently, when hid-asus is not loaded, NKEY keyboards load as ~6
> event devices with a pretty ASUSTEK name. When it loads, it concatenates
> all applications per HID endpoint, renames them, and prints errors
> when some of them do not have an input device.
>
> Therefore, change probe so that this is no longer the case. Stop
> renaming the devices, omit the check for .input which causes errors on
the devices -> devices
> e.g., the Z13 for some hiddev only devices, and add
> HID_QUIRK_INPUT_PER_APP so that each application gets its own event.

event -> event device (or evdev?)

It is not clear from the message what HID_QUIRK_INPUT_PER_APP has to do with
renaming the devices/having one evdev vs multiple: please make
it explicit in the commit message (and perhaps make explicit if (and how),
in case it could make any difference, how programs might change
theirs behavior as a consequence).

I like the fact that userspace only sees one keyboard for what is,
effectively, one keyboard device.

The code looks good to me: make the commit message more
explanatory and I'll include my reviewed-by.

Thanks,
Denis

> When this is done, the probes are called multiple times. Due to this,
> the rgb check needs to be moved into probe, and the report fixup should
> be skipped for non-vendor endpoints (prevents multiple prints).
>
> Reviewed-by: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 59 +++++++++++++++++++++++++++---------------
>  1 file changed, 38 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 03f0d86936fc..bbbac98f76c6 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -47,6 +47,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define T100CHI_MOUSE_REPORT_ID 0x06
>  #define FEATURE_REPORT_ID 0x0d
>  #define INPUT_REPORT_ID 0x5d
> +#define HID_USAGE_PAGE_VENDOR 0xff310000
>  #define FEATURE_KBD_REPORT_ID 0x5a
>  #define FEATURE_KBD_REPORT_SIZE 64
>  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
> @@ -89,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
>  #define QUIRK_ROG_ALLY_XPAD		BIT(13)
> +#define QUIRK_SKIP_REPORT_FIXUP		BIT(14)
>  
>  #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>  						 QUIRK_NO_INIT_REPORTS | \
> @@ -125,7 +127,6 @@ struct asus_drvdata {
>  	struct input_dev *tp_kbd_input;
>  	struct asus_kbd_leds *kbd_backlight;
>  	const struct asus_touchpad_info *tp;
> -	bool enable_backlight;
>  	struct power_supply *battery;
>  	struct power_supply_desc battery_desc;
>  	int battery_capacity;
> @@ -316,7 +317,7 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
>  static int asus_event(struct hid_device *hdev, struct hid_field *field,
>  		      struct hid_usage *usage, __s32 value)
>  {
> -	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
> +	if ((usage->hid & HID_USAGE_PAGE) == HID_USAGE_PAGE_VENDOR &&
>  	    (usage->hid & HID_USAGE) != 0x00 &&
>  	    (usage->hid & HID_USAGE) != 0xff && !usage->type) {
>  		hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
> @@ -931,11 +932,6 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
>  
>  	drvdata->input = input;
>  
> -	if (drvdata->enable_backlight &&
> -	    !asus_kbd_wmi_led_control_present(hdev) &&
> -	    asus_kbd_register_leds(hdev))
> -		hid_warn(hdev, "Failed to initialize backlight.\n");
> -
>  	return 0;
>  }
>  
> @@ -1008,15 +1004,6 @@ static int asus_input_mapping(struct hid_device *hdev,
>  			return -1;
>  		}
>  
> -		/*
> -		 * Check and enable backlight only on devices with UsagePage ==
> -		 * 0xff31 to avoid initializing the keyboard firmware multiple
> -		 * times on devices with multiple HID descriptors but same
> -		 * PID/VID.
> -		 */
> -		if (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT)
> -			drvdata->enable_backlight = true;
> -
>  		set_bit(EV_REP, hi->input->evbit);
>  		return 1;
>  	}
> @@ -1133,8 +1120,10 @@ static int __maybe_unused asus_reset_resume(struct hid_device *hdev)
>  
>  static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  {
> -	int ret;
> +	struct hid_report_enum *rep_enum;
>  	struct asus_drvdata *drvdata;
> +	struct hid_report *rep;
> +	int ret, is_vendor = 0;
>  
>  	drvdata = devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL);
>  	if (drvdata == NULL) {
> @@ -1218,18 +1207,42 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  		return ret;
>  	}
>  
> +	/* Check for vendor for RGB init and handle generic devices properly. */
> +	rep_enum = &hdev->report_enum[HID_INPUT_REPORT];
> +	list_for_each_entry(rep, &rep_enum->report_list, list) {
> +		if ((rep->application & HID_USAGE_PAGE) == HID_USAGE_PAGE_VENDOR)
> +			is_vendor = true;
> +	}
> +
> +	/*
> +	 * For ROG keyboards, make them HID/hiddev compliant by creating one
> +	 * input per application. For interfaces other than the vendor one,
> +	 * disable report fixups.
> +	 */
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> +		if (!is_vendor)
> +			drvdata->quirks |= QUIRK_SKIP_REPORT_FIXUP;
> +		hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
> +	}
> +
>  	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
>  	if (ret) {
>  		hid_err(hdev, "Asus hw start failed: %d\n", ret);
>  		return ret;
>  	}
>  
> +	if (is_vendor && (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) &&
> +	    !asus_kbd_wmi_led_control_present(hdev) &&
> +	    asus_kbd_register_leds(hdev))
> +		hid_warn(hdev, "Failed to initialize backlight.\n");
> +
>  	/*
> -	 * Check that input registration succeeded. Checking that
> -	 * HID_CLAIMED_INPUT is set prevents a UAF when all input devices
> -	 * were freed during registration due to no usages being mapped,
> -	 * leaving drvdata->input pointing to freed memory.
> +	 * For ROG keyboards, skip rename for consistency and ->input check as
> +	 * some devices do not have inputs.
>  	 */
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
> +		return 0;
> +
>  	if (!drvdata->input || !(hdev->claimed & HID_CLAIMED_INPUT)) {
>  		hid_err(hdev, "Asus input not registered\n");
>  		ret = -ENOMEM;
> @@ -1352,6 +1365,10 @@ static const __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  		rdesc = new_rdesc;
>  	}
>  
> +	/* Vendor fixups should only apply to NKEY vendor devices. */
> +	if (drvdata->quirks & QUIRK_SKIP_REPORT_FIXUP)
> +		return rdesc;
> +
>  	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
>  			*rsize == 331 && rdesc[190] == 0x85 && rdesc[191] == 0x5a &&
>  			rdesc[204] == 0x95 && rdesc[205] == 0x05) {

