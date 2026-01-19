Return-Path: <linux-input+bounces-17193-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD19CD3A3DE
	for <lists+linux-input@lfdr.de>; Mon, 19 Jan 2026 10:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B73B3067DFA
	for <lists+linux-input@lfdr.de>; Mon, 19 Jan 2026 09:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75663093C7;
	Mon, 19 Jan 2026 09:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SSP1nIuo"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E463093C4;
	Mon, 19 Jan 2026 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816407; cv=none; b=NmJtQwS4u50/RoyBo/AqEH2PEAf6MDIMnMV0RNKL0UsSkGX2DiQiRKQ6thplygUYOy//C7HCMlLd6euW8EQrxWk2rIyiVCFKKuRYTsWKBMXBkj7fZvwsMHaVpPeUMJ/ZGHjYdvTYUxsR3ysc8wWhzJAhGHsQOOH7fcAMuerJWN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816407; c=relaxed/simple;
	bh=5d0QgacA1X7g+lUoXCcESXdCFh8NZmsGuEJu1IUan8k=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=C6Zk/nkxz8weIk2MeJUuGPtYxFsLFl3W4RN3A2vCMWxmONau6q8KAMYBbJ5hfMkTmR45XtQZoYBwr9wuW4dm8TIz5IQ/ZA5el0jvLF3ATL2hmSOhatt5R3gQF2AIdP+1UUM38EE+oXKzSn/WQSwrwmn3rmpJ1zCjwc+B28yKjxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SSP1nIuo; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768816405; x=1800352405;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=5d0QgacA1X7g+lUoXCcESXdCFh8NZmsGuEJu1IUan8k=;
  b=SSP1nIuoYaH1Gq79Z+H9qvzI9QOkWLn7w26euzrFDOtH8Zb+0ReeWXwp
   qofrzNvFPhRkODd6KjQMZbSPLb3wA9N6MmKjMjmqqKfIv1vUBu5HcHsYo
   SG9TWBWSMge5/CoD9YIM9mm+GK7K7lJXz6Mkqgj/iN+yLi6zNykpJnCko
   IIdOG4/mjweb0MQuQjb8xZ3E832NWibCI++I0wlUwxChOxuiF1mwnBqmU
   vKdmcAAMiTcaMzvEGDVZMd5q9G6aSDW6G+AhCilbiq9Fdpq0XbfUCmULf
   ywvWv+CcdGbWf/5dpvuYBbYe2k8fUhxGEns4FaZpxflxQGssyLC3F5tx+
   g==;
X-CSE-ConnectionGUID: 5SVQgxMTRkO9EQxlKzsq4A==
X-CSE-MsgGUID: QT5F4SNFRAu1mqKAxpbgRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70189215"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="70189215"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 01:53:24 -0800
X-CSE-ConnectionGUID: fDIQfvMsQ8WBYG6Xy8lmEg==
X-CSE-MsgGUID: +4vs/yeNR5C2WQz6laxeCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="210314391"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.93])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 01:53:20 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 Jan 2026 11:53:16 +0200 (EET)
To: Denis Benato <denis.benato@linux.dev>
cc: Antheas Kapenekakis <lkml@antheas.dev>, 
    platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v11 07/11] platform/x86: asus-wmi: Add support for multiple
 kbd led handlers
In-Reply-To: <22651aa1-5677-4d76-8850-49e6a348a257@linux.dev>
Message-ID: <73924a7a-ab91-a11d-313e-5f94f73f5e53@linux.intel.com>
References: <20260116133150.5606-1-lkml@antheas.dev> <20260116133150.5606-8-lkml@antheas.dev> <3354c446-3e1c-40c7-ac08-43b3ef630d91@linux.dev> <CAGwozwF0KaG0VJDJSPWfX8DVty-nZ+m8_ugDOk9wwHr+UbvYQA@mail.gmail.com> <2f7c8e80-274e-4cec-98bf-cd9cc49fb363@linux.dev>
 <CAGwozwEEd8+Gfrs=9zX2ES-tLpNQLmcWicRqHaWgd_UsCsHjPg@mail.gmail.com> <22651aa1-5677-4d76-8850-49e6a348a257@linux.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 17 Jan 2026, Denis Benato wrote:
> On 1/17/26 15:11, Antheas Kapenekakis wrote:
> > On Sat, 17 Jan 2026 at 14:56, Denis Benato <denis.benato@linux.dev> wrote:
> >>
> >> On 1/17/26 14:49, Antheas Kapenekakis wrote:
> >>> On Sat, 17 Jan 2026 at 14:16, Denis Benato <denis.benato@linux.dev> wrote:
> >>>> On 1/16/26 14:31, Antheas Kapenekakis wrote:
> >>>>> Some devices, such as the Z13 have multiple Aura devices connected
> >>>>> to them by USB. In addition, they might have a WMI interface for
> >>>>> RGB. In Windows, Armoury Crate exposes a unified brightness slider
> >>>>> for all of them, with 3 brightness levels.
> >>>>>
> >>>>> Therefore, to be synergistic in Linux, and support existing tooling
> >>>>> such as UPower, allow adding listeners to the RGB device of the WMI
> >>>>> interface. If WMI does not exist, lazy initialize the interface.
> >>>>>
> >>>>> Since hid-asus and asus-wmi can both interact with the led objects
> >>>>> including from an atomic context, protect the brightness access with a
> >>>>> spinlock and update the values from a workqueue. Use this workqueue to
> >>>>> also process WMI keyboard events, so they are handled asynchronously.
> >>>>>
> >>>>> Acked-by: Benjamin Tissoires <bentiss@kernel.org>
> >>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>>> ---
> >>>>>  drivers/platform/x86/asus-wmi.c            | 183 ++++++++++++++++++---
> >>>>>  include/linux/platform_data/x86/asus-wmi.h |  15 ++
> >>>>>  2 files changed, 173 insertions(+), 25 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> >>>>> index 4aec7ec69250..df2365efb2b8 100644
> >>>>> --- a/drivers/platform/x86/asus-wmi.c
> >>>>> +++ b/drivers/platform/x86/asus-wmi.c
> >>>>> @@ -31,13 +31,13 @@
> >>>>>  #include <linux/pci.h>
> >>>>>  #include <linux/pci_hotplug.h>
> >>>>>  #include <linux/platform_data/x86/asus-wmi.h>
> >>>>> -#include <linux/platform_data/x86/asus-wmi-leds-ids.h>
> >>>>>  #include <linux/platform_device.h>
> >>>>>  #include <linux/platform_profile.h>
> >>>>>  #include <linux/power_supply.h>
> >>>>>  #include <linux/rfkill.h>
> >>>>>  #include <linux/seq_file.h>
> >>>>>  #include <linux/slab.h>
> >>>>> +#include <linux/spinlock.h>
> >>>>>  #include <linux/types.h>
> >>>>>  #include <linux/units.h>
> >>>>>
> >>>>> @@ -256,6 +256,9 @@ struct asus_wmi {
> >>>>>       int tpd_led_wk;
> >>>>>       struct led_classdev kbd_led;
> >>>>>       int kbd_led_wk;
> >>>>> +     bool kbd_led_notify;
> >>>>> +     bool kbd_led_avail;
> >>>>> +     bool kbd_led_registered;
> >>>>>       struct led_classdev lightbar_led;
> >>>>>       int lightbar_led_wk;
> >>>>>       struct led_classdev micmute_led;
> >>>>> @@ -264,6 +267,7 @@ struct asus_wmi {
> >>>>>       struct work_struct tpd_led_work;
> >>>>>       struct work_struct wlan_led_work;
> >>>>>       struct work_struct lightbar_led_work;
> >>>>> +     struct work_struct kbd_led_work;
> >>>>>
> >>>>>       struct asus_rfkill wlan;
> >>>>>       struct asus_rfkill bluetooth;
> >>>>> @@ -1615,6 +1619,106 @@ static void asus_wmi_battery_exit(struct asus_wmi *asus)
> >>>>>
> >>>>>  /* LEDs ***********************************************************************/
> >>>>>
> >>>>> +struct asus_hid_ref {
> >>>>> +     struct list_head listeners;
> >>>>> +     struct asus_wmi *asus;
> >>>>> +     /* Protects concurrent access from hid-asus and asus-wmi to leds */
> >>>>> +     spinlock_t lock;
> >>>>> +};
> >>>>> +
> >>>>> +static struct asus_hid_ref asus_ref = {
> >>>>> +     .listeners = LIST_HEAD_INIT(asus_ref.listeners),
> >>>>> +     .asus = NULL,
> >>>>> +     /*
> >>>>> +      * Protects .asus, .asus.kbd_led_{wk,notify}, and .listener refs. Other
> >>>>> +      * asus variables are read-only after .asus is set.
> >>>>> +      *
> >>>>> +      * The led cdev device is not protected because it calls backlight_get
> >>>>> +      * during initialization, which would result in a nested lock attempt.
> >>>>> +      *
> >>>>> +      * The led cdev is safe to access without a lock because if
> >>>>> +      * kbd_led_avail is true it is initialized before .asus is set and never
> >>>>> +      * changed until .asus is dropped. If kbd_led_avail is false, the led
> >>>>> +      * cdev is registered by the workqueue, which is single-threaded and
> >>>>> +      * cancelled before asus-wmi would access the led cdev to unregister it.
> >>>>> +      *
> >>>>> +      * A spinlock is used, because the protected variables can be accessed
> >>>>> +      * from an IRQ context from asus-hid.
> >>>>> +      */
> >>>>> +     .lock = __SPIN_LOCK_UNLOCKED(asus_ref.lock),
> >>>>> +};
> >>>>> +
> >>>>> +/*
> >>>>> + * Allows registering hid-asus listeners that want to be notified of
> >>>>> + * keyboard backlight changes.
> >>>>> + */
> >>>>> +int asus_hid_register_listener(struct asus_hid_listener *bdev)
> >>>>> +{
> >>>>> +     struct asus_wmi *asus;
> >>>>> +
> >>>>> +     guard(spinlock_irqsave)(&asus_ref.lock);
> >>>>> +     list_add_tail(&bdev->list, &asus_ref.listeners);
> >>>>> +     asus = asus_ref.asus;
> >>>>> +     if (asus)
> >>>>> +             queue_work(asus->led_workqueue, &asus->kbd_led_work);
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +EXPORT_SYMBOL_GPL(asus_hid_register_listener);
> >>>>> +
> >>>>> +/*
> >>>>> + * Allows unregistering hid-asus listeners that were added with
> >>>>> + * asus_hid_register_listener().
> >>>>> + */
> >>>>> +void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
> >>>>> +{
> >>>>> +     guard(spinlock_irqsave)(&asus_ref.lock);
> >>>>> +     list_del(&bdev->list);
> >>>>> +}
> >>>>> +EXPORT_SYMBOL_GPL(asus_hid_unregister_listener);
> >>>>> +
> >>>>> +static void do_kbd_led_set(struct led_classdev *led_cdev, int value);
> >>>>> +
> >>>>> +static void kbd_led_update_all(struct work_struct *work)
> >>>>> +{
> >>>>> +     struct asus_wmi *asus;
> >>>>> +     bool registered, notify;
> >>>>> +     int ret, value;
> >>>>> +
> >>>>> +     asus = container_of(work, struct asus_wmi, kbd_led_work);
> >>>>> +
> >>>>> +     scoped_guard(spinlock_irqsave, &asus_ref.lock) {
> >>>>> +             registered = asus->kbd_led_registered;
> >>>>> +             value = asus->kbd_led_wk;
> >>>>> +             notify = asus->kbd_led_notify;
> >>>>> +     }
> >>>>> +
> >>>>> +     if (!registered) {
> >>>>> +             /*
> >>>>> +              * This workqueue runs under asus-wmi, which means probe has
> >>>>> +              * completed and asus-wmi will keep running until it finishes.
> >>>>> +              * Therefore, we can safely register the LED without holding
> >>>>> +              * a spinlock.
> >>>>> +              */
> >>>>> +             ret = devm_led_classdev_register(&asus->platform_device->dev,
> >>>>> +                                              &asus->kbd_led);
> >>>>> +             if (!ret) {
> >>>>> +                     scoped_guard(spinlock_irqsave, &asus_ref.lock)
> >>>>> +                             asus->kbd_led_registered = true;
> >>>>> +             } else {
> >>>>> +                     pr_warn("Failed to register keyboard backlight LED: %d\n", ret);
> >>>>> +                     return;
> >>>>> +             }
> >>>>> +     }
> >>>>> +
> >>>>> +     if (value >= 0)
> >>>>> +             do_kbd_led_set(&asus->kbd_led, value);
> >>>>> +     if (notify) {
> >>>>> +             scoped_guard(spinlock_irqsave, &asus_ref.lock)
> >>>>> +                     asus->kbd_led_notify = false;
> >>>>> +             led_classdev_notify_brightness_hw_changed(&asus->kbd_led, value);
> >>>>> +     }
> >>>>> +}
> >>>>> +
> >>>>>  /*
> >>>>>   * These functions actually update the LED's, and are called from a
> >>>>>   * workqueue. By doing this as separate work rather than when the LED
> >>>>> @@ -1661,7 +1765,8 @@ static void kbd_led_update(struct asus_wmi *asus)
> >>>>>  {
> >>>>>       int ctrl_param = 0;
> >>>>>
> >>>>> -     ctrl_param = 0x80 | (asus->kbd_led_wk & 0x7F);
> >>>>> +     scoped_guard(spinlock_irqsave, &asus_ref.lock)
> >>>>> +             ctrl_param = 0x80 | (asus->kbd_led_wk & 0x7F);
> >>>>>       asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT, ctrl_param, NULL);
> >>>>>  }
> >>>>>
> >>>>> @@ -1694,14 +1799,23 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
> >>>>>
> >>>>>  static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
> >>>>>  {
> >>>>> +     struct asus_hid_listener *listener;
> >>>>>       struct asus_wmi *asus;
> >>>>>       int max_level;
> >>>>>
> >>>>>       asus = container_of(led_cdev, struct asus_wmi, kbd_led);
> >>>>>       max_level = asus->kbd_led.max_brightness;
> >>>>>
> >>>>> -     asus->kbd_led_wk = clamp_val(value, 0, max_level);
> >>>>> -     kbd_led_update(asus);
> >>>>> +     scoped_guard(spinlock_irqsave, &asus_ref.lock)
> >>>>> +             asus->kbd_led_wk = clamp_val(value, 0, max_level);
> >>>>> +
> >>>>> +     if (asus->kbd_led_avail)
> >>>>> +             kbd_led_update(asus);
> >>>>> +
> >>>>> +     scoped_guard(spinlock_irqsave, &asus_ref.lock) {
> >>>>> +             list_for_each_entry(listener, &asus_ref.listeners, list)
> >>>>> +                     listener->brightness_set(listener, asus->kbd_led_wk);
> >>>>> +     }
> >>>>>  }
> >>>>>
> >>>>>  static int kbd_led_set(struct led_classdev *led_cdev, enum led_brightness value)
> >>>>> @@ -1716,10 +1830,11 @@ static int kbd_led_set(struct led_classdev *led_cdev, enum led_brightness value)
> >>>>>
> >>>>>  static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
> >>>>>  {
> >>>>> -     struct led_classdev *led_cdev = &asus->kbd_led;
> >>>>> -
> >>>>> -     do_kbd_led_set(led_cdev, value);
> >>>>> -     led_classdev_notify_brightness_hw_changed(led_cdev, asus->kbd_led_wk);
> >>>>> +     scoped_guard(spinlock_irqsave, &asus_ref.lock) {
> >>>>> +             asus->kbd_led_wk = value;
> >>>>> +             asus->kbd_led_notify = true;
> >>>>> +     }
> >>>>> +     queue_work(asus->led_workqueue, &asus->kbd_led_work);
> >>>>>  }
> >>>>>
> >>>>>  static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
> >>>>> @@ -1729,10 +1844,18 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
> >>>>>
> >>>>>       asus = container_of(led_cdev, struct asus_wmi, kbd_led);
> >>>>>
> >>>>> +     scoped_guard(spinlock_irqsave, &asus_ref.lock) {
> >>>>> +             if (!asus->kbd_led_avail)
> >>>>> +                     return asus->kbd_led_wk;
> >>>>> +     }
> >>>>> +
> >>>>>       retval = kbd_led_read(asus, &value, NULL);
> >>>>>       if (retval < 0)
> >>>>>               return retval;
> >>>>>
> >>>>> +     scoped_guard(spinlock_irqsave, &asus_ref.lock)
> >>>>> +             asus->kbd_led_wk = value;
> >>>>> +
> >>>>>       return value;
> >>>>>  }
> >>>>>
> >>>>> @@ -1844,7 +1967,9 @@ static int camera_led_set(struct led_classdev *led_cdev,
> >>>>>
> >>>>>  static void asus_wmi_led_exit(struct asus_wmi *asus)
> >>>>>  {
> >>>>> -     led_classdev_unregister(&asus->kbd_led);
> >>>>> +     scoped_guard(spinlock_irqsave, &asus_ref.lock)
> >>>>> +             asus_ref.asus = NULL;
> >>>>> +
> >>>>>       led_classdev_unregister(&asus->tpd_led);
> >>>>>       led_classdev_unregister(&asus->wlan_led);
> >>>>>       led_classdev_unregister(&asus->lightbar_led);
> >>>>> @@ -1882,22 +2007,26 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
> >>>>>                       goto error;
> >>>>>       }
> >>>>>
> >>>>> -     if (!kbd_led_read(asus, &led_val, NULL) && !dmi_check_system(asus_use_hid_led_dmi_ids)) {
> >>>>> -             pr_info("using asus-wmi for asus::kbd_backlight\n");
> >>>>> -             asus->kbd_led_wk = led_val;
> >>>>> -             asus->kbd_led.name = "asus::kbd_backlight";
> >>>>> -             asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> >>>>> -             asus->kbd_led.brightness_set_blocking = kbd_led_set;
> >>>>> -             asus->kbd_led.brightness_get = kbd_led_get;
> >>>>> -             asus->kbd_led.max_brightness = 3;
> >>>>> +     asus->kbd_led.name = "asus::kbd_backlight";
> >>>>> +     asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> >>>>> +     asus->kbd_led.brightness_set_blocking = kbd_led_set;
> >>>>> +     asus->kbd_led.brightness_get = kbd_led_get;
> >>>>> +     asus->kbd_led.max_brightness = 3;
> >>>>> +     asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
> >>>>> +     INIT_WORK(&asus->kbd_led_work, kbd_led_update_all);
> >>>>>
> >>>>> +     if (asus->kbd_led_avail) {
> >>>>> +             asus->kbd_led_wk = led_val;
> >>>>>               if (num_rgb_groups != 0)
> >>>>>                       asus->kbd_led.groups = kbd_rgb_mode_groups;
> >>>>> +     } else {
> >>>>> +             asus->kbd_led_wk = -1;
> >>>>> +     }
> >>>>>
> >>>>> -             rv = led_classdev_register(&asus->platform_device->dev,
> >>>>> -                                        &asus->kbd_led);
> >>>>> -             if (rv)
> >>>>> -                     goto error;
> >>>>> +     scoped_guard(spinlock_irqsave, &asus_ref.lock) {
> >>>>> +             asus_ref.asus = asus;
> >>>>> +             if (asus->kbd_led_avail || !list_empty(&asus_ref.listeners))
> >>>>> +                     queue_work(asus->led_workqueue, &asus->kbd_led_work);
> >>>>>       }
> >>>>>
> >>>>>       if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_WIRELESS_LED)
> >>>>> @@ -4372,6 +4501,7 @@ static int asus_wmi_get_event_code(union acpi_object *obj)
> >>>>>
> >>>>>  static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
> >>>>>  {
> >>>>> +     enum led_brightness led_value;
> >>>>>       unsigned int key_value = 1;
> >>>>>       bool autorelease = 1;
> >>>>>
> >>>>> @@ -4388,19 +4518,22 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
> >>>>>               return;
> >>>>>       }
> >>>>>
> >>>>> +     scoped_guard(spinlock_irqsave, &asus_ref.lock)
> >>>>> +             led_value = asus->kbd_led_wk;
> >>>>> +
> >>>>>       if (code == NOTIFY_KBD_BRTUP) {
> >>>>> -             kbd_led_set_by_kbd(asus, asus->kbd_led_wk + 1);
> >>>>> +             kbd_led_set_by_kbd(asus, led_value + 1);
> >>>>>               return;
> >>>>>       }
> >>>>>       if (code == NOTIFY_KBD_BRTDWN) {
> >>>>> -             kbd_led_set_by_kbd(asus, asus->kbd_led_wk - 1);
> >>>>> +             kbd_led_set_by_kbd(asus, led_value - 1);
> >>>>>               return;
> >>>>>       }
> >>>>>       if (code == NOTIFY_KBD_BRTTOGGLE) {
> >>>>> -             if (asus->kbd_led_wk == asus->kbd_led.max_brightness)
> >>>>> +             if (led_value == asus->kbd_led.max_brightness)
> >>>>>                       kbd_led_set_by_kbd(asus, 0);
> >>>> This is the toggle leds button, right? I would expect that pressing the toggle
> >>>> button turns off leds if they are on and turns them on if they are off.
> >>>>
> >>>> so if (led_value > 0) { .... }.
> >>>>
> >>>> I see the previous code was equivalent to yours but is that what we want?
> >>> It is common to do 0->1->2->3->0 for the toggle. This is what is
> >>> currently done for WMI Asus keyboards and e.g., Thinkpads. This patch
> >>> unifies the behavior for USB keyboards too.
> >>>
> >>> I would argue it is better, as you do not need to reach for a
> >>> userspace slider to set a lower brightness.
> >>>
> >>> The current behavior of KDE is 0->3->0 and if the event goes to
> >>> userspace this is what happens currently. Unless the keyboard
> >>> reconnects, where brightness just stops working afterwards because
> >>> upower only probes at boot (I have a follow patch to fix this for
> >>> Duos).
> >> Whatever goes for me if hid and wmi handles them the same,
> >> especially if userspace does the same thing.
> >>
> >> In 11/11 you do:
> >>
> >> caseASUS_EV_BRTTOGGLE:
> >> if(brightness >=ASUS_EV_MAX_BRIGHTNESS)
> >> brightness =0;
> >> else
> >> brightness +=1;
> >> break;
> >> }
> >>
> >> So perhaps here you should do
> >>
> >> if (led_value >= asus->kbd_led.max_brightness)
> >>
> >>
> >> purely for consistency?
> > If I reroll the series I will do it, otherwise you can do a followup
>
> The current version is functionally okay.
> 
> I would only change the name of _LEGACY and see this series merged.
> 
> Or I can do it after it has been merged together with this change,
> whatever maintainers think it's best.

In general, I'd prefer we address all known things right away. This is 
kind of same as we prefer not to do back-and-forth changes within a 
series. But since this is equivalent to existing code, it would be nice to 
finally get this series merged so this particular thing can be addressed 
later.

Also, having lots of back-and-forth emails over some small thing usually 
consumes considerable amount of time from multiple people who have to 
read all the discussion through (including me), so if a review request is 
not unreasonable, it often would be the path of least resistance and least 
burdensome to just act upon the feedback instead of arguing whether it can 
be delayed.

-- 
 i.


