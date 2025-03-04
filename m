Return-Path: <linux-input+bounces-10534-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56754A4EE8B
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 21:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4974A3AB435
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 20:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27752512FC;
	Tue,  4 Mar 2025 20:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqqwCDia"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75063215F7D;
	Tue,  4 Mar 2025 20:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741120819; cv=none; b=ImVdbQbKvODPkKzwQNKYGgdCT6P7gmqCcxljmlZ4y/MV2Bnzr0i+HxCcrMEDa43d1wAi6TcdYtX4uVZGk2ZWKiM23iC9XtvlYy6Uj5oFs+gaeNvMOZhvOJoKqlyxj5BNgcXZFoemYyXXOxHnB2s+dE01s8bNdKAIX7/66hC/Bkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741120819; c=relaxed/simple;
	bh=rffQqLzv4LKuSkCZS6yB0zZhXvs8756vRKQ1Bz8ZERc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uWmNnumWqsPxn6a61lXmA7twMmm7h9Z85CyarKiR7gnNbcwJY0Fwld/bZvS4+NXalKkLCxqaicWmdmisPsfq7CU24L85hMEvJbFGrg1zlrNXfrImFql08zBfEMI7AElWq0l8zjB4o8CjPXTujasix1CB+0Yyq8OwWrM9THZeFrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqqwCDia; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828FBC4CEE5;
	Tue,  4 Mar 2025 20:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741120818;
	bh=rffQqLzv4LKuSkCZS6yB0zZhXvs8756vRKQ1Bz8ZERc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eqqwCDianugNOSXzq8fzjefzgm+LlbOmTo+E+OTZ/dWrFEYzv3hYt0Azt9fPLh5I4
	 9ReSWdcx8BI/aq+KZqAM2H1+TaY/y8neBojDc4gKLAqayn+81HTppa04GL7XkX/PkS
	 a4GvgEh93F+Z66EJfSMidmsoyOC/62if5HbCGgM3cu3mjndmJWlKEZuYomDjsVNeSV
	 xZdM1lRA6nCLPDSzLNCGb45pASLIBg5HjQ9h8Pc0p1MxV+s+ZaN20V3PBg8NglPwjG
	 ZNXUPquCbaPJ7INrjRAX4wOjL51QjYuE8Rk2QSOevEw69rJKsPI+3lNWIrPPJa98a6
	 mVUpOgnIQW42A==
Date: Tue, 4 Mar 2025 21:40:16 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Daniil Dulov <d.dulov@aladdin.ru>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org, 
    stable@vger.kernel.org
Subject: Re: [PATCH] HID: appleir: Fix potential NULL dereference at raw
 event handle
In-Reply-To: <20250224173031.496048-1-d.dulov@aladdin.ru>
Message-ID: <8oqsp1p4-4nr8-4nq4-2483-9r6n5r05881s@xreary.bet>
References: <20250224173031.496048-1-d.dulov@aladdin.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Feb 2025, Daniil Dulov wrote:

> Syzkaller reports a NULL pointer dereference issue in input_event().
> 
> BUG: KASAN: null-ptr-deref in instrument_atomic_read include/linux/instrumented.h:68 [inline]
> BUG: KASAN: null-ptr-deref in _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
> BUG: KASAN: null-ptr-deref in is_event_supported drivers/input/input.c:67 [inline]
> BUG: KASAN: null-ptr-deref in input_event+0x42/0xa0 drivers/input/input.c:395
> Read of size 8 at addr 0000000000000028 by task syz-executor199/2949
> 
> CPU: 0 UID: 0 PID: 2949 Comm: syz-executor199 Not tainted 6.13.0-rc4-syzkaller-00076-gf097a36ef88d #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
> Call Trace:
>  <IRQ>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
>  kasan_report+0xd9/0x110 mm/kasan/report.c:602
>  check_region_inline mm/kasan/generic.c:183 [inline]
>  kasan_check_range+0xef/0x1a0 mm/kasan/generic.c:189
>  instrument_atomic_read include/linux/instrumented.h:68 [inline]
>  _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
>  is_event_supported drivers/input/input.c:67 [inline]
>  input_event+0x42/0xa0 drivers/input/input.c:395
>  input_report_key include/linux/input.h:439 [inline]
>  key_down drivers/hid/hid-appleir.c:159 [inline]
>  appleir_raw_event+0x3e5/0x5e0 drivers/hid/hid-appleir.c:232
>  __hid_input_report.constprop.0+0x312/0x440 drivers/hid/hid-core.c:2111
>  hid_ctrl+0x49f/0x550 drivers/hid/usbhid/hid-core.c:484
>  __usb_hcd_giveback_urb+0x389/0x6e0 drivers/usb/core/hcd.c:1650
>  usb_hcd_giveback_urb+0x396/0x450 drivers/usb/core/hcd.c:1734
>  dummy_timer+0x17f7/0x3960 drivers/usb/gadget/udc/dummy_hcd.c:1993
>  __run_hrtimer kernel/time/hrtimer.c:1739 [inline]
>  __hrtimer_run_queues+0x20a/0xae0 kernel/time/hrtimer.c:1803
>  hrtimer_run_softirq+0x17d/0x350 kernel/time/hrtimer.c:1820
>  handle_softirqs+0x206/0x8d0 kernel/softirq.c:561
>  __do_softirq kernel/softirq.c:595 [inline]
>  invoke_softirq kernel/softirq.c:435 [inline]
>  __irq_exit_rcu+0xfa/0x160 kernel/softirq.c:662
>  irq_exit_rcu+0x9/0x30 kernel/softirq.c:678
>  instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
>  sysvec_apic_timer_interrupt+0x90/0xb0 arch/x86/kernel/apic/apic.c:1049
>  </IRQ>
>  <TASK>
>  asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
>  __mod_timer+0x8f6/0xdc0 kernel/time/timer.c:1185
>  add_timer+0x62/0x90 kernel/time/timer.c:1295
>  schedule_timeout+0x11f/0x280 kernel/time/sleep_timeout.c:98
>  usbhid_wait_io+0x1c7/0x380 drivers/hid/usbhid/hid-core.c:645
>  usbhid_init_reports+0x19f/0x390 drivers/hid/usbhid/hid-core.c:784
>  hiddev_ioctl+0x1133/0x15b0 drivers/hid/usbhid/hiddev.c:794
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:906 [inline]
>  __se_sys_ioctl fs/ioctl.c:892 [inline]
>  __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>  </TASK>
> 
> This happens due to the malformed report items sent by the emulated device
> which results in a report, that has no fields, being added to the report list.
> Due to this appleir_input_configured() is never called, hidinput_connect()
> fails which results in the HID_CLAIMED_INPUT flag is not being set. However,
> it  does not make appleir_probe() fail and lets the event callback to be
> called without the associated input device.
> 
> Thus, add a check for the HID_CLAIMED_INPUT flag and leave the event hook
> early if the driver didn't claim any input_dev for some reason. Moreover,
> some other hid drivers accessing input_dev in their event callbacks do have
> similar checks, too.
> 
> Found by Linux Verification Center (linuxtesting.org) with Syzkaller.
> 
> Fixes: 9a4a5574ce42 ("HID: appleir: add support for Apple ir devices")

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


