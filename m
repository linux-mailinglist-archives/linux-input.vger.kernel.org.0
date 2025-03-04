Return-Path: <linux-input+bounces-10520-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F160A4DD9C
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 13:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 707A31885A4E
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 12:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959401FF611;
	Tue,  4 Mar 2025 12:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4TyB7P5"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBF61E7C20;
	Tue,  4 Mar 2025 12:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741090458; cv=none; b=qXCXYXfBKL2sTRNnzdkSvbjUwlhtGOEZhFlMUtx4Ma4lMp5y8k0yvxj8mHKo3Qh7nabpDZWBxDMUSnm+eXHDEjhPu+qjZm+xODmu2umu0ubvMJRf6nIBvWiXpC1huomBb1XmFX65c0GYBq3huBTaHmbaqwAxXsbCXJGA/QBwXJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741090458; c=relaxed/simple;
	bh=kui0QV/IEFvVSILBBHTF00Vexk7F9pOPjaXpcJBzIZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFvZXOLK82789ygWUCRxNgnBTK43meRguoc7d1rch6kmJbL9Ujrw9pbtTtM90u+hL0uX9rOf56U/hYedlVeoOybzB/S3x4m4+59pCzmFaXl7qZfLbM96bPJIg9KCHRJBLJzaXRWkPeLDdunTADjxjagjnJRjgmr+T9Wp3MsU2j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4TyB7P5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741090457; x=1772626457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kui0QV/IEFvVSILBBHTF00Vexk7F9pOPjaXpcJBzIZM=;
  b=n4TyB7P5NpomZDTeHfWY1OSbfew6E7Je0Hi0A0Z+I3QHSn0Wy1PW1bHz
   MjTiCg6yz6MM9MWLQWyIdSS5PVHRESvLT+WS+ulY0R0VynkaPg0AFBIAX
   qBN20vN3NnLZMoEwxoVeBeQ9650dRg8X+XXR4D49KKSn9D5xM7yoeCYh4
   +3x28oZdKCcE9FYS+/QjPMaihjn1+VICX7AP3Yu/ufzaaU7YCHp5JwuMO
   8LQ+ayff55weeXi+84849J2W9qPwePu9cH9VQlrfm5KbTmI6k3Qm6erHb
   yKHetrmpNbm2XGV5w5ASw1/j039wo02FkL4xJy3Pq2BJp7OoWiI6Q9iEr
   g==;
X-CSE-ConnectionGUID: utYvqpsaQXO4AgFjDPT2xw==
X-CSE-MsgGUID: ePwGyj2DQZu4ULAYOcsHSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="53407950"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="53407950"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 04:14:16 -0800
X-CSE-ConnectionGUID: f3y5gVtGRZ+HymDffO776A==
X-CSE-MsgGUID: WdkTj8vQRfuz24mHlj/0pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118225136"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 04:14:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tpRA4-0000000H7N2-1OzN;
	Tue, 04 Mar 2025 14:14:12 +0200
Date: Tue, 4 Mar 2025 14:14:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v1 0/4] Input: Increase size of phys in the drivers
Message-ID: <Z8bulFaTKJ06YLrL@smile.fi.intel.com>
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

Would be nice to have a comment on this rather sooner as this impacts
the compilation by `make W=1` with WERROR=y (which is default).

-- 
With Best Regards,
Andy Shevchenko



