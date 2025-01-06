Return-Path: <linux-input+bounces-8957-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 201F7A0236E
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 11:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0084D1635C2
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 10:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1461DC1B7;
	Mon,  6 Jan 2025 10:50:05 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0301DC198
	for <linux-input@vger.kernel.org>; Mon,  6 Jan 2025 10:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736160605; cv=none; b=ptO/Wj7PuhzV8S3y8JW0v/zuAuiZOvOex6ftiwTdhbbiQs8O60NsmaqRHvGboEf7DUxZi9kNaE7IUoC525jWi8QipU0ngmEgW2xzU4iwt+DTVqQtJXHEZ5ndXEBavrRkK1vehKozojXW+54skWALi14gctf391KpehhzOaDk99o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736160605; c=relaxed/simple;
	bh=X37/hXFmDWKPDpNa1ZPdVO/FfDYdelB252MdJvuRrvE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=XI75xyU/VVI7T4ZnnTSKJ3AelB7fhSFM1PZxnRLG5La3IJ7qYI9GAql6GDTPx1nAQVUH+XASs8Q+s9tRJGykzZpGxDpiFI2FOPiZ+w6VvG0zwyhNM8jxzbaZDYsLRobV9rq2snyMGLHiB7xXDOvR5SsNuM4Nu4NNQhLA9OccjTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a817be161bso138596485ab.1
        for <linux-input@vger.kernel.org>; Mon, 06 Jan 2025 02:50:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736160602; x=1736765402;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5M/4xM1of64Hkt6i58I9gFwLKO0HhuPkyed+cF7M40=;
        b=JItLbfGtyRb382F34fpmoZaNGR5XRmyGdf2GiTVQOz4spFkiX79ch3d/Uy9LwZ52O8
         Wd3NDZyGcxcDqu7MnkvYX76Q1eo9rFTdAdTEC+UCnvWMNe6AuCQ741AGpNsrhhLaojn5
         RRXG79RA+bWtKuASL7nxvBMTq6dwvnF9vVPAaxZUj3NkLpIxGa+kL8erZDZ5R5rVmTrr
         TmPJUx1fo6tvCgZtgnvrwaEpyv02pdIuPeZZo7xHtR9p99mGblX9puVKAMLK/GDKuvPD
         2N1eZvZKnQ6G3v1+RYXT7i5lufqXPwZA723hrCQ5DzontRMbDRtCozIYTenMa7IgOtkC
         s1Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVunadNWXOpdI9m1oJHTLYlF0bUQ1fMAaMHrdhzc4RKRqPQ98/laSWZZSom+gT9Hi49uaxQ94nPOhcKdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwflfKhgJSRa1zgZWSxM5ImZd+Vgt2Okj4eacuRrHLM0mZICtAg
	njIcgHATHb6VYLANBjzR6W/4zRLif51TNsPqiIxlz1Wd8Qz2KGYKfMZ5NFWzjpdQpiTuF+aAoPI
	sxouKScuVdaFEDc9rnm73yPofThncaFJ0RecyvO8aodwGzwuIH2MllUg=
X-Google-Smtp-Source: AGHT+IHBhl/78jtsaBsNG/Mi+1q7gm0UxopQsg/5+xay6RPgqDfOnmbPvK/yZGMyIZDaBQHYTZDV2KLRdQMmj6EqMbE1RwrlwEuG
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:349c:b0:3a7:d02b:f653 with SMTP id
 e9e14a558f8ab-3c2f9815c0emr526254465ab.0.1736160602465; Mon, 06 Jan 2025
 02:50:02 -0800 (PST)
Date: Mon, 06 Jan 2025 02:50:02 -0800
In-Reply-To: <20250106102934.1379-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <677bb55a.050a0220.a40f5.000b.GAE@google.com>
Subject: Re: [syzbot] [input?] possible deadlock in input_ff_flush
From: syzbot <syzbot+ed7c6209f62eba1565aa@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

RCU Tasks: Setting shift to 3 and lim to 1 rcu_task_cb_adjust=3D1 rcu_task_=
cpu_ids=3D8.
[    1.320011][    T0] RCU Tasks Trace: Setting shift to 3 and lim to 1 rcu=
_task_cb_adjust=3D1 rcu_task_cpu_ids=3D8.
[    1.413544][    T0] NR_IRQS: 4352, nr_irqs: 488, preallocated irqs: 16
[    1.417998][    T0] rcu: srcu_init: Setting srcu_struct sizes based on c=
ontention.
[    1.422501][    T0] kfence: initialized - using 2097152 bytes for 255 ob=
jects at 0xffff88816da00000-0xffff88816dc00000
[    1.452776][    T0] Console: colour VGA+ 80x25
[    1.455468][    T0] printk: legacy console [ttyS0] enabled
[    1.455468][    T0] printk: legacy console [ttyS0] enabled
[    1.461552][    T0] printk: legacy bootconsole [earlyser0] disabled
[    1.461552][    T0] printk: legacy bootconsole [earlyser0] disabled
[    1.468502][    T0] Lock dependency validator: Copyright (c) 2006 Red Ha=
t, Inc., Ingo Molnar
[    1.473211][    T0] ... MAX_LOCKDEP_SUBCLASSES:  8
[    1.475923][    T0] ... MAX_LOCK_DEPTH:          48
[    1.478695][    T0] ... MAX_LOCKDEP_KEYS:        8192
[    1.481553][    T0] ... CLASSHASH_SIZE:          4096
[    1.484403][    T0] ... MAX_LOCKDEP_ENTRIES:     1048576
[    1.487406][    T0] ... MAX_LOCKDEP_CHAINS:      1048576
[    1.490409][    T0] ... CHAINHASH_SIZE:          524288
[    1.493349][    T0]  memory used by lock dependency info: 106625 kB
[    1.496847][    T0]  memory used for stack traces: 8320 kB
[    1.499919][    T0]  per task-struct memory footprint: 1920 bytes
[    1.503473][    T0] mempolicy: Enabling automatic NUMA balancing. Config=
ure with numa_balancing=3D or the kernel.numa_balancing sysctl
[    1.510107][    T0] ACPI: Core revision 20240827
[    1.513638][    T0] clocksource: hpet: mask: 0xffffffff max_cycles: 0xff=
ffffff, max_idle_ns: 19112604467 ns
[    1.519704][    T0] APIC: Switch to symmetric I/O mode setup
[    1.522913][    T0] DMAR: Host address width 39
[    1.525474][    T0] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    1.528986][    T0] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap d200=
8c22260206 ecap f00f5e
[    1.534044][    T0] DMAR: ATSR flags: 0x1
[    1.536335][    T0] DMAR-IR: IOAPIC id 0 under DRHD base  0xfed90000 IOM=
MU 0
[    1.540418][    T0] DMAR-IR: Queued invalidation will be enabled to supp=
ort x2apic and Intr-remapping.
[    1.548667][    T0] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    1.552114][    T0] x2apic enabled
[    1.554491][    T0] APIC: Switched APIC routing to: cluster x2apic
[    1.557962][    T0] kvm-guest: APIC: send_IPI_mask() replaced with kvm_s=
end_ipi_mask()
[    1.562568][    T0] kvm-guest: APIC: send_IPI_mask_allbutself() replaced=
 with kvm_send_ipi_mask_allbutself()
[    1.567982][    T0] kvm-guest: setup PV IPIs
[    1.581704][    T0] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1=
 pin2=3D-1
[    1.585771][    T0] clocksource: tsc-early: mask: 0xffffffffffffffff max=
_cycles: 0x257a52d4118, max_idle_ns: 440795307231 ns
[    1.592018][    T0] Calibrating delay loop (skipped) preset value.. 5200=
.04 BogoMIPS (lpj=3D26000240)
[    1.598053][    T0] x86/cpu: User Mode Instruction Prevention (UMIP) act=
ivated
[    1.602772][    T0] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    1.606122][    T0] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    1.612067][    T0] Spectre V1 : Mitigation: usercopy/swapgs barriers an=
d __user pointer sanitization
[    1.617214][    T0] Spectre V2 : WARNING: Unprivileged eBPF is enabled w=
ith eIBRS on, data leaks possible via Spectre v2 BHB attacks!
[    1.622026][    T0] Spectre V2 : Spectre BHI mitigation: SW BHB clearing=
 on syscall and VM exit
[    1.626659][    T0] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    1.632013][    T0] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Fil=
ling RSB on context switch
[    1.636821][    T0] Spectre V2 : Spectre v2 / PBRSB-eIBRS: Retire a sing=
le CALL on VMEXIT
[    1.641224][    T0] Spectre V2 : mitigation: Enabling conditional Indire=
ct Branch Prediction Barrier
[    1.642068][    T0] Speculative Store Bypass: Mitigation: Speculative St=
ore Bypass disabled via prctl
[    1.647090][    T0] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floati=
ng point registers'
[    1.652014][    T0] x86/fpu: Supporting XSAVE feature 0x002: 'SSE regist=
ers'
[    1.655416][    T0] x86/fpu: Supporting XSAVE feature 0x004: 'AVX regist=
ers'
[    1.662016][    T0] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 op=
mask'
[    1.665506][    T0] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi=
256'
[    1.668910][    T0] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZM=
M_Hi256'
[    1.672015][    T0] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  2=
56
[    1.675340][    T0] x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   =
64
[    1.678673][    T0] x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  5=
12
[    1.682014][    T0] x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 10=
24
[    1.685374][    T0] x86/fpu: Enabled xstate features 0xe7, context size =
is 2432 bytes, using 'compacted' format.
[    1.879449][    T0] Freeing SMP alternatives memory: 124K
[    1.882022][    T0] pid_max: default: 32768 minimum: 301
[    1.884916][    T0] LSM: initializing lsm=3Dlockdown,capability,landlock=
,yama,safesetid,tomoyo,selinux,bpf,ima,evm
[    1.890201][    T0] landlock: Up and running.
[    1.892017][    T0] Yama: becoming mindful.
[    1.894319][    T0] TOMOYO Linux initialized
[    1.896440][    T0] SELinux:  Initializing.
[    1.900834][    T0] LSM support for eBPF active
[    1.904266][    T0] Dentry cache hash table entries: 524288 (order: 10, =
4194304 bytes, vmalloc hugepage)
[    1.909837][    T0] Inode-cache hash table entries: 262144 (order: 9, 20=
97152 bytes, vmalloc hugepage)
[    1.912180][    T0] Mount-cache hash table entries: 8192 (order: 4, 6553=
6 bytes, vmalloc)
[    1.916220][    T0] Mountpoint-cache hash table entries: 8192 (order: 4,=
 65536 bytes, vmalloc)
[    1.924405][    T0] Running RCU synchronous self tests
[    1.926906][    T0] Running RCU synchronous self tests
[    1.932624][    T1] smpboot: CPU0: Intel(R) Xeon(R) CPU @ 2.60GHz (famil=
y: 0x6, model: 0x6a, stepping: 0x6)
[    1.939802][    T1] Running RCU Tasks wait API self tests
[    2.052170][    T1] Running RCU Tasks Trace wait API self tests
[    2.055195][    T1] Performance Events: unsupported p6 CPU model 106 no =
PMU driver, software events only.
[    2.059975][    T1] signal: max sigframe size: 3632
[    2.062509][    T1] rcu: Hierarchical SRCU implementation.
[    2.065211][    T1] rcu: 	Max phase no-delay instances is 1000.
[    2.068674][    T1] Timer migration: 2 hierarchy levels; 8 children per =
group; 1 crossnode level
[    2.072179][   T15] Callback from call_rcu_tasks_trace() invoked.
[    2.078054][    T1] NMI watchdog: Perf NMI watchdog permanently disabled
[    2.082536][    T1] smp: Bringing up secondary CPUs ...
[    2.086533][    T1] smpboot: x86: Booting SMP configuration:
[    2.089356][    T1] .... node  #0, CPUs:      #2
[    2.092529][   T22] ------------[ cut here ]------------
[    2.096008][   T22] workqueue: work disable count underflowed
[    2.099729][   T22] WARNING: CPU: 2 PID: 22 at kernel/workqueue.c:4317 e=
nable_work+0x2fa/0x340
[    2.102006][   T22] Modules linked in:
[    2.102006][   T22] CPU: 2 UID: 0 PID: 22 Comm: cpuhp/2 Not tainted 6.13=
.0-rc6-syzkaller-g9d89551994a4-dirty #0
[    2.102006][   T22] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), =
BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
[    2.102006][   T22] RIP: 0010:enable_work+0x2fa/0x340
[    2.102006][   T22] Code: 89 ee e8 49 d6 36 00 45 84 ed 0f 85 28 fe ff f=
f e8 9b db 36 00 c6 05 f2 9f e4 0e 01 90 48 c7 c7 00 da 6b 8b e8 57 12 f7 f=
f 90 <0f> 0b 90 90 e9 05 fe ff ff 48 89 ef e8 e5 7f 99 00 e9 a9 fe ff ff
[    2.102006][   T22] RSP: 0000:ffffc9000060fca0 EFLAGS: 00010082
[    2.102006][   T22] RAX: 0000000000000000 RBX: 0000000000000000 RCX: fff=
fffff815a5139
[    2.102006][   T22] RDX: ffff88801d6dc880 RSI: ffffffff815a5146 RDI: 000=
0000000000001
[    2.102006][   T22] RBP: ffff88806a838660 R08: 0000000000000001 R09: 000=
0000000000000
[    2.102006][   T22] R10: 0000000000000000 R11: 0000000000000002 R12: 1ff=
ff920000c1f95
[    2.102006][   T22] R13: 0000000000000000 R14: 00000000000000c5 R15: fff=
fffff81dbfd90
[    2.102006][   T22] FS:  0000000000000000(0000) GS:ffff88806a800000(0000=
) knlGS:0000000000000000
[    2.102006][   T22] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.102006][   T22] CR2: 0000000000000000 CR3: 000000000df7e000 CR4: 000=
0000000350ef0
[    2.102006][   T22] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[    2.102006][   T22] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[    2.102006][   T22] Call Trace:
[    2.102006][   T22]  <TASK>
[    2.102006][   T22]  ? __warn+0xea/0x3c0
[    2.102006][   T22]  ? enable_work+0x2fa/0x340
[    2.102006][   T22]  ? report_bug+0x3c0/0x580
[    2.102006][   T22]  ? handle_bug+0x54/0xa0
[    2.102006][   T22]  ? exc_invalid_op+0x17/0x50
[    2.102006][   T22]  ? asm_exc_invalid_op+0x1a/0x20
[    2.102006][   T22]  ? __pfx_vmstat_cpu_online+0x10/0x10
[    2.102006][   T22]  ? __warn_printk+0x199/0x350
[    2.102006][   T22]  ? __warn_printk+0x1a6/0x350
[    2.102006][   T22]  ? enable_work+0x2fa/0x340
[    2.102006][   T22]  ? __pfx_enable_work+0x10/0x10
[    2.102006][   T22]  vmstat_cpu_online+0x83/0xf0
[    2.102006][   T22]  cpuhp_invoke_callback+0x3d0/0xa10
[    2.102006][   T22]  ? __pfx_vmstat_cpu_online+0x10/0x10
[    2.102006][   T22]  ? lock_acquire.part.0+0x350/0x380
[    2.102006][   T22]  ? cpuhp_next_state+0x100/0x1c0
[    2.102006][   T22]  cpuhp_thread_fun+0x480/0x6f0
[    2.102006][   T22]  ? __pfx_cpuhp_thread_fun+0x10/0x10
[    2.102006][   T22]  ? __pfx_cpuhp_thread_fun+0x10/0x10
[    2.102006][   T22]  ? smpboot_thread_fn+0x59d/0xa30
[    2.102006][   T22]  smpboot_thread_fn+0x661/0xa30
[    2.102006][   T22]  ? __kthread_parkme+0x148/0x220
[    2.102006][   T22]  ? __pfx_smpboot_thread_fn+0x10/0x10
[    2.102006][   T22]  kthread+0x2c1/0x3a0
[    2.102006][   T22]  ? _raw_spin_unlock_irq+0x23/0x50
[    2.102006][   T22]  ? __pfx_kthread+0x10/0x10
[    2.102006][   T22]  ret_from_fork+0x45/0x80
[    2.102006][   T22]  ? __pfx_kthread+0x10/0x10
[    2.102006][   T22]  ret_from_fork_asm+0x1a/0x30
[    2.102006][   T22]  </TASK>
[    2.102006][   T22] Kernel panic - not syncing: kernel: panic_on_warn se=
t ...
[    2.102006][   T22] CPU: 2 UID: 0 PID: 22 Comm: cpuhp/2 Not tainted 6.13=
.0-rc6-syzkaller-g9d89551994a4-dirty #0
[    2.102006][   T22] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), =
BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
[    2.102006][   T22] Call Trace:
[    2.102006][   T22]  <TASK>
[    2.102006][   T22]  dump_stack_lvl+0x3d/0x1f0
[    2.102006][   T22]  panic+0x71d/0x800
[    2.102006][   T22]  ? __pfx_panic+0x10/0x10
[    2.102006][   T22]  ? show_trace_log_lvl+0x29d/0x3d0
[    2.102006][   T22]  ? check_panic_on_warn+0x1f/0xb0
[    2.102006][   T22]  ? enable_work+0x2fa/0x340
[    2.102006][   T22]  check_panic_on_warn+0xab/0xb0
[    2.102006][   T22]  __warn+0xf6/0x3c0
[    2.102006][   T22]  ? enable_work+0x2fa/0x340
[    2.102006][   T22]  report_bug+0x3c0/0x580
[    2.102006][   T22]  handle_bug+0x54/0xa0
[    2.102006][   T22]  exc_invalid_op+0x17/0x50
[    2.102006][   T22]  asm_exc_invalid_op+0x1a/0x20
[    2.102006][   T22] RIP: 0010:enable_work+0x2fa/0x340
[    2.102006][   T22] Code: 89 ee e8 49 d6 36 00 45 84 ed 0f 85 28 fe ff f=
f e8 9b db 36 00 c6 05 f2 9f e4 0e 01 90 48 c7 c7 00 da 6b 8b e8 57 12 f7 f=
f 90 <0f> 0b 90 90 e9 05 fe ff ff 48 89 ef e8 e5 7f 99 00 e9 a9 fe ff ff
[    2.102006][   T22] RSP: 0000:ffffc9000060fca0 EFLAGS: 00010082
[    2.102006][   T22] RAX: 0000000000000000 RBX: 0000000000000000 RCX: fff=
fffff815a5139
[    2.102006][   T22] RDX: ffff88801d6dc880 RSI: ffffffff815a5146 RDI: 000=
0000000000001
[    2.102006][   T22] RBP: ffff88806a838660 R08: 0000000000000001 R09: 000=
0000000000000
[    2.102006][   T22] R10: 0000000000000000 R11: 0000000000000002 R12: 1ff=
ff920000c1f95
[    2.102006][   T22] R13: 0000000000000000 R14: 00000000000000c5 R15: fff=
fffff81dbfd90
[    2.102006][   T22]  ? __pfx_vmstat_cpu_online+0x10/0x10
[    2.102006][   T22]  ? __warn_printk+0x199/0x350
[    2.102006][   T22]  ? __warn_printk+0x1a6/0x350
[    2.102006][   T22]  ? __pfx_enable_work+0x10/0x10
[    2.102006][   T22]  vmstat_cpu_online+0x83/0xf0
[    2.102006][   T22]  cpuhp_invoke_callback+0x3d0/0xa10
[    2.102006][   T22]  ? __pfx_vmstat_cpu_online+0x10/0x10
[    2.102006][   T22]  ? lock_acquire.part.0+0x350/0x380
[    2.102006][   T22]  ? cpuhp_next_state+0x100/0x1c0
[    2.102006][   T22]  cpuhp_thread_fun+0x480/0x6f0
[    2.102006][   T22]  ? __pfx_cpuhp_thread_fun+0x10/0x10
[    2.102006][   T22]  ? __pfx_cpuhp_thread_fun+0x10/0x10
[    2.102006][   T22]  ? smpboot_thread_fn+0x59d/0xa30
[    2.102006][   T22]  smpboot_thread_fn+0x661/0xa30
[    2.102006][   T22]  ? __kthread_parkme+0x148/0x220
[    2.102006][   T22]  ? __pfx_smpboot_thread_fn+0x10/0x10
[    2.102006][   T22]  kthread+0x2c1/0x3a0
[    2.102006][   T22]  ? _raw_spin_unlock_irq+0x23/0x50
[    2.102006][   T22]  ? __pfx_kthread+0x10/0x10
[    2.102006][   T22]  ret_from_fork+0x45/0x80
[    2.102006][   T22]  ? __pfx_kthread+0x10/0x10
[    2.102006][   T22]  ret_from_fork_asm+0x1a/0x30
[    2.102006][   T22]  </TASK>
[    2.102006][   T22] Rebooting in 86400 seconds..


syzkaller build log:
go env (err=3D<nil>)
GO111MODULE=3D'auto'
GOARCH=3D'amd64'
GOBIN=3D''
GOCACHE=3D'/syzkaller/.cache/go-build'
GOENV=3D'/syzkaller/.config/go/env'
GOEXE=3D''
GOEXPERIMENT=3D''
GOFLAGS=3D''
GOHOSTARCH=3D'amd64'
GOHOSTOS=3D'linux'
GOINSECURE=3D''
GOMODCACHE=3D'/syzkaller/jobs/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/usr/local/go'
GOSUMDB=3D'sum.golang.org'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/usr/local/go/pkg/tool/linux_amd64'
GOVCS=3D''
GOVERSION=3D'go1.22.7'
GCCGO=3D'gccgo'
GOAMD64=3D'v1'
AR=3D'ar'
CC=3D'gcc'
CXX=3D'g++'
CGO_ENABLED=3D'1'
GOMOD=3D'/syzkaller/jobs/linux/gopath/src/github.com/google/syzkaller/go.mo=
d'
GOWORK=3D''
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
PKG_CONFIG=3D'pkg-config'
GOGCCFLAGS=3D'-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0=
 -ffile-prefix-map=3D/tmp/go-build3770409158=3D/tmp/go-build -gno-record-gc=
c-switches'

git status (err=3D<nil>)
HEAD detached at d3ccff6372
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' ./sys/syz-sysgen | grep -q false || go install ./sy=
s/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
go fmt ./sys/... >/dev/null
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build "-ldflags=3D-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3Dd3ccff6372e07c6aabd02b5da419aa6492b5f0ad -X '=
github.com/google/syzkaller/prog.gitRevisionDate=3D20241226-091248'" "-tags=
=3Dsyz_target syz_os_linux syz_arch_amd64 " -o ./bin/linux_amd64/syz-execpr=
og github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include -fpermissive -w -DGOOS_linu=
x=3D1 -DGOARCH_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"d3ccff6372e07c6aabd02b5da419aa6492=
b5f0ad\"
/usr/bin/ld: /tmp/cc7jjcOI.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D1270c4b0580000


Tested on:

commit:         9d895519 Linux 6.13-rc6
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D7bdfbaac3fbb90d=
6
dashboard link: https://syzkaller.appspot.com/bug?extid=3Ded7c6209f62eba156=
5aa
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D1120c4b05800=
00


