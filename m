Return-Path: <linux-input+bounces-11786-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A6FA8A29F
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 17:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FE407A4B6D
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 15:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86BC1F416A;
	Tue, 15 Apr 2025 15:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VzDXicC1"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F781E1C2B;
	Tue, 15 Apr 2025 15:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744730514; cv=none; b=CpWq4h1q2LItEZXzTGPaB//zc+Zx9hxvxaZcWao5hJvPbaHKjCIj9tPoS+uFYDQjDfnYrtl1JdhqBEnKI0ayx+7Yl74wCEMezZ+IfzEG+4gMMV5JnDSElb4EFeLr6rofyLD+XMVi+M4rX124uRoJlt9LMTwQJC/ds3J4Be22YME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744730514; c=relaxed/simple;
	bh=nSgOXEwj53DRpt0VM3PBWBpPuMMiDEbUSyXxx0hDvis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ldF3xVE2qEJ9d5KYvoyZJQMcXXVGU54H+zDB0y3/kHym7tTXWCIYAsh42e3sJFCcI7yvZ+cIHIhDEfL1ALDcYGqBWFnHZmRG5/n4O6vuChoylsgJmAOnt1qqd24Bpb8JB1Ul2vTxswPH1RayKq4N7cN2VjGw1W7BbwnfK78UUsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VzDXicC1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B1EC4CEEB;
	Tue, 15 Apr 2025 15:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744730514;
	bh=nSgOXEwj53DRpt0VM3PBWBpPuMMiDEbUSyXxx0hDvis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VzDXicC1nr+hACB6teiknf6LfW34EStb67ajHC8PrLltLzjcexH4K+Hv8Xa8qUaKU
	 jmep8gm3iPFAbZZQydFOPW5K0dIY6ZlJWHBm7TSGVGTz4sMJYl1rLKCns376MsNf9B
	 uIzCqxvrGg8X4IXUtpvBAVNuJqmLxeDjFg8fDF3EUJuqprH8SQqlBPTOCt7KWvCfP1
	 8Cbb+QAWpYoAsir1+uad0gy/iguqM9HVPnGUyReUgJf4ZXLwE8WPtLQw8Jl5hoxJe6
	 OOrkr3nJ6zuQozL9yLgyCoF5A63aRCOzJQ33CAnPdW8MaOZuAVxC0RnuSbl0SJdqhr
	 aFCLLiv+iPbeQ==
Date: Tue, 15 Apr 2025 08:21:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] HID: simplify code in fetch_item()
Message-ID: <20250415152149.GB995325@ax162>
References: <ZvwYbESMZ667QZqY@google.com>
 <20241010222451.GA3571761@thelio-3990X>
 <Z_yrjPBO_CPS8WX1@black.fi.intel.com>
 <20250415003326.GA4164044@ax162>
 <Z_4ApoWzgWSovgRi@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_4ApoWzgWSovgRi@smile.fi.intel.com>

On Tue, Apr 15, 2025 at 09:45:58AM +0300, Andy Shevchenko wrote:
> On Mon, Apr 14, 2025 at 05:33:26PM -0700, Nathan Chancellor wrote:
> > On Mon, Apr 14, 2025 at 09:30:36AM +0300, Andy Shevchenko wrote:
> > > On Thu, Oct 10, 2024 at 03:24:51PM -0700, Nathan Chancellor wrote:
> > > > On Tue, Oct 01, 2024 at 08:42:36AM -0700, Dmitry Torokhov wrote:
> 
> ...
> 
> > > > Getting rid of the unreachable() in some way resolves the issue. I
> > > > tested using BUG() in lieu of unreachable() like the second change I
> > > > mentioned above, which resolves the issue cleanly, as the default case
> > > > clearly cannot happen. ...
> > > 
> > > As Dmitry pointed out to this old discussion, I have a question about the above
> > > test. Have you tried to use BUG() while CONFIG_BUG=n? Does it _also_ solve the
> > > issue?
> > 
> > Yes because x86 appears to always emit ud2 for BUG() regardless of
> > whether CONFIG_BUG is set or not since HAVE_ARCH_BUG is always
> > respected.
> 
> Thank you for the reply. But do you know if this is guaranteed on the rest of
> supported architectures? I.o.w. may we assume that BUG() in lieu of unreachable()
> will always fix the issue?

I don't know. As far as I can tell, BUG() is always better than a bare
unreachable() because it is either the same as unreachable() if the
architecture does not define HAVE_ARCH_BUG and CONFIG_BUG=n (and in the
case of CONFIG_BUG=n, I think the user should get to pick up the pieces)
or when CONFIG_BUG=y and/or HAVE_ARCH_BUG is defined, the unreachable()
will truly be unreachable in the control flow graph because of the trap
or __noreturn from BUG(), so no undefined behavior. I think you would
only be able to find cases where BUG() was not sufficient to avoid
undefined behavior at runtime instead of compile time, as objtool only
supports loongarch and x86 right now and both ensure BUG() always traps.
I might be missing something though.

Cheers,
Nathan

