Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9140899DC
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 11:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727324AbfHLJcP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 05:32:15 -0400
Received: from mx2.suse.de ([195.135.220.15]:40650 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727140AbfHLJcP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 05:32:15 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 658C7AFB1;
        Mon, 12 Aug 2019 09:32:14 +0000 (UTC)
Message-ID: <1565602332.14671.5.camel@suse.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hidraw_ioctl
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com>,
        andreyknvl@google.com, syzkaller-bugs@googlegroups.com,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-usb@vger.kernel.org
Date:   Mon, 12 Aug 2019 11:32:12 +0200
In-Reply-To: <00000000000016c09c058fdd7faa@google.com>
References: <00000000000016c09c058fdd7faa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am Sonntag, den 11.08.2019, 13:46 -0700 schrieb syzbot:
> syzbot has found a reproducer for the following crash on:
> 
> HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=150426ba600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> dashboard link: https://syzkaller.appspot.com/bug?extid=5a6c4ec678a0c6ee84ba
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12725c02600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=162163c2600000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com

#syz test: https://github.com/google/kasan.git e96407b4

From 700a7cc270f06c6e9881f49e36a7722d16ee37db Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Thu, 8 Aug 2019 15:08:48 +0200
Subject: [PATCH] HID: use strnlen to not walk through kernel memory

If a device sets no phy name we must limit the range
for looking for the end of the string lest we touch
areas of memory we should not touch.

Reported-by: syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/hid/hidraw.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
index 006bd6f4f653..c7dcff6222b5 100644
--- a/drivers/hid/hidraw.c
+++ b/drivers/hid/hidraw.c
@@ -443,9 +443,7 @@ static long hidraw_ioctl(struct file *file, unsigned int cmd,
 				}
 
 				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCGRAWPHYS(0))) {
-					int len = strlen(hid->phys) + 1;
-					if (len > _IOC_SIZE(cmd))
-						len = _IOC_SIZE(cmd);
+					int len = strnlen(hid->phys, _IOC_SIZE(cmd)) + 1;
 					ret = copy_to_user(user_arg, hid->phys, len) ?
 						-EFAULT : len;
 					break;
-- 
2.16.4

