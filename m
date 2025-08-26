Return-Path: <linux-input+bounces-14308-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EBCB359E4
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 12:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EE0B7B4971
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 10:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E051322754;
	Tue, 26 Aug 2025 10:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAmFr3g4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AF6321424;
	Tue, 26 Aug 2025 10:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756203190; cv=none; b=oyRztpWd8VTPQ4utmKc0LtQjbdeVEEyUJXnYzHfkbM9zJYcYD34IPC0NtnW+yNIVTSOfYNyP/yNWG+ELhRlyblcY4P37mGNfBIL44DsJVr+cdSWbellTx5d8htlhcGFhhu1kYmgMVTqV/mh+Eu8Gw7rbowq/Wu0J3r+LE6iV3uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756203190; c=relaxed/simple;
	bh=IzQCsgXlLZGoZQsCzG0kx9aOUykpgsxp7zOGNExh1CQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHmMRDzBjRyhUrb01GqClhjhV/YhNKeQmHuxkxQ/Jr4QkIt8BFyQAI7GXUTxdLeZdA4zuaI1sgnZWgNsqFFWqew0k1+iTgZW3L51fBSSPeHd49KOG2QpexF/jqwp8ZXKqShqSva03cgnEbsw2kEF7TfqggAnA0ETF+YELUUbu1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAmFr3g4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2199C4CEF1;
	Tue, 26 Aug 2025 10:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756203190;
	bh=IzQCsgXlLZGoZQsCzG0kx9aOUykpgsxp7zOGNExh1CQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hAmFr3g42LFFpR8qzbG27133SNq2CSboup8U7MOF3oM7ZBC/eQZ10Dj8HaSHmuK8J
	 cAvK3yB6fRtr+R0uO+xU1/47Ioee9DlTERsK1pJHU+MjfTxb7VkGiD607hkdqvrBhy
	 D7XmroNh75JJRykvQROiIHUOgtSUiLB1MHGEvT3R+VQfMsF+7B+J/nwSyESBEqWesl
	 enPAY+IaBxv5h1jFelpnRGgDiYAmmqudXlzDFY3TURWNN6cR8wgATEJew2lab8uSMm
	 yJGYKZVC0+n2HjrFO6W8Z9GYG3opZCsN2o0NgTwUzpOkllU8KP6pMPNOnYvg0GlpvT
	 FisZVVZeI9qEw==
Date: Tue, 26 Aug 2025 12:13:05 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Peter Hutterer <peter.hutterer@who-t.net>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: tighten ioctl command parsing
Message-ID: <kz7sxu75acvqtk7crx4ftflt6hmbtf4znq6vx7jkcngsa5x6sl@6ujiniek3fli>
References: <20250711072847.2836962-1-arnd@kernel.org>
 <tsvy2y4x7xaut6y7fykuc7ltdf777rt2g32zt2biagts6hgjub@iidwntp527og>
 <e0557372-b029-4831-8d32-c1eb512ac736@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0557372-b029-4831-8d32-c1eb512ac736@app.fastmail.com>

On Aug 22 2025, Arnd Bergmann wrote:
> On Thu, Aug 21, 2025, at 08:56, Benjamin Tissoires wrote:
> > On Jul 11 2025, Arnd Bergmann wrote:
> >>
> >> +			break;
> >> +	}
> >>  
> >> +	hid = dev->hid;
> >> +	switch (cmd & ~IOCSIZE_MASK) {
> >
> > Jiri pinged me about this one, and I gave it a go with the existing
> > tests I have in selftests... and turns out that this changes the logic
> > of the ioctl processing.
> >
> > The removed block was in the default section of the switch/case
> > statement. Now it's added *after*, meaning that any ioctl that was
> > normally processed before are now caught in the default of the switch
> > statement below and return -ENOTTY.
> >
> > Running tools/testing/selftests/hid/hid_bpf showed that.
> 
> Ah, of course, thanks for checking and describing the issue.
> 
> Did you already come up with a fixed patch? I'm currently
> travelling and won't be able to send a v2 quickly, so if you
> have a version that works for you, let's use that instead.
> 

I spent yesterday trying to find a way to make the old behavior looks
the same than the new, and got a rather big rewrite of your patch. I'll
send this out as a v2, keeping your From and SoB, but please shout if
you are unhappy with those 2 tags.

Cheers,
Benjamin

