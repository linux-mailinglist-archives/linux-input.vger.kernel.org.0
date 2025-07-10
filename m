Return-Path: <linux-input+bounces-13454-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92223AFFE34
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 11:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 936BC1895BDE
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 09:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BFBA2D3A9E;
	Thu, 10 Jul 2025 09:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sWnJidI3"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D939B2877F6;
	Thu, 10 Jul 2025 09:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752140018; cv=none; b=Af/IHCTG85zyE4LeWRv3TW2vYRHPPpvD3RzUZBiwxWwdbxfEtLCW09X2a/pnjCJjwRo6vVkeI3h20t++DqKWCt0DEU25ANuqfvymEXUufZ9/dpsZZRFevklVw1uKDr2Plmj5Yb1VEvQmZypUxawqAvsoyS77mUsNoghfB2DuNt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752140018; c=relaxed/simple;
	bh=KmhZOyeonoSnCCdCip7QzoSfZQKgNdgYKLLYy5aEzc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeL7gveyl2e0UnRM7o9qSMIQOhs3zW7Bc/IXSzz2IyngnWX7TKO34fL7DaYVr3z0jkqr3oUSbRFtP/mizU98G4fiqwRflOzCjjgzGzQ0FZGve6tFaN/fmublXmxJViLXb3SyTDm34Jwn8dp1+s7IIHNyDzO1dTRot/eSFiVecXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sWnJidI3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DA3C4CEE3;
	Thu, 10 Jul 2025 09:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752140018;
	bh=KmhZOyeonoSnCCdCip7QzoSfZQKgNdgYKLLYy5aEzc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sWnJidI3a3m7WypSxwiLLjCaxAJYYx+DIOg4QhJShmOHhFwean3VchVze2Q36MgQ1
	 i1xlXLMZWwopijU0LYYUuG6QZRXk4a/EXehid1SWo3Zo+5Wc6pmD6PHkhz4jDymBmz
	 vVsjlmdhSd9ccAlDfuTWPjV76ZrZYLjruQkQwjCUb8sBNqQDBowFPE1522F8QBbY2U
	 dcAn5ZYyQ5dZwG1bi0irnf3vmAYl9cQ7SWRkc4XyCq3UsnRRM7tRiDUyV7uDdxf/EU
	 uNS6X9FWikT88AH8XIqGwy6gfktaYIzpJY4VUYbHBym7GQ0Dp5lhut1CfkCCNwk030
	 s8IZwF31+3dsQ==
Date: Thu, 10 Jul 2025 11:33:34 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Serious bug in HID core
Message-ID: <kznazb2qsnraamfi2xuaztryg6yw77ko5wnrezl6yzjwu7vdpl@l4u67yhov327>
References: <c75433e0-9b47-4072-bbe8-b1d14ea97b13@rowland.harvard.edu>
 <drcvdlw2kpuvsbact2gy4hvqp2i3au3shv5ozp3qms7qdfvi7t@7jofrodxeimb>
 <e3a58c95-9501-4ec8-902e-2a73402d1fe3@rowland.harvard.edu>
 <5rkp3gbrqvsdgia57eyw65jnu4wmpx6sbk47kmv4akmz2q7nzz@clqgtjfk2qxk>
 <b18af9f1-e3d8-429a-b313-38cc279e0f87@rowland.harvard.edu>
 <rwo5cqptiqarvl7qhgapao2uld3aqs27llhtqm5crop3v3rx64@j7h64nqsv6rv>
 <25b196f4-7362-4136-b5b9-bd53d1cc1c48@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25b196f4-7362-4136-b5b9-bd53d1cc1c48@rowland.harvard.edu>

On Jul 09 2025, Alan Stern wrote:
> On Wed, Jul 09, 2025 at 05:35:41PM +0200, Benjamin Tissoires wrote:
> > On Jul 09 2025, Alan Stern wrote:
> > > On Wed, Jul 09, 2025 at 10:44:35AM +0200, Benjamin Tissoires wrote:
> > > > On Jul 08 2025, Alan Stern wrote:
> > > > > On Tue, Jul 08, 2025 at 05:51:08PM +0200, Benjamin Tissoires wrote:
> > > > > > The second one would need a little bit more understanding of the fake
> > > > > > report descriptor provided by syzbot.
> > > > > 
> > > > > I suppose we can get the information from syzbot if it's really 
> > > > > necessary.  But it seems to be a minor point.
> > > > 
> > > > Well, to me it's important because I can get an easier reproducer and
> > > > add this corner case in the HID test suite :) Not to mention the
> > > > understanding on how we can get to this corner case.
> > > 
> > > I can get it for you if you really want to see it.  It's just a question 
> > > of asking syzbot to run the reproducer with a patch that prints all the 
> > > report descriptors.
> > 
> > I would very much appreciate that :)
> 
> Here's the output from syzbot, with all the extra fluff removed:
> 
> 	96 01 00 06 01 00 03 00 00 00 00 2a 90 a0 27 00
> 	00 00 00 b3 81 3e 25 03 1b dd e8 40 50 3b 5d 8c
> 	3d da
> 
> This is the full USB report descriptor contents.  Hopefully you have a 
> tool that can translate these byte values.
> 

Thanks a lot. After a little bit of trial/errors, I managed to reproduce
locally.

The parsed report descriptor is the following:

        0x96, 0x01, 0x00,              # Report Count (1)                    0
        0x06, 0x01, 0x00,              # Usage Page (Generic Desktop)        3
        # 0x03, 0x00, 0x00, 0x00, 0x00,  # Ignored by the kernel somehow
        0x2a, 0x90, 0xa0,              # Usage Maximum (41104)               6
        0x27, 0x00, 0x00, 0x00, 0x00,  # Logical Maximum (0)                 9
        0xb3, 0x81, 0x3e, 0x25, 0x03,  # Feature (Cnst,Arr,Abs,Vol)          14
        0x1b, 0xdd, 0xe8, 0x40, 0x50,  # Usage Minimum (1346431197)          19
        0x3b, 0x5d, 0x8c, 0x3d, 0xda,  # Designator Index                    24

(as expected, full of garbage, and just one Feature report, no Input
report).

And to trigger the bug, I need to actually set the VID/PID to the one
from the syzbot report (0x045e, 0x07da).

With that, I have now:
[    2.425586] __hidinput_change_resolution_multipliers report->size: 0 drivers/hid/hid-input.c:1912

Which means I can play around with this now.

Cheers,
Benjamin


