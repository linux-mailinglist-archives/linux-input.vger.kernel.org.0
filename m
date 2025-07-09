Return-Path: <linux-input+bounces-13429-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D41C2AFE308
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 10:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24E2F17B7F2
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 08:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2966827F00C;
	Wed,  9 Jul 2025 08:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sK8oFira"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C6927AC37;
	Wed,  9 Jul 2025 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752050680; cv=none; b=itLwcWrVQni2vtGAC1HuLF6VJa0D7NNZ2Apa8ZWzURJ94yQMjEHm1rkVk9B3cE9XFunV++tXNaNPt4/H980mhiE47ovLqKfh33ZAdCNM4iVBpQUG01+VUoReX2h6NUG7Nxo4Q+Ba1+lPLXXZIrfGz+tBm9VUjxCnJ6Lktr8Shqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752050680; c=relaxed/simple;
	bh=w9WGLSqq6a5WsdtGDFAA/D/MxdTbK7pOBWndhFMIdTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPWMfW2MWKYxc1rMvnoc+Bwq3vksN8FYywDt13zol29x1JK7r3YWojvieSGMJbuzohij0JLRETNN5NqivWr7ZetoNK+fRVRtrdt+1y79PgShGllpiOF7x6JqvOqNw0aHIZBbgC67vqJLoJn/KcKamsgAwP7Ac7xnvjNEymheydI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sK8oFira; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F9C1C4CEF0;
	Wed,  9 Jul 2025 08:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752050679;
	bh=w9WGLSqq6a5WsdtGDFAA/D/MxdTbK7pOBWndhFMIdTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sK8oFirans/1yQQkUkCLdKgZDKPCxqYZdjmKL6JPgt6GrNRlitPC6z4cQVUkLFE0+
	 v0ZAn9MhRzkRXFn4OEgnGHnRC4lG6UwzfB4udqpQ9QsSFPH/EtHkMvG2LsQF3cRDlG
	 i/Bj7ut8N1dYPQmOl2vwmAu9XStxBeAbrewwhKxNZuC3jo3/YwzUSYsEwJpBD1BqyD
	 TjMluuWxJr4MxP50AZfkSLPqyLmSKq3DM7oArO8DJTn0VVfGHl/Fc/152nau66JI9c
	 KejCrK5jX2xfz4yCmvSCmTV8oQk9oan/5GX9F5GLwzM/cuFLjO/ZqZgvwPjuKy+yeb
	 1YIgVGKsFWq+A==
Date: Wed, 9 Jul 2025 10:44:35 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Serious bug in HID core
Message-ID: <5rkp3gbrqvsdgia57eyw65jnu4wmpx6sbk47kmv4akmz2q7nzz@clqgtjfk2qxk>
References: <c75433e0-9b47-4072-bbe8-b1d14ea97b13@rowland.harvard.edu>
 <drcvdlw2kpuvsbact2gy4hvqp2i3au3shv5ozp3qms7qdfvi7t@7jofrodxeimb>
 <e3a58c95-9501-4ec8-902e-2a73402d1fe3@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3a58c95-9501-4ec8-902e-2a73402d1fe3@rowland.harvard.edu>

On Jul 08 2025, Alan Stern wrote:
> On Tue, Jul 08, 2025 at 05:51:08PM +0200, Benjamin Tissoires wrote:
> > Hi Alan,
> > 
> > On Jul 08 2025, Alan Stern wrote:
> > > Jiri and Benjamin:
> > > 
> > > Investigating a recent bug report from syzbot 
> > > (https://lore.kernel.org/linux-usb/686be237.a70a0220.29fe6c.0b0c.GAE@google.com/)
> > > led me to a rather serious error in the HID core.  It could affect a 
> > > lot of drivers, and I don't know enough about them or the HID subsystem 
> > > to fix it right away.
> > > 
> > > In short, does the value returned by hid_report_len() count the byte 
> > > reserved for the report ID number?
> > 
> > It depends :)
> > 
> > See your analysis below...
> > 
> > > 
> > > Some drivers seem to assume that it does and some seem to assume that it 
> > > doesn't.  Here's what the actual code from include/linux/hid.h does:
> > > 
> > > /**
> > >  * hid_report_len - calculate the report length
> > >  *
> > >  * @report: the report we want to know the length
> > >  */
> > > static inline u32 hid_report_len(struct hid_report *report)
> > > {
> > > 	return DIV_ROUND_UP(report->size, 8) + (report->id > 0);
> > > }
> > > 
> > > It's somewhere in between -- it includes the ID byte in the count if and 
> > > only if the ID is nonzero!  And of course, this behavior isn't mentioned 
> > > in the (ungrammatical) kerneldoc.
> > 
> > Yeah, the docs are bad. But your analysis is correct: for a given
> > report, its size might include or not the report ID.
> > 
> > This is because the report ID is optional in the HID spec, and some
> > devices don't make use of it. Those devices are only exporting one
> > report type, and can not have another report type in the same HID
> > device. If a device needs to have more than one, it then needs to export
> > the report ID in all of its reports, and then report_len count that
> > extra byte.
> > 
> > To give you an example, old mice (or inexpensive ones), would export a
> > report with:
> > - X, Y, Wheel, B0, B1, B2
> > 
> > When a more advanced one might export:
> > - REPORT ID 0, X, Y, Wheel, B0, B1, B2, ... B9
> > - REPORT ID 1, SOME_VERY_COMPLEX_CONFIGURATION, ANOTHER ONE, ETC...
> > 
> > However, a HID device making use of the non report ID version can never
> > make use of a report ID (or it's custom proprietary protocol).
> 
> So you're saying that while the kerneldoc for hid_report_len() could be 
> improved, the code itself is correct.  Fine.  But this merely means that 
> the real problem lies elsewhere (and _not_ in syzbot's test scenario!).  
> See below.

Agree, and as I'm trying to untangle this, there are several problems,
and I have a feeling most of them are in __hid_request() (which was
added way after all of the raw_requests in usbhid).

Regarding syzbot's test scenario, I don't say that it's wrong, just that
it doesn't make sense to have such a device, unless you want to
carefully trigger this bug. In the real world, a device with a
report->size of 0 without a report ID is just doing nothing but
draining USB current.

> 
> Also, are you sure that all the other HID drivers realize that 
> hid_report_len() behaves this way?  It's an easy thing to get wrong.
> 
> > > The particular scenario causing the bug found by syzbot was this: 
> > > report->size was 0, report->id was 0, and the lower-level driver (usbhid 
> > > in this case) assumed that the length argument (which was 0) did include 
> > > the ID byte.  Since the ID was 0, the driver skipped over the first byte 
> > > of the buffer and decremented the length, causing the length to 
> > > underflow and leading to an invalid memory access.  In a more realistic 
> > > setting, this would merely result in data loss and leakage.
> > 
> > That scenario is bogus (like most of syzbots in the HID space). There
> > should be no way the HID subsystem allows a report->size of 0 to be used
> > in a set_report or a get_report. So that's where the bug lies: HID
> > trusts too much the device, and can lead to that kind of issues.
> > 
> > > 
> > > How should this be fixed?
> > 
> > We have 2 problems here:
> > - and __hid_request or __hid_raw_request should reject a null size
> > 	report, and in the __hid_request case, a report of size 1 if there is
> > 	a report ID.
> > - Why is hidinput_change_resolution_multipliers() even considfering this
> > 	report of size 0 when it should at least ensure that there is one
> > 	field within the report
> > 
> > The first one should be easy to fix: add a bunch of checks.
> 
> I would normally expect this to checked when the report descriptors are 
> read and parsed during probing.  A report of length zero could be 
> rejected then (perhaps with an error message in the kernel log).

Agree to that.

> 
> However, that wouldn't fully fix the problem.  And besides, length-0 
> reports are (or should be) harmless.

They should be harmless, agree, but they shouldn't exist at all: the
device would be doing nothing, so there is no point in keeping it around
in the HID subsystem.

> 
> > __hid_hw_raw_request() seems to not expose the problem actually.
> > 
> > The second one would need a little bit more understanding of the fake
> > report descriptor provided by syzbot.
> 
> I suppose we can get the information from syzbot if it's really 
> necessary.  But it seems to be a minor point.

Well, to me it's important because I can get an easier reproducer and
add this corner case in the HID test suite :) Not to mention the
understanding on how we can get to this corner case.

> 
> > > Related issue: When the lower-level driver's raw_request() routine is 
> > > called, can it assume that the first byte of the output buffer always 
> > > contains the report ID number, set by the HID core?  If not, should it 
> > > assume that the first byte is always reserved for the ID, or that the 
> > > first byte is reserved only when the ID is nonzero?
> > 
> > The first byte should always be reserved to the report ID, and is
> > populated by 0 by hid-core when the report ID is not in use.
> 
> Then why does hid_output_report() do this:
> 
> 	if (report->id > 0)
> 		*data++ = report->id;
> 
> ?  The first byte is not reserved for the ID when the ID is 0.  
> According to what you said, the assignment should be unconditional.  
> Isn't that a genuine bug?

In my mind, hid_output_report() is doing the correct thing: it fills the
provided buffer with the data the device is expected to receive.

However, the HID subsystem convention is that when accessing the low
level driver, the first byte is always reserved to the report ID, even
if it's null and should be ignored by the device.

So I think one of the problems is that __hid_request() should actually
shifts it's buffer by one in case the report ID is 0, to reserve the
first byte for the report ID. Likewise, if the report ID is 0, the len
variable should be incremented.

> 
> And shouldn't the length computed by hid_alloc_report_buf() be one 
> larger than it is when the ID is 0?

Yes, that seems to be correct, but I believe we never had the issue
because this function already allocates 7 extra bytes for implement() to
be working (see drivers/hid/hid-steam.c comment in steam_recv_report()
for a similar conclusion).

> 
> > So the usbhid driver is doing the right thing. In case there is no
> > report ID, it ignores the first byte when making a request to the
> > device, because in my example above, the device would not expect the
> > first byte to be 0.
> 
> When usbhid skips the first byte, it also decrements the length.  Since 
> __hid_request() calls it with a length given by hid_report_len(), the 
> length has _already_ been decremented (or rather, not incremented -- it 
> doesn't account for the ID byte), and consequently the USB transfer will 
> leave out the final byte of the report.  This is the data loss I 
> mentioned earlier.  It's another bug.

Agree (see above).

> 
> So which is doing the wrong thing: usbhid or __hid_request()?

Definitely __hid_request(). This function was added to not have to
reproduce the .request() field in all new low level transport drivers.
So in theory usbhid (which has .request) should not be affected by such
a bug.

*but*, and that's where things are going to be nasty, we got a couple of
shortcuts in the rest of the HID code which allow this bug to be
triggered (in addition to the couple of fixes from above):
- __hid_request() is directly calling hid->ll_driver->raw_request(),
	bypassing hid_hw_raw_request() which does the sanity checks around the
	provided values (and size == 0 would have been rejected)
- and hidinput_change_resolution_multipliers() directly calls __hid_request()
  when it should use hid_hw_request() to let the driver handle that
  case by itself.

However, regarding the second point here, if the first is fixed, that
means that __hid_request() would make the sanity check but also forward
the request to HID-BPF which wasn't the case previously, so maybe it's
best to keep the hid-input.c calls to __hid_request() instead of
hid_hw_request().

> 
> > > Do __hid_request() and __hid_hw_raw_request() behave the same way in 
> > > this regard?
> > 
> > __hid_hw_raw_request() ensures that there is a minimum length of one, so
> > we should be fine. __hid_request apparently is the only one giving too
> > much trust in the report.
> 
> In principle there's nothing wrong with a zero-length report.  It would 
> be pretty useless, but nevertheless we should be able to handle one 
> without crashing the kernel.

Agree, but a HID device with a 0-length report means that the report
would be completely useless, so that report should be stripped out from
HID core, and if there is no report in the device at all, then the
device should be ignored, or at least not powered up.

I can try to provide a series today for fixing all of this mess. But I
must confess that I'm currently swamped for the next 2 weeks. Yay for me
then :(

[side note: I took the c reproducer, compiled it locally but this did
not triggered the bug... Given that many of the individual patches from
the series will potentially fix the bug (multiple layers of fixing),
it's a little bit sad I can not reproduce locally.]

Cheers,
Benjamin

