Return-Path: <linux-input+bounces-11246-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EF5A7073C
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 17:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD832168D0F
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 16:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D3F25DD05;
	Tue, 25 Mar 2025 16:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tp+h0/9/"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0F925DB11;
	Tue, 25 Mar 2025 16:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742920963; cv=none; b=D+W3u0tzTp0xqa2YHQa0XiRNF+oFRK0lcmUwFIuz0/zrLnIKNvbmS9NsJi0WbFxR7yPL3Q3fGnKY4JqFuSdCLQfuCP+xNhay1rRCIlH5mNweScpml82HxWlobxZe2p+2xJ3KgTygjr35V/cJMp1BFUyXEEhAjdYlpvMqWSZXjJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742920963; c=relaxed/simple;
	bh=9PfQrrMML2fjLMx4RoL4K7Q1wOqMz2whJnLqpbVaMFs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nlcj7d7Om2nNPdc3eWVi4XdPUSdUMimkBMoa13AaRZZq7auyfhKwnOcglQKcwf/b1VSIhks9uDddBXu60FuDi/VV2EeTCuApkGzViuLwKFqwVChvA7WGFgXHBF8hMn92BNAoMA9uiOh584Ivj5zOHESpywmLY9xsg6ZrtHJhHtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tp+h0/9/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742920962; x=1774456962;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9PfQrrMML2fjLMx4RoL4K7Q1wOqMz2whJnLqpbVaMFs=;
  b=Tp+h0/9/1TeFbqK6lKDo8DujcYUty1YVFgyCAqmRNAy8OOg3QVo2Cx5s
   adhHUsUQhokZ5DoNRb4nDdc4EEUuMWiTtKl/9QfMWqBZORiGvWQFg48RA
   vTKWbIRmJ0//G4nhTlz6dqTIEW51EovJhqAAzgSqPVFDHm+7vEmaDL2R0
   4HeP1UU9w+npO3a5Iz0OYLgy2EJhzaO+quGVFU7ZW/GRkH0F20Zwm5BZQ
   Y4kRWHYapGrdLXwdFRr6ehJuX95GPKX8uPqZaQt0ihkKbkeLegEAau6S0
   ISeoh29vfq45MXKmK9xK62/MR/c8M4yOoYluftQCn8K+wgTWg5My0/mGB
   A==;
X-CSE-ConnectionGUID: xezW43UWQOS4jOTwX014Pw==
X-CSE-MsgGUID: upwZcTP6TTO8fZprk5Ghxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="54842127"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="54842127"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:42:41 -0700
X-CSE-ConnectionGUID: FLX+2TuuQmqfEn6clN5cRg==
X-CSE-MsgGUID: f2yMtUYDTc2B84S9/D9z4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="155343580"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.158])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:42:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 25 Mar 2025 18:42:33 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 05/11] HID: asus: listen to the asus-wmi brightness
 device instead of creating one
In-Reply-To: <20250324210151.6042-6-lkml@antheas.dev>
Message-ID: <30fd838f-e6f0-50ed-7dca-f01f4e773f2f@linux.intel.com>
References: <20250324210151.6042-1-lkml@antheas.dev> <20250324210151.6042-6-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Mar 2025, Antheas Kapenekakis wrote:

> Some ROG laptops expose multiple interfaces for controlling the
> keyboard/RGB brightness. This creates a name conflict under
> asus::kbd_brightness, where the second device ends up being
> named asus::kbd_brightness_1 and they are both broken.
> 
> Therefore, register a listener to the asus-wmi brightness device
> instead of creating a new one.
> 
> Reviewed-by: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 65 +++++++-----------------------------------
>  1 file changed, 11 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index e97fb76eda619..c40b5c14c797f 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -96,7 +96,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define TRKID_SGN       ((TRKID_MAX + 1) >> 1)
>  
>  struct asus_kbd_leds {
> -	struct led_classdev cdev;
> +	struct asus_hid_listener listener;
>  	struct hid_device *hdev;
>  	struct work_struct work;
>  	unsigned int brightness;
> @@ -493,11 +493,11 @@ static void asus_schedule_work(struct asus_kbd_leds *led)
>  	spin_unlock_irqrestore(&led->lock, flags);
>  }
>  
> -static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
> -				   enum led_brightness brightness)
> +static void asus_kbd_backlight_set(struct asus_hid_listener *listener,
> +				   int brightness)
>  {
> -	struct asus_kbd_leds *led = container_of(led_cdev, struct asus_kbd_leds,
> -						 cdev);
> +	struct asus_kbd_leds *led = container_of(listener, struct asus_kbd_leds,
> +						 listener);
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&led->lock, flags);
> @@ -507,20 +507,6 @@ static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
>  	asus_schedule_work(led);
>  }
>  
> -static enum led_brightness asus_kbd_backlight_get(struct led_classdev *led_cdev)
> -{
> -	struct asus_kbd_leds *led = container_of(led_cdev, struct asus_kbd_leds,
> -						 cdev);
> -	enum led_brightness brightness;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&led->lock, flags);
> -	brightness = led->brightness;
> -	spin_unlock_irqrestore(&led->lock, flags);
> -
> -	return brightness;
> -}
> -
>  static void asus_kbd_backlight_work(struct work_struct *work)
>  {
>  	struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
> @@ -537,34 +523,6 @@ static void asus_kbd_backlight_work(struct work_struct *work)
>  		hid_err(led->hdev, "Asus failed to set keyboard backlight: %d\n", ret);
>  }
>  
> -/* WMI-based keyboard backlight LED control (via asus-wmi driver) takes
> - * precedence. We only activate HID-based backlight control when the
> - * WMI control is not available.
> - */
> -static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
> -{
> -	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> -	u32 value;
> -	int ret;
> -
> -	if (!IS_ENABLED(CONFIG_ASUS_WMI))
> -		return false;
> -
> -	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
> -			dmi_check_system(asus_use_hid_led_dmi_ids)) {
> -		hid_info(hdev, "using HID for asus::kbd_backlight\n");
> -		return false;
> -	}
> -
> -	ret = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS,
> -				       ASUS_WMI_DEVID_KBD_BACKLIGHT, 0, &value);
> -	hid_dbg(hdev, "WMI backlight check: rc %d value %x", ret, value);
> -	if (ret)
> -		return false;
> -
> -	return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
> -}
> -
>  static int asus_kbd_register_leds(struct hid_device *hdev)
>  {
>  	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> @@ -599,14 +557,12 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>  	drvdata->kbd_backlight->removed = false;
>  	drvdata->kbd_backlight->brightness = 0;
>  	drvdata->kbd_backlight->hdev = hdev;
> -	drvdata->kbd_backlight->cdev.name = "asus::kbd_backlight";
> -	drvdata->kbd_backlight->cdev.max_brightness = 3;
> -	drvdata->kbd_backlight->cdev.brightness_set = asus_kbd_backlight_set;
> -	drvdata->kbd_backlight->cdev.brightness_get = asus_kbd_backlight_get;
> +	drvdata->kbd_backlight->listener.brightness_set = asus_kbd_backlight_set;
>  	INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_backlight_work);
>  	spin_lock_init(&drvdata->kbd_backlight->lock);
>  
> -	ret = devm_led_classdev_register(&hdev->dev, &drvdata->kbd_backlight->cdev);
> +	ret = asus_hid_register_listener(&drvdata->kbd_backlight->listener);
> +
>  	if (ret < 0) {

Please don't add empty line in between function and its error handling.

>  		/* No need to have this still around */
>  		devm_kfree(&hdev->dev, drvdata->kbd_backlight);
> @@ -1000,7 +956,7 @@ static int __maybe_unused asus_resume(struct hid_device *hdev) {
>  
>  	if (drvdata->kbd_backlight) {
>  		const u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4,
> -				drvdata->kbd_backlight->cdev.brightness };
> +				drvdata->kbd_backlight->brightness };
>  		ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
>  		if (ret < 0) {
>  			hid_err(hdev, "Asus failed to set keyboard backlight: %d\n", ret);
> @@ -1139,7 +1095,6 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	}
>  
>  	if (is_vendor && (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) &&
> -	    !asus_kbd_wmi_led_control_present(hdev) &&
>  	    asus_kbd_register_leds(hdev))
>  		hid_warn(hdev, "Failed to initialize backlight.\n");
>  
> @@ -1180,6 +1135,8 @@ static void asus_remove(struct hid_device *hdev)
>  	unsigned long flags;
>  
>  	if (drvdata->kbd_backlight) {
> +		asus_hid_unregister_listener(&drvdata->kbd_backlight->listener);
> +
>  		spin_lock_irqsave(&drvdata->kbd_backlight->lock, flags);
>  		drvdata->kbd_backlight->removed = true;
>  		spin_unlock_irqrestore(&drvdata->kbd_backlight->lock, flags);
> 

-- 
 i.


