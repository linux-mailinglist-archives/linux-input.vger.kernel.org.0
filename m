Return-Path: <linux-input+bounces-4142-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 296788FDABA
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 01:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29C801C22A7B
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 23:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA79216729E;
	Wed,  5 Jun 2024 23:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V2c+UgVN"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABF0167268;
	Wed,  5 Jun 2024 23:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717630774; cv=none; b=feU7FfmWymawE93kBigC5AUmWhV5z0IONcqPubEJc9vz81kUvagiwkaclXS1iz/7czpkdl3SGGqHB9uV6ZlJZVg4DZy3G5J1cVoT69jaNebBAOTOC+/6gakiHHDOsJjPdz3JC7oC8GcecEzJLgX2Y34F3G3VMCXuH8bCUT9i5mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717630774; c=relaxed/simple;
	bh=yVrk47VcEBvHwW/Z8SnNVL+vol7zsquiS9Ho/zNXZSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4/201Z4eGtaJ+jJdkVkjNJ9Ig4+TKfA+8RBoxSEhZTnET/rdPSFvrsRnpYSV4vw3M6MDXDmv8OazHSficQYzn2grea9FEnjlbnd6RKU+QV3900wm/KWPFwUTLIVA8GQKon9RZgflFqg2xF2kUPdsGrzyB+nTSboayMn5rEUUCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V2c+UgVN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717630773; x=1749166773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yVrk47VcEBvHwW/Z8SnNVL+vol7zsquiS9Ho/zNXZSk=;
  b=V2c+UgVN9C6dg7reD4aGw1/VDEbJYb7PFX6NOzIMCBVsxz0oVShAy4XJ
   SKuVMKyZtsGI9BgnfrqkixHi0KPOYMZf1uTqOryqNSWyF1/zTBSqK8adA
   JjQHy/zFfYHowq094DyXBxOaexr4W7PF8YugekrRWi7OzcXrMTtPc8teC
   BrP8p5kyHg570/iA1Hh2WzYataCMVI29brbnWm82GaNgiw8whl+93nyuf
   bEBYi/vTRr77UqbQpz+zk7eaM6JTaB2H3ycis+M3jfb0eJ7krfT3/gZcx
   rPYQLA5GtABGi/eSiKa2rwox8Dj1MdAQ0I7GgmsxKU+i72LpBXmlIZMHY
   g==;
X-CSE-ConnectionGUID: uKC5TvjcQgqqq2yaiKPFJQ==
X-CSE-MsgGUID: fO7e9w3OR1Kv+A4nqyQHMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="24844241"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="24844241"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 16:39:32 -0700
X-CSE-ConnectionGUID: CK9GPhE0QISyJnnA0SA9OA==
X-CSE-MsgGUID: t3k4IZTwTjefwn280ZET4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="37835815"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 16:39:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sF0E3-0000000E031-2y1f;
	Thu, 06 Jun 2024 02:39:27 +0300
Date: Thu, 6 Jun 2024 02:39:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Danny Kaehn <danny.kaehn@plexus.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Ethan Twardy <ethan.twardy@plexus.com>
Subject: Re: [PATCH v11 3/4] HID: cp2112: Fwnode Support
Message-ID: <ZmD3L0YGm977BBmV@smile.fi.intel.com>
References: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
 <20240605-cp2112-dt-v11-3-d55f0f945a62@plexus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605-cp2112-dt-v11-3-d55f0f945a62@plexus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jun 05, 2024 at 06:12:46PM -0500, Danny Kaehn wrote:
> Support describing the CP2112's I2C and GPIO interfaces in firmware.
> 
> The GPIO chip shares a firmware node with the CP2112. The I2C child
> node can either be a child with the name "i2c" or, in ACPI, a device
> node with _ADR Zero.

...

> +	device_for_each_child_node(&hdev->dev, child) {
> +		ret = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
> +		if (ret) {
> +			name = fwnode_get_name(child);
> +			if (!name)
> +				continue;
> +			ret = match_string(cp2112_cell_names,
> +					ARRAY_SIZE(cp2112_cell_names), name);
> +			if (ret < 0)
> +				continue;
> +			addr = ret;
> +		}
> +
> +		switch (addr) {
> +		case CP2112_I2C_ADR:
> +			device_set_node(&dev->adap.dev, child);
> +			break;

		default:
			break;

?

> +		}
> +	}

-- 
With Best Regards,
Andy Shevchenko



