Return-Path: <linux-input+bounces-17166-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C35D38ECA
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 14:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56B5F300DA5E
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 13:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1672AD32;
	Sat, 17 Jan 2026 13:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TF9es2MO"
X-Original-To: linux-input@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70096500957
	for <linux-input@vger.kernel.org>; Sat, 17 Jan 2026 13:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768657538; cv=none; b=jhw6dJ3H9cRlknduU5r/A4y/Ph3XnePysOUglkxdgAfjBuLDoSYRce2uNF2oOIUOUqQSmlKcQaUOejbjNGzvwAxBzAZr3cLhG30B8sVnoVs8ka/CkMRTmdR8IKQ1KGcZn633CyXx4yiKg42AY+phI+o/NXdd76NCeMR5eE6noTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768657538; c=relaxed/simple;
	bh=p7GN1nGTTa+ADxZlFG4i7SWx1xGvvynfhHXwJ3g5r08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s2bVrntVY0fK4moLCU9H3QnHLWjd25Sb0Cpnd+d/2eNay25GCdYmSvyggHJfkW3Fz+6BoXD7LBPcQegjsnWCmtgG9iQ/y/WXVEuxXBgufkHXKMnedISvhT9RFd687HQew7bCQANUU5eXG3pLkZe7KctQycMk5v/2kQjY2nwaCHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TF9es2MO; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <cc566ef3-83a3-4bd6-af99-edd7022bd0bb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768657524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uN/8Ty4aj3x0+4Bcis3hDCb49BJ7Bs+gLLCe0D3NrgY=;
	b=TF9es2MOTd9AUL1OpoAxZXnAKjgoDKjc6vUxwDU6J4LlsfuNhnC/6q53ou4yC95kVndIpj
	/s8dLGMHaOOfkAuxs4P2G+MQcrFlNzeXEQoB0XAVrLfDIBOxzhP7P0Pzch1wHCFYg8DIZJ
	u11EjqrvrOeGLSzrD987X1CRDIDGcao=
Date: Sat, 17 Jan 2026 14:45:21 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v11 10/11] platform/x86: asus-wmi: add keyboard brightness
 event handler
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20260116133150.5606-1-lkml@antheas.dev>
 <20260116133150.5606-11-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260116133150.5606-11-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 1/16/26 14:31, Antheas Kapenekakis wrote:
> The keyboard brightness control of Asus WMI keyboards is handled in
> kernel, which leads to the shortcut going from brightness 0, to 1,
> to 2, and 3.
>
> However, for HID keyboards it is exposed as a key and handled by the
> user's desktop environment. For the toggle button, this means that
> brightness control becomes on/off. In addition, in the absence of a
> DE, the keyboard brightness does not work.
>
> Therefore, expose an event handler for the keyboard brightness control
> which can then be used by hid-asus. Since this handler is called from
> an interrupt context, defer the actual work to a workqueue.
>
> In the process, introduce ASUS_EV_MAX_BRIGHTNESS to hold the constant
> for maximum brightness since it is shared between hid-asus/asus-wmi.
Reviewed-by: Denis Benato <benato.denis96@gmail.com>
> Reviewed-by: Luke D. Jones <luke@ljones.dev>
> Tested-by: Luke D. Jones <luke@ljones.dev>
> Acked-by: Benjamin Tissoires <bentiss@kernel.org>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/platform/x86/asus-wmi.c            | 46 +++++++++++++++++++---
>  include/linux/platform_data/x86/asus-wmi.h | 13 ++++++
>  2 files changed, 54 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index df2365efb2b8..e65d91a11000 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1719,6 +1719,44 @@ static void kbd_led_update_all(struct work_struct *work)
>  	}
>  }
>  
> +/*
> + * This function is called from hid-asus to inform asus-wmi of brightness
> + * changes initiated by the keyboard backlight keys.
> + */
> +int asus_hid_event(enum asus_hid_event event)
> +{
> +	struct asus_wmi *asus;
> +	int brightness;
> +
> +	guard(spinlock_irqsave)(&asus_ref.lock);
> +	asus = asus_ref.asus;
> +	if (!asus || !asus->kbd_led_registered)
> +		return -EBUSY;
> +
> +	brightness = asus->kbd_led_wk;
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
> +	asus->kbd_led_wk = clamp_val(brightness, 0, ASUS_EV_MAX_BRIGHTNESS);
> +	asus->kbd_led_notify = true;
> +	queue_work(asus->led_workqueue, &asus->kbd_led_work);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(asus_hid_event);
> +
>  /*
>   * These functions actually update the LED's, and are called from a
>   * workqueue. By doing this as separate work rather than when the LED
> @@ -1801,13 +1839,11 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
>  {
>  	struct asus_hid_listener *listener;
>  	struct asus_wmi *asus;
> -	int max_level;
>  
>  	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
> -	max_level = asus->kbd_led.max_brightness;
>  
>  	scoped_guard(spinlock_irqsave, &asus_ref.lock)
> -		asus->kbd_led_wk = clamp_val(value, 0, max_level);
> +		asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
>  
>  	if (asus->kbd_led_avail)
>  		kbd_led_update(asus);
> @@ -2011,7 +2047,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>  	asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
>  	asus->kbd_led.brightness_set_blocking = kbd_led_set;
>  	asus->kbd_led.brightness_get = kbd_led_get;
> -	asus->kbd_led.max_brightness = 3;
> +	asus->kbd_led.max_brightness = ASUS_EV_MAX_BRIGHTNESS;
>  	asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
>  	INIT_WORK(&asus->kbd_led_work, kbd_led_update_all);
>  
> @@ -4530,7 +4566,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>  		return;
>  	}
>  	if (code == NOTIFY_KBD_BRTTOGGLE) {
> -		if (led_value == asus->kbd_led.max_brightness)
> +		if (led_value == ASUS_EV_MAX_BRIGHTNESS)
>  			kbd_led_set_by_kbd(asus, 0);
>  		else
>  			kbd_led_set_by_kbd(asus, led_value + 1);
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index d347cffd05d5..7b872b5d0960 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -178,6 +178,14 @@ struct asus_hid_listener {
>  	void (*brightness_set)(struct asus_hid_listener *listener, int brightness);
>  };
>  
> +enum asus_hid_event {
> +	ASUS_EV_BRTUP,
> +	ASUS_EV_BRTDOWN,
> +	ASUS_EV_BRTTOGGLE,
> +};
> +
> +#define ASUS_EV_MAX_BRIGHTNESS 3
> +
>  #if IS_REACHABLE(CONFIG_ASUS_WMI)
>  void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
>  void set_ally_mcu_powersave(bool enabled);
> @@ -186,6 +194,7 @@ int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
>  int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
>  int asus_hid_register_listener(struct asus_hid_listener *cdev);
>  void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
> +int asus_hid_event(enum asus_hid_event event);
>  #else
>  static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
>  {
> @@ -213,6 +222,10 @@ static inline int asus_hid_register_listener(struct asus_hid_listener *bdev)
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

