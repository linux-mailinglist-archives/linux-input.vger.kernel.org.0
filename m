Return-Path: <linux-input+bounces-11290-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE61A71417
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 10:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 954D8188F0BB
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 09:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F28185920;
	Wed, 26 Mar 2025 09:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fndLlXfR"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852F2157A48;
	Wed, 26 Mar 2025 09:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742982542; cv=none; b=ckyFocqrPGKD63HTEajX4r6m/+j8exPB4hOMf1l3afwJGRTKl9zYw81XVXgWZkm2JCCjsNF5aDL4qRrHjUyzShLEKtoXJp7lw2RqUAKWZmRxazBCtwdgbR4+ZT2m8O1ihT7+q6UMEPYZ27r/1IREYSTD/5583FiJmuiuEiXCF4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742982542; c=relaxed/simple;
	bh=iTmKVXNVrbXmkoY13hcoVf2uIStc1QDurP/RRq9AHYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ET49v21futqekhJtmgDOoJrSSXwUqK+YNYOtZ0y9zeI2PLTuEMOV2jo2fmTu47NurVyYaYk3yo137hJjlZJrScpiWKsJ8z1EwXBlK7GhepfhGN2duY8FrQOdoSBGdV13qnMoHLaP0xAbGRuszQuD4SatnAidsflAUbHoGREIqtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fndLlXfR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742982541; x=1774518541;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iTmKVXNVrbXmkoY13hcoVf2uIStc1QDurP/RRq9AHYs=;
  b=fndLlXfRXxLVn/OTetBX1uFL+DShV9rsCcuG2xUtJGvOnh3KP4VA9a8M
   2V6xfZ0k9deTrOVc7nwc1/GGW/9nd3FtV5YccdBVLaHeXi3LzzCdZ1Jia
   uTlM1xaTsiXPdBsBz7ee+3jvVLtnqy3adHJ6nBabbxNQgcL1A6uvbz/2b
   2/EGnHAH6y4Z3r4Ez/pTceY/vTwqqxYCRDsVZlJ+w9L98oFe5au+igJgg
   mwPOlo0Ti9loLN0SUUyNOpLjrQWoaDfyYZ1z+nlMl/Dt1+h8gR6JxlcjB
   WfvohxIgk+BiYQJDGbipmJpinxpnSKiEduP0yVKwqJwmH3Hrejownx5Ke
   w==;
X-CSE-ConnectionGUID: tkC0kEdKRrOWiu+axYGblw==
X-CSE-MsgGUID: IvZhKJNGRQmgTxkyVtoiPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="66717803"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="66717803"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 02:49:00 -0700
X-CSE-ConnectionGUID: xVWDOTWSSmm7Zbir545NcA==
X-CSE-MsgGUID: x02ymUKXTLCQ55lKwv7TNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="125227193"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 02:48:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1txNNY-000000061zb-1DJo;
	Wed, 26 Mar 2025 11:48:56 +0200
Date: Wed, 26 Mar 2025 11:48:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v1 0/4] Input: Increase size of phys in the drivers
Message-ID: <Z-PNiLByle1-9dib@smile.fi.intel.com>
References: <20250228121147.242115-1-andriy.shevchenko@linux.intel.com>
 <Z8bulFaTKJ06YLrL@smile.fi.intel.com>
 <Z8f63ImfQMB-Wp5R@google.com>
 <Z8giINd3FySw44UO@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8giINd3FySw44UO@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 05, 2025 at 12:06:25PM +0200, Andy Shevchenko wrote:
> On Tue, Mar 04, 2025 at 11:18:52PM -0800, Dmitry Torokhov wrote:
> > On Tue, Mar 04, 2025 at 02:14:12PM +0200, Andy Shevchenko wrote:
> > > On Fri, Feb 28, 2025 at 02:07:43PM +0200, Andy Shevchenko wrote:
> > > > The drivers are using local member of 32 bytes to hold up to 40 (one-byte)
> > > > characters. GCC complains on that. This series fixes the issue in the affected
> > > > input drivers. Note, this is currently the biggest part of the warnings that
> > > > are being treated as errors with the default configurations on x86. With this
> > > > being applied we become quite close to enable CONFIG_WERROR=y (which is default
> > > > and basically reverted) in CIs. Clang, OTOH, has currently no issues with that.
> > > 
> > > Would be nice to have a comment on this rather sooner as this impacts
> > > the compilation by `make W=1` with WERROR=y (which is default).
> > 
> > I do not like the change.
> 
> Independently on your opinion in this case GCC is correct.
> We are trying to squeeze up to 40 bytes into 32-byte storage.
> I.o.w. GCC can't prove that and reader of the code can't prove
> that either.
> 
> > There are no bugs, only GCC being paranoid.
> 
> I'm not so sure. But probably it works because the user space is parsing full
> "inputX" string in the names
> 
> > Are there any other ways to shut it up? In [1] Jeff says that switching
> > to scnprintf() shuts GCC up...
> 
> I do not like this, because it's just a hiding the problem and not solving it.
> At some point GCC may start issuing warning on those cases as well when it
> realizes the above. If you like that solution, please fix in that way. We have
> 4 drivers break the compilation currently.

Actually looking closer, the better fix (and which I'm not against) is to check
for returned value of snprintf() and act accordingly. What do you think?

> > [1] https://lore.kernel.org/r/Z3rIvp0hzS+yzvJA@nixie71
> 
> So, consider this series as a bug report that prevents compilation.
> I would expect somebody to fix this rather sooner than later.

-- 
With Best Regards,
Andy Shevchenko



