Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3335B17D203
	for <lists+linux-input@lfdr.de>; Sun,  8 Mar 2020 07:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbgCHGIR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Mar 2020 01:08:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:40766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725904AbgCHGIR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 8 Mar 2020 01:08:17 -0500
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net [107.3.166.239])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9CD8F20848;
        Sun,  8 Mar 2020 06:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583647695;
        bh=71yIqpukPBtHV5I6LSMjfrv1qewJJ4OfYr4Z6XsKuEU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uYT0VbTRkTUqLPjTx8M2N8tMB3YkE1jHtJ2ZKZFAkODgQIkv60UMP5H1o60eNpeD8
         DErEbTWNUpli08Jwb6GJhfSHo/cWxR35ivORXla+SkXwV9ikBqlufT8D5LXm4xbEQ7
         YzVPtsPIAj7sUnXWdQA+uEvxGMrkwDemE4d3x0m8=
Date:   Sat, 7 Mar 2020 22:08:14 -0800
From:   Eric Biggers <ebiggers@kernel.org>
To:     Hillf Danton <hdanton@sina.com>
Cc:     syzbot <syzbot+8357fbef0d7bb602de45@syzkaller.appspotmail.com>,
        benjamin.tissoires@redhat.com, dh.herrmann@googlemail.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: INFO: trying to register non-static key in uhid_char_release
Message-ID: <20200308060814.GZ15444@sol.localdomain>
References: <000000000000ce8d2305a03b0988@google.com>
 <20200308040535.1540-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200308040535.1540-1-hdanton@sina.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Mar 08, 2020 at 12:05:35PM +0800, Hillf Danton wrote:
> 
> Fri, 06 Mar 2020 19:05:11 -0800
> > syzbot found the following crash on:
> > 
> > HEAD commit:    fb279f4e Merge branch 'i2c/for-current-fixed' of git://git..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=16bc5181e00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=8b13b05f0e61d957
> > dashboard link: https://syzkaller.appspot.com/bug?extid=8357fbef0d7bb602de45
> > compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
> > 
> > Unfortunately, I don't have any reproducer for this crash yet.
> > 
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+8357fbef0d7bb602de45@syzkaller.appspotmail.com
> > 
> > INFO: trying to register non-static key.
> > the code is fine but needs lockdep annotation.
> > turning off the locking correctness validator.
> > CPU: 0 PID: 9870 Comm: syz-executor.1 Not tainted 5.6.0-rc3-syzkaller #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > Call Trace:
> >  __dump_stack lib/dump_stack.c:77 [inline]
> >  dump_stack+0x1e9/0x30e lib/dump_stack.c:118
> >  register_lock_class+0x6f4/0xec0 kernel/locking/lockdep.c:443
> >  __lock_acquire+0x116/0x1bc0 kernel/locking/lockdep.c:3836
> >  lock_acquire+0x154/0x250 kernel/locking/lockdep.c:4484
> >  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
> >  _raw_spin_lock_irqsave+0x9e/0xc0 kernel/locking/spinlock.c:159
> >  __wake_up_common_lock kernel/sched/wait.c:122 [inline]
> >  __wake_up+0xb8/0x150 kernel/sched/wait.c:142
> >  uhid_dev_destroy drivers/hid/uhid.c:563 [inline]
> >  uhid_char_release+0x99/0x600 drivers/hid/uhid.c:642
> >  __fput+0x2d8/0x730 fs/file_table.c:280
> >  task_work_run+0x176/0x1b0 kernel/task_work.c:113
> >  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
> >  exit_to_usermode_loop arch/x86/entry/common.c:164 [inline]
> >  prepare_exit_to_usermode+0x48a/0x5c0 arch/x86/entry/common.c:195
> >  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> > RIP: 0033:0x416041
> > Code: 75 14 b8 03 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 04 1b 00 00 c3 48 83 ec 08 e8 0a fc ff ff 48 89 04 24 b8 03 00 00 00 0f 05 <48> 8b 3c 24 48 89 c2 e8 53 fc ff ff 48 89 d0 48 83 c4 08 48 3d 01
> > RSP: 002b:00007ffd2649c0a0 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
> > RAX: 0000000000000000 RBX: 0000000000000004 RCX: 0000000000416041
> > RDX: 0000001b2f820000 RSI: 0000000000000000 RDI: 0000000000000003
> > RBP: 0000000000000001 R08: 00000000a5a41883 R09: 00000000a5a41887
> > R10: 00007ffd2649c180 R11: 0000000000000293 R12: 000000000076bf20
> > R13: 00000000007715a0 R14: 000000000003bd20 R15: 000000000076bf2c
> > 
> > general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN
> > KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> > CPU: 0 PID: 9870 Comm: syz-executor.1 Not tainted 5.6.0-rc3-syzkaller #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > RIP: 0010:__wake_up_common+0x297/0x4d0 kernel/sched/wait.c:86
> > Code: fb 01 00 00 45 31 f6 eb 13 66 2e 0f 1f 84 00 00 00 00 00 4d 39 fc 0f 84 e3 01 00 00 4c 89 fb 49 8d 6f e8 4c 89 f8 48 c1 e8 03 <80> 3c 10 00 74 12 48 89 df e8 eb 48 59 00 48 ba 00 00 00 00 00 fc
> > RSP: 0018:ffffc900049a7d20 EFLAGS: 00010046
> > RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> > RDX: dffffc0000000000 RSI: 0000000000000001 RDI: ffff888048e513c8
> > RBP: ffffffffffffffe8 R08: 0000000000000000 R09: ffffc900049a7d88
> > R10: fffff52000934fa4 R11: 0000000000000000 R12: ffff888048e51400
> > R13: 1ffff92000934fb1 R14: 0000000000000000 R15: 0000000000000000
> > FS:  0000000000ed3940(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 0000001b2f822000 CR3: 0000000098f9a000 CR4: 00000000001406f0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > Call Trace:
> >  __wake_up_common_lock kernel/sched/wait.c:123 [inline]
> >  __wake_up+0xd4/0x150 kernel/sched/wait.c:142
> >  uhid_dev_destroy drivers/hid/uhid.c:563 [inline]
> >  uhid_char_release+0x99/0x600 drivers/hid/uhid.c:642
> >  __fput+0x2d8/0x730 fs/file_table.c:280
> >  task_work_run+0x176/0x1b0 kernel/task_work.c:113
> >  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
> >  exit_to_usermode_loop arch/x86/entry/common.c:164 [inline]
> >  prepare_exit_to_usermode+0x48a/0x5c0 arch/x86/entry/common.c:195
> >  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> 
> Only for gpf.
> 
> --- a/drivers/hid/uhid.c
> +++ b/drivers/hid/uhid.c
> @@ -636,9 +636,13 @@ static int uhid_char_open(struct inode *
>  
>  static int uhid_char_release(struct inode *inode, struct file *file)
>  {
> -	struct uhid_device *uhid = file->private_data;
> +	struct uhid_device *uhid;
>  	unsigned int i;
>  
> +	uhid = xchg(&file->private_data, NULL);
> +	if (!uhid)
> +		return 0; /* race is benign */
> +
>  	uhid_dev_destroy(uhid);
>  
>  	for (i = 0; i < UHID_BUFSIZE; ++i)
> 

That looks wrong.  The normal semantics for files (and uhid looks no different)
is that file->private_data is valid as long as they're open, and then
->release() frees it.  ->release() should never see NULL private_data.
