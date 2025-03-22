Return-Path: <linux-input+bounces-11066-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE7DA6C766
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 04:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD55A3BCB63
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 03:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2562F12CD88;
	Sat, 22 Mar 2025 03:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="0SEVZHld";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PRxypD27"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB641487FA;
	Sat, 22 Mar 2025 03:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742613839; cv=none; b=o4HnLS/QT0sy6ne6Fta+Lt6Irocg/deVnecvtIHk3+kluJLQdmsuhqn3z1kdQfRTDDuSy98eeWoxsYQTi51PqaCQxfqkNKVzTSBtswijboPO9aRQCnac5TX6Bu9i9QfvQ8iFpp1U12UvCUmKWrh0tMuFRYcy8AO9oRoOPkskuvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742613839; c=relaxed/simple;
	bh=zi/t+Rtxy1754FjeiauKsidM7oEZVPTje0+mbqoSNqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KVaygAP3biM+ogBnTJ61KhysyTSm3n2NFX8r2kPKxG6G4m4YwvhEawdJt5Ap/mWI8uah3rMnZA3EqkxE8RZkAjmO+wrkj50b2a+hHVnXci1xWyw2Yf+EuvMiqpZfvbaeyculKXPK6rBx2xpuwb5hTKtP2BvXHK9kwd3nRtzwffI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=0SEVZHld; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PRxypD27; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 5F440114013D;
	Fri, 21 Mar 2025 23:23:55 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 21 Mar 2025 23:23:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742613835;
	 x=1742700235; bh=tYFhnBcx+ImS004avHubQ9cGjbBOa7GA6N6Y8kx4O9c=; b=
	0SEVZHld88ya3cKc8Tl8LVOfyeTpN7H4LVQHFvRq14rcivxOOXfhAZmHuV+8AR1X
	bA9Y5mIFNfnvq1vLQlp7DHGHAdctEp59O30Q7HokXlefH2hOdvFKOCWAC1d6eFHO
	Q2RJe1U0YOsaBappvEJmNJHgdVSrpnPwEQYBq1EGpkx4OO/aJbfQzpf+ewSaSzrC
	nn+Pq6breeM88T6nZ0Nz05WddNAcif2cI6tiFQOD/lk3+njvfWlGSbatlO5GMgMJ
	gWGl2O4cKuL3EYwjhySy1KQ0onciRGLGN+D7av9RXwiX2FzetzEzb437jnh6JPRw
	G7m2NB6wi50JEZFqfqX4Fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742613835; x=
	1742700235; bh=tYFhnBcx+ImS004avHubQ9cGjbBOa7GA6N6Y8kx4O9c=; b=P
	RxypD27OaHPfdpM1J3SjOselFTRRYmXWr4mfk5f0Rqo4QWXD4Oek/WiDLnecfS4T
	HZ5ZWynEaFsYr/wcKN9Ho63tZBvWZio6wjKkeFSD0LbO3jgtK3TfCUPLT3palRJ4
	JEIKVQkm3QqY1Ip2SgSgu1bm4yQosS+g3BeBOuer+i3HrP9M7yL1V0TbWb3n/9N4
	PIoQ4LFpz2jFJERXFgx/1VNy29XXuDznSRQGzFV1poGbS/RrxB4DqH71V2OwxTQv
	vIS6ZPRJ/ROpsea6Q3+qdeeKFXWHYwABN7AO3A3yAAkcCN9XDCorhMD3F0KOggum
	09aPkL+7RU9IOIbGa1SBg==
X-ME-Sender: <xms:Si3eZ11ZeFIItHGtu5BtfzbZcDXeR14Z6_gIvpmz6Y2LbqSZCkRldA>
    <xme:Si3eZ8G2OY3YG6KaENkwNUlbYai8qbQ35uL7Te89MiykeSJ9Ji3XBEF_DJgBJ_qoi
    o0m4JYVxppNpQ3fdOs>
X-ME-Received: <xmr:Si3eZ16OEMvSG9b-FTnqUeWEIOUBXqR5XGJH98_TdgrRxLMm2COUr9kmPYUyT8-4Yl140_IW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedvkeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddt
    vdejnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhhonh
    gvshdruggvvheqnecuggftrfgrthhtvghrnhepveduueevtdetgfehfeeliedvvdfhtdei
    hfdtkeejuddvgeeivddtkeffgeekueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghp
    thhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhkmhhlsegrnhhthh
    gvrghsrdguvghvpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekiees
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhikhhosheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepsggvnhhtihhssheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheptghorhgvnhhtihhnrdgthhgrrhihsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    ephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehilhhpohdrjhgr
    rhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:Si3eZy1-gF11km2Y1lGyg62amNrdwxYpomFJp79CCyxJ6GY3JYlfoQ>
    <xmx:Si3eZ4Hr0dSWL1WU7UDMJ5CzAS8h2eyaDlSRiAptQ4AXU7OLp9kO1w>
    <xmx:Si3eZz_IybBkBII-eR6OrdBfo64DWe4yuIozmGJLzdhYdg6P8aES9g>
    <xmx:Si3eZ1luhD5DsuSQ-QODIt5CvjplyfncQIrOL3aELb5P96shcDM7Fg>
    <xmx:Sy3eZ2bKl6qqaaP2fgPGzpKcFq0isZ__Lb0LNau8e7GA0_1AdMT0vlgI>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Mar 2025 23:23:51 -0400 (EDT)
Message-ID: <d06fbb28-6bec-42ed-a161-2456131ca32a@ljones.dev>
Date: Sat, 22 Mar 2025 16:23:49 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] platform/x86: asus-wmi: Add support for multiple
 kbd RGB handlers
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250320220924.5023-1-lkml@antheas.dev>
 <20250320220924.5023-6-lkml@antheas.dev>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250320220924.5023-6-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/03/25 11:09, Antheas Kapenekakis wrote:
> Some devices, such as the Z13 have multiple AURA devices connected
> to them by USB. In addition, they might have a WMI interface for
> RGB. In Windows, Armoury Crate exposes a unified brightness slider
> for all of them, with 3 brightness levels.
> 
> Therefore, to be synergistic in Linux, and support existing tooling
> such as UPower, allow adding listeners to the RGB device of the WMI
> interface. If WMI does not exist, lazy initialize the interface.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/platform/x86/asus-wmi.c            | 100 ++++++++++++++++++---
>   include/linux/platform_data/x86/asus-wmi.h |  16 ++++
>   2 files changed, 104 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 38ef778e8c19b..21e034be71b2f 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -254,6 +254,8 @@ struct asus_wmi {
>   	int tpd_led_wk;
>   	struct led_classdev kbd_led;
>   	int kbd_led_wk;
> +	bool kbd_led_avail;
> +	bool kbd_led_registered;
>   	struct led_classdev lightbar_led;
>   	int lightbar_led_wk;
>   	struct led_classdev micmute_led;
> @@ -1487,6 +1489,46 @@ static void asus_wmi_battery_exit(struct asus_wmi *asus)
>   
>   /* LEDs ***********************************************************************/
>   
> +LIST_HEAD(asus_brt_listeners);
> +DEFINE_MUTEX(asus_brt_lock);
> +struct asus_wmi *asus_brt_ref;

Could these 3 items contained in a new static struct, it would make it 
easier to see the associations since they're a group.

> +int asus_brt_register_listener(struct asus_brt_listener *bdev)
> +{
> +	int ret;
> +
> +	mutex_lock(&asus_brt_lock);
> +	list_add_tail(&bdev->list, &asus_brt_listeners);
> +	if (asus_brt_ref) {

ret is not initialised if this is false

> +		if (asus_brt_ref->kbd_led_registered && asus_brt_ref->kbd_led_wk >= 0)
> +			bdev->notify(bdev, asus_brt_ref->kbd_led_wk);
> +		else {
> +			asus_brt_ref->kbd_led_registered = true;
> +			ret = led_classdev_register(
> +				&asus_brt_ref->platform_device->dev,
> +				&asus_brt_ref->kbd_led);
> +		}
> +	}
> +	mutex_unlock(&asus_brt_lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(asus_brt_register_listener);
> +
> +void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
> +{
> +	mutex_lock(&asus_brt_lock);
> +	list_del(&bdev->list);
> +
> +	if (asus_brt_ref && asus_brt_ref->kbd_led_registered &&
> +	    list_empty(&asus_brt_listeners) && !asus_brt_ref->kbd_led_avail) {
> +		led_classdev_unregister(&asus_brt_ref->kbd_led);
> +		asus_brt_ref->kbd_led_registered = false;
> +	}
> +	mutex_unlock(&asus_brt_lock);
> +}
> +EXPORT_SYMBOL_GPL(asus_brt_unregister_listener);
> +
>   /*
>    * These functions actually update the LED's, and are called from a
>    * workqueue. By doing this as separate work rather than when the LED
> @@ -1566,6 +1608,7 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
>   
>   static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
>   {
> +	struct asus_brt_listener *listener;
>   	struct asus_wmi *asus;
>   	int max_level;
>   
> @@ -1573,7 +1616,12 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
>   	max_level = asus->kbd_led.max_brightness;
>   
>   	asus->kbd_led_wk = clamp_val(value, 0, max_level);
> -	kbd_led_update(asus);
> +
> +	if (asus->kbd_led_avail)
> +		kbd_led_update(asus);
> +
> +	list_for_each_entry(listener, &asus_brt_listeners, list)
> +		listener->notify(listener, asus->kbd_led_wk);
>   }
>   
>   static void kbd_led_set(struct led_classdev *led_cdev,
> @@ -1583,15 +1631,21 @@ static void kbd_led_set(struct led_classdev *led_cdev,
>   	if (led_cdev->flags & LED_UNREGISTERING)
>   		return;
>   
> +	mutex_lock(&asus_brt_lock);
>   	do_kbd_led_set(led_cdev, value);
> +	mutex_unlock(&asus_brt_lock);
>   }
>   
>   static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
>   {
> -	struct led_classdev *led_cdev = &asus->kbd_led;
> +	struct led_classdev *led_cdev;
> +
> +	mutex_lock(&asus_brt_lock);
> +	led_cdev = &asus->kbd_led;
>   
>   	do_kbd_led_set(led_cdev, value);
>   	led_classdev_notify_brightness_hw_changed(led_cdev, asus->kbd_led_wk);
> +	mutex_unlock(&asus_brt_lock);
>   }
>   
>   static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
> @@ -1601,6 +1655,9 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
>   
>   	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
>   
> +	if (!asus->kbd_led_avail)
> +		return asus->kbd_led_wk;
> +
>   	retval = kbd_led_read(asus, &value, NULL);
>   	if (retval < 0)
>   		return retval;
> @@ -1716,7 +1773,12 @@ static int camera_led_set(struct led_classdev *led_cdev,
>   
>   static void asus_wmi_led_exit(struct asus_wmi *asus)
>   {
> -	led_classdev_unregister(&asus->kbd_led);
> +	mutex_lock(&asus_brt_lock);
> +	asus_brt_ref = NULL;
> +	if (asus->kbd_led_registered)
> +		led_classdev_unregister(&asus->kbd_led);
> +	mutex_unlock(&asus_brt_lock);
> +
>   	led_classdev_unregister(&asus->tpd_led);
>   	led_classdev_unregister(&asus->wlan_led);
>   	led_classdev_unregister(&asus->lightbar_led);
> @@ -1730,6 +1792,7 @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
>   static int asus_wmi_led_init(struct asus_wmi *asus)
>   {
>   	int rv = 0, num_rgb_groups = 0, led_val;
> +	bool has_listeners;
>   
>   	if (asus->kbd_rgb_dev)
>   		kbd_rgb_mode_groups[num_rgb_groups++] = &kbd_rgb_mode_group;
> @@ -1754,24 +1817,37 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>   			goto error;
>   	}
>   
> -	if (!kbd_led_read(asus, &led_val, NULL) && !dmi_check_system(asus_use_hid_led_dmi_ids)) {
> -		pr_info("using asus-wmi for asus::kbd_backlight\n");

Okay so part of the reason the asus_use_hid_led_dmi_ids table was 
created is that some of those laptops had both WMI method, and HID 
method. The WMI method was given priority but on those laptops it didn't 
actually work. What was done was a sort of "blanket" use-hid. I don't 
know why ASUS did this.

> +	asus->kbd_led.name = "asus::kbd_backlight";

I'd like to see this changed to "asus:rgb:kbd_backlight" if RGB is 
supported but this might not be so feasible for the bulk of laptops. 
Given that the Z13 is using a new PID it may be okay there...

> +	asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> +	asus->kbd_led.brightness_set = kbd_led_set;
> +	asus->kbd_led.brightness_get = kbd_led_get;
> +	asus->kbd_led.max_brightness = 3;
> +	asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);

Per the comment 2x above we will get some laptops returning "yes I 
support this" even though it doesn't actually work. It raises two 
questions for me:
1. on machines where it *does* work and they also support HID, do we end 
up with a race condition?
2. what is the effect of that race?

I suspect we might need that quirk table still. Unfortunately I 
no-longer have a device where the WMI method was broken, but I will test 
on one 0x1866 device (2019) and a few 0x19b6

No other comments.

Cheers,
Luke.

> +
> +	if (asus->kbd_led_avail)
>   		asus->kbd_led_wk = led_val;
> -		asus->kbd_led.name = "asus::kbd_backlight";
> -		asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> -		asus->kbd_led.brightness_set = kbd_led_set;
> -		asus->kbd_led.brightness_get = kbd_led_get;
> -		asus->kbd_led.max_brightness = 3;
> +	else
> +		asus->kbd_led_wk = -1;
> +
> +	if (asus->kbd_led_avail && num_rgb_groups != 0)
> +		asus->kbd_led.groups = kbd_rgb_mode_groups;
>   
> -		if (num_rgb_groups != 0)
> -			asus->kbd_led.groups = kbd_rgb_mode_groups;
> +	mutex_lock(&asus_brt_lock);
> +	has_listeners = !list_empty(&asus_brt_listeners);
> +	mutex_unlock(&asus_brt_lock);
>   
> +	if (asus->kbd_led_avail || has_listeners) {
>   		rv = led_classdev_register(&asus->platform_device->dev,
>   					   &asus->kbd_led);
>   		if (rv)
>   			goto error;
> +		asus->kbd_led_registered = true;
>   	}
>   
> +	mutex_lock(&asus_brt_lock);
> +	asus_brt_ref = asus;
> +	mutex_unlock(&asus_brt_lock);
> +
>   	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_WIRELESS_LED)
>   			&& (asus->driver->quirks->wapf > 0)) {
>   		INIT_WORK(&asus->wlan_led_work, wlan_led_update);
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 783e2a336861b..42e963b70acdb 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -157,14 +157,30 @@
>   #define ASUS_WMI_DSTS_MAX_BRIGTH_MASK	0x0000FF00
>   #define ASUS_WMI_DSTS_LIGHTBAR_MASK	0x0000000F
>   
> +struct asus_brt_listener {
> +	struct list_head list;
> +	void (*notify)(struct asus_brt_listener *listener, int brightness);
> +};
> +
>   #if IS_REACHABLE(CONFIG_ASUS_WMI)
>   int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
> +
> +int asus_brt_register_listener(struct asus_brt_listener *cdev);
> +void asus_brt_unregister_listener(struct asus_brt_listener *cdev);
>   #else
>   static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>   					   u32 *retval)
>   {
>   	return -ENODEV;
>   }
> +
> +static inline int asus_brt_register_listener(struct asus_brt_listener *bdev)
> +{
> +	return -ENODEV;
> +}
> +static inline void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
> +{
> +}
>   #endif
>   
>   /* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */


