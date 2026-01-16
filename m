Return-Path: <linux-input+bounces-17154-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA82D38825
	for <lists+linux-input@lfdr.de>; Fri, 16 Jan 2026 22:08:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51395302517E
	for <lists+linux-input@lfdr.de>; Fri, 16 Jan 2026 21:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48AC2E54BB;
	Fri, 16 Jan 2026 21:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QIRPTsJj"
X-Original-To: linux-input@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F90D26CE3F;
	Fri, 16 Jan 2026 21:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768597713; cv=none; b=r4s1QL7WNG2wp2sYG4U6gb+mbvacTcam/jcJPV4G1rhjqhXwy8n/CDoxHDv1fUToJSv5VMvOTwShzNx1JfKRh2XExPbLelEodW+m5/2y3VXtGH7HykXIVuQd01epKjRTLFyYLVyb+Mwt45kgOlZkc0vHH8uw2HesqivpT951bwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768597713; c=relaxed/simple;
	bh=AkjJWnZwgal8xaOK88qYlNP91OsTCo4qwVqk+x9WbgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mVrVEceXLKNoDE62bgxxKP8p1LeOiiDZh+WEBZVxlXZHcLpCJZxdnT7UCZzm1IWyXqUUo+UrPAxSlxXSzFTIQP4XvVVUFdMLxnJ11HPlDnJyVaG1HFJUjP25eQq3hqWgqC5mB0ajjFooMlICLyADQ9sNfoh1/DgzvsG5T1LWXCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QIRPTsJj; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <01bce222-1b91-404a-a9de-62fdc5627988@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768597699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E+12L4KLTe4istJDiyrkeED2dOGlq9BG/7fg75TP8Hw=;
	b=QIRPTsJjgvnXZ3c3UgvZQ+y5N9E7DT0/RkxrNBC/NXFb/0GKlxqxw7ZsOe8oTK8aePo0gp
	fouVCGEjOQU3mRhJojDq3nK3Feh+5txdQ73+MePTbj2vjSqOJbw7Bs+sqDaSS5bAFE3Vvh
	jLjuJkI7+uS9bRtIURbctk13cZ7X63o=
Date: Fri, 16 Jan 2026 22:08:12 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v11 05/11] HID: asus: move vendor initialization to probe
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20260116133150.5606-1-lkml@antheas.dev>
 <20260116133150.5606-6-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260116133150.5606-6-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/16/26 14:31, Antheas Kapenekakis wrote:

> ROG NKEY devices have multiple HID endpoints, around 3-4. One of those
> endpoints has a usage page of 0xff31, and is the one that emits keyboard
> shortcuts and controls RGB/backlight. Currently, this driver places
> the usage page check under asus_input_mapping and then inits backlight
> in asus_input_configured which is unnecessarily complicated and prevents
> probe from performing customizations on the vendor endpoint.
>
> Simplify the logic by introducing an is_vendor variable into probe that
> checks for usage page 0xff31. Then, use this variable to move backlight
> initialization into probe instead of asus_input_configured, and remove
> the backlight check from asus_input_mapping.
Gmail has decided that it doesn't like part of this patchset and I can't find
them in spam either, so I will use my usual tag from this account.

Reviewed-by: Denis Benato <benato.denis96@gmail.com>
> Acked-by: Benjamin Tissoires <bentiss@kernel.org>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 35 ++++++++++++++++++-----------------
>  1 file changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index e1291dcd99fd..428481aa2083 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -48,6 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define T100CHI_MOUSE_REPORT_ID 0x06
>  #define FEATURE_REPORT_ID 0x0d
>  #define INPUT_REPORT_ID 0x5d
> +#define HID_USAGE_PAGE_VENDOR 0xff310000
>  #define FEATURE_KBD_REPORT_ID 0x5a
>  #define FEATURE_KBD_REPORT_SIZE 64
>  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
> @@ -127,7 +128,6 @@ struct asus_drvdata {
>  	struct input_dev *tp_kbd_input;
>  	struct asus_kbd_leds *kbd_backlight;
>  	const struct asus_touchpad_info *tp;
> -	bool enable_backlight;
>  	struct power_supply *battery;
>  	struct power_supply_desc battery_desc;
>  	int battery_capacity;
> @@ -318,7 +318,7 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
>  static int asus_event(struct hid_device *hdev, struct hid_field *field,
>  		      struct hid_usage *usage, __s32 value)
>  {
> -	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
> +	if ((usage->hid & HID_USAGE_PAGE) == HID_USAGE_PAGE_VENDOR &&
>  	    (usage->hid & HID_USAGE) != 0x00 &&
>  	    (usage->hid & HID_USAGE) != 0xff && !usage->type) {
>  		hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
> @@ -938,11 +938,6 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
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
> @@ -1015,15 +1010,6 @@ static int asus_input_mapping(struct hid_device *hdev,
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
> @@ -1140,8 +1126,11 @@ static int __maybe_unused asus_reset_resume(struct hid_device *hdev)
>  
>  static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  {
> -	int ret;
> +	struct hid_report_enum *rep_enum;
>  	struct asus_drvdata *drvdata;
> +	struct hid_report *rep;
> +	bool is_vendor = false;
> +	int ret;
>  
>  	drvdata = devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL);
>  	if (drvdata == NULL) {
> @@ -1225,12 +1214,24 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
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
>  	 * Check that input registration succeeded. Checking that
>  	 * HID_CLAIMED_INPUT is set prevents a UAF when all input devices

