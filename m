Return-Path: <linux-input+bounces-11078-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB75FA6C880
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 10:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03AA33B973D
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 09:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4B31DBB13;
	Sat, 22 Mar 2025 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="DJt7Fzx0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IdZ7WMWk"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6338194080;
	Sat, 22 Mar 2025 09:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742634367; cv=none; b=WTvPH52HUXw27FuONIyd/iqcDrhMDQ/4oZB7yf1RA4I0mI7VkbCwcdN8oqjqiK9Vj9TW/iK85aVHzGG9TXPcBpYfxiJuxjLRGTdgPgAxLRphPBiZ9/wB7eG+KiKm+TFTzLhNNg14ccvDtC9WJpdgh2UNfaesp1qX43PUU7SYD5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742634367; c=relaxed/simple;
	bh=NBxh7erLOHj43kRoBxjpR5VIPKDR6kkKJ+urt8wILQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r/zUjWMXz5GU2eu6imwoStYNsvwItKSwPkBmM4ZZOZW6t11/JRnPnir1O81YDT5btCmZD4DPTxAaY+MDyXI73kKF4uwfGC+daaVVmB4aaLqLAkr6hbheo4jyrkYFQ7GCa0EAd9eIhGmX4IGMnyCzwkR2d+maEr6Oi07m4gh3Tq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=DJt7Fzx0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IdZ7WMWk; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AEB272540198;
	Sat, 22 Mar 2025 05:06:01 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sat, 22 Mar 2025 05:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742634361;
	 x=1742720761; bh=BBlIN0TdZEzAeNH6HtMTPnIU6Wd6a4Hogj/uPDcw+Yg=; b=
	DJt7Fzx0Y3ImtBK6+9gOI2gOvp09tBBOQQccKlR6WfYA5Fp78KcPih+KFI0LLN/P
	ZkcBSMH8gtVFyfTnuUGzUNtICHY3SaPH+YCdOzIHUazZKPqYHu19aa+czlnoFyml
	B1z/9XkTQVAp/L6UtfoebiWbv1EKycsvejIE9Q/598XqtvPe2i9/Sd1jGZGNHuha
	F3ucJS0rcLOchfcKDzGOa0s5bHBs2Fcjfc2gZjXR10JP7oneBbI1fx+AbOm0O86y
	ObjnhDsb/eIQiQk8n9ZDQhQeZ/Ie87lHMS6DQO/9oj9L0/jR1IJn7rSSA7Z2P2Lq
	sa5SCETH6ZihX9y4uoq6oQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742634361; x=
	1742720761; bh=BBlIN0TdZEzAeNH6HtMTPnIU6Wd6a4Hogj/uPDcw+Yg=; b=I
	dZ7WMWkACE/Duu0exOmJV+V8e+esUYntX1zv1kFciPLDPDhQ1SGsvcOadxGU7l2J
	U60zFavtEfLhtYrQ7Jxmx75aMT4/tfEfjdJPmS218FY3r4/Qz9apQ0iViIcws8Hl
	1LAIlMeu6lw+0XQT1mVXwbbTPblfyjp00n3GIeCTjtYQv/E11CuOXiRJFUT4OdqY
	cty8mSdnH8q7b5nB4RhbYIHfyVVwweLXJiHzADnhbZy9fQ1rhl0Nhz4jCzbvykT/
	+OpuLatZqFV26xm8Faz4nek9/w75xXPbnRizhI1br653EoCV9HHp+Wxj9nb6UCZ+
	39iJ9gqH2ibGfdwHVqKOQ==
X-ME-Sender: <xms:eX3eZxYNv1QIb3NyyqMclWrB4dZ9ZxA1PcrFsO32Gi3dSzeI4YwRvw>
    <xme:eX3eZ4ZyWCdAFdTqte6DW4KTFNeiDJixskzIaD6nwKc30J4sa6tkDjXHFs2h1N-Ke
    scu7J8RSXVfEW_8AIQ>
X-ME-Received: <xmr:eX3eZz9_dfYxOXtb7t1m8l9SmcMgHeHz6JnKx0aKzCdHuHuL-5ml7lmo2LBmC7CCODRzSW-W>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheefheejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:eX3eZ_ozUbUbqGCgDdE5bCTeDdRL6L4YyHwF1PTaB0vaSy_5QA105A>
    <xmx:eX3eZ8qBARsiheHCJrejtY4_aWJQdCP82b0hSjI1cgcSf7yTQaPPNg>
    <xmx:eX3eZ1RbXi1QjFLM7Ynh7po8SEFG9d98-Q4X2siPWrqbu_E_QtvS2w>
    <xmx:eX3eZ0rsR5MU7X4jICmXQByo6n3MTWOE5KZ6Wc9uISM3kmiU3JqToQ>
    <xmx:eX3eZ4e1Dv_E0jsiFYMhHN4eM-5w7a6DTc8NvU-yrvaMH8huvCMXR5up>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Mar 2025 05:05:57 -0400 (EDT)
Message-ID: <efe3c271-e7f9-4c11-9391-706a9498d698@ljones.dev>
Date: Sat, 22 Mar 2025 22:05:55 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] platform/x86: asus-wmi: add keyboard brightness
 event handler
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250320220924.5023-1-lkml@antheas.dev>
 <20250320220924.5023-9-lkml@antheas.dev>
 <9be2c01e-190b-4d55-8ff8-3d89be52fc84@ljones.dev>
 <CAGwozwFDeneALZ_-kOXQ70kg3OQ5BK8ANJrj+32hLHK_PMqVNQ@mail.gmail.com>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <CAGwozwFDeneALZ_-kOXQ70kg3OQ5BK8ANJrj+32hLHK_PMqVNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/25 21:12, Antheas Kapenekakis wrote:
> On Sat, 22 Mar 2025 at 05:31, Luke D. Jones <luke@ljones.dev> wrote:
>>
>> On 21/03/25 11:09, Antheas Kapenekakis wrote:
>>> Currenlty, the keyboard brightness control of Asus WMI keyboards is
>>> handled in the kernel, which leads to the shortcut going from
>>> brightness 0, to 1, to 2, and 3.
>>>
>>> However, for HID keyboards it is exposed as a key and handled by the
>>> user's desktop environment. For the toggle button, this means that
>>> brightness control becomes on/off. In addition, in the absence of a
>>> DE, the keyboard brightness does not work.
>>>
>>> Therefore, expose an event handler for the keyboard brightness control
>>> which can then be used by hid-asus.
>>>
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>> ---
>>>    drivers/platform/x86/asus-wmi.c            | 38 ++++++++++++++++++++++
>>>    include/linux/platform_data/x86/asus-wmi.h | 11 +++++++
>>>    2 files changed, 49 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>>> index 21e034be71b2f..45999dda9e7ed 100644
>>> --- a/drivers/platform/x86/asus-wmi.c
>>> +++ b/drivers/platform/x86/asus-wmi.c
>>> @@ -1529,6 +1529,44 @@ void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
>>>    }
>>>    EXPORT_SYMBOL_GPL(asus_brt_unregister_listener);
>>>
>>> +static void do_kbd_led_set(struct led_classdev *led_cdev, int value);
>>> +
>>> +int asus_brt_event(enum asus_brt_event event)
>>> +{
>>> +     int brightness;
>>> +
>>> +     mutex_lock(&asus_brt_lock);
>>> +     if (!asus_brt_ref || !asus_brt_ref->kbd_led_registered) {
>>> +             mutex_unlock(&asus_brt_lock);
>>> +             return -EBUSY;
>>> +     }
>>> +     brightness = asus_brt_ref->kbd_led_wk;
>>> +
>>> +     switch (event) {
>>> +     case ASUS_BRT_UP:
>>> +             brightness += 1;
>>> +             break;
>>> +     case ASUS_BRT_DOWN:
>>> +             brightness -= 1;
>>> +             break;
>>> +     case ASUS_BRT_TOGGLE:
>>> +             if (brightness >= 3)
>>> +                     brightness = 0;
>>> +             else
>>> +                     brightness += 1;
>>> +             break;
>>> +     }
>>> +
>>> +     do_kbd_led_set(&asus_brt_ref->kbd_led, brightness);
>>> +     led_classdev_notify_brightness_hw_changed(&asus_brt_ref->kbd_led,
>>> +                                               asus_brt_ref->kbd_led_wk);
>>> +
>>> +     mutex_unlock(&asus_brt_lock);
>>> +
>>> +     return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(asus_brt_event);
>>> +
>>
>> I quick test on 6.14-rc7 gives me this:
>>
>> [  288.039255] BUG: sleeping function called from invalid context at
>> kernel/locking/mutex.c:258
>> [  288.039262] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 0,
>> name: swapper/17
>> [  288.039263] preempt_count: 101, expected: 0
>> [  288.039264] RCU nest depth: 0, expected: 0
>> [  288.039266] CPU: 17 UID: 0 PID: 0 Comm: swapper/17 Tainted: G
>> W          6.14.0-rc7+ #164
>> [  288.039268] Tainted: [W]=WARN
>> [  288.039269] Hardware name: ASUSTeK COMPUTER INC. ROG Zephyrus M16
>> GU604VY_GU604VY_00130747B/GU604VY, BIOS GU604VY.313 08/13/2024
>> [  288.039270] Call Trace:
>> [  288.039272]  <IRQ>
>> [  288.039273]  dump_stack_lvl+0x5d/0x80
>> [  288.039277]  __might_resched.cold+0xba/0xc9
>> [  288.039282]  mutex_lock+0x19/0x40
>> [  288.039285]  asus_brt_event+0x13/0xb0 [asus_wmi]
>> [  288.039292]  asus_event+0x91/0xa0 [hid_asus]
>> [  288.039295]  hid_process_event+0xae/0x120
>> [  288.039298]  hid_input_array_field+0x132/0x180
>> [  288.039300]  hid_report_raw_event+0x360/0x4e0
>> [  288.039302]  __hid_input_report.constprop.0+0xf1/0x180
>> [  288.039304]  hid_irq_in+0x17f/0x1b0
>> [  288.039306]  __usb_hcd_giveback_urb+0x98/0x110
>> [  288.039308]  usb_giveback_urb_bh+0xbd/0x150
>> [  288.039310]  process_one_work+0x171/0x290
>> [  288.039312]  bh_worker+0x1ac/0x210
>> [  288.039314]  tasklet_hi_action+0xe/0x30
>> [  288.039315]  handle_softirqs+0xdb/0x1f0
>> [  288.039317]  __irq_exit_rcu+0xc2/0xe0
>> [  288.039318]  common_interrupt+0x85/0xa0
>> [  288.039320]  </IRQ>
>> [  288.039320]  <TASK>
>> [  288.039321]  asm_common_interrupt+0x26/0x40
>> [  288.039323] RIP: 0010:cpuidle_enter_state+0xb9/0x2c0
>> [  288.039325] Code: 40 0f 84 1b 01 00 00 e8 35 e8 13 ff e8 40 f2 ff ff
>> 31 ff 49 89 c5 e8 c6 f0 12 ff 45 84 f6 0f 85 f2 00 00 00 fb 0f 1f 44 00
>> 00 <45> 85 ff 0f 88 cf 00 00 00 49 63 f7 48 8d 04 76 48 8d 04 86 49 8d
>> [  288.039326] RSP: 0018:ffffc90000253e90 EFLAGS: 00000246
>> [  288.039328] RAX: ffff888890680000 RBX: 0000000000000003 RCX:
>> 0000000000000000
>> [  288.039329] RDX: 00000043107862af RSI: fffffffd616e8210 RDI:
>> 0000000000000000
>> [  288.039329] RBP: ffff8888906ba370 R08: 0000000000000000 R09:
>> 0000000000000007
>> [  288.039330] R10: ffff88888ffa6098 R11: 0000000000000008 R12:
>> ffffffff82fd4140
>> [  288.039331] R13: 00000043107862af R14: 0000000000000000 R15:
>> 0000000000000003
>> [  288.039332]  cpuidle_enter+0x28/0x40
>> [  288.039334]  do_idle+0x1a8/0x200
>> [  288.039336]  cpu_startup_entry+0x24/0x30
>> [  288.039337]  start_secondary+0x11e/0x140
>> [  288.039340]  common_startup_64+0x13e/0x141
>> [  288.039342]  </TASK>
>>
>> I think you need to swap the mutex to a spin_lock_irqsave and associated
>> spin_unlock_irqrestore plus DEFINE_SPINLOCK(asus_brt_lock).
>>
>> I'm out of time tonight but I'll apply the above to your patches and
>> report back tomorrow if you don't get to it before I do.
>>
>> It might be worth checking any other mutex uses in the LED path too.
> 
> Thank you for catching that, I will replace the mutex with a spinlock.
> Might have to do with the WMI method being active as I got no such
> issue in my device.

This might highlight the HID + WMI issue I was talking about in the 
other replies and why i think the quirk table is still required.. Or 
perhaps an alternative would be to have HID block the WMI method for the 
0x19b6 PID? There are approximately 30 laptops I know of with both 
methods available.

I just checked the DSDT dump for Ally again and it looks like those are 
all good too. You might have lucked out and ended up with all devices 
with no WMI keyboard brightness :D

> 
>   I guess I will try to do a v3 today as that will hold back our kernel too.
> 
>> Cheers,
>> Luke.
>>
>>>    /*
>>>     * These functions actually update the LED's, and are called from a
>>>     * workqueue. By doing this as separate work rather than when the LED
>>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>>> index add04524031d8..2ac7912d8acd3 100644
>>> --- a/include/linux/platform_data/x86/asus-wmi.h
>>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>>> @@ -162,11 +162,18 @@ struct asus_brt_listener {
>>>        void (*notify)(struct asus_brt_listener *listener, int brightness);
>>>    };
>>>
>>> +enum asus_brt_event {
>>> +     ASUS_BRT_UP,
>>> +     ASUS_BRT_DOWN,
>>> +     ASUS_BRT_TOGGLE,
>>> +};
>>> +
>>>    #if IS_REACHABLE(CONFIG_ASUS_WMI)
>>>    int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
>>>
>>>    int asus_brt_register_listener(struct asus_brt_listener *cdev);
>>>    void asus_brt_unregister_listener(struct asus_brt_listener *cdev);
>>> +int asus_brt_event(enum asus_brt_event event);
>>>    #else
>>>    static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>>>                                           u32 *retval)
>>> @@ -181,6 +188,10 @@ static inline int asus_brt_register_listener(struct asus_brt_listener *bdev)
>>>    static inline void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
>>>    {
>>>    }
>>> +static inline int asus_brt_event(enum asus_brt_event event)
>>> +{
>>> +     return -ENODEV;
>>> +}
>>>    #endif
>>>
>>>    #endif      /* __PLATFORM_DATA_X86_ASUS_WMI_H */
>>


