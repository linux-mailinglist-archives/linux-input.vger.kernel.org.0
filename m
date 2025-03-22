Return-Path: <linux-input+bounces-11067-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8D9A6C78B
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 05:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE432176606
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 04:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071F3127E18;
	Sat, 22 Mar 2025 04:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="TKTbJHfk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sHLOS6j+"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45894BE49;
	Sat, 22 Mar 2025 04:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742616330; cv=none; b=iG3Ry8IanTSWleeuP+qPd5BTnnQrmpdA2hzyVQEKMGdTMqFaoZY8SUBY/0H2MMKA73ahqYdXFoDrtrE7emQYOUn6wFThJ1iXkw/ABORDceV0mU1zqwQRIoxzZuT9WZAcvGlbh+Qd4/C25FKfj+YBrbNRfq6MJCcdzUxTmVhb3O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742616330; c=relaxed/simple;
	bh=N9BVmrMzorNn0fx0ANVbwA+JzT8gC49PrO2w8M8jXcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXYE/YffRPq3Q7HROEB3d9VbCKL3Ivw1q5HPpxSPRGj08EQbFazhja8g0GBkDgW5VktfT2C5ZHWxReUWeuSMgazBlgdaGHSTtemJa+xf/hRmDk25TBmTl4ue2FptdJ1SIPXJKnZtZw59ftLUtlho8CC18kP5IKSOnpCKtzgFWLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=TKTbJHfk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sHLOS6j+; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id CCE2B114015D;
	Sat, 22 Mar 2025 00:05:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sat, 22 Mar 2025 00:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742616326;
	 x=1742702726; bh=h5kwOAETkBnFt8TDlx2Lihx8IYE0TiWrutLpyOVX2wI=; b=
	TKTbJHfk/FNbucDJ2vMLLjmPN3PMI8x8x11A1G0X9TMJG7lt7eciLXL7Xsw9b+dK
	bE/412NRSNtHNfkIu92HloyU0HM/YTOnFgB3nI2pcmuMNH4glkQGgha0Fopb9z4z
	IqlV+M834kReuSvIyJHSI4gFDG+t9/dYlIejFksn9aJm3EV2+5YHPQ10kbjKMA7w
	2Ey5EMI4xcPS4To8nZNtU0emYwP2TWfD5eRROXdS4UnRBTN6COpu/l7lj5BBLtld
	5BcTdbEBmVzzIvxnaPZmglY1zEOCK/k1HShcfjPrcvkZ7lRazFgUFYe23CL9eiY7
	XeCNcLv/tsn1UcBsRLkVvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742616326; x=
	1742702726; bh=h5kwOAETkBnFt8TDlx2Lihx8IYE0TiWrutLpyOVX2wI=; b=s
	HLOS6j+LWrJgBR1AjJhm5EUzxCMVo4LHhkulK0D1n14wcioKasFTvZnGWwKL8Oq3
	VeyzHOFXGisE5qQZgrPNFg7YLjadDSiCMUjPQ7/mqeIS416fJs564Nb76EjkFiOz
	oY1d6pjzJZxPVopzhxtPy2nj49yLkA7uUnWVguGmzuD9TmFAfNHfE/DFunnGQxY8
	QgLfTTeaFLLfz//aD9LWPvndfvctKs3zOJQvM3+rS4RwGtB+HYeSyW8ZxxPDIfp3
	oNexrSZwy/u9sCIvu9TIt115QVuDBV8dDO1p3aC/lENJn3EY6FibXdmTmUIzWAjk
	80vu/PWepuPIFHAN8N3JQ==
X-ME-Sender: <xms:BTfeZ18kNs3eX0ROe1wZ5ZnrZJq3HE9B2E8fskUDMfvYojxBBlrX1g>
    <xme:BTfeZ5vyRDatDp2EDHrWVeTzQk27ZGkLNLncy-UluSKsPQNUUljA4PxQw8ucyIqX9
    ERvAmd4oHn_GW-r-LA>
X-ME-Received: <xmr:BTfeZzDmlhU-9Tr_0ghGNK5Bk03xOpziUTBVXaMd7oWAj0eQbevl2Nxw7uE22HQJLu916DXX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedvleeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddt
    vdejnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhhonh
    gvshdruggvvheqnecuggftrfgrthhtvghrnhepveekffeuvdetheehgfehveejkeehvdeg
    heduveeufefgkeetueeiudfhueeivdffnecuffhomhgrihhnpehlvggupggtuggvvhdrnh
    grmhgvpdhkvghrnhgvlhdrohhrghdpmhhitghrohhsohhfthdrtghomhdpghhithhhuhgs
    rdgtohhmpdhlihhghhhtihhnghdqugihnhgrmhhitgdqlhgrmhhprghrrhgrhidrmhgupd
    hushgsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtohepledpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtoheplhhkmhhlsegrnhhthhgvrghsrdguvghvpdhr
    tghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepjhhikhhosheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepsggvnhhtihhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghorhgvnh
    htihhnrdgthhgrrhihsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhguvghgohgvuggv
    sehrvgguhhgrthdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlih
    hnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:BTfeZ5eOMt2wbk5HDwA3TlMVLuADKLdQMTPNArmMg6w-HVWzr0xXkg>
    <xmx:BTfeZ6MkGjzTUYYa_-znqR3lIJiMc3zDOHxjAbviJ5i08Ktwsy-orw>
    <xmx:BTfeZ7mnNrXe_oEn3jvJA3Pm9nAKiVkenN9Im9erJsp7CQiAiA5jOw>
    <xmx:BTfeZ0sxH8KwSl36xx9NYvf6j3hs0MzB4BC-woiOOkFl_IGV7X7jMg>
    <xmx:BjfeZ7i6iy4X6HtPV1Gssgg_AZMTXOmHxHeDEbhxiRoion2MMTLIAO7t>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Mar 2025 00:05:21 -0400 (EDT)
Message-ID: <976cc1c8-1c62-4c6a-ab15-056466b8ebac@ljones.dev>
Date: Sat, 22 Mar 2025 17:05:19 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] HID: asus: add basic RGB support
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250320220924.5023-1-lkml@antheas.dev>
 <20250320220924.5023-11-lkml@antheas.dev>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250320220924.5023-11-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/03/25 11:09, Antheas Kapenekakis wrote:
> Adds basic RGB support to hid-asus through multi-index. The interface
> works quite well, but has not gone through much stability testing.
> Applied on demand, if userspace does not touch the RGB sysfs, not
> even initialization is done. Ensuring compatibility with existing
> userspace programs.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/hid/hid-asus.c | 169 +++++++++++++++++++++++++++++++++++++----
>   1 file changed, 155 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 546603f5193c7..5e87923b35520 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -30,6 +30,7 @@
>   #include <linux/input/mt.h>
>   #include <linux/usb.h> /* For to_usb_interface for T100 touchpad intf check */
>   #include <linux/power_supply.h>
> +#include <linux/led-class-multicolor.h>
>   #include <linux/leds.h>
>   
>   #include "hid-ids.h"
> @@ -85,6 +86,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>   #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
>   #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
>   #define QUIRK_HANDLE_GENERIC		BIT(13)
> +#define QUIRK_ROG_NKEY_RGB		BIT(14)
>   
>   #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>   						 QUIRK_NO_INIT_REPORTS | \
> @@ -97,9 +99,15 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>   
>   struct asus_kbd_leds {
>   	struct asus_brt_listener listener;
> +	struct led_classdev_mc mc_led;
> +	struct mc_subled subled_info[3];
>   	struct hid_device *hdev;
>   	struct work_struct work;
>   	unsigned int brightness;
> +	uint8_t rgb_colors[3];
> +	bool rgb_init;
> +	bool rgb_set;
> +	bool rgb_registered;
>   	spinlock_t lock;
>   	bool removed;
>   };
> @@ -505,23 +513,67 @@ static void asus_schedule_work(struct asus_kbd_leds *led)
>   	spin_unlock_irqrestore(&led->lock, flags);
>   }
>   
> -static void asus_kbd_backlight_set(struct asus_brt_listener *listener,
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
> +static void asus_kbd_listener_set(struct asus_brt_listener *listener,
>   				   int brightness)
>   {
>   	struct asus_kbd_leds *led = container_of(listener, struct asus_kbd_leds,
>   						 listener);
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
>   	unsigned long flags;
>   
>   	spin_lock_irqsave(&led->lock, flags);
> -	led->brightness = brightness;
> +	led->rgb_colors[0] = mc_cdev->subled_info[0].intensity;
> +	led->rgb_colors[1] = mc_cdev->subled_info[1].intensity;
> +	led->rgb_colors[2] = mc_cdev->subled_info[2].intensity;
> +	led->rgb_set = true;
>   	spin_unlock_irqrestore(&led->lock, flags);
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
>   }
>   
> -static void asus_kbd_backlight_work(struct work_struct *work)
> +static void asus_kbd_backlight_work(struct asus_kbd_leds *led)
>   {
> -	struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
>   	u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
>   	int ret;
>   	unsigned long flags;
> @@ -535,10 +587,69 @@ static void asus_kbd_backlight_work(struct work_struct *work)
>   		hid_err(led->hdev, "Asus failed to set keyboard backlight: %d\n", ret);
>   }
>   
> +static void asus_kbd_rgb_work(struct asus_kbd_leds *led)
> +{
> +	u8 rgb_buf[][7] = {
> +		{ FEATURE_KBD_LED_REPORT_ID1, 0xB3 }, /* set mode */
> +		{ FEATURE_KBD_LED_REPORT_ID1, 0xB5 }, /* apply mode */
> +		{ FEATURE_KBD_LED_REPORT_ID1, 0xB4 }, /* save to mem */
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
>   static int asus_kbd_register_leds(struct hid_device *hdev)
>   {
>   	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
>   	unsigned char kbd_func;
> +	struct asus_kbd_leds *leds;
> +	bool no_led;
>   	int ret;
>   
>   	ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> @@ -566,21 +677,51 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>   	if (!drvdata->kbd_backlight)
>   		return -ENOMEM;
>   
> -	drvdata->kbd_backlight->removed = false;
> -	drvdata->kbd_backlight->brightness = 0;
> -	drvdata->kbd_backlight->hdev = hdev;
> -	drvdata->kbd_backlight->listener.notify = asus_kbd_backlight_set;
> -	INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_backlight_work);
> +	leds = drvdata->kbd_backlight;
> +	leds->removed = false;
> +	leds->brightness = 3;
> +	leds->hdev = hdev;
> +	leds->listener.notify = asus_kbd_listener_set;
> +
> +	leds->rgb_colors[0] = 0;
> +	leds->rgb_colors[1] = 0;
> +	leds->rgb_colors[2] = 0;
> +	leds->rgb_init = true;
> +	leds->rgb_set = false;
> +	leds->mc_led.led_cdev.name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
> +					"asus-%s-led",
> +					strlen(hdev->uniq) ?
> +					hdev->uniq : dev_name(&hdev->dev));
> +	leds->mc_led.led_cdev.flags = LED_BRIGHT_HW_CHANGED;
> +	leds->mc_led.led_cdev.max_brightness = 3,
> +	leds->mc_led.led_cdev.brightness_set = asus_kbd_brightness_set,
> +	leds->mc_led.led_cdev.brightness_get = asus_kbd_brightness_get,
> +	leds->mc_led.subled_info = leds->subled_info,
> +	leds->mc_led.num_colors = ARRAY_SIZE(leds->subled_info),
> +	leds->subled_info[0].color_index = LED_COLOR_ID_RED;
> +	leds->subled_info[1].color_index = LED_COLOR_ID_GREEN;
> +	leds->subled_info[2].color_index = LED_COLOR_ID_BLUE;
> +
> +	INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_work);
>   	spin_lock_init(&drvdata->kbd_backlight->lock);
>   
>   	ret = asus_brt_register_listener(&drvdata->kbd_backlight->listener);
> +	no_led = !!ret;
> +
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_RGB) {
> +		ret = devm_led_classdev_multicolor_register(
> +			&hdev->dev, &leds->mc_led);
> +		if (!ret)
> +			leds->rgb_registered = true;
> +		no_led &= !!ret;
> +	}
>   
> -	if (ret < 0) {
> +	if (no_led) {
>   		/* No need to have this still around */
>   		devm_kfree(&hdev->dev, drvdata->kbd_backlight);
>   	}
>   
> -	return ret;
> +	return no_led ? -ENODEV : 0;
>   }
>   
>   /*
> @@ -1305,7 +1446,7 @@ static const struct hid_device_id asus_devices[] = {
>   	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
>   	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> @@ -1334,7 +1475,7 @@ static const struct hid_device_id asus_devices[] = {
>   	 */
>   	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>   		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
>   	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>   		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD) },
>   	{ }

Hi Antheas,

This is something I've wanted to do for a while now but a number of 
things stopped me. I've supported 80+ laptops over the years with either 
the 0x1866 or 0x19b6 PID, and now we have 4 new PID for devices using 
the ITE MCU. In all of this over I think more than 7 years ASUS has been 
remarkably consistent with the HID API so we're lucky there.. However:

- the PID I mention have been used for both white only, and RGB devices
- MCU LED modes vary between all except I think the first 3
- software mode (as asus calls it) LED addressing varies

there's just no way to tell what each of the 80 plus models supports 
besides the manual tracking I've been doing (and that is tiresome).

None of the above is an issue for the Z13 series using the 0x1a30 PID 
though. Unless ASUS decides to release a white only LED version :(

I've asked my contacts for some details about the HID protocol they're 
using, especially for a method to get capabilities if one exits. You'll 
be the first to know about it if I get the details as I'd very much like 
to have first class RGB for all these devices. ASUS are a bit funny 
though, I may get back a "No because security" or something equally 
nonsense - depends on which internal team I need it from and what the 
current politics between teams is.

In the meantime, maybe a NACK so we can get the rest of the series in 
faster? We should definitely iterate on RGB with an eye to support all 
devices if possible otherwise a patch just for Z13 would be fine if that 
ends up not being feasible.

Some things that might be of interest regarding LampArray for LED:
- An implementation of virtual LampArray 
https://lore.kernel.org/all/20250121225510.751444-2-wse@tuxedocomputers.com/
- Windows blog: 
https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/dynamic-lighting-devices
- Windows docs: 
https://github.com/MicrosoftDocs/windows-dev-docs/blob/docs/uwp/devices-sensors/lighting-dynamic-lamparray.md
- PDF spec: 
https://www.usb.org/sites/default/files/hutrr84_-_lighting_and_illumination_page.pdf

LampArray is pretty new and I suspect your Z13 supports it. My G16 does 
too I think. I've seen very little mentioning or using it besides Tuxedo 
though so I'm not sure what use it is to us at this point, everything 
I've seen so far expects userspace to use it, not the kernel. There's 
been little interest anywhere I can see which is a shame as this is a 
much better interface. Sorry about this part being a bit off topic.

Cheers,
Luke.


