Return-Path: <linux-input+bounces-13424-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 866EAAFCFB7
	for <lists+linux-input@lfdr.de>; Tue,  8 Jul 2025 17:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35A1B3B0BE8
	for <lists+linux-input@lfdr.de>; Tue,  8 Jul 2025 15:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0414B2E11C0;
	Tue,  8 Jul 2025 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OX8MaRQ3"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04481E9B08;
	Tue,  8 Jul 2025 15:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751989872; cv=none; b=tuVlIFhyk80EmriY5vs83dJ6ddotu7XAeSbn6++GHfjWz3lFu6uFmGOAp/AnzvmjsuoSPLbxLxhmDesp6T4tY7XcJ107oFOauhLHRmkcccge/JrVFS8VxWoNj6sV1dMOK6QELqN0LdL6wEHbOVWc8HHIZvwTfsn6qHf8GDSsd7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751989872; c=relaxed/simple;
	bh=7NdUOErojvHNX9gChvdW4eAZDmPSYHoXjnk1sVkHlg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/ntbUu4IHS7bnl2kgAAfKNNp9eGNhmDEgRlnNcRvCbShyn135Ni0P39t+vzV4SdbHPBu7yUfq/or62rwQYLfjUJC/R2iiYkwV+INciqgezPAtS4dixc4XDczj9fNhEmL0cdqUkxq/Do5anjxMQcrWJWDrz9Y4b+Hx3b1EmZs10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OX8MaRQ3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45ACFC4CEED;
	Tue,  8 Jul 2025 15:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751989872;
	bh=7NdUOErojvHNX9gChvdW4eAZDmPSYHoXjnk1sVkHlg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OX8MaRQ3noSf0G6QiWBWSEdlj18E+WpLD28IJ/pp9NPDgA1HYekxxQIEVFSb9slrT
	 LVHmh6bI12LQXSiPci7TKlIIcqV5Fi9Mlq18r70UGc0FWWhDHmZejMkUuSXKqPPAhb
	 i2yVpdiCJUENb0h219WMWg9FDa7jX4i81pWSl3ZC2vA1Ptk+cfjsnW1q3qYoX890+Z
	 zNYFGfsZProo3O3o9sMeEOP01KXxfckx0ugY9LQnTg157eO85uxadog414HPC6DlME
	 jPCkd4VjO/T3ijeBkLfX1k8BCQLzIDMIWFe95cvfi+igQOoIN43v5X7j6i9b46HgaD
	 G1p0fzpU6CLVw==
Date: Tue, 8 Jul 2025 17:51:08 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Serious bug in HID core
Message-ID: <drcvdlw2kpuvsbact2gy4hvqp2i3au3shv5ozp3qms7qdfvi7t@7jofrodxeimb>
References: <c75433e0-9b47-4072-bbe8-b1d14ea97b13@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c75433e0-9b47-4072-bbe8-b1d14ea97b13@rowland.harvard.edu>

Hi Alan,

On Jul 08 2025, Alan Stern wrote:
> Jiri and Benjamin:
> 
> Investigating a recent bug report from syzbot 
> (https://lore.kernel.org/linux-usb/686be237.a70a0220.29fe6c.0b0c.GAE@google.com/)
> led me to a rather serious error in the HID core.  It could affect a 
> lot of drivers, and I don't know enough about them or the HID subsystem 
> to fix it right away.
> 
> In short, does the value returned by hid_report_len() count the byte 
> reserved for the report ID number?

It depends :)

See your analysis below...

> 
> Some drivers seem to assume that it does and some seem to assume that it 
> doesn't.  Here's what the actual code from include/linux/hid.h does:
> 
> /**
>  * hid_report_len - calculate the report length
>  *
>  * @report: the report we want to know the length
>  */
> static inline u32 hid_report_len(struct hid_report *report)
> {
> 	return DIV_ROUND_UP(report->size, 8) + (report->id > 0);
> }
> 
> It's somewhere in between -- it includes the ID byte in the count if and 
> only if the ID is nonzero!  And of course, this behavior isn't mentioned 
> in the (ungrammatical) kerneldoc.

Yeah, the docs are bad. But your analysis is correct: for a given
report, its size might include or not the report ID.

This is because the report ID is optional in the HID spec, and some
devices don't make use of it. Those devices are only exporting one
report type, and can not have another report type in the same HID
device. If a device needs to have more than one, it then needs to export
the report ID in all of its reports, and then report_len count that
extra byte.

To give you an example, old mice (or inexpensive ones), would export a
report with:
- X, Y, Wheel, B0, B1, B2

When a more advanced one might export:
- REPORT ID 0, X, Y, Wheel, B0, B1, B2, ... B9
- REPORT ID 1, SOME_VERY_COMPLEX_CONFIGURATION, ANOTHER ONE, ETC...

However, a HID device making use of the non report ID version can never
make use of a report ID (or it's custom proprietary protocol).

> 
> The particular scenario causing the bug found by syzbot was this: 
> report->size was 0, report->id was 0, and the lower-level driver (usbhid 
> in this case) assumed that the length argument (which was 0) did include 
> the ID byte.  Since the ID was 0, the driver skipped over the first byte 
> of the buffer and decremented the length, causing the length to 
> underflow and leading to an invalid memory access.  In a more realistic 
> setting, this would merely result in data loss and leakage.

That scenario is bogus (like most of syzbots in the HID space). There
should be no way the HID subsystem allows a report->size of 0 to be used
in a set_report or a get_report. So that's where the bug lies: HID
trusts too much the device, and can lead to that kind of issues.

> 
> How should this be fixed?

We have 2 problems here:
- and __hid_request or __hid_raw_request should reject a null size
	report, and in the __hid_request case, a report of size 1 if there is
	a report ID.
- Why is hidinput_change_resolution_multipliers() even considfering this
	report of size 0 when it should at least ensure that there is one
	field within the report

The first one should be easy to fix: add a bunch of checks.
__hid_hw_raw_request() seems to not expose the problem actually.

The second one would need a little bit more understanding of the fake
report descriptor provided by syzbot.

> 
> Related issue: When the lower-level driver's raw_request() routine is 
> called, can it assume that the first byte of the output buffer always 
> contains the report ID number, set by the HID core?  If not, should it 
> assume that the first byte is always reserved for the ID, or that the 
> first byte is reserved only when the ID is nonzero?

The first byte should always be reserved to the report ID, and is
populated by 0 by hid-core when the report ID is not in use.

So the usbhid driver is doing the right thing. In case there is no
report ID, it ignores the first byte when making a request to the
device, because in my example above, the device would not expect the
first byte to be 0.

> 
> Do __hid_request() and __hid_hw_raw_request() behave the same way in 
> this regard?

__hid_hw_raw_request() ensures that there is a minimum length of one, so
we should be fine. __hid_request apparently is the only one giving too
much trust in the report.

Cheers,
Benjamin

> 
> Alan Stern

