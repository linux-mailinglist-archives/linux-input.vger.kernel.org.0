Return-Path: <linux-input+bounces-13595-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 594B8B0AED7
	for <lists+linux-input@lfdr.de>; Sat, 19 Jul 2025 10:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA49E3BD974
	for <lists+linux-input@lfdr.de>; Sat, 19 Jul 2025 08:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB6C2367B2;
	Sat, 19 Jul 2025 08:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WmeuNlDE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D597C881E;
	Sat, 19 Jul 2025 08:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752914456; cv=none; b=EtMDFDWi7Awvm4CpYpltlD2RTt2J42GN58xtHOm50p5iniRzEcPrj9ALPhGMDlnGqRwBi+hT3CwoAkalAwmcugdbud23UZGMinfnzING9Ho1afo3tqMlzxy0hfiCgjGN77khdxg1K8zS6Yoeu0GKyXNnA4UwvTy5NWGO3ltkU0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752914456; c=relaxed/simple;
	bh=4LiPHafqTK8MKYl8l+ASMTLJ7oaDQeMUGtyxkPsbkk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iplFjOSs9OooLTEqMFjjauQGwqTFiBK7PS2UaCxEjjQVbtp+4tf23+WjNRhj0CyKtkA40jwxM+1/0Qw5EKzywG6gHgw3toqIzDlKLw3dv1pNzDRLFunoDtNVxNde6JLd70/NVrIDaOPwy3FXc1A83FMZYXNXpOtH3KXYXzShj78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WmeuNlDE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82BBC4CEE3;
	Sat, 19 Jul 2025 08:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752914455;
	bh=4LiPHafqTK8MKYl8l+ASMTLJ7oaDQeMUGtyxkPsbkk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WmeuNlDESf+E1oXdS4RuKIlTQbNrqaywHHDDrTwCZXX9idLXQRWy/dJ833TH7KxKQ
	 44rt7v17s37POTGtRsM3+gZCKslSXlf2121z7Cw6ghjY0BQBUueVhDRpbTAYEbofIi
	 S3QBhFffawEz79Rxgeq/XHoval/PMkJpOCFl+kT2F3NdKrTM7+2BUd3sRBC42Ht+3y
	 zFwL8Qh3cm1DMY34lCjluL9LUS4u5nyJ0z5dvJofMU5VIu5n7IBipHSOvWMP8kDVdZ
	 m7oO6w7F0FWMNbsviRlJ8YVR0OmufKxIXtZSBIYWHoismMloDQjZe7QvTZUyEcsK6m
	 008ZcmWBKmyUA==
Date: Sat, 19 Jul 2025 10:40:51 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>, 
	jikos@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] HID: core: Reject report fields with a size or count of 0
Message-ID: <mcigin2behhkoiq3dzgpjqjyqynskn4kgvuympi55wnlr3nud6@yuljmwr2zlfp>
References: <68791b6f.a70a0220.693ce.004b.GAE@google.com>
 <8a4eb6b0-f640-4207-9f05-83e06080410b@rowland.harvard.edu>
 <lrhydvc7huuqck2kvqzobqt7hhwt36zwsa2i3fpegbpykt5q43@2md6gfitjlb3>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lrhydvc7huuqck2kvqzobqt7hhwt36zwsa2i3fpegbpykt5q43@2md6gfitjlb3>

On Jul 19 2025, Benjamin Tissoires wrote:
> On Jul 17 2025, Alan Stern wrote:
> > Testing by the syzbot fuzzer showed that the HID core gets a
> > shift-out-of-bounds exception when it tries to convert a 32-bit
> > quantity to a 0-bit quantity.  This is hardly an unexpected result,
> > but it means that we should not accept report fields that have a size
> > of zero bits.  Similarly, there's no reason to accept report fields
> > with a count of zero; either type of item is completely meaningless
> > since no information can be conveyed in zero bits.
> > 
> > Reject fields with a size or count of zero, and reject reports
> > containing such fields.
> > 
> > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > Reported-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/linux-usb/68753a08.050a0220.33d347.0008.GAE@google.com/
> > Tested-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
> > Fixes: dde5845a529f ("[PATCH] Generic HID layer - code split")
> > Cc: stable@vger.kernel.org
> > 
> > ---
> > 
> > The commit listed in the Fixes tag is not really the right one.  But
> > code motion made tracking it back any further more difficult than I
> > wanted to deal with, so I stopped there.  That commit is from 2006,
> > which is already far enough in the past.
> > 
> >  drivers/hid/hid-core.c |   15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> > 
> > Index: usb-devel/drivers/hid/hid-core.c
> > ===================================================================
> > --- usb-devel.orig/drivers/hid/hid-core.c
> > +++ usb-devel/drivers/hid/hid-core.c
> > @@ -313,7 +313,14 @@ static int hid_add_field(struct hid_pars
> >  	}
> >  
> >  	offset = report->size;
> > -	report->size += parser->global.report_size * parser->global.report_count;
> > +	i = parser->global.report_size * parser->global.report_count;
> > +	if (i == 0) {
> > +		dbg_hid("invalid field size/count 0x%x 0x%x\n",
> > +			parser->global.report_size,
> > +			parser->global.report_count);
> > +		return -1;
> > +	}
> > +	report->size += i;
> >  
> >  	if (parser->device->ll_driver->max_buffer_size)
> >  		max_buffer_size = parser->device->ll_driver->max_buffer_size;
> > @@ -464,7 +471,8 @@ static int hid_parser_global(struct hid_
> >  
> >  	case HID_GLOBAL_ITEM_TAG_REPORT_SIZE:
> >  		parser->global.report_size = item_udata(item);
> > -		if (parser->global.report_size > 256) {
> > +		if (parser->global.report_size > 256 ||
> > +				parser->global.report_size == 0) {
> >  			hid_err(parser->device, "invalid report_size %d\n",
> >  					parser->global.report_size);
> >  			return -1;
> 
> Sigh... I applied this one too quickly before going on holidays.
> 
> This breaks the hid testsuite:
> https://gitlab.freedesktop.org/bentiss/hid/-/jobs/80805946
> 
> (yes, I should have run it before applying).
> 
> So basically, there are devices out there with a "broken" report size of
> 0, and this patch now entirely disables them.
> 
> That Saitek gamepad has the following (see tools/testing/selftests/hid/tests/test_gamepad.py):
>         0x95, 0x01,                    # ..Report Count (1)                  60
>         0x75, 0x00,                    # ..Report Size (0)                   62
>         0x81, 0x03,                    # ..Input (Cnst,Var,Abs)              64
> 
> So we'd need to disable the field, but not invalidate the entire report.
> 
> I'm glad I scheduled this one for the next cycle.
> 
> I'll try to get something next week.
> 

In case you are interested in fixing this, a quick reproducer can be
done through virtme-ng:

$> vng --verbose --kconfig --skip-module --config tools/testing/selftests/hid/config
$> make -j8
$> vng -v --user root --exec "mount bpffs -t bpf /sys/fs/bpf ; pytest ./tools/testing/selftests/hid/tests/test_gamepad.py -v -x --color=yes -k Saitek"

Cheers,
Benjamin

