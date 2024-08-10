Return-Path: <linux-input+bounces-5490-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB25894DD47
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2024 16:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEB471C20D53
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2024 14:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A8E41C6E;
	Sat, 10 Aug 2024 14:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="Uw4L74X0"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E529722083;
	Sat, 10 Aug 2024 14:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723300402; cv=none; b=AqT+rc1DmNf9ji9OYIkGZsKAsFA9PpPsyMQLQsCvhXhwC3cRiQFN1BoGxBS4WHv4BQN2aDavSxMt7NP1VdHehESmDew34o34MzA9KgT7UiBzUUYFGcbgmq6aRjDsLgQMGh6p/QCjMjBz3swSyoIvlPYZubB8QS1p5EH2lCUcMZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723300402; c=relaxed/simple;
	bh=pVrGC/w0EKCGUkYiDTy90LV6c5VKYIGdr9KDd6R0R94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjXzNoq5Dv6yHGoHkEe4Pw4HxI2cYw6BPRs1LnXmVRsbQQchbHI3wTYEbXgRI0A2wysAALCimzj+XlwGVTeD44t/AE1c+iTHNx2fmZ7dB1v8LtJ7QlLfqJRj0JqDjf19XX8pifYv7uYnOyDTq1Y37f2uKtfzOc/MIpPLqe2W6hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=Uw4L74X0; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1723300397; bh=pVrGC/w0EKCGUkYiDTy90LV6c5VKYIGdr9KDd6R0R94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uw4L74X0aW3Yfhas8UMOZcgurMbkLF397olc/EccBzpoEAbx1/tukXMJizHKFKyjh
	 Nca/G8jMVGCQmz1kxr4sO7uwiC2wWD2dLdU122mx97WuWVDc6Aj8NrnUAz4TTw0Ub1
	 j4peCnX4Q1GmlHLk9Hy6Axb7vpq91LgJ1VG/0cIk=
Date: Sat, 10 Aug 2024 16:33:16 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Aditya Garg <gargaditya08@live.com>
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org" <mripard@kernel.org>, 
	"airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
	Jiri Kosina <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>, 
	Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay <kekrby@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/9] HID: hid-appletb-bl: add driver for the backlight
 of Apple Touch Bars
Message-ID: <375d99a9-5516-4a39-a912-1961b3dd725d@t-8ch.de>
References: <1368FEE8-58BB-41C9-B9AD-7F2F68FF1D53@live.com>
 <0DDD5C22-A42A-49F2-984C-F3595F71AB1C@live.com>
 <9e398f1b-05c2-4dd3-bc56-2b61c6784aef@t-8ch.de>
 <79DB1D9D-8D32-474F-972F-F82C818AF38F@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79DB1D9D-8D32-474F-972F-F82C818AF38F@live.com>

On 2024-08-10 13:23:30+0000, Aditya Garg wrote:
> Hi Thomas
> 
> >> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> >> index e40f1ddeb..1d825a474 100644
> >> --- a/drivers/hid/Makefile
> >> +++ b/drivers/hid/Makefile
> >> @@ -29,6 +29,7 @@ obj-$(CONFIG_HID_ALPS) += hid-alps.o
> >> obj-$(CONFIG_HID_ACRUX) += hid-axff.o
> >> obj-$(CONFIG_HID_APPLE) += hid-apple.o
> >> obj-$(CONFIG_HID_APPLEIR) += hid-appleir.o
> >> +obj-$(CONFIG_HID_APPLETB_BL) += hid-appletb-bl.o
> >> obj-$(CONFIG_HID_CREATIVE_SB0540) += hid-creative-sb0540.o
> >> obj-$(CONFIG_HID_ASUS) += hid-asus.o
> >> obj-$(CONFIG_HID_AUREAL) += hid-aureal.o
> >> diff --git a/drivers/hid/hid-appletb-bl.c b/drivers/hid/hid-appletb-bl.c
> >> new file mode 100644
> >> index 000000000..00bbe45df
> >> --- /dev/null
> >> +++ b/drivers/hid/hid-appletb-bl.c
> >> @@ -0,0 +1,206 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Apple Touch Bar Backlight Driver
> >> + *
> >> + * Copyright (c) 2017-2018 Ronald Tschalär
> >> + * Copyright (c) 2022-2023 Kerem Karabay <kekrby@gmail.com>
> >> + */
> >> +
> >> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > 
> > This is unused.
> > 
> > #include <linux/device.h>
> 
> Can you clarify what you mean here?

Also include linux/device.h as you are using functions from there.
Like devm_kcalloc().

> > 
> >> +#include <linux/hid.h>
> >> +#include <linux/backlight.h>
> >> +
> >> +#include "hid-ids.h"
> >> +
> >> +#define APPLETB_BL_ON 1
> >> +#define APPLETB_BL_DIM 3
> >> +#define APPLETB_BL_OFF 4
> >> +
> >> +#define HID_UP_APPLEVENDOR_TB_BL 0xff120000
> >> +
> >> +#define HID_VD_APPLE_TB_BRIGHTNESS 0xff120001
> >> +#define HID_USAGE_AUX1 0xff120020
> >> +#define HID_USAGE_BRIGHTNESS 0xff120021
> >> +
> >> +static int appletb_bl_def_brightness = 2;
> >> +module_param_named(brightness, appletb_bl_def_brightness, int, 0444);
> >> +MODULE_PARM_DESC(brightness, "Default brightness:\n"
> >> +  "    0 - Touchbar is off\n"
> >> +  "    1 - Dim brightness\n"
> >> +  "    [2] - Full brightness");
> >> +
> >> +struct appletb_bl {
> >> + struct hid_field *aux1_field, *brightness_field;
> >> + struct backlight_device *bdev;
> >> +
> >> + bool full_on;
> >> +};
> >> +
> >> +const u8 appletb_bl_brightness_map[] = {
> > 
> > static?
> > 
> >> + APPLETB_BL_OFF,
> >> + APPLETB_BL_DIM,
> >> + APPLETB_BL_ON
> > 
> > The last element is not a sentinel element, so it should have comma.
> 
> static const u8 appletb_bl_brightness_map[] = {
> 	APPLETB_BL_OFF,
> 	APPLETB_BL_DIM,
> 	APPLETB_BL_ON,
> };
> 
> This?

Yes.

> > 
> >> +};
> >> +
> >> +static int appletb_bl_set_brightness(struct appletb_bl *bl, u8 brightness)
> >> +{
> >> + struct hid_report *report = bl->brightness_field->report;
> >> + struct hid_device *hdev = report->device;
> >> + int ret;
> >> +
> >> + ret = hid_set_field(bl->aux1_field, 0, 1);
> >> + if (ret) {
> >> + hid_err(hdev, "Failed to set auxiliary field (%pe)\n", ERR_PTR(ret));
> >> + return ret;
> >> + }
> >> +
> >> + ret = hid_set_field(bl->brightness_field, 0, brightness);
> >> + if (ret) {
> >> + hid_err(hdev, "Failed to set brightness field (%pe)\n", ERR_PTR(ret));
> >> + return ret;
> >> + }
> >> +
> >> + if (!bl->full_on) {
> >> + ret = hid_hw_power(hdev, PM_HINT_FULLON);
> >> + if (ret < 0) {
> >> + hid_err(hdev, "Device didn't power on (%pe)\n", ERR_PTR(ret));
> >> + return ret;
> >> + }
> >> +
> >> + bl->full_on = true;
> >> + }
> >> +
> >> + hid_hw_request(hdev, report, HID_REQ_SET_REPORT);
> >> +
> >> + if (brightness == APPLETB_BL_OFF) {
> >> + hid_hw_power(hdev, PM_HINT_NORMAL);
> >> + bl->full_on = false;
> >> + }
> >> +
> >> + return 0;
> >> +}
> >> +
> >> +static int appletb_bl_update_status(struct backlight_device *bdev)
> >> +{
> >> + struct appletb_bl *bl = bl_get_data(bdev);
> >> + u16 brightness;
> >> +
> >> + if (bdev->props.state & BL_CORE_SUSPENDED)
> >> + brightness = 0;
> > 
> > From backlight.h:
> > 
> > * backlight drivers are expected to use backlight_is_blank()
> > * in their update_status() operation rather than reading the
> > * state property.
> > 
> > Seems to be applicable here.
> > 
> > Also the hardcoded "0" as index into appletb_bl_brightness_map could be
> > avoided by some restructuring.
> 
> static int appletb_bl_update_status(struct backlight_device *bdev)
> {
> 	struct appletb_bl *bl = bl_get_data(bdev);
> 	u16 brightness;
> 
> 	if (backlight_is_blank(bdev))
> 		brightness = APPLETB_BL_OFF;
> 	else
> 		brightness = backlight_get_brightness(bdev);
> 
> 	return appletb_bl_set_brightness(bl, appletb_bl_brightness_map[brightness]);
> }
> 
> This?

This now looks to be a different logic than before.
Below should be the same as in the original patch.

static int appletb_bl_update_status(struct backlight_device *bdev)
{
	struct appletb_bl *bl = bl_get_data(bdev);
	u8 brightness;

	if (backlight_is_blank(bdev))
		brightness = APPLETB_BL_OFF;
	else
		brightness = appletb_bl_brightness_map[backlight_get_brightness(bdev)]);

	return appletb_bl_set_brightness(bl, brightness);
}

Maybe it's worth to make APPLETB_BL_* an enum for more clarity.

> >> + else
> >> + brightness = backlight_get_brightness(bdev);
> >> +
> >> + return appletb_bl_set_brightness(bl, appletb_bl_brightness_map[brightness]);
> >> +}
> >> +

<snip>

