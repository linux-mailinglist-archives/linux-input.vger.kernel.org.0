Return-Path: <linux-input+bounces-13615-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CFFB0C4E2
	for <lists+linux-input@lfdr.de>; Mon, 21 Jul 2025 15:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 876C21AA5D7A
	for <lists+linux-input@lfdr.de>; Mon, 21 Jul 2025 13:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC84B2D8DDD;
	Mon, 21 Jul 2025 13:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdYs+X4d"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BEE2D879B;
	Mon, 21 Jul 2025 13:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753103163; cv=none; b=j1IvgbFyUi/eovfw6+1x+p894fdynalnBab+Nmd9tJ5i80XuMxzhztBkLsd4WtZnCozQiiSt+5inh8eV8MXuZntm2xwvQi1GeiV/i1hS3GH9Q3WN8poHhqTN8Gc0l3osMleENq/DCdPYMdlkHc55mhaeGxTAGn+Coo15hScowuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753103163; c=relaxed/simple;
	bh=5y/SPIhcQ32xOxHCc8KPUo//JIEXorkBL/QAsLR++bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pqM3BzyCHVnurs4ramFAm2cyvX88K5Z0U2PS5zJuivuFQ1wsuv9p3i3sNhLLjHY4Nn0JwVOmUs3TlGy0lNjqL+xW3QhlsWmRUM9bxANAOxHO81rdw+YCaKwznZqKSDCQEF1Pq9bdKehUZ9njlzfqyf6tsZuSFaNhYi54B2eUKyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdYs+X4d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D27C4CEED;
	Mon, 21 Jul 2025 13:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753103163;
	bh=5y/SPIhcQ32xOxHCc8KPUo//JIEXorkBL/QAsLR++bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gdYs+X4dXN5P+VMm/RfQumMFIVWPFTHEgGmWVxAe/AvzcxcXNj/Qy+a2GFvaA2ARL
	 WBgJx/tgdTdW78xOXrWEeSicW3/kjMNngNCq0x+fOBAs5SuSmJIJbg1NaI61hBi7LK
	 GUebBd1XfWXY9d0P99mbK4Ph7pN9F5ek/FLTgf19Ww5PEHS6v72IZFdMhJONS+pbxr
	 qOy33+MgpmwdZG2gN5jzYLmz1xZhxI8mr7j9IY8o8S83DIEkVIDQXSlAcGXDeMRLNT
	 GB2Y0UHbxV3PBmaqfDsuP63FehSLZmXBLWt7qKnIp34M3o4+xuKddxP8C9THifOK3U
	 aYRxeyCAwpYwQ==
Date: Mon, 21 Jul 2025 15:05:58 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>, 
	jikos@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] HID: core: Reject report fields with a size or count of 0
Message-ID: <voiysrjm3okjtaz7axqupr2jk5yyvxsqgagbwrsey4z24g6rf4@xb75ss3bwol5>
References: <68791b6f.a70a0220.693ce.004b.GAE@google.com>
 <8a4eb6b0-f640-4207-9f05-83e06080410b@rowland.harvard.edu>
 <lrhydvc7huuqck2kvqzobqt7hhwt36zwsa2i3fpegbpykt5q43@2md6gfitjlb3>
 <a2c3537a-8ddc-467f-a9f4-b4d413914914@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2c3537a-8ddc-467f-a9f4-b4d413914914@rowland.harvard.edu>

On Jul 19 2025, Alan Stern wrote:
> On Sat, Jul 19, 2025 at 10:36:01AM +0200, Benjamin Tissoires wrote:
> > On Jul 17 2025, Alan Stern wrote:
> > > Testing by the syzbot fuzzer showed that the HID core gets a
> > > shift-out-of-bounds exception when it tries to convert a 32-bit
> > > quantity to a 0-bit quantity.  This is hardly an unexpected result,
> > > but it means that we should not accept report fields that have a size
> > > of zero bits.  Similarly, there's no reason to accept report fields
> > > with a count of zero; either type of item is completely meaningless
> > > since no information can be conveyed in zero bits.
> > > 
> > > Reject fields with a size or count of zero, and reject reports
> > > containing such fields.
> > > 
> > > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > > Reported-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
> > > Closes: https://lore.kernel.org/linux-usb/68753a08.050a0220.33d347.0008.GAE@google.com/
> > > Tested-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
> > > Fixes: dde5845a529f ("[PATCH] Generic HID layer - code split")
> > > Cc: stable@vger.kernel.org
> 
> > Sigh... I applied this one too quickly before going on holidays.
> > 
> > This breaks the hid testsuite:
> > https://gitlab.freedesktop.org/bentiss/hid/-/jobs/80805946
> > 
> > (yes, I should have run it before applying).
> > 
> > So basically, there are devices out there with a "broken" report size of
> > 0, and this patch now entirely disables them.
> > 
> > That Saitek gamepad has the following (see tools/testing/selftests/hid/tests/test_gamepad.py):
> >         0x95, 0x01,                    # ..Report Count (1)                  60
> >         0x75, 0x00,                    # ..Report Size (0)                   62
> >         0x81, 0x03,                    # ..Input (Cnst,Var,Abs)              64
> > 
> > So we'd need to disable the field, but not invalidate the entire report.
> > 
> > I'm glad I scheduled this one for the next cycle.
> > 
> > I'll try to get something next week.
> 
> So then would it be better to accept these report fields (perhaps with a 
> warning) and instead, harden the core HID code so that it doesn't choke 
> when it runs across one of them?
> 

Yeah, that seems like the best plan forward.

[sorry on reduced setup for the next 3 weeks, so I can't really debug
the entire thing now.]

Though, we should probably not annoy users unless we are trying to do
something that won't be needed. I doubt that Saitek gamepad will ever
call the faulty functions, so why putting an error in the logs when it's
working fine?

Cheers,
Benjamin

