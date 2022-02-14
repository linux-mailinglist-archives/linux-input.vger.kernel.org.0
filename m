Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A330D4B538E
	for <lists+linux-input@lfdr.de>; Mon, 14 Feb 2022 15:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237294AbiBNOlm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Feb 2022 09:41:42 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231236AbiBNOll (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Feb 2022 09:41:41 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 9AD3649277
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 06:41:33 -0800 (PST)
Received: (qmail 717174 invoked by uid 1000); 14 Feb 2022 09:41:32 -0500
Date:   Mon, 14 Feb 2022 09:41:32 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Dongliang Mu <mudongliangabcd@gmail.com>,
        Salah Triki <salah.triki@gmail.com>
Cc:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        noralf@tronnes.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        tzimmermann@suse.de
Subject: Re: [PATCH] HID: elo: Fix refcount leak in elo_probe()
Message-ID: <YgpqHEb1CuhIElIP@rowland.harvard.edu>
References: <YgbT4uqSIVY9ku10@rowland.harvard.edu>
 <000000000000d31cac05d7c4da7e@google.com>
 <YgcSbUwiALbmoTvL@rowland.harvard.edu>
 <CAD-N9QX6kTf-Fagz8W00KOM1REhoqQvfTckqZZttMcdSCHmSag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD-N9QX6kTf-Fagz8W00KOM1REhoqQvfTckqZZttMcdSCHmSag@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Feb 14, 2022 at 03:34:42PM +0800, Dongliang Mu wrote:
> On Sat, Feb 12, 2022 at 9:50 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > Syzbot identified a refcount leak in the hid-elo driver:
> >
> > BUG: memory leak
> > unreferenced object 0xffff88810d49e800 (size 2048):
> >   comm "kworker/1:1", pid 25, jiffies 4294954629 (age 16.460s)
> >   hex dump (first 32 bytes):
> >     ff ff ff ff 31 00 00 00 00 00 00 00 00 00 00 00  ....1...........
> >     00 00 00 00 00 00 00 00 00 00 00 00 03 00 00 00  ................
> >   backtrace:
> >     [<ffffffff82c87a62>] kmalloc include/linux/slab.h:581 [inline]
> >     [<ffffffff82c87a62>] kzalloc include/linux/slab.h:715 [inline]
> >     [<ffffffff82c87a62>] usb_alloc_dev+0x32/0x450 drivers/usb/core/usb.c:582
> >     [<ffffffff82c91a47>] hub_port_connect drivers/usb/core/hub.c:5260 [inline]
> >     [<ffffffff82c91a47>] hub_port_connect_change drivers/usb/core/hub.c:5502 [inline]
> >     [<ffffffff82c91a47>] port_event drivers/usb/core/hub.c:5660 [inline]
> >     [<ffffffff82c91a47>] hub_event+0x1097/0x21a0 drivers/usb/core/hub.c:5742
> >     [<ffffffff8126c3ef>] process_one_work+0x2bf/0x600 kernel/workqueue.c:2307
> >     [<ffffffff8126ccd9>] worker_thread+0x59/0x5b0 kernel/workqueue.c:2454
> >     [<ffffffff81276765>] kthread+0x125/0x160 kernel/kthread.c:377
> >     [<ffffffff810022ff>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
> >
> > Not shown in the bug report but present in the console log:
> >
> > [  182.014764][ T3257] elo 0003:04E7:0030.0006: item fetching failed at offset 0/1
> > [  182.022255][ T3257] elo 0003:04E7:0030.0006: parse failed
> > [  182.027904][ T3257] elo: probe of 0003:04E7:0030.0006 failed with error -22
> > [  182.214767][ T3257] usb 1-1: USB disconnect, device number 7
> > [  188.090199][ T3604] kmemleak: 3 new suspected memory leaks (see /sys/kernel/debug/kmemleak)
> > BUG: memory leak
> >
> > which points to hid-elo as the buggy driver.
> >
> > The leak is caused by elo_probe() failing to release the reference it
> > holds to the struct usb_device in its failure pathway.  In the end the
> > driver doesn't need to take this reference at all, because the
> 
> Hi Alan,
> 
> My patch "[PATCH] hid: elo: fix memory leak in elo_probe" is merged
> several weeks ago.

Really?  It still isn't in Linus's tree as of 5.17-rc4.  I would expect 
a bug fix to go upstream as soon as possible.

> However, I fix this bug by modifying the error handling code in
> elo_probe. If you think the refcount is not necessary, maybe a new
> patch to remove the refcount is better.

The refcount was added less than a year ago by Salah Triki in commit 
fbf42729d0e9 ("HID: elo: update the reference count of the usb device 
structure"), but the commit message doesn't explain why it is 
necessary.  There certainly isn't any obvious reason for it; the driver 
doesn't release any references after elo_remove() returns and we know 
that the usb_device structure won't be deallocated before the driver 
gets unbound.

Alan Stern
