Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC781117462
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2019 19:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbfLISid (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 13:38:33 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:37422 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726265AbfLISid (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Dec 2019 13:38:33 -0500
Received: (qmail 5435 invoked by uid 2102); 9 Dec 2019 13:38:32 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 9 Dec 2019 13:38:32 -0500
Date:   Mon, 9 Dec 2019 13:38:32 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+09ef48aa58261464b621@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <benjamin.tissoires@redhat.com>,
        <jikos@kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hid_field_extract
In-Reply-To: <000000000000dd7e7e05990793c1@google.com>
Message-ID: <Pine.LNX.4.44L0.1912091337050.1462-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 6 Dec 2019, syzbot wrote:

> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    1f22d15c usb: gadget: add raw-gadget interface
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=11d12861e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=8ccee2968018adcb
> dashboard link: https://syzkaller.appspot.com/bug?extid=09ef48aa58261464b621
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=101a781ee00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15d71c2ae00000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+09ef48aa58261464b621@syzkaller.appspotmail.com
> 
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in __extract drivers/hid/hid-core.c:1345  
> [inline]
> BUG: KASAN: slab-out-of-bounds in hid_field_extract+0x150/0x170  
> drivers/hid/hid-core.c:1365
> Read of size 1 at addr ffff8881cf50f000 by task swapper/0/0

Diagnostic patch.

#syz test: https://github.com/google/kasan.git 1f22d15c

Index: usb-devel/drivers/hid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-core.c
+++ usb-devel/drivers/hid/hid-core.c
@@ -1488,6 +1488,7 @@ static void hid_input_field(struct hid_d
 	if (!value)
 		return;
 
+	hid_info(hid, "Field offset %u size %u count %u\n", offset, size, count);
 	for (n = 0; n < count; n++) {
 
 		value[n] = min < 0 ?
@@ -1712,6 +1713,7 @@ int hid_report_raw_event(struct hid_devi
 	}
 
 	if (hid->claimed != HID_CLAIMED_HIDRAW && report->maxfield) {
+		hid_info(hid, "Report rsize %u csize %u\n", rsize, csize);
 		for (a = 0; a < report->maxfield; a++)
 			hid_input_field(hid, report->field[a], cdata, interrupt);
 		hdrv = hid->driver;

