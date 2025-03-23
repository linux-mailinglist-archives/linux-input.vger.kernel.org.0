Return-Path: <linux-input+bounces-11119-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F1AA6CE17
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 07:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F42B188FA8A
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 06:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3440201035;
	Sun, 23 Mar 2025 06:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="eVOHQSei";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="astvGbe2"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9057416DC28;
	Sun, 23 Mar 2025 06:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742712044; cv=none; b=gXVJ2Vljxme0gyXIjbfxHeaGvgi1swlJb1Z/rntgbW9CtCUjLErbINY5uQzNcWUm4siUsXbl6RKipMx0hUhwK4W3szahBDbht4rnvWiev+FcEUExGn12lEjxzVmS7+eSUn2vDRr1nFwn2wuss/OM/7AZYbnTvIEMblTWG7fUKmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742712044; c=relaxed/simple;
	bh=/ReVeHcFk/W+xDDwe5iDfs1z84zflA1ugQMJ/FopbQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TFkRbmU4ngglyyabhWCbIkanZzSmtvYR4/kuc3eYJ1ISRPryJJ9WYQrFdd1bd1r+PC3ukjBtdDEvDSvtBjbNbZbAwEKlo5ulNcFSPMHYVYDgAPnL+BS6Ry2/Or4X6ABjvCPkwdtPKuz5V+hzgtFpQ5J0H+s52/swq8tUDbv3QL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=eVOHQSei; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=astvGbe2; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id A0BCB1382CF6;
	Sun, 23 Mar 2025 02:40:40 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Sun, 23 Mar 2025 02:40:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742712040;
	 x=1742798440; bh=xhJu16Y2dESshtgpX5V1/TmhTpOoXJi+YZIHsGQ1i4Q=; b=
	eVOHQSeibugDCbk8zspyJl5vJ8sP55TNY4m71R37IkPyH4lB6fM8SNa7zPXkr+GX
	QEob7fbSgjDEhULgJuJ+mc7T56nNSwTS2eI6EyTY2Jhn7vNQKW0zCMmaq0js1NL6
	ftUyJyiv1JPZZItqFlph8IUmMIeTU9ZFKPXyAM/AHtAjUDKD/mmg/jQWitGIRkmm
	pcQbvqWZX4Ivjiqr2HrBC5WZrblIpjtVKpSCFNBDAcowwC6eJv5z027JuzNuAVyS
	Up+N8q6Hw5mKkOd1ul5NSSp4oJUhimS3wiXs6+FVf/rt+TAKiKpC7lQP0pL1SVGG
	GK5KBYEhleMqR402TVCFPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742712040; x=
	1742798440; bh=xhJu16Y2dESshtgpX5V1/TmhTpOoXJi+YZIHsGQ1i4Q=; b=a
	stvGbe28FtD34e894Zex9QjKaeX4rZwW8n6MpqcTkmVV1fox7k+yL7nUavQWoJF7
	iRH9z1BfwwZTDNcG01ABbq2u37pPbTg+4S1lX1txZUIQtdCjupcgJiyvGrg1Qcb9
	PtHeRd1qOR7XBlu9xzTnDQAoux87VdXBcxIxvp7Jhoqn/cOSiwkywQqkD56+4EJH
	wlaYA+Zsxi+Ext9N//f52QYQXaFvnvaTTsd6gFoeL0Unt/eil05DfU1zj8/jaClu
	uunT1+LJLYKRMqBZsF29hCsmObaiDrEBXv+kVuhEunJAY9fatG8glxnibd4OCtc/
	H4nzZ8I/hWWNruRzmuxfQ==
X-ME-Sender: <xms:56zfZxdo8B9Ey1ImOuF3omQ31Yp9WtrFp1xjl4kG64KZe9HWJYa1-g>
    <xme:56zfZ_MXC8awFUJ-P727h9zBwcfA1A9AFOrbXa5Iykl6Bk5j4FdNi9LgQp4SC3_be
    fVhRbKpZcJkkuepnJo>
X-ME-Received: <xmr:56zfZ6jcoQ89jVIj6sIUi02vsWSXQcUoSUrugH5Z6-7csQTBARYVGTPAr3f3ZgvKYBsA0gfF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheeiudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddt
    vdejnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhhonh
    gvshdruggvvheqnecuggftrfgrthhtvghrnhepjeelteffieehueduvddvjeejgfekjeeh
    heevkeeiieejvdfhfeeluefggedvfeefnecuffhomhgrihhnpehlvggupggtuggvvhdrnh
    grmhgvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    lhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtohepledpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheplhhkmhhlsegrnhhthhgvrghsrdguvghvpdhrtghpthht
    ohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepjhhikhhosheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    sggvnhhtihhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghorhgvnhhtihhnrd
    gthhgrrhihsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhguvghgohgvuggvsehrvggu
    hhgrthdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrd
    hinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:56zfZ69P7XMsBE_oKYIjxlUwoHg9my3CXjnmgATUdnjMxG8zecVIpQ>
    <xmx:56zfZ9vrOQV9RF3JS9BMD1KI_SbNlSuQfAk99VBj03Z0vAXtkdlXPA>
    <xmx:56zfZ5HKWhzr6aCfHOK2VPUKW4HUDqgvd-d0o-UxO2bJWtLbYEHF7g>
    <xmx:56zfZ0MX8JJRkNzBaHTN2RifGtCeKBs9Pjo-S-rUZ1iAP2WYABEfzw>
    <xmx:6KzfZzA_oW_d3jviaYvbtA9y8S7Jy4MPFePT4KwLN7KFwEX_Btb_Rvkv>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Mar 2025 02:40:36 -0400 (EDT)
Message-ID: <bb3071d4-7910-46c2-ab48-aed574bcd758@ljones.dev>
Date: Sun, 23 Mar 2025 19:40:34 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] HID: asus: add basic RGB support
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250322102804.418000-1-lkml@antheas.dev>
 <20250322102804.418000-10-lkml@antheas.dev>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250322102804.418000-10-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/25 23:28, Antheas Kapenekakis wrote:
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
> index 905453a4eb5b7..9d8ccfde5912e 100644
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
>   	struct asus_hid_listener listener;
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
> @@ -504,23 +512,67 @@ static void asus_schedule_work(struct asus_kbd_leds *led)
>   	spin_unlock_irqrestore(&led->lock, flags);
>   }
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
> @@ -534,10 +586,69 @@ static void asus_kbd_backlight_work(struct work_struct *work)
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
> @@ -565,21 +676,51 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>   	if (!drvdata->kbd_backlight)
>   		return -ENOMEM;
>   
> -	drvdata->kbd_backlight->removed = false;
> -	drvdata->kbd_backlight->brightness = 0;
> -	drvdata->kbd_backlight->hdev = hdev;
> -	drvdata->kbd_backlight->listener.brightness_set = asus_kbd_backlight_set;
> -	INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_backlight_work);
> +	leds = drvdata->kbd_backlight;
> +	leds->removed = false;
> +	leds->brightness = 3;
> +	leds->hdev = hdev;
> +	leds->listener.brightness_set = asus_kbd_listener_set;
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

A quick note. This breaks convention for LED names. The style guide is 
at Documentation/leds/leds-class.rst. Per my parallel email to this one 
I would like to see the mentioned naming scheme `asus:rgb:kbd_backlight` 
adopted. Expanding further on one of the points there you might need to 
move the led_classdev_mc in to asus-wmi to fulfil having the single 
sysfs endpoint. Since you're using the listner pattern it shouldn't be 
much work.

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
>   	ret = asus_hid_register_listener(&drvdata->kbd_backlight->listener);
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
> @@ -1289,7 +1430,7 @@ static const struct hid_device_id asus_devices[] = {
>   	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
>   	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> @@ -1318,7 +1459,7 @@ static const struct hid_device_id asus_devices[] = {
>   	 */
>   	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>   		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
>   	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>   		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD) },
>   	{ }


