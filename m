Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D555E1075FA
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 17:51:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfKVQvz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 11:51:55 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:59718 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726638AbfKVQvy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 11:51:54 -0500
Received: (qmail 6639 invoked by uid 2102); 22 Nov 2019 11:51:53 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 22 Nov 2019 11:51:53 -0500
Date:   Fri, 22 Nov 2019 11:51:53 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <benjamin.tissoires@redhat.com>,
        <jikos@kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: INFO: rcu detected stall in hub_event
In-Reply-To: <000000000000109c040597dc5843@google.com>
Message-ID: <Pine.LNX.4.44L0.1911221150350.1511-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 21 Nov 2019, syzbot wrote:

> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    46178223 usb: gadget: add raw-gadget interface
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=15a05836e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=99c88c44660624e7
> dashboard link: https://syzkaller.appspot.com/bug?extid=ec5f884c4a135aa0dbb9
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1061395ae00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13653d1ce00000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com
> 
> rcu: INFO: rcu_sched self-detected stall on CPU

> RIP: 0010:hid_apply_multiplier drivers/hid/hid-core.c:1058 [inline]
> RIP: 0010:hid_setup_resolution_multiplier+0x33b/0x990  
> drivers/hid/hid-core.c:1114

Diagnostic patch.

#syz test: https://github.com/google/kasan.git 46178223

 drivers/hid/hid-core.c |   17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

Index: usb-devel/drivers/hid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-core.c
+++ usb-devel/drivers/hid/hid-core.c
@@ -1055,8 +1055,13 @@ static void hid_apply_multiplier(struct
 	 */
 	multiplier_collection = &hid->collection[multiplier->usage->collection_index];
 	while (multiplier_collection->parent_idx != -1 &&
-	       multiplier_collection->type != HID_COLLECTION_LOGICAL)
+	       multiplier_collection->type != HID_COLLECTION_LOGICAL) {
+		hid_info(hid, "collection %d %px parent %d\n",
+	multiplier_collection - hid->collection, multiplier_collection,
+	multiplier_collection->parent_idx);
 		multiplier_collection = &hid->collection[multiplier_collection->parent_idx];
+	}
+	hid_info(hid, "Got collection\n");
 
 	effective_multiplier = hid_calculate_multiplier(hid, multiplier);
 
@@ -1069,6 +1074,7 @@ static void hid_apply_multiplier(struct
 						      effective_multiplier);
 		}
 	}
+	hid_info(hid, "Applied multiplier\n");
 }
 
 /*
@@ -1103,16 +1109,23 @@ void hid_setup_resolution_multiplier(str
 
 	rep_enum = &hid->report_enum[HID_FEATURE_REPORT];
 	list_for_each_entry(rep, &rep_enum->report_list, list) {
+		hid_info(hid, "Start report %px maxfield %d\n",
+	rep, rep->maxfield);
 		for (i = 0; i < rep->maxfield; i++) {
 			/* Ignore if report count is out of bounds. */
 			if (rep->field[i]->report_count < 1)
 				continue;
 
+			hid_info(hid, "Field %d %px maxusage %d\n",
+	i, rep->field[i], rep->field[i]->maxusage);
 			for (j = 0; j < rep->field[i]->maxusage; j++) {
 				usage = &rep->field[i]->usage[j];
-				if (usage->hid == HID_GD_RESOLUTION_MULTIPLIER)
+				if (usage->hid == HID_GD_RESOLUTION_MULTIPLIER) {
+					hid_info(hid, "Usage %d %px\n",
+	j, usage);
 					hid_apply_multiplier(hid,
 							     rep->field[i]);
+				}
 			}
 		}
 	}

