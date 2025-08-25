Return-Path: <linux-input+bounces-14298-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0838DB342A7
	for <lists+linux-input@lfdr.de>; Mon, 25 Aug 2025 16:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CF905E52B2
	for <lists+linux-input@lfdr.de>; Mon, 25 Aug 2025 14:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B86E2EFDAD;
	Mon, 25 Aug 2025 13:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qifnz8g1"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380E82FC01D;
	Mon, 25 Aug 2025 13:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756130117; cv=none; b=PBCSXrJX54lKWm69q/UhAFG1gfV2kwEUEn7wa66r3WnV4FXrJe/gE2fhO69JMEBdF7cjlzHxQo08RGVeDQ2Jd4nlP1iIdr583vvepUn1lS8tQunGTpPm2cQuIdvTAQHUOwmTkpVbCXxhuk2ZZOFnaFG+VIJP8qlHcZwcXiyZ5D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756130117; c=relaxed/simple;
	bh=zO/sLys/4yz85uc0CmNHawX6EL8astseSjzu207Ew1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oO5O0Ah/M7ATbtW8JTlAyYa+2Sv0eRhiD50XmvjQddkW5P2rRy0hC0cGY9nzqGZ4muZulIQznjskhsUKlPViOIV2g/Bzf7WFLN8tIhGdDjZJ8aaeGIew0CuX5LRKj5nTvijEpMBO572dVvdjmqUoBH23WMb5UACmPqQc0931GbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qifnz8g1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756130116; x=1787666116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zO/sLys/4yz85uc0CmNHawX6EL8astseSjzu207Ew1M=;
  b=Qifnz8g1mnkyvWucmJAMOof5g2md1ftFA3nlzGPKfb12U+F/1bukzd+t
   5U6IoeVUSTx5vYprN3DZHscLT0Fax2wQ7CseppxKr8OSB+qd3vXHABj9E
   7OuwECmB372zM3C18l6okZxpZrYsboNLn4d5IyZ+jqSD/A1sPBzUZsR1Q
   EZX6Y+O/srzOyturXw8t6t/loMBdVo0GsbHOxSqrVMeHlWDQV95Q9IuFF
   ohQyD27SH/372iKjzPo4MHMP+6VNLkF9kWTb50004K1UJIcGMtQ4KSall
   U/7hBOfO7JV+FFYAFezVSubvr7Yv5uDgxscBP0FeubVU30lciCRaNhaLw
   A==;
X-CSE-ConnectionGUID: Gl+dLIS9TAm+q8z3DK3xMQ==
X-CSE-MsgGUID: 4DnpaklbTFqnzBGm5pmnhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="45916849"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="45916849"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 06:55:14 -0700
X-CSE-ConnectionGUID: 9Q1DaNOmS+qj1cW2Aps6ZQ==
X-CSE-MsgGUID: pl5iI+DQRvSiBRYT1P0N8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="169691924"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 06:55:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uqXfD-00000008WaA-18DK;
	Mon, 25 Aug 2025 16:55:11 +0300
Date: Mon, 25 Aug 2025 16:55:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v1 0/2] Input: wdt87xx_i2c - a couple of cleanups
Message-ID: <aKxrP6B83gGDgcQ_@smile.fi.intel.com>
References: <20250321183957.455518-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321183957.455518-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Mar 21, 2025 at 08:39:16PM +0200, Andy Shevchenko wrote:
> A couple of cleanups related to ACPI ID table and probe function.

Any news here?

-- 
With Best Regards,
Andy Shevchenko



