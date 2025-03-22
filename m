Return-Path: <linux-input+bounces-11085-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F43A6C8CE
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 10:34:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F493172EEE
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 09:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636271EF0A3;
	Sat, 22 Mar 2025 09:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="yl0Gq3HI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="7TBEJT4H"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114331C84D6;
	Sat, 22 Mar 2025 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742636060; cv=none; b=vE0J7lwzHUjW0DH3KNsPeX2KnD/UOwqseilOLNG+TEf9i0PlCwvZV11TzSHkr5cM3YVtrXC7y+CxLPbTOYyUXdpdPTSv7l/RnR/ZuL8jV4RlWdh9TOTfx+kIZ9zWh0nd98Q8u2AnLGbSrmE5+Z9BsJxLQfMNrVQCiEurTNUVY5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742636060; c=relaxed/simple;
	bh=H2ju/DVP6BjlWd6Rp84RFftclTvHmO7lDQCKDNWu1m4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qoalBGvOYeFDWejEfnV8YRyYApgG9DMgnI3GA4amMTxvQbd+5gQaYHxlc23dg2RM2mbxLTUPU1+zXPCNlEo51NmTZhLp3Mpad7ZGc6UNd1MbUR5j39RePh6hkMzX7z5x6hi18bIvP3g0jyr24Y/f6Ugs39Ce6lCNO1k5r2HNOMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=yl0Gq3HI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=7TBEJT4H; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id E669511400E9;
	Sat, 22 Mar 2025 05:34:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 22 Mar 2025 05:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742636056;
	 x=1742722456; bh=E6v+J4jGVt5Zx60YXBsMPoF3DqAwuXHTThAsPR5erZ0=; b=
	yl0Gq3HI2H97L43/QqgKkl0nncGwulIahnXkcleLT9nfReAfHkiv7/wXPCZH83yU
	ZGNEJMYVNW0VAxbpUGcrspxeq5jbZZ3m84FcqWFqid/OtaXkG4i05iXCyVRHFjzL
	hnhhac/6ajR/oiwf66ZZQriirhHL/JiW3k9uTgA0i+TxwyaswsQRYDsRYMjf9X95
	az9rF98uJB544FiY3AKIcKP/WkA/hFjJq8ZBn3WfnzsUzojniuhLFfWFPiEvKh5H
	hLg0V4izWZylMNUJwsyLk93zxRP/AwBaPDA0CXzOI7lL4tKvocw19Gta7MxQpKGX
	Jmei0yGe6Sub+8V38xnPTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742636056; x=
	1742722456; bh=E6v+J4jGVt5Zx60YXBsMPoF3DqAwuXHTThAsPR5erZ0=; b=7
	TBEJT4HIU/flol1XluKRpvT7elnFl3WoTW3Zklp1xE7d0NcL4qSIN+lAmgWHK5gw
	QGXJOxr/x74EekxlD92hhUX85Gu8Y3oqMIl0Um8FGjWw9rOeAFPh6SUWY0sJkwKY
	b7OeUzWSQTMeteKdVnMMvQ0+0pzgaqqe7zBCACU0f1Jw5j59vnQtuXWJCweinx2m
	7P8qHwQUxeE03A+x/8AQXuk8QUkhXn0udP6Sko6yCcIpbti0a+Fxv97r9lxz14KJ
	0zT6eRyLNWKXtfoD6e64IDRSE+NSWxUN52qaGwXN+gHg9W4aGZnL+1iFBHcO/IJZ
	yRoqTZoXy46dq6Du81Zzg==
X-ME-Sender: <xms:GITeZyNw26SHGBz_B-PRsunfUSAN0z06Pcy-M-Qk34gCz2BRIAQ3rg>
    <xme:GITeZw9NaFoFbh23bCyoZH_di4tzxdLebAc8A_MNwVrFYZkPabhj_nffdxxGbGri9
    G9Jjb0l8HbVTk22ccc>
X-ME-Received: <xmr:GITeZ5Sh2DbCb2VBJJGICUTcG6LW0rQzc7GJWU2G8Vx8Qc9EM4_jwlXvlZ0e0zndFrVIFbmV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheefieefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:GITeZyswu4x6xUup3oqIvTxEO3QBoTzKGc-GoGh-RW4gtwEP9HCQCQ>
    <xmx:GITeZ6fo4QZQ1t2NYP2x-A1YmqQm4UxFSrNYun6MmUbi4K65Od7loA>
    <xmx:GITeZ221ELLByBrtZ9hsUNtvayCleIPxQsHHkmnh7MhnTiVVHOTBYg>
    <xmx:GITeZ---Ng0jsoWCS1DksU3rqyIW_EdqtBrfhxKf5I2SFLEHm2jSJw>
    <xmx:GITeZxwXA42QRQO2ZE948TwUsDzyF5TVNxsWXVv9jcOrrDBwC_e46NvS>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Mar 2025 05:34:12 -0400 (EDT)
Message-ID: <eaa7ade5-192f-4fa9-acda-f608f5b9ee2e@ljones.dev>
Date: Sat, 22 Mar 2025 22:34:10 +1300
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
 <efe3c271-e7f9-4c11-9391-706a9498d698@ljones.dev>
 <CAGwozwGmKw3C-vBtQ7sRf=KKwiKnw+oykOgMtjAAyeNdh_rr=w@mail.gmail.com>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <CAGwozwGmKw3C-vBtQ7sRf=KKwiKnw+oykOgMtjAAyeNdh_rr=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/25 22:13, Antheas Kapenekakis wrote:
> On Sat, 22 Mar 2025 at 10:06, Luke D. Jones <luke@ljones.dev> wrote:
>>
>> On 22/03/25 21:12, Antheas Kapenekakis wrote:
>>> On Sat, 22 Mar 2025 at 05:31, Luke D. Jones <luke@ljones.dev> wrote:
>>>>
>>>> On 21/03/25 11:09, Antheas Kapenekakis wrote:
>>>>> Currenlty, the keyboard brightness control of Asus WMI keyboards is
>>>>> handled in the kernel, which leads to the shortcut going from
>>>>> brightness 0, to 1, to 2, and 3.
>>>>>
>>>>> However, for HID keyboards it is exposed as a key and handled by the
>>>>> user's desktop environment. For the toggle button, this means that
>>>>> brightness control becomes on/off. In addition, in the absence of a
>>>>> DE, the keyboard brightness does not work.
>>>>>
>>>>> Therefore, expose an event handler for the keyboard brightness control
>>>>> which can then be used by hid-asus.
>>>>>
>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>>> ---
>>>>>     drivers/platform/x86/asus-wmi.c            | 38 ++++++++++++++++++++++
>>>>>     include/linux/platform_data/x86/asus-wmi.h | 11 +++++++
>>>>>     2 files changed, 49 insertions(+)
>>>>>
>>>>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>>>>> index 21e034be71b2f..45999dda9e7ed 100644
>>>>> --- a/drivers/platform/x86/asus-wmi.c
>>>>> +++ b/drivers/platform/x86/asus-wmi.c
>>>>> @@ -1529,6 +1529,44 @@ void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
>>>>>     }
>>>>>     EXPORT_SYMBOL_GPL(asus_brt_unregister_listener);
>>>>>
>>>>> +static void do_kbd_led_set(struct led_classdev *led_cdev, int value);
>>>>> +
>>>>> +int asus_brt_event(enum asus_brt_event event)
>>>>> +{
>>>>> +     int brightness;
>>>>> +
>>>>> +     mutex_lock(&asus_brt_lock);
>>>>> +     if (!asus_brt_ref || !asus_brt_ref->kbd_led_registered) {
>>>>> +             mutex_unlock(&asus_brt_lock);
>>>>> +             return -EBUSY;
>>>>> +     }
>>>>> +     brightness = asus_brt_ref->kbd_led_wk;
>>>>> +
>>>>> +     switch (event) {
>>>>> +     case ASUS_BRT_UP:
>>>>> +             brightness += 1;
>>>>> +             break;
>>>>> +     case ASUS_BRT_DOWN:
>>>>> +             brightness -= 1;
>>>>> +             break;
>>>>> +     case ASUS_BRT_TOGGLE:
>>>>> +             if (brightness >= 3)
>>>>> +                     brightness = 0;
>>>>> +             else
>>>>> +                     brightness += 1;
>>>>> +             break;
>>>>> +     }
>>>>> +
>>>>> +     do_kbd_led_set(&asus_brt_ref->kbd_led, brightness);
>>>>> +     led_classdev_notify_brightness_hw_changed(&asus_brt_ref->kbd_led,
>>>>> +                                               asus_brt_ref->kbd_led_wk);
>>>>> +
>>>>> +     mutex_unlock(&asus_brt_lock);
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(asus_brt_event);
>>>>> +
>>>>
>>>> I quick test on 6.14-rc7 gives me this:
>>>>
>>>> [  288.039255] BUG: sleeping function called from invalid context at
>>>> kernel/locking/mutex.c:258
>>>> [  288.039262] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 0,
>>>> name: swapper/17
>>>> [  288.039263] preempt_count: 101, expected: 0
>>>> [  288.039264] RCU nest depth: 0, expected: 0
>>>> [  288.039266] CPU: 17 UID: 0 PID: 0 Comm: swapper/17 Tainted: G
>>>> W          6.14.0-rc7+ #164
>>>> [  288.039268] Tainted: [W]=WARN
>>>> [  288.039269] Hardware name: ASUSTeK COMPUTER INC. ROG Zephyrus M16
>>>> GU604VY_GU604VY_00130747B/GU604VY, BIOS GU604VY.313 08/13/2024
>>>> [  288.039270] Call Trace:
>>>> [  288.039272]  <IRQ>
>>>> [  288.039273]  dump_stack_lvl+0x5d/0x80
>>>> [  288.039277]  __might_resched.cold+0xba/0xc9
>>>> [  288.039282]  mutex_lock+0x19/0x40
>>>> [  288.039285]  asus_brt_event+0x13/0xb0 [asus_wmi]
>>>> [  288.039292]  asus_event+0x91/0xa0 [hid_asus]
>>>> [  288.039295]  hid_process_event+0xae/0x120
>>>> [  288.039298]  hid_input_array_field+0x132/0x180
>>>> [  288.039300]  hid_report_raw_event+0x360/0x4e0
>>>> [  288.039302]  __hid_input_report.constprop.0+0xf1/0x180
>>>> [  288.039304]  hid_irq_in+0x17f/0x1b0
>>>> [  288.039306]  __usb_hcd_giveback_urb+0x98/0x110
>>>> [  288.039308]  usb_giveback_urb_bh+0xbd/0x150
>>>> [  288.039310]  process_one_work+0x171/0x290
>>>> [  288.039312]  bh_worker+0x1ac/0x210
>>>> [  288.039314]  tasklet_hi_action+0xe/0x30
>>>> [  288.039315]  handle_softirqs+0xdb/0x1f0
>>>> [  288.039317]  __irq_exit_rcu+0xc2/0xe0
>>>> [  288.039318]  common_interrupt+0x85/0xa0
>>>> [  288.039320]  </IRQ>
>>>> [  288.039320]  <TASK>
>>>> [  288.039321]  asm_common_interrupt+0x26/0x40
>>>> [  288.039323] RIP: 0010:cpuidle_enter_state+0xb9/0x2c0
>>>> [  288.039325] Code: 40 0f 84 1b 01 00 00 e8 35 e8 13 ff e8 40 f2 ff ff
>>>> 31 ff 49 89 c5 e8 c6 f0 12 ff 45 84 f6 0f 85 f2 00 00 00 fb 0f 1f 44 00
>>>> 00 <45> 85 ff 0f 88 cf 00 00 00 49 63 f7 48 8d 04 76 48 8d 04 86 49 8d
>>>> [  288.039326] RSP: 0018:ffffc90000253e90 EFLAGS: 00000246
>>>> [  288.039328] RAX: ffff888890680000 RBX: 0000000000000003 RCX:
>>>> 0000000000000000
>>>> [  288.039329] RDX: 00000043107862af RSI: fffffffd616e8210 RDI:
>>>> 0000000000000000
>>>> [  288.039329] RBP: ffff8888906ba370 R08: 0000000000000000 R09:
>>>> 0000000000000007
>>>> [  288.039330] R10: ffff88888ffa6098 R11: 0000000000000008 R12:
>>>> ffffffff82fd4140
>>>> [  288.039331] R13: 00000043107862af R14: 0000000000000000 R15:
>>>> 0000000000000003
>>>> [  288.039332]  cpuidle_enter+0x28/0x40
>>>> [  288.039334]  do_idle+0x1a8/0x200
>>>> [  288.039336]  cpu_startup_entry+0x24/0x30
>>>> [  288.039337]  start_secondary+0x11e/0x140
>>>> [  288.039340]  common_startup_64+0x13e/0x141
>>>> [  288.039342]  </TASK>
>>>>
>>>> I think you need to swap the mutex to a spin_lock_irqsave and associated
>>>> spin_unlock_irqrestore plus DEFINE_SPINLOCK(asus_brt_lock).
>>>>
>>>> I'm out of time tonight but I'll apply the above to your patches and
>>>> report back tomorrow if you don't get to it before I do.
>>>>
>>>> It might be worth checking any other mutex uses in the LED path too.
>>>
>>> Thank you for catching that, I will replace the mutex with a spinlock.
>>> Might have to do with the WMI method being active as I got no such
>>> issue in my device.
>>
>> This might highlight the HID + WMI issue I was talking about in the
>> other replies and why i think the quirk table is still required.. Or
>> perhaps an alternative would be to have HID block the WMI method for the
>> 0x19b6 PID? There are approximately 30 laptops I know of with both
>> methods available.
>>
>> I just checked the DSDT dump for Ally again and it looks like those are
>> all good too. You might have lucked out and ended up with all devices
>> with no WMI keyboard brightness :D
> 
> Well we for sure will need to test a device that has both. The intent
> of this series is to align both the WMI and HID, which is why it is
> placed in WMI. If it NOOPs it should be ok.
> 
> However if the set noops and the get returns dummy data that might be an issue.

Unfortunately I don't recall the exact device now sorry. I though it was 
the GU605, but that like the GA605, ProArt, Ally, and Z13 all missing 
the WMI method, so those are fine.

This is an sample of some of the other laptops:

GL553VE.dsl
37871:                    If ((IIA0 == 0x00050021))
37872-                    {
37873-                        If (GLKB (One))
37874-                        {
37875-                            Local0 <<= 0x08
37876-                            Local0 += GLKB (0x02)
--
38581:                    If ((IIA0 == 0x00050021))
38582-                    {
38583-                        SLKB (IIA1)
38584-                        Return (One)
38585-                    }
38586-

GU603Z-3.10.dsl
90702:                    If ((IIA0 == 0x00050021))
90703-                    {
90704-                        Return (0xFFFFFFFE)
90705-                    }
90706-
90707-                    If ((IIA0 == 0x00100051))
--
91125:                    If ((IIA0 == 0x00050021))
91126-                    {
91127-                        ^^PC00.LPCB.EC0.SLKB (IIA1)
91128-                        Return (One)
91129-                    }
91130-

G713Q.dsl
8454:                If ((IIA0 == 0x00050021))
8455-                {
8456-                    Return (Zero)
8457-                }
8458-
8459-                If ((IIA0 == 0x00050031))
--
9092:                If ((IIA0 == 0x00050021))
9093-                {
9094-                    Return (Zero)
9095-                }

H7606WI.dsl
9881:                If ((IIA0 == 0x00050021))
9882-                {
9883-                    Local0 = Zero
9884-                    Local0 = ^^PCI0.SBRG.EC0.KBLL /* 
\_SB_.PCI0.SBRG.EC0_.KBLL */
9885-                    Local0 |= 0x00350000
9886-                    Return (Local0)
--
10663:                If ((IIA0 == 0x00050021))
10664-                {
10665-                    Local0 = Zero
10666-                    Local0 = (IIA1 & 0x83)
10667-                    ^^PCI0.SBRG.EC0.KBLL = Local0
10668-                    Return (One)

GU603-b310-dsdt.dsl
91115:                    If ((IIA0 == 0x00050011))
91116-                    {
91117-                        If ((IIA1 == 0x02))
91118-                        {
91119-                            ^^PC00.LPCB.EC0.BLCT = One
91120-                        }
91121-
91122-                        Return (One)
91123-                    }

GU502GU.dsl
59909:                    If ((IIA0 == 0x00050011))
59910-                    {
59911-                        If ((IIA1 == 0x02))
59912-                        {
59913-                            ^^PCI0.LPCB.EC0.BLCT = One
59914-                        }
59915-
59916-                        Return (One)
59917-                    }

Hopefully that's enough data-points to work with? Let me know if there's 
anything else i can provide or clarify.

>>>
>>>    I guess I will try to do a v3 today as that will hold back our kernel too.
>>>
>>>> Cheers,
>>>> Luke.
>>>>
>>>>>     /*
>>>>>      * These functions actually update the LED's, and are called from a
>>>>>      * workqueue. By doing this as separate work rather than when the LED
>>>>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>>>>> index add04524031d8..2ac7912d8acd3 100644
>>>>> --- a/include/linux/platform_data/x86/asus-wmi.h
>>>>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>>>>> @@ -162,11 +162,18 @@ struct asus_brt_listener {
>>>>>         void (*notify)(struct asus_brt_listener *listener, int brightness);
>>>>>     };
>>>>>
>>>>> +enum asus_brt_event {
>>>>> +     ASUS_BRT_UP,
>>>>> +     ASUS_BRT_DOWN,
>>>>> +     ASUS_BRT_TOGGLE,
>>>>> +};
>>>>> +
>>>>>     #if IS_REACHABLE(CONFIG_ASUS_WMI)
>>>>>     int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
>>>>>
>>>>>     int asus_brt_register_listener(struct asus_brt_listener *cdev);
>>>>>     void asus_brt_unregister_listener(struct asus_brt_listener *cdev);
>>>>> +int asus_brt_event(enum asus_brt_event event);
>>>>>     #else
>>>>>     static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>>>>>                                            u32 *retval)
>>>>> @@ -181,6 +188,10 @@ static inline int asus_brt_register_listener(struct asus_brt_listener *bdev)
>>>>>     static inline void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
>>>>>     {
>>>>>     }
>>>>> +static inline int asus_brt_event(enum asus_brt_event event)
>>>>> +{
>>>>> +     return -ENODEV;
>>>>> +}
>>>>>     #endif
>>>>>
>>>>>     #endif      /* __PLATFORM_DATA_X86_ASUS_WMI_H */
>>>>
>>


