Return-Path: <linux-input+bounces-3893-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 047C98D165C
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 10:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1DB32839C3
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 08:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8432013C90A;
	Tue, 28 May 2024 08:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0HE6wbZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B466EB64;
	Tue, 28 May 2024 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716885381; cv=none; b=Nhu179HwKmjo+qqCtEtsm6HfM0xPySFnpLaTk/SNjZ+nsTEM/cz5CXuHccr+x8kLHGmnQJM6ipDp5/IHlrWmBELJKbxwjLNTA9UYMxq1y9HZSkkJpj1da5NSIKPmP5bQeJ17JMuoXNQF1FCNtXsXaROulP1jrhgE1Bpt1VQc7BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716885381; c=relaxed/simple;
	bh=WKJi3oA49761Rs6or8jvRD1SSYdP62DWREY3kVLAuFg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JBPH2Q/BZdkVj2Xqd9zkvXM9FHCRl0YQuF2NorJ+ZOsqALhCrOSQ0bpkHW+8DgDJKGWrLDNfDpXuT6Yc+DmxW8EfuiTwyi5D34jDNzrMjGro/Brqm9U1XgOFwyMAsdnPHpJVg69e8kr/K9Ta+11iVlsPv0F3bMQPvMSd4SuWzJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0HE6wbZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716885381; x=1748421381;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=WKJi3oA49761Rs6or8jvRD1SSYdP62DWREY3kVLAuFg=;
  b=X0HE6wbZDwDd18U4/FMvcukIJ81TUNSjygi8sCsXZX5ifrSq8iHVfIi5
   GzIPZle5hSU5jmBrFakMCo/aR2cTc8ORbfyfz4znVac99OhF5zdosGcGY
   oNDARFB350P0Cm7ZsEUybx4ZYrC9qqiELP8ymqpBhY/75ZBTEVvqt0Oib
   P5JpjEXfovIQqnNbPDi3rRxw+yiFLO/lNefK3tgY8r6oXf265xb0MBdOu
   JGDYws2JIYzGSMG/S4kmKFhLikgjB0IR+nMYtbS0AzCYpTsB75EmHKi29
   TzYFjTMRYr6nmwiEQvQmdhYnvEBEPRQG0odJiiZdeYTVFHnllV9SegL8I
   A==;
X-CSE-ConnectionGUID: f3VSfyU+QHujl74jZtuSug==
X-CSE-MsgGUID: GtFMZDAwQXaF5ZsOIuP6Nw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="35731203"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="35731203"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 01:36:20 -0700
X-CSE-ConnectionGUID: kIHFHnZ8Rhq8tJomY2ooXw==
X-CSE-MsgGUID: 4ob9eVpSQ6Oc1R9erU1ioQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="39395409"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.144])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 01:36:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 28 May 2024 11:36:12 +0300 (EEST)
To: "Luke D. Jones" <luke@ljones.dev>
cc: jikos@kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    corentin.chary@gmail.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org, 
    bentiss@kernel.org
Subject: Re: [PATCH] hid-asus: use hid for brightness control on keyboard
In-Reply-To: <20240528013959.14661-1-luke@ljones.dev>
Message-ID: <17aa68e2-4af6-68ad-e81a-abc714517f6b@linux.intel.com>
References: <20240528013959.14661-1-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 May 2024, Luke D. Jones wrote:

> On almost all ASUS ROG series laptops the MCU used for the USB keyboard
> also has a HID packet used for setting the brightness. This is usually
> the same as the WMI method. But in some laptops the WMI method either
> is missing or doesn't work, so we should default to the HID control.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  drivers/hid/hid-asus.c                     | 19 ++++++++++++-
>  drivers/platform/x86/asus-wmi.c            |  3 ++-
>  include/linux/platform_data/x86/asus-wmi.h | 31 ++++++++++++++++++++++
>  3 files changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 02de2bf4f790..9389a3e733e3 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -101,6 +101,7 @@ struct asus_kbd_leds {
>  	unsigned int brightness;
>  	spinlock_t lock;
>  	bool removed;
> +	int report_id;
>  };
>  
>  struct asus_touchpad_info {
> @@ -473,7 +474,7 @@ static enum led_brightness asus_kbd_backlight_get(struct led_classdev *led_cdev)
>  static void asus_kbd_backlight_work(struct work_struct *work)
>  {
>  	struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
> -	u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
> +	u8 buf[] = { led->report_id, 0xba, 0xc5, 0xc4, 0x00 };
>  	int ret;
>  	unsigned long flags;
>  
> @@ -492,12 +493,18 @@ static void asus_kbd_backlight_work(struct work_struct *work)
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
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && asus_use_hidraw_led()) {
> +		hid_info(hdev, "using hidraw for asus::kbd_backlight\n");
> +		return false;
> +	}
> +
>  	ret = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS,
>  				       ASUS_WMI_DEVID_KBD_BACKLIGHT, 0, &value);
>  	hid_dbg(hdev, "WMI backlight check: rc %d value %x", ret, value);
> @@ -507,6 +514,12 @@ static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
>  	return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
>  }
>  
> +static bool asus_kbd_is_input_led(void)
> +{
> +	return dmi_match(DMI_PRODUCT_NAME, "GU605")
> +	    || dmi_match(DMI_PRODUCT_NAME, "GA403");
> +}
> +
>  static int asus_kbd_register_leds(struct hid_device *hdev)
>  {
>  	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> @@ -549,6 +562,10 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>  	if (!drvdata->kbd_backlight)
>  		return -ENOMEM;
>  
> +	drvdata->kbd_backlight->report_id = FEATURE_KBD_REPORT_ID;
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && asus_kbd_is_input_led())
> +		drvdata->kbd_backlight->report_id = FEATURE_KBD_LED_REPORT_ID1;
> +
>  	drvdata->kbd_backlight->removed = false;
>  	drvdata->kbd_backlight->brightness = 0;
>  	drvdata->kbd_backlight->hdev = hdev;
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 3f9b6285c9a6..a58df18a70ad 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1681,7 +1681,8 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>  			goto error;
>  	}
>  
> -	if (!kbd_led_read(asus, &led_val, NULL)) {
> +	if (!kbd_led_read(asus, &led_val, NULL) && !asus_use_hidraw_led()) {
> +		pr_info("using asus-wmi for asus::kbd_backlight\n");
>  		asus->kbd_led_wk = led_val;
>  		asus->kbd_led.name = "asus::kbd_backlight";
>  		asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 3eb5cd6773ad..79a50102440d 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -160,4 +160,35 @@ static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>  }
>  #endif
>  
> +/* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
> +#if IS_REACHABLE(CONFIG_ASUS_WMI)
> +static bool asus_use_hidraw_led(void)

Since it's in a header, it's missing inline. However, this function looks 
quite complicated so putting it into a header file is questionable to 
begin with so I'd prefer it to be in a .c file.

> +{
> +	const char *product, *board;
> +
> +	product = dmi_get_system_info(DMI_PRODUCT_FAMILY);
> +	if (!product)
> +		return false;
> +
> +	/* These product ranges should all be using HID for keyboard LED */
> +	if (strstr(product, "ROG Zephyrus")
> +	|| strstr(product, "ROG Strix")
> +	|| strstr(product, "ROG Flow")
> +	|| strstr(product, "GA403")
> +	|| strstr(product, "GU605"))

Please align these properly but consider using array and loop.

> +		return true;
> +
> +	board = dmi_get_system_info(DMI_BOARD_NAME);
> +	if (!board)
> +		return false;
> +
> +	return strstr(board, "RC71L"); /* ROG Ally specific */
> +}
> +#else
> +static inline bool asus_use_hidraw_led(void)
> +{
> +	return true;
> +}
> +#endif
> +
>  #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */
> 

-- 
 i.


