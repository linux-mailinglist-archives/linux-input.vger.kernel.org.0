Return-Path: <linux-input+bounces-11287-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31446A71322
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 09:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C65F1886594
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 08:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB241A3031;
	Wed, 26 Mar 2025 08:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JgZ2J85D"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4824440C;
	Wed, 26 Mar 2025 08:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742979291; cv=none; b=oAlVO5wx1+tN7D278JH23elVdlw+lAAl6QQAz4M33YCChsrA1eLwolSMCwuuh+0KV/R4FGcZJt/FpGHkkTERY+xRvy85dcZ1hYUEV7um5mGNyJjJ6QDOcsW8Ipvzo2x2VZ0iXQk6qdazfQ4rJqwZFxUoJCCySJFH5bmB/VtknOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742979291; c=relaxed/simple;
	bh=ntJJMqYup2C7GnXqXY+2wcnT/Nc4wmEzP7fXkMK8CvU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ng6jZQpmfzG+O9x41aBtY4ygN/W3KaghnhQVsxNXyKj5QHR5M+O3ktHPCsyDx6A4sXLWZrkYnadtqAQRdezzc0/pjDFPJSWbQv2yPLv8CvdvUfuspZ1i32iq0xSKshdeT+f8BBN8N0uMMqdt7Niz74Q/6bwIshHZyfZvnSrlkDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JgZ2J85D; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742979290; x=1774515290;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ntJJMqYup2C7GnXqXY+2wcnT/Nc4wmEzP7fXkMK8CvU=;
  b=JgZ2J85D6WzNaK41wyfam2Mlwr0o7Z2KpszFnz8lhaiJIHhMD/owaID6
   iIZDP35Wnt4SG8Iant7KqRc429tqZBJe10X+fagApqj9AVP56vt+0v8cZ
   DMGo1cyvebmvb8JeU2oA4imusKQQp/C3fbqjDGCUXEJToYGtnUktJBHL6
   b2MfENPBvoyL58TeRy4IskUbdOSM3hZdWSv4qneRraykUgy7NM/MvxF4L
   7GBvXgfl0FxlFYueCTwWzeIyl2QPWa6fLxjabOqnpc51dHRul3GKA6VHj
   NOLyDUgBIgaEeBObppi5hZdNYRo9IrrFsVlnkg3gntpQkqJUSwVcs3dlu
   Q==;
X-CSE-ConnectionGUID: 2i4RowruQzqVV9qO/FExYQ==
X-CSE-MsgGUID: hPUfSCLLRJ6kJpmOggrlRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="55250318"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="55250318"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 01:54:49 -0700
X-CSE-ConnectionGUID: 1hUn08HHT2ykBVfxDeN2XA==
X-CSE-MsgGUID: 6kfjFhWTSba48pspmud0OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="125494583"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.5])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 01:54:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 26 Mar 2025 10:54:41 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 09/11] HID: asus: add basic RGB support
In-Reply-To: <20250325184601.10990-10-lkml@antheas.dev>
Message-ID: <f04e6a59-cb72-9ca9-2c98-85702b6194fa@linux.intel.com>
References: <20250325184601.10990-1-lkml@antheas.dev> <20250325184601.10990-10-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Mar 2025, Antheas Kapenekakis wrote:

> Adds basic RGB support to hid-asus through multi-index. The interface
> works quite well, but has not gone through much stability testing.
> Applied on demand, if userspace does not touch the RGB sysfs, not
> even initialization is done. Ensuring compatibility with existing
> userspace programs.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/Kconfig    |   1 +
>  drivers/hid/hid-asus.c | 171 +++++++++++++++++++++++++++++++++++++----
>  2 files changed, 156 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index dfc245867a46a..d324c6ab997de 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -151,6 +151,7 @@ config HID_APPLEIR
>  config HID_ASUS
>  	tristate "Asus"
>  	depends on USB_HID
> +	depends on LEDS_CLASS_MULTICOLOR
>  	depends on LEDS_CLASS
>  	depends on ASUS_WMI || ASUS_WMI=n
>  	select POWER_SUPPLY
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index a4d1160460935..c135c9ff87b74 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -23,6 +23,7 @@
>  /*
>   */
>  
> +#include <linux/array_size.h>
>  #include <linux/dmi.h>
>  #include <linux/hid.h>
>  #include <linux/module.h>
> @@ -30,6 +31,7 @@
>  #include <linux/input/mt.h>
>  #include <linux/usb.h> /* For to_usb_interface for T100 touchpad intf check */
>  #include <linux/power_supply.h>
> +#include <linux/led-class-multicolor.h>
>  #include <linux/leds.h>
>  
>  #include "hid-ids.h"
> @@ -52,6 +54,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define FEATURE_KBD_REPORT_SIZE 64
>  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
>  #define FEATURE_KBD_LED_REPORT_ID2 0x5e
> +#define FEATURE_KBD_LED_REPORT_SIZE 7
>  
>  #define SUPPORT_KBD_BACKLIGHT BIT(0)
>  
> @@ -86,6 +89,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
>  #define QUIRK_HANDLE_GENERIC		BIT(13)
> +#define QUIRK_ROG_NKEY_RGB		BIT(14)
>  
>  #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>  						 QUIRK_NO_INIT_REPORTS | \
> @@ -98,9 +102,15 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  
>  struct asus_kbd_leds {
>  	struct asus_hid_listener listener;
> +	struct led_classdev_mc mc_led;
> +	struct mc_subled subled_info[3];
>  	struct hid_device *hdev;
>  	struct work_struct work;
>  	unsigned int brightness;
> +	u8 rgb_colors[3];
> +	bool rgb_init;
> +	bool rgb_set;
> +	bool rgb_registered;
>  	spinlock_t lock;
>  	bool removed;
>  };
> @@ -501,23 +511,67 @@ static void asus_schedule_work(struct asus_kbd_leds *led)
>  	spin_unlock_irqrestore(&led->lock, flags);
>  }
>  
> -static void asus_kbd_backlight_set(struct asus_hid_listener *listener,
> +static void do_asus_kbd_backlight_set(struct asus_kbd_leds *led, int brightness)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&led->lock, flags);
> +	led->brightness = brightness;
> +	spin_unlock_irqrestore(&led->lock, flags);
> +
> +	asus_schedule_work(led);
> +}
> +
> +static void asus_kbd_listener_set(struct asus_hid_listener *listener,
>  				   int brightness)
>  {
>  	struct asus_kbd_leds *led = container_of(listener, struct asus_kbd_leds,
>  						 listener);
> +	do_asus_kbd_backlight_set(led, brightness);
> +	if (led->rgb_registered) {
> +		led->mc_led.led_cdev.brightness = brightness;
> +		led_classdev_notify_brightness_hw_changed(&led->mc_led.led_cdev,
> +							  brightness);
> +	}
> +}
> +
> +static void asus_kbd_brightness_set(struct led_classdev *led_cdev,
> +				    enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
> +	struct asus_kbd_leds *led = container_of(mc_cdev, struct asus_kbd_leds,
> +						 mc_led);
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&led->lock, flags);
> -	led->brightness = brightness;
> +	led->rgb_colors[0] = mc_cdev->subled_info[0].intensity;
> +	led->rgb_colors[1] = mc_cdev->subled_info[1].intensity;
> +	led->rgb_colors[2] = mc_cdev->subled_info[2].intensity;
> +	led->rgb_set = true;
>  	spin_unlock_irqrestore(&led->lock, flags);
>  
> -	asus_schedule_work(led);
> +	do_asus_kbd_backlight_set(led, brightness);
> +}
> +
> +static enum led_brightness asus_kbd_brightness_get(struct led_classdev *led_cdev)
> +{
> +	struct led_classdev_mc *mc_led;
> +	struct asus_kbd_leds *led;
> +	enum led_brightness brightness;
> +	unsigned long flags;
> +
> +	mc_led = lcdev_to_mccdev(led_cdev);
> +	led = container_of(mc_led, struct asus_kbd_leds, mc_led);
> +
> +	spin_lock_irqsave(&led->lock, flags);
> +	brightness = led->brightness;
> +	spin_unlock_irqrestore(&led->lock, flags);
> +
> +	return brightness;
>  }
>  
> -static void asus_kbd_backlight_work(struct work_struct *work)
> +static void asus_kbd_backlight_work(struct asus_kbd_leds *led)
>  {
> -	struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
>  	u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
>  	int ret;
>  	unsigned long flags;
> @@ -531,10 +585,68 @@ static void asus_kbd_backlight_work(struct work_struct *work)
>  		hid_err(led->hdev, "Asus failed to set keyboard backlight: %d\n", ret);
>  }
>  
> +static void asus_kbd_rgb_work(struct asus_kbd_leds *led)
> +{
> +	u8 rgb_buf[][FEATURE_KBD_LED_REPORT_SIZE] = {
> +		{ FEATURE_KBD_LED_REPORT_ID1, 0xB3 }, /* set mode */
> +		{ FEATURE_KBD_LED_REPORT_ID1, 0xB5 }, /* apply mode */
> +		{ FEATURE_KBD_LED_REPORT_ID1, 0xB4 }, /* save to mem */

Hmm, I don't know why I didn't notice this the last scan... Since you're 
anyway adding those comments to explain the literals (I assume), wouldn't 
it be simply better to add defines for 0xB* and forgo the comments.

Usually when one adds any comment, it's always good to ask first oneself 
if things could be named such that the code itself explains itself. This
leaves comments mostly for places where something really 
odd/tricky/complex occurs as the rest can be covered by simply naming 
better.

> +	};
> +	unsigned long flags;
> +	uint8_t colors[3];
> +	bool rgb_init, rgb_set;
> +	int ret;
> +
> +	spin_lock_irqsave(&led->lock, flags);
> +	rgb_init = led->rgb_init;
> +	rgb_set = led->rgb_set;
> +	led->rgb_set = false;
> +	colors[0] = led->rgb_colors[0];
> +	colors[1] = led->rgb_colors[1];
> +	colors[2] = led->rgb_colors[2];
> +	spin_unlock_irqrestore(&led->lock, flags);
> +
> +	if (!rgb_set)
> +		return;
> +
> +	if (rgb_init) {
> +		ret = asus_kbd_init(led->hdev, FEATURE_KBD_LED_REPORT_ID1);
> +		if (ret < 0) {
> +			hid_err(led->hdev, "Asus failed to init RGB: %d\n", ret);
> +			return;
> +		}
> +		spin_lock_irqsave(&led->lock, flags);
> +		led->rgb_init = false;
> +		spin_unlock_irqrestore(&led->lock, flags);
> +	}
> +
> +	/* Protocol is: 54b3 zone (0=all) mode (0=solid) RGB */

BTW, this comment is very cryptic to me and I'm unable to connect it with 
the code below. My only guess is that each non-parenthesized word is 
explaining one index but things don't add up given what rgb_buf[0][0] and 
[0][1] have.

> +	rgb_buf[0][4] = colors[0];
> +	rgb_buf[0][5] = colors[1];
> +	rgb_buf[0][6] = colors[2];
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(rgb_buf); i++) {
> +		ret = asus_kbd_set_report(led->hdev, rgb_buf[i], sizeof(rgb_buf[i]));
> +		if (ret < 0) {
> +			hid_err(led->hdev, "Asus failed to set RGB: %d\n", ret);
> +			return;
> +		}
> +	}
> +}
> +
> +static void asus_kbd_work(struct work_struct *work)
> +{
> +	struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds,
> +						 work);
> +	asus_kbd_backlight_work(led);
> +	asus_kbd_rgb_work(led);
> +}
> +
>  static int asus_kbd_register_leds(struct hid_device *hdev)
>  {
>  	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
>  	unsigned char kbd_func;
> +	struct asus_kbd_leds *leds;
>  	int ret;
>  
>  	ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> @@ -562,20 +674,47 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>  	if (!drvdata->kbd_backlight)
>  		return -ENOMEM;
>  
> -	drvdata->kbd_backlight->removed = false;
> -	drvdata->kbd_backlight->brightness = 0;
> -	drvdata->kbd_backlight->hdev = hdev;
> -	drvdata->kbd_backlight->listener.brightness_set = asus_kbd_backlight_set;
> -	INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_backlight_work);
> +	leds = drvdata->kbd_backlight;
> +	leds->removed = false;
> +	leds->brightness = ASUS_EV_MAX_BRIGHTNESS;
> +	leds->hdev = hdev;
> +	leds->listener.brightness_set = asus_kbd_listener_set;
> +
> +	leds->rgb_colors[0] = 0;
> +	leds->rgb_colors[1] = 0;
> +	leds->rgb_colors[2] = 0;
> +	leds->rgb_init = true;
> +	leds->rgb_set = false;
> +	leds->mc_led.led_cdev.name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
> +					"asus-%s:rgb:peripheral",
> +					strlen(hdev->uniq) ?
> +					hdev->uniq : dev_name(&hdev->dev));
> +	leds->mc_led.led_cdev.flags = LED_BRIGHT_HW_CHANGED;
> +	leds->mc_led.led_cdev.max_brightness = ASUS_EV_MAX_BRIGHTNESS;
> +	leds->mc_led.led_cdev.brightness_set = asus_kbd_brightness_set;
> +	leds->mc_led.led_cdev.brightness_get = asus_kbd_brightness_get;
> +	leds->mc_led.subled_info = leds->subled_info;
> +	leds->mc_led.num_colors = ARRAY_SIZE(leds->subled_info);
> +	leds->subled_info[0].color_index = LED_COLOR_ID_RED;
> +	leds->subled_info[1].color_index = LED_COLOR_ID_GREEN;
> +	leds->subled_info[2].color_index = LED_COLOR_ID_BLUE;
> +
> +	INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_work);
>  	spin_lock_init(&drvdata->kbd_backlight->lock);
>  
>  	ret = asus_hid_register_listener(&drvdata->kbd_backlight->listener);
> -	if (ret < 0) {
> -		/* No need to have this still around */
> -		devm_kfree(&hdev->dev, drvdata->kbd_backlight);
> +	/* Asus-wmi might not be accessible so this is not fatal. */
> +	if (!ret)
> +		hid_warn(hdev, "Asus-wmi brightness listener not registered\n");

Is the condition correct way around given the message?

Please also note that you don't need to send an update every day or so 
after minor comments like this. We're in merge window currently which 
means I likely won't be applying any next material until -rc1 has been 
released.

> +	if (drvdata->quirks & QUIRK_ROG_NKEY_RGB) {
> +		ret = devm_led_classdev_multicolor_register(&hdev->dev, &leds->mc_led);
> +		if (!ret)
> +			leds->rgb_registered = true;
> +		return ret;
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  /*
> @@ -1282,7 +1421,7 @@ static const struct hid_device_id asus_devices[] = {
>  	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>  	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>  	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
>  	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> @@ -1311,7 +1450,7 @@ static const struct hid_device_id asus_devices[] = {
>  	 */
>  	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>  		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
>  	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>  		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD) },
>  	{ }
> 

-- 
 i.


