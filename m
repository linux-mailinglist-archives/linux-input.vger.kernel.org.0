Return-Path: <linux-input+bounces-10561-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E0EA4FB2D
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 11:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D89071885825
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 10:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F5E1F3D30;
	Wed,  5 Mar 2025 10:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xah4hXZa"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C99A86340;
	Wed,  5 Mar 2025 10:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741169200; cv=none; b=l7R1QQNBeE5gS/dfalWFOSG0trtNJtWyvPaQ1cC1Q3Nyb3AyizLQ8H2AHx1Rc45rrHB7LYk93hzYR3AKfWk2bW/cSo9Bj5UPPHvcBS+1Lnp1WRkwuA60ovghWjlV0AERCMYw7XHyzCboewOWc0rHd9XPGNJUk5aIbSYickZ4Onk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741169200; c=relaxed/simple;
	bh=qWiqRPWuWlcvad2jEzaD6pGE723pyQK05mb61fmkq+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTBwvf7+CmZ9UEAntmOKUZo44Cy/OFX07QCkF4nCwwfYYAwkzgKHK3XcKBXDyxIiUzsEh1r93+H9DcyaWokjCjpcci4R/hnb+2BXCzyBnO4U7QhK0LSUY12a+dKsLSnjKskjavQAWNJIOfrEvUwJ/gQAKo3NMIIHhKFYmUXpe6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xah4hXZa; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741169190; x=1772705190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qWiqRPWuWlcvad2jEzaD6pGE723pyQK05mb61fmkq+c=;
  b=Xah4hXZar118erhLAZvg2dH7Oc8hucFZCtyaiCaKcPKO/5JccuDrip9x
   gd3Y2t1n0TDBBZR4rpvye3uJ2P0H6jV6FjX6eX+ZzeJ6F9cYdcKAa5pen
   c3dYiW+5ZxKWFS4m8w05VoehywiyM6sanVwR8jXaarzE8GSbfxc/C3n9a
   mRW9ThW2zig3N08NXKtXIulrrCXDPnhfNZFuQtrayBtnTLDXKTtxdUBH3
   G9ZrFUmpLPikJ7Di8mutfdHLShWYB5HtlzpmOR9xK1Uh9IjsuW9HwuzBD
   qwrnDrBFZ0kkiB13f9pDzCtOQPyZ6nBsqwxc1nGoRNsy/Vjd4DCg9FmgF
   Q==;
X-CSE-ConnectionGUID: er82+ACWS/SR1kA8SCQzig==
X-CSE-MsgGUID: 5QKlYnXHRN+dcOtu7cMnlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45899832"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="45899832"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:06:29 -0800
X-CSE-ConnectionGUID: FXsqt1nlRAydAT8YsrBNEQ==
X-CSE-MsgGUID: tz7V+kYGSFGKTBL5/o0JjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="123240245"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:06:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tpldx-0000000HNT4-1B8J;
	Wed, 05 Mar 2025 12:06:25 +0200
Date: Wed, 5 Mar 2025 12:06:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v1 0/4] Input: Increase size of phys in the drivers
Message-ID: <Z8giINd3FySw44UO@smile.fi.intel.com>
References: <20250228121147.242115-1-andriy.shevchenko@linux.intel.com>
 <Z8bulFaTKJ06YLrL@smile.fi.intel.com>
 <Z8f63ImfQMB-Wp5R@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8f63ImfQMB-Wp5R@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 04, 2025 at 11:18:52PM -0800, Dmitry Torokhov wrote:
> On Tue, Mar 04, 2025 at 02:14:12PM +0200, Andy Shevchenko wrote:
> > On Fri, Feb 28, 2025 at 02:07:43PM +0200, Andy Shevchenko wrote:
> > > The drivers are using local member of 32 bytes to hold up to 40 (one-byte)
> > > characters. GCC complains on that. This series fixes the issue in the affected
> > > input drivers. Note, this is currently the biggest part of the warnings that
> > > are being treated as errors with the default configurations on x86. With this
> > > being applied we become quite close to enable CONFIG_WERROR=y (which is default
> > > and basically reverted) in CIs. Clang, OTOH, has currently no issues with that.
> > 
> > Would be nice to have a comment on this rather sooner as this impacts
> > the compilation by `make W=1` with WERROR=y (which is default).
> 
> I do not like the change.

Independently on your opinion in this case GCC is correct.
We are trying to squeeze up to 40 bytes into 32-byte storage.
I.o.w. GCC can't prove that and reader of the code can't prove
that either.

> There are no bugs, only GCC being paranoid.

I'm not so sure. But probably it works because the user space is parsing full
"inputX" string in the names

> Are there any other ways to shut it up? In [1] Jeff says that switching
> to scnprintf() shuts GCC up...

I do not like this, because it's just a hiding the problem and not solving it.
At some point GCC may start issuing warning on those cases as well when it
realizes the above. If you like that solution, please fix in that way. We have
4 drivers break the compilation currently.

> [1] https://lore.kernel.org/r/Z3rIvp0hzS+yzvJA@nixie71

So, consider this series as a bug report that prevents compilation.
I would expect somebody to fix this rather sooner than later.

-- 
With Best Regards,
Andy Shevchenko



