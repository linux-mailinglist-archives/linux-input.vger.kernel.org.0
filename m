Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 558831092D4
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2019 18:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbfKYRaO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Nov 2019 12:30:14 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:58014 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727117AbfKYRaN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Nov 2019 12:30:13 -0500
Received: (qmail 4379 invoked by uid 2102); 25 Nov 2019 12:30:12 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 25 Nov 2019 12:30:12 -0500
Date:   Mon, 25 Nov 2019 12:30:12 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Jiri Kosina <jikos@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>
cc:     syzbot <syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: INFO: rcu detected stall in hub_event
In-Reply-To: <CAAeHK+xQo8S8mmMgrOHOwC3iOnZJOZvYNaAei-tMrJA36R6OMQ@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1911251216350.1565-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Jiri:

On Sat, 23 Nov 2019, Andrey Konovalov wrote:

> I'm not sure, but the stack trace reminds me of this issue, so this
> report might be related:
> 
> https://groups.google.com/d/msg/syzkaller-bugs/X0zVbh8aFEM/NsPcshjxBgAJ

No, the issue is quite different, although it is also a bug in the HID
parser.  The big problem is that the parser assumes all usages will
belong to a collection.

There's also a second, smaller bug: hid_apply_multipler() assumes every
Resolution Multiplier control is associated with a Logical Collection
(i.e., there's no way the routine can ever set multiplier_collection to
NULL) even though there's a big quotation from the HID Usage Table
manual at the start of the function saying that they don't have to be.  
This bug can be fixed easily, though.

The first bug is more troublesome.  hid_add_usage() explicitly sets the 
parser->local.collection_index[] entry to 0 if the current collection 
stack is empty.  But there's no way to distinguish this 0 from a 
genuine index value that happens to point to the first collection!

So what should happen when a usage appears outside of all collections?  
Is it a bug in the report descriptor (the current code suggests that it 
is not)?

Or should we use a different sentinel value for the collection_index[]
entry, one that cannot be confused with a genuine value, such as
UINT_MAX?

Awaiting your suggestion...

Alan Stern

