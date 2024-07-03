Return-Path: <linux-input+bounces-4814-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DC09262EA
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 16:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18A66B21B38
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 14:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC32617B425;
	Wed,  3 Jul 2024 14:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzjavNIP"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BCF17B42D;
	Wed,  3 Jul 2024 14:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720015685; cv=none; b=KgQPOiF/6C9WhAWtgoE5ph04WKR8NrAe0ncuQRmDyqMOKWEuRyY8OcPv6wsPf71WUZSxklrf+f8tFeBHWOWwjHmjiOrjd9mB1JP2Dl8jP8QbyOmZXjZOMitrrIreu3kqWnxKiRCfc65WLekjf+tFN1Cf3DyFDJ0AMrS31Yc4dDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720015685; c=relaxed/simple;
	bh=02eHILJyLciKFg1168N1dDyXaCh1yXlOvufYhidflI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxrce1OUmBL4QA1Jh/FjKR7S8N+Qrx8eBsHdP6Sl6tfhJRey9WUlU0NzB8B1BB92jyvtRiEN+ql6TOao34uqrFZgcD7PLefg/28ddd150VgffMdFhwZpZ++qUguwpnhq4mjl4pcHUR78HnyZQh5ANR+cMnJR90WUXGVmBuW+/68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzjavNIP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B1DC2BD10;
	Wed,  3 Jul 2024 14:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720015685;
	bh=02eHILJyLciKFg1168N1dDyXaCh1yXlOvufYhidflI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YzjavNIPaGjLy/hCryPk4Geig2gH3Nnjh5v8gB6Ux5p/RNk6QanzaD8I3dlvOgsql
	 NSBk7rV2slYKoUFQL6KILlJN8H9BqOqFA7qustkUfGi71yiOORFObtBQUWX01pyU4Z
	 Xwj7lsW4b4UJ+xIa8RbfMion2uU8nWUTaqdm+ztxvuKiYuZDA7dkZis4fNc+ygwUj4
	 b3DVvgB8ILFCwqYsOcozkpLFhPFST8LbvrNKSzXlYuNEJkVvWnxc20oT8fP6CiDTTP
	 h1wAjkwcnlGkhzWtJSVnag/bdDtAFDZxVKXaH8QDybmexCx80YIipPtCCYlOP8atEv
	 6of852aXzLXew==
Date: Wed, 3 Jul 2024 16:08:00 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Orlando Chamberlain <orlandoch.dev@gmail.com>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] HID: apple: Add support for magic keyboard backlight
 on T2 Macs
Message-ID: <cg3rwpc7wr7ppxb46qx4ruea7mklbz6q25cercv3fjr4zn4qau@gujyoheohawj>
References: <16C35623-78AE-44B9-8D54-CA9584AEC49E@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16C35623-78AE-44B9-8D54-CA9584AEC49E@live.com>

On Jul 03 2024, Aditya Garg wrote:
> From: Orlando Chamberlain <orlandoch.dev@gmail.com>
> 
> Unlike T2 Macs with Butterfly keyboard, who have their keyboard backlight
> on the USB device the T2 Macs with Magic keyboard have their backlight on
> the Touchbar backlight device (05ac:8102).
> 
> Support for Butterfly keyboards has already been added in 9018eacbe623
> ("HID: apple: Add support for keyboard backlight on certain T2 Macs.").
> This patch adds support for the Magic keyboards.
> 
> Co-developed-by: Aditya Garg <gargaditya08@live.com>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>

Nitpick: the ordering of the signed-off is weird. It should be in order
of persons who touched this driver.

Given that the From is Orlando and Aditya is submitting, I would have
expected Orlando, then Aditya...

> ---
>  drivers/hid/hid-apple.c | 87 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 86 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> index bd022e004356..2d1cd4456303 100644
> --- a/drivers/hid/hid-apple.c
> +++ b/drivers/hid/hid-apple.c
> @@ -8,6 +8,8 @@
>   *  Copyright (c) 2006-2007 Jiri Kosina
>   *  Copyright (c) 2008 Jiri Slaby <jirislaby@gmail.com>
>   *  Copyright (c) 2019 Paul Pawlowski <paul@mrarm.io>
> + *  Copyright (c) 2023 Orlando Chamberlain <orlandoch.dev@gmail.com>
> + *  Copyright (c) 2024 Aditya Garg <gargaditya08@live.com>
>   */
>  
>  /*
> @@ -23,6 +25,7 @@
>  #include <linux/timer.h>
>  #include <linux/string.h>
>  #include <linux/leds.h>
> +#include <dt-bindings/leds/common.h>
>  
>  #include "hid-ids.h"
>  
> @@ -37,13 +40,18 @@
>  #define APPLE_NUMLOCK_EMULATION	BIT(8)
>  #define APPLE_RDESC_BATTERY	BIT(9)
>  #define APPLE_BACKLIGHT_CTL	BIT(10)
> -#define APPLE_IS_NON_APPLE	BIT(11)
> +#define APPLE_MAGIC_BACKLIGHT	BIT(11)
> +#define APPLE_IS_NON_APPLE	BIT(12)

Please keep existing quirks definition in place, it adds noise for
nothing in the patch. Also, technically, these quirks are used in
.driver_data so they are uapi.

>  
>  #define APPLE_FLAG_FKEY		0x01
>  
>  #define HID_COUNTRY_INTERNATIONAL_ISO	13
>  #define APPLE_BATTERY_TIMEOUT_MS	60000
>  
> +#define HID_USAGE_MAGIC_BL			0xff00000f
> +#define APPLE_MAGIC_REPORT_ID_POWER		3
> +#define APPLE_MAGIC_REPORT_ID_BRIGHTNESS	1
> +
>  static unsigned int fnmode = 3;
>  module_param(fnmode, uint, 0644);
>  MODULE_PARM_DESC(fnmode, "Mode of fn key on Apple keyboards (0 = disabled, "
> @@ -81,6 +89,12 @@ struct apple_sc_backlight {
>  	struct hid_device *hdev;
>  };
>  
> +struct apple_magic_backlight {
> +	struct led_classdev cdev;
> +	struct hid_report *brightness;
> +	struct hid_report *power;
> +};
> +
>  struct apple_sc {
>  	struct hid_device *hdev;
>  	unsigned long quirks;
> @@ -822,6 +836,66 @@ static int apple_backlight_init(struct hid_device *hdev)
>  	return ret;
>  }
>  
> +static void apple_magic_backlight_report_set(struct hid_report *rep, s32 value, u8 rate)
> +{
> +	rep->field[0]->value[0] = value;
> +	rep->field[1]->value[0] = 0x5e; /* Mimic Windows */
> +	rep->field[1]->value[0] |= rate << 8;
> +
> +	hid_hw_request(rep->device, rep, HID_REQ_SET_REPORT);
> +}
> +
> +static void apple_magic_backlight_set(struct apple_magic_backlight *backlight,
> +				     int brightness, char rate)
> +{
> +	apple_magic_backlight_report_set(backlight->power, brightness ? 1 : 0, rate);
> +	if (brightness)
> +		apple_magic_backlight_report_set(backlight->brightness, brightness, rate);
> +}
> +
> +static int apple_magic_backlight_led_set(struct led_classdev *led_cdev,
> +					 enum led_brightness brightness)
> +{
> +	struct apple_magic_backlight *backlight = container_of(led_cdev,
> +			struct apple_magic_backlight, cdev);
> +
> +	apple_magic_backlight_set(backlight, brightness, 1);
> +	return 0;
> +}
> +
> +static int apple_magic_backlight_init(struct hid_device *hdev)
> +{
> +	struct apple_magic_backlight *backlight;
> +
> +	/*
> +	 * Ensure this usb endpoint is for the keyboard backlight, not touchbar
> +	 * backlight.
> +	 */
> +	if (hdev->collection[0].usage != HID_USAGE_MAGIC_BL)
> +		return -ENODEV;
> +
> +	backlight = devm_kzalloc(&hdev->dev, sizeof(*backlight), GFP_KERNEL);
> +	if (!backlight)
> +		return -ENOMEM;
> +
> +	backlight->brightness = hid_register_report(hdev, HID_FEATURE_REPORT,
> +			APPLE_MAGIC_REPORT_ID_BRIGHTNESS, 0);
> +	backlight->power = hid_register_report(hdev, HID_FEATURE_REPORT,
> +			APPLE_MAGIC_REPORT_ID_POWER, 0);
> +
> +	if (!backlight->brightness || !backlight->power)
> +		return -ENODEV;
> +
> +	backlight->cdev.name = ":white:" LED_FUNCTION_KBD_BACKLIGHT;
> +	backlight->cdev.max_brightness = backlight->brightness->field[0]->logical_maximum;

This is weird: a few lines above, you register a new report with
hid_register_report() and now you are directly accessing
field[0]->logical_maximum in that new report, which should be set to 0.

Unless you are using hid_register_report() to retrieve an existing
report, which is bending the API a bit but is OK, but you should at
least check that report->size is > 0 (and put a comment that the reports
exist already).

(or do what is done in apple_fetch_battery() to retrieve the current
report)


> +	backlight->cdev.brightness_set_blocking = apple_magic_backlight_led_set;
> +
> +	apple_magic_backlight_set(backlight, 0, 0);
> +
> +	return devm_led_classdev_register(&hdev->dev, &backlight->cdev);
> +
> +}
> +
>  static int apple_probe(struct hid_device *hdev,
>  		const struct hid_device_id *id)
>  {
> @@ -860,6 +934,15 @@ static int apple_probe(struct hid_device *hdev,
>  	if (quirks & APPLE_BACKLIGHT_CTL)
>  		apple_backlight_init(hdev);
>  
> +	if (quirks & APPLE_MAGIC_BACKLIGHT) {
> +		ret = apple_magic_backlight_init(hdev);
> +		if (ret) {
> +			del_timer_sync(&asc->battery_timer);
> +			hid_hw_stop(hdev);
> +			return ret;

Instead of manually unwind the probe in each sub-quirk, please add a new
goto label and do goto out_err;

> +		}
> +	}
> +
>  	return 0;
>  }
>  
> @@ -1073,6 +1156,8 @@ static const struct hid_device_id apple_devices[] = {
>  		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
>  	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021),
>  		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT),
> +		.driver_data = APPLE_MAGIC_BACKLIGHT },
>  
>  	{ }
>  };
> -- 
> 2.45.2
> 

Other than those few nitpicks, patch looks good. Please roll a v3 and
I'll apply it.

Cheers,
Benjamin

