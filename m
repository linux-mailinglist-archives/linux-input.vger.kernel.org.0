Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED0097FFB
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 18:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729285AbfHUQYh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 12:24:37 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:53738 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726857AbfHUQYh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 12:24:37 -0400
Received: (qmail 5610 invoked by uid 2102); 21 Aug 2019 12:24:36 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 21 Aug 2019 12:24:36 -0400
Date:   Wed, 21 Aug 2019 12:24:36 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     syzbot <syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hidraw_ioctl
In-Reply-To: <CAAeHK+xQc5Ce6TwtERTmQ+6qSbuAmGikxCU5SNTdcDAynDEiig@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1908211223070.1816-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 21 Aug 2019, Andrey Konovalov wrote:

> On Wed, Aug 21, 2019 at 3:37 PM syzbot
> <syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot has tested the proposed patch but the reproducer still triggered
> > crash:
> > KASAN: slab-out-of-bounds Read in hidraw_ioctl
> 
> Same here, a different bug.

It looks like I've got the fix for both these bugs.  Testing now...

> > Tested on:
> >
> > commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git
> > console output: https://syzkaller.appspot.com/x/log.txt?x=14f14a1e600000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > patch:          https://syzkaller.appspot.com/x/patch.diff?x=171cd95a600000

Why don't these patch-test reports include the dashboard link?  It sure 
would be handy to have a copy of it here.

Alan Stern

