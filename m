Return-Path: <linux-input+bounces-16174-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E8AC695A0
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 13:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F0C4634B6FF
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 12:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A65326D67;
	Tue, 18 Nov 2025 12:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZJRT+It"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BA23126D1;
	Tue, 18 Nov 2025 12:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763468605; cv=none; b=oaR+3RcJsUNCDdyGWJ87vZ5iH68j6Lx+oC5vaxkiESO/6GgxjFrhvW8m5XD4x0L+RUK75bV+Y6hCoCTs0DVQEmX+SEM1/tONI7hOaDjKzgE1yVzBwLIBFNXMWvnNlNRZS5vsnwgyVRLXJffDStEQRirk6ke3MUxerB26AG/Hark=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763468605; c=relaxed/simple;
	bh=ly4wQUSy6tbYiLYxB9mHpi4kV3401nOyNHQMVkaStWk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sv3+fh4sBZt7tvLwbeOm2D+PiOgS3LvPGd5hG78RO52xOwP2KSnjNQxDchFK3T55Lfj797nn7uOJRj0VGMwspbFjFf9InIqzSDDObis8G7B1Jw9gn0t8H8IZLzl4RP/XwyKuUbHAt2KftmzwcDHsuFWfoqINByul5sxe/Ss8BDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZJRT+It; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763468604; x=1795004604;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ly4wQUSy6tbYiLYxB9mHpi4kV3401nOyNHQMVkaStWk=;
  b=bZJRT+It/5sBzWMersbJD/95R/gcDGL4VsmUb7NzReCxqVgJnoq7POV3
   k9SkhcSs47X9zdQEhq7jOCbDfe8xeO0aBz7pkJU9BXXagAuoqttfI+EBn
   04wIC67PfZ7QFKFcXhjOc/XHXtsS6OV3ecWhhNWIrE0bBPb9VBlcWYKaD
   Tvxc2VUuhe4cgrpKA7sCLLWYEhPG4HzJERpUJW3GgqzHwVvRfpRcBK5+z
   MQQNw+51BAQsvfCRxNxl2FYRXiC91WPZ70z4d4qPkHDmX9Ne+mbYYCZeH
   muEpXgWXEnqOuUesiy2xBaiFdgTZbFQbyF5Rq46gYKzxnZxImOFkCEqcI
   A==;
X-CSE-ConnectionGUID: gHnv62toTcCklsirYMBD9g==
X-CSE-MsgGUID: SSPty1O9SLKU/2uAvQkuMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69340168"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="69340168"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 04:23:23 -0800
X-CSE-ConnectionGUID: sr4fvDTgSkuwqSudn28WrA==
X-CSE-MsgGUID: NsAmjO9mQrmcWs8LQNXzXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190901865"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 04:23:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Nov 2025 14:23:15 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
    Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v8 01/10] HID: asus: simplify RGB init sequence
In-Reply-To: <20251101104712.8011-2-lkml@antheas.dev>
Message-ID: <3018f443-e1af-7a93-f0f2-558364ecb9eb@linux.intel.com>
References: <20251101104712.8011-1-lkml@antheas.dev> <20251101104712.8011-2-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 1 Nov 2025, Antheas Kapenekakis wrote:

> Currently, RGB initialization forks depending on whether a device is
> NKEY. Then, NKEY devices are initialized using 0x5a, 0x5d, 0x5e
> endpoints, and non-NKEY devices with 0x5a and then a
> backlight check, which is omitted for NKEY devices.
> 
> Remove the fork, using a common initialization sequence for both,
> where they are both only initialized with 0x5a, then checked for
> backlight support. This patch should not affect existing functionality.
> 
> 0x5d and 0x5e endpoint initializations are performed by Windows
> userspace programs associated with different usages that reside under
> the vendor HID. Specifically, 0x5d is used by Armoury Crate, which
> controls RGB and 0x5e by an animation program for certain Asus laptops.
> Neither is used currently in the driver.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 56 ++++++++++++++----------------------------
>  1 file changed, 19 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index a444d41e53b6..7ea1037c3979 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -638,50 +638,32 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>  	unsigned char kbd_func;
>  	int ret;
>  
> -	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> -		/* Initialize keyboard */
> -		ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> -		if (ret < 0)
> -			return ret;
> -
> -		/* The LED endpoint is initialised in two HID */
> -		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> -		if (ret < 0)
> -			return ret;
> -
> -		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> -		if (ret < 0)
> -			return ret;

This removal of FEATURE_KBD_LED_REPORT_ID2 should definitely be in own 
patch so a focused changelog can be written to it (who said it's 
acceptable, etc. included) and it can be pinpointed with bisect if it 
causes any issues (but I'm not entirely sure what Denis' stance is on this 
removal so it's going to be subject to some further scrunity, but in any 
case it must be in own patch if to be accepted).

I'm wondering though if QUIRK_ROG_NKEY_LEGACY could also cover this? At 
least it would look a path of less resistance when it comes to Denis' 
stance and would decouple the remove or not controversy from acceptance of 
this series.

-- 
 i.

> -		if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> -			ret = asus_kbd_disable_oobe(hdev);
> -			if (ret < 0)
> -				return ret;
> -		}
> -
> -		if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> -			intf = to_usb_interface(hdev->dev.parent);
> -			udev = interface_to_usbdev(intf);
> -			validate_mcu_fw_version(hdev,
> -				le16_to_cpu(udev->descriptor.idProduct));
> -		}
> +	ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> +	if (ret < 0)
> +		return ret;
>  
> -	} else {
> -		/* Initialize keyboard */
> -		ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> -		if (ret < 0)
> -			return ret;
> +	/* Get keyboard functions */
> +	ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> +	if (ret < 0)
> +		return ret;
>  
> -		/* Get keyboard functions */
> -		ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> +	if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> +		ret = asus_kbd_disable_oobe(hdev);
>  		if (ret < 0)
>  			return ret;
> +	}
>  
> -		/* Check for backlight support */
> -		if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> -			return -ENODEV;
> +	if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> +		intf = to_usb_interface(hdev->dev.parent);
> +		udev = interface_to_usbdev(intf);
> +		validate_mcu_fw_version(
> +			hdev, le16_to_cpu(udev->descriptor.idProduct));
>  	}
>  
> +	/* Check for backlight support */
> +	if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> +		return -ENODEV;
> +
>  	drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
>  					      sizeof(struct asus_kbd_leds),
>  					      GFP_KERNEL);
> 

