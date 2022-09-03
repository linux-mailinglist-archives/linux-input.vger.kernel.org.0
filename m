Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86A4F5ABF98
	for <lists+linux-input@lfdr.de>; Sat,  3 Sep 2022 17:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbiICPug (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Sep 2022 11:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbiICPuf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 3 Sep 2022 11:50:35 -0400
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92CB1402E0
        for <linux-input@vger.kernel.org>; Sat,  3 Sep 2022 08:50:33 -0700 (PDT)
Received: by mail-io1-f71.google.com with SMTP id b16-20020a5d8950000000b006891a850acfso2988306iot.19
        for <linux-input@vger.kernel.org>; Sat, 03 Sep 2022 08:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=QRWZx115jC9b2IWRR+KZq73xy3bth/1R815LEXecid0=;
        b=trBwGRUsb2KODCkn1SCpHvw0UyQeJy2RUacagcC0JBE7UmFibNBklho20/zftlS2qh
         2gjHmMZqRjmqRlqq+/PLtP+cwuaANeFCJDvg+lKZHDNu1O7gUsrpOut2Z9jzxba1x+0Y
         uggxsee3MRcammXZ8KopvcYYvjj1BLdVDGN0A3OB03G3HPUpBXByi4hcq+fv+V4Vu/B1
         XcR/xTnhjNTRNrkf33NEbDMPK3TPNyZGIxPcUYI2wBQv1m1cZkt+7wCm+EpHGvQX/wqY
         gzdTiooqiuszG2wRE/7GQhmVylfv/3eVXSweqiZKcjLnEzHt3alejqPYSWSdeYAXf//Q
         8zdA==
X-Gm-Message-State: ACgBeo3eFQWHjqVpXuE88d0q/9iXEqti56hyxgTtX7KSV4HhycLvjyW1
        VVfYDhxwn/3/rlHiWrbFu8H46M8tpsFjWNm2Q/WAglxHSO9r
X-Google-Smtp-Source: AA6agR6XbPbVH7nCBTn+QW7cGHCcs++RQETohtNpdupFgaCvIIgl25b2sRf34OUS25O5WXT0+g/pATQyrlJpeq7kSpQEEVY2T0o8
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2186:b0:349:c510:6201 with SMTP id
 s6-20020a056638218600b00349c5106201mr21782986jaj.43.1662220232971; Sat, 03
 Sep 2022 08:50:32 -0700 (PDT)
Date:   Sat, 03 Sep 2022 08:50:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000865c0305e7c7ceca@google.com>
Subject: [syzbot] UBSAN: shift-out-of-bounds in snto32 (2)
From:   syzbot <syzbot+fd5aff28563665022354@syzkaller.appspotmail.com>
To:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    42e66b1cc3a0 Merge tag 'net-6.0-rc4' of git://git.kernel.o..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=152c8193080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=892a57667b7af6cf
dashboard link: https://syzkaller.appspot.com/bug?extid=fd5aff28563665022354
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14fc7cb3080000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14317dfb080000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a81bd8175bdf/disk-42e66b1c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/14bd34a48421/vmlinux-42e66b1c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fd5aff28563665022354@syzkaller.appspotmail.com

microsoft 0003:045E:07DA.0001: hid_field_extract() called with n (128) > 32! (swapper/1)
================================================================================
UBSAN: shift-out-of-bounds in drivers/hid/hid-core.c:1323:20
shift exponent 127 is too large for 32-bit type 'int'
CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.0.0-rc3-syzkaller-00107-g42e66b1cc3a0 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/22/2022
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 ubsan_epilogue+0xb/0x50 lib/ubsan.c:151
 __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x187 lib/ubsan.c:322
 snto32 drivers/hid/hid-core.c:1323 [inline]
 snto32.cold+0x19/0x48 drivers/hid/hid-core.c:1313
 hid_input_fetch_field drivers/hid/hid-core.c:1572 [inline]
 hid_process_report drivers/hid/hid-core.c:1665 [inline]
 hid_report_raw_event+0x88b/0x1280 drivers/hid/hid-core.c:1998
 hid_input_report+0x360/0x4c0 drivers/hid/hid-core.c:2065
 hid_irq_in+0x50e/0x690 drivers/hid/usbhid/hid-core.c:284
 __usb_hcd_giveback_urb+0x2b0/0x5c0 drivers/usb/core/hcd.c:1671
 usb_hcd_giveback_urb+0x380/0x430 drivers/usb/core/hcd.c:1754
 dummy_timer+0x11ff/0x32c0 drivers/usb/gadget/udc/dummy_hcd.c:1988
 call_timer_fn+0x1a0/0x6b0 kernel/time/timer.c:1474
 expire_timers kernel/time/timer.c:1519 [inline]
 __run_timers.part.0+0x674/0xa80 kernel/time/timer.c:1790
 __run_timers kernel/time/timer.c:1768 [inline]
 run_timer_softirq+0xb3/0x1d0 kernel/time/timer.c:1803
 __do_softirq+0x1d3/0x9c6 kernel/softirq.c:571
 invoke_softirq kernel/softirq.c:445 [inline]
 __irq_exit_rcu+0x123/0x180 kernel/softirq.c:650
 irq_exit_rcu+0x5/0x20 kernel/softirq.c:662
 sysvec_apic_timer_interrupt+0x93/0xc0 arch/x86/kernel/apic/apic.c:1106
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x16/0x20 arch/x86/include/asm/idtentry.h:649
RIP: 0010:native_save_fl arch/x86/include/asm/irqflags.h:29 [inline]
RIP: 0010:arch_local_save_flags arch/x86/include/asm/irqflags.h:70 [inline]
RIP: 0010:arch_irqs_disabled arch/x86/include/asm/irqflags.h:130 [inline]
RIP: 0010:acpi_safe_halt+0x6f/0xb0 drivers/acpi/processor_idle.c:113
Code: f7 84 db 74 06 5b e9 d0 7d f9 f7 e8 cb 7d f9 f7 e8 f6 f4 ff f7 eb 0c e8 bf 7d f9 f7 0f 00 2d 68 33 d2 00 e8 b3 7d f9 f7 fb f4 <9c> 5b 81 e3 00 02 00 00 fa 31 ff 48 89 de e8 7e 7a f9 f7 48 85 db
RSP: 0018:ffffc90000177d20 EFLAGS: 00000293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffff888011a89d80 RSI: ffffffff89828c7d RDI: 0000000000000000
RBP: ffff888017821064 R08: 0000000000000001 R09: 0000000000000001
R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000001
R13: 0000000000000001 R14: ffff888017821000 R15: ffff8881462ec804
 acpi_idle_do_entry drivers/acpi/processor_idle.c:555 [inline]
 acpi_idle_enter+0x524/0x6a0 drivers/acpi/processor_idle.c:692
 cpuidle_enter_state+0x1ab/0xd30 drivers/cpuidle/cpuidle.c:239
 cpuidle_enter+0x4a/0xa0 drivers/cpuidle/cpuidle.c:356
 call_cpuidle kernel/sched/idle.c:155 [inline]
 cpuidle_idle_call kernel/sched/idle.c:236 [inline]
 do_idle+0x3e8/0x590 kernel/sched/idle.c:303
 cpu_startup_entry+0x14/0x20 kernel/sched/idle.c:400
 start_secondary+0x21d/0x2b0 arch/x86/kernel/smpboot.c:262
 secondary_startup_64_no_verify+0xce/0xdb
 </TASK>
================================================================================
----------------
Code disassembly (best guess):
   0:	f7 84 db 74 06 5b e9 	testl  $0xf7f97dd0,-0x16a4f98c(%rbx,%rbx,8)
   7:	d0 7d f9 f7
   b:	e8 cb 7d f9 f7       	callq  0xf7f97ddb
  10:	e8 f6 f4 ff f7       	callq  0xf7fff50b
  15:	eb 0c                	jmp    0x23
  17:	e8 bf 7d f9 f7       	callq  0xf7f97ddb
  1c:	0f 00 2d 68 33 d2 00 	verw   0xd23368(%rip)        # 0xd2338b
  23:	e8 b3 7d f9 f7       	callq  0xf7f97ddb
  28:	fb                   	sti
  29:	f4                   	hlt
* 2a:	9c                   	pushfq <-- trapping instruction
  2b:	5b                   	pop    %rbx
  2c:	81 e3 00 02 00 00    	and    $0x200,%ebx
  32:	fa                   	cli
  33:	31 ff                	xor    %edi,%edi
  35:	48 89 de             	mov    %rbx,%rsi
  38:	e8 7e 7a f9 f7       	callq  0xf7f97abb
  3d:	48 85 db             	test   %rbx,%rbx


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
