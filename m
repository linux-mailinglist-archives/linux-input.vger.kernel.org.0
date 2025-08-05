Return-Path: <linux-input+bounces-13829-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF07DB1BBC3
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 23:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE4DD18A5076
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 21:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C69218ACC;
	Tue,  5 Aug 2025 21:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bIhQMfOS"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101BB1C8633;
	Tue,  5 Aug 2025 21:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754429532; cv=none; b=QFeqTQ+tFZ270xnwAL0ZE/icAHesEGgu9IIrRJbhs0+gTdclkO6Tcb2TxoOp5zNLo/uYcrNbKop41Oj0LuM1gTJil9ZU/Z0W/1mjEJWYoFBD6mU/FEgZa/SJ97kxzO0YEl2KQdFHyK9oNH+vIAZHA1AOFBIIIqjtM/NeGp0c+cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754429532; c=relaxed/simple;
	bh=ldwf5W7T+7CJjPkbQHiEy0ZwCv91sQ3XtdOVhU9/DUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzrXs40m/m3uEn8RLvZ1h23TXHJAH2TQ/1QZwMhnhdUAP9cTD9UEh/h3ESAFgbPGaaLwZqpbS3LSCOHGDu1z1IsbMPUwwPe2AL/dlrnNXtNDIQPsHPw7PUiWdtKUOD0MuWVl11ZGVuQAtj2xnBh7/rG9ujiqN9DhlcQKF9vTPV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bIhQMfOS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754429531; x=1785965531;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ldwf5W7T+7CJjPkbQHiEy0ZwCv91sQ3XtdOVhU9/DUc=;
  b=bIhQMfOSCvl8dxus1fvwEb1G7l0gOA9/d1fWGnres5A9Kri+5quMEcr5
   MexOTsyln/hqKRkgE+8TF+iouwArnzXlmqxpkSjudbh8QuS/ykBWjwDss
   WUzgtbZMqZ/Qhd13UvX+j5DzK5YsmbYnONaS00pKZKyH09q5EORueQ/JD
   PUofsmlkrvw7lJR18zUfKpuLFXGl3gEJCoJIeTQDWuX1yswNmMf/R8WFo
   cdF8K9M32GCQ5E/x/bE6FdBx8N6xq/z4pc1CgQe4sMmKXRoQkv/UioX/e
   YKWN6IgcTGwbCOIxi8uKeAu1ai7z/XbkVWL2qq09D5niPhrOny0mJ636J
   A==;
X-CSE-ConnectionGUID: xmNDeYafT0GR8e2th9uH6w==
X-CSE-MsgGUID: 630FUHypRpemvuNrVyhQIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56875535"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="56875535"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 14:32:10 -0700
X-CSE-ConnectionGUID: sS+4LaZBRxWUPoJHjnyjmg==
X-CSE-MsgGUID: xwqXsN4iS6q1y+pqves5PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="188275254"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 14:32:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ujPGN-00000003rEk-3LnA;
	Wed, 06 Aug 2025 00:32:03 +0300
Date: Wed, 6 Aug 2025 00:32:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Danny Kaehn <danny.kaehn@plexus.com>
Cc: Willie Thai <wthai@nvidia.com>, bartosz.golaszewski@linaro.org,
	bentiss@kernel.org, devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com, ethan.twardy@plexus.com,
	jikos@kernel.org, krzk+dt@kernel.org, linux-input@vger.kernel.org,
	robh@kernel.org, tingkaic@nvidia.com, rastekar@nvidia.com,
	dkodihalli@nvidia.com, mhn@nvidia.com, arundp@nvidia.com
Subject: Re: Re [PATCH v11 0/4] Firmware Support for USB-HID Devices and
 CP2112
Message-ID: <aJJ4U_qJY63jIvZm@smile.fi.intel.com>
References: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
 <20250729145350.3538324-1-wthai@nvidia.com>
 <20250729174951.GB4111945@LNDCL34533.neenah.na.plexus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250729174951.GB4111945@LNDCL34533.neenah.na.plexus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 29, 2025 at 12:49:51PM -0500, Danny Kaehn wrote:
> On Tue, Jul 29, 2025 at 02:53:50PM +0000, Willie Thai wrote:
> > Hi Danny,
> > 
> > I hope this message finds you well.
> > Thank you for the patch set — it’s exactly what we need for the I2C-over-USB feature in our new products.
> > Could you please let us know when we can expect the next version of the patch set?
> > If you've paused work on it, we're happy to take over and continue from where you left off.
> > 
> > Thanks!
> 
> Thanks for reaching out!
> 
> Apologies, I haven't been working on this in a while, and have only been able
> to intermittently return to attempt to bring it forward.
> 
> Feel free to take over and move this forward! I'm not sure what the protocol
> is for that, as far as changelogs and versions and whatnot. If your product's
> timeline for needing this mainlined is not urgent; however, I can prioritize
> coming back to this and having a v12 submitted, likely by the end of next
> week, to remove the overhead needed for you to assume ownership of the
> patchset.
> 
> The last several versions of this patchset have all revolved around trying
> to get this change working for ACPI as well as DeviceTree in such a way which
> make the ACPI and DeviceTree interface/binding acceptable to their respective
> maintainers. With this latest version, it seemed that there was not going to
> be any consensus between the two firmware languages, so it seemed an entirely
> different binding/interface and corresponding logic in the device driver
> would be needed. This seems unfortunate, as it seemed the whole purpose of
> the fwnode / device_*() functions was to unify the driver interface to the
> firmware language used... but this is presumably a special case, being almost
> exclusively a device composed of different generic device functions...
> 
> Let me know if you plan to take this over and if there's any
> documentation/context/test procedures you would need from me; else I would be
> happy to start moving this forward again now that there is someone waiting
> on it.

Right and I'm, for instance, lost the context long time ago, so please Cc me on
a new version to have a fresh look at it.

-- 
With Best Regards,
Andy Shevchenko



