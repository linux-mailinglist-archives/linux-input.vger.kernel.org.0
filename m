Return-Path: <linux-input+bounces-14177-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B8DB2DE1C
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 15:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EB5B3B8F4F
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 13:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA772E426B;
	Wed, 20 Aug 2025 13:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cmvqq/V/"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46057266580;
	Wed, 20 Aug 2025 13:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755697053; cv=none; b=MFFUdBJXylgmLB15WrxFiHmXfuB2VcWAL//HeYz25XKkwe1nuxfFTgaX/wOv2cQGFJOQ2JHm2eDLMoCvafducmR608SxASssVLQP2UQ5tEfdXzqmjXbeyeybUdf7WV9JX2tiPiGlgPcQlCJQr3Sm/NJkAnRa+pkT5Kkl32Twh0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755697053; c=relaxed/simple;
	bh=yEQXmulFxXDG1sDyRSlljcnvKgb1IGDGxAqi0eFtdOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EK0jb6N2eWa5YQdrTeQB1na+Q/Hh8kVXOXa9opylMDlhtWa+RW/pWt+sAZ5n4AVMQds0XFtDZfPmU0Mq8XkP6fdgjcfXx5XkBDlMnckNLW+4VxXo1jkt5WRmalowkPhuzgW5Y1Sm8A8QyNLS2KECKph5DMqBt4i6ywwUDkZ0qG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cmvqq/V/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755697052; x=1787233052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yEQXmulFxXDG1sDyRSlljcnvKgb1IGDGxAqi0eFtdOU=;
  b=Cmvqq/V/sa9mFvrn6r+wKsO2wV0utAsWqqLP3jNGRFBDfSjfHAxEVZcY
   vgGH6LGEoX7L4UVcTSjaEPqH725i2IOQsQzflz6ZyEEH8RHEN2kOecRBM
   fNfSalms/+xbaPgCp+Tyq6fGtfk/07ujJdyuKeodvxVtSWW986L/LTEjh
   UjJELbiE1Mx3b9nk2/vfZEGFxyNzNFtPYa4lLSpEDEqNvCtIfh6HmlHs9
   +eJ+tQWx5SredolmDNBGXsOvneURqzuKukcqJE1IjtflpMXTgmHxfD6KS
   6+961a5PfriGA1HprIkNAVUB/Np9NbGELQfP8uwTxbNG5iaHcz9ch5yR/
   g==;
X-CSE-ConnectionGUID: Vl14jqLZRtiHzyGrgE/+nw==
X-CSE-MsgGUID: M5gHHJ4+SLqDDPbQ+x+v+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57892108"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57892108"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 06:37:31 -0700
X-CSE-ConnectionGUID: +zJGEgihRieZpi4Z/o+xIA==
X-CSE-MsgGUID: 1/fMQfY+Teqb4w6fR2smbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="172358778"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 06:37:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uoj0H-00000006wg8-3ePk;
	Wed, 20 Aug 2025 16:37:25 +0300
Date: Wed, 20 Aug 2025 16:37:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, Lee Jones <lee@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] Input: gpio_keys - fall back to platform_get_irq()
 for interrupt-only keys
Message-ID: <aKXPlSXlujuPPuzl@smile.fi.intel.com>
References: <20250817224731.1911207-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817224731.1911207-1-dmitry.torokhov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Aug 17, 2025 at 03:47:26PM -0700, Dmitry Torokhov wrote:
> To allow transitioning away from gpio-keys platform data attempt to
> retrieve IRQ for interrupt-only keys using platform_get_irq_optional()
> if interrupt is not specified in platform data.

...

> +			irq = platform_get_irq_optional(pdev, idx);
> +			if (irq < 0) {

> +				error = irq;
> +				return dev_err_probe(dev, error,

Assigning error is redundant.

> +						     "Unable to determine IRQ# for button #%d",
> +						     idx);
> +			}

-- 
With Best Regards,
Andy Shevchenko



