Return-Path: <linux-input+bounces-4143-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA0B8FDAC8
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 01:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F3201F25D6E
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 23:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99095167D85;
	Wed,  5 Jun 2024 23:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZMCvqiv"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAF1169376;
	Wed,  5 Jun 2024 23:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717630969; cv=none; b=TZVbrQUpmfHuR+VEEbJYWMVvDupy/gyMliZtIpcjmYEPfkuWDBVFpDLgBNjxDmV3yaBdqEapFEX1vTKcR7lhvcw7FIqAIoAcGETugeuzi5j1PnlHRQhoyVqJHDwM5uWhAHIdky5OR9NW/0d6Gcg0o11jXyeO+9CT2+dCxMbj8Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717630969; c=relaxed/simple;
	bh=sWuSQTUWAKeaJqrOqTyGUw7V1GLhX5r793nCSVM428c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YczvEhQbcg32Y8yXtaUH4wmqqr1+rn+IEH2hsPYryD3NfqyvxjOHvbDF+3rFxy0mfglDjx0BALDhWdnal2QH7k+GmTyzA7B+6PRjfrZctz7F3WvWpqp/vpfM4vX2aYbKZ0XCZArjHkjaZfVWhuQ5Emnb8HaDvhalb5Khj1wKrDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZMCvqiv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717630968; x=1749166968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sWuSQTUWAKeaJqrOqTyGUw7V1GLhX5r793nCSVM428c=;
  b=UZMCvqivPb+MkJ/C/0CBYJjp5II/ave/sqOoU/PH0AdsN2ygZsd3NDwx
   eNHG18KbV/F/shjXycmXfepvJcZHuoppwBxgawvla43yqI1TN6WABrxKy
   eg3U+hAQqQGXOxWQhQMqUYJPdwxjRr4yUAKRO3mEG8G1/HUb9xnxZjCAv
   FPviRjqzprJXkRUOsOHJlxbAuYFdHfj86+NfUYFpUmTy41aNI7rQXFMxA
   JuFd3RzcedEvoHZSmhIEDeT5fbN7eKmvp1H5OAfd0K7azHlNRZ2mxpvrF
   l11RJM8Nl+ZV9Et//WtthJvOcRHTIdg1L5GAjxs7ZSCzXqz6lV1jz4JJG
   A==;
X-CSE-ConnectionGUID: CJfRdFPrTZGKq9XaB7MKWg==
X-CSE-MsgGUID: es/Nj/zWT7OVaC0Vm5dHiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14228801"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="14228801"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 16:42:48 -0700
X-CSE-ConnectionGUID: V9w4L85bQQKIY/S1l39MGw==
X-CSE-MsgGUID: WIObncSvReOrhuI2lBC/Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="68907813"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 16:42:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sF0HC-0000000E06M-35Vb;
	Thu, 06 Jun 2024 02:42:42 +0300
Date: Thu, 6 Jun 2024 02:42:42 +0300
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
Message-ID: <ZmD38oynzhjH2628@smile.fi.intel.com>
References: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jun 05, 2024 at 06:12:43PM -0500, Danny Kaehn wrote:
> This patchset allows USB-HID devices to have Firmware bindings through sharing
> the USB fwnode with the HID driver, and adds such a binding and driver
> implementation for the CP2112 USB to SMBus Bridge (which necessitated the
> USB-HID change). This change allows a CP2112 permanently attached in hardware to
> be described in DT and ACPI and interoperate with other drivers.

...

> Changes in v11:
> - Eliminate 'gpio' subnode for DT and ACPI for the CP2112 per comment
>     from Rob H.

Hmm... I don't know much about DT, but how is this supposed to work in ACPI?
I mean if we want to refer to the GPIO in GpioIo() or GpioInt() resources,
what should we put there as ACPI path?

> - Edit hid-cp2112.c to match for ACPI index and fall back to matching by
>     name (instead of the other way around)
> - Separate CP2112 I2C bus speed configuration into a separate patch


-- 
With Best Regards,
Andy Shevchenko



