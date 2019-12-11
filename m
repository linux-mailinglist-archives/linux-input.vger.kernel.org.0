Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 618E911B7F8
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2019 17:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730486AbfLKQLh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 11:11:37 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:55076 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730798AbfLKPKo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 10:10:44 -0500
Received: (qmail 1752 invoked by uid 2102); 11 Dec 2019 10:10:43 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 11 Dec 2019 10:10:43 -0500
Date:   Wed, 11 Dec 2019 10:10:43 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Jiri Kosina <jikos@kernel.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH] HID: Fix slab-out-of-bounds read in hid_field_extract
In-Reply-To: <nycvar.YFH.7.76.1912111517570.4603@cbobk.fhfr.pm>
Message-ID: <Pine.LNX.4.44L0.1912111009080.1549-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 11 Dec 2019, Jiri Kosina wrote:

> On Tue, 10 Dec 2019, Alan Stern wrote:
> 
> > The syzbot fuzzer found a slab-out-of-bounds bug in the HID report
> > handler.  The bug was caused by a report descriptor which included a
> > field with size 12 bits and count 4899, for a total size of 7349
> > bytes.
> > 
> > The usbhid driver uses at most a single-page 4-KB buffer for reports.
> > In the test there wasn't any problem about overflowing the buffer,
> > since only one byte was received from the device.  Rather, the bug
> > occurred when the HID core tried to extract the data from the report
> > fields, which caused it to try reading data beyond the end of the
> > allocated buffer.
> > 
> > This patch fixes the problem by rejecting any report whose total
> > length exceeds the HID_MAX_BUFFER_SIZE limit (minus one byte to allow
> > for a possible report index).  In theory a device could have a report
> > longer than that, but if there was such a thing we wouldn't handle it 
> > correctly anyway.
> > 
> > Reported-and-tested-by: syzbot+09ef48aa58261464b621@syzkaller.appspotmail.com
> > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > CC: <stable@vger.kernel.org>
> 
> Thanks for hunting this down Alan. Applied.

I just noticed this code:

u8 *hid_alloc_report_buf(struct hid_report *report, gfp_t flags)
{
	/*
	 * 7 extra bytes are necessary to achieve proper functionality
	 * of implement() working on 8 byte chunks
	 */

	u32 len = hid_report_len(report) + 7;

	return kmalloc(len, flags);
}

Does this indicate that the upper limit on a report length should 
really be HID_MAX_BUFFER_SIZE - 8 instead of HID_MAX_BUFFER_SIZE - 1?

Alan Stern

