Return-Path: <linux-input+bounces-13442-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E63D5AFEDD9
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 17:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2A8B1C41594
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 15:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F032D59FD;
	Wed,  9 Jul 2025 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AIr9mZl1"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91143EEA8;
	Wed,  9 Jul 2025 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752075345; cv=none; b=EpI76XunO+tn0v1FAKhih5dGV911A+RyWn1Rxhvgvmh+sP+O+jEMzL2zTZjztTxT/WT8NWSSMe91u3D/61otUMIADULEu2GTpU6T+g9BISJacYtU2RQ6T0kF/rjmLllgahiANMlz24pPgprsL190Yd5/B9vT6GOKFRvvNYQHSEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752075345; c=relaxed/simple;
	bh=4dZbLIHY8xb9heYI9d9GC4UZr096PDL6SmX3/sJuo9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEI15mGyH6J6Qs+bmdf+lhoHKsD6Io+bJYnzcy/wWFh/9q2PcdzxtwDC1/5DM0zFMxxnWtAURSt5VHWfPPjr35i7spcI51aD2DI1ydzE0kL31wlbm4zBsgDALYBUJAKY5l7YEptjhX4C/FW3F2KiO9FkGMN2XHMkqRDq67TCaJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AIr9mZl1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FEC9C4CEEF;
	Wed,  9 Jul 2025 15:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752075345;
	bh=4dZbLIHY8xb9heYI9d9GC4UZr096PDL6SmX3/sJuo9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AIr9mZl11H36uOeryBS1Sgt42UPSTw3HaGRXvpJhFXrzAOXkgT8lUFXOAJt2Z1Ncj
	 rXzfAiACf+2ULw8FVKgQmUJXZBNWEpxYTkbVA+hXQJvuSlH3PfZi9P8eaKRrL6KCn/
	 GqewDMPXm+oZTJokQazepNZwAN0rP3ClyiGJC+fAu2f8W3n9v0y1GvSTmUidgrC97V
	 beYxo7GIg0PqRMQm5SEVuef6Jw2YooH9QFFEFZ8g3Aj6YpSEd/k5QXfaQShGD4QlZk
	 GbQ3QEraBd8VP3ei5172Ul6XcD4kT4pm6c+dAjBVzLNBbcso+SSxoBgnu+iGFiHGQW
	 YnchECjmVFuNw==
Date: Wed, 9 Jul 2025 17:35:41 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Serious bug in HID core
Message-ID: <rwo5cqptiqarvl7qhgapao2uld3aqs27llhtqm5crop3v3rx64@j7h64nqsv6rv>
References: <c75433e0-9b47-4072-bbe8-b1d14ea97b13@rowland.harvard.edu>
 <drcvdlw2kpuvsbact2gy4hvqp2i3au3shv5ozp3qms7qdfvi7t@7jofrodxeimb>
 <e3a58c95-9501-4ec8-902e-2a73402d1fe3@rowland.harvard.edu>
 <5rkp3gbrqvsdgia57eyw65jnu4wmpx6sbk47kmv4akmz2q7nzz@clqgtjfk2qxk>
 <b18af9f1-e3d8-429a-b313-38cc279e0f87@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b18af9f1-e3d8-429a-b313-38cc279e0f87@rowland.harvard.edu>

On Jul 09 2025, Alan Stern wrote:
> On Wed, Jul 09, 2025 at 10:44:35AM +0200, Benjamin Tissoires wrote:
> > On Jul 08 2025, Alan Stern wrote:
> > > On Tue, Jul 08, 2025 at 05:51:08PM +0200, Benjamin Tissoires wrote:
> > > > The second one would need a little bit more understanding of the fake
> > > > report descriptor provided by syzbot.
> > > 
> > > I suppose we can get the information from syzbot if it's really 
> > > necessary.  But it seems to be a minor point.
> > 
> > Well, to me it's important because I can get an easier reproducer and
> > add this corner case in the HID test suite :) Not to mention the
> > understanding on how we can get to this corner case.
> 
> I can get it for you if you really want to see it.  It's just a question 
> of asking syzbot to run the reproducer with a patch that prints all the 
> report descriptors.

I would very much appreciate that :)

> 
> Presumably this is just an ordinary output report descriptor containing 
> no fields (or usages, or whatever they're called).  Even if it isn't, I 
> would expect any such output report to trigger the bug.

That's where things are weird. If the report would have been empty, the
code that changes the wheel resolution should never be run, because that
code relies on a specific usage to be set on a feature report.

But if a usage is set, then the report size should be greater than 0...

> 
> > > > The first byte should always be reserved to the report ID, and is
> > > > populated by 0 by hid-core when the report ID is not in use.
> > > 
> > > Then why does hid_output_report() do this:
> > > 
> > > 	if (report->id > 0)
> > > 		*data++ = report->id;
> > > 
> > > ?  The first byte is not reserved for the ID when the ID is 0.  
> > > According to what you said, the assignment should be unconditional.  
> > > Isn't that a genuine bug?
> > 
> > In my mind, hid_output_report() is doing the correct thing: it fills the
> > provided buffer with the data the device is expected to receive.
> > 
> > However, the HID subsystem convention is that when accessing the low
> > level driver, the first byte is always reserved to the report ID, even
> > if it's null and should be ignored by the device.
> > 
> > So I think one of the problems is that __hid_request() should actually
> > shifts it's buffer by one in case the report ID is 0, to reserve the
> > first byte for the report ID. Likewise, if the report ID is 0, the len
> > variable should be incremented.
> 
> In other words, in __hid_request() we should change:
> 
> 	if (reqtype == HID_REQ_SET_REPORT)
> 		hid_output_report(report, buf);
> 
> to:
> 
> 	if (reqtype == HID_REQ_SET_REPORT) {
> 		/*
> 		 * If report->id is 0, the report ID byte is not counted by
> 		 * hid_report_len() and not reserved by hid_output_report(),
> 		 * so we have to do those things here.
> 		 */
> 		if (report->id == 0) {
> 			++len;
> 			buf[0] = 0;
> 			hid_output_report(report, buf + 1);
> 		} else {
> 			hid_output_report(report, buf);
> 		}
> 	}
> 
> Right?

yeah, that's roughly what I did in 2/3. If you prefer this approach
because more explicit, I can take your patch instead.

> 
> > > And shouldn't the length computed by hid_alloc_report_buf() be one 
> > > larger than it is when the ID is 0?
> > 
> > Yes, that seems to be correct, but I believe we never had the issue
> > because this function already allocates 7 extra bytes for implement() to
> > be working (see drivers/hid/hid-steam.c comment in steam_recv_report()
> > for a similar conclusion).
> 
> Hmmm.  The comment in hid_alloc_report_buf() says that implement() 
> operates on 8-byte chunks.  Do those chunks start at the beginning of 
> the buffer or at the beginning of the report data (i.e., the second byte 
> of the buffer)?  In the latter case the function should allocate an 
> extra 8 bytes, not 7.

implement() are per field. So we need 7 extra bytes after the latest
field in the report. If we shift the report by one, we then need 8 extra
bytes, not 7. This should be fixed in patch 1/3.

> 
> > I can try to provide a series today for fixing all of this mess. But I
> > must confess that I'm currently swamped for the next 2 weeks. Yay for me
> > then :(
> > 
> > [side note: I took the c reproducer, compiled it locally but this did
> > not triggered the bug... Given that many of the individual patches from
> > the series will potentially fix the bug (multiple layers of fixing),
> > it's a little bit sad I can not reproduce locally.]
> 
> I can send a patch that does the change shown above, if syzbot's testing 
> shows that it fixes the bug.  That ought to help lighten your load.

Thanks. But as you noticed I've already send one partial series, at
least to fix the buffer underflow.

Cheers,
Benjamin

