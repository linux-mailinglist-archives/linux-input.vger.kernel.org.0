Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46C11108429
	for <lists+linux-input@lfdr.de>; Sun, 24 Nov 2019 17:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbfKXQRh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Nov 2019 11:17:37 -0500
Received: from netrider.rowland.org ([192.131.102.5]:47593 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726752AbfKXQRh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Nov 2019 11:17:37 -0500
Received: (qmail 26958 invoked by uid 500); 24 Nov 2019 11:17:36 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 24 Nov 2019 11:17:36 -0500
Date:   Sun, 24 Nov 2019 11:17:36 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     syzbot <syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <benjamin.tissoires@redhat.com>,
        <jikos@kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: INFO: rcu detected stall in hub_event
In-Reply-To: <0000000000004b60ec059809412f@google.com>
Message-ID: <Pine.LNX.4.44L0.1911241115410.26037-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Another diagnostic patch.

Alan Stern

#syz test: https://github.com/google/kasan.git 46178223

Index: usb-devel/drivers/hid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-core.c
+++ usb-devel/drivers/hid/hid-core.c
@@ -175,7 +175,8 @@ static int open_collection(struct hid_pa
 	collection->level = parser->collection_stack_ptr - 1;
 	collection->parent_idx = (collection->level == 0) ? -1 :
 		parser->collection_stack[collection->level - 1];
-
+	hid_info(parser->device, "New collection %px: idx %d parent %d type %d\n",
+		collection, (int) collection_index, collection->parent_idx, type);
 	if (type == HID_COLLECTION_APPLICATION)
 		parser->device->maxapplication++;
 
@@ -1046,8 +1047,18 @@ static void hid_apply_multiplier(struct
 	 */
 	multiplier_collection = &hid->collection[multiplier->usage->collection_index];
 	while (multiplier_collection->parent_idx != -1 &&
-	       multiplier_collection->type != HID_COLLECTION_LOGICAL)
+	       multiplier_collection->type != HID_COLLECTION_LOGICAL) {
+		hid_info(hid, "collection %d %px type %d parent %d\n",
+	(int) (multiplier_collection - hid->collection), multiplier_collection,
+	multiplier_collection->type, multiplier_collection->parent_idx);
+		if (multiplier_collection->parent_idx >=
+	multiplier_collection - hid->collection) {
+			hid_info(hid, "BUG: found invalid parent_idx\n");
+			return;
+		}
 		multiplier_collection = &hid->collection[multiplier_collection->parent_idx];
+	}
+	hid_info(hid, "Got collection\n");
 
 	effective_multiplier = hid_calculate_multiplier(hid, multiplier);
 
@@ -1060,6 +1071,7 @@ static void hid_apply_multiplier(struct
 						      effective_multiplier);
 		}
 	}
+	hid_info(hid, "Applied multiplier\n");
 }
 
 /*
@@ -1094,16 +1106,23 @@ void hid_setup_resolution_multiplier(str
 
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



