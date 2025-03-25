Return-Path: <linux-input+bounces-11247-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCE4A70745
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 17:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00489164722
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 16:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2682B2036ED;
	Tue, 25 Mar 2025 16:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNCGOVAw"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A50F25DCFA;
	Tue, 25 Mar 2025 16:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742921066; cv=none; b=noiGzeL1mIBwFwD0FP5QWR/ZYU31TlQi0XBvYIVUhdQI/GeeTVVP/hSCMjMRLy8yP9dNGhB/LE3rK2qb1ge/syZkd2zSwofb8p7arN9vEkxdUfRAhW9mPMcehJf9gJjq/BUewHuWzvAiA5uRiTNfc3oMBe2+VKux/O9+zGpZg78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742921066; c=relaxed/simple;
	bh=PIcZt32qJ9OHs9IeWqZg09HYSD4aJ2QgsyhopDAw0+g=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GprG2l1yrjikzI7N1ldcy8r66aUubFyeWV6S5j0hK8YYdHqfZChYLyNoZfbMHkBL7b2YdqvqFr2N0Z2NqAoVQtOnqdb6EeTm6lVwOf80ktAYOEUTzANtbvHW4Y7nIL0knMdYabSrbiot3DLiLj25PwZjrKe5lclgCFJR+DT/1GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cNCGOVAw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742921064; x=1774457064;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PIcZt32qJ9OHs9IeWqZg09HYSD4aJ2QgsyhopDAw0+g=;
  b=cNCGOVAwUfqU+kG3FTpvjPGNclO2rTt54jjwxUoGvPiGR4cJHRPsCT7e
   hwZlZ1DGiktlFyrGBRX+KWxzbJ3dZ3w2nYtD00EWUd4ScVpuciJ0VShxO
   D150f8KlU00fxZ9DqMj14F7xWuff6aggq2uv0QyvOFUlnICpdFlAiyjGm
   dcTbmhx3pqbD/+F+41Ql7HSBE6WIurK6lBmOackOA9hWwZvvi1bXECpbH
   7NrvHC0c6VV5uMLBZtW1pQqdwpO0xc9assIGjRXF8O46hZeojH7FNlI4s
   1yidbGzTlV/nhX5d8wZBrKRT8NXVqB7qEc27C5PIkk/gxUke89GSKz592
   g==;
X-CSE-ConnectionGUID: qMCppyDLQ1Kx6VB433ovWg==
X-CSE-MsgGUID: ob2oK6NcR1muYmxLvspm7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="54828915"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="54828915"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:44:23 -0700
X-CSE-ConnectionGUID: pH+x6zujRg6v3kGot+mukw==
X-CSE-MsgGUID: cOvPsRdqTOWCPfUY740Vpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="124902805"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.158])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:44:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 25 Mar 2025 18:44:16 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 07/11] platform/x86: asus-wmi: add keyboard brightness
 event handler
In-Reply-To: <20250324210151.6042-8-lkml@antheas.dev>
Message-ID: <cc762cec-c5a3-2bf4-c877-469d1a9e6c8f@linux.intel.com>
References: <20250324210151.6042-1-lkml@antheas.dev> <20250324210151.6042-8-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Mar 2025, Antheas Kapenekakis wrote:

> Currenlty, the keyboard brightness control of Asus WMI keyboards is
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
>  drivers/platform/x86/asus-wmi.c            | 39 ++++++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h | 11 ++++++
>  2 files changed, 50 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index ff1d7ccb3982f..27468d67dba09 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1536,6 +1536,45 @@ void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
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
> +		spin_unlock_irqrestore(&asus_ref.lock, flags);
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
> +		if (brightness >= 3)

Add ASUS_EV_MAX_BRIGHTNESS instead of a literal?

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
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index c513b5a732323..9adbe8abef090 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -162,11 +162,18 @@ struct asus_hid_listener {
>  	void (*brightness_set)(struct asus_hid_listener *listener, int brightness);
>  };
>  
> +enum asus_hid_event {
> +	ASUS_EV_BRTUP,
> +	ASUS_EV_BRTDOWN,
> +	ASUS_EV_BRTTOGGLE,
> +};
> +
>  #if IS_REACHABLE(CONFIG_ASUS_WMI)
>  int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
>  
>  int asus_hid_register_listener(struct asus_hid_listener *cdev);
>  void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
> +int asus_hid_event(enum asus_hid_event event);
>  #else
>  static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>  					   u32 *retval)
> @@ -181,6 +188,10 @@ static inline int asus_hid_register_listener(struct asus_hid_listener *bdev)
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


