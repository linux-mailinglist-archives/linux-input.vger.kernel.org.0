Return-Path: <linux-input+bounces-16486-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CEBCADE7F
	for <lists+linux-input@lfdr.de>; Mon, 08 Dec 2025 18:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EBD40300BFA7
	for <lists+linux-input@lfdr.de>; Mon,  8 Dec 2025 17:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90B22E92B7;
	Mon,  8 Dec 2025 17:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CF9AkOpA"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13C42E92B4;
	Mon,  8 Dec 2025 17:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765213891; cv=none; b=qrmQb1gFzRov4sX94U52zzDqSpLpAYNKT3X97UZ98uMDLtDImS39QUL0GeH/GPGUW+4ZBgM+fZ+9WhaulXB/O/0iesq0SdP7zK0AqCF8Pvr6NyC2715/7kM0L/qjkHSO9kgfP6EfLCG3C+VOZinrjbhXZ02D31N3dcq/Hs0oS1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765213891; c=relaxed/simple;
	bh=tT2naDJ/9hkgag9LbLdUu1K8WHpzlF8JN28RO3LHY18=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oobs1Eg7ETOkj1NYJhU9hSv58hDiujAI3eot46iUvkt5uVAE/+YvyjEZ20FA8emQ22RtzBqUAvLsPGhoXl7bs2gbt7fQpfHWA1M/+WAqRQE7LK7ytYE7LO28lSbWrkJqsgwLQ8retOvCdl1ARtRE1AJlSp6LE9wnWZpX5emsZvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CF9AkOpA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765213889; x=1796749889;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tT2naDJ/9hkgag9LbLdUu1K8WHpzlF8JN28RO3LHY18=;
  b=CF9AkOpAv6n4e3qXi1oy71VlHxXqhn5xcOEbsHcuqQ/Yw2PBvF/6xzNo
   kDPfQxHXaVBsoODQesVJ4TGmxQO5oqtTOMB+be7enxVn2XLiV/Hf1Ev99
   k0E98XF+K82UaLN/AVE9g9qvkhsTCl3nlJwH5/TtrAV88jVeHE/XAJk6j
   5Netk2JmT0z4cjh/tPBX8QJOcyttv65FiFMAHKOYbeuAEf963oqPoXEnN
   yQ542OPrb4H+iX9RlUJUX3tYW60HbXvMHT4letZ9rbSh+XlDgLHzFfcGv
   hODJ8kBPKzNHPbTVt2UG3xQpj7NCuwHI5iD7EJ+FPELbiiafw1Y8bBpgv
   A==;
X-CSE-ConnectionGUID: O9PkUUXqRgCjRZRH17QTvA==
X-CSE-MsgGUID: ayGiBhttRlm94y0+l9SQTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="77483117"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="77483117"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 09:11:29 -0800
X-CSE-ConnectionGUID: sIoj3Q9oQPSCddR6u+OGEw==
X-CSE-MsgGUID: crM6cM1SSfqsQ07VEXRqrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="195774826"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.92])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 09:11:26 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Dec 2025 19:11:22 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>, 
    Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v10 05/11] HID: asus: move vendor initialization to
 probe
In-Reply-To: <20251122110032.4274-6-lkml@antheas.dev>
Message-ID: <8e3817f1-73e8-6f61-3eca-e45aa4d46af3@linux.intel.com>
References: <20251122110032.4274-1-lkml@antheas.dev> <20251122110032.4274-6-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 22 Nov 2025, Antheas Kapenekakis wrote:

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

In the changelogs, please add () after any name that refers to a C 
function so the reader immediately knows you're talking about a function.

> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 35 ++++++++++++++++++-----------------
>  1 file changed, 18 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 2a412e10f916..faac971794c0 100644
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
> @@ -941,11 +941,6 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
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
> @@ -1018,15 +1013,6 @@ static int asus_input_mapping(struct hid_device *hdev,
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
> @@ -1143,8 +1129,11 @@ static int __maybe_unused asus_reset_resume(struct hid_device *hdev)
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
> @@ -1228,12 +1217,24 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
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
> 

-- 
 i.


