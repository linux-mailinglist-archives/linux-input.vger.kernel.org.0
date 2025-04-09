Return-Path: <linux-input+bounces-11599-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9B2A82A8B
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 17:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB4C27AEE70
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 15:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0A1267739;
	Wed,  9 Apr 2025 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZo9teaG"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D64A26770E;
	Wed,  9 Apr 2025 15:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744212802; cv=none; b=Ixy0R8ce8ktsZiZyvm3D60xlfHCpBgogK61TSnHmUPappz2DqVyO6e1E3JDVDPti6i7C8bkz5jjAhtq/ECrESYeNxS78UDydTj9+srKjGNTP4jyLwoh9DsX2kJwY/NHiLJUqTTK1hIlwLEYL7aBmhrJ9DK9kapSexkTFo40om0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744212802; c=relaxed/simple;
	bh=mErJO8k3cpuBPBmJcDHzl2+V5zvBB5RozSbgoAix5w4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IuGuocMQWGzs7kFQdYW8mf4aFpWh/42MDiwZfEvE3igRNO1A7MVifHHDjTui3C6txBneFOjjzupSAaJqD55KC/dS0k6LyluQylkoeJqzcK5vecZSgd9Mr5cf6CRupHYid6OnXvPiV5b+bpjlhbXXhpVy74bwVwbEHe7YSM9bVBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZo9teaG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744212802; x=1775748802;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mErJO8k3cpuBPBmJcDHzl2+V5zvBB5RozSbgoAix5w4=;
  b=FZo9teaGJkxPaEiVsT4BfSjJMFK6MSuY3RtK/d1aeA9xrBD3d/DOVEpS
   2a4yfZ2/9amjjvwpCXjepGFt0kz5UaKEpgkCbN3bz8TbX9Rbs7VXnK4mS
   WHf7jioaKznua+i2RXNv/2TeT9skJP0TLDY0oJsPs839PdginhkUsr7c+
   HWALEAH6VQ81qqMRpmNH/1R2h+3tcTVkgGZfTEm+WBJuMHRGB99uSIH7d
   uYkWBC0STkw55rGWGqfN6WuyxRO4Vsj5oTkOxHh1pSK1qt4qCqHFKjOvW
   n0o1TwoXuUrEHvNfONgXwvBUjyQLC+/zVdBHr9A1K6VovEJRuXpSXFIs8
   w==;
X-CSE-ConnectionGUID: GTXsCr01TgGN7u6G3SpJ0w==
X-CSE-MsgGUID: jW5wamcWSDKOJZc1jxYnRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45582295"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45582295"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 08:33:21 -0700
X-CSE-ConnectionGUID: Fpvn1roRQguN0PtW+NjSfA==
X-CSE-MsgGUID: hp7hC+GATASRmDoW92HvTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="128354896"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 08:33:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u2XQQ-0000000AmNz-0KQG;
	Wed, 09 Apr 2025 18:33:14 +0300
Date: Wed, 9 Apr 2025 18:33:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Oliver Graute <oliver.graute@kococonnector.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Yu Jiaoliang <yujiaoliang@vivo.com>, linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/10] [v2] Input: stmpe-ts - use module alias instead of
 device table
Message-ID: <Z_aTOUUmyXpWnt57@smile.fi.intel.com>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
 <20250409122314.2848028-3-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409122314.2848028-3-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 09, 2025 at 02:22:55PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When compile tested with W=1 on x86_64 with driver as built-in:
> 
>   stmpe-ts.c:371:34: error: unused variable 'stmpe_ts_ids' [-Werror,-Wunused-const-variable]
> 
> Ideally this would be referenced from the platform_driver, but since
> the compatible string is already matched by the mfd driver for its
> parent device, that would break probing.
> 
> In this case, the of_device_id table just serves as a module alias
> for loading the driver, while the device itself is probed using
> the platform device name.
> 
> Remove the table and instead use a module alias that reflects how
> the driver is actually probed.

...

> +MODULE_ALIAS("platform:stmpe-ts");

Isn't the preferable way to have platform device ID table instead?
Krzysztof?

-- 
With Best Regards,
Andy Shevchenko



