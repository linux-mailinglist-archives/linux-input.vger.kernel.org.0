Return-Path: <linux-input+bounces-11068-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF0BA6C790
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 05:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8CD21B61204
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 04:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE8242A95;
	Sat, 22 Mar 2025 04:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="aRGYIx3A";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rlO26HhR"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18785EC4;
	Sat, 22 Mar 2025 04:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742617889; cv=none; b=jkdReolnABOkK96o6cca051AFGlFDG5lzTCT9bvLKhBhzsafefaq6iWZ8SAdkfZBwT6jIqJQDelY6QNUgOqKUjoDKSchCr1UMCFsMgoBM8sM0W0JkMg7gbnZ3MHZmuJuYTm6q5cLTgnSsiRmoxhDgqiXNIN8J3vMk1Y83cLQyCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742617889; c=relaxed/simple;
	bh=+6qRX1ELN2q0+JaR5H69aTvPONG5XIyCstWbFH0g3aM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSO08qJcNo++G7eswTm5FYmK9txiAsVqiwbm8HPlExodTuDCgae5isumnum6ctR1xoxMVAL+BCOfcKGLAHy9kgVvsdpwRaT3eO4vBDJfHB1H7NIQra56POu54AQC6RVGL23csvfh9QhiR9R2qMdya7IP9YAPL1ouiH8eIGXydhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=aRGYIx3A; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rlO26HhR; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AED1125400E3;
	Sat, 22 Mar 2025 00:31:25 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 22 Mar 2025 00:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742617885;
	 x=1742704285; bh=KHp+8KU5Y8yrvjptOeOj+4xLi0YtVw78xzrlit+U2XE=; b=
	aRGYIx3AwXLk0HIrFHuAsjpDL4MApVLugwp/hF/xIFgXOae1Reu/CwgCTNw/Tgxk
	p7kf5IpmS3Gf59NCQVn7qfFv6kRdH9VUAApB17m7UVgQkOlEznOOgXBndIQ9WmMX
	qn4pJ8AppOMfk4lkFcye5jjB7Du70e4RJ14SIWZk/X/NMSknxqJDAtIVPmPE9Wu1
	vNVwT2BRM8b6pOmb0s4S2VCS8Wz3gxeK+lxDNHXFoUmwPA6o4e2hPd0uHMY+kYEI
	1/rvPHCDwOZ3ncDrYtRScKcy9uxCPWjQnRhTew7Zwt0DRSvrm/A9hfEbE/dtb92l
	anMhF9QyrBtd5llFUUxh7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742617885; x=
	1742704285; bh=KHp+8KU5Y8yrvjptOeOj+4xLi0YtVw78xzrlit+U2XE=; b=r
	lO26HhRabCIInJu0Inaz3abxxA3eq4zrS2XBfyeB1K4i080vqX1L+ZuXgWMtd9iO
	OusV38WQZXHTInIMPmtZWTJnmYWB3Cv8skf9OzrWkWKWQ0jDsmRgrlB0ctQlD45x
	iAVaJndMC8y9ZhiFqFpE6aZ7hRH8/i9B7H0OkJU1kh2ZmO+acp10XOcYnH6CwJa1
	OEDLo54rVsYwpqY18+oUwv9L59GgxSUP60capliPBwCt9QNexDGu6uKrotmAfFVY
	IM6DT/YtyVlGaLpTugm8dhiJAqOsj5XTp9xJ/LjchrlgtwD7Vnn5b1Wt+DWz4Wzy
	YFkaBVwbMgJN4BxOKLevw==
X-ME-Sender: <xms:HD3eZ815TwgIHuWJ-C4tyUfCJq9O9yeStdrFe-gvs98fxPK6ZH140A>
    <xme:HD3eZ3EmN0gr5fz1X2Kb6hScaYwC04jul7HusJ9eX69QnWmY_XoNquqIKIIUcQq3C
    vK7sNYZ_-rVjejZGCQ>
X-ME-Received: <xmr:HD3eZ048kbGcyLCVxa2CNFwdEd39MVO0LYwhpyMxKIQ0y6y_omzNUWMGw5PwKvrRN7xUH_M->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheeftdduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:HD3eZ10t0JeKWQ0UhmJ77dh_O_RCcy8h_DJSEaIheSX4ftmUJ58GIA>
    <xmx:HD3eZ_GiZGDytL_vF8yTEH1Wln4AFmZ2SWsml_L0XyFgaaNV8IzxdQ>
    <xmx:HD3eZ--CUCp-R6W5__Typ6BJJW5UrooZymyTw56fhAN-iJiHiGapnw>
    <xmx:HD3eZ0kL3MLbynfPYR07aKX37-baJFl0IymIDzkN0QP-Z6K4TyQl0g>
    <xmx:HT3eZ1bUXwO3tzs5Dyy4M0Lr4ABJgveIOSMcdFhQkky4pPdsecqivmxX>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Mar 2025 00:31:21 -0400 (EDT)
Message-ID: <9be2c01e-190b-4d55-8ff8-3d89be52fc84@ljones.dev>
Date: Sat, 22 Mar 2025 17:31:19 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] platform/x86: asus-wmi: add keyboard brightness
 event handler
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250320220924.5023-1-lkml@antheas.dev>
 <20250320220924.5023-9-lkml@antheas.dev>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250320220924.5023-9-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/03/25 11:09, Antheas Kapenekakis wrote:
> Currenlty, the keyboard brightness control of Asus WMI keyboards is
> handled in the kernel, which leads to the shortcut going from
> brightness 0, to 1, to 2, and 3.
> 
> However, for HID keyboards it is exposed as a key and handled by the
> user's desktop environment. For the toggle button, this means that
> brightness control becomes on/off. In addition, in the absence of a
> DE, the keyboard brightness does not work.
> 
> Therefore, expose an event handler for the keyboard brightness control
> which can then be used by hid-asus.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/platform/x86/asus-wmi.c            | 38 ++++++++++++++++++++++
>   include/linux/platform_data/x86/asus-wmi.h | 11 +++++++
>   2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 21e034be71b2f..45999dda9e7ed 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1529,6 +1529,44 @@ void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
>   }
>   EXPORT_SYMBOL_GPL(asus_brt_unregister_listener);
>   
> +static void do_kbd_led_set(struct led_classdev *led_cdev, int value);
> +
> +int asus_brt_event(enum asus_brt_event event)
> +{
> +	int brightness;
> +
> +	mutex_lock(&asus_brt_lock);
> +	if (!asus_brt_ref || !asus_brt_ref->kbd_led_registered) {
> +		mutex_unlock(&asus_brt_lock);
> +		return -EBUSY;
> +	}
> +	brightness = asus_brt_ref->kbd_led_wk;
> +
> +	switch (event) {
> +	case ASUS_BRT_UP:
> +		brightness += 1;
> +		break;
> +	case ASUS_BRT_DOWN:
> +		brightness -= 1;
> +		break;
> +	case ASUS_BRT_TOGGLE:
> +		if (brightness >= 3)
> +			brightness = 0;
> +		else
> +			brightness += 1;
> +		break;
> +	}
> +
> +	do_kbd_led_set(&asus_brt_ref->kbd_led, brightness);
> +	led_classdev_notify_brightness_hw_changed(&asus_brt_ref->kbd_led,
> +						  asus_brt_ref->kbd_led_wk);
> +
> +	mutex_unlock(&asus_brt_lock);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(asus_brt_event);
> +

I quick test on 6.14-rc7 gives me this:

[  288.039255] BUG: sleeping function called from invalid context at 
kernel/locking/mutex.c:258
[  288.039262] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 0, 
name: swapper/17
[  288.039263] preempt_count: 101, expected: 0
[  288.039264] RCU nest depth: 0, expected: 0
[  288.039266] CPU: 17 UID: 0 PID: 0 Comm: swapper/17 Tainted: G 
W          6.14.0-rc7+ #164
[  288.039268] Tainted: [W]=WARN
[  288.039269] Hardware name: ASUSTeK COMPUTER INC. ROG Zephyrus M16 
GU604VY_GU604VY_00130747B/GU604VY, BIOS GU604VY.313 08/13/2024
[  288.039270] Call Trace:
[  288.039272]  <IRQ>
[  288.039273]  dump_stack_lvl+0x5d/0x80
[  288.039277]  __might_resched.cold+0xba/0xc9
[  288.039282]  mutex_lock+0x19/0x40
[  288.039285]  asus_brt_event+0x13/0xb0 [asus_wmi]
[  288.039292]  asus_event+0x91/0xa0 [hid_asus]
[  288.039295]  hid_process_event+0xae/0x120
[  288.039298]  hid_input_array_field+0x132/0x180
[  288.039300]  hid_report_raw_event+0x360/0x4e0
[  288.039302]  __hid_input_report.constprop.0+0xf1/0x180
[  288.039304]  hid_irq_in+0x17f/0x1b0
[  288.039306]  __usb_hcd_giveback_urb+0x98/0x110
[  288.039308]  usb_giveback_urb_bh+0xbd/0x150
[  288.039310]  process_one_work+0x171/0x290
[  288.039312]  bh_worker+0x1ac/0x210
[  288.039314]  tasklet_hi_action+0xe/0x30
[  288.039315]  handle_softirqs+0xdb/0x1f0
[  288.039317]  __irq_exit_rcu+0xc2/0xe0
[  288.039318]  common_interrupt+0x85/0xa0
[  288.039320]  </IRQ>
[  288.039320]  <TASK>
[  288.039321]  asm_common_interrupt+0x26/0x40
[  288.039323] RIP: 0010:cpuidle_enter_state+0xb9/0x2c0
[  288.039325] Code: 40 0f 84 1b 01 00 00 e8 35 e8 13 ff e8 40 f2 ff ff 
31 ff 49 89 c5 e8 c6 f0 12 ff 45 84 f6 0f 85 f2 00 00 00 fb 0f 1f 44 00 
00 <45> 85 ff 0f 88 cf 00 00 00 49 63 f7 48 8d 04 76 48 8d 04 86 49 8d
[  288.039326] RSP: 0018:ffffc90000253e90 EFLAGS: 00000246
[  288.039328] RAX: ffff888890680000 RBX: 0000000000000003 RCX: 
0000000000000000
[  288.039329] RDX: 00000043107862af RSI: fffffffd616e8210 RDI: 
0000000000000000
[  288.039329] RBP: ffff8888906ba370 R08: 0000000000000000 R09: 
0000000000000007
[  288.039330] R10: ffff88888ffa6098 R11: 0000000000000008 R12: 
ffffffff82fd4140
[  288.039331] R13: 00000043107862af R14: 0000000000000000 R15: 
0000000000000003
[  288.039332]  cpuidle_enter+0x28/0x40
[  288.039334]  do_idle+0x1a8/0x200
[  288.039336]  cpu_startup_entry+0x24/0x30
[  288.039337]  start_secondary+0x11e/0x140
[  288.039340]  common_startup_64+0x13e/0x141
[  288.039342]  </TASK>

I think you need to swap the mutex to a spin_lock_irqsave and associated 
spin_unlock_irqrestore plus DEFINE_SPINLOCK(asus_brt_lock).

I'm out of time tonight but I'll apply the above to your patches and 
report back tomorrow if you don't get to it before I do.

It might be worth checking any other mutex uses in the LED path too.

Cheers,
Luke.

>   /*
>    * These functions actually update the LED's, and are called from a
>    * workqueue. By doing this as separate work rather than when the LED
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index add04524031d8..2ac7912d8acd3 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -162,11 +162,18 @@ struct asus_brt_listener {
>   	void (*notify)(struct asus_brt_listener *listener, int brightness);
>   };
>   
> +enum asus_brt_event {
> +	ASUS_BRT_UP,
> +	ASUS_BRT_DOWN,
> +	ASUS_BRT_TOGGLE,
> +};
> +
>   #if IS_REACHABLE(CONFIG_ASUS_WMI)
>   int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
>   
>   int asus_brt_register_listener(struct asus_brt_listener *cdev);
>   void asus_brt_unregister_listener(struct asus_brt_listener *cdev);
> +int asus_brt_event(enum asus_brt_event event);
>   #else
>   static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>   					   u32 *retval)
> @@ -181,6 +188,10 @@ static inline int asus_brt_register_listener(struct asus_brt_listener *bdev)
>   static inline void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
>   {
>   }
> +static inline int asus_brt_event(enum asus_brt_event event)
> +{
> +	return -ENODEV;
> +}
>   #endif
>   
>   #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */


