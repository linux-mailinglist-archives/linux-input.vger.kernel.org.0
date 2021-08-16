Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2EB3ED90B
	for <lists+linux-input@lfdr.de>; Mon, 16 Aug 2021 16:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbhHPOj3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Aug 2021 10:39:29 -0400
Received: from netrider.rowland.org ([192.131.102.5]:32953 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231307AbhHPOj2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Aug 2021 10:39:28 -0400
Received: (qmail 123046 invoked by uid 1000); 16 Aug 2021 10:38:56 -0400
Date:   Mon, 16 Aug 2021 10:38:56 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Michal Kubecek <mkubecek@suse.cz>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [REGRESSION][BISECTED] flood of "hid-generic ... control queue
 full" since v5.14-rc1
Message-ID: <20210816143856.GA121345@rowland.harvard.edu>
References: <20210816130059.3yxtdvu2r7wo4uu3@lion.mk-sys.cz>
 <YRpnfJ719DwPu2B0@kroah.com>
 <20210816141347.zougsudwe5tqgkpt@lion.mk-sys.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816141347.zougsudwe5tqgkpt@lion.mk-sys.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 16, 2021 at 04:13:47PM +0200, Michal Kubecek wrote:
> On Mon, Aug 16, 2021 at 03:26:20PM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Aug 16, 2021 at 03:00:59PM +0200, Michal Kubecek wrote:
> > > Hello,
> > > 
> > > starting with v5.14-rc1, my kernel log gets flooded with messages
> > > 
> > >   hid-generic 0003:051D:0002.0002: control queue full
> > > 
> > > at rate of ~33 per second. Device 051d:0002 is an APC UPS (BR-650 VA).
> > > I bisected the issue to commit
> > > 
> > >   7652dd2c5cb7 ("USB: core: Check buffer length matches wLength for control transfers")
> > > 
> > > Reverting this commit on top of v5.14-rc6 resolves the issue. I suspect
> > > the problem is some missing cleanup when usb_submit_urb() bails out on
> > > the newly added check but I'm not familiar enough with the code to see
> > > what is missing or if the problem is on USB or HID side.

...

> Looking at the code, the primary problem seems to be that the "else"
> branch in hid_submit_ctrl() recalculates transfer_buffer_length to
> a rounded up value but assigns the original length to wLength.

Looks like you found the bug.  Fixing it might be as simple as setting 
len = padlen in that "else" branch.  You could then combine the 
transfer_buffer_length assignment with the one in the "if" branch and 
hoist them out after the entire "if" statement.

Alan Stern
