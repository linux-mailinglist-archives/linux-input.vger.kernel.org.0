Return-Path: <linux-input+bounces-16213-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2CDC6D568
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 09:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AF061388A6A
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 08:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00DA2ED86F;
	Wed, 19 Nov 2025 08:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GxTWewgj"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338772C11F7;
	Wed, 19 Nov 2025 08:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763539223; cv=none; b=s19O7Dl38IjvPwgWOyRZa/Y5kXiZxtNz+2j0DbQIHiZgaMb7LT6VFAEYg0uDKLVHvX3zGTfh+jMkMAYtn9WFk6N9LBvm5f05BpeZwWb6QO2Cs7OXyjpUU/w53qkQc1zwwlHNgYZJA6OCoHvbh+6rDKmufguQqIHSZM6sXAh4Mfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763539223; c=relaxed/simple;
	bh=KcWLrqjPUSQgRN7dEBdPDqR8zxvq6XPf0ZvJ4gJ84Ao=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=u8VJAYNbSCjRM2QM/fVSmKtIblYJ/D/iHtY2BqpCQNcBmTdCZVdAn0jRxbvzAiPfTbcuPj86IHTZPXS1Mme2pPhWQWhwdmlqgp5aWddrXbv20ElQQeCJVUFdAte/3yjjk8Df2dvs8wNN9ovzCp71GmmHazNBp54IM/KJ1iRMdSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GxTWewgj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763539221; x=1795075221;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=KcWLrqjPUSQgRN7dEBdPDqR8zxvq6XPf0ZvJ4gJ84Ao=;
  b=GxTWewgj6EDNydt+C93BBAFCR2pUp+Lbw50p+vKmg18UfgutjDtel8tT
   FUmNo8xFL3HRpLnsKpYC3GBA5meE8WhN3HJetlfXFOp4itfA9dRsUXDk+
   slDeh3nwnIESUgiUJRmQrmoE3knEnZw8RDpma5LT11XBzL/a8Cm4Hp+u5
   LNIu4GLnhaLjz5kAXQpVeE8IqK3h6PvmSMC9jSpgYbB8diPiga49SdvQA
   ItjS9W9/yBrC3CPoJkjCrQp0ehsRZu6wfwgKTeAHn9DC4R2k8wqI4Wl50
   Dy/57nufmXeMQ2QBJeG0/2Y9t6eQ1r8lXe+qP6cmIjbqzbMUFo/R9tj1Q
   Q==;
X-CSE-ConnectionGUID: lN0f4YJVSNmGyH6Pcan/Tw==
X-CSE-MsgGUID: vHbPN6m6T3m0sBPyJOgbWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64578559"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="64578559"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 00:00:21 -0800
X-CSE-ConnectionGUID: acYgT4lJT3+/p9Et2ZJ/Uw==
X-CSE-MsgGUID: 5iECMXDlSs+9GOP1BY7c2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190779787"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.220])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 00:00:17 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 19 Nov 2025 10:00:13 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
    Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v8 04/10] HID: asus: prevent binding to all HID devices
 on ROG
In-Reply-To: <20251101104712.8011-5-lkml@antheas.dev>
Message-ID: <277e4a55-c2e4-ab33-c0f4-a4f484c5dff7@linux.intel.com>
References: <20251101104712.8011-1-lkml@antheas.dev> <20251101104712.8011-5-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 1 Nov 2025, Antheas Kapenekakis wrote:

> Currently, when hid-asus is not loaded, NKEY keyboards load as ~6
> event devices with a pretty ASUSTEK name. When it loads, it concatenates
> all applications per HID endpoint, renames them, and prints errors
> when some of them do not have an input device.
> 
> Therefore, change probe so that this is no longer the case. Stop

Using a standalone "this" should be generally avoided in changelog text, 
it's very often too ambiguous what it refers to (including in this case).

--
 i.

> renaming the devices, omit the check for .input which causes errors
> on e.g., the Z13 for some hiddev only devices, and move RGB checks
> into probe.
> 
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
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && !is_vendor)
> +		drvdata->quirks |= QUIRK_SKIP_REPORT_FIXUP;
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
> +	 * For ROG keyboards, skip rename for consistency and ->input check as
> +	 * some devices do not have inputs.
> +	 */
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
> +		return 0;
> +
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
>  	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
>  			*rsize == 331 && rdesc[190] == 0x85 && rdesc[191] == 0x5a &&
>  			rdesc[204] == 0x95 && rdesc[205] == 0x05) {
> 

