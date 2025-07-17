Return-Path: <linux-input+bounces-13581-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8E1B08BF0
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 13:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F0545805CE
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 11:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71F329AB02;
	Thu, 17 Jul 2025 11:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DEQRPLwg"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DB1288CAC;
	Thu, 17 Jul 2025 11:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752752926; cv=none; b=J/9IcoOX8HYmvAZ7ej3TyQI57W1TjJB4+liDteqvX6Hc7GdbYqZnUksawaz2tJnC4lcS5Ysq7M3E3mKmnJCcAh6C4L00LXLkbfuAS6ZIAjSftyhqrjafN1eSskKDZIVUgy1WlYcYigvWOHPk+Wa9k4xCX1yOJCDBKReyvR1Cr64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752752926; c=relaxed/simple;
	bh=GvQYWzAsi6ZMuordr5tQl/DqtBCsrBqMy6+E+fPs6GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSxxW9WcGFuwFKd/dHHY9J34CozCNTfAamb6A4+NWwpokGaaPXgBsN8Dv6BwUw/E91sDHUQy9c8KqgtBuCQbeWmNgly1VeUCd4OtWYwp8QoU3hhSz0mR/xsIQVGFOnfOMpwG+JwKoS89qdqMG4VNv0kMr2cQxxm4QITleKruCy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DEQRPLwg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A2E6C4CEE3;
	Thu, 17 Jul 2025 11:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752752925;
	bh=GvQYWzAsi6ZMuordr5tQl/DqtBCsrBqMy6+E+fPs6GQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DEQRPLwglx4FVLnL5WHZK51JhexHrE9jVAmZ68SGr2ehkbeT2pAYf3RQQX+Xn5utU
	 KMmZeR67/xkjUcfkBLZM5RQQX3fsOoue4RYiORcoXCT6Mo4AwWyYTKyIdMC2sWGtfz
	 ZOd0VJmIfoS3jCik06GyLmgG9+q8VFLXqlxU5FOjrhXFmPgBP6qDVrVbVK7o75RE/Z
	 oSGhizmCMlNs9deJsk9k7GBnx7lAemDBfbJfez5Ek7pA45RHQnATIB+wCBQLLDNmc1
	 5bCndVrfklRZAmCQWE9brlQt8yEBUeqebHOV6yeuT590Zv8oJ6dFaVyI3u6+L+rIhX
	 8NSe+Cnxg2S9Q==
Date: Thu, 17 Jul 2025 13:48:41 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>, 
	jikos@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in s32ton (2)
Message-ID: <zakga5qqql6zyat6wbnntm6tvcmhlhmjt5ecz6nm5hpc7z2iw7@mcpmrg7r4qlt>
References: <8bec1698-5008-428f-8e71-ec002def0c54@rowland.harvard.edu>
 <6876b0ec.a70a0220.693ce.0019.GAE@google.com>
 <78c3fb66-c30f-4c64-a499-61c1665186a8@rowland.harvard.edu>
 <d21dcce3-88ba-416c-9d18-ea47855c48fc@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d21dcce3-88ba-416c-9d18-ea47855c48fc@rowland.harvard.edu>

Hi Alan,

On Jul 16 2025, Alan Stern wrote:
> Benjamin:
> 
> On Wed, Jul 16, 2025 at 10:29:38AM -0400, Alan Stern wrote:
> > On Tue, Jul 15, 2025 at 12:50:04PM -0700, syzbot wrote:
> > > Hello,
> > > 
> > > syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> > > UBSAN: shift-out-of-bounds in s32ton
> > > 
> > > microsoft 0003:045E:07DA.0001: ignoring exceeding usage max
> > > microsoft 0003:045E:07DA.0001: unsupported Resolution Multiplier 0
> > > hid: s32ton: n 0 val 0 size 0x0
> > > ------------[ cut here ]------------
> > > UBSAN: shift-out-of-bounds in drivers/hid/hid-core.c:69:16
> > > shift exponent 4294967295 is too large for 32-bit type '__s32' (aka 'int')
> > 
> > Benjamin:
> > 
> > Clearly there's going to be trouble when you try to convert a signed 
> > 32-bit value to a 0-bit number!
> > 
> > My impression is that hid_parser_global() should reject Report Size or 
> > Report Count items with a value of 0.  Such fields would be meaningless 
> > in any case.  The routine checks for values that are too large, but not 
> > for values that are too small.
> > 
> > Does this look like the right approach?
> > 
> > Alan Stern
> > 
> > #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git c2ca42f1
> > 
> >  drivers/hid/hid-core.c |    6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > Index: usb-devel/drivers/hid/hid-core.c
> > ===================================================================
> > --- usb-devel.orig/drivers/hid/hid-core.c
> > +++ usb-devel/drivers/hid/hid-core.c
> > @@ -464,7 +464,8 @@ static int hid_parser_global(struct hid_
> >  
> >  	case HID_GLOBAL_ITEM_TAG_REPORT_SIZE:
> >  		parser->global.report_size = item_udata(item);
> > -		if (parser->global.report_size > 256) {
> > +		if (parser->global.report_size > 256 ||
> > +				parser->global.report_size == 0) {
> >  			hid_err(parser->device, "invalid report_size %d\n",
> >  					parser->global.report_size);
> >  			return -1;
> > @@ -473,7 +474,8 @@ static int hid_parser_global(struct hid_
> >  
> >  	case HID_GLOBAL_ITEM_TAG_REPORT_COUNT:
> >  		parser->global.report_count = item_udata(item);
> > -		if (parser->global.report_count > HID_MAX_USAGES) {
> > +		if (parser->global.report_count > HID_MAX_USAGES ||
> > +				parser->global.report_count == 0) {
> >  			hid_err(parser->device, "invalid report_count %d\n",
> >  					parser->global.report_count);
> >  			return -1;
> 
> This patch didn't work; the error message never showed up in the kernel 
> log.  Nevertheless, hidinput_change_resolution_multipliers() tried to 
> create an output report with a field having size 0.
> 
> How can this to happen without hid_scan_report() or hid_open_report() 
> running?  It shouldn't be possible to use a report before it has been 
> checked for validity.

It's just that the provided report descriptor was never setting a report
size or a report count. This way, we are stuck with the default value
from kzalloc: 0.

Basically, if your report descriptor is as simple as:
Usage Page (Generic Desktop)
Usage (X)
Usage (Y)
Report Count (2)
Input (Data,Var,Rel)

Then we would trigger this bug: "report Size" is never set and is thus 0.

Your patch is good though, as it is probably a good thing to prevent a
report size/count to be 0. But it's not addressing the issue here
because the only time we can check for those values is when we receive
an Input/Feature/Output value (or ranges), so in hid_add_field().

Cheers,
Benjamin


> 
> Alan Stern

