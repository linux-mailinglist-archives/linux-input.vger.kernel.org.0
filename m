Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 145CB109514
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2019 22:24:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfKYVYG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Nov 2019 16:24:06 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:58248 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725924AbfKYVYG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Nov 2019 16:24:06 -0500
Received: (qmail 5654 invoked by uid 2102); 25 Nov 2019 16:24:05 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 25 Nov 2019 16:24:05 -0500
Date:   Mon, 25 Nov 2019 16:24:05 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <benjamin.tissoires@redhat.com>,
        <jikos@kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: INFO: rcu detected stall in hub_event
In-Reply-To: <00000000000003b7c305982885e3@google.com>
Message-ID: <Pine.LNX.4.44L0.1911251622420.1565-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

#syz test: https://github.com/google/kasan.git 46178223

Index: usb-devel/drivers/hid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-core.c
+++ usb-devel/drivers/hid/hid-core.c
@@ -1057,6 +1057,8 @@ static void hid_apply_multiplier(struct
 	while (multiplier_collection->parent_idx != -1 &&
 	       multiplier_collection->type != HID_COLLECTION_LOGICAL)
 		multiplier_collection = &hid->collection[multiplier_collection->parent_idx];
+	if (multiplier_collection->type != HID_COLLECTION_LOGICAL)
+		multiplier_collection = NULL;
 
 	effective_multiplier = hid_calculate_multiplier(hid, multiplier);
 
@@ -1191,6 +1193,9 @@ int hid_open_report(struct hid_device *d
 	}
 	device->collection_size = HID_DEFAULT_NUM_COLLECTIONS;
 
+	/* Needed for usages before the first collection */
+	device->collection[0].parent_idx = -1;
+
 	ret = -EINVAL;
 	while ((start = fetch_item(start, end, &item)) != NULL) {
 

