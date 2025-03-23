Return-Path: <linux-input+bounces-11108-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8799A6CD58
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 01:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51C9C1900192
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 00:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28EDE80B;
	Sun, 23 Mar 2025 00:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="KKCjwZ0Z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="h51EoJjG"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C98A647;
	Sun, 23 Mar 2025 00:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742688150; cv=none; b=f+pROF0jhwW8uO1Dwr1JqV9Zg8q+Xb0uhxW18OE9PLJDtqk0sjVSqQMVI1w4VeliouACDrleWqPYCYDA1/mfAQjEaW4A9I8IAbadO9SgveuarztEWkrV8Zo0wgmqX9L2EKruzY/1vj8LyduLibcU4p6fhlM7Gzg0j/wLGjsQtSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742688150; c=relaxed/simple;
	bh=O+ttea0DDw2DdfK5zNB3ryykRM8eipqaxztowe9szWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h1iK3Q9taZjjL8ZWW39hxZCCxnqNvBeJucFv9nw6cRAwK17bLjOeUW5O3APaM/6I0bg/qvN0pAILuhVb4/p4obV4wEUxfbLcXKsyZZqlWxxsJw4G2QtdE3nt095ep6kzkFfV1wLqE4xGopil7O06TPsGNDxZ3qE1ZsM+kGfI+jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=KKCjwZ0Z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=h51EoJjG; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0D35E2540123;
	Sat, 22 Mar 2025 20:02:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sat, 22 Mar 2025 20:02:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742688145;
	 x=1742774545; bh=l4lcisltpPP5frtq0MoLrLo/xQY/TLoIj/hqYyvHjnE=; b=
	KKCjwZ0ZEn2Yo1YkxB0BlWZ3py7eo+SkrzU+8giuHLfXDSb8kD6BwtX7HQNcrljK
	Uq/rCHIvHFcsBbKEBV9cEzqN+IzRmMLLoNABD+tNLLU+Z11Nw6RqghV/7sGlkU80
	pN5mcr2r/WzkWUCeX+TrO13v59P8UA/MNHdlOWGL1wAqV3OqcWsCo6K2JXerNjrY
	yRvakNyUHVacdi9FN/8z8fpj7LCgqthFhHYjAxjm/nZqPQKjer0flnOatNDOQf9z
	WlyUorQgT19tNz6RPh9s2e8hLjuyYJcQx5fyyj0hse6+4qWEBDBCXuhnZ+1UjIod
	KKZyyBz1ef/hD5FgFPVE4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742688145; x=
	1742774545; bh=l4lcisltpPP5frtq0MoLrLo/xQY/TLoIj/hqYyvHjnE=; b=h
	51EoJjGPwotlVrGh9znKgO5RL93M5AJDsPQdRv5zB2Br9rO9wlZLN8sjiz0pLj0q
	Zv+CnTWievdvRbIeqTY7VpabXoKE9Nqep2fhlje41J/Zkr+8/xu8AeCQULcCB6p0
	AgIgKiNUamta7XEHD2g0DRm3a1PMNp6E+ZCif6BsJsL618jNQ5KbvPuX/Ell4khH
	MBxVyWjeJbHODy6vwJ6bvtbm80hsMrXHF6Ns1Kk58UbpITtRHeeiTsg/7o4g4BXE
	NNUhC837kpKNjvdI0+qpBkxCCUE+zCbkVq5tf1HzuBbtUJqZcEmxDfVyDID2LWin
	xmVuTfXixpuJbvOVpPQDg==
X-ME-Sender: <xms:kU_fZ1AFqLrWQW3G-p_2utz2EVgHBu6y7hi-_5T8FjHQDabocK6qZg>
    <xme:kU_fZzg_BvwO9wcW8mUEIq3iV0xV9PrSF8AP1lP1ePaH5HcefU-RBX5T8lrGet3t8
    cKVlkppFmYPJgbZ4t4>
X-ME-Received: <xmr:kU_fZwmTdbr_JVtxHbVvZiw8Bov8rTtPSuZEzmFSDDYZUJvyT7ZsroWUOdPw6jhREWzzzFES>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheehfeejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:kU_fZ_wcWaVzJb9D33V6WAHvlt60YXG3R_1ntPZxCiHYI5NP9fDMxA>
    <xmx:kU_fZ6SDj_Nd7nJ0AbtGRKJznpUpNerGvHhNEJ93-O85-OBkyAukrA>
    <xmx:kU_fZyYBd7gkDILSA1O-F21nobOLTVKLxeaRmwgTXqgM_xFnt_Tcnw>
    <xmx:kU_fZ7QyWev2SHH4LdUFELPxd1QukgInyc-DAeMYY3DX2g4WYTVaiQ>
    <xmx:kU_fZ9FPw3odOaxnPTrEJgTJvY-MGUhcMAlBhzil1VeUCnnGxj1H1dSn>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Mar 2025 20:02:21 -0400 (EDT)
Message-ID: <515f6258-f38a-49f3-b6ff-a890b139893c@ljones.dev>
Date: Sun, 23 Mar 2025 13:02:19 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] platform/x86: asus-wmi: Add support for multiple
 kbd RGB handlers
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250322102804.418000-1-lkml@antheas.dev>
 <20250322102804.418000-5-lkml@antheas.dev>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250322102804.418000-5-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/25 23:27, Antheas Kapenekakis wrote:
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
>   drivers/platform/x86/asus-wmi.c            | 113 ++++++++++++++++++---
>   include/linux/platform_data/x86/asus-wmi.h |  16 +++
>   2 files changed, 117 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 38ef778e8c19b..95ef9b1d321bb 100644
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
> @@ -1487,6 +1489,53 @@ static void asus_wmi_battery_exit(struct asus_wmi *asus)
>   
>   /* LEDs ***********************************************************************/
>   
> +struct asus_hid_ref {
> +	struct list_head listeners;
> +	struct asus_wmi *asus;
> +	spinlock_t lock;
> +};
> +
> +struct asus_hid_ref asus_ref = {
> +	.listeners = LIST_HEAD_INIT(asus_ref.listeners),
> +	.asus = NULL,
> +	.lock = __SPIN_LOCK_UNLOCKED(asus_ref.lock),
> +};
> +
> +int asus_hid_register_listener(struct asus_hid_listener *bdev)
> +{
> +	unsigned long flags;
> +	int ret = 0;
> +
> +	spin_lock_irqsave(&asus_ref.lock, flags);
> +	list_add_tail(&bdev->list, &asus_ref.listeners);
> +	if (asus_ref.asus) {
> +		if (asus_ref.asus->kbd_led_registered && asus_ref.asus->kbd_led_wk >= 0)
> +			bdev->brightness_set(bdev, asus_ref.asus->kbd_led_wk);
> +
> +		if (!asus_ref.asus->kbd_led_registered) {
> +			ret = led_classdev_register(
> +				&asus_ref.asus->platform_device->dev,
> +				&asus_ref.asus->kbd_led);
> +			if (!ret)
> +				asus_ref.asus->kbd_led_registered = true;
> +		}
> +	}
> +	spin_unlock_irqrestore(&asus_ref.lock, flags);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(asus_hid_register_listener);
> +
> +void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&asus_ref.lock, flags);
> +	list_del(&bdev->list);
> +	spin_unlock_irqrestore(&asus_ref.lock, flags);
> +}
> +EXPORT_SYMBOL_GPL(asus_hid_unregister_listener);
> +
>   /*
>    * These functions actually update the LED's, and are called from a
>    * workqueue. By doing this as separate work rather than when the LED
> @@ -1566,6 +1615,7 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
>   
>   static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
>   {
> +	struct asus_hid_listener *listener;
>   	struct asus_wmi *asus;
>   	int max_level;
>   
> @@ -1573,25 +1623,39 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
>   	max_level = asus->kbd_led.max_brightness;
>   
>   	asus->kbd_led_wk = clamp_val(value, 0, max_level);
> -	kbd_led_update(asus);
> +
> +	if (asus->kbd_led_avail)
> +		kbd_led_update(asus);
> +
> +	list_for_each_entry(listener, &asus_ref.listeners, list)
> +		listener->brightness_set(listener, asus->kbd_led_wk);
>   }
>   
>   static void kbd_led_set(struct led_classdev *led_cdev,
>   			enum led_brightness value)
>   {
> +	unsigned long flags;
> +
>   	/* Prevent disabling keyboard backlight on module unregister */
>   	if (led_cdev->flags & LED_UNREGISTERING)
>   		return;
>   
> +	spin_lock_irqsave(&asus_ref.lock, flags);
>   	do_kbd_led_set(led_cdev, value);
> +	spin_unlock_irqrestore(&asus_ref.lock, flags);
>   }
>   
>   static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
>   {
> -	struct led_classdev *led_cdev = &asus->kbd_led;
> +	struct led_classdev *led_cdev;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&asus_ref.lock, flags);
> +	led_cdev = &asus->kbd_led;
>   
>   	do_kbd_led_set(led_cdev, value);
>   	led_classdev_notify_brightness_hw_changed(led_cdev, asus->kbd_led_wk);
> +	spin_unlock_irqrestore(&asus_ref.lock, flags);
>   }
>   
>   static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
> @@ -1601,6 +1665,9 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
>   
>   	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
>   
> +	if (!asus->kbd_led_avail)
> +		return asus->kbd_led_wk;
> +
>   	retval = kbd_led_read(asus, &value, NULL);
>   	if (retval < 0)
>   		return retval;
> @@ -1716,7 +1783,14 @@ static int camera_led_set(struct led_classdev *led_cdev,
>   
>   static void asus_wmi_led_exit(struct asus_wmi *asus)
>   {
> -	led_classdev_unregister(&asus->kbd_led);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&asus_ref.lock, flags);
> +	asus_ref.asus = NULL;
> +	if (asus->kbd_led_registered)
> +		led_classdev_unregister(&asus->kbd_led);
> +	spin_unlock_irqrestore(&asus_ref.lock, flags);
> +
>   	led_classdev_unregister(&asus->tpd_led);
>   	led_classdev_unregister(&asus->wlan_led);
>   	led_classdev_unregister(&asus->lightbar_led);

I'm getting the following on module unload:

[  247.540357] BUG: sleeping function called from invalid context at 
kernel/locking/rwsem.c:1576
[  247.540360] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 
37685, name: rmmod
[  247.540361] preempt_count: 1, expected: 0
[  247.540361] RCU nest depth: 0, expected: 0
[  247.540362] CPU: 6 UID: 0 PID: 37685 Comm: rmmod Not tainted 
6.14.0-rc7+ #164
[  247.540364] Hardware name: ASUSTeK COMPUTER INC. ROG Zephyrus M16 
GU604VY_GU604VY_00130747B/GU604VY, BIOS GU604VY.313 08/13/2024
[  247.540365] Call Trace:
[  247.540366]  <TASK>
[  247.540366]  dump_stack_lvl+0x5d/0x80
[  247.540372]  __might_resched.cold+0xba/0xc9
[  247.540374]  down_write+0x19/0x70
[  247.540375]  led_classdev_unregister+0x31/0x110
[  247.540378]  asus_wmi_led_exit+0x96/0xa0 [asus_wmi]
[  247.540382]  asus_wmi_remove+0x71/0xf0 [asus_wmi]
[  247.540385]  platform_remove+0x1b/0x30
[  247.540386]  device_release_driver_internal+0x197/0x200
[  247.540388]  bus_remove_device+0xc4/0x130
[  247.540389]  device_del+0x15f/0x3e0
[  247.540391]  platform_device_del+0x20/0x80
[  247.540392]  platform_device_unregister+0xd/0x30
[  247.540393]  asus_wmi_unregister_driver+0x20/0x40 [asus_wmi]
[  247.540395]  __do_sys_delete_module+0x1d1/0x310
[  247.540397]  do_syscall_64+0x82/0x160
[  247.540398]  ? syscall_exit_to_user_mode+0x10/0x1e0
[  247.540399]  ? do_syscall_64+0x8e/0x160
[  247.540399]  ? syscall_exit_to_user_mode+0x10/0x1e0
[  247.540400]  ? do_syscall_64+0x8e/0x160
[  247.540401]  ? syscall_exit_to_user_mode+0x10/0x1e0
[  247.540401]  ? do_syscall_64+0x8e/0x160
[  247.540402]  ? exc_page_fault+0x6a/0xc0
[  247.540402]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  247.540404] RIP: 0033:0x7fc1164d3bcb

The error message indicates the code is in an atomic context 
(`in_atomic(): 1`), with interrupts disabled (`irqs_disabled(): 1`).

I would move:

 > +	if (asus->kbd_led_registered)
 > +		led_classdev_unregister(&asus->kbd_led);

to outside of the spinlock. I quickly tested this and it fixes that 
particular issue.

> @@ -1730,6 +1804,8 @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
>   static int asus_wmi_led_init(struct asus_wmi *asus)
>   {
>   	int rv = 0, num_rgb_groups = 0, led_val;
> +	unsigned long flags;
> +	bool has_listeners;
>   
>   	if (asus->kbd_rgb_dev)
>   		kbd_rgb_mode_groups[num_rgb_groups++] = &kbd_rgb_mode_group;
> @@ -1754,24 +1830,37 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>   			goto error;
>   	}
>   
> -	if (!kbd_led_read(asus, &led_val, NULL) && !dmi_check_system(asus_use_hid_led_dmi_ids)) {
> -		pr_info("using asus-wmi for asus::kbd_backlight\n");
> +	asus->kbd_led.name = "asus::kbd_backlight";
> +	asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> +	asus->kbd_led.brightness_set = kbd_led_set;
> +	asus->kbd_led.brightness_get = kbd_led_get;
> +	asus->kbd_led.max_brightness = 3;
> +	asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
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
> +	spin_lock_irqsave(&asus_ref.lock, flags);
> +	has_listeners = !list_empty(&asus_ref.listeners);
> +	spin_unlock_irqrestore(&asus_ref.lock, flags);
>   
> +	if (asus->kbd_led_avail || has_listeners) {
>   		rv = led_classdev_register(&asus->platform_device->dev,
>   					   &asus->kbd_led);
>   		if (rv)
>   			goto error;
> +		asus->kbd_led_registered = true;
>   	}
>   
> +	spin_lock_irqsave(&asus_ref.lock, flags);
> +	asus_ref.asus = asus;
> +	spin_unlock_irqrestore(&asus_ref.lock, flags);
> +
>   	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_WIRELESS_LED)
>   			&& (asus->driver->quirks->wapf > 0)) {
>   		INIT_WORK(&asus->wlan_led_work, wlan_led_update);
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 783e2a336861b..ec8b0c585a63f 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -157,14 +157,30 @@
>   #define ASUS_WMI_DSTS_MAX_BRIGTH_MASK	0x0000FF00
>   #define ASUS_WMI_DSTS_LIGHTBAR_MASK	0x0000000F
>   
> +struct asus_hid_listener {
> +	struct list_head list;
> +	void (*brightness_set)(struct asus_hid_listener *listener, int brightness);
> +};
> +
>   #if IS_REACHABLE(CONFIG_ASUS_WMI)
>   int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
> +
> +int asus_hid_register_listener(struct asus_hid_listener *cdev);
> +void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
>   #else
>   static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>   					   u32 *retval)
>   {
>   	return -ENODEV;
>   }
> +
> +static inline int asus_hid_register_listener(struct asus_hid_listener *bdev)
> +{
> +	return -ENODEV;
> +}
> +static inline void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
> +{
> +}
>   #endif
>   
>   /* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */

I did additional testing on the older 0x1866 which has WMI plus HID 
brightness ability and it appears to work fine. I might add debug 
logging later to gie us some insight in to this exact situation though.

Fixing the spinlock, I'll add my tags:

Reviewed-by: Luke D. Jones <luke@ljones.dev>
Tested-by: Luke D. Jones <luke@ljones.dev>


