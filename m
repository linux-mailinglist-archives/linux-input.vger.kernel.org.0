Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B03A0FC3AA
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2019 11:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbfKNKIp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Nov 2019 05:08:45 -0500
Received: from mx2.suse.de ([195.135.220.15]:48652 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726339AbfKNKIp (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Nov 2019 05:08:45 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id A6777AFDF;
        Thu, 14 Nov 2019 10:08:43 +0000 (UTC)
Message-ID: <1573726121.17351.3.camel@suse.com>
Subject: Re: WARNING: ODEBUG bug in input_ff_destroy
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+b6c55daa701fc389e286@syzkaller.appspotmail.com>,
        andreyknvl@google.com, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Date:   Thu, 14 Nov 2019 11:08:41 +0100
In-Reply-To: <0000000000005ee2a10597399876@google.com>
References: <0000000000005ee2a10597399876@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am Mittwoch, den 13.11.2019, 04:35 -0800 schrieb syzbot:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    3183c037 usb: gadget: add raw-gadget interface
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=17cf5e72e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=79de80330003b5f7
> dashboard link: https://syzkaller.appspot.com/bug?extid=b6c55daa701fc389e286
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10b4e53ae00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1173fe72e00000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+b6c55daa701fc389e286@syzkaller.appspotmail.com

#syz test: https://github.com/google/kasan.git 3183c037

asix: fix information leak on short answersFrom b72ba3305d1e0405bfff5b6fc936d3769cd46c42 Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Thu, 14 Nov 2019 11:03:45 +0100
Subject: [PATCH] ff-memless: kill timer in destroy()

No timer must be left running when the device goes away.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/input/ff-memless.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/ff-memless.c b/drivers/input/ff-memless.c
index 1cb40c7475af..e72543d831cd 100644
--- a/drivers/input/ff-memless.c
+++ b/drivers/input/ff-memless.c
@@ -489,6 +489,7 @@ static void ml_ff_destroy(struct ff_device *ff)
 {
 	struct ml_device *ml = ff->private;
 
+	del_timer_sync(&ml->timer);
 	kfree(ml->private);
 }
 
-- 
2.16.4

