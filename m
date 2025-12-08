Return-Path: <linux-input+bounces-16485-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A29CADD02
	for <lists+linux-input@lfdr.de>; Mon, 08 Dec 2025 18:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46BAA30530A2
	for <lists+linux-input@lfdr.de>; Mon,  8 Dec 2025 17:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE2E28640B;
	Mon,  8 Dec 2025 17:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NM6lXJ0M"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB33277CAB;
	Mon,  8 Dec 2025 17:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765213765; cv=none; b=J+Q8Pr1wBsEBNEk2XdgWGe9G0cjXW++CKRLARs16lkQyHQXrF1SmzV85Hg2CfM26JYFy/1k8SAYPsglhzxH6cEa1dSD5u63OvMUM3C9srU3Z0zdfL7Txo/NCA6luGPaGE9E+rqo6aLrZZxvi3wSxb+so26LUNzK3VLhLbV7iTIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765213765; c=relaxed/simple;
	bh=Qo8leGOt/WfPUhnyaurLN//XFWqxRzi7d0mymd8dJPg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=isMoxyAfDSx3r75KLx+21gGzLK3RyfG6yohuMo1d7JWk5Y4JDtc16Tg4MKLyf1WT/yeZ6+bdicCHk50+lh/ILJoQ8+FHeyiTT5ztmBhCbvHKlNwb9JlsKhxhrKq2WFMV8Qlv5HRph7la/ZMaY+4QKgKQ6ubYzr3sy1080HdMxRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NM6lXJ0M; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765213763; x=1796749763;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Qo8leGOt/WfPUhnyaurLN//XFWqxRzi7d0mymd8dJPg=;
  b=NM6lXJ0Mpr0UWd+ZWJpvAgG0k9T3Vnzz480uiXbfQicTuSf1XIpAkvVy
   S7h9wWhm1UuCrXrdwoW85BtrlV10Frppx8fTcVS4wCWB/j3/W6/seMzqt
   QZwhU53sqLs+lKxg+xLM49EFRDkuZo0Ix04FazpgpB2AWkKa8XO1/+pzm
   51xqLb7cQ0MqwVR2qJ06yAHd93cb6dzORPyMiYKrhjFY9cV6QYVin0Xs0
   /KTsu/wfkGV9kF4M0w4RyaT91Z8fRNv6VTPl9sojbYDHPYxE1TMY6Etbx
   0rrjl60PyJnGnvSDHwsGy96q8aRMesxmMEDnkJ54S0SzUmjosC26ILYla
   w==;
X-CSE-ConnectionGUID: WOHERVqlSRaQgKgz1kQ0SA==
X-CSE-MsgGUID: tdb/u4A7SfWrwlrqmRIu1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67196520"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="67196520"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 09:09:23 -0800
X-CSE-ConnectionGUID: 8dDLc5KdQf6mDm3CKmXH2A==
X-CSE-MsgGUID: aqfKVGNcSvmWrbUycwuayA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="201102038"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.92])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 09:09:18 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Dec 2025 19:09:14 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>, 
    Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v10 07/11] platform/x86: asus-wmi: Add support for multiple
 kbd led handlers
In-Reply-To: <20251122110032.4274-8-lkml@antheas.dev>
Message-ID: <2e247055-04bd-78f5-97e4-81045ba5ff07@linux.intel.com>
References: <20251122110032.4274-1-lkml@antheas.dev> <20251122110032.4274-8-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 22 Nov 2025, Antheas Kapenekakis wrote:

> Some devices, such as the Z13 have multiple Aura devices connected
> to them by USB. In addition, they might have a WMI interface for
> RGB. In Windows, Armoury Crate exposes a unified brightness slider
> for all of them, with 3 brightness levels.
> 
> Therefore, to be synergistic in Linux, and support existing tooling
> such as UPower, allow adding listeners to the RGB device of the WMI
> interface. If WMI does not exist, lazy initialize the interface.
> 
> Since hid-asus and asus-wmi can both interact with the led objects
> including from an atomic context, protect the brightness access with a
> spinlock and update the values from a workqueue. Use this workqueue to
> also process WMI keyboard events, so they are handled asynchronously.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/platform/x86/asus-wmi.c            | 183 ++++++++++++++++++---
>  include/linux/platform_data/x86/asus-wmi.h |  15 ++
>  2 files changed, 173 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 64cfc0bf98dd..84cde34ab6a8 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -31,13 +31,13 @@
>  #include <linux/pci.h>
>  #include <linux/pci_hotplug.h>
>  #include <linux/platform_data/x86/asus-wmi.h>
> -#include <linux/platform_data/x86/asus-wmi-leds-ids.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_profile.h>
>  #include <linux/power_supply.h>
>  #include <linux/rfkill.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
> +#include <linux/spinlock.h>
>  #include <linux/types.h>
>  #include <linux/units.h>
>  
> @@ -256,6 +256,9 @@ struct asus_wmi {
>  	int tpd_led_wk;
>  	struct led_classdev kbd_led;
>  	int kbd_led_wk;
> +	bool kbd_led_notify;
> +	bool kbd_led_avail;
> +	bool kbd_led_registered;
>  	struct led_classdev lightbar_led;
>  	int lightbar_led_wk;
>  	struct led_classdev micmute_led;
> @@ -264,6 +267,7 @@ struct asus_wmi {
>  	struct work_struct tpd_led_work;
>  	struct work_struct wlan_led_work;
>  	struct work_struct lightbar_led_work;
> +	struct work_struct kbd_led_work;
>  
>  	struct asus_rfkill wlan;
>  	struct asus_rfkill bluetooth;
> @@ -1615,6 +1619,106 @@ static void asus_wmi_battery_exit(struct asus_wmi *asus)
>  
>  /* LEDs ***********************************************************************/
>  
> +struct asus_hid_ref {
> +	struct list_head listeners;
> +	struct asus_wmi *asus;
> +	/* Protects concurrent access from hid-asus and asus-wmi to leds */
> +	spinlock_t lock;
> +};
> +
> +static struct asus_hid_ref asus_ref = {
> +	.listeners = LIST_HEAD_INIT(asus_ref.listeners),
> +	.asus = NULL,
> +	/*
> +	 * Protects .asus, .asus.kbd_led_{wk,notify}, and .listener refs. Other
> +	 * asus variables are read-only after .asus is set.
> +	 *
> +	 * The led cdev device is not protected because it calls backlight_get
> +	 * during initialization, which would result in a nested lock attempt.
> +	 *
> +	 * The led cdev is safe to access without a lock because if
> +	 * kbd_led_avail is true it is initialized before .asus is set and never
> +	 * changed until .asus is dropped. If kbd_led_avail is false, the led

It's actually not as straightforward when it comes to visibility of memory 
writes but you seem to end up being safe because you take the spinlock in 
between so that should ensure kbd_led_avail gets set before .asus is 
assigned. If that wouldn't be there, you'd have needed a memory barrier to 
ensure the writes are guaranteed to be visible in the desired ordering.

> +	 * cdev is registered by the workqueue, which is single-threaded and
> +	 * cancelled before asus-wmi would access the led cdev to unregister it.
> +	 *
> +	 * A spinlock is used, because the protected variables can be accessed
> +	 * from an IRQ context from asus-hid.
> +	 */
> +	.lock = __SPIN_LOCK_UNLOCKED(asus_ref.lock),
> +};
> +
> +/*
> + * Allows registering hid-asus listeners that want to be notified of
> + * keyboard backlight changes.
> + */
> +int asus_hid_register_listener(struct asus_hid_listener *bdev)
> +{
> +	struct asus_wmi *asus;
> +
> +	guard(spinlock_irqsave)(&asus_ref.lock);
> +	list_add_tail(&bdev->list, &asus_ref.listeners);
> +	asus = asus_ref.asus;
> +	if (asus)
> +		queue_work(asus->led_workqueue, &asus->kbd_led_work);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(asus_hid_register_listener);
> +
> +/*
> + * Allows unregistering hid-asus listeners that were added with
> + * asus_hid_register_listener().
> + */
> +void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
> +{
> +	guard(spinlock_irqsave)(&asus_ref.lock);
> +	list_del(&bdev->list);
> +}
> +EXPORT_SYMBOL_GPL(asus_hid_unregister_listener);
> +
> +static void do_kbd_led_set(struct led_classdev *led_cdev, int value);
> +
> +static void kbd_led_update_all(struct work_struct *work)
> +{
> +	struct asus_wmi *asus;
> +	bool registered, notify;
> +	int ret, value;
> +
> +	asus = container_of(work, struct asus_wmi, kbd_led_work);
> +
> +	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
> +		registered = asus->kbd_led_registered;
> +		value = asus->kbd_led_wk;
> +		notify = asus->kbd_led_notify;
> +	}
> +
> +	if (!registered) {
> +		/*
> +		 * This workqueue runs under asus-wmi, which means probe has
> +		 * completed and asus-wmi will keep running until it finishes.
> +		 * Therefore, we can safely register the LED without holding
> +		 * a spinlock.
> +		 */
> +		ret = devm_led_classdev_register(&asus->platform_device->dev,
> +						 &asus->kbd_led);
> +		if (!ret) {
> +			scoped_guard(spinlock_irqsave, &asus_ref.lock)
> +				asus->kbd_led_registered = true;
> +		} else {
> +			pr_warn("Failed to register keyboard backlight LED: %d\n", ret);
> +			return;
> +		}
> +	}
> +
> +	if (value >= 0)
> +		do_kbd_led_set(&asus->kbd_led, value);
> +	if (notify) {
> +		scoped_guard(spinlock_irqsave, &asus_ref.lock)
> +			asus->kbd_led_notify = false;
> +		led_classdev_notify_brightness_hw_changed(&asus->kbd_led, value);
> +	}
> +}
> +
>  /*
>   * These functions actually update the LED's, and are called from a
>   * workqueue. By doing this as separate work rather than when the LED
> @@ -1661,7 +1765,8 @@ static void kbd_led_update(struct asus_wmi *asus)
>  {
>  	int ctrl_param = 0;
>  
> -	ctrl_param = 0x80 | (asus->kbd_led_wk & 0x7F);
> +	scoped_guard(spinlock_irqsave, &asus_ref.lock)
> +		ctrl_param = 0x80 | (asus->kbd_led_wk & 0x7F);

Unrelated to this series, it would be nice to name that 0x80 and the 0x7F 
field.

-- 
 i.

>  	asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT, ctrl_param, NULL);
>  }
>  
> @@ -1694,14 +1799,23 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
>  
>  static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
>  {
> +	struct asus_hid_listener *listener;
>  	struct asus_wmi *asus;
>  	int max_level;
>  
>  	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
>  	max_level = asus->kbd_led.max_brightness;
>  
> -	asus->kbd_led_wk = clamp_val(value, 0, max_level);
> -	kbd_led_update(asus);
> +	scoped_guard(spinlock_irqsave, &asus_ref.lock)
> +		asus->kbd_led_wk = clamp_val(value, 0, max_level);
> +
> +	if (asus->kbd_led_avail)
> +		kbd_led_update(asus);
> +
> +	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
> +		list_for_each_entry(listener, &asus_ref.listeners, list)
> +			listener->brightness_set(listener, asus->kbd_led_wk);
> +	}
>  }
>  
>  static void kbd_led_set(struct led_classdev *led_cdev,
> @@ -1716,10 +1830,11 @@ static void kbd_led_set(struct led_classdev *led_cdev,
>  
>  static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
>  {
> -	struct led_classdev *led_cdev = &asus->kbd_led;
> -
> -	do_kbd_led_set(led_cdev, value);
> -	led_classdev_notify_brightness_hw_changed(led_cdev, asus->kbd_led_wk);
> +	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
> +		asus->kbd_led_wk = value;
> +		asus->kbd_led_notify = true;
> +	}
> +	queue_work(asus->led_workqueue, &asus->kbd_led_work);
>  }
>  
>  static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
> @@ -1729,10 +1844,18 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
>  
>  	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
>  
> +	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
> +		if (!asus->kbd_led_avail)
> +			return asus->kbd_led_wk;
> +	}
> +
>  	retval = kbd_led_read(asus, &value, NULL);
>  	if (retval < 0)
>  		return retval;
>  
> +	scoped_guard(spinlock_irqsave, &asus_ref.lock)
> +		asus->kbd_led_wk = value;
> +
>  	return value;
>  }
>  
> @@ -1844,7 +1967,9 @@ static int camera_led_set(struct led_classdev *led_cdev,
>  
>  static void asus_wmi_led_exit(struct asus_wmi *asus)
>  {
> -	led_classdev_unregister(&asus->kbd_led);
> +	scoped_guard(spinlock_irqsave, &asus_ref.lock)
> +		asus_ref.asus = NULL;
> +
>  	led_classdev_unregister(&asus->tpd_led);
>  	led_classdev_unregister(&asus->wlan_led);
>  	led_classdev_unregister(&asus->lightbar_led);
> @@ -1882,22 +2007,26 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>  			goto error;
>  	}
>  
> -	if (!kbd_led_read(asus, &led_val, NULL) && !dmi_check_system(asus_use_hid_led_dmi_ids)) {
> -		pr_info("using asus-wmi for asus::kbd_backlight\n");
> -		asus->kbd_led_wk = led_val;
> -		asus->kbd_led.name = "asus::kbd_backlight";
> -		asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> -		asus->kbd_led.brightness_set = kbd_led_set;
> -		asus->kbd_led.brightness_get = kbd_led_get;
> -		asus->kbd_led.max_brightness = 3;
> +	asus->kbd_led.name = "asus::kbd_backlight";
> +	asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> +	asus->kbd_led.brightness_set = kbd_led_set;
> +	asus->kbd_led.brightness_get = kbd_led_get;
> +	asus->kbd_led.max_brightness = 3;
> +	asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
> +	INIT_WORK(&asus->kbd_led_work, kbd_led_update_all);
>  
> +	if (asus->kbd_led_avail) {
> +		asus->kbd_led_wk = led_val;
>  		if (num_rgb_groups != 0)
>  			asus->kbd_led.groups = kbd_rgb_mode_groups;
> +	} else {
> +		asus->kbd_led_wk = -1;
> +	}
>  
> -		rv = led_classdev_register(&asus->platform_device->dev,
> -					   &asus->kbd_led);
> -		if (rv)
> -			goto error;
> +	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
> +		asus_ref.asus = asus;
> +		if (asus->kbd_led_avail || !list_empty(&asus_ref.listeners))
> +			queue_work(asus->led_workqueue, &asus->kbd_led_work);
>  	}
>  
>  	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_WIRELESS_LED)
> @@ -4372,6 +4501,7 @@ static int asus_wmi_get_event_code(union acpi_object *obj)
>  
>  static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>  {
> +	enum led_brightness led_value;
>  	unsigned int key_value = 1;
>  	bool autorelease = 1;
>  
> @@ -4388,19 +4518,22 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>  		return;
>  	}
>  
> +	scoped_guard(spinlock_irqsave, &asus_ref.lock)
> +		led_value = asus->kbd_led_wk;
> +
>  	if (code == NOTIFY_KBD_BRTUP) {
> -		kbd_led_set_by_kbd(asus, asus->kbd_led_wk + 1);
> +		kbd_led_set_by_kbd(asus, led_value + 1);
>  		return;
>  	}
>  	if (code == NOTIFY_KBD_BRTDWN) {
> -		kbd_led_set_by_kbd(asus, asus->kbd_led_wk - 1);
> +		kbd_led_set_by_kbd(asus, led_value - 1);
>  		return;
>  	}
>  	if (code == NOTIFY_KBD_BRTTOGGLE) {
> -		if (asus->kbd_led_wk == asus->kbd_led.max_brightness)
> +		if (led_value == asus->kbd_led.max_brightness)
>  			kbd_led_set_by_kbd(asus, 0);
>  		else
> -			kbd_led_set_by_kbd(asus, asus->kbd_led_wk + 1);
> +			kbd_led_set_by_kbd(asus, led_value + 1);
>  		return;
>  	}
>  
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 419491d4abca..d347cffd05d5 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -172,12 +172,20 @@ enum asus_ally_mcu_hack {
>  	ASUS_WMI_ALLY_MCU_HACK_DISABLED,
>  };
>  
> +/* Used to notify hid-asus when asus-wmi changes keyboard backlight */
> +struct asus_hid_listener {
> +	struct list_head list;
> +	void (*brightness_set)(struct asus_hid_listener *listener, int brightness);
> +};
> +
>  #if IS_REACHABLE(CONFIG_ASUS_WMI)
>  void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
>  void set_ally_mcu_powersave(bool enabled);
>  int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval);
>  int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
>  int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
> +int asus_hid_register_listener(struct asus_hid_listener *cdev);
> +void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
>  #else
>  static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
>  {
> @@ -198,6 +206,13 @@ static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>  {
>  	return -ENODEV;
>  }
> +static inline int asus_hid_register_listener(struct asus_hid_listener *bdev)
> +{
> +	return -ENODEV;
> +}
> +static inline void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
> +{
> +}
>  #endif
>  
>  #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */
> 

