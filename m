Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 161A53FC84F
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 15:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237502AbhHaNff (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Aug 2021 09:35:35 -0400
Received: from netrider.rowland.org ([192.131.102.5]:59871 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S236476AbhHaNff (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Aug 2021 09:35:35 -0400
Received: (qmail 366261 invoked by uid 1000); 31 Aug 2021 09:34:38 -0400
Date:   Tue, 31 Aug 2021 09:34:38 -0400
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
Message-ID: <20210831133438.GA365946@rowland.harvard.edu>
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
> On Tue, Aug 24, 2021 at 1:54 PM Jiri Kosina <jikos@kernel.org> wrote:
> >
> > On Fri, 20 Aug 2021, Alan Stern wrote:
> >
> > > > syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> > >
> > > That's good to know.  Still, I suspect there's a better way of handling
> > > this condition.
> > >
> > > In particular, does it make sense to accept descriptors for input or
> > > feature reports with length zero?  I can't imagine what good such
> > > reports would do.
> >
> > I quickly went through drivers + some hidraw users, and can't spot any use
> > case for it.
> >
> > > On the other hand, I'm not familiar enough with the code to know the
> > > right way to reject these descriptors and reports.  It looks like the
> > > HID subsystem was not designed with this sort of check in mind.
> > >
> > > Benjamin and Jiri, what do you think?  Is it okay to allow descriptors
> > > for zero-length reports and just pretend they have length 1 (as the
> > > patch tested by syzbot did), or should we instead reject them during
> > > probing?
> >
> > I think it's a good band-aid for 5.14 (or 5.14-stable if we don't make
> > it), and if it turns out to break something (which I don't expect), than
> > we can look into rejecting already during probe.
> >
> > Benjamin, is there a way to run this quickly through your HID regression
> > testing machinery?
> >
> 
> I have finally been able to test this patch:
> - the testsuite is still passing (of course, this is not hid-core related)
> - Logitech unify receivers are fine (according to the automated tests)
> - Gaming mice with hidraw calls works (with libratbag in userspace)
> - Wacom Intuos Pro still works (so the usbhid calls to enable the
> tablet mode are still OK)
> 
> ->
> Tested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> 
> Alan, would you mind resending the patch with the various tags with a
> commit description? (unless I missed it...)

Will do.  I'm rather busy today, so it may have to wait until tomorrow.

Alan Stern
