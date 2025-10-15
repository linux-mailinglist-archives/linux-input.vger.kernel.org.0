Return-Path: <linux-input+bounces-15500-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C9DBDE71F
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 14:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 133743B888F
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 12:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6AC322DB7;
	Wed, 15 Oct 2025 12:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X5siGw88"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5572C3276;
	Wed, 15 Oct 2025 12:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760530744; cv=none; b=d/f8oNeVc0HJRdEaKPRpmbAHkmzH8TuYGvj2C35eUmvTCxerIcQHyHZOWIUcP7/hj1fMlEvEoyrWtfGiXpOdsjpztgzLSwPi75Ws8hQsUZG3d3iDrJBOVeH/1wrcztn+2OU1K2qTg28Vyz8xOi/uV1VNmjRD/e6n+R2VPWUR7ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760530744; c=relaxed/simple;
	bh=SNfAT6Qi2YRkuxaiDCzuRehdTEWuoCDQmIGd3jVCIFg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qpFrtR4a4uyOqU5AczndC2sLBTkF7irMhAKPqzl1x1cMXhIC+rWu9GGOoid8E3wcr0v28KquByEWIzeoMGRPWK81tyBP7xq2ViFKTrE4941jP0MyA+ZnyHLnrtx1+kQcIouQENdpwnz34Zg2GiIJYgiuebrnTk4/r0Gga4gPLIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X5siGw88; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760530742; x=1792066742;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SNfAT6Qi2YRkuxaiDCzuRehdTEWuoCDQmIGd3jVCIFg=;
  b=X5siGw885Pqh3iZ2psnOj4Vu3QbC211d0UxOGiOcKKxlSF4X5wDo1L8j
   Bg+Cj9mFQno+TPCsZwXCnEQgv2FM7TFnQPhTvJBRw2ZRVvs6Rryu0Av2x
   IaRakihrRDZ/yAsOaHPU80gKKeENIpUtBHoZxPTI4tMDbyfTa3XghOU2U
   1xcHLxdIGjtyRSPFBwJri5FHj+AQnubW6EXGHGUWdeaYclt/cU9SvD8cp
   BmFj+ZE9bb0x9VebStOaqIUbsuJLrpUlAGB//WhFWfXmySjsU0OX785eo
   zBgzt9ELHBAd65ySxbrarnQ34zfbbsNvlDbxNFe3cefz9PqvtwEV6JU73
   g==;
X-CSE-ConnectionGUID: O7K/CJXgQRmOIdSBnFIDkg==
X-CSE-MsgGUID: p1gOTzK4TMSGBvvbDTV0wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66531623"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66531623"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 05:19:00 -0700
X-CSE-ConnectionGUID: P279CeMpQfmkJ8dPe1BsAQ==
X-CSE-MsgGUID: 4ECa931ARhu0KwNTHsYZ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="182151147"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.75])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 05:18:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 15 Oct 2025 15:18:53 +0300 (EEST)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
    =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v6 6/7] platform/x86: asus-wmi: add keyboard brightness
 event handler
In-Reply-To: <20251013201535.6737-7-lkml@antheas.dev>
Message-ID: <4e4af3e9-26d3-ad03-7868-7fd7dbd541f3@linux.intel.com>
References: <20251013201535.6737-1-lkml@antheas.dev> <20251013201535.6737-7-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Oct 2025, Antheas Kapenekakis wrote:

> Currenlty, the keyboard brightness control of Asus WMI keyboards is

There's a typo here but preferrably avoid "currently" altogether where 
possible.

> handled in the kernel, which leads to the shortcut going from
> brightness 0, to 1, to 2, and 3.
> 
> However, for HID keyboards it is exposed as a key and handled by the
> user's desktop environment. For the toggle button, this means that
> brightness control becomes on/off. In addition, in the absence of a
> DE, the keyboard brightness does not work.
> 
> Therefore, expose an event handler for the keyboard brightness control
> which can then be used by hid-asus.
> 
> Reviewed-by: Luke D. Jones <luke@ljones.dev>
> Tested-by: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/platform/x86/asus-wmi.c            | 41 +++++++++++++++++++++-
>  include/linux/platform_data/x86/asus-wmi.h | 13 +++++++
>  2 files changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index a2a7cd61fd59..58407a3b6d41 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1579,6 +1579,45 @@ void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
>  }
>  EXPORT_SYMBOL_GPL(asus_hid_unregister_listener);
>  
> +static void do_kbd_led_set(struct led_classdev *led_cdev, int value);
> +
> +int asus_hid_event(enum asus_hid_event event)
> +{
> +	unsigned long flags;
> +	int brightness;
> +
> +	spin_lock_irqsave(&asus_ref.lock, flags);
> +	if (!asus_ref.asus || !asus_ref.asus->kbd_led_registered) {

Please add a local variable for asus_ref.asus. Check other 
patches/functions too if its use is repeated in some function many times, 
the local var seems to be in order.

> +		spin_unlock_irqrestore(&asus_ref.lock, flags);

Use guard() instead.

> +		return -EBUSY;
> +	}
> +	brightness = asus_ref.asus->kbd_led_wk;
> +
> +	switch (event) {
> +	case ASUS_EV_BRTUP:
> +		brightness += 1;
> +		break;
> +	case ASUS_EV_BRTDOWN:
> +		brightness -= 1;
> +		break;
> +	case ASUS_EV_BRTTOGGLE:
> +		if (brightness >= ASUS_EV_MAX_BRIGHTNESS)
> +			brightness = 0;
> +		else
> +			brightness += 1;
> +		break;
> +	}
> +
> +	do_kbd_led_set(&asus_ref.asus->kbd_led, brightness);
> +	led_classdev_notify_brightness_hw_changed(&asus_ref.asus->kbd_led,
> +						  asus_ref.asus->kbd_led_wk);
> +
> +	spin_unlock_irqrestore(&asus_ref.lock, flags);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(asus_hid_event);
> +
>  /*
>   * These functions actually update the LED's, and are called from a
>   * workqueue. By doing this as separate work rather than when the LED
> @@ -1878,7 +1917,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>  	asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
>  	asus->kbd_led.brightness_set = kbd_led_set;
>  	asus->kbd_led.brightness_get = kbd_led_get;
> -	asus->kbd_led.max_brightness = 3;
> +	asus->kbd_led.max_brightness = ASUS_EV_MAX_BRIGHTNESS;
>  	asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
>  
>  	if (asus->kbd_led_avail)
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 1f85d76387a8..e78e0fbccede 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -168,6 +168,14 @@ struct asus_hid_listener {
>  	void (*brightness_set)(struct asus_hid_listener *listener, int brightness);
>  };
>  
> +enum asus_hid_event {
> +	ASUS_EV_BRTUP,
> +	ASUS_EV_BRTDOWN,
> +	ASUS_EV_BRTTOGGLE,

Where does "BRT" come from. To me it doesn't associate with brightness 
(might be due to me being non-native). If there's a good reason why it's 
that way, fine but otherwise I suggest changing it so that it becomes 
easier to understand.

It's not a big problem as is because the context in the code above allows 
decrypting the meaning but without the other names, I'd have been totally 
lost what it means.

> +};
> +
> +#define ASUS_EV_MAX_BRIGHTNESS 3
> +
>  #if IS_REACHABLE(CONFIG_ASUS_WMI)
>  void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
>  void set_ally_mcu_powersave(bool enabled);
> @@ -176,6 +184,7 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
>  
>  int asus_hid_register_listener(struct asus_hid_listener *cdev);
>  void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
> +int asus_hid_event(enum asus_hid_event event);
>  #else
>  static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
>  {
> @@ -200,6 +209,10 @@ static inline int asus_hid_register_listener(struct asus_hid_listener *bdev)
>  static inline void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
>  {
>  }
> +static inline int asus_hid_event(enum asus_hid_event event)
> +{
> +	return -ENODEV;
> +}
>  #endif
>  
>  #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */
> 

-- 
 i.


