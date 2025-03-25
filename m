Return-Path: <linux-input+bounces-11242-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32161A706C1
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 17:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E815E3A9F9B
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 16:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B2A25B694;
	Tue, 25 Mar 2025 16:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pr7idbwk"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E778B1922FA;
	Tue, 25 Mar 2025 16:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742919877; cv=none; b=lrepVTWwuiQonQswwDJe00hE4yJd8L1I9D5RfK8lxyStblmgqsFd0D8nmV7R6/08gDO9dwq3kZq+pkUNwRng7L/K7Ki/waLH6/pwsD9wuE1JKsJA1CWTYk2QdmbfBCh40k/NI9QSPZK/1QqQuijHyTEvSJQFzlEIdenqiz/h80g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742919877; c=relaxed/simple;
	bh=VukOGOtUlzZWpnsmi5rnmoaNAqhpZwHs73q9WhAm618=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UkTs/EsiM4JHpiaj77mO0ifpuwKmTQ99tWCpbitk3Hcqly1VV2C3kDw3g0bASaMMS3n2Xz1lwOuNxVN5eOh535BIBRLY/Xo+7PkHrLhxJO7LmNHsnpW5ZBsGuFiA8Gw1Y+N/EQ95D/FoXXYSbkW+7+mDWiIR9fMV4q/s8KVx7B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pr7idbwk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742919876; x=1774455876;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=VukOGOtUlzZWpnsmi5rnmoaNAqhpZwHs73q9WhAm618=;
  b=Pr7idbwkwEwHJzorjAd3N7r6wXtBXW0idJrHgTZUX1/Nu8roZ/xK5jRN
   +ocrJyPUN3E+ELIHouUEf8KQ7osfkjISuu6iM1K0gNV8DpmhKcNG47qWk
   cvRNFR5S2TRf4J+OBy1+gZMVAOBwZqSlGx4WehXcf9GughAPFIlELw/a3
   palVZRc22TG0CFqOqkuT7dWELhps+EpoGRHW3oC5t3ienM22WpobZxzf8
   7g8GkcpQJxpD+HxfDvPJmfc7HoW3lLI5JvAGhDT8O6VY1fisFsrFMZUOd
   nISYuDrGGKMonlov1rWA6ZeJWrgJvfKCkN7HCGo1sSnHwF81j1BvkCqxl
   A==;
X-CSE-ConnectionGUID: PDZXwcD0Qs+MfOai37/BGQ==
X-CSE-MsgGUID: sFMeiycxSm2DHr3XKP3FVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="69538399"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="69538399"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:24:34 -0700
X-CSE-ConnectionGUID: ljwZjIKoRFq5h0YESWwopw==
X-CSE-MsgGUID: cJfoW89JSYGCpK9Lqhk5yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="124463536"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.158])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:24:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 25 Mar 2025 18:24:27 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 02/11] HID: asus: prevent binding to all HID devices
 on ROG
In-Reply-To: <20250324210151.6042-3-lkml@antheas.dev>
Message-ID: <bf0d12f4-f3ea-6a79-d155-b1e3abc3a156@linux.intel.com>
References: <20250324210151.6042-1-lkml@antheas.dev> <20250324210151.6042-3-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Mar 2025, Antheas Kapenekakis wrote:

> ROG keyboards are HID compliant and only care about the endpoint that
> produces vendor events (e.g., fan mode) and has the keyboard backlight.
> 
> Therefore, handle all of the endpoints of ROG keyboards as compliant,
> by adding HID_QUIRK_INPUT_PER_APP and, for devices other than the vendor
> one, by adding QUIRK_HANDLE_GENERIC to stop mutating them.
> 
> Due to HID_QUIRK_INPUT_PER_APP, rgb register is moved into probe, as
> the input_* functions are called multiple times (4 for the Z13).
> 
> Reviewed-by: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 69 ++++++++++++++++++++++++++++++++----------
>  1 file changed, 53 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 8d4df1b6f143b..96461321c191c 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -84,6 +84,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define QUIRK_MEDION_E1239T		BIT(10)
>  #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> +#define QUIRK_HANDLE_GENERIC		BIT(13)
>  
>  #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>  						 QUIRK_NO_INIT_REPORTS | \
> @@ -120,7 +121,6 @@ struct asus_drvdata {
>  	struct input_dev *tp_kbd_input;
>  	struct asus_kbd_leds *kbd_backlight;
>  	const struct asus_touchpad_info *tp;
> -	bool enable_backlight;
>  	struct power_supply *battery;
>  	struct power_supply_desc battery_desc;
>  	int battery_capacity;
> @@ -326,6 +326,10 @@ static int asus_raw_event(struct hid_device *hdev,
>  {
>  	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
>  
> +	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
> +		/* NOOP on generic HID devices to avoid side effects. */
> +		return 0;
> +
>  	if (drvdata->battery && data[0] == BATTERY_REPORT_ID)
>  		return asus_report_battery(drvdata, data, size);
>  
> @@ -774,6 +778,10 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
>  	struct input_dev *input = hi->input;
>  	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
>  
> +	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
> +		/* NOOP on generic HID devices to avoid side effects. */
> +		return 0;

You'd need braces for multiline indented constructs like this, however, I 
think that comment can appear before the if line which wouldn't require 
braces. The same applies to many cases below.

> +
>  	/* T100CHI uses MULTI_INPUT, bind the touchpad to the mouse hid_input */
>  	if (drvdata->quirks & QUIRK_T100CHI &&
>  	    hi->report->id != T100CHI_MOUSE_REPORT_ID)
> @@ -827,11 +835,6 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
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
> @@ -851,6 +854,10 @@ static int asus_input_mapping(struct hid_device *hdev,
>  		return -1;
>  	}
>  
> +	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
> +		/* NOOP on generic HID devices to avoid side effects. */
> +		return 0;
> +
>  	/*
>  	 * Ignore a bunch of bogus collections in the T100CHI descriptor.
>  	 * This avoids a bunch of non-functional hid_input devices getting
> @@ -901,15 +908,6 @@ static int asus_input_mapping(struct hid_device *hdev,
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
> @@ -1026,8 +1024,10 @@ static int __maybe_unused asus_reset_resume(struct hid_device *hdev)
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
> @@ -1111,12 +1111,45 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  		return ret;
>  	}
>  
> +	/*
> +	 * Check for the vendor interface (0xff31) to init the RGB.

The next line seems to be continuation, is . extra?

> +	 * and handle generic devices properly.
> +	 */
> +	rep_enum = &hdev->report_enum[HID_INPUT_REPORT];
> +	list_for_each_entry(rep, &rep_enum->report_list, list) {
> +		if ((rep->application & HID_USAGE_PAGE) == 0xff310000)

Use a named define for the literal?

> +			is_vendor = true;
> +	}
> +
> +	/*
> +	 * For ROG keyboards, make them hid compliant by
> +	 * creating one input per application. For interfaces other than
> +	 * the vendor one, disable hid-asus handlers.
> +	 */
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> +		if (!is_vendor)
> +			drvdata->quirks |= QUIRK_HANDLE_GENERIC;
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
> +	/*
> +	 * For ROG keyboards, skip rename for consistency and
> +	 * ->input check as some devices do not have inputs.

Please reflow to 80 chars.

> +	 */
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
> +		return 0;
> +
>  	if (!drvdata->input) {
>  		hid_err(hdev, "Asus input not registered\n");
>  		ret = -ENOMEM;
> @@ -1167,6 +1200,10 @@ static const __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  {
>  	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
>  
> +	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
> +		/* NOOP on generic HID devices to avoid side effects. */
> +		return rdesc;
> +
>  	if (drvdata->quirks & QUIRK_FIX_NOTEBOOK_REPORT &&
>  			*rsize >= 56 && rdesc[54] == 0x25 && rdesc[55] == 0x65) {
>  		hid_info(hdev, "Fixing up Asus notebook report descriptor\n");
> 

-- 
 i.


