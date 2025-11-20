Return-Path: <linux-input+bounces-16252-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D3551C745AA
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 14:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EC773352EB9
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 13:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7371D33DEE0;
	Thu, 20 Nov 2025 13:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaJhT+yj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D7833EB10
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 13:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646383; cv=none; b=m4lRG0xKpbeNUDtCUIfrHjsQpIW306gxMHTulhTW4iWHJtJ5t4Vh749XyDK2JdqxawQM0NAggUNfQsU1AoiOgKw5/hQS682kxSDC7EweD0C+g9i30FiMttcJs4Dr4dTlo7XPmOBX7cbZ+wk/p9HRYmQm8zaJDDTlD+JkyRBhGiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646383; c=relaxed/simple;
	bh=q/RzBBbR54geLjeRNuaXzOcu82NADgBW77czlX0svY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GsfWFeJrxUxf66AKZ1yN4UamQbYEqhL7zBb6UOPp7aOEbZIlrkXFlX4IAaGwWP054YhW9+NbwbpGG6hFnbPsUQfdppn3e60ejMDtiS4jjBv3mNunnB8jjTFR2B8yMPWnVwN5GjUe/7z9pbGXrcspMONtF7NHuY9qOQ4cMc1ykRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaJhT+yj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso14146755e9.1
        for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 05:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763646379; x=1764251179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yRrYlyq6MB+LPm+0vyKrUlMEhZx2nqZlo8Y6ClpRSzU=;
        b=MaJhT+yjzkiy+2f2VUIOZJsSxcWJqSRUvjwLPhrjiWfIizQdSvytG0RBwVHPL2i28i
         xIfj2FWP7quCVZWt7s/gvQxKve9PkiABEed0m4ouzZrVevxJ1L6FeOFx5BdU7jlntvww
         XyySiO4ymsa+VcIhHNhHyHxEIz/X5OICggM+DOGtCoGORGGa10ZuOKS/1d3Xy21HmMhM
         CmsOwjGInnQrFBB8GeNajCB85KmsZfBKYwcSv+VtI4XoM1WYCB8tYPdK+ta7KiwZ+BBD
         NZfzwQ6w6PplEnuDy4yhZXjVbm3FHRRLah9AwA1yKL+c+dayuRlD76KrBb0mcELGz2n9
         QE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763646379; x=1764251179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRrYlyq6MB+LPm+0vyKrUlMEhZx2nqZlo8Y6ClpRSzU=;
        b=oB1eoiryprO0aM7Uz/SACPysOvUYnNusJ+IXYUZWXJgA7So4nm2lMYvtyqbP20buun
         wxFi++AHT2LZpyBuB3y23L7YSrPWMI3taeIXGSvbs7c0KuSv68qBgGnG19hI9kRybcBV
         fHTLaox0lhLvlEfRWSAzJA3K8yWNdLAyoxk0UfXMmXHUpe7b7lZcGgCPTA3/iTN7k2Oz
         X3jgPCPsMvNmptKByt9rrnLyiskkHAINDFMPfwWLOZZ6GoVZYlDeD/UPJvINHRrWunD1
         /ScZt/x4YghOU6PqP0Cfrs3pFKLLEAGTl/BxmLZXcqT3/aw1ZyOeUSNs9REavzafps8N
         vFMw==
X-Forwarded-Encrypted: i=1; AJvYcCVV7fygPr/ZcufVQmMYCQJFfXkdKjIGnA/I998cfE8o56W7YLeN2RcGpeCajGMF+YT/wCYVwYI4j0gJtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YytHLho4Vhqljxka0FVl7zyuPqXu6M6JphOnZ7Irc1oKHeCaHET
	QOLXPp3W7q0MDI6KoXrnir3aLP+a96IY7XNurfE/xI3Sq1RsI+2N43vz
X-Gm-Gg: ASbGnctyZcNbe0jxSWe9cLdeXRIF7T889i1M1sQmkIV5eWunr8FUmWFfomzp4SXhitP
	C+SfEKztS+2ivB5wiZahBeBjmBrErNSkNmGVsGl/omCIjidbHFmKDxglgd+QQ74JRLQohOlN1lc
	Sn4zptH4Aa/MXu3GwjHLOEbrqRDEuIg1yoSFo/yKsHVgxN05wUG7lkQjG4sFTG4Tb/bEZAWws9m
	tDU0gqacwZngDJHpudsquzYWsXQvPPZzs1Qe2Q8EGFgVf6RTy7sqsOYxQE2W2ytZF3Pb9WS0Zqo
	4oMQenLl4zZbDoNVQ8idShjmFK8rstCBJBqq6nFNEfidMNBNkJsWCgkZG+Z4NZAhdX4y/HQlYKu
	TW1MTVut548xXqLa2uCSWi9e7Imjs5D+Th1kpz39Uv/I29stF0CpSgxCuTW6vErumhx5+w7rFaV
	RCIp4e/ihRfe1p+T1v19fVxso=
X-Google-Smtp-Source: AGHT+IG5/2Ikkjw/vr6wXTuTkwLWPs4ogZfGqpr0ADQ2PD/Dkry8UtpsxQtWjV2Sct4EJWv+54FTXQ==
X-Received: by 2002:a05:600c:1ca5:b0:477:bf1:8c82 with SMTP id 5b1f17b1804b1-477b9ecec4amr35464215e9.15.1763646379214;
        Thu, 20 Nov 2025 05:46:19 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10804c8sm110277045e9.15.2025.11.20.05.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 05:46:18 -0800 (PST)
Message-ID: <89dd8c0f-dfe2-4209-af38-01a3ef6df7ba@gmail.com>
Date: Thu, 20 Nov 2025 14:46:18 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/11] platform/x86: asus-wmi: Add support for multiple
 kbd led handlers
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251120094617.11672-1-lkml@antheas.dev>
 <20251120094617.11672-8-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251120094617.11672-8-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/20/25 10:46, Antheas Kapenekakis wrote:
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
>  drivers/platform/x86/asus-wmi.c            | 174 ++++++++++++++++++---
>  include/linux/platform_data/x86/asus-wmi.h |  17 ++
>  2 files changed, 167 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index e72a2b5d158e..5f23aedbf34f 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -36,6 +36,7 @@
>  #include <linux/rfkill.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
> +#include <linux/spinlock.h>
>  #include <linux/types.h>
>  #include <linux/units.h>
>  
> @@ -258,6 +259,9 @@ struct asus_wmi {
>  	int tpd_led_wk;
>  	struct led_classdev kbd_led;
>  	int kbd_led_wk;
> +	bool kbd_led_notify;
> +	bool kbd_led_avail;
> +	bool kbd_led_registered;
>  	struct led_classdev lightbar_led;
>  	int lightbar_led_wk;
>  	struct led_classdev micmute_led;
> @@ -266,6 +270,7 @@ struct asus_wmi {
>  	struct work_struct tpd_led_work;
>  	struct work_struct wlan_led_work;
>  	struct work_struct lightbar_led_work;
> +	struct work_struct kbd_led_work;
>  
>  	struct asus_rfkill wlan;
>  	struct asus_rfkill bluetooth;
> @@ -1530,6 +1535,99 @@ static void asus_wmi_battery_exit(struct asus_wmi *asus)
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
> +	 * asus variables are read-only after .asus is set. Except the led cdev
> +	 * device if not kbd_led_avail. That becomes read-only after the
> +	 * first hid-asus listener registers and triggers the work queue. It is
> +	 * then not referenced again until unregistering, which happens after
> +	 * .asus ref is dropped. Since .asus needs to be accessed by hid-asus
> +	 * IRQs to check if forwarding events is possible, a spinlock is used.
> +	 */
What are "That" and "It" referring to in this context?

Are you absolutely sure you want to begin a sentence with "Except"?

On "ref is dropped" I would continue with ": since .asus .....".
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
Are you sure this has to be protected by the guard too?
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
> +					    &asus->kbd_led);
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
> @@ -1576,7 +1674,8 @@ static void kbd_led_update(struct asus_wmi *asus)
>  {
>  	int ctrl_param = 0;
>  
> -	ctrl_param = 0x80 | (asus->kbd_led_wk & 0x7F);
> +	scoped_guard(spinlock_irqsave, &asus_ref.lock)
> +		ctrl_param = 0x80 | (asus->kbd_led_wk & 0x7F);
>  	asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT, ctrl_param, NULL);
>  }
>  
> @@ -1609,14 +1708,23 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
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
> @@ -1631,10 +1739,11 @@ static void kbd_led_set(struct led_classdev *led_cdev,
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
> @@ -1644,10 +1753,18 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
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
> @@ -1759,7 +1876,9 @@ static int camera_led_set(struct led_classdev *led_cdev,
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
> @@ -1797,22 +1916,25 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
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
> +	} else
> +		asus->kbd_led_wk = -1;
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
> @@ -4272,6 +4394,7 @@ static int asus_wmi_get_event_code(union acpi_object *obj)
>  
>  static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>  {
> +	enum led_brightness led_value;
>  	unsigned int key_value = 1;
>  	bool autorelease = 1;
>  
> @@ -4288,19 +4411,22 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
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
> index 8a515179113d..1165039013b1 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -163,11 +163,20 @@ enum asus_ally_mcu_hack {
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
>  int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
>  int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
> +
> +int asus_hid_register_listener(struct asus_hid_listener *cdev);
> +void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
>  #else
>  static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
>  {
> @@ -184,6 +193,14 @@ static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
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

