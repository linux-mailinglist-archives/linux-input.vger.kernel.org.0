Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE9A99A3B
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 19:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732425AbfHVRLl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 13:11:41 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:52678 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2390936AbfHVRLi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 13:11:38 -0400
Received: (qmail 3512 invoked by uid 2102); 22 Aug 2019 13:11:37 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 22 Aug 2019 13:11:37 -0400
Date:   Thu, 22 Aug 2019 13:11:37 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     Jiri Kosina <jikos@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Hillf Danton <hdanton@sina.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        <linux-input@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] HID: USB: Fix general protection fault caused by Logitech
 driver
In-Reply-To: <CAAeHK+zarjL9AWcOTMMfMgE7+vk8W2HQTvjR1x3n6H6QPYC1aQ@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1908221253180.1311-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 22 Aug 2019, Andrey Konovalov wrote:

> Hi Alan,
> 
> I've ran the fuzzer with your patches applied overnight and noticed
> another fallout of similar bugs. I think they are caused by a similar
> issue in the sony HID driver. There's no hid_hw_stop() call in the "if
> (!(hdev->claimed & HID_CLAIMED_INPUT))" case in sony_probe(). Does it
> look like a bug to you?

It looks like the relevant hid_hw_stop() call is the one at the end of
sony_configure_input().  But I can't tell if doing that way is valid or
not -- in practice the code would end up calling hid_disconnect() while
hid_connect() was still running, which doesn't seem like a good idea.

There's a comment about this near the end of sony_probe().  I suspect
it would be better to call hid_hw_stop() in the conditional code
following that comment rather than in sony_configure_input().

Either way, these are all things Jiri should know about or check up on.

Have you gotten any test results from syzbot exercising these pathways?  
You ought to be able to tell which HID driver is involved by looking
through the console output.

Alan Stern

