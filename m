Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB1A2DC904
	for <lists+linux-input@lfdr.de>; Wed, 16 Dec 2020 23:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730031AbgLPWev (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Dec 2020 17:34:51 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:33385 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727211AbgLPWev (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Dec 2020 17:34:51 -0500
Received: by mail-io1-f69.google.com with SMTP id t23so25503333ioh.0
        for <linux-input@vger.kernel.org>; Wed, 16 Dec 2020 14:34:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=IZfEY1LeHQQfcMHwLHOg0yRfOEN2IrB4yJqAjN62emU=;
        b=jkNp17utvVauOIfUgmu/4sT9J2qlSuFMW3uc1XoCCoArcXcNPjI+6OfauuQ6l5L93t
         pQn8TgqWAM9lSO9o8dQvUCC73uVMpQ2zFtuG/q+ErVzIJUMSmav04s1KB3qzHcq+23YQ
         bJneGMaiAuUwDYQrMAZbnl55cG/9Hrcor9ESitiX/x8DldqImSSeHW/f/MOLEXiwAG1H
         6phlH6L1T3hOSanUW+TVpu76gza4xooMyPM3t6fb9w1MHgY24QHpeQ7rJe9awvFao/CV
         1+3kK+HD3zKZTZqk3t9pcL5MC0+W9VLarNdau2V3hZjJiq63d3rky8AeHaMEkqV+ebHB
         qWsA==
X-Gm-Message-State: AOAM533rZg2/d+66+5muyS+22LGLOcaeEjCnFAYJOG7Q+rsj5woZcgXG
        q6JhyOt6RaPFpfyefBMiFZhFziClu6LoE+RKgAioRkbI25dS
X-Google-Smtp-Source: ABdhPJwUmrQP7lhoWaZ7/MLh8CSKguix8UpL4a61Gh7Y3Xg41+f69GZrrY2tk+90HiT/1aCIvcnPOrppn5mhQSFUyUulFut50E5w
MIME-Version: 1.0
X-Received: by 2002:a5e:8e07:: with SMTP id a7mr43788802ion.129.1608158050380;
 Wed, 16 Dec 2020 14:34:10 -0800 (PST)
Date:   Wed, 16 Dec 2020 14:34:10 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000055f53805b69c7939@google.com>
Subject: WARNING in atp_close
From:   syzbot <syzbot+e3f15f0b58a330ddfc30@syzkaller.appspotmail.com>
To:     dmitry.torokhov@gmail.com, gustavoars@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    7b1b868e Merge tag 'for-linus' of git://git.kernel.org/pub..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17b34b37500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5ed9af1b47477866
dashboard link: https://syzkaller.appspot.com/bug?extid=e3f15f0b58a330ddfc30
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e3f15f0b58a330ddfc30@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 11091 at kernel/workqueue.c:3040 __flush_work+0x91a/0xac0 kernel/workqueue.c:3040
Modules linked in:
CPU: 1 PID: 11091 Comm: syz-executor.1 Not tainted 5.10.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__flush_work+0x91a/0xac0 kernel/workqueue.c:3040
Code: e3 08 48 0f ba 28 03 48 8b 95 70 fe ff ff 81 cb e0 01 00 00 e9 50 fa ff ff e8 f2 03 28 00 0f 0b e9 19 fc ff ff e8 e6 03 28 00 <0f> 0b 45 31 f6 e9 0a fc ff ff e8 d7 03 28 00 e8 62 8d 14 00 31 ff
RSP: 0018:ffffc900063efb58 EFLAGS: 00010293
RAX: 0000000000000000 RBX: dffffc0000000000 RCX: ffffffff8147f9a6
RDX: ffff888075a2a380 RSI: ffffffff8148021a RDI: 0000000000000001
RBP: ffffc900063efce8 R08: 0000000000000001 R09: ffffffff8ebb96a7
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
R13: 1ffff92000c7dfa0 R14: 0000000000000001 R15: ffff888075a2a380
FS:  0000000003523940(0000) GS:ffff8880b9f00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5537bf2934 CR3: 0000000015468000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __cancel_work_timer+0x3b3/0x520 kernel/workqueue.c:3136
 atp_close+0x5e/0xa0 drivers/input/mouse/appletouch.c:812
 input_close_device+0x110/0x1a0 drivers/input/input.c:683
 evdev_close_device drivers/input/evdev.c:414 [inline]
 evdev_release+0x34c/0x410 drivers/input/evdev.c:456
 __fput+0x285/0x920 fs/file_table.c:281
 task_work_run+0xdd/0x190 kernel/task_work.c:151
 tracehook_notify_resume include/linux/tracehook.h:188 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:164 [inline]
 exit_to_user_mode_prepare+0x17e/0x1a0 kernel/entry/common.c:191
 syscall_exit_to_user_mode+0x38/0x260 kernel/entry/common.c:266
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x417ab1
Code: 75 14 b8 03 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 a4 1a 00 00 c3 48 83 ec 08 e8 0a fc ff ff 48 89 04 24 b8 03 00 00 00 0f 05 <48> 8b 3c 24 48 89 c2 e8 53 fc ff ff 48 89 d0 48 83 c4 08 48 3d 01
RSP: 002b:00007ffe30172430 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000005 RCX: 0000000000417ab1
RDX: 0000000000000000 RSI: ffffffff88e8c21e RDI: 0000000000000004
RBP: 0000000000000001 R08: ffffffff8130c47a R09: 00000000648e67d9
R10: 00007ffe30172510 R11: 0000000000000293 R12: ffffffffffffffff
R13: 000000000004decc R14: 00000000000003e8 R15: 000000000119bf8c


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
