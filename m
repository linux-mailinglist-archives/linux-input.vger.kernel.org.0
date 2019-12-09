Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DECE111764D
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2019 20:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfLITvm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 14:51:42 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:38414 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726509AbfLITvm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Dec 2019 14:51:42 -0500
Received: (qmail 6629 invoked by uid 2102); 9 Dec 2019 14:51:41 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 9 Dec 2019 14:51:41 -0500
Date:   Mon, 9 Dec 2019 14:51:41 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+09ef48aa58261464b621@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <benjamin.tissoires@redhat.com>,
        <jikos@kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hid_field_extract
In-Reply-To: <0000000000008eb2c605994a2b38@google.com>
Message-ID: <Pine.LNX.4.44L0.1912091448420.1462-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 9 Dec 2019, syzbot wrote:

> Hello,
> 
> syzbot has tested the proposed patch but the reproducer still triggered  
> crash:
> KASAN: slab-out-of-bounds Read in hid_field_extract
> 
> microsoft 0003:045E:07DA.0001: Report rsize 4096 csize 1
> microsoft 0003:045E:07DA.0001: Field offset 0 size 12 count 4899
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in __extract drivers/hid/hid-core.c:1345  
> [inline]
> BUG: KASAN: slab-out-of-bounds in hid_field_extract+0x150/0x170  
> drivers/hid/hid-core.c:1365
> Read of size 1 at addr ffff8881cc759000 by task swapper/1/0

Nobody bothers to check for ridiculously long reports?  This field had 
report_size = 12 and report_count = 4899!

Alan Stern

#syz test: https://github.com/google/kasan.git 1f22d15c

Index: usb-devel/drivers/hid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-core.c
+++ usb-devel/drivers/hid/hid-core.c
@@ -267,6 +267,10 @@ static int hid_add_field(struct hid_pars
 
 	offset = report->size;
 	report->size += parser->global.report_size * parser->global.report_count;
+	if (report->size > HID_MAX_BUFFER_SIZE << 3) {
+		hid_err(parser->device, "report is too long\n");
+		return -1;
+	}
 
 	if (!parser->local.usage_index) /* Ignore padding fields */
 		return 0;
@@ -1488,6 +1492,7 @@ static void hid_input_field(struct hid_d
 	if (!value)
 		return;
 
+	hid_info(hid, "Field offset %u size %u count %u\n", offset, size, count);
 	for (n = 0; n < count; n++) {
 
 		value[n] = min < 0 ?
@@ -1712,6 +1717,7 @@ int hid_report_raw_event(struct hid_devi
 	}
 
 	if (hid->claimed != HID_CLAIMED_HIDRAW && report->maxfield) {
+		hid_info(hid, "Report rsize %u csize %u\n", rsize, csize);
 		for (a = 0; a < report->maxfield; a++)
 			hid_input_field(hid, report->field[a], cdata, interrupt);
 		hdrv = hid->driver;



