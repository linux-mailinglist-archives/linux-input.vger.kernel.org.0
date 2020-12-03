Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABCA82CCE21
	for <lists+linux-input@lfdr.de>; Thu,  3 Dec 2020 05:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgLCE55 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Dec 2020 23:57:57 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:56742 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbgLCE55 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Dec 2020 23:57:57 -0500
Received: by mail-il1-f199.google.com with SMTP id r20so684159ilh.23
        for <linux-input@vger.kernel.org>; Wed, 02 Dec 2020 20:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=SAx9PhfeVrYqyaYNcf2KDgEtd7YkNHPWgeaoXP3xg7g=;
        b=BjgmaoVE3PdnGeOZ2V8qXNohJcmvk3NdVkTlHN53zdLOZhQQMJbpqp1f0Rx80o5QWP
         fEtTURA05I4fI5Na0Fb0H+p9gNhwPI06TnhfKAppg0yrxUdb/1uDD6bQc2N6Cw90BijJ
         Ahv1+vhmtLsfI4Huzf3Luc2NdXjFwwSk0oFBAr7/BwDHBMe2Rrmax7DmkiXdtvoBZy0U
         1jfj+yZZxGUJoW2+2/uGpajvoQZ3d5DVgw1pgv4AXDicjWHemRd948dszYC30+XLtujd
         UlFROMuwm0IphecAp1sUAes02/AO/tvncj50KqF8akQ6Y0smiip7LXrnVclo/VwSG4CZ
         sYIA==
X-Gm-Message-State: AOAM533RFbzjGNX2OhXL68HGKvtfDMzYCiSGXzPqqVi/75F9YWQcVjaa
        lDQMvXzhBIOAKgaj5C716+aS/WDCt/rmypeQlXtLvPD27gjF
X-Google-Smtp-Source: ABdhPJwP4pRRB626bjZtdMxRJmKWOuEe9/Q2JoyrOyxIhtBtvjYvgylyyfZSm3G8atEnSmGruJ/XF/OgM0A51uNne7HIIwvYXuUy
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:c2a:: with SMTP id q10mr1535959ilg.92.1606971436309;
 Wed, 02 Dec 2020 20:57:16 -0800 (PST)
Date:   Wed, 02 Dec 2020 20:57:16 -0800
In-Reply-To: <000000000000f6530105b48b2816@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a023c905b588314b@google.com>
Subject: Re: WARNING in cm109_input_ev/usb_submit_urb
From:   syzbot <syzbot+150f793ac5bc18eee150@syzkaller.appspotmail.com>
To:     dmitry.torokhov@gmail.com, eli.billauer@gmail.com,
        gregkh@linuxfoundation.org, gustavoars@kernel.org,
        ingrassia@epigenesys.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com,
        vulab@iscas.ac.cn
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

syzbot has found a reproducer for the following issue on:

HEAD commit:    3bb61aa6 Merge tag 'arm64-fixes' of git://git.kernel.org/p..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10837e9d500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c3904d1cc0af152
dashboard link: https://syzkaller.appspot.com/bug?extid=150f793ac5bc18eee150
compiler:       clang version 11.0.0 (https://github.com/llvm/llvm-project.git ca2dcbd030eadbf0aa9b660efe864ff08af6e18b)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12b9c19d500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14c422e3500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+150f793ac5bc18eee150@syzkaller.appspotmail.com

------------[ cut here ]------------
URB 00000000fa7e6a0b submitted while active
WARNING: CPU: 0 PID: 8462 at drivers/usb/core/urb.c:378 usb_submit_urb+0xf57/0x1510 drivers/usb/core/urb.c:378
Modules linked in:
CPU: 0 PID: 8462 Comm: syz-executor064 Not tainted 5.10.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:usb_submit_urb+0xf57/0x1510 drivers/usb/core/urb.c:378
Code: 5c 41 5d 41 5e 41 5f 5d e9 76 5b ff ff e8 c1 e9 04 fc c6 05 45 10 8b 07 01 48 c7 c7 a0 b6 5b 8a 4c 89 e6 31 c0 e8 69 08 d5 fb <0f> 0b e9 20 f1 ff ff e8 9d e9 04 fc eb 05 e8 96 e9 04 fc bb a6 ff
RSP: 0018:ffffc90000ecf6d8 EFLAGS: 00010046
RAX: ed1497fd940bbe00 RBX: ffff8880113d2108 RCX: ffff88801b269a40
RDX: 0000000000000000 RSI: 0000000080000002 RDI: 0000000000000000
RBP: 0000000000000a20 R08: ffffffff815d29e2 R09: ffffed1017383ffc
R10: ffffed1017383ffc R11: 0000000000000000 R12: ffff8880113d2100
R13: dffffc0000000000 R14: dffffc0000000000 R15: ffff88801d001850
FS:  00000000013ac880(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000558946f0cf78 CR3: 0000000011c70000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 cm109_submit_buzz_toggle drivers/input/misc/cm109.c:351 [inline]
 cm109_toggle_buzzer_async drivers/input/misc/cm109.c:487 [inline]
 cm109_input_ev+0x1dc/0x3a0 drivers/input/misc/cm109.c:621
 input_handle_event+0x895/0x1510 drivers/input/input.c:376
 input_inject_event+0x1e8/0x280 drivers/input/input.c:471
 kd_sound_helper+0xfc/0x200 drivers/tty/vt/keyboard.c:242
 input_handler_for_each_handle+0xc8/0x160 drivers/input/input.c:2356
 kd_mksound+0x6c/0x140 drivers/tty/vt/keyboard.c:266
 do_con_trol drivers/tty/vt/vt.c:2152 [inline]
 do_con_write+0x3325/0xdee0 drivers/tty/vt/vt.c:2911
 con_write+0x20/0x40 drivers/tty/vt/vt.c:3255
 process_output_block drivers/tty/n_tty.c:595 [inline]
 n_tty_write+0xcc2/0x1160 drivers/tty/n_tty.c:2333
 do_tty_write drivers/tty/tty_io.c:962 [inline]
 tty_write+0x585/0x8f0 drivers/tty/tty_io.c:1046
 vfs_write+0x220/0xab0 fs/read_write.c:603
 ksys_write+0x11b/0x220 fs/read_write.c:658
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x444839
Code: e8 bc af 02 00 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 9b d7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffeb806aaf8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00000000004002e0 RCX: 0000000000444839
RDX: 0000000000001006 RSI: 00000000200002c0 RDI: 0000000000000005
RBP: 00000000006d0018 R08: 00000000004002e0 R09: 00000000004002e0
R10: 000000000000000d R11: 0000000000000246 R12: 0000000000402460
R13: 00000000004024f0 R14: 0000000000000000 R15: 0000000000000000

