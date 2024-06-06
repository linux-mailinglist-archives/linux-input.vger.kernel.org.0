Return-Path: <linux-input+bounces-4180-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CDF8FF56F
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 21:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC5421F23962
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 19:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B424F1F2;
	Thu,  6 Jun 2024 19:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHmI+4xu"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B10B3BBCC;
	Thu,  6 Jun 2024 19:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717703279; cv=none; b=S0vUsRfKbewKuKZDzH5fziZjG3jb/vhvK1ketEpERHpzpRdsojNbG0dTcVomPiy0uVqZCMQwX8pndJ3BQHSIYl8b+7B+D4CtvnXbS0L4mhOyXTwd7RYn6GMK++DRXDdvrn+OtC3WpiqsSet5LVtL2RiFtc1XH1Mdegmm4BvHNII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717703279; c=relaxed/simple;
	bh=PveKVHCLWZjtDMj/ujq6eSLEpOn9YO6XLOALxWuyxTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWzwLwutFwlBcXIjF4EUpT/pDtSS7s37dD5wKj2eL67GYW3fSdHd1SQuzzhUF8+O+VhMvi66FuiHsTX/726Y47f732b9gjdw4kT20Nk3e+BmIVuDKXa9KRRRtJGOzQXktRBjqIqtkv9LhCw/cUSCFuKUqAs9kjOXdXczccEOzO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHmI+4xu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717703278; x=1749239278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PveKVHCLWZjtDMj/ujq6eSLEpOn9YO6XLOALxWuyxTk=;
  b=cHmI+4xuIGrD9U3pHTOw+XoKLfmU35slLlAygArHsg9oQiLJ/wtOA3Vt
   J4NVYVEEZQugBlsMuTG+AacTKywVY4ZGYr/qkr0qH9Z+0tMFXEtbDKH1/
   4jXVbkorRl5xN7NW6JpTJz58k2LyKGpbvLeuFnyyjJAosQM1131FYwJ+k
   fhydWFzgFdqT8q5uoIMqQjgtcOvQJLeY0kSRpgcDeOjGwmDMrwK+KagA2
   K+uBkmN1b3g6RTIIZd+MywIb8186hPmfsW6ErzMeQzRqHk7A/G/qnKiiv
   H/AfOsBpA41kviXSRviAPbCnBgf2KP/+l4dWs5HHLUoKF0fVzGkFxrfum
   Q==;
X-CSE-ConnectionGUID: rnsqJYYkRM293S3qlcL/Hw==
X-CSE-MsgGUID: +/mHIZCMR4Sd7tcA+oGYRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25806567"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="25806567"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 12:47:57 -0700
X-CSE-ConnectionGUID: zPqELF8nRUi4HADuInYdZw==
X-CSE-MsgGUID: gn++ktI2S8q+FWuFwPMuQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38197900"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 12:47:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sFJ5U-0000000EIk6-3Zg2;
	Thu, 06 Jun 2024 22:47:52 +0300
Date: Thu, 6 Jun 2024 22:47:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Danny Kaehn <danny.kaehn@plexus.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Ethan Twardy <ethan.twardy@plexus.com>
Subject: Re: [PATCH v11 0/4] Firmware Support for USB-HID Devices and CP2112
Message-ID: <ZmISaEIGlxZVK_jf@smile.fi.intel.com>
References: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
 <ZmD38oynzhjH2628@smile.fi.intel.com>
 <20240606155453.GA54873@LNDCL34533.neenah.na.plexus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606155453.GA54873@LNDCL34533.neenah.na.plexus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jun 06, 2024 at 10:54:53AM -0500, Danny Kaehn wrote:
> On Thu, Jun 06, 2024 at 02:42:42AM +0300, Andy Shevchenko wrote:
> > On Wed, Jun 05, 2024 at 06:12:43PM -0500, Danny Kaehn wrote:

...

> > > Changes in v11:
> > > - Eliminate 'gpio' subnode for DT and ACPI for the CP2112 per comment
> > >     from Rob H.
> > 
> > Hmm... I don't know much about DT, but how is this supposed to work in ACPI?
> > I mean if we want to refer to the GPIO in GpioIo() or GpioInt() resources,
> > what should we put there as ACPI path?
> 
> What I tested was essentially taking what Benjamin had done in [1], just
> removing the "GPIO" device and combining it with the parent device (the
> CP2112 itself). So for the example below, I believe the path would be
> "\_SB_.PCI0.SE9_.RHUB.CP2_". If I get the chance (and can figure out how
> to do it using ACPI) I'll try to add a "gpio-keys" or something to the
> system using this path and make sure that works.

This is counter intuitive and doesn't follow other (ACPI) devices with GPIO.
So whatever you do for DT I don't care much, but let's not remove subnode
for ACPI case.

...

> Full example within context:

Thank you!

-- 
With Best Regards,
Andy Shevchenko



