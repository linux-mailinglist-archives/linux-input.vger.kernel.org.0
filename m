Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85E51188B48
	for <lists+linux-input@lfdr.de>; Tue, 17 Mar 2020 17:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbgCQQ5K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Mar 2020 12:57:10 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37648 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgCQQ5K (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Mar 2020 12:57:10 -0400
Received: by mail-wr1-f66.google.com with SMTP id 6so26644855wre.4
        for <linux-input@vger.kernel.org>; Tue, 17 Mar 2020 09:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=15N0nZXU4cxTQBnEIqzxagShZFTC54nV6qDXl7OlOSg=;
        b=uElTIkph7a9SxEmzXNjHJAkqJKoQAW+qkS4om8zg/iaVLCaECEl1+ol3OdljLiCL/F
         Ci2iyxfAVDepTle9kXaT1hi7AYLvIHzVsfP3Le5EQ6KyP+z0VcgHoS2dpHtpT1StSGX/
         hCr/u7p3dpC9PRdY3ticbj2eYrBkquK9ECDXej0/iwpoVls7DE4g900jweddzkugQF/F
         CT9qQjUq4tT9+WpqPfji3i0gCqqAlSAvtMiXXJi+4ZIkvdoaJLFk8jGrKiaxHu9vB2kB
         PgKi7JmxJ35VcLCLKjbLR3UzCq3fFMLqoHfOWBm6U+o+XFcFVVuZ0DNZjtr3YEVKsu4u
         fzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=15N0nZXU4cxTQBnEIqzxagShZFTC54nV6qDXl7OlOSg=;
        b=UkM08XGoS38SaMorc9zC0Rjg8BUnmd0IKBclgkRTbvwjPKtUer+chxnbkEpkvOIm/n
         p1k75hG5R3MZe5e4pbe9vS2OCwrnPuL7MYhKs1c/14cdop3HziPO4dCWFCfprZmRZOQU
         14Om5gVPpt2QCgGCEhQ06jhJCXnA6KhK/+W2xtbKZxWzQ+lwztEKqEDHMb4KTjHXr8EE
         F67PXdX5IqvSbzSB46mJbGsRu3wCI7uP00uhTtu+i+HEX/4RKwKyahYE6WSVV6DBdRxe
         sNXxtFQVwd3BevYbaQxqnI06ynxU6eTBp9ekpxbYVyPNDMubip+/f0J63BuRZbv44ghD
         hL/Q==
X-Gm-Message-State: ANhLgQ3wRRgvrdMMo/ukdq2lL4WZ8bdYl+VbwO44Zhl10W/gRFFZo1gL
        RkbKyr/fZk/hCw78CVn22Bs=
X-Google-Smtp-Source: ADFU+vtSgy+aebH37PewHn173W259nWFAnG8hbruEBkWQl3nWKw3kH4rNJMv5CjuiriKsIy6xVZ2VA==
X-Received: by 2002:a5d:67cd:: with SMTP id n13mr6733125wrw.383.1584464227399;
        Tue, 17 Mar 2020 09:57:07 -0700 (PDT)
Received: from localhost (ip1f115f16.dynamic.kabel-deutschland.de. [31.17.95.22])
        by smtp.gmail.com with ESMTPSA id i1sm5657988wrs.18.2020.03.17.09.57.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Mar 2020 09:57:06 -0700 (PDT)
Date:   Tue, 17 Mar 2020 17:57:05 +0100
From:   Oliver Graute <oliver.graute@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        rydberg@bitmath.org, robh@kernel.org, mylene.josserand@bootlin.com,
        p.zabel@pengutronix.de
Subject: Re: RFC: Input: edt-ft5x06 - FT6336G Touch Panel
Message-ID: <20200317165705.GA16514@ripley>
References: <20200305163649.GC10366@ripley>
 <20200316145736.GG16310@optiplex>
 <20200316163054.GV1922688@smile.fi.intel.com>
 <20200316200157.GA17716@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200316200157.GA17716@pengutronix.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 16/03/20, Marco Felsch wrote:
> On 20-03-16 18:30, Andy Shevchenko wrote:
> > On Mon, Mar 16, 2020 at 03:57:36PM +0100, Oliver Graute wrote:
> > > On 02/03/20, Oliver Graute wrote:
> > > > Hello,
> > > > 
> > > > I have on of these FT6336G Touch Panels here and I try to get it work
> > > > with the ft6236 driver. It comes up with model identification "0x11". So
> > > > I added that identification to the switch case in
> > > > edt_ft5x06_ts_identify(). But it crashes directly after the probe with a
> > > > corrupted stack. No clue why. Some ideas?
> > > 
> > > I still observe sometimes crashes with ft6236G. When it occurs it is
> > > always a stack corruption in the probe function on bootup.
> > > 
> > > No clue why stack is corrupted sometimes. Is this related to the buggy
> > > revision field?
> > > 
> > > Some further suggestions for debugging this?
> > 
> > Are you sure you have proper I²C bus settings on electrical level
> > (pull-up strength, line capacitance, etc.)?
> > 
> > > [    3.806780] edt_ft5x06 1-0038: Model "EP0110M09", Rev. "�", 0x0 sensors
> > > [    3.808468] at24 2-0050: 2-0050 supply vcc not found, using dummy regulator
> > > [    3.814864] DEBUG: edt_ft5x06_ts_probe 1201
> > > [    3.826215] DEBUG: edt_ft5x06_ts_probe 1211
> > > [    3.830512] DEBUG: edt_ft5x06_ts_probe 1214
> > > [    3.834904] input: EP0110M09 as /devices/platform/bus@5a000000/5a820000.i2c/i2c-1/1-0038/input/input0
> > > [    3.844164] at24 2-0050: 4096 byte 24c32 EEPROM, writable, 1 bytes/write
> > > [    3.844264] DEBUG: edt_ft5x06_ts_probe 1222
> > > [    3.850919] i2c i2c-2: LPI2C adapter registered
> > > [    3.855187] edt_ft5x06 1-0038: EDT FT5x06 initialized: IRQ 55, WAKE pin -1, Reset pin -1.
> > 
> > > [    3.867878] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: edt_ft5x06_ts_probe+0x5c4/0xb00
> > 
> > Maybe you can look at the assembly to see how compiler puts variables on stack. Also enabling KASAN might help.
> 
> This would be the easiest way to debug such failures and since ARMv8
> support it you just need to enable it =)

ok, I enabled KASAN and I got the following trace:

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
[    0.000000] Linux version 5.6.0-rc1-next-20200214-00057-g9e78f1560095-dirty (alarm@imx8qm) (gcc version 9.2.0 (GCC)) #100 SMP PREEMPT Tue Mar 17 15:54:17 UTC 2020
[    0.000000] Machine model: Advantech iMX8QM DMSSE20
[    0.000000] earlycon: lpuart32 at MMIO 0x000000005a060000 (options '115200')
[    0.000000] printk: bootconsole [lpuart32] enabled
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 32 MiB at 0x00000000fe000000
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 0x0000000080200000-0x00000009ffffffff]
[    0.000000] NUMA: NODE_DATA [mem 0x9fefe2100-0x9fefe3fff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000080200000-0x00000000bfffffff]
[    0.000000]   DMA32    [mem 0x00000000c0000000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x00000009ffffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080200000-0x00000000ffffffff]
[    0.000000]   node   0: [mem 0x0000000880000000-0x00000009ffffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080200000-0x00000009ffffffff]
[    0.000000] On node 0 totalpages: 2096640
[    0.000000]   DMA zone: 4088 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 261632 pages, LIFO batch:63
[    0.000000]   DMA32 zone: 4096 pages used for memmap
[    0.000000]   DMA32 zone: 262144 pages, LIFO batch:63
[    0.000000]   Normal zone: 24576 pages used for memmap
[    0.000000]   Normal zone: 1572864 pages, LIFO batch:63
[    0.000000] kasan: KernelAddressSanitizer initialized
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.1
[    0.000000] percpu: Embedded 30 pages/cpu s82584 r8192 d32104 u122880
[    0.000000] pcpu-alloc: s82584 r8192 d32104 u122880 alloc=30*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 [0] 4 
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: ARM erratum 845719
[    0.000000] CPU features: detected: GIC system register CPU interface
[    0.000000] Speculative Store Bypass Disable mitigation not required
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 2063880
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: console=ttyLP0,115200 earlycon=lpuart32,0x5a060000,115200 root=/dev/nfs ip=dhcp nfsroot=10.200.134.119:/srv/nfs/rootfs_dmsse20/,v3,tcp rw debug
[    0.000000] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.000000] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] software IO TLB: mapped [mem 0xbbfff000-0xbffff000] (64MB)
[    0.000000] Memory: 6990668K/8386560K available (19260K kernel code, 12216K rwdata, 13776K rodata, 17728K init, 13678K bss, 1363124K reserved, 32768K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=5, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=5.
[    0.000000]  Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=5
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
[    0.000000] GICv3: 512 SPIs implemented
[    0.000000] GICv3: 0 Extended SPIs implemented
[    0.000000] GICv3: Distributor has no Range Selector support
[    0.000000] GICv3: 16 PPIs implemented
[    0.000000] GICv3: no VLPI support, no direct LPI support, no RVPEID support
[    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x0000000051b00000
[    0.000000] ITS: No ITS available, not enabling LPIs
[    0.000000] random: get_random_bytes called from start_kernel+0x58c/0x770 with crng_init=0
[    0.000000] arch_timer: cp15 timer(s) running at 8.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x1d854df40, max_idle_ns: 440795202120 ns
[    0.000010] sched_clock: 56 bits at 8MHz, resolution 125ns, wraps every 2199023255500ns
[    0.012032] Console: colour dummy device 80x25
[    0.016927] Calibrating delay loop (skipped), value calculated using timer frequency.. 16.00 BogoMIPS (lpj=32000)
[    0.026877] pid_max: default: 32768 minimum: 301
[    0.033756] LSM: Security Framework initializing
[    0.039202] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.046512] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.090850] ASID allocator initialised with 65536 entries
[    0.103996] rcu: Hierarchical SRCU implementation.
[    0.151788] EFI services will not be available.
[    0.164111] smp: Bringing up secondary CPUs ...
[    0.201364] Detected VIPT I-cache on CPU1
[    0.201436] GICv3: CPU1: found redistributor 1 region 0:0x0000000051b20000
[    0.201499] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
[    0.233434] Detected VIPT I-cache on CPU2
[    0.233483] GICv3: CPU2: found redistributor 2 region 0:0x0000000051b40000
[    0.233519] CPU2: Booted secondary processor 0x0000000002 [0x410fd034]
[    0.265563] Detected VIPT I-cache on CPU3
[    0.265610] GICv3: CPU3: found redistributor 3 region 0:0x0000000051b60000
[    0.265646] CPU3: Booted secondary processor 0x0000000003 [0x410fd034]
[    0.300493] CPU features: detected: EL2 vector hardening
[    0.300518] CPU features: detected: ARM erratum 1319367
[    0.300523] Detected PIPT I-cache on CPU4
[    0.300552] GICv3: CPU4: found redistributor 100 region 0:0x0000000051b80000
[    0.300579] CPU4: Booted secondary processor 0x0000000100 [0x410fd082]
[    0.300713] smp: Brought up 1 node, 5 CPUs
[    0.384707] SMP: Total of 5 processors activated.
[    0.389390] CPU features: detected: 32-bit EL0 Support
[    0.394536] CPU features: detected: CRC32 instructions
[    0.417980] CPU: All CPU(s) started at EL2
[    0.421810] alternatives: patching kernel code
[    0.437004] devtmpfs: initialized
[    0.566168] Unable to handle kernel paging request at virtual address dfffa00000000000
[    0.573965] Mem abort info:
[    0.576534]   ESR = 0x96000044
[    0.579597]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.584891]   SET = 0, FnV = 0
[    0.587916]   EA = 0, S1PTW = 0
[    0.591057] Data abort info:
[    0.593911]   ISV = 0, ISS = 0x00000044
[    0.597748]   CM = 0, WnR = 1
[    0.600689] [dfffa00000000000] address between user and kernel address ranges
[    0.607841] Internal error: Oops: 96000044 [#1] PREEMPT SMP
[    0.613373] Modules linked in:
[    0.616425] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc1-next-20200214-00057-g9e78f1560095-dirty #100
[    0.626227] Hardware name: Advantech iMX8QM DMSSE20 (DT)
[    0.631532] pstate: 80000005 (Nzcv daif -PAN -UAO)
[    0.636327] pc : __memset+0x38/0x1ac
[    0.639880] lr : kasan_unpoison_shadow+0x34/0x50
[    0.644471] sp : ffff00093513fdc0
[    0.647771] x29: ffff00093513fdc0 x28: 0000000000000000 
[    0.653068] x27: 0000000000000000 x26: 0000000000000000 
[    0.658367] x25: 0000000000000000 x24: 000000000000000e 
[    0.663668] x23: ffffa00013ab4b30 x22: ffffa00013ab4970 
[    0.668967] x21: dfffa00000000000 x20: 0000000000000001 
[    0.674265] x19: 000000000000000e x18: 00000000ad856cb8 
[    0.679565] x17: 000000004a6c9290 x16: 00000000442eb574 
[    0.684864] x15: 0000000000007fff x14: ffffa000101ac700 
[    0.690164] x13: ffffa000101ac4b4 x12: ffff940002651145 
[    0.695464] x11: 1ffff40002651144 x10: ffff940002651144 
[    0.700762] x9 : 0000000000000000 x8 : dfffa00000000000 
[    0.706062] x7 : 0000000000000000 x6 : 000000000000003f 
[    0.711361] x5 : 0000000000000040 x4 : dfffa00000000000 
[    0.716661] x3 : ffffa00011976e20 x2 : 0000000000000001 
[    0.721960] x1 : 0000000000000000 x0 : dfffa00000000000 
[    0.727263] Call trace:
[    0.729704]  __memset+0x38/0x1ac
[    0.732917]  __asan_register_globals+0x44/0x88
[    0.737357]  _GLOBAL__sub_I_65535_1_drm_gem_init+0x1c/0x28
[    0.742832]  kernel_init_freeable+0x170/0x2e8
[    0.747166]  kernel_init+0x10/0x10c
[    0.750644]  ret_from_fork+0x10/0x18
[    0.754212] Code: b8004507 36080042 78002507 36000042 (39000107) 
[    0.760306] ---[ end trace 93cedcfba6557fc7 ]---
[    0.764918] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    0.772529] SMP: stopping secondary CPUs
[    0.776452] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

Best Regards,

Oliver
