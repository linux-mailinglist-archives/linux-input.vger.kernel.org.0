Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 651851C56AF
	for <lists+linux-input@lfdr.de>; Tue,  5 May 2020 15:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729020AbgEENXB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 May 2020 09:23:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:45076 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728996AbgEENXB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 5 May 2020 09:23:01 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 7C67FAB89;
        Tue,  5 May 2020 13:23:01 +0000 (UTC)
Message-ID: <1588684948.13662.11.camel@suse.com>
Subject: Re: KASAN: slab-out-of-bounds Write in betop_probe
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+07efed3bc5a1407bd742@syzkaller.appspotmail.com>,
        andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Date:   Tue, 05 May 2020 15:22:28 +0200
In-Reply-To: <0000000000000610eb059e429abd@google.com>
References: <0000000000000610eb059e429abd@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am Montag, den 10.02.2020, 17:16 -0800 schrieb syzbot:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    e5cd56e9 usb: gadget: add raw-gadget interface
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=1517fed9e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=8cff427cc8996115
> dashboard link: https://syzkaller.appspot.com/bug?extid=07efed3bc5a1407bd742
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=147026b5e00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1683b6b5e00000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+07efed3bc5a1407bd742@syzkaller.appspotmail.com
> 
> betop 0003:20BC:5500.0001: unknown main item tag 0x0
> betop 0003:20BC:5500.0001: hidraw0: USB HID v0.00 Device [HID 20bc:5500] on usb-dummy_hcd.0-1/input0
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in set_bit include/asm-generic/bitops/instrumented-atomic.h:28 [inline]
> BUG: KASAN: slab-out-of-bounds in betopff_init drivers/hid/hid-betopff.c:99 [inline]
> BUG: KASAN: slab-out-of-bounds in betop_probe+0x396/0x570 drivers/hid/hid-betopff.c:134
> Write of size 8 at addr ffff8881d4f43ac0 by task kworker/1:2/94
> 
> Freed by task 12:
>  save_stack+0x1b/0x80 mm/kasan/common.c:72
>  set_track mm/kasan/common.c:80 [inline]
>  kasan_set_free_info mm/kasan/common.c:337 [inline]
>  __kasan_slab_free+0x117/0x160 mm/kasan/common.c:476
>  slab_free_hook mm/slub.c:1444 [inline]
>  slab_free_freelist_hook mm/slub.c:1477 [inline]
>  slab_free mm/slub.c:3024 [inline]
>  kfree+0xd5/0x300 mm/slub.c:3976
>  urb_destroy drivers/usb/core/urb.c:26 [inline]
>  kref_put include/linux/kref.h:65 [inline]
> 

Hi,

this indicates that I am confused. Why are we getting an out-of-bounds
on a freed region? Is this a strange way of reporting access
to already freed memory?

	Regards
		Oliver

