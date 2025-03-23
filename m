Return-Path: <linux-input+bounces-11117-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CFEA6CDFD
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 07:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1616516C108
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 06:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8556820125D;
	Sun, 23 Mar 2025 06:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="wqd72IU6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DukTkJiY"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF811FFC68;
	Sun, 23 Mar 2025 06:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742710897; cv=none; b=KeHNMjMJvASuG0JuVMlySRzD8WvAVMGdaigp+xJOxRv6BBlz+IC9plVadbsox2HbZMnKgksVOBwesD58HPJ6a2+ig0pTFMIJNIvsHy43IzXDypD+3AbI7W1q5p7UXbaL0kGSwjZ1fwoICtR5EZMGUMOBL/kg7NDCRXOfoUaSpPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742710897; c=relaxed/simple;
	bh=L76nD2k+kWcdIPaJeM7XftElz3AXDHzkh238FN468A8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZFuart6tsR50ecvovjd+i3II+l9njlhLzYV74nFKCur+MWZpA3E5MOWZe8EFTtkNQ1Hj72ZUYeb1dFlAOnUX1JOHsJ/+ZG7p/LF55IHRcAVC86XMPPDOlCPS6X4WqIk7kY8328n7J2EbEziMkgO8AV/9wPaSHeZfmOstPCJYUlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=wqd72IU6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DukTkJiY; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 0E64713826E5;
	Sun, 23 Mar 2025 02:21:33 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 23 Mar 2025 02:21:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742710893;
	 x=1742797293; bh=jALoMhYy/CVvOs/MhMfF9ikQ4gqPNxjt1CTvNyeXOmg=; b=
	wqd72IU6r3ioaN3kaxwCOwN3z/LmDuO6T40ILo9ujm2kgxxqxpsadRBVo2Kl/Gvk
	Sykp6SXnE1EoFvn+YZDBsXwvXF9CPHqhsVQEvgnrwfRh4SXsIK9IDf9Y3URHP5ef
	3YdDW8C2/NAW5FiD9PPFHfQXXybg98+EyyznYfoa3i3DIoHE9BgDFfR5AMjp554b
	bqwP1GqE72X1LfmcJktvdYwfQlbsfQ+cfDKh8hcMQiDHLgmCkMfNQTM/Sd21Kl/S
	jkoZjsNwo7jKXAzEB60qhkYmCxIIKyT9rU/9Ikq780nZjVPmrQ8THjpuM/PZg8cg
	RGhsiOFu963zj2vyJD3kcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742710893; x=
	1742797293; bh=jALoMhYy/CVvOs/MhMfF9ikQ4gqPNxjt1CTvNyeXOmg=; b=D
	ukTkJiYPJOM7MunB9sWgNskohFT+JREXqCTJuo6IUpjhNqQ+s2QwFK9s2c+KmzsP
	eOZW99NKbMhcmjaLzAStYEkGVkebhbYf0bDEg1Q6EdMzOqW5x8rmydWHI4X1ZlHH
	HjcsH2MAFv0KS7Ipb4y+316dDiAP5Hmxx6QyPLfqGT1jVT7oW+JKjZcQuuRkHpTE
	aH+upDzSbRYS90pqQvXY6KaLtSsi9Y/0F0pWAne9YX3qIFCDTB2SXUZSsu+AwmFF
	qcox2SjrAATjORkIxdVQ2Qg9DPkA2a1dKMtw6biIf1t0XWsboBSR77PqaQvT47mN
	pccIL7k94fx/nFwWpVg8w==
X-ME-Sender: <xms:bKjfZ_Bt-_4Ugtc3Tdxuc2xvHFL4BraAs8uogkDmGyuUtMItixkovw>
    <xme:bKjfZ1iLCTdevHNf0vXls5C3h4dyka59Y7kRDjJ_f95rXvfVwEYk3_LhXh6rgIl6D
    6jSEN1zpiMXQvsYd_A>
X-ME-Received: <xmr:bKjfZ6m8wb4u6lqgwHgud7IolbIoOEjsKFj8rem-9hiYMTD0fAzRRnB0RCu3do0M8VPCabQV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheeiuddvucetufdoteggodetrf
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
X-ME-Proxy: <xmx:bKjfZxyWrAYxaP6crK8zZBHSiKSJh-9NOQkd-eHUqGm334tA7LAsuQ>
    <xmx:bKjfZ0TWbMxO6dcFzLmWXA1w8GP1MaSc19MjAp78WOWKbhUavG0AfA>
    <xmx:bKjfZ0bvbtKBvgvl-1K0nTnXmOBE3zMjQUl1W4eHmYS4JrPCFWqTzw>
    <xmx:bKjfZ1RWWv-iEznL77k37AynBtIPMaNEvYhqvuXJPnJWGCBo5XcD6Q>
    <xmx:bajfZ3Eh7Qbhlg3ccZ51-g15V-xHCI_F5QbHD0ZhCqXuQa0RSIq4AL05>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Mar 2025 02:21:28 -0400 (EDT)
Message-ID: <391f7530-51aa-4bb6-871e-b365802b99db@ljones.dev>
Date: Sun, 23 Mar 2025 19:21:26 +1300
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

Tested as working on 0x1866 and 0x19B6 PID devices. No code review.

They have a path of `/sys/class/leds/asus-0003:0B05:19B6.0001-led`, was 
this intentional? I was under the impression that you would have added 
the mcled to the base `asus::kbd_backlight`.. Apologies if the answer is 
in code, I've only tested for now, not much time for full review but I 
do have some questions/opinons:

I *think* the majority of ROG are RGB, but now I regret not actually 
tracking this so I hope ASUS come back to me with some kind of query we 
can ask the MCU for this info.

Because I think the majority are RGB I'm coming around to saying yes to 
this patch but with caveats:

1. mcled added to the base led
2. `asus:rgb:kbd_backlight` name if RGB, `asus:white:kbd_backlight` if 
white only, `asus::kbd_backlight` if unknown
3. a quirk system to label an MCU as white only (since the bulk are RGB)

If you only do 1 + 2, or even just 1 I'm happy with that. I can take 
care of either 3, or 2 + 3. The last one just means I'll have to spend 
some time looking up specs or writing a crawler to find data.

I will try to review the code in the next days, but if you change it 
based on the above I'll hold off until then.

Cheers,
Luke.

P.S: on almost all white-only LED devices I've encountered the RED 
channel works for white intensity (green and blue do nothing). So even 
if we decide to blanket enable RGB for 0x1866 and 0x19B6 it won't cause 
issues beyond the naming and API facing.

