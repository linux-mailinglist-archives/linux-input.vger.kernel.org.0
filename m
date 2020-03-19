Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98D5F18BDF9
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 18:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbgCSR1N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 13:27:13 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:47620 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbgCSR1N (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 13:27:13 -0400
Received: by mail-io1-f72.google.com with SMTP id w21so2356403iod.14
        for <linux-input@vger.kernel.org>; Thu, 19 Mar 2020 10:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=kZsDp4x4c6PvNfWtdDThiADDEhsyb7AvXm9IBnKdaVo=;
        b=HPdhpfPLUpRKEPFwG6JEEANUwl8/Pr2Xp8aRcrm67dPFgEa9L7eX9Ck7WPf59HPgsy
         Bsv5OsQEa8kecqs9iEqpnNUjHf+7O74QOzR+IsBMKNvce/Kk9Sv4CrkNgMUcAtS2TuoN
         9lCKDQIlpFPARKus+Szsnw0KsYjDMHJyWFAy1lWDsYPb1Q7Ufi8sLLhjJuqNd3Hy6dut
         yqEaIHgHk+858bcaG9Xu41XLP6wT6ffNAKY+y9GKR2saJuAekLx/khri8ha2qKqjtpT8
         vBjVTSkw1zab+vBrNo2HBLkblqow0bXxXEbXz5LsoOqdes1eqSdIwNM2FCgBiXtdaOQg
         1+dA==
X-Gm-Message-State: ANhLgQ27uOO3eX+MIubgl0HwPH5jcfpPAnYNIXtgUW4V1Hjn4AphJ55S
        8XM9x293Gc048C5TWrs6pnnxQrxUmh/e32xxwkkpxUqW88/y
X-Google-Smtp-Source: ADFU+vsR0izIiTdX6Py/Gn5z7ouRhf0Dz2jtP3lTPqEmsnzFGfZClCTFOyXDb/kLPBmwyJjAGbOi3tbJWcmoJ45YJCJs2VRlU3g+
MIME-Version: 1.0
X-Received: by 2002:a92:91d0:: with SMTP id e77mr4266826ill.225.1584638831308;
 Thu, 19 Mar 2020 10:27:11 -0700 (PDT)
Date:   Thu, 19 Mar 2020 10:27:11 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a3346f05a1387a04@google.com>
Subject: INFO: trying to register non-static key in prepare_to_wait_event
From:   syzbot <syzbot+08c9aea900cea24d398d@syzkaller.appspotmail.com>
To:     benjamin.tissoires@redhat.com, dh.herrmann@googlemail.com,
        jikos@kernel.org, jkorsnes@cisco.com, jkosina@suse.cz,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    5076190d mm: slub: be more careful about the double cmpxch..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=178ca61de00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9f894bd92023de02
dashboard link: https://syzkaller.appspot.com/bug?extid=08c9aea900cea24d398d
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=131fbfc3e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1186cbe3e00000

The bug was bisected to:

commit 84a4062632462c4320704fcdf8e99e89e94c0aba
Author: Johan Korsnes <jkorsnes@cisco.com>
Date:   Fri Jan 17 12:08:36 2020 +0000

    HID: core: increase HID report buffer size to 8KiB

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13aecbe3e00000
final crash:    https://syzkaller.appspot.com/x/report.txt?x=106ecbe3e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=17aecbe3e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+08c9aea900cea24d398d@syzkaller.appspotmail.com
Fixes: 84a406263246 ("HID: core: increase HID report buffer size to 8KiB")

INFO: trying to register non-static key.
the code is fine but needs lockdep annotation.
turning off the locking correctness validator.
CPU: 0 PID: 9392 Comm: syz-executor302 Not tainted 5.6.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x188/0x20d lib/dump_stack.c:118
 assign_lock_key kernel/locking/lockdep.c:880 [inline]
 register_lock_class+0x14c4/0x1540 kernel/locking/lockdep.c:1189
 __lock_acquire+0xfc/0x3ca0 kernel/locking/lockdep.c:3836
 lock_acquire+0x197/0x420 kernel/locking/lockdep.c:4484
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x8c/0xbf kernel/locking/spinlock.c:159
 prepare_to_wait_event+0x5b/0x650 kernel/sched/wait.c:280
 uhid_char_read+0x31b/0x6c0 drivers/hid/uhid.c:669
 do_loop_readv_writev fs/read_write.c:714 [inline]
 do_loop_readv_writev fs/read_write.c:701 [inline]
 do_iter_read+0x47f/0x650 fs/read_write.c:935
 vfs_readv+0xf0/0x160 fs/read_write.c:1053
 do_readv+0x279/0x2f0 fs/read_write.c:1090
 do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4458d9
Code: e8 bc b7 02 00 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 2b 12 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f0082936da8 EFLAGS: 00000246 ORIG_RAX: 0000000000000013
RAX: ffffffffffffffda RBX: 00000000006dac28 RCX: 00000000004458d9
RDX: 0000000000000002 RSI: 0000000020001680 RDI: 0000000000000003
RBP: 00000000006dac20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000006dac2c
R13: 0000000020000b40 R14: 00000000004adda8 R15: 20c49ba5e353f7cf
list_del corruption. prev->next should be ffffc90002197bc0, but was 0000000000000000
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:51!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 9392 Comm: syz-executor302 Not tainted 5.6.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__list_del_entry_valid.cold+0xf/0x55 lib/list_debug.c:51
Code: e8 44 93 c9 fd 0f 0b 48 89 f1 48 c7 c7 c0 e6 51 88 4c 89 e6 e8 30 93 c9 fd 0f 0b 48 89 ee 48 c7 c7 60 e8 51 88 e8 1f 93 c9 fd <0f> 0b 4c 89 ea 48 89 ee 48 c7 c7 a0 e7 51 88 e8 0b 93 c9 fd 0f 0b
RSP: 0018:ffffc90002197a60 EFLAGS: 00010082
RAX: 0000000000000054 RBX: ffffc90002197ba8 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff815c06c1 RDI: fffff52000432f3e
RBP: ffffc90002197bc0 R08: 0000000000000054 R09: ffffed1015cc45c9
R10: ffffed1015cc45c8 R11: ffff8880ae622e43 R12: ffff88808d4e11f8
R13: ffff88808d4e11f8 R14: 0000000000000286 R15: ffffc90002197bc0
FS:  00007f0082937700(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fc99cd1c000 CR3: 000000009f435000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __list_del_entry include/linux/list.h:132 [inline]
 list_del_init include/linux/list.h:204 [inline]
 prepare_to_wait_event+0x19c/0x650 kernel/sched/wait.c:294
 uhid_char_read+0x31b/0x6c0 drivers/hid/uhid.c:669
 do_loop_readv_writev fs/read_write.c:714 [inline]
 do_loop_readv_writev fs/read_write.c:701 [inline]
 do_iter_read+0x47f/0x650 fs/read_write.c:935
 vfs_readv+0xf0/0x160 fs/read_write.c:1053
 do_readv+0x279/0x2f0 fs/read_write.c:1090
 do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4458d9
Code: e8 bc b7 02 00 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 2b 12 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f0082936da8 EFLAGS: 00000246 ORIG_RAX: 0000000000000013
RAX: ffffffffffffffda RBX: 00000000006dac28 RCX: 00000000004458d9
RDX: 0000000000000002 RSI: 0000000020001680 RDI: 0000000000000003
RBP: 00000000006dac20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000006dac2c
R13: 0000000020000b40 R14: 00000000004adda8 R15: 20c49ba5e353f7cf
Modules linked in:
---[ end trace d2f12cae324b95c6 ]---
RIP: 0010:__list_del_entry_valid.cold+0xf/0x55 lib/list_debug.c:51
Code: e8 44 93 c9 fd 0f 0b 48 89 f1 48 c7 c7 c0 e6 51 88 4c 89 e6 e8 30 93 c9 fd 0f 0b 48 89 ee 48 c7 c7 60 e8 51 88 e8 1f 93 c9 fd <0f> 0b 4c 89 ea 48 89 ee 48 c7 c7 a0 e7 51 88 e8 0b 93 c9 fd 0f 0b
RSP: 0018:ffffc90002197a60 EFLAGS: 00010082
RAX: 0000000000000054 RBX: ffffc90002197ba8 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff815c06c1 RDI: fffff52000432f3e
RBP: ffffc90002197bc0 R08: 0000000000000054 R09: ffffed1015cc45c9
R10: ffffed1015cc45c8 R11: ffff8880ae622e43 R12: ffff88808d4e11f8
R13: ffff88808d4e11f8 R14: 0000000000000286 R15: ffffc90002197bc0
FS:  00007f0082937700(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fc99cd1c000 CR3: 000000009f435000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
