Return-Path: <linux-input+bounces-15499-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B13CBDE70D
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 14:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D2C7E346CAA
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 12:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51129326D4B;
	Wed, 15 Oct 2025 12:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FrIvQzNT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE34322DB7
	for <linux-input@vger.kernel.org>; Wed, 15 Oct 2025 12:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760530674; cv=none; b=tVr2b/MX9H3N7AOCBDoglSZjv5KCQ7cdQgvfU7THIWY+mOa951HOjAZ5hvgQ5TDOUlu6HEs7K7VrCyvij2d0LD7Ntft3wEURSvYMtGpN6jdaVV+RUeR1wMQfjEtDT9WPDXpcmfOoNJqtLZ9HlFUY2i5uf1hq0nIH35nI0Bm+Zgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760530674; c=relaxed/simple;
	bh=dCTT2fs6ic/bCOWtF8JUpsWGQDrSJwW66arMFkorMz0=;
	h=Content-Type:Message-ID:Date:MIME-Version:From:Subject:To:
	 References:In-Reply-To; b=lYmPYvFsaHFnlL8Af0U+XNPSMu27rIPkEo0FGSSmMDSaAd40xg8pqAnxk/RtpirprMXxg0FDA7qmjpGLwLix7LNloQVa/8m9vAHTEqRWShBswj57godK8mq5+mVOh9vWKdYyjWIIwiSCapb1IVuENvdnA/jWXWr4MCi5LdThks4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FrIvQzNT; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b3c2db014easo380878366b.0
        for <linux-input@vger.kernel.org>; Wed, 15 Oct 2025 05:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760530670; x=1761135470; darn=vger.kernel.org;
        h=in-reply-to:content-language:references:to:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUJkY475DA/qNVNVaebzOSyM75nDkkuj5XdVQ/q55AI=;
        b=FrIvQzNToAlqB9r5073tE6v10lId2us3fWcq/SetC8fE++/aMdT1UQInsly8MOMV8H
         4txQ4Vdhsa5FTCGAchlPlfwOU2uq3lHaqeY/ToKgBUsyTFeA8ecI8w6XKLzAz3fTlMBM
         D/JTLO2cFrQjgop467qSOctdlGLyIZYyLfLic/0cNeHTga7y+oau/YxJYO5DQFUPOgz5
         VQg7S2w9e7tSJ8YEU8Uh5h3uxHNpjb4+fAvv2fb63I2l0Meq8kC7VXLrCXNXtSoVnkcR
         qM5sUi25BWU5eqrrxdBmlJQ0g1NYlnQTWsSS8hDytSzJhogmBAW11yGcCDZdcBICtA0c
         MLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760530670; x=1761135470;
        h=in-reply-to:content-language:references:to:subject:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sUJkY475DA/qNVNVaebzOSyM75nDkkuj5XdVQ/q55AI=;
        b=FToNe9DTef+9THZF8/5sqHbyoyqy2s7e8u+D2njLks9ef7zIgASG6+TT5y2t7o+kg5
         iYvM6J6v8m7nQfpvacPaXmpoZ17tHXeUuYN3TtFTQTzfL5i0cegZYByrw6mftSA1Qog9
         WZP2WHNme2qfTsuMg+EYDqpKNBPhgpXKuPEk1eoeiR0H5udehdv12vAJmM71C4ZBqE9F
         HOGOB5fj0WC+gxWqmJg31imyvH+82MtJYqIyeJtpzDMSgjBn7LrnbdQycnmyOod2fib7
         T3IgnDpYbwEt4KncjL1c+3VkzmHPJbPCvipStT1kEiLBfr1tc67mPgf4e6dfJrpD/lQI
         H28A==
X-Forwarded-Encrypted: i=1; AJvYcCX3tBGROnODbXMGdnK4PwA/9fbLmtHoxVLn63NXGepxRGamfOT/JGYfCO29TVH+s3x3AWu/mzcN9XHSvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKmp0pnGGhaUb+fHJ7xyI+KqOcDdAP/ptHFjNcUsPaAhjVnGqC
	1ZGqsSr/cj2xiJ2Z6shryxEUlsQJPwfS49BDQ4365LAvY1UX6cg069VeBgWi5hWPhac=
X-Gm-Gg: ASbGncvMgY0/4yRY16enA05fjtASuPBupyzHXOcflWXCfbrLBjzOvG1CvfdQ1uhvFYg
	ZHM9bWUiqzdasHClOS+wrUFbh9J2AWZHQhrgm11rHOLfjxUytb3mCJdYD6lMcoIANqxbJjndzgt
	zmF8bJn05G+U8FXbGtwZBNgrl//Jdk944bwZIOcpao0kaaW5Zr3ycgx+gNxO+6SdXACfqbfE2xB
	zIOeiCXQURS04ohDSBurTfo+s1hIFrbOvhhQggI0QqXSYQQG3RAA6LWsqQhGkUpWlbIBMueA3hd
	o3/t6dllTAiXnDMPU7rXYKZ2OnYAPoDtgOo9SBadn5zUgZJ44leoRbR30lI7ONrqlwjQE11vM8T
	qrm30fTxww/f5Q8bAwwuU8twzHK9fnmtD3lk3bote0y+ay6B+fjwfdTjzbabKMdActjXNdVg4gt
	R7LXVSvQ==
X-Google-Smtp-Source: AGHT+IF17O9xdIVrdiPjUGT8gLMFSldogp9OG817w51t9D1qZ6/Guz5Ub5UcYExZmPttaGSzX0pk0Q==
X-Received: by 2002:a17:907:3d8f:b0:afe:b311:a274 with SMTP id a640c23a62f3a-b50abfd68a6mr3246714166b.46.1760530669163;
        Wed, 15 Oct 2025 05:17:49 -0700 (PDT)
Received: from ?IPV6:2001:a61:1331:5701:bd02:72b8:f4d3:91c? ([2001:a61:1331:5701:bd02:72b8:f4d3:91c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cba06a5b3sm216697466b.29.2025.10.15.05.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 05:17:48 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------ZY6MLU2afbK0jXl912AgSgwf"
Message-ID: <35e0f3f4-def7-4a94-a982-549b6203c6e2@suse.com>
Date: Wed, 15 Oct 2025 14:17:47 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oliver Neukum <oneukum@suse.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-out-of-bounds Read in
 mcp2221_raw_event (2)
To: syzbot <syzbot+1018672fe70298606e5f@syzkaller.appspotmail.com>,
 bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <68ee6a3f.050a0220.91a22.021b.GAE@google.com>
Content-Language: en-US
In-Reply-To: <68ee6a3f.050a0220.91a22.021b.GAE@google.com>

This is a multi-part message in MIME format.
--------------ZY6MLU2afbK0jXl912AgSgwf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

#syz test: upstream 3a8660878839

On 14.10.25 17:20, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    3a8660878839 Linux 6.18-rc1
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=12a705e2580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f3e7b5a3627a90dd
> dashboard link: https://syzkaller.appspot.com/bug?extid=1018672fe70298606e5f
> compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=132ebb34580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=140fe52f980000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/e767e8931970/disk-3a866087.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/4cb12bdcfcea/vmlinux-3a866087.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/b08acfae954d/bzImage-3a866087.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+1018672fe70298606e5f@syzkaller.appspotmail.com
> 
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in mcp2221_raw_event+0x1070/0x10a0 drivers/hid/hid-mcp2221.c:948
> Read of size 1 at addr ffff8880721cbfff by task kworker/0:7/6094
> 
> CPU: 0 UID: 0 PID: 6094 Comm: kworker/0:7 Not tainted syzkaller #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   <IRQ>
>   __dump_stack lib/dump_stack.c:94 [inline]
>   dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
>   print_address_description mm/kasan/report.c:378 [inline]
>   print_report+0xcd/0x630 mm/kasan/report.c:482
>   kasan_report+0xe0/0x110 mm/kasan/report.c:595
>   mcp2221_raw_event+0x1070/0x10a0 drivers/hid/hid-mcp2221.c:948
>   __hid_input_report.constprop.0+0x314/0x450 drivers/hid/hid-core.c:2139
>   hid_irq_in+0x35e/0x870 drivers/hid/usbhid/hid-core.c:286
>   __usb_hcd_giveback_urb+0x38b/0x610 drivers/usb/core/hcd.c:1661
>   usb_hcd_giveback_urb+0x39b/0x450 drivers/usb/core/hcd.c:1745
>   dummy_timer+0x1809/0x3a00 drivers/usb/gadget/udc/dummy_hcd.c:1995
>   __run_hrtimer kernel/time/hrtimer.c:1777 [inline]
>   __hrtimer_run_queues+0x202/0xad0 kernel/time/hrtimer.c:1841
>   hrtimer_run_softirq+0x17d/0x350 kernel/time/hrtimer.c:1858
>   handle_softirqs+0x219/0x8e0 kernel/softirq.c:622
>   __do_softirq kernel/softirq.c:656 [inline]
>   invoke_softirq kernel/softirq.c:496 [inline]
>   __irq_exit_rcu+0x109/0x170 kernel/softirq.c:723
>   irq_exit_rcu+0x9/0x30 kernel/softirq.c:739
>   instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1052 [inline]
>   sysvec_apic_timer_interrupt+0xa4/0xc0 arch/x86/kernel/apic/apic.c:1052
>   </IRQ>
>   <TASK>
>   asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697
> RIP: 0010:kasan_check_range+0x12/0x1b0 mm/kasan/generic.c:199
> Code: 00 00 00 00 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 40 d6 48 85 f6 0f 84 64 01 00 00 48 89 f8 41 54 <44> 0f b6 c2 48 01 f0 55 53 0f 82 d7 00 00 00 eb 0f cc cc cc 48 b8
> RSP: 0018:ffffc900037b6b60 EFLAGS: 00000202
> RAX: ffff888077da86b0 RBX: ffff888077da8668 RCX: ffffffff819803ae
> RDX: 0000000000000001 RSI: 0000000000000004 RDI: ffff888077da86b0
> RBP: ffff888077da86b0 R08: 0000000000000002 R09: 0000000000000000
> R10: ffff888077da866f R11: 0000000000000000 R12: ffffffff8c6df2a0
> R13: ffffffff9ae57620 R14: 0000000000000000 R15: ffff888026709978
>   instrument_atomic_write include/linux/instrumented.h:82 [inline]
>   atomic_set include/linux/atomic/atomic-instrumented.h:67 [inline]
>   osq_lock_init include/linux/osq_lock.h:25 [inline]
>   __mutex_init+0xae/0x120 kernel/locking/mutex.c:53
>   i2c_register_adapter+0x15d/0x1370 drivers/i2c/i2c-core-base.c:1544
>   i2c_add_adapter drivers/i2c/i2c-core-base.c:1673 [inline]
>   i2c_add_adapter+0x10a/0x1b0 drivers/i2c/i2c-core-base.c:1653
>   devm_i2c_add_adapter+0x1b/0x90 drivers/i2c/i2c-core-base.c:1845
>   mcp2221_probe+0x5f1/0xc50 drivers/hid/hid-mcp2221.c:1289
>   __hid_device_probe drivers/hid/hid-core.c:2775 [inline]
>   hid_device_probe+0x5ba/0x8d0 drivers/hid/hid-core.c:2812
>   call_driver_probe drivers/base/dd.c:581 [inline]
>   really_probe+0x241/0xa90 drivers/base/dd.c:659
>   __driver_probe_device+0x1de/0x440 drivers/base/dd.c:801
>   driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:831
>   __device_attach_driver+0x1df/0x310 drivers/base/dd.c:959
>   bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:462
>   __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1031
>   bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
>   device_add+0x1148/0x1aa0 drivers/base/core.c:3689
>   hid_add_device+0x31b/0x5c0 drivers/hid/hid-core.c:2951
>   usbhid_probe+0xd38/0x13f0 drivers/hid/usbhid/hid-core.c:1435
>   usb_probe_interface+0x303/0xa40 drivers/usb/core/driver.c:396
>   call_driver_probe drivers/base/dd.c:581 [inline]
>   really_probe+0x241/0xa90 drivers/base/dd.c:659
>   __driver_probe_device+0x1de/0x440 drivers/base/dd.c:801
>   driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:831
>   __device_attach_driver+0x1df/0x310 drivers/base/dd.c:959
>   bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:462
>   __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1031
>   bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
>   device_add+0x1148/0x1aa0 drivers/base/core.c:3689
>   usb_set_configuration+0x1187/0x1e20 drivers/usb/core/message.c:2210
>   usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:250
>   usb_probe_device+0xef/0x3e0 drivers/usb/core/driver.c:291
>   call_driver_probe drivers/base/dd.c:581 [inline]
>   really_probe+0x241/0xa90 drivers/base/dd.c:659
>   __driver_probe_device+0x1de/0x440 drivers/base/dd.c:801
>   driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:831
>   __device_attach_driver+0x1df/0x310 drivers/base/dd.c:959
>   bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:462
>   __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1031
>   bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
>   device_add+0x1148/0x1aa0 drivers/base/core.c:3689
>   usb_new_device+0xd07/0x1a60 drivers/usb/core/hub.c:2694
>   hub_port_connect drivers/usb/core/hub.c:5566 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5706 [inline]
>   port_event drivers/usb/core/hub.c:5870 [inline]
>   hub_event+0x2f34/0x4fe0 drivers/usb/core/hub.c:5952
>   process_one_work+0x9cf/0x1b70 kernel/workqueue.c:3263
>   process_scheduled_works kernel/workqueue.c:3346 [inline]
>   worker_thread+0x6c8/0xf10 kernel/workqueue.c:3427
>   kthread+0x3c5/0x780 kernel/kthread.c:463
>   ret_from_fork+0x675/0x7d0 arch/x86/kernel/process.c:158
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>   </TASK>
> 
> Allocated by task 5918:
>   kasan_save_stack+0x33/0x60 mm/kasan/common.c:56
>   kasan_save_track+0x14/0x30 mm/kasan/common.c:77
>   poison_kmalloc_redzone mm/kasan/common.c:400 [inline]
>   __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:417
>   kmalloc_noprof include/linux/slab.h:957 [inline]
>   kzalloc_noprof include/linux/slab.h:1094 [inline]
>   ipv6_add_addr+0x4e3/0x1fe0 net/ipv6/addrconf.c:1120
>   add_addr+0xde/0x350 net/ipv6/addrconf.c:3201
>   add_v4_addrs+0x642/0x980 net/ipv6/addrconf.c:3263
>   addrconf_gre_config net/ipv6/addrconf.c:3545 [inline]
>   addrconf_init_auto_addrs+0x51a/0x810 net/ipv6/addrconf.c:3559
>   addrconf_notify+0xe93/0x19e0 net/ipv6/addrconf.c:3740
>   notifier_call_chain+0xbc/0x410 kernel/notifier.c:85
>   call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:2229
>   call_netdevice_notifiers_extack net/core/dev.c:2267 [inline]
>   call_netdevice_notifiers net/core/dev.c:2281 [inline]
>   __dev_notify_flags+0x12c/0x2e0 net/core/dev.c:9676
>   netif_change_flags+0x108/0x160 net/core/dev.c:9705
>   do_setlink.constprop.0+0xb53/0x4380 net/core/rtnetlink.c:3151
>   rtnl_changelink net/core/rtnetlink.c:3769 [inline]
>   __rtnl_newlink net/core/rtnetlink.c:3928 [inline]
>   rtnl_newlink+0x1446/0x2000 net/core/rtnetlink.c:4065
>   rtnetlink_rcv_msg+0x95e/0xe90 net/core/rtnetlink.c:6954
>   netlink_rcv_skb+0x158/0x420 net/netlink/af_netlink.c:2552
>   netlink_unicast_kernel net/netlink/af_netlink.c:1320 [inline]
>   netlink_unicast+0x5aa/0x870 net/netlink/af_netlink.c:1346
>   netlink_sendmsg+0x8c8/0xdd0 net/netlink/af_netlink.c:1896
>   sock_sendmsg_nosec net/socket.c:727 [inline]
>   __sock_sendmsg net/socket.c:742 [inline]
>   __sys_sendto+0x4a3/0x520 net/socket.c:2244
>   __do_sys_sendto net/socket.c:2251 [inline]
>   __se_sys_sendto net/socket.c:2247 [inline]
>   __x64_sys_sendto+0xe0/0x1c0 net/socket.c:2247
>   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>   do_syscall_64+0xcd/0xfa0 arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> The buggy address belongs to the object at ffff8880721cbc00
>   which belongs to the cache kmalloc-cg-512 of size 512
> The buggy address is located 583 bytes to the right of
>   allocated 440-byte region [ffff8880721cbc00, ffff8880721cbdb8)
> 
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x721c8
> head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
> page_type: f5(slab)
> raw: 00fff00000000040 ffff88813ff30140 ffffea0001e68c00 dead000000000002
> raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
> head: 00fff00000000040 ffff88813ff30140 ffffea0001e68c00 dead000000000002
> head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
> head: 00fff00000000002 ffffea0001c87201 00000000ffffffff 00000000ffffffff
> head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
> page dumped because: kasan: bad access detected
> page_owner tracks the page as allocated
> page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5796, tgid 5796 (sshd-session), ts 52056965840, free_ts 15121629475
>   set_page_owner include/linux/page_owner.h:32 [inline]
>   post_alloc_hook+0x1c0/0x230 mm/page_alloc.c:1850
>   prep_new_page mm/page_alloc.c:1858 [inline]
>   get_page_from_freelist+0x10a3/0x3a30 mm/page_alloc.c:3884
>   __alloc_frozen_pages_noprof+0x25f/0x2470 mm/page_alloc.c:5183
>   alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2416
>   alloc_slab_page mm/slub.c:3039 [inline]
>   allocate_slab mm/slub.c:3212 [inline]
>   new_slab+0x24a/0x360 mm/slub.c:3266
>   ___slab_alloc+0xdc4/0x1ae0 mm/slub.c:4636
>   __slab_alloc.constprop.0+0x63/0x110 mm/slub.c:4755
>   __slab_alloc_node mm/slub.c:4831 [inline]
>   slab_alloc_node mm/slub.c:5253 [inline]
>   __do_kmalloc_node mm/slub.c:5626 [inline]
>   __kmalloc_node_track_caller_noprof+0x4db/0x8a0 mm/slub.c:5736
>   kmalloc_reserve+0xef/0x2c0 net/core/skbuff.c:601
>   __alloc_skb+0x166/0x380 net/core/skbuff.c:670
>   alloc_skb include/linux/skbuff.h:1383 [inline]
>   alloc_skb_with_frags+0xe0/0x860 net/core/skbuff.c:6671
>   sock_alloc_send_pskb+0x7f9/0x980 net/core/sock.c:2965
>   unix_stream_sendmsg+0x39f/0x1340 net/unix/af_unix.c:2455
>   sock_sendmsg_nosec net/socket.c:727 [inline]
>   __sock_sendmsg net/socket.c:742 [inline]
>   sock_write_iter+0x566/0x610 net/socket.c:1195
>   new_sync_write fs/read_write.c:593 [inline]
>   vfs_write+0x7d3/0x11d0 fs/read_write.c:686
>   ksys_write+0x1f8/0x250 fs/read_write.c:738
> page last free pid 1 tgid 1 stack trace:
>   reset_page_owner include/linux/page_owner.h:25 [inline]
>   free_pages_prepare mm/page_alloc.c:1394 [inline]
>   __free_frozen_pages+0x7df/0x1160 mm/page_alloc.c:2906
>   __free_pages mm/page_alloc.c:5302 [inline]
>   free_contig_range+0x183/0x4b0 mm/page_alloc.c:7146
>   destroy_args+0xb69/0x12e0 mm/debug_vm_pgtable.c:958
>   debug_vm_pgtable+0x1a32/0x3640 mm/debug_vm_pgtable.c:1345
>   do_one_initcall+0x123/0x6e0 init/main.c:1283
>   do_initcall_level init/main.c:1345 [inline]
>   do_initcalls init/main.c:1361 [inline]
>   do_basic_setup init/main.c:1380 [inline]
>   kernel_init_freeable+0x5c8/0x920 init/main.c:1593
>   kernel_init+0x1c/0x2b0 init/main.c:1483
>   ret_from_fork+0x675/0x7d0 arch/x86/kernel/process.c:158
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> 
> Memory state around the buggy address:
>   ffff8880721cbe80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>   ffff8880721cbf00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>> ffff8880721cbf80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>                                                                  ^
>   ffff8880721cc000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   ffff8880721cc080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ==================================================================
> ----------------
> Code disassembly (best guess):
>     0:	00 00                	add    %al,(%rax)
>     2:	00 00                	add    %al,(%rax)
>     4:	0f 1f 40 00          	nopl   0x0(%rax)
>     8:	90                   	nop
>     9:	90                   	nop
>     a:	90                   	nop
>     b:	90                   	nop
>     c:	90                   	nop
>     d:	90                   	nop
>     e:	90                   	nop
>     f:	90                   	nop
>    10:	90                   	nop
>    11:	90                   	nop
>    12:	90                   	nop
>    13:	90                   	nop
>    14:	90                   	nop
>    15:	90                   	nop
>    16:	90                   	nop
>    17:	90                   	nop
>    18:	0f 1f 40 d6          	nopl   -0x2a(%rax)
>    1c:	48 85 f6             	test   %rsi,%rsi
>    1f:	0f 84 64 01 00 00    	je     0x189
>    25:	48 89 f8             	mov    %rdi,%rax
>    28:	41 54                	push   %r12
> * 2a:	44 0f b6 c2          	movzbl %dl,%r8d <-- trapping instruction
>    2e:	48 01 f0             	add    %rsi,%rax
>    31:	55                   	push   %rbp
>    32:	53                   	push   %rbx
>    33:	0f 82 d7 00 00 00    	jb     0x110
>    39:	eb 0f                	jmp    0x4a
>    3b:	cc                   	int3
>    3c:	cc                   	int3
>    3d:	cc                   	int3
>    3e:	48                   	rex.W
>    3f:	b8                   	.byte 0xb8
> 
> 
> ---
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 

--------------ZY6MLU2afbK0jXl912AgSgwf
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-hid-mcp2221-validate-message-length.patch"
Content-Disposition: attachment;
 filename="0001-hid-mcp2221-validate-message-length.patch"
Content-Transfer-Encoding: base64

RnJvbSA0MTIxNmEwMzg1YjlkMmZmMWY0MmE4NjAxMDliYmEyODZmZTlkMjhiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBXZWQsIDE1IE9jdCAyMDI1IDEzOjQ5OjA1ICswMjAwClN1YmplY3Q6IFtQQVRD
SF0gaGlkLW1jcDIyMjE6IHZhbGlkYXRlIG1lc3NhZ2UgbGVuZ3RoCgpUaGUgbWVzc2FnZSBw
YXNzZWQgdG8gcmF3X2V2ZW50IGlzIG9mIGluZGV0ZXJtaW5hdGUgbGVuZ3RoLgpDaGVjayBm
b3IgbGVuZ3RoIGJlZm9yZSBhY2Nlc3NpbmcgbWVtYmVycy4KClNpZ25lZC1vZmYtYnk6IE9s
aXZlciBOZXVrdW0gPG9uZXVrdW1Ac3VzZS5jb20+Ci0tLQogZHJpdmVycy9oaWQvaGlkLW1j
cDIyMjEuYyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2hpZC9oaWQtbWNwMjIyMS5jIGIvZHJpdmVycy9oaWQvaGlkLW1j
cDIyMjEuYwppbmRleCAzMzYwM2IwMTlmOTcuLmQ1ZTlmN2VmOGJhOCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9oaWQvaGlkLW1jcDIyMjEuYworKysgYi9kcml2ZXJzL2hpZC9oaWQtbWNwMjIy
MS5jCkBAIC04NDksMTIgKzg0OSwxOCBAQCBzdGF0aWMgaW50IG1jcDIyMjFfcmF3X2V2ZW50
KHN0cnVjdCBoaWRfZGV2aWNlICpoZGV2LAogCXU4ICpidWY7CiAJc3RydWN0IG1jcDIyMjEg
Km1jcCA9IGhpZF9nZXRfZHJ2ZGF0YShoZGV2KTsKIAorCWlmIChzaXplIDw9IDApCisJCWdv
dG8gYmFpbDsKKwogCXN3aXRjaCAoZGF0YVswXSkgewogCiAJY2FzZSBNQ1AyMjIxX0kyQ19X
Ul9EQVRBOgogCWNhc2UgTUNQMjIyMV9JMkNfV1JfTk9fU1RPUDoKIAljYXNlIE1DUDIyMjFf
STJDX1JEX0RBVEE6CiAJY2FzZSBNQ1AyMjIxX0kyQ19SRF9SUFRfU1RBUlQ6CisJCWlmIChz
aXplIDwgMikKKwkJCWdvdG8gYmFpbDsKKwogCQlzd2l0Y2ggKGRhdGFbMV0pIHsKIAkJY2Fz
ZSBNQ1AyMjIxX1NVQ0NFU1M6CiAJCQltY3AtPnN0YXR1cyA9IDA7CkBAIC04NjYsNiArODcy
LDggQEAgc3RhdGljIGludCBtY3AyMjIxX3Jhd19ldmVudChzdHJ1Y3QgaGlkX2RldmljZSAq
aGRldiwKIAkJYnJlYWs7CiAKIAljYXNlIE1DUDIyMjFfSTJDX1BBUkFNX09SX1NUQVRVUzoK
KwkJaWYgKHNpemUgPCA0KQorCQkJZ290byBiYWlsOwogCQlzd2l0Y2ggKGRhdGFbMV0pIHsK
IAkJY2FzZSBNQ1AyMjIxX1NVQ0NFU1M6CiAJCQlpZiAoKG1jcC0+dHhidWZbM10gPT0gTUNQ
MjIyMV9JMkNfU0VUX1NQRUVEKSAmJgpAQCAtODczLDYgKzg4MSw4IEBAIHN0YXRpYyBpbnQg
bWNwMjIyMV9yYXdfZXZlbnQoc3RydWN0IGhpZF9kZXZpY2UgKmhkZXYsCiAJCQkJbWNwLT5z
dGF0dXMgPSAtRUFHQUlOOwogCQkJCWJyZWFrOwogCQkJfQorCQkJaWYgKHNpemUgPCAyMSkK
KwkJCQlnb3RvIGJhaWw7CiAJCQlpZiAoZGF0YVsyMF0gJiBNQ1AyMjIxX0kyQ19NQVNLX0FE
RFJfTkFDSykgewogCQkJCW1jcC0+c3RhdHVzID0gLUVOWElPOwogCQkJCWJyZWFrOwpAQCAt
ODg5LDEyICs4OTksMTkgQEAgc3RhdGljIGludCBtY3AyMjIxX3Jhd19ldmVudChzdHJ1Y3Qg
aGlkX2RldmljZSAqaGRldiwKIAkJYnJlYWs7CiAKIAljYXNlIE1DUDIyMjFfSTJDX0dFVF9E
QVRBOgorCQlpZiAoc2l6ZSA8IDIpCisJCQlnb3RvIGJhaWw7CisKIAkJc3dpdGNoIChkYXRh
WzFdKSB7CiAJCWNhc2UgTUNQMjIyMV9TVUNDRVNTOgorCQkJaWYgKHNpemUgPCAzKQorCQkJ
CWdvdG8gYmFpbDsKIAkJCWlmIChkYXRhWzJdID09IE1DUDIyMjFfSTJDX0FERFJfTkFDSykg
ewogCQkJCW1jcC0+c3RhdHVzID0gLUVOWElPOwogCQkJCWJyZWFrOwogCQkJfQorCQkJaWYg
KHNpemUgPCA0KQorCQkJCWdvdG8gYmFpbDsKIAkJCWlmICghbWNwX2dldF9pMmNfZW5nX3N0
YXRlKG1jcCwgZGF0YSwgMikKIAkJCQkmJiAoZGF0YVszXSA9PSAwKSkgewogCQkJCW1jcC0+
c3RhdHVzID0gMDsKQEAgLTkwNiw3ICs5MjMsOSBAQCBzdGF0aWMgaW50IG1jcDIyMjFfcmF3
X2V2ZW50KHN0cnVjdCBoaWRfZGV2aWNlICpoZGV2LAogCQkJfQogCQkJaWYgKGRhdGFbMl0g
PT0gTUNQMjIyMV9JMkNfUkVBRF9DT01QTCB8fAogCQkJICAgIGRhdGFbMl0gPT0gTUNQMjIy
MV9JMkNfUkVBRF9QQVJUSUFMKSB7Ci0JCQkJaWYgKCFtY3AtPnJ4YnVmIHx8IG1jcC0+cnhi
dWZfaWR4IDwgMCB8fCBkYXRhWzNdID4gNjApIHsKKwkJCQlpZiAoIW1jcC0+cnhidWYgfHwK
KwkJCQkgICAgbWNwLT5yeGJ1Zl9pZHggPCAwIHx8IGRhdGFbM10gPiA2MCB8fAorCQkJCSAg
ICBkYXRhWzNdID4gc2l6ZSAtIDQgKSB7CiAJCQkJCW1jcC0+c3RhdHVzID0gLUVJTlZBTDsK
IAkJCQkJYnJlYWs7CiAJCQkJfQpAQCAtOTI1LDggKzk0NCwxMyBAQCBzdGF0aWMgaW50IG1j
cDIyMjFfcmF3X2V2ZW50KHN0cnVjdCBoaWRfZGV2aWNlICpoZGV2LAogCQlicmVhazsKIAog
CWNhc2UgTUNQMjIyMV9HUElPX0dFVDoKKwkJaWYgKHNpemUgPCAyKQorCQkJZ290byBiYWls
OworCiAJCXN3aXRjaCAoZGF0YVsxXSkgewogCQljYXNlIE1DUDIyMjFfU1VDQ0VTUzoKKwkJ
CWlmIChtY3AtPmdwX2lkeCA8IHNpemUpCisJCQkJZ290byBiYWlsOwogCQkJaWYgKChkYXRh
W21jcC0+Z3BfaWR4XSA9PSBNQ1AyMjIxX0FMVF9GX05PVF9HUElPVikgfHwKIAkJCQkoZGF0
YVttY3AtPmdwX2lkeCArIDFdID09IE1DUDIyMjFfQUxUX0ZfTk9UX0dQSU9EKSkgewogCQkJ
CW1jcC0+c3RhdHVzID0gLUVOT0VOVDsKQEAgLTk0Miw4ICs5NjYsMTMgQEAgc3RhdGljIGlu
dCBtY3AyMjIxX3Jhd19ldmVudChzdHJ1Y3QgaGlkX2RldmljZSAqaGRldiwKIAkJYnJlYWs7
CiAKIAljYXNlIE1DUDIyMjFfR1BJT19TRVQ6CisJCWlmIChzaXplIDwgMikKKwkJCWdvdG8g
YmFpbDsKKwogCQlzd2l0Y2ggKGRhdGFbMV0pIHsKIAkJY2FzZSBNQ1AyMjIxX1NVQ0NFU1M6
CisJCQlpZiAoc2l6ZSA8IG1jcC0+Z3BfaWR4KQorCQkJCWdvdG8gYmFpbDsKIAkJCWlmICgo
ZGF0YVttY3AtPmdwX2lkeF0gPT0gTUNQMjIyMV9BTFRfRl9OT1RfR1BJT1YpIHx8CiAJCQkJ
KGRhdGFbbWNwLT5ncF9pZHggLSAxXSA9PSBNQ1AyMjIxX0FMVF9GX05PVF9HUElPVikpIHsK
IAkJCQltY3AtPnN0YXR1cyA9IC1FTk9FTlQ7CkBAIC05NTgsNiArOTg3LDkgQEAgc3RhdGlj
IGludCBtY3AyMjIxX3Jhd19ldmVudChzdHJ1Y3QgaGlkX2RldmljZSAqaGRldiwKIAkJYnJl
YWs7CiAKIAljYXNlIE1DUDIyMjFfU0VUX1NSQU1fU0VUVElOR1M6CisJCWlmIChzaXplIDwg
MikKKwkJCWdvdG8gYmFpbDsKKwogCQlzd2l0Y2ggKGRhdGFbMV0pIHsKIAkJY2FzZSBNQ1Ay
MjIxX1NVQ0NFU1M6CiAJCQltY3AtPnN0YXR1cyA9IDA7CkBAIC05NjksOCArMTAwMSwxMyBA
QCBzdGF0aWMgaW50IG1jcDIyMjFfcmF3X2V2ZW50KHN0cnVjdCBoaWRfZGV2aWNlICpoZGV2
LAogCQlicmVhazsKIAogCWNhc2UgTUNQMjIyMV9HRVRfU1JBTV9TRVRUSU5HUzoKKwkJaWYg
KHNpemUgPCAyKQorCQkJZ290byBiYWlsOworCiAJCXN3aXRjaCAoZGF0YVsxXSkgewogCQlj
YXNlIE1DUDIyMjFfU1VDQ0VTUzoKKwkJCWlmIChzaXplIDwgMjIgKyA0KQorCQkJCWdvdG8g
YmFpbDsKIAkJCW1lbWNweSgmbWNwLT5tb2RlLCAmZGF0YVsyMl0sIDQpOwogI2lmIElTX1JF
QUNIQUJMRShDT05GSUdfSUlPKQogCQkJbWNwLT5kYWNfdmFsdWUgPSBkYXRhWzZdICYgR0VO
TUFTSyg0LCAwKTsKQEAgLTk4NCw2ICsxMDIxLDggQEAgc3RhdGljIGludCBtY3AyMjIxX3Jh
d19ldmVudChzdHJ1Y3QgaGlkX2RldmljZSAqaGRldiwKIAkJYnJlYWs7CiAKIAljYXNlIE1D
UDIyMjFfUkVBRF9GTEFTSF9EQVRBOgorCQlpZiAoc2l6ZSA8IDIpCisJCQlnb3RvIGJhaWw7
CiAJCXN3aXRjaCAoZGF0YVsxXSkgewogCQljYXNlIE1DUDIyMjFfU1VDQ0VTUzoKIAkJCW1j
cC0+c3RhdHVzID0gMDsKQEAgLTk5Nyw2ICsxMDM2LDggQEAgc3RhdGljIGludCBtY3AyMjIx
X3Jhd19ldmVudChzdHJ1Y3QgaGlkX2RldmljZSAqaGRldiwKICNpZiBJU19SRUFDSEFCTEUo
Q09ORklHX0lJTykKIAkJCXsKIAkJCQl1OCB0bXA7CisJCQkJaWYgKHNpemUgPCA4KQorCQkJ
CQlnb3RvIGJhaWw7CiAJCQkJLyogREFDIHNjYWxlIHZhbHVlICovCiAJCQkJdG1wID0gRklF
TERfR0VUKEdFTk1BU0soNywgNiksIGRhdGFbNl0pOwogCQkJCWlmICgoZGF0YVs2XSAmIEJJ
VCg1KSkgJiYgdG1wKQpAQCAtMTAyMSw2ICsxMDYyLDcgQEAgc3RhdGljIGludCBtY3AyMjIx
X3Jhd19ldmVudChzdHJ1Y3QgaGlkX2RldmljZSAqaGRldiwKIAkJYnJlYWs7CiAKIAlkZWZh
dWx0OgorYmFpbDoKIAkJbWNwLT5zdGF0dXMgPSAtRUlPOwogCQljb21wbGV0ZSgmbWNwLT53
YWl0X2luX3JlcG9ydCk7CiAJfQotLSAKMi41MS4wCgo=

--------------ZY6MLU2afbK0jXl912AgSgwf--

