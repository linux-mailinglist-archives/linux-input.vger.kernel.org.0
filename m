Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A77E15D6B9
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2020 12:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbgBNLo4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Feb 2020 06:44:56 -0500
Received: from www149.your-server.de ([78.47.15.70]:54436 "EHLO
        www149.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbgBNLo4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Feb 2020 06:44:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hanno.de;
         s=default1911; h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:
        References:Cc:To:Subject:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
        :List-Post:List-Owner:List-Archive;
        bh=oCrzqEKydGOK50SQ/d0BhcqDwBywPeH/TaOtl5eRo7M=; b=daGmpyanzLk6RVg/mr5dfO8G+3
        qREdTP00Ya2vfZ0qdXK6UbYYp7RMXVmKle+R+PkRuCTYnQ1BFB1gThZZIF+UMD3IRRM8L5gaSE3Fk
        nH7miRbgNnZjue1qqpIEsbDl3AGyY2hjMBnSpzLd35h+qcUehQzI+f//3M174/PXHeD6EC6I67ijL
        d4TA5D8e+eKFDWvVJUbDT12L1To7DOwXbhSj+hGr6NRbNCj3DnzG5L/htwFqAamQXo+YTm5vcJcRI
        iAQseGju5JTgnSxyStf53ydzyttLGAePHUc27nsDgBERpVoGAoD8bVYn4fzaTDg2uzhOx/gTnO9EM
        pk8mJpAw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www149.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <abos@hanno.de>)
        id 1j2ZJE-0000lj-6I; Fri, 14 Feb 2020 12:39:00 +0100
Received: from [62.96.7.134] (helo=[10.1.0.41])
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <abos@hanno.de>)
        id 1j2ZJE-000Rcy-1k; Fri, 14 Feb 2020 12:39:00 +0100
Subject: hid-bigbenff general protection fault on unplug (Re: hid-sony kernel
 crash)
To:     Roderick Colenbrander <thunderbird2k@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-input <linux-input@vger.kernel.org>
References: <CAEc3jaC0yJF7oYs1TK_zcrQ6_Er5sSBD41feC8GEjpDsBs9iLA@mail.gmail.com>
From:   Hanno Zulla <abos@hanno.de>
Message-ID: <f61c212e-159e-b42c-bbab-ccf985e90975@hanno.de>
Date:   Fri, 14 Feb 2020 12:38:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAEc3jaC0yJF7oYs1TK_zcrQ6_Er5sSBD41feC8GEjpDsBs9iLA@mail.gmail.com>
Content-Type: multipart/mixed;
 boundary="------------2462E7BC0BDD91F01AB9AEA7"
Content-Language: en-US
X-Authenticated-Sender: abos@hanno.de
X-Virus-Scanned: Clear (ClamAV 0.102.1/25722/Thu Feb 13 12:45:05 2020)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a multi-part message in MIME format.
--------------2462E7BC0BDD91F01AB9AEA7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi there,

unplugging the BigBen gamepad supported by the hid-bigbenff driver 
reliably leads to a general protection fault when memory is allocated by 
something else afterwards, see the log (made with a 5.3.13 kernel).

Apparently, the resource cleanup in bigben_remove() is wrong in some 
way. I wonder if this is somehow related to the problem Roderick 
discussed below or possibly its original cause.

I'm pretty sure that I tested plugging/unplugging/replugging extensively 
when I originally wrote the hid-bigbenff driver against a 4.19/4.20 
kernel tree, so a bisect may be in order, but also cannot rule out that 
my use of devm_kzalloc() was faulty from the start.

If you see something obvious there, I'd be glad if you point it out. Am 
trying to debug this right now (am new to kernel debugging) and will try 
to provide a patch once the bug is identified.

Thanks,

Hanno


Am 30.07.19 um 07:50 schrieb Roderick Colenbrander:


> Hi Benjamin and Jiri,
> 
> Last week, Valve notified us of a kernel crash in hid-sony when
> disconnecting a controller (DS4 or DS3) while rumble is ongoing.
Message-ID: 
<CAEc3jaC0yJF7oYs1TK_zcrQ6_Er5sSBD41feC8GEjpDsBs9iLA@mail.gmail.com>


--------------2462E7BC0BDD91F01AB9AEA7
Content-Type: text/x-log; charset=UTF-8;
 name="bigbenff-gpf.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="bigbenff-gpf.log"

Feb 14 11:59:49 test-pc kernel: [  105.541342] usb 1-2: new full-speed USB device number 2 using uhci_hcd
Feb 14 11:59:49 test-pc kernel: [  105.904145] usb 1-2: New USB device found, idVendor=146b, idProduct=0902, bcdDevice= 1.00
Feb 14 11:59:49 test-pc kernel: [  105.904149] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Feb 14 11:59:49 test-pc kernel: [  105.904162] usb 1-2: Product: Bigben Game Pad
Feb 14 11:59:49 test-pc kernel: [  105.904164] usb 1-2: Manufacturer: Bigben Interactive
Feb 14 11:59:49 test-pc mtp-probe: checking bus 1, device 2: "/sys/devices/pci0000:00/0000:00:01.2/usb1/1-2"
Feb 14 11:59:49 test-pc mtp-probe: bus: 1, device: 2 was not an MTP device
Feb 14 11:59:49 test-pc kernel: [  105.951733] hidraw: raw HID events driver (C) Jiri Kosina
Feb 14 11:59:50 test-pc kernel: [  105.975007] usbcore: registered new interface driver usbhid
Feb 14 11:59:50 test-pc kernel: [  105.975008] usbhid: USB HID core driver
Feb 14 11:59:50 test-pc mtp-probe: checking bus 1, device 2: "/sys/devices/pci0000:00/0000:00:01.2/usb1/1-2"
Feb 14 11:59:50 test-pc mtp-probe: bus: 1, device: 2 was not an MTP device
Feb 14 11:59:50 test-pc kernel: [  106.007788] input: Bigben Interactive Bigben Game Pad as /devices/pci0000:00/0000:00:01.2/usb1/1-2/1-2:1.0/0003:146B:0902.0001/input/input5
Feb 14 11:59:50 test-pc kernel: [  106.066985] hid-generic 0003:146B:0902.0001: input,hidraw0: USB HID v1.11 Gamepad [Bigben Interactive Bigben Game Pad] on usb-0000:00:01.2-2/input0
Feb 14 11:59:50 test-pc kernel: [  106.127408] input: Bigben Interactive Bigben Game Pad as /devices/pci0000:00/0000:00:01.2/usb1/1-2/1-2:1.0/0003:146B:0902.0001/input/input6
Feb 14 11:59:50 test-pc kernel: [  106.187137] bigben 0003:146B:0902.0001: input,hidraw0: USB HID v1.11 Gamepad [Bigben Interactive Bigben Game Pad] on usb-0000:00:01.2-2/input0
Feb 14 11:59:50 test-pc kernel: [  106.187700] bigben 0003:146B:0902.0001: LED and force feedback support for BigBen gamepad
Feb 14 11:59:50 test-pc systemd-udevd[1786]: Process '/usr/bin/jscal-restore /dev/input/js0' failed with exit code 1.
Feb 14 11:59:50 test-pc systemd-udevd[1786]: Process '/usr/bin/jscal-restore /dev/input/js0' failed with exit code 1.
Feb 14 11:59:50 test-pc /usr/lib/gdm3/gdm-x-session[626]: (II) config/udev: Adding input device Bigben Interactive Bigben Game Pad (/dev/input/js0)
Feb 14 11:59:50 test-pc /usr/lib/gdm3/gdm-x-session[626]: (II) No input driver specified, ignoring this device.
Feb 14 11:59:50 test-pc /usr/lib/gdm3/gdm-x-session[626]: (II) This device may have been added with another device file.
Feb 14 11:59:50 test-pc /usr/lib/gdm3/gdm-x-session[626]: (II) config/udev: Adding input device Bigben Interactive Bigben Game Pad (/dev/input/event4)
Feb 14 11:59:50 test-pc /usr/lib/gdm3/gdm-x-session[626]: (II) No input driver specified, ignoring this device.
Feb 14 11:59:50 test-pc /usr/lib/gdm3/gdm-x-session[626]: (II) This device may have been added with another device file.



Feb 14 11:59:59 test-pc kernel: [  115.426849] usb 1-2: USB disconnect, device number 2



Feb 14 12:00:02 test-pc systemd[1]: Starting Message of the Day...
Feb 14 12:00:02 test-pc systemd[1]: motd-news.service: Main process exited, code=killed, status=11/SEGV
Feb 14 12:00:02 test-pc systemd[1]: motd-news.service: Failed with result 'signal'.
Feb 14 12:00:02 test-pc kernel: [  118.351173] ------------[ cut here ]------------
Feb 14 12:00:02 test-pc kernel: [  118.351176] kernel BUG at mm/slub.c:306!
Feb 14 12:00:02 test-pc kernel: [  118.351192] invalid opcode: 0000 [#1] SMP PTI
Feb 14 12:00:02 test-pc kernel: [  118.351198] CPU: 0 PID: 1810 Comm: 50-motd-news Not tainted 5.3.13+ #8
Feb 14 12:00:02 test-pc kernel: [  118.351199] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
Feb 14 12:00:02 test-pc kernel: [  118.351210] RIP: 0010:new_slab+0x2b1/0x4b0
Feb 14 12:00:02 test-pc kernel: [  118.351212] Code: 40 48 8b 55 a0 48 85 f6 0f 84 78 ff ff ff 48 89 df e8 03 d9 b6 00 41 8b 76 20 48 8b 55 a0 4c 01 e6 49 39 dc 0f 85 6c ff ff ff <0f> 0b fb 66 0f 1f 44 00 00 e9 9a fd ff ff 41 8b 46 08 a9 00 0d 21
Feb 14 12:00:02 test-pc kernel: [  118.351214] RSP: 0018:ffffbd5000c9bc00 EFLAGS: 00010246
Feb 14 12:00:02 test-pc kernel: [  118.351216] RAX: ffff92f5e41c3000 RBX: ffff92f5e41c3000 RCX: 0000000000000000
Feb 14 12:00:02 test-pc kernel: [  118.351217] RDX: 000000000000000e RSI: ffff92f5e41c3000 RDI: ffff92f672b09c40
Feb 14 12:00:02 test-pc kernel: [  118.351219] RBP: ffffbd5000c9bc60 R08: 0000000000000000 R09: 00000000000a02bc
Feb 14 12:00:02 test-pc kernel: [  118.351220] R10: 0000000000000002 R11: 0000000000000000 R12: ffff92f5e41c3000
Feb 14 12:00:02 test-pc kernel: [  118.351221] R13: 000000000000000a R14: ffff92f672b09c40 R15: fffff37cc29070c0
Feb 14 12:00:02 test-pc kernel: [  118.351223] FS:  00007f9e2c2d9580(0000) GS:ffff92f67ba00000(0000) knlGS:0000000000000000
Feb 14 12:00:02 test-pc kernel: [  118.351225] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Feb 14 12:00:02 test-pc kernel: [  118.351226] CR2: 0000564f82d324fa CR3: 00000000a4172000 CR4: 00000000000006f0
Feb 14 12:00:02 test-pc kernel: [  118.351230] Call Trace:
Feb 14 12:00:02 test-pc kernel: [  118.351246]  ___slab_alloc+0x338/0x550
Feb 14 12:00:02 test-pc kernel: [  118.351250]  ? alloc_pid+0x23/0x290
Feb 14 12:00:02 test-pc kernel: [  118.351256]  ? flush_tlb_func_common.constprop.0+0x9a/0x220
Feb 14 12:00:02 test-pc kernel: [  118.351263]  ? cpumask_any_but+0x2b/0x40
Feb 14 12:00:02 test-pc kernel: [  118.351266]  __slab_alloc+0x20/0x40
Feb 14 12:00:02 test-pc kernel: [  118.351268]  kmem_cache_alloc+0x204/0x220
Feb 14 12:00:02 test-pc kernel: [  118.351270]  ? alloc_pid+0x23/0x290
Feb 14 12:00:02 test-pc kernel: [  118.351272]  alloc_pid+0x23/0x290
Feb 14 12:00:02 test-pc kernel: [  118.351275]  copy_process+0xf4e/0x1b90
Feb 14 12:00:02 test-pc kernel: [  118.351277]  _do_fork+0x89/0x360
Feb 14 12:00:02 test-pc kernel: [  118.351281]  ? get_unused_fd_flags+0x30/0x40
Feb 14 12:00:02 test-pc kernel: [  118.351283]  __x64_sys_clone+0x81/0xa0
Feb 14 12:00:02 test-pc kernel: [  118.351287]  do_syscall_64+0x5a/0x130
Feb 14 12:00:02 test-pc kernel: [  118.351292]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Feb 14 12:00:02 test-pc kernel: [  118.351294] RIP: 0033:0x7f9e2c1ccddf
Feb 14 12:00:02 test-pc kernel: [  118.351296] Code: ed 0f 85 04 01 00 00 64 4c 8b 0c 25 10 00 00 00 45 31 c0 4d 8d 91 d0 02 00 00 31 d2 31 f6 bf 11 00 20 01 b8 38 00 00 00 0f 05 <48> 3d 00 f0 ff ff 0f 87 95 00 00 00 41 89 c5 85 c0 0f 85 a2 00 00
Feb 14 12:00:02 test-pc kernel: [  118.351298] RSP: 002b:00007ffd29ddf220 EFLAGS: 00000246 ORIG_RAX: 0000000000000038
Feb 14 12:00:02 test-pc kernel: [  118.351300] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007f9e2c1ccddf
Feb 14 12:00:02 test-pc kernel: [  118.351301] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000001200011
Feb 14 12:00:02 test-pc kernel: [  118.351302] RBP: 0000000000000000 R08: 0000000000000000 R09: 00007f9e2c2d9580
Feb 14 12:00:02 test-pc kernel: [  118.351304] R10: 00007f9e2c2d9850 R11: 0000000000000246 R12: 0000000000000000
Feb 14 12:00:02 test-pc kernel: [  118.351305] R13: 0000564f82d33b00 R14: 0000000000000044 R15: 0000564f82d2aec2
Feb 14 12:00:02 test-pc kernel: [  118.351307] Modules linked in: hid_bigbenff ff_memless hid_generic usbhid hid kvm_intel bochs_drm drm_vram_helper ttm kvm drm_kms_helper irqbypass drm input_leds joydev fb_sys_fops syscopyarea sysfillrect serio_raw sysimgblt mac_hid qemu_fw_cfg sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables autofs4 psmouse e1000 i2c_piix4 pata_acpi floppy
Feb 14 12:00:02 test-pc kernel: [  118.351325] ---[ end trace 5918081d37bb574a ]---
Feb 14 12:00:02 test-pc kernel: [  118.351328] RIP: 0010:new_slab+0x2b1/0x4b0
Feb 14 12:00:02 test-pc kernel: [  118.351330] Code: 40 48 8b 55 a0 48 85 f6 0f 84 78 ff ff ff 48 89 df e8 03 d9 b6 00 41 8b 76 20 48 8b 55 a0 4c 01 e6 49 39 dc 0f 85 6c ff ff ff <0f> 0b fb 66 0f 1f 44 00 00 e9 9a fd ff ff 41 8b 46 08 a9 00 0d 21
Feb 14 12:00:02 test-pc kernel: [  118.351331] RSP: 0018:ffffbd5000c9bc00 EFLAGS: 00010246
Feb 14 12:00:02 test-pc kernel: [  118.351333] RAX: ffff92f5e41c3000 RBX: ffff92f5e41c3000 RCX: 0000000000000000
Feb 14 12:00:02 test-pc kernel: [  118.351334] RDX: 000000000000000e RSI: ffff92f5e41c3000 RDI: ffff92f672b09c40
Feb 14 12:00:02 test-pc kernel: [  118.351335] RBP: ffffbd5000c9bc60 R08: 0000000000000000 R09: 00000000000a02bc
Feb 14 12:00:02 test-pc kernel: [  118.351336] R10: 0000000000000002 R11: 0000000000000000 R12: ffff92f5e41c3000
Feb 14 12:00:02 test-pc kernel: [  118.351338] R13: 000000000000000a R14: ffff92f672b09c40 R15: fffff37cc29070c0
Feb 14 12:00:02 test-pc kernel: [  118.351339] FS:  00007f9e2c2d9580(0000) GS:ffff92f67ba00000(0000) knlGS:0000000000000000
Feb 14 12:00:02 test-pc kernel: [  118.351341] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Feb 14 12:00:02 test-pc kernel: [  118.351342] CR2: 0000564f82d324fa CR3: 00000000a4172000 CR4: 00000000000006f0
Feb 14 12:00:02 test-pc systemd[1]: Failed to start Message of the Day.
Feb 14 12:00:19 test-pc systemd[599]: Reached target GNOME Session is stable (running for >2 minutes).

--------------2462E7BC0BDD91F01AB9AEA7--
