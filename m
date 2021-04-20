Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC79C365B7E
	for <lists+linux-input@lfdr.de>; Tue, 20 Apr 2021 16:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbhDTOwr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Apr 2021 10:52:47 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:47935 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232856AbhDTOwr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Apr 2021 10:52:47 -0400
Received: by mail-io1-f72.google.com with SMTP id f14-20020a056602038eb02903efc2bddb33so3599698iov.14
        for <linux-input@vger.kernel.org>; Tue, 20 Apr 2021 07:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=QhCHHHO6esEyxdvbhPlAkd4NZMZ3k4BD9aLA5JVL9JE=;
        b=AuJOYTh/xhlBDgFW/0lOOppwGSKd61yjVjcoRd5rxlb7BawkwPM5I0gO2OBm8SPfvy
         40V5FVdIyFNejz1TXSigGFnlGjkfyHrqaFlp6XfiluoqLJ/T59SX3DMSepu2CBTHGC4a
         8gdusMft7Vy1vXdc+TEiQo4LA0QAOrIRGy6Id+PAV2OInPt9rf1ttx8LPG7nPV74Gk5G
         nOf9VFnlw3HuDL4FRP4t7EZP1USMEtMHWIgpPyEOCmkl5mgTaeVTQutsP7xhbsdQqs0v
         NqnfMWScguzPy9N1t3VTiA4ZQBH7xIHBsNfP48CwFshPOsUo7Ju06tIlQTzD8M1vw5YP
         c4dg==
X-Gm-Message-State: AOAM530xq1TLxfMCuwMJpkzOUQ+jMHMR/SIq1U90/0tnVzSELGKtcm26
        WV7q6ClXH8boMSIadsRa4BM07q0uzKiX/uDKDaX6NNbDsKee
X-Google-Smtp-Source: ABdhPJxs+6ziCOg7dflQScDlVwIb8+Exv/+1ZhJlc1sae+ZE7hC3RYj4Hf0sCKlqZrYP90RpyAtjBsj3/2qLQLx05jHfsQIj5rin
MIME-Version: 1.0
X-Received: by 2002:a02:cac9:: with SMTP id f9mr21466694jap.85.1618930335491;
 Tue, 20 Apr 2021 07:52:15 -0700 (PDT)
Date:   Tue, 20 Apr 2021 07:52:15 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000090295d05c068970e@google.com>
Subject: [syzbot] WARNING in atp_close (2)
From:   syzbot <syzbot+e03dc56b8ee7ec4b4dfd@syzkaller.appspotmail.com>
To:     dmitry.torokhov@gmail.com, gustavoars@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    1216f02e Add linux-next specific files for 20210415
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=137dbb9ad00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3491b04113499f81
dashboard link: https://syzkaller.appspot.com/bug?extid=e03dc56b8ee7ec4b4dfd

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e03dc56b8ee7ec4b4dfd@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 18911 at kernel/workqueue.c:3043 __flush_work+0x8f4/0xad0 kernel/workqueue.c:3043
Modules linked in:
CPU: 1 PID: 18911 Comm: syz-executor.2 Not tainted 5.12.0-rc7-next-20210415-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__flush_work+0x8f4/0xad0 kernel/workqueue.c:3043
Code: e3 08 48 0f ba 28 03 48 8b 95 70 fe ff ff 81 cb e0 01 00 00 e9 7e fa ff ff e8 68 4e 29 00 0f 0b e9 2e fc ff ff e8 5c 4e 29 00 <0f> 0b 45 31 f6 e9 1f fc ff ff e8 0d 0b 6e 00 e9 07 fb ff ff e8 43
RSP: 0018:ffffc90001a7fb48 EFLAGS: 00010212
RAX: 000000000000f9f3 RBX: dffffc0000000000 RCX: ffffc9000daae000
RDX: 0000000000040000 RSI: ffffffff814b29e4 RDI: 0000000000000003
RBP: ffffc90001a7fcd8 R08: 0000000000000000 R09: 0000000000000001
R10: ffffffff814b2196 R11: 0000000000000000 R12: 0000000000000001
R13: 1ffff9200034ff9e R14: 0000000000000001 R15: ffff88801d9d1c80
FS:  00007f53abfa1700(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000002f16708 CR3: 000000001e366000 CR4: 00000000001526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __cancel_work_timer+0x3f9/0x570 kernel/workqueue.c:3139
 atp_close+0x5e/0xa0 drivers/input/mouse/appletouch.c:812
 input_close_device+0x156/0x1f0 drivers/input/input.c:687
 evdev_close_device drivers/input/evdev.c:414 [inline]
 evdev_release+0x34c/0x410 drivers/input/evdev.c:456
 __fput+0x288/0x920 fs/file_table.c:280
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164
 tracehook_notify_resume include/linux/tracehook.h:189 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:174 [inline]
 exit_to_user_mode_prepare+0x272/0x280 kernel/entry/common.c:208
 __syscall_exit_to_user_mode_work kernel/entry/common.c:290 [inline]
 syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:301
 do_syscall_64+0x47/0xb0 arch/x86/entry/common.c:57
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x419544
Code: 84 00 00 00 00 00 44 89 54 24 0c e8 96 f9 ff ff 44 8b 54 24 0c 44 89 e2 48 89 ee 41 89 c0 bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0 ff ff 77 34 44 89 c7 89 44 24 0c e8 c8 f9 ff ff 8b 44
RSP: 002b:00007f53abfa0cc0 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffea RBX: 6666666666666667 RCX: 0000000000419544
RDX: 0000000000024200 RSI: 00007f53abfa0d60 RDI: 00000000ffffff9c
RBP: 00007f53abfa0d60 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000024200
R13: 00007ffdda3a06af R14: 00007f53abfa1300 R15: 0000000000022000


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
