Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EADAB119655
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 22:26:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbfLJV0N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Dec 2019 16:26:13 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:51932 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728956AbfLJV0M (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Dec 2019 16:26:12 -0500
Received: (qmail 7209 invoked by uid 2102); 10 Dec 2019 16:26:11 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 10 Dec 2019 16:26:11 -0500
Date:   Tue, 10 Dec 2019 16:26:11 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Jiri Kosina <jikos@kernel.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: [PATCH] HID: Fix slab-out-of-bounds read in hid_field_extract
In-Reply-To: <Pine.LNX.4.44L0.1912091318210.1462-100000@iolanthe.rowland.org>
Message-ID: <Pine.LNX.4.44L0.1912101622030.1647-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The syzbot fuzzer found a slab-out-of-bounds bug in the HID report
handler.  The bug was caused by a report descriptor which included a
field with size 12 bits and count 4899, for a total size of 7349
bytes.

The usbhid driver uses at most a single-page 4-KB buffer for reports.
In the test there wasn't any problem about overflowing the buffer,
since only one byte was received from the device.  Rather, the bug
occurred when the HID core tried to extract the data from the report
fields, which caused it to try reading data beyond the end of the
allocated buffer.

This patch fixes the problem by rejecting any report whose total
length exceeds the HID_MAX_BUFFER_SIZE limit (minus one byte to allow
for a possible report index).  In theory a device could have a report
longer than that, but if there was such a thing we wouldn't handle it 
correctly anyway.

Reported-and-tested-by: syzbot+09ef48aa58261464b621@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: <stable@vger.kernel.org>

---


[as1926]


 drivers/hid/hid-core.c |    6 ++++++
 1 file changed, 6 insertions(+)

Index: usb-devel/drivers/hid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-core.c
+++ usb-devel/drivers/hid/hid-core.c
@@ -268,6 +268,12 @@ static int hid_add_field(struct hid_pars
 	offset = report->size;
 	report->size += parser->global.report_size * parser->global.report_count;
 
+	/* Total size check: Allow for possible report index byte */
+	if (report->size > (HID_MAX_BUFFER_SIZE - 1) << 3) {
+		hid_err(parser->device, "report is too long\n");
+		return -1;
+	}
+
 	if (!parser->local.usage_index) /* Ignore padding fields */
 		return 0;
 

