Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBB698C9C
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 09:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730287AbfHVHvU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 03:51:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:48312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726096AbfHVHvT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 03:51:19 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 14431206BB;
        Thu, 22 Aug 2019 07:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566460278;
        bh=gLTtUwjy64ipJy2k/NTk5sFH5pVXBUlnIh6g4ASn+h8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Ky2LBlrT7dFKvo9bJZuLrmlUMzoL9mOIepdmpgN/5J0U2GQszKq8c812XWtyPgZAJ
         VQvOcfVXrgKM1EtiW/FChHV8/AgFYBqM992VbtmAy8hGBAp/PrrbpQv1zWt7fcmGsP
         tR3+UWfrdGzHxQLWk0LXQMb34AAoDtpVDawK0ge8=
Date:   Thu, 22 Aug 2019 09:51:07 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
cc:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] HID: hidraw: Fix invalid read in hidraw_ioctl
In-Reply-To: <Pine.LNX.4.44L0.1908211323030.1816-100000@iolanthe.rowland.org>
Message-ID: <nycvar.YFH.7.76.1908220950470.27147@cbobk.fhfr.pm>
References: <Pine.LNX.4.44L0.1908211323030.1816-100000@iolanthe.rowland.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 21 Aug 2019, Alan Stern wrote:

> The syzbot fuzzer has reported a pair of problems in the
> hidraw_ioctl() function: slab-out-of-bounds read and use-after-free
> read.  An example of the first:
> 
> BUG: KASAN: slab-out-of-bounds in strlen+0x79/0x90 lib/string.c:525
> Read of size 1 at addr ffff8881c8035f38 by task syz-executor.4/2833
> 
> CPU: 1 PID: 2833 Comm: syz-executor.4 Not tainted 5.3.0-rc2+ #1
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
> Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   print_address_description+0x6a/0x32c mm/kasan/report.c:351
>   __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
>   kasan_report+0xe/0x12 mm/kasan/common.c:612
>   strlen+0x79/0x90 lib/string.c:525
>   strlen include/linux/string.h:281 [inline]
>   hidraw_ioctl+0x245/0xae0 drivers/hid/hidraw.c:446
>   vfs_ioctl fs/ioctl.c:46 [inline]
>   file_ioctl fs/ioctl.c:509 [inline]
>   do_vfs_ioctl+0xd2d/0x1330 fs/ioctl.c:696
>   ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
>   __do_sys_ioctl fs/ioctl.c:720 [inline]
>   __se_sys_ioctl fs/ioctl.c:718 [inline]
>   __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
>   do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x459829
> Code: fd b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
> 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
> ff 0f 83 cb b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
> RSP: 002b:00007f7a68f6dc78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000459829
> RDX: 0000000000000000 RSI: 0000000080404805 RDI: 0000000000000004
> RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f7a68f6e6d4
> R13: 00000000004c21de R14: 00000000004d5620 R15: 00000000ffffffff
> 
> The two problems have the same cause: hidraw_ioctl() fails to test
> whether the device has been removed.  This patch adds the missing test.
> 
> Reported-and-tested-by: syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

Thanks a lot Alan for chasing this; I've applied the patch.

-- 
Jiri Kosina
SUSE Labs

