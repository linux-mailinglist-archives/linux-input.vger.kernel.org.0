Return-Path: <linux-input+bounces-4181-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AC38FF576
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 21:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 227881F24199
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 19:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2A161FC7;
	Thu,  6 Jun 2024 19:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRr+DEWb"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C0C4AEF6;
	Thu,  6 Jun 2024 19:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717703347; cv=none; b=jCWgBEkk5Mx9oiFkam/Jw5cBQI3eYfyI+axLbClJZIWmpvvRL/bTEbfnPjpprmVZP+L+lmZIIBZ7K2hWCkS+H9jnqRnIoIDUe2imWJSWSJpTH+TvDDC4Rvnba8TmFSjs0dLYipK5w4IPURAst5jSwgVbshQ6F2DaiV8xMpAJiA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717703347; c=relaxed/simple;
	bh=x2mYAl6dqfLgc7jejNej7ObYsOE1I25mTO2tK8cQjfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCfZwz1e+05krQ/y7lHX5y7NE/lt6Mt4kNxSbQRIUgAAuWhEdDiyBsCIe5vlotiB0+9PdhfT0awyCX6fXA+Q5/HF8aObYX59o3H9JwC8CD2IPeLtrDs+y8sit6kfp2TIeO2aWJ9LtcSkYrgjpn7yUmAyfugaPHSOEioaBeenmUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRr+DEWb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717703346; x=1749239346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=x2mYAl6dqfLgc7jejNej7ObYsOE1I25mTO2tK8cQjfE=;
  b=GRr+DEWboTwFzvorCY7c9JuyevaWp/BV/vzge15r6hxUcwqeWfxXy8WD
   17P8/xK63D04WtmtbRQsF4Dk13hTHmMc2r/h1SHKDlPd8jqaPQ4gPvHOE
   j5t4STHDV3Jy4stEQ5MSUPQvjPTJ0Z+0rZ9Fomf6xPAorKSNTIjFMYpt6
   z3LK1NxvfBES3MvlPPOdbtJReRuF9fh12y1C6gu7cpVgWlCYmF/CxRjtV
   sSyn46NE4Ef3dIhqbCWqmschaEntSjFChnMM2ruI1ZZtLgD7W6/Fq+4VI
   Zcj1RvspQoaV86nvw/jMuBPyRSYFlyNgHISSYqcUwnvLacRZN6cDJWID6
   A==;
X-CSE-ConnectionGUID: LSak0i5VT9K+dN9LfN0FKQ==
X-CSE-MsgGUID: 5LlmZZKvSVG50vQ0ZdQgUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="39804496"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="39804496"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 12:49:05 -0700
X-CSE-ConnectionGUID: CNnrzqB2SquvdIikYEg83w==
X-CSE-MsgGUID: pj6ZYBzjQg+5EHUrhVZguA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38025763"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 12:49:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sFJ6a-0000000EIkn-1bER;
	Thu, 06 Jun 2024 22:49:00 +0300
Date: Thu, 6 Jun 2024 22:49:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Danny Kaehn <danny.kaehn@plexus.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Ethan Twardy <ethan.twardy@plexus.com>
Subject: Re: [PATCH v11 1/4] dt-bindings: i2c: Add CP2112 HID USB to SMBus
 Bridge
Message-ID: <ZmISrFrUVadRS1Do@smile.fi.intel.com>
References: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
 <20240605-cp2112-dt-v11-1-d55f0f945a62@plexus.com>
 <20240606151859.GA3605325-robh@kernel.org>
 <20240606162438.GA77976@LNDCL34533.neenah.na.plexus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240606162438.GA77976@LNDCL34533.neenah.na.plexus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jun 06, 2024 at 11:24:38AM -0500, Danny Kaehn wrote:
> On Thu, Jun 06, 2024 at 09:18:59AM -0600, Rob Herring wrote:
> > On Wed, Jun 05, 2024 at 06:12:44PM -0500, Danny Kaehn wrote:

...

> > > +  i2c:
> > > +    description: The SMBus/I2C controller node for the CP2112
> > > +    $ref: /schemas/i2c/i2c-controller.yaml#
> > > +    unevaluatedProperties: false
> > > +
> > > +    properties:
> > > +      sda-gpios:
> > > +        maxItems: 1
> > > +
> > > +      scl-gpios:
> > > +        maxItems: 1
> > 
> > These are because I2C can be on any of the pins? It's a bit odd if they 
> > aren't used as gpios. Probably should be pinmux, but that's overkill for 
> > 2 pins.
> >
> 
> I'm beginning to realize now that this may be a bit non-standard, but it
> did solve a stuck bus issue under some conditions.
> 
> The CP2112's I2C controller is self-contained and can only be on the
> specific pins it is attached to (no pinmux, etc..).
> 
> In this case, these properties are ment to specify additional gpio pins
> which are connected to the SCL and SDA lines (this then also assumes those
> are configured to be open drain / inputs to not interfere with the bus
> during normal operation). This was inspired by what is done ini2c-imx.yaml,
> but I realize this is a bit different due to using external pins rather
> than pinmuxing to the GPIOs.
> 
> How I used this was to actually connect some of the CP2112's own GPIO pins
> to the SDA and SCL lines to be able to use those pins to recover the
> bus. This was able to solve a stuck bus under some real-world cases with
> the v2 of the CP2112 containing an errata which caused this
> semi-frequently.

Aren't they just for I²C recovery?

-- 
With Best Regards,
Andy Shevchenko



