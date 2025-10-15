Return-Path: <linux-input+bounces-15496-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFE7BDE5C2
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 13:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BC4654E650C
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 11:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA10324B0B;
	Wed, 15 Oct 2025 11:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSoNpJ7Y"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849182C3256;
	Wed, 15 Oct 2025 11:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760529583; cv=none; b=ri22WW8UkzZk+levdBTlHtiYtE56Mf0kvIKBVLQHl8IEQh/iIlxqCL6c+lVSFY8nakjoPNCLvGvdS0oRQSlzWkoeKiv+7YLKS6XXZYDR77kLZ2Gp2uYinEwlyqKSVZFMsqfDOqMbZq7r96fQOhrxbhRMo5aQKyE9wftwr6DJg+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760529583; c=relaxed/simple;
	bh=V1paHuyoPURFQ/q5JVWlFQMLlRBDylfzq4XBnMe7aac=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WuqzqA3+RpdTsduHCQR+AQwwHfC0z8vRpDlaDlqFuEj7mfxt5XPVl3nrgRgBBmh03TV6iL13hK4L7iAk7hDCqkPwKnM8ccfr37mZLkmot9lBSfbLn/ErYVnL0kNnCp43bV9of6G8uApPBoPM+bVntY9QhUn9hrWLefc0VMGZMWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSoNpJ7Y; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760529582; x=1792065582;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=V1paHuyoPURFQ/q5JVWlFQMLlRBDylfzq4XBnMe7aac=;
  b=QSoNpJ7Y+PHkM3SM+S7Z4rD96BDI4z+PdrsSIYx+9j6MMGJZr49NkhrP
   3bO426luJ/peNfUfqWBVvjkTltNYYkJjfNg9y9QaHim8sXm80DSHK0uFn
   ocrbnQZ9L0SI3gZN/CTQPvis8yfade85H4IF9BmV9dy5D1bYHSuw7MiqK
   pJWdSj3fLX44tGs9Qt3MbAo62ISQoJxkBFH6bpZvbPVNTZ45IrylqSqSi
   GsFIBBBSjmuREbUD+9KfTScvckPmw+SvXa9Qc/kGdKZv+OjoV8UpLe0tg
   2A6/vXxEIQJJx8Q6Qm/mq8DHD/fCXkiDlSnh+b7/UAk9f9wHky2TfSSk5
   w==;
X-CSE-ConnectionGUID: d8inqn9fT5yHTX20GgGYuA==
X-CSE-MsgGUID: uOfqSN3dSbKgwI7/FrOC+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62797470"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="62797470"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:59:41 -0700
X-CSE-ConnectionGUID: CWi2LZGvStCDV1qGWw1f2g==
X-CSE-MsgGUID: ECxWnicZSESI/KJ30HHrkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="205859020"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.75])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:59:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 15 Oct 2025 14:59:33 +0300 (EEST)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
    Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v6 3/7] platform/x86: asus-wmi: Add support for multiple
 kbd RGB handlers
In-Reply-To: <20251013201535.6737-4-lkml@antheas.dev>
Message-ID: <cf0ca840-6e0d-2d99-cb23-eabf0ac5263b@linux.intel.com>
References: <20251013201535.6737-1-lkml@antheas.dev> <20251013201535.6737-4-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Oct 2025, Antheas Kapenekakis wrote:

> Some devices, such as the Z13 have multiple AURA devices connected
> to them by USB. In addition, they might have a WMI interface for
> RGB. In Windows, Armoury Crate exposes a unified brightness slider
> for all of them, with 3 brightness levels.
> 
> Therefore, to be synergistic in Linux, and support existing tooling
> such as UPower, allow adding listeners to the RGB device of the WMI
> interface. If WMI does not exist, lazy initialize the interface.
> 
> Reviewed-by: Luke D. Jones <luke@ljones.dev>
> Tested-by: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/platform/x86/asus-wmi.c            | 118 ++++++++++++++++++---
>  include/linux/platform_data/x86/asus-wmi.h |  16 +++
>  2 files changed, 121 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index e72a2b5d158e..a2a7cd61fd59 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -258,6 +258,8 @@ struct asus_wmi {
>  	int tpd_led_wk;
>  	struct led_classdev kbd_led;
>  	int kbd_led_wk;
> +	bool kbd_led_avail;
> +	bool kbd_led_registered;
>  	struct led_classdev lightbar_led;
>  	int lightbar_led_wk;
>  	struct led_classdev micmute_led;
> @@ -1530,6 +1532,53 @@ static void asus_wmi_battery_exit(struct asus_wmi *asus)
>  
>  /* LEDs ***********************************************************************/
>  
> +struct asus_hid_ref {
> +	struct list_head listeners;
> +	struct asus_wmi *asus;
> +	spinlock_t lock;

Please always document what a lock protects.

I started wonder why it needs to be spinlock?

It would seem rwsem is more natural for it as write is only needed at 
probe/remove time (if there's no good reason for using a spinlock).

You're also missing include.

> +};
> +
> +struct asus_hid_ref asus_ref = {

Should be static ?

> +	.listeners = LIST_HEAD_INIT(asus_ref.listeners),
> +	.asus = NULL,
> +	.lock = __SPIN_LOCK_UNLOCKED(asus_ref.lock),
> +};
> +
> +int asus_hid_register_listener(struct asus_hid_listener *bdev)
> +{
> +	unsigned long flags;
> +	int ret = 0;
> +
> +	spin_lock_irqsave(&asus_ref.lock, flags);
> +	list_add_tail(&bdev->list, &asus_ref.listeners);
> +	if (asus_ref.asus) {
> +		if (asus_ref.asus->kbd_led_registered && asus_ref.asus->kbd_led_wk >= 0)
> +			bdev->brightness_set(bdev, asus_ref.asus->kbd_led_wk);
> +
> +		if (!asus_ref.asus->kbd_led_registered) {
> +			ret = led_classdev_register(
> +				&asus_ref.asus->platform_device->dev,
> +				&asus_ref.asus->kbd_led);
> +			if (!ret)
> +				asus_ref.asus->kbd_led_registered = true;

I suggest you use guard() for the spinlock and return early where possible.

With guard() in use, you can do normal error handling here with return ret
immediately.

Please also add a local var for asus_ref.asus.

> +		}
> +	}
> +	spin_unlock_irqrestore(&asus_ref.lock, flags);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(asus_hid_register_listener);
> +
> +void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&asus_ref.lock, flags);
> +	list_del(&bdev->list);
> +	spin_unlock_irqrestore(&asus_ref.lock, flags);
> +}
> +EXPORT_SYMBOL_GPL(asus_hid_unregister_listener);
> +
>  /*
>   * These functions actually update the LED's, and are called from a
>   * workqueue. By doing this as separate work rather than when the LED
> @@ -1609,6 +1658,7 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
>  
>  static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
>  {
> +	struct asus_hid_listener *listener;
>  	struct asus_wmi *asus;
>  	int max_level;
>  
> @@ -1616,25 +1666,39 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
>  	max_level = asus->kbd_led.max_brightness;
>  
>  	asus->kbd_led_wk = clamp_val(value, 0, max_level);
> -	kbd_led_update(asus);
> +
> +	if (asus->kbd_led_avail)
> +		kbd_led_update(asus);
> +
> +	list_for_each_entry(listener, &asus_ref.listeners, list)
> +		listener->brightness_set(listener, asus->kbd_led_wk);
>  }
>  
>  static void kbd_led_set(struct led_classdev *led_cdev,
>  			enum led_brightness value)
>  {
> +	unsigned long flags;
> +
>  	/* Prevent disabling keyboard backlight on module unregister */
>  	if (led_cdev->flags & LED_UNREGISTERING)
>  		return;
>
> +	spin_lock_irqsave(&asus_ref.lock, flags);
>  	do_kbd_led_set(led_cdev, value);
> +	spin_unlock_irqrestore(&asus_ref.lock, flags);
>  }
>  
>  static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
>  {
> -	struct led_classdev *led_cdev = &asus->kbd_led;
> +	struct led_classdev *led_cdev;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&asus_ref.lock, flags);
> +	led_cdev = &asus->kbd_led;
>  

I'd remove the empty line from the critical section.

I think you should mention the locking in the changelog too as it clearly 
impacts not only the new code.

>  	do_kbd_led_set(led_cdev, value);
>  	led_classdev_notify_brightness_hw_changed(led_cdev, asus->kbd_led_wk);
> +	spin_unlock_irqrestore(&asus_ref.lock, flags);
>  }
>  
>  static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
> @@ -1644,6 +1708,9 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
>  
>  	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
>  
> +	if (!asus->kbd_led_avail)
> +		return asus->kbd_led_wk;
> +
>  	retval = kbd_led_read(asus, &value, NULL);
>  	if (retval < 0)
>  		return retval;
> @@ -1759,7 +1826,15 @@ static int camera_led_set(struct led_classdev *led_cdev,
>  
>  static void asus_wmi_led_exit(struct asus_wmi *asus)
>  {
> -	led_classdev_unregister(&asus->kbd_led);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&asus_ref.lock, flags);
> +	asus_ref.asus = NULL;
> +	spin_unlock_irqrestore(&asus_ref.lock, flags);
> +
> +	if (asus->kbd_led_registered)
> +		led_classdev_unregister(&asus->kbd_led);
> +
>  	led_classdev_unregister(&asus->tpd_led);
>  	led_classdev_unregister(&asus->wlan_led);
>  	led_classdev_unregister(&asus->lightbar_led);
> @@ -1773,6 +1848,8 @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
>  static int asus_wmi_led_init(struct asus_wmi *asus)
>  {
>  	int rv = 0, num_rgb_groups = 0, led_val;
> +	struct asus_hid_listener *listener;
> +	unsigned long flags;
>  
>  	if (asus->kbd_rgb_dev)
>  		kbd_rgb_mode_groups[num_rgb_groups++] = &kbd_rgb_mode_group;
> @@ -1797,23 +1874,38 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>  			goto error;
>  	}
>  
> -	if (!kbd_led_read(asus, &led_val, NULL) && !dmi_check_system(asus_use_hid_led_dmi_ids)) {
> -		pr_info("using asus-wmi for asus::kbd_backlight\n");
> +	asus->kbd_led.name = "asus::kbd_backlight";
> +	asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> +	asus->kbd_led.brightness_set = kbd_led_set;
> +	asus->kbd_led.brightness_get = kbd_led_get;
> +	asus->kbd_led.max_brightness = 3;
> +	asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
> +
> +	if (asus->kbd_led_avail)
>  		asus->kbd_led_wk = led_val;
> -		asus->kbd_led.name = "asus::kbd_backlight";
> -		asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> -		asus->kbd_led.brightness_set = kbd_led_set;
> -		asus->kbd_led.brightness_get = kbd_led_get;
> -		asus->kbd_led.max_brightness = 3;
> +	else
> +		asus->kbd_led_wk = -1;
>  
> -		if (num_rgb_groups != 0)
> -			asus->kbd_led.groups = kbd_rgb_mode_groups;
> +	if (asus->kbd_led_avail && num_rgb_groups != 0)
> +		asus->kbd_led.groups = kbd_rgb_mode_groups;

Can't this be placed into the block above?

>  
> +	spin_lock_irqsave(&asus_ref.lock, flags);
> +	if (asus->kbd_led_avail || !list_empty(&asus_ref.listeners)) {
>  		rv = led_classdev_register(&asus->platform_device->dev,
>  					   &asus->kbd_led);
> -		if (rv)
> +		if (rv) {
> +			spin_unlock_irqrestore(&asus_ref.lock, flags);

Please use scoped_guard() so you don't need to call unlock yourself.

Unrelated to this patch, I'd also simplify error label by adding return 0 
before it so the code after the label doesn't need if (rv) check.

>  			goto error;
> +		}
> +		asus->kbd_led_registered = true;
> +
> +		if (asus->kbd_led_wk >= 0) {
> +			list_for_each_entry(listener, &asus_ref.listeners, list)
> +				listener->brightness_set(listener, asus->kbd_led_wk);
> +		}
>  	}
> +	asus_ref.asus = asus;
> +	spin_unlock_irqrestore(&asus_ref.lock, flags);
>  
>  	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_WIRELESS_LED)
>  			&& (asus->driver->quirks->wapf > 0)) {
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 8a515179113d..f13a701f47a8 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -163,11 +163,19 @@ enum asus_ally_mcu_hack {
>  	ASUS_WMI_ALLY_MCU_HACK_DISABLED,
>  };
>  
> +struct asus_hid_listener {
> +	struct list_head list;
> +	void (*brightness_set)(struct asus_hid_listener *listener, int brightness);
> +};

Please add kerneldoc to this struct and the exported functions.

> +
>  #if IS_REACHABLE(CONFIG_ASUS_WMI)
>  void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
>  void set_ally_mcu_powersave(bool enabled);
>  int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
>  int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
> +
> +int asus_hid_register_listener(struct asus_hid_listener *cdev);
> +void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
>  #else
>  static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
>  {
> @@ -184,6 +192,14 @@ static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>  {
>  	return -ENODEV;
>  }
> +
> +static inline int asus_hid_register_listener(struct asus_hid_listener *bdev)
> +{
> +	return -ENODEV;
> +}
> +static inline void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
> +{
> +}
>  #endif
>  
>  /* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
> 

-- 
 i.


