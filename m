Return-Path: <linux-input+bounces-4823-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B243F9266D7
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 19:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D56501C22BA6
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 17:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23335184130;
	Wed,  3 Jul 2024 17:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vx4be4xz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE528170836;
	Wed,  3 Jul 2024 17:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720026614; cv=none; b=SCqcI7G+Vztx6RXzZ864HcJ/Go4m4lBSF9rnwyBlSDIk1PAymd9vfh2MIBFJ1YNdLCEHz4cvTRZERZHnNvmSODnyM/pggwDx48RVoR4yTDzuJtrO1wuvsYIukCjkRQofTkwwOKxvzGjMcRrA/XdkkSkRV0bsPShJgU6Lor1mVp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720026614; c=relaxed/simple;
	bh=Bzv7IrvQToJvcZPYrdVhuDxbDSeeFo29Op2zCivSaoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kp0AqcOFk65KdqFfvnIq2Cg1b9GRSpnusrXk2LCSAwrlnv4iLdxyNEVyGc+NgSP2LO6Njtrq880HHsy9RmKzx4sPeQyPafv8xmN4k+QrR7QhybxKSCbMnWnZoRVhADy/2hvtij0Mzorjwtyp9jxJYe30uaRNMPGsdbQyUGJwO7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vx4be4xz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF31C2BD10;
	Wed,  3 Jul 2024 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720026613;
	bh=Bzv7IrvQToJvcZPYrdVhuDxbDSeeFo29Op2zCivSaoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vx4be4xzEVUdhXxkdEnKjNuZWWHabgoxlSG/njftXxalYFuXiI/2aIeOck7tkbejG
	 dryCn8KC+kddKzPAiysCOGwqRvCRPRN5kBsgtV34y2lBLTq6WnRdoaOf3wip3YvMQh
	 ZuR9JNox3MY/zCrV7RTe41kmFO8W/2sNUNG++CSnMjsd29gLxENyd3X0p39HZCbHxH
	 9de4IA7Y8q71LVXtFBzlSgeP4yZVMpxW+iGG67Vp9zcKWWHPR8/s0IhPyd7bU+gLvx
	 2NGcme/TzaGmuAQFDd2wUnuziRYGRMFp1dZP4FjGZFOgPPPz07s7dtPeGeFE8GcJI0
	 xd2I5yOndlPmQ==
Date: Wed, 3 Jul 2024 19:10:09 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Orlando Chamberlain <orlandoch.dev@gmail.com>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] HID: apple: Add support for magic keyboard backlight
 on T2 Macs
Message-ID: <m2ohvezuoldiewldip3i7luaehunadlllbe6plylauxeuqihc5@i6xelxexmep4>
References: <16C35623-78AE-44B9-8D54-CA9584AEC49E@live.com>
 <cg3rwpc7wr7ppxb46qx4ruea7mklbz6q25cercv3fjr4zn4qau@gujyoheohawj>
 <B9057989-C564-4B74-91E5-E23245B7D686@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B9057989-C564-4B74-91E5-E23245B7D686@live.com>

On Jul 03 2024, Aditya Garg wrote:
> 
> Hi Benjamin
> 
> > On 3 Jul 2024, at 7:38 PM, Benjamin Tissoires <bentiss@kernel.org> wrote:
> > 
> > On Jul 03 2024, Aditya Garg wrote:
> >> From: Orlando Chamberlain <orlandoch.dev@gmail.com>
> >> 
> >> Unlike T2 Macs with Butterfly keyboard, who have their keyboard backlight
> >> on the USB device the T2 Macs with Magic keyboard have their backlight on
> >> the Touchbar backlight device (05ac:8102).
> >> 
> >> Support for Butterfly keyboards has already been added in 9018eacbe623
> >> ("HID: apple: Add support for keyboard backlight on certain T2 Macs.").
> >> This patch adds support for the Magic keyboards.
> >> 
> >> Co-developed-by: Aditya Garg <gargaditya08@live.com>
> >> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> >> Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
> > 
> > Nitpick: the ordering of the signed-off is weird. It should be in order
> > of persons who touched this driver.
> > 
> > Given that the From is Orlando and Aditya is submitting, I would have
> > expected Orlando, then Aditya…
> > 
> 
> Will fix this.
> 
> >> ---
> >> drivers/hid/hid-apple.c | 87 ++++++++++++++++++++++++++++++++++++++++-
> >> 1 file changed, 86 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> >> index bd022e004356..2d1cd4456303 100644
> >> --- a/drivers/hid/hid-apple.c
> >> +++ b/drivers/hid/hid-apple.c
> >> @@ -8,6 +8,8 @@
> >>  *  Copyright (c) 2006-2007 Jiri Kosina
> >>  *  Copyright (c) 2008 Jiri Slaby <jirislaby@gmail.com>
> >>  *  Copyright (c) 2019 Paul Pawlowski <paul@mrarm.io>
> >> + *  Copyright (c) 2023 Orlando Chamberlain <orlandoch.dev@gmail.com>
> >> + *  Copyright (c) 2024 Aditya Garg <gargaditya08@live.com>
> >>  */
> >> 
> >> /*
> >> @@ -23,6 +25,7 @@
> >> #include <linux/timer.h>
> >> #include <linux/string.h>
> >> #include <linux/leds.h>
> >> +#include <dt-bindings/leds/common.h>
> >> 
> >> #include "hid-ids.h"
> >> 
> >> @@ -37,13 +40,18 @@
> >> #define APPLE_NUMLOCK_EMULATION BIT(8)
> >> #define APPLE_RDESC_BATTERY BIT(9)
> >> #define APPLE_BACKLIGHT_CTL BIT(10)
> >> -#define APPLE_IS_NON_APPLE BIT(11)
> >> +#define APPLE_MAGIC_BACKLIGHT BIT(11)
> >> +#define APPLE_IS_NON_APPLE BIT(12)
> > 
> > Please keep existing quirks definition in place, it adds noise for
> > nothing in the patch. Also, technically, these quirks are used in
> > .driver_data so they are uapi.
> > 
> 
> Sure
> 
> >> 
> >> #define APPLE_FLAG_FKEY 0x01
> >> 
> >> #define HID_COUNTRY_INTERNATIONAL_ISO 13
> >> #define APPLE_BATTERY_TIMEOUT_MS 60000
> >> 
> >> +#define HID_USAGE_MAGIC_BL 0xff00000f
> >> +#define APPLE_MAGIC_REPORT_ID_POWER 3
> >> +#define APPLE_MAGIC_REPORT_ID_BRIGHTNESS 1
> >> +
> >> static unsigned int fnmode = 3;
> >> module_param(fnmode, uint, 0644);
> >> MODULE_PARM_DESC(fnmode, "Mode of fn key on Apple keyboards (0 = disabled, "
> >> @@ -81,6 +89,12 @@ struct apple_sc_backlight {
> >> struct hid_device *hdev;
> >> };
> >> 
> >> +struct apple_magic_backlight {
> >> + struct led_classdev cdev;
> >> + struct hid_report *brightness;
> >> + struct hid_report *power;
> >> +};
> >> +
> >> struct apple_sc {
> >> struct hid_device *hdev;
> >> unsigned long quirks;
> >> @@ -822,6 +836,66 @@ static int apple_backlight_init(struct hid_device *hdev)
> >> return ret;
> >> }
> >> 
> >> +static void apple_magic_backlight_report_set(struct hid_report *rep, s32 value, u8 rate)
> >> +{
> >> + rep->field[0]->value[0] = value;
> >> + rep->field[1]->value[0] = 0x5e; /* Mimic Windows */
> >> + rep->field[1]->value[0] |= rate << 8;
> >> +
> >> + hid_hw_request(rep->device, rep, HID_REQ_SET_REPORT);
> >> +}
> >> +
> >> +static void apple_magic_backlight_set(struct apple_magic_backlight *backlight,
> >> +      int brightness, char rate)
> >> +{
> >> + apple_magic_backlight_report_set(backlight->power, brightness ? 1 : 0, rate);
> >> + if (brightness)
> >> + apple_magic_backlight_report_set(backlight->brightness, brightness, rate);
> >> +}
> >> +
> >> +static int apple_magic_backlight_led_set(struct led_classdev *led_cdev,
> >> +  enum led_brightness brightness)
> >> +{
> >> + struct apple_magic_backlight *backlight = container_of(led_cdev,
> >> + struct apple_magic_backlight, cdev);
> >> +
> >> + apple_magic_backlight_set(backlight, brightness, 1);
> >> + return 0;
> >> +}
> >> +
> >> +static int apple_magic_backlight_init(struct hid_device *hdev)
> >> +{
> >> + struct apple_magic_backlight *backlight;
> >> +
> >> + /*
> >> +  * Ensure this usb endpoint is for the keyboard backlight, not touchbar
> >> +  * backlight.
> >> +  */
> >> + if (hdev->collection[0].usage != HID_USAGE_MAGIC_BL)
> >> + return -ENODEV;
> >> +
> >> + backlight = devm_kzalloc(&hdev->dev, sizeof(*backlight), GFP_KERNEL);
> >> + if (!backlight)
> >> + return -ENOMEM;
> >> +
> >> + backlight->brightness = hid_register_report(hdev, HID_FEATURE_REPORT,
> >> + APPLE_MAGIC_REPORT_ID_BRIGHTNESS, 0);
> >> + backlight->power = hid_register_report(hdev, HID_FEATURE_REPORT,
> >> + APPLE_MAGIC_REPORT_ID_POWER, 0);
> >> +
> >> + if (!backlight->brightness || !backlight->power)
> >> + return -ENODEV;
> >> +
> >> + backlight->cdev.name = ":white:" LED_FUNCTION_KBD_BACKLIGHT;
> >> + backlight->cdev.max_brightness = backlight->brightness->field[0]->logical_maximum;
> > 
> > This is weird: a few lines above, you register a new report with
> > hid_register_report() and now you are directly accessing
> > field[0]->logical_maximum in that new report, which should be set to 0.
> > 
> > Unless you are using hid_register_report() to retrieve an existing
> > report, which is bending the API a bit but is OK, but you should at
> > least check that report->size is > 0 (and put a comment that the reports
> > exist already).
> > 
> > (or do what is done in apple_fetch_battery() to retrieve the current
> > report)
> > 
> 
> Instead of 
> 
> 	if (!backlight->brightness || !backlight->power)
> 		return -ENODEV;
> 
> Should I do (will all proper whitespace and line formatting):
> 
> 	if (!backlight->brightness ||
>              backlight->brightness->size == 0 ||
>             !backlight->power ||
>              backlight->power->size == 0)
> 		return -ENODEV;

That, or:
struct hid_report_enum *report_enum;

report_enum = &hdev->report_enum[HID_FEATURE_REPORT];
backlight->brightness = report_enum->report_id_hash[APPLE_MAGIC_REPORT_ID_BRIGHTNESS];
backlight->power = report_enum->report_id_hash[APPLE_MAGIC_REPORT_ID_POWER];

and then keep your "if (!backlight->brightness || !backlight->power)"

> 
> > 
> >> + backlight->cdev.brightness_set_blocking = apple_magic_backlight_led_set;
> >> +
> >> + apple_magic_backlight_set(backlight, 0, 0);
> >> +
> >> + return devm_led_classdev_register(&hdev->dev, &backlight->cdev);
> >> +
> >> +}
> >> +
> >> static int apple_probe(struct hid_device *hdev,
> >> const struct hid_device_id *id)
> >> {
> >> @@ -860,6 +934,15 @@ static int apple_probe(struct hid_device *hdev,
> >> if (quirks & APPLE_BACKLIGHT_CTL)
> >> apple_backlight_init(hdev);
> >> 
> >> + if (quirks & APPLE_MAGIC_BACKLIGHT) {
> >> + ret = apple_magic_backlight_init(hdev);
> >> + if (ret) {
> >> + del_timer_sync(&asc->battery_timer);
> >> + hid_hw_stop(hdev);
> >> + return ret;
> > 
> > Instead of manually unwind the probe in each sub-quirk, please add a new
> > goto label and do goto out_err;
> 
> You mean this?:

yep. This way, if we get to add new quirks later, we can rely on this.

> 
> 	if (quirks & APPLE_MAGIC_BACKLIGHT) {
> 		ret = apple_magic_backlight_init(hdev);
> 		if (ret)
> 			goto out_err;
> 	}
> 
> 	return 0;
> 
> out_err:
> 	del_timer_sync(&asc->battery_timer);
> 	hid_hw_stop(hdev);
> 	return ret;
> }
> 
> 
> > 
> >> + }
> >> + }
> >> +
> >> return 0;
> >> }
> >> 
> >> @@ -1073,6 +1156,8 @@ static const struct hid_device_id apple_devices[] = {
> >> .driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
> >> { HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021),
> >> .driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
> >> + { HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT),
> >> + .driver_data = APPLE_MAGIC_BACKLIGHT },
> >> 
> >> { }
> >> };
> >> -- 
> >> 2.45.2
> >> 
> > 
> > Other than those few nitpicks, patch looks good. Please roll a v3 and
> > I'll apply it.
> > 
> > Cheers,
> > Benjamin
> 
> 

Cheers,
Benjamin

