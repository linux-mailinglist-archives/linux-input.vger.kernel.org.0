Return-Path: <linux-input+bounces-13462-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBD8B00172
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 14:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 021DA5A18EB
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 12:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5D923D29B;
	Thu, 10 Jul 2025 12:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EQUR5chF"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C962170A37;
	Thu, 10 Jul 2025 12:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752149817; cv=none; b=ZAei7Y7W8zpHOF/MMWTJNTa3CKW3hnR2HIZeWsK6Uydkk6f4eqgsR6qWaLiunyAhA5kJ67FqSKas+DJMM4yZKzEWJzjCeqiX9pFttW/wtHc9G6a/XzYXrw1zwXnEPApCf5gcsJCYQSnYeOtwH8cVeIscOZqvA3NZP5thWogvNuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752149817; c=relaxed/simple;
	bh=A0uTfemTYy7mZ1AqZot4wgFifQgE1k7yCZg2V9iRBtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaUZGlNaqumklON8DOVAepp4UQTH9naocXZ4BwqFbqe5Sd5nNn77dLbo+wtR2dVWDic5f3CTv4PVDYywOkFuGS5U6NIgnevYRQ8W1EBOaRnCZl9eLgnWHb/bpk867LyZDQNdK7tYEieZ43D1we5qA9NBreBb01Nqni/v/TsPsRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EQUR5chF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752149816; x=1783685816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A0uTfemTYy7mZ1AqZot4wgFifQgE1k7yCZg2V9iRBtE=;
  b=EQUR5chF6PVJk4BiMXvHnToptKD+7hyDT2e7G3JJY4lFVQS4YfFdN7Ez
   6CWHNE+dVWfv5KHMXWVH9PNdaJ0DseIrM1FeGQspQT0KhF56cdesNveOg
   D4wtXQhYPYjtCEx/UxJ7lOQecbMbGSVbIe+KxHEF7Vxgtg7HfBFMu8DLL
   7vZ+SFjVMK07/giwDq/Ko6UOhW+yE7rV2TJGCl7tJQBJ2YoeoEnbeuznp
   J2vd3F0jrXPCstwIIOkl9m0cyO6JI3Y0X4id8Axl0LSm52NVPCfPucFmd
   OIUmtRd3dXa1D5ZwRdZtdWqT5SSsJxKzD/BuRhuJk6qIx2Yni/Kw2sZll
   w==;
X-CSE-ConnectionGUID: +9WK//FKT4eIXxqc/WqSqQ==
X-CSE-MsgGUID: MkzOctopRwWHasHz7s6AFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65489018"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="65489018"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 05:16:55 -0700
X-CSE-ConnectionGUID: vPrQYb/CTVWFdgJnsA6Wsw==
X-CSE-MsgGUID: nvHPcmfHQFeuhjaB0NHh9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="187040756"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 05:16:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uZqCo-0000000EBxD-0ibz;
	Thu, 10 Jul 2025 15:16:50 +0300
Date: Thu, 10 Jul 2025 15:16:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Vicki Pfau <vi@endrift.com>
Subject: Re: [PATCH v1 1/1] HID: debug: Remove duplicate entry (BTN_WHEEL)
Message-ID: <aG-vMfaLgnBFscW1@smile.fi.intel.com>
References: <20250710094120.753358-1-andriy.shevchenko@linux.intel.com>
 <175214204240.728686.14468996712698294332.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175214204240.728686.14468996712698294332.b4-ty@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 10, 2025 at 12:07:22PM +0200, Benjamin Tissoires wrote:
> On Thu, 10 Jul 2025 12:41:20 +0300, Andy Shevchenko wrote:

[...]

> Applied to hid/hid.git (for-6.16/upstream-fixes), thanks!
> 
> [1/1] HID: debug: Remove duplicate entry (BTN_WHEEL)
>       https://git.kernel.org/hid/hid/c/04515e08bca9

Thanks for prompt action!

-- 
With Best Regards,
Andy Shevchenko



