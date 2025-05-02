Return-Path: <linux-input+bounces-12126-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5D7AA7431
	for <lists+linux-input@lfdr.de>; Fri,  2 May 2025 15:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92029176388
	for <lists+linux-input@lfdr.de>; Fri,  2 May 2025 13:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB27253B65;
	Fri,  2 May 2025 13:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xg25t1Qh"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64E914286;
	Fri,  2 May 2025 13:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746193981; cv=none; b=EUnVvws3ENPiyrCTYE7n17ydNG/22sw0QOZA7m9Iulo6QqYX4ESGsxtlwZdC0qGSS8X1ESjszYXmQXF1BZIa66KO/6sJMr+OVulrMJdziUy5WiHxKJxMevU4DpluIcpXvMOI+uzWxr3DKGJ8oZWBTEwE+V6xiaC1NeqNutpCHmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746193981; c=relaxed/simple;
	bh=4tsrVryRz+16AB+WbysY5iqYJ9Qd0CMgQaHodtvzzM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWHBtUCSFXL5WmdcArvLVADMLz7PbX8uGxdzBrKus7du2FCELEKRT0tb88IO8VUUyd4Js2T+Zy3nKeJY4oXPHxRZGyC6DoTiXf5q52DbaXwGabvHOISdi9H9rh+dkuIOfr1K1bfRbNrhWWy9kGsCmc1TH0+cmvRKDdTWXnSv+bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xg25t1Qh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746193979; x=1777729979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4tsrVryRz+16AB+WbysY5iqYJ9Qd0CMgQaHodtvzzM4=;
  b=Xg25t1Qh2MlcXb7EZ9O+l/cm2fNe78zGHNGG9K01drWmEwd5xz/IpFGw
   KDTiJjkvSA+8TN9ix8YXR2n99TGAc/ccXRjcCKp2gOnVo6+VOQ98IJ+2V
   q9+CGmRbwTQRtf16OBrKQi3ULIifT2i84ZHZQi8FTimcSz9P/MCF2mMZF
   inFbackAvbylCzGovwJFQQyGqPwZkCEqtb0cG9TNiWzuwO9FZ8gXRjs36
   mOhQaEBaxc/UvLrWUZtTdX7GvWvmpdR9eAFGnrP71YnI26Pxw1qX1w+el
   mldLbk5uMxHjelfFYhD7Zm7vltyDIS5EGcrokxD+u134Uc3imNCFA8XNy
   Q==;
X-CSE-ConnectionGUID: AlzFob8MTVqqIBXExB7QZw==
X-CSE-MsgGUID: krjR7kybRz+vVjesJV8hLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47762120"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="47762120"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 06:52:55 -0700
X-CSE-ConnectionGUID: 4/Leqc5tTw2MRUfkuf73AA==
X-CSE-MsgGUID: BOYIiIh2TCqshhSJTy2ItA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="134599322"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 06:52:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uAqot-00000002DOg-1lcN;
	Fri, 02 May 2025 16:52:51 +0300
Date: Fri, 2 May 2025 16:52:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v1 1/1] Input: ALPS - bail out when device path can't fit
 buffer
Message-ID: <aBTOMzlitljoDAob@smile.fi.intel.com>
References: <20250422185645.1949391-1-andriy.shevchenko@linux.intel.com>
 <ybenmz2fmjxjpo3zhnrh2ptquikxrtb63664qbhhfv5d4ezx5n@c3p2tbosx2tz>
 <aBBdFoBbdl8GI6da@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBBdFoBbdl8GI6da@surfacebook.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 29, 2025 at 08:01:10AM +0300, Andy Shevchenko wrote:
> Mon, Apr 28, 2025 at 04:30:13PM -0700, Dmitry Torokhov kirjoitti:
> > On Tue, Apr 22, 2025 at 09:56:45PM +0300, Andy Shevchenko wrote:

...

> > > +		n = snprintf(priv->phys2, sizeof(priv->phys2), "%s/input1",
> > > +			     psmouse->ps2dev.serio->phys);
> > > +		if (n >= sizeof(priv->phys2)) {
> > > +			psmouse_err(psmouse,
> > > +				    "failed to prepare path to the trackstick device\n");
> > > +			error = -E2BIG;
> > > +			goto init_fail;
> > 
> > So you just broke touchpad of some poor guy who had it working just fine 
> > for many years. For maximum impact you should add BUG() or panic()
> > here.
> 
> Ha-ha. You know that your speculation most likely so far from the truth.

And actually what you are telling about is not true at all. If the device was
working it means that the file node name is not cut, and hence this patch won't
anyhow change this behaviour. Otherwise, provide an example which can fail this
and still be working in the user space.

> > In all seriousness, it is OK to have truncated phys, rarely anyone looks
> > at it and if we get a report of it being truncated then we can consider
> > addressing the size (or we can decide to live with it truncated).
> 
> In all seriousness, while I agree on the statement, the 4 drivers in Input
> subsystem break the build. It's the biggest obstacle now to enable WERROR=y,
> which is default, builds on `make W=1`. So, I already gave you chance to fix,
> instead I hear nothing back for a months (to be precise 2 months and a day
> passed from my first attempt that you didn't like), the problem still exists.
> Please, address this the way you like.

For the reference, the first approach:
https://lore.kernel.org/r/20250228121147.242115-1-andriy.shevchenko@linux.intel.com
where I also asked about this one, ano got no answer.

I really don't want to try anything new as it seems a big pushback to whatever
I propose. So, please consider fixing the issues rather sooner. I will be more
than happy to test.

-- 
With Best Regards,
Andy Shevchenko



