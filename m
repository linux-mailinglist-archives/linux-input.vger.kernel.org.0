Return-Path: <linux-input+bounces-1705-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD7D84B75A
	for <lists+linux-input@lfdr.de>; Tue,  6 Feb 2024 15:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D86561C24DAF
	for <lists+linux-input@lfdr.de>; Tue,  6 Feb 2024 14:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838FE131724;
	Tue,  6 Feb 2024 14:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbsbcM+E"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE3C130E5A;
	Tue,  6 Feb 2024 14:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707228351; cv=none; b=TKql/9cjfJWFfLPO/FS2TFlVANbqnoU9Zxsj279/sp2UfLwGYQg60L6n9iwJkJ+QqFsB7gmYql67m/fQz+AF2IY1D70CTbMhXrBWBV6Ue8gGVnCA6p/gN08qoW5L2dyyJIlbHA8kMmEPv6N9Rat/f3XVICI3kSaaLN8ND1NgADk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707228351; c=relaxed/simple;
	bh=U5rLmH/I8wY2einPi8coHOLWjotImOSQ9fflqCRK/fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gA7Pv9iKHPAY3HIJjZBBz2TMJWN/cSJE1Yg1dB7EoDF+K6FUq/yZRXILAcA4NX9anD5Mww7FM/LIbqOPFfHYEzwToKJEjMIPtoVv3MkYlA8KO6gibmSZGi/brS7WL/3uKFH+kDD57Biv27EaafQO/lPiWZKXRNdeEw859mLK+jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fbsbcM+E; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707228350; x=1738764350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U5rLmH/I8wY2einPi8coHOLWjotImOSQ9fflqCRK/fc=;
  b=fbsbcM+ExcgtIpukKR4UfezZSnH8NIptNEJxdreMpi4rmKoW8B/VF+Eu
   hyyALzTW8OhbOSn1XfHOqKvjjQbyNifE+E2u1ul1xjPOIMz3mSTqv7Pa0
   PbSUAN5pOqJ1ETcXRT2odaIMZWn7x9kwc6Rqaqgi1kFIuCpYGQiTcsrBM
   l2RXFy/fUpCFBJw6yp7aYWdLasFxWa1+0N9oYrw+mu28hKiyaZGvdWL1S
   XqAA7awbBqb/x0vgYqq6wzPUmuvqRF8cBngeVi6vRKGuBAoG90sL9NX4L
   UGSyDNQ5dDV4IHvtQMwJ+4Xdqd476TVBuWfQo5e652y1P14FFby3fLAmi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="4630937"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="4630937"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 06:05:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="909644969"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="909644969"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 06:05:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rXM51-00000002MBm-0pQ4;
	Tue, 06 Feb 2024 16:05:43 +0200
Date: Tue, 6 Feb 2024 16:05:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Danny Kaehn <danny.kaehn@plexus.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	bentiss@kernel.org, jikos@kernel.org,
	bartosz.golaszewski@linaro.org, niyas.sait@linaro.org,
	dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: Re: [PATCH v10 3/3] HID: cp2112: Fwnode Support
Message-ID: <ZcI8trjgj6k_OY6I@smile.fi.intel.com>
References: <20240205170920.93499-1-danny.kaehn@plexus.com>
 <20240205170920.93499-4-danny.kaehn@plexus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240205170920.93499-4-danny.kaehn@plexus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 05, 2024 at 11:09:22AM -0600, Danny Kaehn wrote:
> Support describing the CP2112's I2C and GPIO interfaces in firmware.
> 
> I2C and GPIO child nodes can either be children with names "i2c" and
> "gpio", or, for ACPI, device nodes with _ADR Zero and One,
> respectively.

> Additionally, support configuring the I2C bus speed from the
> clock-frequency device property.

This has to be in a separate patch, which may predecess this one.

...

> +		name = fwnode_get_name(child);
> +		if (name) {
> +			ret = match_string(cp2112_cell_names,
> +							ARRAY_SIZE(cp2112_cell_names), name);
> +			if (ret >= 0)
> +				addr = ret;
> +		}
> +		if (!name || ret < 0)
> +			ret = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
> +
> +		if (ret < 0)
> +			continue;

I don't like this piece (esp. due to possible matching with node name which
may not be so reliable), but I have no better solution right now.

Maybe this way (this doesn't particularly solve the issue but seems better
to me)?

		ret = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
		if (ret) {
			/* If no ACPI given or compiled, fallback to matching names */
			name = fwnode_get_name(child);
			if (!name)
				continue;

			ret = match_string(cp2112_cell_names, ARRAY_SIZE(cp2112_cell_names), name);
			if (ret < 0)
				continue;

			addr = ret;
		}


-- 
With Best Regards,
Andy Shevchenko



