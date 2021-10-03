Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B41D41FED6
	for <lists+linux-input@lfdr.de>; Sun,  3 Oct 2021 02:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234216AbhJCACL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Oct 2021 20:02:11 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:37562 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234115AbhJCACL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 Oct 2021 20:02:11 -0400
Received: by mail-io1-f69.google.com with SMTP id e68-20020a6bb547000000b005d06de54ab7so12497580iof.4
        for <linux-input@vger.kernel.org>; Sat, 02 Oct 2021 17:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=sPeIva6CL4KxHHY2Q9g7Nyxavqi4qBd+jB20UI/S2c4=;
        b=wThp3PJepec3GBLZGJ+0fVsImwwrebi8j5ezBK4c5Iril5gcCt7m9hmcbAoyXUBHcF
         /yqOfZFo21bIdFVLBLJxv43/JC2/1eMONRJcr3euLSiuXps/KbpRfgCJa2kPN8B0Qeit
         1nfnGXEd0vSEbZuzJ/Va2NhUPwCVsVxevHpRZbZegWIBtxlsfyNzIU0pqcxnFwBiJ5j8
         xHbNnicKxZVD+aOABLWlbrKuQ+7YktQAcHtK3ecaZHrU2A3+z7URprdY23QhxU+JyBcd
         af3wBcpFCvJXHy225MHtsAlDiiqvBNs9q+7XlSYmY8d5DpIZna18qtyl0Ace1kwRuUSd
         pFqQ==
X-Gm-Message-State: AOAM5334xOfvm0OrhZvXlGyU+pqFfIE4pcVooC/NKVFAuW6FjxHyh5Yc
        5yZ5IA3/Pt7f9iwUp020MevzjSquVBgavJjRx7oJjKdBuwv9
X-Google-Smtp-Source: ABdhPJxvfwCLzVRPax7yt+SgISALSJepNIKSfexzTyocoJXjMAU86DM5w5fjC6wPN2yTzb2uavDKrFJJUKNDsK/0UnWs615TFQQx
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1929:: with SMTP id p41mr4644047jal.21.1633219224944;
 Sat, 02 Oct 2021 17:00:24 -0700 (PDT)
Date:   Sat, 02 Oct 2021 17:00:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000be49b905cd677b9a@google.com>
Subject: [syzbot] WARNING in atp_close (3)
From:   syzbot <syzbot+b88c5eae27386b252bbd@syzkaller.appspotmail.com>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    bf5b1e621a51 Add linux-next specific files for 20210927
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=11cc5bd3300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4b58fe22c337ee4a
dashboard link: https://syzkaller.appspot.com/bug?extid=b88c5eae27386b252bbd
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b88c5eae27386b252bbd@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 11843 at kernel/workqueue.c:3074 __flush_work+0x928/0xb10 kernel/workqueue.c:3074
Modules linked in:
CPU: 1 PID: 11843 Comm: syz-executor.3 Not tainted 5.15.0-rc3-next-20210927-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__flush_work+0x928/0xb10 kernel/workqueue.c:3074
Code: ff 41 89 c4 89 8d 88 fe ff ff e8 a3 67 70 00 48 0f ba 2b 03 e9 6a fa ff ff e8 e4 1e 2a 00 0f 0b e9 5a fc ff ff e8 d8 1e 2a 00 <0f> 0b 45 31 f6 e9 4b fc ff ff e8 f9 63 70 00 e9 3a fb ff ff e8 bf
RSP: 0018:ffffc90005887b38 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff88801a7a9290 RCX: 0000000000000000
RDX: ffff88801f37d700 RSI: ffffffff814c22c8 RDI: 0000000000000003
RBP: ffffc90005887cd0 R08: 0000000000000000 R09: 0000000000000001
R10: ffffffff814c1a45 R11: 0000000000000000 R12: dffffc0000000000
R13: 1ffff92000b10f9d R14: 0000000000000001 R15: ffff88801a7a92a8
FS:  0000555555bf1400(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007eff33b21000 CR3: 000000001a6b9000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __cancel_work_timer+0x3f9/0x570 kernel/workqueue.c:3170
 atp_close+0x5e/0xa0 drivers/input/mouse/appletouch.c:812
 input_close_device+0x156/0x1f0 drivers/input/input.c:687
 evdev_close_device drivers/input/evdev.c:414 [inline]
 evdev_release+0x34c/0x410 drivers/input/evdev.c:456
 __fput+0x288/0x9f0 fs/file_table.c:280
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164
 tracehook_notify_resume include/linux/tracehook.h:189 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:175 [inline]
 exit_to_user_mode_prepare+0x27e/0x290 kernel/entry/common.c:207
 __syscall_exit_to_user_mode_work kernel/entry/common.c:289 [inline]
 syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:300
 do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7eff339d351b
Code: 0f 05 48 3d 00 f0 ff ff 77 45 c3 0f 1f 40 00 48 83 ec 18 89 7c 24 0c e8 63 fc ff ff 8b 7c 24 0c 41 89 c0 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 35 44 89 c7 89 44 24 0c e8 a1 fc ff ff 8b 44
RSP: 002b:00007ffc6d17d160 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000005 RCX: 00007eff339d351b
RDX: 00007eff33b291e0 RSI: ffffffff89327541 RDI: 0000000000000004
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000001b2d422e74
R10: 0000000000001f81 R11: 0000000000000293 R12: 0000000000043109
R13: 00000000000003e8 R14: 00007eff33b24f60 R15: 0000000000042b7f
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
