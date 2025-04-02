Return-Path: <linux-input+bounces-11469-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D00BA78568
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 02:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9008C188AF23
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 00:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2CE2BAF7;
	Wed,  2 Apr 2025 00:01:22 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8998929CE1
	for <linux-input@vger.kernel.org>; Wed,  2 Apr 2025 00:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743552082; cv=none; b=Bbdg79pUJfIuacKhDzBml1xs2ngsO5a2FUsUK0larijzsFyfHLZOzjZ+oeCN5tUiuBLzL8wUq6eS7uxGzmNt79VCg2Bey/ReqcYpc+tVQQ1xkl1tOkQwKMeVIyvlAxaJsE9ODkEaTaNFJzyWwVDypI/zTeB+Sq99vSlGPYt0yRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743552082; c=relaxed/simple;
	bh=TrdRJorLaPVxecxKt48+QFSNFxmprXB5Q212nUNhtk4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=trb/mRF83ytSDdklMxnsWAixXvl6Sj/jNFoIbHZQ5tvkKPQVYoYugdPzyExFZR2Tpw5d0BRJHtjeJbpFL5fwY16fGOqf95+XzvlcMh4WiWk45EXyec34uBYiMKQArZS+NcttVsKWQmnmpXEe3eYXUzPa2yD6DM9kUkbnkDit7o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d458e61faaso4502645ab.0
        for <linux-input@vger.kernel.org>; Tue, 01 Apr 2025 17:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743552079; x=1744156879;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K2uuoYBPvrcOMUlPvf+U/n5iBioNWEJiVRzUmg2n4Ow=;
        b=wKKocQ9kXvKstVpnBXJZkQWU/xjw+OGjO4G5/P5btIF8fNEWZbuPHOU+BtuidO/7gg
         hf2l8vxBw/4ezZm+ZAthq7T5lnaFxbdpOmbjbuthGYvW1eX81kd0nHXZs1trK7M/Fqzg
         J0nDquZQI+T+U+Z1mvAGzkigUuEywXzuMApC+uhfnsyGKZsE1ohvdvROV9yVuQt0Zp8m
         MK1n8cKPdys1/ctjpfMR8G71M0NKyHgq8xCFXN5DzxphHylpMkAo7zL6BNGu8Ppl345x
         iMB0NDuA6/EV1vizBA/9LMz7HIoDKo2dv7/Nsa7oIEiV0vlxgyS7eclGHmzo87z/7wc8
         9mHw==
X-Forwarded-Encrypted: i=1; AJvYcCWX+7Vvacj/sLXv9Dk5fl+xZC8FoeT7SWeSPMDsfBFlNcangugRxA6+MoXbgl8OHsHZ8m2ajXIs//0Nog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz95MSnNtXnunlS1i95/o9RAEb871oE8SXwJ6MnUoO4CLygKmmm
	Riw9EREiZL+oVo7qkeTexvDT77SBXMgKi9D3+hWnNj437dAKLXpvHnCqtG0AoJP5BKCjQ97iMgx
	xDFRWTK5afbQy123G96EycD5ewqlpDMLb45ldOyViCdXOJBPxGQEM1eU=
X-Google-Smtp-Source: AGHT+IF5KvcqrhDjrqpuCPXMno5jZm/9WvRYSmaawrQ08I4SQxkVTeOjOXwspRamha00hCbcddlVRtDu+OZ7qkZTe0+cBmnMrh2k
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca0d:0:b0:3d3:f72c:8fd8 with SMTP id
 e9e14a558f8ab-3d6d6849f4dmr159265ab.6.1743552079653; Tue, 01 Apr 2025
 17:01:19 -0700 (PDT)
Date: Tue, 01 Apr 2025 17:01:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ec7e4f.050a0220.31979b.0033.GAE@google.com>
Subject: [syzbot] [input?] KCSAN: data-race in uhid_char_poll / uhid_char_read
From: syzbot <syzbot+2775104a59cc23ddff54@syzkaller.appspotmail.com>
To: bentiss@kernel.org, david@readahead.eu, jikos@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    1e7857b28020 x86: don't re-generate cpufeaturemasks.h so e..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15867bcf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bdb65086dcaf0454
dashboard link: https://syzkaller.appspot.com/bug?extid=2775104a59cc23ddff54
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/08333bdf2b6c/disk-1e7857b2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c798f117761a/vmlinux-1e7857b2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a2171375da2b/bzImage-1e7857b2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2775104a59cc23ddff54@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in uhid_char_poll / uhid_char_read

read-write to 0xffff88811229d17d of 1 bytes by task 6915 on cpu 1:
 uhid_char_read+0x373/0x3f0 drivers/hid/uhid.c:711
 do_loop_readv_writev fs/read_write.c:845 [inline]
 vfs_readv+0x3e5/0x660 fs/read_write.c:1018
 do_readv+0xf7/0x230 fs/read_write.c:1078
 __do_sys_readv fs/read_write.c:1163 [inline]
 __se_sys_readv fs/read_write.c:1160 [inline]
 __x64_sys_readv+0x45/0x50 fs/read_write.c:1160
 x64_sys_call+0x2833/0x2e10 arch/x86/include/generated/asm/syscalls_64.h:20
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xc9/0x1c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read to 0xffff88811229d17d of 1 bytes by task 6921 on cpu 0:
 uhid_char_poll+0x89/0xc0 drivers/hid/uhid.c:793
 vfs_poll include/linux/poll.h:82 [inline]
 __io_arm_poll_handler+0x1e5/0xd40 io_uring/poll.c:583
 io_poll_add+0x70/0xf0 io_uring/poll.c:893
 __io_issue_sqe io_uring/io_uring.c:1734 [inline]
 io_issue_sqe+0x15f/0xaf0 io_uring/io_uring.c:1753
 io_queue_sqe io_uring/io_uring.c:1969 [inline]
 io_req_task_submit+0x6a/0xc0 io_uring/io_uring.c:1371
 io_poll_task_func+0x74e/0xa70 io_uring/poll.c:-1
 io_handle_tw_list+0xce/0x1d0 io_uring/io_uring.c:1057
 tctx_task_work_run+0x6e/0x1c0 io_uring/io_uring.c:1121
 tctx_task_work+0x44/0x80 io_uring/io_uring.c:1139
 task_work_run+0x13c/0x1b0 kernel/task_work.c:227
 get_signal+0xe81/0x1000 kernel/signal.c:2808
 arch_do_signal_or_restart+0x9a/0x4b0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x62/0x120 kernel/entry/common.c:218
 do_syscall_64+0xd6/0x1c0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

value changed: 0x00 -> 0x01

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 UID: 0 PID: 6921 Comm: syz.3.927 Not tainted 6.14.0-syzkaller-11144-g1e7857b28020 #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

