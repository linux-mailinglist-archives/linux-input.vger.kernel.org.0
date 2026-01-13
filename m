Return-Path: <linux-input+bounces-17013-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F097FD17217
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25D763011747
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 07:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B78E2EB859;
	Tue, 13 Jan 2026 07:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QqBTJ6Ec"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C336930E0D4;
	Tue, 13 Jan 2026 07:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291032; cv=none; b=P/surihlXSICDTwE0yf4Pr9huXUEyygM62HsCdc4TOW5UzNJx+HD+2sUVQxg3Le+wemHfvdzQqoWBS2ebmVe1mVhF4mmlf+zjLmLYWsHRSl1WWzC99n4mn21dCbhhHG2SIMFY5pxqqs/4HTSl8CSnvhD1hAGMcAsDiDzOObF3yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291032; c=relaxed/simple;
	bh=YWstJCQLLll2eT/UM1DXujhOdrEOFc4XnSqlHwp4DIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YF2y53Ge1RI3e9NC2beKy9AV7Ambzt4CBUCnpfztu2nLcTc8+Ecw0lGJUw9k7hfxwBoI3J7S0Yj4c555R0rlUrmlAAhV01RF9FiVjUeVoAA3JvmpTJECxP5//gNmpNK0olg1x6960ZKN3fxaoIExRUGWg5yA/8vqO4ddM10IH4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QqBTJ6Ec; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768291031; x=1799827031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YWstJCQLLll2eT/UM1DXujhOdrEOFc4XnSqlHwp4DIc=;
  b=QqBTJ6EcAUbbW74b7Pe/HxBWeVsS3eOVgIOevx6enM0Z11SgXcO6d6jZ
   tQ9ZFMw7brdQn/0owCfFzaQu4lsZr7HXBvGDZcVAPQDjYr4cdd9mymRsc
   ShCrcCxJfyTZfJ5S77KIwIQeAnQ9mzhViHJ6BHQnVbkOx80uli0y/ziTN
   9zCvbygRLSpppbOi8UbmJFikhG5SBS4m5gQzgF7uf1A9q0+8o88hOL0/Y
   wnlyu0JVOjIAeNWy1qG1QOyOSJvQRdz7KT86p3+mMPXiKieyjH/fN7U0P
   P1DU6MB3mPWhrvb6OWXUOF2dy3+abRKtRSxuEzLwpNkQTXkvn2/hA8sYh
   Q==;
X-CSE-ConnectionGUID: DvmBCy0xRBikpwk0cBFJ1g==
X-CSE-MsgGUID: hfzykraIQh6wpE6R6tXxaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80291262"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80291262"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:57:10 -0800
X-CSE-ConnectionGUID: ouCWd439R7ON2TB0B7irqg==
X-CSE-MsgGUID: jQK/CyCPS++sbz1W398yTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208477676"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:57:08 -0800
Date: Tue, 13 Jan 2026 09:57:05 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v1 2/2] Input: wdt87xx_i2c - switch to use dev_err_probe()
Message-ID: <aWX60f9RtESggVtr@smile.fi.intel.com>
References: <20260113073556.7380-1-andriy.shevchenko@linux.intel.com>
 <20260113073556.7380-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113073556.7380-3-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jan 13, 2026 at 08:35:22AM +0100, Andy Shevchenko wrote:
> Switch to use dev_err_probe() to simplify the error path and
> unify a message template.

Actually this needs a revisit as it makes some differences and also some can be
amended.

-- 
With Best Regards,
Andy Shevchenko



