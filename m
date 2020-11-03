Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 892EA2A438B
	for <lists+linux-input@lfdr.de>; Tue,  3 Nov 2020 11:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbgKCKz0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Nov 2020 05:55:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:34766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728248AbgKCKz0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Nov 2020 05:55:26 -0500
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C3FFC223BD;
        Tue,  3 Nov 2020 10:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604400925;
        bh=Gx/xjl1lJ2zVpy4vXYoDX8bz9kjv23h23jTvE3/Hxbg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=2sEeylef5AtEFxa+uyhscnSV6SoxvnPd4MSyfVxYTzKxNFoH0FbBX+085E6KdkwwP
         4vV8ZWaOIEwHSTPKOmq8PFRXoe+pcvjYqj/HdrYTsDDnFQke3cisQ+0KvJUx2qYnLz
         mWIhbwbEF6BRJDWLFqQWq+e9aeJsKvHlXBqVdyrM=
Date:   Tue, 3 Nov 2020 11:55:22 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Pascal Giard <pascal.giard@etsmtl.ca>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sanjay Govind <sanjay.govind9@gmail.com>
Subject: Re: [PATCH] HID: ghlive: support for ghlive ps3/wii u dongles
In-Reply-To: <CAJNNDmn1OBzRouNUcAmWSfj4piSHRFfc6V6gvb2D+2qYO1Ob7g@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2011031152270.18859@cbobk.fhfr.pm>
References: <20201009022722.123943-1-pascal.giard@etsmtl.ca> <nycvar.YFH.7.76.2010291622380.18859@cbobk.fhfr.pm> <CAJNNDmn1OBzRouNUcAmWSfj4piSHRFfc6V6gvb2D+2qYO1Ob7g@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 29 Oct 2020, Pascal Giard wrote:

> > >  drivers/hid/Kconfig      |   6 ++
> > >  drivers/hid/Makefile     |   1 +
> > >  drivers/hid/hid-ghlive.c | 220 +++++++++++++++++++++++++++++++++++++++
> >
> > Would it make more sense (with respect to how we are structuring/naming
> > the hid drivers) to incorporate this into hid-sony (irrespective of
> > currently ongoing discussions about actually splitting that driver :) )?
> >
> 
> I think it would be most appropriate, yes.
> 
> Note that there are 3 other dongles out there:
> - the xbox360 dongle does not need any special treatment, it just
> works with hid-generic;
> - the ps4 dongle obviously makes sense to go into hid-sony (although
> no one has reversed engineered that one (yet));
> - the xboxone dongle: that's an unknown one to me. I don't have any
> information about that one unfortunately and do not own one.
> 
> I wrote this as a separate hid driver as I saw that email [1] from
> Roderick Colenbrander in which he expressed a preference for a
> seperate driver in cases where the device is not from Sony proper.

Yeah, but before that happens, I think we should just continue with status 
quo, meaning putting the support into hid-sony, if noone has any 
objections.

> > So if one of the allocations above succeeds and a subsequent one fails,
> > you're going to try re-allocate all of them next time again, leaking the
> > ones that previously succeeded, right?
> >
> 
> I attempted to avoid such a case. IIUC there are 4 possible scenarios
> tied to those 3 allocs (cr, databuf, and urb):
> 1) alloc of cr fails. nothing to be freed, we reschedule;
> 2) alloc of cr succeeds, alloc of databuf fails. we free cr and we reschedule;
> 3) allocs of cr and databuf succeed, alloc of urb fails. we free cr
> and databuf, and we reschedule;
> 4) all allocs succeed, we submit the urb, and free urb. once the
> control packet is sent, the callback is called and we free cr and
> databuf.
> 
> Am I missing something? 

No, I probably didn't have my first coffee of the day when looking at your 
patch, sorry.

Still, the way it tries to allocate the buffers is sub-optimal, as if 
either (not necessarily the first one) fails, it retries the next 
iteration with attempting to allocate from scratch.

If the system really is in tight memory condition, it'd make more sense to 
keep the ones for which the allocation succeeded already allocated, and 
retry only the failed one(s).

Thanks,

-- 
Jiri Kosina
SUSE Labs

