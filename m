Return-Path: <linux-input+bounces-11802-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 678F6A8B111
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 08:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD16D3BB9D6
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 06:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078D7227E88;
	Wed, 16 Apr 2025 06:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EsFo36re"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3473722B5AA;
	Wed, 16 Apr 2025 06:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744786099; cv=none; b=MmJbMRmMg2RTHRFMOx1b3p/T9j6jUWRA8AisDEgeu1IWFPUnJNB6QQ/AEkm6ALbfjrQKkMWUJWhGER6Xjo6fuacYaVYMT3jNXdSDxMCglUd0RLrEzW4Tv4Bxfkc9icX0iTPEaiXX6GEGAaRUz6r2nmXvthhUZRG9EoY2tvq0KyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744786099; c=relaxed/simple;
	bh=GnnHax3CLs/eDEcISozxIW47zxtfYAHKNkWa76+Y2OI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFVrmnmpHw23EuIUvrhjkqaUP7aIV2WI7R6ZW/Z7Uxlx3xq8Mg4z/F/LAVOPPHvrs87Us/442M5nVrIs+gSRjM6zH+5eQ75NmROXKNilwArTguGAd9+xijcMuRmhYsDhKde+hXn1ib/3VSNvcK5J1fRqCU0qb1oveyrLQrDWfJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EsFo36re; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744786098; x=1776322098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GnnHax3CLs/eDEcISozxIW47zxtfYAHKNkWa76+Y2OI=;
  b=EsFo36re4UcrMgAFiCbgGb0n0+P7+Ng+xNQ01+H2yLF+4UUCpvNKZ+p1
   OqNGLtJeuRfkASOOLbifPN7zs4h1+WPKor9EKVzZdl8iTpTqdjxhqzOZF
   5iRT99ihBp5NXGZ7pqw1k0EbeANA2gSUZOQtpBMOr5S+qZMIYXQuS3078
   VKcFMdrGLFUetY/DrhzJa9ltnoz2cq4zaMV4YZHz10qiEgzfJqTJhuBFG
   2LaCypnnHs9i2mr8vxsdkNklun4HVMx/Fym+++6weRAZGy9vVHS6B3wQu
   RMY3MChV+pRjEQBrwHMX9ROpXJhSDeNRBa8ULqTV+d/1sVz071u5Z6RFU
   Q==;
X-CSE-ConnectionGUID: MAc4PGbzR164fMRYrAuwRA==
X-CSE-MsgGUID: 4V62WpBGTimemR434xgsFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46334755"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46334755"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:48:17 -0700
X-CSE-ConnectionGUID: 2ASbkVj7TvCkBkqJVW7E6w==
X-CSE-MsgGUID: 7/DzJlehTp6WrO5UTCNBKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="153566951"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:48:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1u4wZA-0000000ClnF-2FBE;
	Wed, 16 Apr 2025 09:48:12 +0300
Date: Wed, 16 Apr 2025 09:48:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] HID: simplify code in fetch_item()
Message-ID: <Z_9SrP4kIGTCexF_@smile.fi.intel.com>
References: <ZvwYbESMZ667QZqY@google.com>
 <20241010222451.GA3571761@thelio-3990X>
 <Z_yrjPBO_CPS8WX1@black.fi.intel.com>
 <20250415003326.GA4164044@ax162>
 <Z_4ApoWzgWSovgRi@smile.fi.intel.com>
 <20250415152149.GB995325@ax162>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415152149.GB995325@ax162>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 15, 2025 at 08:21:49AM -0700, Nathan Chancellor wrote:
> On Tue, Apr 15, 2025 at 09:45:58AM +0300, Andy Shevchenko wrote:
> > On Mon, Apr 14, 2025 at 05:33:26PM -0700, Nathan Chancellor wrote:
> > > On Mon, Apr 14, 2025 at 09:30:36AM +0300, Andy Shevchenko wrote:
> > > > On Thu, Oct 10, 2024 at 03:24:51PM -0700, Nathan Chancellor wrote:
> > > > > On Tue, Oct 01, 2024 at 08:42:36AM -0700, Dmitry Torokhov wrote:

...

> > > > > Getting rid of the unreachable() in some way resolves the issue. I
> > > > > tested using BUG() in lieu of unreachable() like the second change I
> > > > > mentioned above, which resolves the issue cleanly, as the default case
> > > > > clearly cannot happen. ...
> > > > 
> > > > As Dmitry pointed out to this old discussion, I have a question about the above
> > > > test. Have you tried to use BUG() while CONFIG_BUG=n? Does it _also_ solve the
> > > > issue?
> > > 
> > > Yes because x86 appears to always emit ud2 for BUG() regardless of
> > > whether CONFIG_BUG is set or not since HAVE_ARCH_BUG is always
> > > respected.
> > 
> > Thank you for the reply. But do you know if this is guaranteed on the rest of
> > supported architectures? I.o.w. may we assume that BUG() in lieu of unreachable()
> > will always fix the issue?
> 
> I don't know. As far as I can tell, BUG() is always better than a bare
> unreachable() because it is either the same as unreachable() if the
> architecture does not define HAVE_ARCH_BUG and CONFIG_BUG=n (and in the
> case of CONFIG_BUG=n, I think the user should get to pick up the pieces)
> or when CONFIG_BUG=y and/or HAVE_ARCH_BUG is defined, the unreachable()
> will truly be unreachable in the control flow graph because of the trap
> or __noreturn from BUG(), so no undefined behavior. I think you would
> only be able to find cases where BUG() was not sufficient to avoid
> undefined behavior at runtime instead of compile time, as objtool only
> supports loongarch and x86 right now and both ensure BUG() always traps.
> I might be missing something though.

Thank you for this information!

-- 
With Best Regards,
Andy Shevchenko



