Return-Path: <linux-input+bounces-13664-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8ECB0EE7B
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 11:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D462B546E6A
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 09:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A96327E079;
	Wed, 23 Jul 2025 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnufFwsv"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECA51C84D0;
	Wed, 23 Jul 2025 09:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753263141; cv=none; b=BTbvWI3Do07t+vjX5rdMkgy4pm/DKgXcSc40vvs2BsCY3guOEvKuDPB2bWp8qK1D2AxFSQXP38to0pfkjBZCxLWxeF+YLdo3CCEtthk/+3FjU7YsajWT5tVbSC9D9z8WGtyEomrFUByUXcaUq9asZQ2vaIA2N/Tm7LcmELH34UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753263141; c=relaxed/simple;
	bh=VAILaPd6nBnwY1RmU2BFZxST8YPq75mfdT1tCy/Ki2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hU6U5gfUVHPha7xQHCxRW5httMHvTlN2HAGR0PlCEa9ofdf1jCkD3Ur2UwB02ZiwJ1DwYL36YHA/BuASzea6bvPCVm9Ts6svsrGgRcqB0BPF5iWkNtNJBFRaecBpgmto/BhqTea+Kk3jfgRuudPNohMXAWQpNDAhD2avSSoeHZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnufFwsv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D9EC4CEF4;
	Wed, 23 Jul 2025 09:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753263138;
	bh=VAILaPd6nBnwY1RmU2BFZxST8YPq75mfdT1tCy/Ki2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZnufFwsvby3EUHi8G66LPXd83iTs2bNT5ZtWBcECbEL1NFTQ4wPQVdWcgh6IgUJ1B
	 vQ5Y+w3ExxNcIL0bV9wzz8132Fgx8JDJXHS0BdBqQmsHBaqygUJSinBbyr6YKcWOil
	 puC6+qj9Go9yBAr8lTdHx7XuQ0OhfHg6l8Ojg1RxrGUs8ZHoWY0cn0FNvm2cAHtsH+
	 GixdoOJWqxtfdzJ7AZSm7AF9sd6By96LAbXmym/noCJTGhkO0jeRPgnfWvBnSEXZBa
	 MFD5BuEIU4QxKWqXz77iL7nH2kXVQuZ/HCR5pRzY5KPSmlQcWN1abfomoxC0F/lO5u
	 QEM1r5vr+mkJA==
Date: Wed, 23 Jul 2025 11:32:14 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>, 
	jikos@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] HID: core: Reject report fields with a size or count of 0
Message-ID: <34ks6futbrmunsq2tbz75jwqg64lpk4pg6udbbk3yo2exm657b@3fivbjjdcyl4>
References: <68791b6f.a70a0220.693ce.004b.GAE@google.com>
 <8a4eb6b0-f640-4207-9f05-83e06080410b@rowland.harvard.edu>
 <lrhydvc7huuqck2kvqzobqt7hhwt36zwsa2i3fpegbpykt5q43@2md6gfitjlb3>
 <a2c3537a-8ddc-467f-a9f4-b4d413914914@rowland.harvard.edu>
 <voiysrjm3okjtaz7axqupr2jk5yyvxsqgagbwrsey4z24g6rf4@xb75ss3bwol5>
 <bd033800-53f0-4d5a-a52b-b0e01ac48c12@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd033800-53f0-4d5a-a52b-b0e01ac48c12@rowland.harvard.edu>

On Jul 21 2025, Alan Stern wrote:
> On Mon, Jul 21, 2025 at 03:05:58PM +0200, Benjamin Tissoires wrote:
> > > So then would it be better to accept these report fields (perhaps with a 
> > > warning) and instead, harden the core HID code so that it doesn't choke 
> > > when it runs across one of them?
> > > 
> > 
> > Yeah, that seems like the best plan forward.
> > 
> > [sorry on reduced setup for the next 3 weeks, so I can't really debug
> > the entire thing now.]
> > 
> > Though, we should probably not annoy users unless we are trying to do
> > something that won't be needed. I doubt that Saitek gamepad will ever
> > call the faulty functions, so why putting an error in the logs when it's
> > working fine?
> 
> All right.
> 
> Probably the best way to do this is simply to revert the commit that's 
> already applied and then merge a new patch to harden the core.  Would 
> you like me to post the reversion patch or do you prefer to do it 
> yourself?

Given that the faulty commit is on top of for-6.17/core, I can simply
force push to the parent, and also force push the for-next branch. That
should do the trick.

Can you post your s32ton fix on top of that then?

Cheers,
Benjamin

