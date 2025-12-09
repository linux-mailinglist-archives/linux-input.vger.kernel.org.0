Return-Path: <linux-input+bounces-16515-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60691CB136F
	for <lists+linux-input@lfdr.de>; Tue, 09 Dec 2025 22:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAAAC3026AE7
	for <lists+linux-input@lfdr.de>; Tue,  9 Dec 2025 21:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E372EBDE3;
	Tue,  9 Dec 2025 21:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="TVONYPax"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6F71D27B6
	for <linux-input@vger.kernel.org>; Tue,  9 Dec 2025 21:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765316333; cv=none; b=XKFdD6Nvn0hS0BxzOXBSr10hPOOHyGwMTcRmUFB/Ju3upMYqLfiYQdyz6PfzwMKGDrjdCwMape7SlKammec5WVBPToHJnjPPDS24fhbAOTxZJcEJGZtYTxpZ2RSBA6DaC0VuTpGinRQ6dZ/xGyDv96ip5qS5QDDCwELKvSN9ldU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765316333; c=relaxed/simple;
	bh=xDQZ0o8UT/eNdOJcbkteYOjwLa0ybvpWb6p7o0DDnuY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ZIuD/LBr75rJgXmli/X2EdvnLPakO4uEQawPWHIJcH/jDlA2XMX0/XD3cydz6xr+duao5EevRfibS1+4XzKJojLNMVLgpbLKFEqg6KQ6WMd58sE1+9UFsZ0Pauw/mlbG/9FUTqb9eano0jVzoTEAN2s/iFjWR8mg1Ge/7XeFyvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=TVONYPax; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1765316313; x=1765921113; i=w_armin@gmx.de;
	bh=ZloyPZsmiwYOVXX9vZIR9U/iHjCrHHDC+9h9yScETX4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TVONYPaxzieMUlNRIenWm3EwB+fpozXBLbHa7L8h7mPYly/4QcxhNeCfm/JEf/2S
	 sltSL/iic3aEa3M8s2Z553P15j6PWpjBYqDmJr2wqcOQ+hIv9aDdPY+yFcnFBv+IX
	 LEJKkMpES9BCX/3vQo5K5CrYwKBZE94VfFyuwxhzpfZNt25ttRc/8ymwgrhcctMAq
	 SjAt44bqxkS+OGugaTNSs8uBdNVAyrNqB6YIF4aY55gjzC+Mb7wzBK4QqMZQYWRVp
	 J2E3P3m8BdACvKDJtC+OXGOBCUVyXAaW3f7pb1WJBKaG0fY7y3rkfS8Rlz952WzNy
	 N/2zAnPxOJP/0ckKww==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHXFr-1vGBFg0fAX-007k0q; Tue, 09
 Dec 2025 22:38:33 +0100
Message-ID: <6b95752e-831f-4d70-a435-e404ee423be5@gmx.de>
Date: Tue, 9 Dec 2025 22:38:32 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: de@users.sourceforge.net
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>
From: Armin Wolf <W_Armin@gmx.de>
Subject: [Bug] roccat_report_event() uses mutex_lock() inside a interrupt
 handler
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:17avjuMTN75OrkS5BvNsZUWaqipRa9yQ5pGgjNjm1cFEy6yx4JA
 LfseRemnuBqFAOAQVLtwhjayv09ZTvebmVcPuaRwQW+xKLsVzRAAlm1UF/Vx2KiumtkoOOR
 xJ15YFjdkm2PEMfp28z5NuwajkqzncWMK8iB0X8fFELQ0LcXX8BXIGpx7AYIZdBRiXzi1+d
 AIXmYcpIXyeTgIWSwC7gA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Tt0yIHieAWM=;bCbKK7FmYW+SuUoRACq/uAy5zfF
 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
 uLlLdPbw=

Hello,

i finally had the time to debug an locking issue inside the driver of my Roccat Ryos USB keyboard:

[   24.370282] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:591
[   24.370564] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 0, name: swapper/7
[   24.370573] preempt_count: 101, expected: 0
[   24.370580] RCU nest depth: 0, expected: 0
[   24.370587] 2 locks held by swapper/7/0:
[   24.370593]  #0: ffff9881c0053d48 ((wq_completion)events_bh_highpri){+.-.}-{0:0}, at: process_one_work+0x425/0x6a0
[   24.370624]  #1: ffffbb560036cee0 ((work_completion)(&bh->bh)){+.-.}-{0:0}, at: process_one_work+0x1e5/0x6a0
[   24.370652] Preemption disabled at:
[   24.370656] [<ffffffffbb37f9b6>] __raw_spin_lock_irqsave+0x26/0x60
[   24.370669] CPU: 7 UID: 0 PID: 0 Comm: swapper/7 Tainted: G            E       6.18.0+ #13 PREEMPT(voluntary)
[   24.370673] Tainted: [E]=UNSIGNED_MODULE
[   24.370674] Hardware name: ASUS System Product Name/PRIME B650-PLUS, BIOS 3602 11/13/2025
[   24.370675] Call Trace:
[   24.370677]  <IRQ>
[   24.370680]  dump_stack_lvl+0x8d/0xb0
[   24.370687]  __might_resched+0x1a0/0x2b0
[   24.370696]  __mutex_lock+0x67/0x1020
[   24.370699]  ? __create_object+0x5e/0x90
[   24.370706]  ? srso_alias_return_thunk+0x5/0xfbef5
[   24.370709]  ? roccat_report_event+0x44/0xe0 [hid_roccat]
[   24.370712]  ? srso_alias_return_thunk+0x5/0xfbef5
[   24.370718]  ? roccat_report_event+0x27/0xe0 [hid_roccat]
[   24.370735]  ? roccat_report_event+0x44/0xe0 [hid_roccat]
[   24.370737]  ? srso_alias_return_thunk+0x5/0xfbef5
[   24.370739]  roccat_report_event+0x44/0xe0 [hid_roccat]
[   24.370746]  ryos_raw_event+0x3f/0x50 [hid_roccat_ryos]
[   24.370750]  __hid_input_report+0x129/0x1f0 [hid]
[   24.370766]  hid_input_report+0x11/0x20 [hid]
[   24.370773]  hid_irq_in+0x104/0x1f0 [usbhid]
[   24.370783]  __usb_hcd_giveback_urb+0xa0/0x120 [usbcore]
[   24.370800]  usb_giveback_urb_bh+0xa6/0x130 [usbcore]
[   24.370820]  process_one_work+0x226/0x6a0
[   24.370824]  ? srso_alias_return_thunk+0x5/0xfbef5
[   24.370839]  bh_worker+0x17b/0x1e0
[   24.370849]  tasklet_hi_action+0x17/0x40
[   24.370853]  handle_softirqs+0xe8/0x410
[   24.370866]  __irq_exit_rcu+0xca/0x120
[   24.370868]  irq_exit_rcu+0xa/0x30
[   24.370871]  common_interrupt+0xb8/0xd0
[   24.370875]  </IRQ>
[   24.370876]  <TASK>
[   24.370881]  asm_common_interrupt+0x22/0x40
[   24.370883] RIP: 0010:cpuidle_enter_state+0x12c/0x4f0
[   24.370886] Code: 01 48 0f a3 05 e5 93 0c 01 0f 82 b4 02 00 00 31 ff e8 98 3a 34 ff 45 84 ff 0f 85 02 02 00 00 e8 1a a8 48 ff fb 0f 1f 44 00 00 <45> 85 f6 0f 88 d4 01 00 00 49 63 d6 48 8d 04 52 48 8d 04 82 49 8d
[   24.370887] RSP: 0018:ffffbb56001d7e68 EFLAGS: 00000202
[   24.370889] RAX: 0000000000030185 RBX: ffff9881e1345c00 RCX: 0000000000000000
[   24.370891] RDX: 0000000000000000 RSI: ffffffffbc7884ca RDI: ffffffffbc767f8c
[   24.370892] RBP: 0000000000000003 R08: 0000000000000001 R09: 0000000000000000
[   24.370893] R10: 0000000000000001 R11: 0000000000000000 R12: ffffffffbd029e60
[   24.370893] R13: 00000005ac93dbee R14: 0000000000000003 R15: 0000000000000000
[   24.370916]  ? cpuidle_enter_state+0x126/0x4f0
[   24.370926]  cpuidle_enter+0x29/0x40
[   24.370933]  cpuidle_idle_call+0xff/0x180
[   24.370942]  do_idle+0x8e/0xe0
[   24.370947]  cpu_startup_entry+0x25/0x30
[   24.370950]  start_secondary+0x11c/0x140
[   24.370957]  common_startup_64+0x13e/0x141
[   24.370984]  </TASK>

[   24.371060] =============================
[   24.371063] [ BUG: Invalid wait context ]
[   24.371065] 6.18.0+ #13 Tainted: G        W   E
[   24.371068] -----------------------------
[   24.371071] swapper/7/0 is trying to lock:
[   24.371073] ffff9881d2a52200 (&device->cbuf_lock){....}-{4:4}, at: roccat_report_event+0x44/0xe0 [hid_roccat]
[   24.371083] other info that might help us debug this:
[   24.371085] context-{3:3}
[   24.371088] 2 locks held by swapper/7/0:
[   24.371090]  #0: ffff9881c0053d48 ((wq_completion)events_bh_highpri){+.-.}-{0:0}, at: process_one_work+0x425/0x6a0
[   24.371100]  #1: ffffbb560036cee0 ((work_completion)(&bh->bh)){+.-.}-{0:0}, at: process_one_work+0x1e5/0x6a0
[   24.371110] stack backtrace:
[   24.371113] CPU: 7 UID: 0 PID: 0 Comm: swapper/7 Tainted: G        W   E       6.18.0+ #13 PREEMPT(voluntary)
[   24.371116] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE
[   24.371116] Hardware name: ASUS System Product Name/PRIME B650-PLUS, BIOS 3602 11/13/2025
[   24.371117] Call Trace:
[   24.371118]  <IRQ>
[   24.371120]  dump_stack_lvl+0x73/0xb0
[   24.371123]  __lock_acquire+0x966/0xbb0
[   24.371127]  ? __raw_spin_lock_irqsave+0x26/0x60
[   24.371131]  lock_acquire.part.0+0xa9/0x230
[   24.371135]  ? roccat_report_event+0x44/0xe0 [hid_roccat]
[   24.371139]  ? srso_alias_return_thunk+0x5/0xfbef5
[   24.371141]  ? rcu_is_watching+0xd/0x40
[   24.371144]  ? srso_alias_return_thunk+0x5/0xfbef5
[   24.371145]  ? lock_acquire+0xee/0x110
[   24.371151]  __mutex_lock+0xb3/0x1020
[   24.371153]  ? roccat_report_event+0x44/0xe0 [hid_roccat]
[   24.371155]  ? __create_object+0x5e/0x90
[   24.371158]  ? srso_alias_return_thunk+0x5/0xfbef5
[   24.371160]  ? roccat_report_event+0x44/0xe0 [hid_roccat]
[   24.371162]  ? srso_alias_return_thunk+0x5/0xfbef5
[   24.371165]  ? roccat_report_event+0x27/0xe0 [hid_roccat]
[   24.371172]  ? roccat_report_event+0x44/0xe0 [hid_roccat]
[   24.371174]  ? srso_alias_return_thunk+0x5/0xfbef5
[   24.371176]  roccat_report_event+0x44/0xe0 [hid_roccat]
[   24.371179]  ryos_raw_event+0x3f/0x50 [hid_roccat_ryos]
[   24.371182]  __hid_input_report+0x129/0x1f0 [hid]
[   24.371190]  hid_input_report+0x11/0x20 [hid]
[   24.371194]  hid_irq_in+0x104/0x1f0 [usbhid]
[   24.371199]  __usb_hcd_giveback_urb+0xa0/0x120 [usbcore]
[   24.371210]  usb_giveback_urb_bh+0xa6/0x130 [usbcore]
[   24.371223]  process_one_work+0x226/0x6a0
[   24.371226]  ? srso_alias_return_thunk+0x5/0xfbef5
[   24.371233]  bh_worker+0x17b/0x1e0
[   24.371238]  tasklet_hi_action+0x17/0x40
[   24.371241]  handle_softirqs+0xe8/0x410
[   24.371247]  __irq_exit_rcu+0xca/0x120
[   24.371249]  irq_exit_rcu+0xa/0x30
[   24.371252]  common_interrupt+0xb8/0xd0
[   24.371255]  </IRQ>
[   24.371255]  <TASK>
[   24.371258]  asm_common_interrupt+0x22/0x40
[   24.371260] RIP: 0010:cpuidle_enter_state+0x12c/0x4f0
[   24.371262] Code: 01 48 0f a3 05 e5 93 0c 01 0f 82 b4 02 00 00 31 ff e8 98 3a 34 ff 45 84 ff 0f 85 02 02 00 00 e8 1a a8 48 ff fb 0f 1f 44 00 00 <45> 85 f6 0f 88 d4 01 00 00 49 63 d6 48 8d 04 52 48 8d 04 82 49 8d
[   24.371263] RSP: 0018:ffffbb56001d7e68 EFLAGS: 00000202
[   24.371265] RAX: 0000000000030185 RBX: ffff9881e1345c00 RCX: 0000000000000000
[   24.371266] RDX: 0000000000000000 RSI: ffffffffbc7884ca RDI: ffffffffbc767f8c
[   24.371267] RBP: 0000000000000003 R08: 0000000000000001 R09: 0000000000000000
[   24.371268] R10: 0000000000000001 R11: 0000000000000000 R12: ffffffffbd029e60
[   24.371268] R13: 00000005ac93dbee R14: 0000000000000003 R15: 0000000000000000
[   24.371278]  ? cpuidle_enter_state+0x126/0x4f0
[   24.371283]  cpuidle_enter+0x29/0x40
[   24.371287]  cpuidle_idle_call+0xff/0x180
[   24.371291]  do_idle+0x8e/0xe0
[   24.371294]  cpu_startup_entry+0x25/0x30
[   24.371297]  start_secondary+0x11c/0x140
[   24.371300]  common_startup_64+0x13e/0x141
[   24.371313]  </TASK>

AFAIK roccat_report_event() is being called from a interrupt handler, so calling functions like mutex_lock()
is not permitted here. However since commit cacdb14b1c8d ("HID: roccat: Fix use-after-free in roccat_read()"),
roccat_report_event() calls mutex_lock()_unlock(), causing the above warnings.

I myself have no experience with HID drivers, so maybe someone can give me a hint on how to fix
this issue.

Thanks,
Armin Wolf


