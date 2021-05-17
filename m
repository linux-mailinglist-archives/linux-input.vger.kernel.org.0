Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96AE5382975
	for <lists+linux-input@lfdr.de>; Mon, 17 May 2021 12:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236260AbhEQKJV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 May 2021 06:09:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:55106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231658AbhEQKJV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 May 2021 06:09:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 555F8611CA;
        Mon, 17 May 2021 10:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621246085;
        bh=VFT5apLbfhc0dDJC9HhR1pYRGnwB4pdUBgycStr+hwY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YAaWxQjzqUFxPQABYA1A6C8gLYcxxnkaBIv5Rrd/49WUgAGkfiV/04OSDVlkt3Rs0
         XfyI08tJzdTFuNa4pDN0Z4tS0u3S4PV5d6g/DEyc/Kg1pxrKwD51MBxD3krWt1jcYa
         RDQMgKi39ct5l2OP/cmxs8iq4fK+uywgzc1fk6E4oGvWjED3qFJBxalu4c2iuKWPLj
         CRi7FjhtZ3Wd2P3cm02dAljdie9ofQTXUlW6d2rSK2B3y6Iq0PXZyXxqm9Z9DutvKW
         9VJl9kLBHJ6QjmhEA9V95cXMr/bUPZp9UuzscZtJawZl7JFZVm33g5teFERWcH9N3w
         soe1S9Ha1NFVA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1liaAN-0006K9-AM; Mon, 17 May 2021 12:08:03 +0200
Date:   Mon, 17 May 2021 12:08:03 +0200
From:   Johan Hovold <johan@kernel.org>
To:     syzbot <syzbot+ee6f6e2e68886ca256a8@syzkaller.appspotmail.com>
Cc:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, rydberg@bitmath.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] general protection fault in magicmouse_remove
Message-ID: <YKJAg+4e5KwUD0Mw@hovoldconsulting.com>
References: <000000000000b5a0af05c28368b4@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000b5a0af05c28368b4@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 17, 2021 at 02:42:16AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    d665ea6e Merge tag 'for-linus-5.13-rc1' of git://git.kerne..
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=11afac45d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f635d6ce17da8a68
> dashboard link: https://syzkaller.appspot.com/bug?extid=ee6f6e2e68886ca256a8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16d48069d00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12023fa9d00000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+ee6f6e2e68886ca256a8@syzkaller.appspotmail.com
> 
> usb 1-1: New USB device found, idVendor=05ac, idProduct=0265, bcdDevice= 0.40
> usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> usb 1-1: config 0 descriptor??
> usb 1-1: USB disconnect, device number 2
> general protection fault, probably for non-canonical address 0xdffffc000000002b: 0000 [#1] SMP KASAN
> KASAN: null-ptr-deref in range [0x0000000000000158-0x000000000000015f]
> CPU: 0 PID: 7 Comm: kworker/0:1 Not tainted 5.12.0-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Workqueue: usb_hub_wq hub_event
> RIP: 0010:timer_is_static_object+0x20/0x90 kernel/time/timer.c:625
> Code: 84 00 00 00 00 00 0f 1f 40 00 41 54 53 48 89 fb e8 d5 86 10 00 48 8d 7b 08 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 75 4f 45 31 e4 48 83 7b 08 00 74 0c e8 ab 86 10 00 44
> RSP: 0018:ffffc9000007f330 EFLAGS: 00010006
> RAX: dffffc0000000000 RBX: 0000000000000150 RCX: 0000000000000000
> RDX: 000000000000002b RSI: ffffffff8130663b RDI: 0000000000000158
> RBP: 0000000000000002 R08: 0000000000000000 R09: ffffffff8a5c35ab
> R10: fffffbfff14b86b5 R11: 0000000000000000 R12: dffffc0000000000
> R13: ffffffff86090c00 R14: 0000000000000150 R15: 1ffff9200000fe6b
> FS:  0000000000000000(0000) GS:ffff8881f6a00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00000000004ba438 CR3: 00000001097bb000 CR4: 00000000001506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  debug_object_assert_init lib/debugobjects.c:886 [inline]
>  debug_object_assert_init+0x1df/0x2e0 lib/debugobjects.c:861
>  debug_timer_assert_init kernel/time/timer.c:737 [inline]
>  debug_assert_init kernel/time/timer.c:782 [inline]
>  del_timer+0x6d/0x110 kernel/time/timer.c:1202
>  try_to_grab_pending+0x6d/0xd0 kernel/workqueue.c:1252
>  __cancel_work_timer+0xa6/0x570 kernel/workqueue.c:3098
>  magicmouse_remove+0x3a/0x50 drivers/hid/hid-magicmouse.c:782

For the record, fixed here:

	https://lore.kernel.org/r/20210517100430.20509-1-johan@kernel.org

Johan
