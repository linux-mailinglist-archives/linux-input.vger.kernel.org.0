Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6362151CEB
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2020 16:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbgBDPGv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Feb 2020 10:06:51 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:46632 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727290AbgBDPGv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Feb 2020 10:06:51 -0500
Received: (qmail 2187 invoked by uid 2102); 4 Feb 2020 10:06:50 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 4 Feb 2020 10:06:50 -0500
Date:   Tue, 4 Feb 2020 10:06:50 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     js <sym.i.nem@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>,
        Armando Visconti <armando.visconti@st.com>,
        Johan Korsnes <jkorsnes@cisco.com>
Subject: Re: [PATCH v2] HID: truncate hid reports exceeding HID_MAX_BUFFER_SIZE
In-Reply-To: <CAKsRvPOyPqxLaUx+gemCARq+gVeOO94iqyVMWspUEKXk==_wZg@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2002040958360.1587-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 4 Feb 2020, js wrote:

> Commit 8ec321e96e05 ("HID: Fix slab-out-of-bounds read in
> hid_field_extract") introduced a regression bug that broke
> hardware probes which request large report sizes.
> 
> An example of this hardware is the ELON9038 digitizer on the
> Microsoft Surface Go as per bug id 206259.
> https://bugzilla.kernel.org/show_bug.cgi?id=206259
> 
> To eliminate the regression, return 0 instead of -1 when a
> large report size is requested, allowing the hardware to
> probe properly while size error is output to kernel log.
> 
> Commit 8ec321e96e05 does not enforce buffer size limitation
> on the size of the incoming report.
> Added enforcement by truncation to prevent buffer overflow in
> hid_report_raw_event().
> 
> Fixes: 8ec321e96e05 ("HID: Fix slab-out-of-bounds read in hid_field_extract")
> Reported-and-tested-by: James Smith <sym.i.nem@gmail.com>
> Signed-off-by: James Smith <sym.i.nem@gmail.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Armando Visconti <armando.visconti@st.com>
> Cc: Jiri Kosina <jkosina@suse.cz>
> Cc: Johan Korsnes <jkorsnes@cisco.com>
> Cc: stable@vger.kernel.org
> ---
> Sorry about my earlier email, I'm new to this forum and am still
> learning the conventions.
> 
> At your suggestion, I examined the code more carefully and I think
> that the previous patch (commit 8ec321e96e05) did not solve the buffer
> overflow at all, it just killed a tranche of hardware of unknown size
> which requests report sizes exceeding 4K.
> 
> The problem, and why the previous patch didn't really address the
> issue, is that the enforcement occurs at a declarative point in the
> code, which is to say, the device is just describing itself, it is not
> actually requesting memory or generating a report. A malicious device
> could easily describe itself incorrectly then generate a report
> exceeding both the size it indicated in hid_add_field() and
> HID_MAX_BUFFER_SIZE, overflowing the buffer and causing unintended
> behavior.

Such behavior would not overflow anything.  The driver never transfers 
more than HID_MAX_BUFFER_SIZE, no matter how data the device wants to 
send.  The only effect would be a truncated report (which probably 
would lead to unintended behavior).

> The correct point to enforce a buffer size constraint is the point
> where the report is taken from the device and copied into the hid
> handling layer. From my examination of the code, this seems to be in
> hid_report_raw_event(). Thus, I placed an enforcement constraint on
> the report size in that method, took out the enforcement constraint in
> hid_add_field(), because it was causing a hardware regression and not
> properly enforcing the boundary constraint, and added user-facing
> warnings to notify when hardware is going to be affected by the
> introduced boundary constraints.

This is not an unreasonable approach, although I do not think you have 
described it fairly.

On the other hand, how often does it happen that a device sends report 
messages that are considerably smaller than the value given in the 
descriptor?  I can't tell from the Bugzilla report exactly what the 
ELON9038 digitizer and other devices are doing.

Alan Stern

