Return-Path: <linux-input+bounces-15493-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E2363BDE2D2
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 13:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A44A5504C6E
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 11:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DDE31D75B;
	Wed, 15 Oct 2025 10:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GjoPOVLw"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FB431D383;
	Wed, 15 Oct 2025 10:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760525996; cv=none; b=MEN0EbX6lxU7XpaemYC4KgK2nzKPreVDwpkhZQOWvWhaYcp+zFrSzDJ/7H/cyy45vPgJB0ofwY7XJ1afXQgENj9pDaFWRRL9rwrE2S4SU/JId8SlpLPmTS8lZIjyyQ/LHF0GC33R72YdgiswtflEw3pStH1FudhHZmcq8fnUfdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760525996; c=relaxed/simple;
	bh=rWe9klIYWU4hVufmZy/X/lJrEUQVvYokOZ6Ygtpj/Mk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YKk4TaTN77NQaIAS25J1rK3AxcaOv89VQ6kMgEKwhboNdyMw7xhWRU9SjTlEABekr7Kr4FJPkvoyh860REOmsHxikNUIq52oMfvpRDzopBTf8cVuWvhuzdeij6P+af8z/wki8Z7TCdXdgTRjPRxtPT6iKV30q/1Y44PGZGYDpo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GjoPOVLw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760525994; x=1792061994;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rWe9klIYWU4hVufmZy/X/lJrEUQVvYokOZ6Ygtpj/Mk=;
  b=GjoPOVLwuUf0+LthsE3aCb/rCPodPq3WtuiycTbN6rxmFT+Ew7aEnXx+
   jtVYeNGowoc6h9jFHjfT+2E3URh9NjAHzBBDYezTeCpOspFKxzInahxMz
   bFh1o33QbGnWMxyuTS76PtU+dwZzLI8Ry8PX6RWfGR9E6+F1hPR0+vaLl
   ZE2hLwqM7TNsOfhvjr0qSJ+2W2GXXKcWoWmNl8Cq23uofw1R5GvY2EdY5
   JLh3RCNZ1IsaqpLXWAI94nm+vpbBgVtzkFKHOhsOWHDZd85ttwYDosC68
   sartgjnvO1PDhCIIPRjzelhyGhNu6d2d0I7T1YYTD04MLZWi2hod7zmDp
   Q==;
X-CSE-ConnectionGUID: SJe6CGmCQ3aATCsBTFB3iQ==
X-CSE-MsgGUID: LFUpwuOYQuaSThO8pL8z9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62736435"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="62736435"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 03:59:53 -0700
X-CSE-ConnectionGUID: YSNGcNcuSMKBeTstEypG4w==
X-CSE-MsgGUID: MrsRmpOEQ+GeAoRIglAF9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="187443974"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.75])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 03:59:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 15 Oct 2025 13:59:43 +0300 (EEST)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
    Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v6 2/7] HID: asus: prevent binding to all HID devices on
 ROG
In-Reply-To: <20251013201535.6737-3-lkml@antheas.dev>
Message-ID: <c5b8c060-9fab-acda-b002-cf57716265ed@linux.intel.com>
References: <20251013201535.6737-1-lkml@antheas.dev> <20251013201535.6737-3-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Oct 2025, Antheas Kapenekakis wrote:

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
>  drivers/hid/hid-asus.c | 71 +++++++++++++++++++++++++++++-------------
>  1 file changed, 50 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index d0c783df99bc..a62559e3e064 100644
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
> +#define QUIRK_HANDLE_GENERIC		BIT(14)
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
> @@ -331,6 +332,10 @@ static int asus_raw_event(struct hid_device *hdev,
>  {
>  	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
>  
> +	/* NOOP on generic HID devices to avoid side effects. */
> +	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
> +		return 0;
> +
>  	if (drvdata->battery && data[0] == BATTERY_REPORT_ID)
>  		return asus_report_battery(drvdata, data, size);
>  
> @@ -875,6 +880,10 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
>  	struct input_dev *input = hi->input;
>  	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
>  
> +	/* NOOP on generic HID devices to avoid side effects. */
> +	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
> +		return 0;
> +
>  	/* T100CHI uses MULTI_INPUT, bind the touchpad to the mouse hid_input */
>  	if (drvdata->quirks & QUIRK_T100CHI &&
>  	    hi->report->id != T100CHI_MOUSE_REPORT_ID)
> @@ -928,11 +937,6 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
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
> @@ -952,6 +956,10 @@ static int asus_input_mapping(struct hid_device *hdev,
>  		return -1;
>  	}
>  
> +	/* NOOP on generic HID devices to avoid side effects. */
> +	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
> +		return 0;
> +
>  	/*
>  	 * Ignore a bunch of bogus collections in the T100CHI descriptor.
>  	 * This avoids a bunch of non-functional hid_input devices getting
> @@ -1005,15 +1013,6 @@ static int asus_input_mapping(struct hid_device *hdev,
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
> @@ -1130,8 +1129,10 @@ static int __maybe_unused asus_reset_resume(struct hid_device *hdev)
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
> @@ -1215,18 +1216,42 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
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
> +	 * For ROG keyboards, make them hid compliant by

hid -> HID

> +	 * creating one input per application. For interfaces other than
> +	 * the vendor one, disable hid-asus handlers.

Please reflow to 80 chars.

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
> @@ -1277,6 +1302,10 @@ static const __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  {
>  	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
>  
> +	/* NOOP on generic HID devices to avoid side effects. */
> +	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
> +		return rdesc;
> +
>  	if (drvdata->quirks & QUIRK_FIX_NOTEBOOK_REPORT &&
>  			*rsize >= 56 && rdesc[54] == 0x25 && rdesc[55] == 0x65) {
>  		hid_info(hdev, "Fixing up Asus notebook report descriptor\n");
> 

-- 
 i.


