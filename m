Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC7E11AD2B
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2019 15:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729821AbfLKOST (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 09:18:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:57264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729671AbfLKOST (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 09:18:19 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ED51F214AF;
        Wed, 11 Dec 2019 14:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576073899;
        bh=+H4MGUo0gC4uetQ+rmXNbqxXzXtjav/zslpd/VoejfI=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=U/4wOD/HWDijvXYTZYe/fGkWMDDh/8J1ohOQn/O2hHQSyj5axQ5Tdt6TNUzFKr2En
         tfRrTv9mwnIjhWVyWkU0Z//81RgrgFPyBH40ouF2uQ6m/utkzh77mT0hKqhroUo2qD
         oqB7RDJmcW3EHtMH9k7QNn+lar2neL8dcuHYdB8Q=
Date:   Wed, 11 Dec 2019 15:18:15 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH] HID: Fix slab-out-of-bounds read in hid_field_extract
In-Reply-To: <Pine.LNX.4.44L0.1912101622030.1647-100000@iolanthe.rowland.org>
Message-ID: <nycvar.YFH.7.76.1912111517570.4603@cbobk.fhfr.pm>
References: <Pine.LNX.4.44L0.1912101622030.1647-100000@iolanthe.rowland.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 10 Dec 2019, Alan Stern wrote:

> The syzbot fuzzer found a slab-out-of-bounds bug in the HID report
> handler.  The bug was caused by a report descriptor which included a
> field with size 12 bits and count 4899, for a total size of 7349
> bytes.
> 
> The usbhid driver uses at most a single-page 4-KB buffer for reports.
> In the test there wasn't any problem about overflowing the buffer,
> since only one byte was received from the device.  Rather, the bug
> occurred when the HID core tried to extract the data from the report
> fields, which caused it to try reading data beyond the end of the
> allocated buffer.
> 
> This patch fixes the problem by rejecting any report whose total
> length exceeds the HID_MAX_BUFFER_SIZE limit (minus one byte to allow
> for a possible report index).  In theory a device could have a report
> longer than that, but if there was such a thing we wouldn't handle it 
> correctly anyway.
> 
> Reported-and-tested-by: syzbot+09ef48aa58261464b621@syzkaller.appspotmail.com
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> CC: <stable@vger.kernel.org>

Thanks for hunting this down Alan. Applied.

-- 
Jiri Kosina
SUSE Labs

