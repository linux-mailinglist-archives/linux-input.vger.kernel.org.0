Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67996117423
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2019 19:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfLIS0b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 13:26:31 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:37368 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726365AbfLIS0b (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Dec 2019 13:26:31 -0500
Received: (qmail 4869 invoked by uid 2102); 9 Dec 2019 13:26:30 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 9 Dec 2019 13:26:30 -0500
Date:   Mon, 9 Dec 2019 13:26:30 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Jiri Kosina <jikos@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>
cc:     syzbot <syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: INFO: rcu detected stall in hub_event
In-Reply-To: <Pine.LNX.4.44L0.1911251216350.1565-100000@iolanthe.rowland.org>
Message-ID: <Pine.LNX.4.44L0.1912091318210.1462-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 25 Nov 2019, Alan Stern wrote:

> Jiri:
> 
> On Sat, 23 Nov 2019, Andrey Konovalov wrote:
> 
> > I'm not sure, but the stack trace reminds me of this issue, so this
> > report might be related:
> > 
> > https://groups.google.com/d/msg/syzkaller-bugs/X0zVbh8aFEM/NsPcshjxBgAJ
> 
> No, the issue is quite different, although it is also a bug in the HID
> parser.  The big problem is that the parser assumes all usages will
> belong to a collection.
> 
> There's also a second, smaller bug: hid_apply_multipler() assumes every
> Resolution Multiplier control is associated with a Logical Collection
> (i.e., there's no way the routine can ever set multiplier_collection to
> NULL) even though there's a big quotation from the HID Usage Table
> manual at the start of the function saying that they don't have to be.  
> This bug can be fixed easily, though.
> 
> The first bug is more troublesome.  hid_add_usage() explicitly sets the 
> parser->local.collection_index[] entry to 0 if the current collection 
> stack is empty.  But there's no way to distinguish this 0 from a 
> genuine index value that happens to point to the first collection!
> 
> So what should happen when a usage appears outside of all collections?  
> Is it a bug in the report descriptor (the current code suggests that it 
> is not)?
> 
> Or should we use a different sentinel value for the collection_index[]
> entry, one that cannot be confused with a genuine value, such as
> UINT_MAX?

On Tue, 26 Nov 2019, Jiri Kosina wrote:

> Alan, did you get a test result from syzbot on this patch? My mailbox 
> doesn't seem to have it.

On Tue, 26 Nov 2019, syzbot wrote:

> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger
> crash:
>
> Reported-and-tested-by:
> syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com

Jiri:

Now we've got the answer.  The current question is: What should I do
with the patch?  It seems rather ad-hoc, not a proper solution to the
problem.

To refresh your memory, here is the patch that syzbot tested:

 drivers/hid/hid-core.c |    5 +++++
 1 file changed, 5 insertions(+)

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
 
Alan Stern

