Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31E5D3F2DA7
	for <lists+linux-input@lfdr.de>; Fri, 20 Aug 2021 16:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240575AbhHTOG7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Aug 2021 10:06:59 -0400
Received: from netrider.rowland.org ([192.131.102.5]:54675 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S238353AbhHTOG6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Aug 2021 10:06:58 -0400
Received: (qmail 36556 invoked by uid 1000); 20 Aug 2021 10:06:20 -0400
Date:   Fri, 20 Aug 2021 10:06:20 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     syzbot <syzbot+9b57a46bf1801ce2a2ca@syzkaller.appspotmail.com>
Cc:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, mkubecek@suse.cz,
        syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] WARNING in hid_submit_ctrl/usb_submit_urb
Message-ID: <20210820140620.GA35867@rowland.harvard.edu>
References: <20210819195300.GA8613@rowland.harvard.edu>
 <000000000000c322ab05c9f2e880@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000c322ab05c9f2e880@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 19, 2021 at 05:40:07PM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:

That's good to know.  Still, I suspect there's a better way of handling 
this condition.

In particular, does it make sense to accept descriptors for input or 
feature reports with length zero?  I can't imagine what good such 
reports would do.

On the other hand, I'm not familiar enough with the code to know the 
right way to reject these descriptors and reports.  It looks like the 
HID subsystem was not designed with this sort of check in mind.

Benjamin and Jiri, what do you think?  Is it okay to allow descriptors 
for zero-length reports and just pretend they have length 1 (as the 
patch tested by syzbot did), or should we instead reject them during 
probing?

Alan Stern
