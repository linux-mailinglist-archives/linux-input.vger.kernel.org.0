Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39D7310A113
	for <lists+linux-input@lfdr.de>; Tue, 26 Nov 2019 16:18:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728394AbfKZPSI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Nov 2019 10:18:08 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:40340 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728386AbfKZPSI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Nov 2019 10:18:08 -0500
Received: (qmail 1786 invoked by uid 2102); 26 Nov 2019 10:18:07 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 26 Nov 2019 10:18:07 -0500
Date:   Tue, 26 Nov 2019 10:18:07 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Jiri Kosina <jikos@kernel.org>
cc:     syzbot <syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com>,
        <andreyknvl@google.com>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <syzkaller-bugs@googlegroups.com>
Subject: Re: INFO: rcu detected stall in hub_event
In-Reply-To: <nycvar.YFH.7.76.1911260848090.1799@cbobk.fhfr.pm>
Message-ID: <Pine.LNX.4.44L0.1911261008430.1508-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 26 Nov 2019, Jiri Kosina wrote:

> On Mon, 25 Nov 2019, Alan Stern wrote:
> 
> > #syz test: https://github.com/google/kasan.git 46178223
> 
> Alan, did you get a test result from syzbot on this patch? My mailbox 
> doesn't seem to have it.

No response, not yet.  syzbot seems to be very slow testing the patches
for this bug report.  The earlier ones I submitted also took over a day
to finish.

BTW, even if this patch fixes the problem, I don't think setting 
collection[0].parent_idx to -1 is a very good solution.  It's brittle 
and doesn't address the underlying ambiguity.

Alan Stern

