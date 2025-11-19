Return-Path: <linux-input+bounces-16202-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7B2C6C24D
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 01:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DB65A4E4602
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 00:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8647C21858D;
	Wed, 19 Nov 2025 00:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DY6KETBW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2599217705
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 00:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763512724; cv=none; b=TbWkS0vEdOo7RS3TD1fLYso1HF5eaL3cYLdYSh1uF3kQKCFaGv2j13K118HUOgzD8R5dq8McdbIGbHIEuc61JH0yVGMC402MvELpkKrJ4uRGPWk9Z1rZFBjzmjM6ZaFQWBL6A9qgJNsXAT8Aw9g4TOdQWKvyQH+8z3AsfGUrHjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763512724; c=relaxed/simple;
	bh=FQaxPXXZmKDrIguQcyxuVrOlOw29mdZ5G7SYaGsQQMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOvauddLvLT8dzID8oBXU5L5RhLZUxLcgfFrSWYwrVruD38oeFZkKgvUZqe6RiFmmhEW3MD571e5arA4Lz1CYIrT12S3GeEKiiunp61jdn5OR1GQR1RPSryiQOEgoGEvLtLIib4yI0XjGM+7E44xOMQScja0PXdguwtLvlqv4Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DY6KETBW; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477563e28a3so2419735e9.1
        for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 16:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763512719; x=1764117519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kyLrwLekDqqfuF4ZrXUeptybL6qreAeUb67QNuRLH2o=;
        b=DY6KETBW+m1ZYklOeFdjOnNf9L1c3ujnOlGo0fnnZJ9lqW72xIQZ00DSLNBdglKpJ7
         ALB3tg9IesFLcjxgo4goZMSPA3PLXcLI+ZHhy6ObtTwzRTHk3ipNEycAwgJAssClHKWv
         Y8SHgBkSocUo1AX31Zj0H6EKMMObViDQxgf3qPopC+CYdkbcL/EjtJfWBpvsEdBpaagB
         hZHLQkZp8DdtWFNstYWf11UrAZw7KOTX/i9Sahl+w10Jm39nYtRmKgXhjs1EDAY3JfeV
         5RlGMXVii4fWK8U3Q7LNXAvyOJFETfAF5qhYaRDXW+qmYJyO4IGZXWM1GAhulxPhC5IL
         is/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763512719; x=1764117519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyLrwLekDqqfuF4ZrXUeptybL6qreAeUb67QNuRLH2o=;
        b=r9EfZ385MLzXcGcvlSxaFPs9MWALAtBu9ePExf+rBKb+K0RH4xzIpbmyd4Yw+Ov3ME
         drm8hBZB830Qy4PjR5PcOtqobGP1GPJbKRhsOylyy5hJQrSf4hJBLe1wp30KbmfQ7aZK
         OutUbPTsJOLjez1I7qB/KotoC+LOFdghsgs5w+Zbp540ASiS+viKaEtrLHEnbJwxw/xY
         Zyf+srjOuUm5NkiYcp9rntQbFPih247F78G0vEkqKkWNesH51N2RtryQ3RSLXrcVTGy7
         I36maxY4khdUBQ+ZwG4OLFr/AFxssLkViw9BLGJGq1+ABxEnBNxPiTwsC62ReBwuCDyr
         zzBg==
X-Forwarded-Encrypted: i=1; AJvYcCVY/bI8KXpKwsV5YPZDbvCDtoW/CYHnu3fvFXjYgNIp1MDYW6j9sXigotbjpJQqnwQbMciJKTKs44y/QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkJjOk6eOEBruA0EqpBWw+hdTadc8fGBncVY+iD+XDJg8ACTgR
	r0DeQJDs5Z0qRzMligu9nGBpe7mRyhtSW1S9FMpe9zF8Xclkp1dqVedN
X-Gm-Gg: ASbGnctvda0Wen5YetMoHlHNEIbD6Wgvop5BM8aymGy8Rp853y7QkUuxPRjpqluOHTU
	OJxZo9C0/LVJgsJg4l9WHeuV3jP/GI5tBQAvaSnF5eh1aOZbO3FH23Rehmh2IUV50tAOK3qbHQh
	G2G+b/oLq1g11LOgJX8TqKkOH5yCFyH2K6jdJepjnLsMPLOpyxN0IZvhmS5V564CIu3FPCJupzf
	v03HZPyXG8W0idBCzGYBJNAYfEvqOHupY/OtexC4R3hzKTJoKCSiWC5UxYYS7sH3LrfzYR1/OFZ
	icxSG4P+E/IyJRaoBavao8CfJkNlbPjviJCOIE4w3l21X4Q5GHAnynAlw+HZSIT0lCDUfXLfhPZ
	1c/MvsCVG2VBCoTTKcZGayaUtiXJT+aCWfzO2XW7wSI0+6W9Q8Y7WNOmFAzl4nidXP0GU/a2GXV
	1XW7PA/poY1I0WQj6ZHQOIogI=
X-Google-Smtp-Source: AGHT+IFDXq69OMQ7MpGQRLax059x29B6T42fhIfqD9u905Fv4nbgdishN/Eh6nV2/O1mFE/JJgsJ4g==
X-Received: by 2002:a05:600c:1552:b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-477b18cafa4mr4525805e9.8.1763512718502;
        Tue, 18 Nov 2025 16:38:38 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b0ffd37bsm17209055e9.3.2025.11.18.16.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 16:38:37 -0800 (PST)
Message-ID: <abeecb3b-8d51-4625-8743-1cfff355c0e9@gmail.com>
Date: Wed, 19 Nov 2025 01:38:36 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/10] HID: asus: prevent binding to all HID devices on
 ROG
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-5-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251101104712.8011-5-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/1/25 11:47, Antheas Kapenekakis wrote:
> Currently, when hid-asus is not loaded, NKEY keyboards load as ~6
> event devices with a pretty ASUSTEK name. When it loads, it concatenates
> all applications per HID endpoint, renames them, and prints errors
> when some of them do not have an input device.
>
> Therefore, change probe so that this is no longer the case. Stop
> renaming the devices, omit the check for .input which causes errors
> on e.g., the Z13 for some hiddev only devices, and move RGB checks
> into probe.
I have an issue with this "therefore" related to the renaming of device:
you are basically doing here:

state a matter of fact.
Therefore, change that.

Why? the check for .input is clear why, the rename not so much.

I have a few more comments below about the rename.
> Reviewed-by: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 52 ++++++++++++++++++++++++++++--------------
>  1 file changed, 35 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 03f0d86936fc..726f5d8e22d1 100644
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
Why is is_vendor an int? Don't we have bools?
>  	drvdata = devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL);
>  	if (drvdata == NULL) {
> @@ -1218,12 +1207,37 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
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
> +	 * For ROG keyboards, disable fixups except vendor devices.
> +	 */
multiline comment for no reason. Comma doesn't provide any value here.
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && !is_vendor)
> +		drvdata->quirks |= QUIRK_SKIP_REPORT_FIXUP;
> +
Doing this will skip the report fixup entirely while before
it was called in every case: are we really sure we want this?
Or do we want it only for specific devices?

It's my understanding that function is only useful on
keyboard devices, so before keyboard devices (all)
while now is_vendor keyboard devices, right?

What about keyboard devices that are not is_vendor
for which function isn't called anymore? 
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
> +	/*
> +	 * For ROG keyboards, skip rename for consistency and ->input check as
> +	 * some devices do not have inputs.
> +	 */
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
> +		return 0;
> +
This is a moot point: I have yet to see the real benefit of doing this,
but one thing is sure... having for the same driver multiple name
to basically the same interface across different lineups of
hardware is not something I would call "consistency".

As I said already I want you to either drop this or to present
a list of pros of doing this and to hear from Derek the plan
going forward to avoid breaking anything.
>  	/*
>  	 * Check that input registration succeeded. Checking that
>  	 * HID_CLAIMED_INPUT is set prevents a UAF when all input devices
> @@ -1352,6 +1366,10 @@ static const __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  		rdesc = new_rdesc;
>  	}
>  
> +	/* Vendor fixups should only apply to NKEY vendor devices. */
> +	if (drvdata->quirks & QUIRK_SKIP_REPORT_FIXUP)
> +		return rdesc;
> +
Uhm... no? Or at least it's not obvious why.

If this is the case why is the check not at the top of the function?

Beside please refrain from using "should" in this context unless
backed up by evidence or it's otherwise obvious as "should"
can have many different interpretations.
>  	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
>  			*rsize == 331 && rdesc[190] == 0x85 && rdesc[191] == 0x5a &&
>  			rdesc[204] == 0x95 && rdesc[205] == 0x05) {

