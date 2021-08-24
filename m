Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1BB23F5D62
	for <lists+linux-input@lfdr.de>; Tue, 24 Aug 2021 13:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236436AbhHXLyo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Aug 2021 07:54:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:57004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236622AbhHXLyn (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Aug 2021 07:54:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 482C6611F0;
        Tue, 24 Aug 2021 11:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629806039;
        bh=dyA/gddwc1ZbdgERfmKbuXd8glHESw+7KVjh327CGjo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=sZqqpm3wrSD1UIIBn3Yo5NbgiVUG9PGFihC3TBgi2NESPCdyObiFroQHPr/Kr2WYj
         CS1JZeQtPbTu45BKGZEjjl1DeG5nN0T5CIbEh1OrFiky14COihqdFLx7idwJYecgei
         K81wrRJi984GNt5l4S48N9SaU1iER/Lkm/0JtME88TSVXsdh3o3nlJldm34WewqBO+
         qCZW/dyZmj5a8QNmB2dSicJCR8aCsVFkgtjgA98VRJXi5dX8/Qvu6oIif2vstz6zkd
         KL+oeSv3ZAWiMYx0yimZwa6APsTqmePalelPGFh1MelMLKUzM3uEZSBwhBCIQAXyvg
         hXySCPMbL8R2Q==
Date:   Tue, 24 Aug 2021 13:53:56 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
cc:     syzbot <syzbot+9b57a46bf1801ce2a2ca@syzkaller.appspotmail.com>,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mkubecek@suse.cz, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] WARNING in hid_submit_ctrl/usb_submit_urb
In-Reply-To: <20210820140620.GA35867@rowland.harvard.edu>
Message-ID: <nycvar.YFH.7.76.2108241351490.15313@cbobk.fhfr.pm>
References: <20210819195300.GA8613@rowland.harvard.edu> <000000000000c322ab05c9f2e880@google.com> <20210820140620.GA35867@rowland.harvard.edu>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 20 Aug 2021, Alan Stern wrote:

> > syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> 
> That's good to know.  Still, I suspect there's a better way of handling 
> this condition.
> 
> In particular, does it make sense to accept descriptors for input or 
> feature reports with length zero?  I can't imagine what good such 
> reports would do.

I quickly went through drivers + some hidraw users, and can't spot any use 
case for it.

> On the other hand, I'm not familiar enough with the code to know the 
> right way to reject these descriptors and reports.  It looks like the 
> HID subsystem was not designed with this sort of check in mind.
> 
> Benjamin and Jiri, what do you think?  Is it okay to allow descriptors 
> for zero-length reports and just pretend they have length 1 (as the 
> patch tested by syzbot did), or should we instead reject them during 
> probing?

I think it's a good band-aid for 5.14 (or 5.14-stable if we don't make 
it), and if it turns out to break something (which I don't expect), than 
we can look into rejecting already during probe.

Benjamin, is there a way to run this quickly through your HID regression 
testing machinery?

Thanks,

-- 
Jiri Kosina
SUSE Labs

