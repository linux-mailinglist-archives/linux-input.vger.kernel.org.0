Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C410711DFA0
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2019 09:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbfLMIoZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Dec 2019 03:44:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:48360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725793AbfLMIoY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Dec 2019 03:44:24 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D69F2253D;
        Fri, 13 Dec 2019 08:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576226664;
        bh=94LZnf/3s/roV8fMiTLrlu2OFhSW6ztFQ3srFRkny8Y=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=c8dneF8P6KxiTCDkuDcKPSF4/QLN7It98fosYDgzhXcFZDTjPPtxJUHa9azKjA1QA
         3/8QzuJXFp9B82cFcoo/ZCWX21+L23CrajbtOXuVoSeSxybyZ5+Z4CNrZ8LySiRz/z
         K+RTGymyKEQTlyNqeIyXkEy/xH5jLSaYyn4sfMYM=
Date:   Fri, 13 Dec 2019 09:44:21 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH] HID: Fix slab-out-of-bounds read in hid_field_extract
In-Reply-To: <Pine.LNX.4.44L0.1912111009080.1549-100000@iolanthe.rowland.org>
Message-ID: <nycvar.YFH.7.76.1912130941580.4603@cbobk.fhfr.pm>
References: <Pine.LNX.4.44L0.1912111009080.1549-100000@iolanthe.rowland.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 11 Dec 2019, Alan Stern wrote:

> > > The syzbot fuzzer found a slab-out-of-bounds bug in the HID report
> > > handler.  The bug was caused by a report descriptor which included a
> > > field with size 12 bits and count 4899, for a total size of 7349
> > > bytes.
> > > 
> > > The usbhid driver uses at most a single-page 4-KB buffer for reports.
> > > In the test there wasn't any problem about overflowing the buffer,
> > > since only one byte was received from the device.  Rather, the bug
> > > occurred when the HID core tried to extract the data from the report
> > > fields, which caused it to try reading data beyond the end of the
> > > allocated buffer.
> > > 
> > > This patch fixes the problem by rejecting any report whose total
> > > length exceeds the HID_MAX_BUFFER_SIZE limit (minus one byte to allow
> > > for a possible report index).  In theory a device could have a report
> > > longer than that, but if there was such a thing we wouldn't handle it 
> > > correctly anyway.
> > > 
> > > Reported-and-tested-by: syzbot+09ef48aa58261464b621@syzkaller.appspotmail.com
> > > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > > CC: <stable@vger.kernel.org>
> > 
> > Thanks for hunting this down Alan. Applied.
> 
> I just noticed this code:
> 
> u8 *hid_alloc_report_buf(struct hid_report *report, gfp_t flags)
> {
> 	/*
> 	 * 7 extra bytes are necessary to achieve proper functionality
> 	 * of implement() working on 8 byte chunks
> 	 */
> 
> 	u32 len = hid_report_len(report) + 7;
> 
> 	return kmalloc(len, flags);
> }
> 
> Does this indicate that the upper limit on a report length should 
> really be HID_MAX_BUFFER_SIZE - 8 instead of HID_MAX_BUFFER_SIZE - 1?

As far as I remember, this is just very lousy way of properly rounding the 
size up (see 27ce405039bfe). So I believe HID_MAX_BUFFER_SIZE -1 is still 
functionally correct.

Thanks,

-- 
Jiri Kosina
SUSE Labs

