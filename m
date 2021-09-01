Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 832AF3FDECB
	for <lists+linux-input@lfdr.de>; Wed,  1 Sep 2021 17:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244730AbhIAPjJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 11:39:09 -0400
Received: from netrider.rowland.org ([192.131.102.5]:52785 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S244351AbhIAPjJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 11:39:09 -0400
Received: (qmail 404039 invoked by uid 1000); 1 Sep 2021 11:38:11 -0400
Date:   Wed, 1 Sep 2021 11:38:11 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        syzbot <syzbot+9b57a46bf1801ce2a2ca@syzkaller.appspotmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Michal Kubecek <mkubecek@suse.cz>,
        syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] WARNING in hid_submit_ctrl/usb_submit_urb
Message-ID: <20210901153811.GA403560@rowland.harvard.edu>
References: <20210819195300.GA8613@rowland.harvard.edu>
 <000000000000c322ab05c9f2e880@google.com>
 <20210820140620.GA35867@rowland.harvard.edu>
 <nycvar.YFH.7.76.2108241351490.15313@cbobk.fhfr.pm>
 <CAO-hwJ+i4MqOj0umUW9kFgYSZLt3QMb6hDZHQwb8AKH9pKxSTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-hwJ+i4MqOj0umUW9kFgYSZLt3QMb6hDZHQwb8AKH9pKxSTg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 31, 2021 at 11:51:31AM +0200, Benjamin Tissoires wrote:
> Tested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> 
> Alan, would you mind resending the patch with the various tags with a
> commit description? (unless I missed it...)

I plan to break this up into three patches, each doing a single thing.  The 
first patch in the series will be the one written by Michal.  The second 
will fix the problem found by syzbot, and the third will be a general 
cleanup.

Michal, is it okay to add your Signed-off-by: tag to the first patch?

Alan Stern
