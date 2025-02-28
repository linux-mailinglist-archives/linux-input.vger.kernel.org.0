Return-Path: <linux-input+bounces-10441-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D68DA49A00
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 13:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1764B188A784
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 12:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074F726D5DA;
	Fri, 28 Feb 2025 12:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvNre4wq"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1AB26D5CF;
	Fri, 28 Feb 2025 12:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740747125; cv=none; b=LdiEMzkXPAQ/PvPsbcqx9+ksPI3IvRHK5Q+IwxBhxwmjegPmHYT3/6/vrjwn6tRAo6symItOPlu7wNDsCFT5MfvqnufPlxZfN525q2PvLJeWDC1WX2trPUCNbXtq0fOP9v6CG8y/sT6RqFwO3l8zWmFVxrxVQ0DV4wrYAnI7jsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740747125; c=relaxed/simple;
	bh=qtVHDkxhDZ9QRs/IpSQz8H/vIugC+ZZc6I5P81tsh3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iellDexHAcDVcec5dsvtZ1px00TqzW1feSovQRG20DNehS1Uw0HB0K3tb/afQfynZRGtHguEAywiK+0KGRDRvZokeIBY3iCItq+yWokZfKBWI2SwVoOW7XLC9M2ITgEGegF1N+WMC/b9qsEwCCRScaA2YOYc5j/xgZs+9oiiWqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvNre4wq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740747124; x=1772283124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qtVHDkxhDZ9QRs/IpSQz8H/vIugC+ZZc6I5P81tsh3o=;
  b=bvNre4wq1KkK+3ETkSKQ3oSqqEM0gcspyIYazhnmf1RADq+c++7ORO7P
   20WLZsPfP9sBi3OQq4siNVhd6k8CVF/IX3bhWl3I5wVu3NIN30B4Tlb5N
   0rIR3BTZsRgh9CkYpkGhO0s+ZaaMcdn85AXabskVAudzGEzTH0zW6K9ye
   ihDul0UAGrP6wVol8x//6B3LWxo3nP7xoIH1sUetSuMCAurw6AGjwzsSI
   9Q+iDFMFW2V+Rr7BKKsODz0+eHQ368RJC0M40/hwQUpYDzNZ3a+X8zPyI
   zxMy2kYLHkMFk4aPC8oIiVDN7RopwYBJUrOQ1MdPyEXUn2FBCdqe5Z0oI
   A==;
X-CSE-ConnectionGUID: Qff0poL2RbGLGj6i+bUGGg==
X-CSE-MsgGUID: atSU7u8zSyGEwBiL3Ingug==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="40849901"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="40849901"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 04:52:04 -0800
X-CSE-ConnectionGUID: UX3fm5sFQMqvM00VuJddLQ==
X-CSE-MsgGUID: X/emzOIwQWKEk2GRoPyu6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="122460635"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 04:52:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tnzqS-0000000Fwst-1v2M;
	Fri, 28 Feb 2025 14:52:00 +0200
Date: Fri, 28 Feb 2025 14:52:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v1 0/4] Input: Increase size of phys in the drivers
Message-ID: <Z8GxcGgyAuMyRv5D@smile.fi.intel.com>
References: <20250228121147.242115-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228121147.242115-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 28, 2025 at 02:07:43PM +0200, Andy Shevchenko wrote:
> The drivers are using local member of 32 bytes to hold up to 40 (one-byte)
> characters. GCC complains on that. This series fixes the issue in the affected
> input drivers. Note, this is currently the biggest part of the warnings that
> are being treated as errors with the default configurations on x86. With this
> being applied we become quite close to enable CONFIG_WERROR=y (which is default
> and basically reverted) in CIs. Clang, OTOH, has currently no issues with that.

If acceptable, it would be good to have them as fixes for v6.14 cycle.

-- 
With Best Regards,
Andy Shevchenko



