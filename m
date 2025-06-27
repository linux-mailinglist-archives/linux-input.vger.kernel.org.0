Return-Path: <linux-input+bounces-13122-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DECF5AEAE74
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 07:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B2E77AAC19
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 05:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2277C18E750;
	Fri, 27 Jun 2025 05:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tcn0ebFz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D774A0C;
	Fri, 27 Jun 2025 05:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751002389; cv=none; b=Zc2yKW2+0qDfmO1Vb7pAUNk4zYJl/XKheTjaELdQcXc4BdY7oTW7mDUx85w0MVHkx8Kfc5Eam8nk/8mbgqpY2TCCWEm5yFEUAy+DSoMVeZwa3Z8N99/af5jsib1K7Csz8b+MJLJ+Cj9eTcV3A1jm3SZDx8p2kUWY8NhBNB4Lp3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751002389; c=relaxed/simple;
	bh=a4k0Vy908tp6PdUAEzj/Q2b2RAttFqkXrCKyGAxGCUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jrXUUMmlu2OHCDx7DztRzz49dp5dU4fEsiGoKD5AzrNS1HSSLv++N9AsIxSggQ7mU50t5PJ0htgQxrSMi8AVV2duY6R90beCrAXEG00wsqHab5Q6AQJpi95Ogz3GzUPblIljbRm7p62y4dBipMJS861kCcxHr8iC27/eDErxWx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tcn0ebFz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14397C4CEE3;
	Fri, 27 Jun 2025 05:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751002388;
	bh=a4k0Vy908tp6PdUAEzj/Q2b2RAttFqkXrCKyGAxGCUs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tcn0ebFz9nKW2kXthkum8QyVMbWHMtuzk+NslvDy09sbVTWNrSRkgC7VRyAR7URzl
	 ZLFvESBVprDMAG2LdnseKnkkorDbQoT3Tx3/v799/2M8i4A4SgVm5fbU2K2Ikyejbh
	 LjrQr98HtL4wf8gss1QQ89HxmndMbVxjlA1fGeXeq+TnLOazwgbUs3eNvcjOFmspXn
	 lJ4q76qhj1qGf1kOK0CUSvElWGXhGMU2A60WMpr3mSdfk7XxL8deUK0U94/welhVIL
	 Jr1lvGw2QbM/xWIisFQndF2d5NKpc6GWTnUMCkd3zuj4JydEN5uGpqStVYTXOwKaKN
	 x6mPC73x5Xrnw==
Message-ID: <61aa98d3-9577-45cc-b464-7d7160f8b003@kernel.org>
Date: Fri, 27 Jun 2025 07:33:04 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: appletb-kbd: fix memory corruption of
 input_handler_list
To: Qasim Ijaz <qasdev00@gmail.com>, jikos@kernel.org, bentiss@kernel.org
Cc: gargaditya08@live.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250626224711.13980-1-qasdev00@gmail.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20250626224711.13980-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27. 06. 25, 0:47, Qasim Ijaz wrote:
> In appletb_kbd_probe an input handler is initialised and then registered
> with input core through input_register_handler(). When this happens input
> core will add the input handler (specifically its node) to the global
> input_handler_list. The input_handler_list is central to the functionality
> of input core and is traversed in various places in input core. An example
> of this is when a new input device is plugged in and gets registered with
> input core.
> 
> The input_handler in probe is allocated as device managed memory. If a
> probe failure occurs after input_register_handler() the input_handler
> memory is freed, yet it will remain in the input_handler_list. This
> effectively means the input_handler_list contains a dangling pointer
> to data belonging to a freed input handler.
> 
> This causes an issue when any other input device is plugged in - in my
> case I had an old PixArt HP USB optical mouse and I decided to
> plug it in after a failure occurred after input_register_handler().
> This lead to the registration of this input device via
> input_register_device which involves traversing over every handler
> in the corrupted input_handler_list and calling input_attach_handler(),
> giving each handler a chance to bind to newly registered device.
> 
> The core of this bug is a UAF which causes memory corruption of
> input_handler_list and to fix it we must ensure the input handler is
> unregistered from input core, this is done through
> input_unregister_handler().
> 
> [   63.191597] ==================================================================
> [   63.192094] BUG: KASAN: slab-use-after-free in input_attach_handler.isra.0+0x1a9/0x1e0
> [   63.192094] Read of size 8 at addr ffff888105ea7c80 by task kworker/0:2/54
> [   63.192094]
> [   63.192094] CPU: 0 UID: 0 PID: 54 Comm: kworker/0:2 Not tainted 6.16.0-rc2-00321-g2aa6621d
> [   63.192094] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.164
> [   63.192094] Workqueue: usb_hub_wq hub_event
> [   63.192094] Call Trace:
> [   63.192094]  <TASK>
> [   63.192094]  dump_stack_lvl+0x53/0x70
> [   63.192094]  print_report+0xce/0x670
> [   63.192094]  ? input_attach_handler.isra.0+0x1a9/0x1e0
> [   63.192094]  kasan_report+0xce/0x100
> [   63.192094]  ? input_attach_handler.isra.0+0x1a9/0x1e0
> [   63.192094]  input_attach_handler.isra.0+0x1a9/0x1e0
> [   63.192094]  input_register_device+0x76c/0xd00
> [   63.192094]  hidinput_connect+0x686d/0xad60
> [   63.192094]  ? __pfx_hidinput_connect+0x10/0x10
> [   63.192094]  ? xhci_urb_enqueue+0x523/0x930
> [   63.192094]  hid_connect+0xf20/0x1b10
> [   63.192094]  ? mutex_unlock+0x7d/0xd0
> [   63.192094]  ? __pfx_mutex_unlock+0x10/0x10
> [   63.192094]  ? __pm_runtime_idle+0x95/0x1c0
> [   63.192094]  ? __pfx_hid_connect+0x10/0x10
> [   63.192094]  hid_hw_start+0x83/0x100
> [   63.192094]  hid_device_probe+0x2d1/0x680
> [   63.192094]  really_probe+0x1c3/0x690
> [   63.192094]  __driver_probe_device+0x247/0x300
> [   63.192094]  driver_probe_device+0x49/0x210
> [   63.192094]  __device_attach_driver+0x160/0x320
> [   63.192094]  ? __pfx___device_attach_driver+0x10/0x10
> [   63.192094]  bus_for_each_drv+0x10f/0x190
> [   63.192094]  ? __pfx_bus_for_each_drv+0x10/0x10
> [   63.192094]  __device_attach+0x18e/0x370
> [   63.192094]  ? __pfx___device_attach+0x10/0x10
> [   63.192094]  ? kobject_get+0x50/0xe0
> [   63.192094]  bus_probe_device+0x123/0x170
> [   63.192094]  device_add+0xd4d/0x1460
> [   63.192094]  ? __pfx_device_add+0x10/0x10
> [   63.192094]  ? up_write+0x4d/0x90
> [   63.192094]  ? __debugfs_create_file+0x377/0x5a0
> [   63.192094]  hid_add_device+0x30b/0x910
> [   63.192094]  ? __pfx_hid_add_device+0x10/0x10
> [   63.192094]  usbhid_probe+0x920/0xe00
> [   63.192094]  ? pm_runtime_enable+0xfa/0x2a0
> [   63.192094]  usb_probe_interface+0x363/0x9a0
> [   63.192094]  ? sysfs_do_create_link_sd+0x89/0x100
> [   63.192094]  really_probe+0x1c3/0x690
> [   63.192094]  __driver_probe_device+0x247/0x300
> [   63.192094]  driver_probe_device+0x49/0x210
> [   63.192094]  __device_attach_driver+0x160/0x320
> [   63.192094]  ? __pfx___device_attach_driver+0x10/0x10
> [   63.192094]  bus_for_each_drv+0x10f/0x190
> [   63.192094]  ? __pfx_bus_for_each_drv+0x10/0x10
> [   63.192094]  __device_attach+0x18e/0x370
> [   63.192094]  ? __pfx___device_attach+0x10/0x10
> [   63.192094]  ? kobject_get+0x50/0xe0
> [   63.192094]  bus_probe_device+0x123/0x170
> [   63.192094]  device_add+0xd4d/0x1460
> [   63.192094]  ? __pfx_device_add+0x10/0x10
> [   63.192094]  ? mutex_unlock+0x7d/0xd0
> [   63.192094]  ? __pfx_mutex_unlock+0x10/0x10
> [   63.192094]  usb_set_configuration+0xd14/0x1880
> [   63.192094]  usb_generic_driver_probe+0x78/0xb0
> [   63.192094]  usb_probe_device+0xaa/0x2e0
> [   63.192094]  really_probe+0x1c3/0x690
> [   63.192094]  __driver_probe_device+0x247/0x300
> [   63.192094]  ? usb_generic_driver_match+0x58/0x80
> [   63.192094]  driver_probe_device+0x49/0x210
> [   63.192094]  __device_attach_driver+0x160/0x320
> [   63.192094]  ? __pfx___device_attach_driver+0x10/0x10
> [   63.192094]  bus_for_each_drv+0x10f/0x190
> [   63.192094]  ? __pfx_bus_for_each_drv+0x10/0x10
> [   63.192094]  __device_attach+0x18e/0x370
> [   63.192094]  ? __pfx___device_attach+0x10/0x10
> [   63.192094]  ? kobject_get+0x50/0xe0
> [   63.192094]  bus_probe_device+0x123/0x170
> [   63.192094]  device_add+0xd4d/0x1460
> [   63.192094]  ? __pfx_device_add+0x10/0x10
> [   63.192094]  ? add_device_randomness+0xb2/0xe0
> [   63.192094]  usb_new_device+0x7b4/0x1000
> [   63.192094]  hub_event+0x234d/0x3fa0
> [   63.192094]  ? __pfx_hub_event+0x10/0x10
> [   63.192094]  ? _raw_spin_lock_irqsave+0x85/0xe0
> [   63.192094]  ? _raw_spin_lock_irqsave+0x85/0xe0
> [   63.192094]  ? mutex_unlock+0x7d/0xd0
> [   63.192094]  ? _raw_spin_lock_irq+0x80/0xe0
> [   63.192094]  ? __pfx__raw_spin_lock_irq+0x10/0x10
> [   63.192094]  ? __pm_runtime_suspend+0x74/0x1c0
> [   63.192094]  process_one_work+0x5bf/0xfe0
> [   63.192094]  worker_thread+0x777/0x13a0
> [   63.192094]  ? __kthread_parkme+0x99/0x180
> [   63.192094]  ? __pfx_worker_thread+0x10/0x10
> [   63.192094]  kthread+0x327/0x630
> [   63.192094]  ? __pfx_kthread+0x10/0x10
> [   63.192094]  ? __pfx__raw_spin_lock_irq+0x10/0x10
> [   63.192094]  ? __pfx_kthread+0x10/0x10
> [   63.192094]  ? __pfx_kthread+0x10/0x10
> [   63.192094]  ret_from_fork+0xff/0x1a0
> [   63.192094]  ? __pfx_kthread+0x10/0x10
> [   63.192094]  ret_from_fork_asm+0x1a/0x30
> [   63.192094]  </TASK>

If you are going to resend, could you prune that backtrace too? Like 
drop all '?' entries and everything after worker_thread.

thanks,
-- 
js
suse labs


