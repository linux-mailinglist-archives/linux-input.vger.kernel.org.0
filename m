Return-Path: <linux-input+bounces-4179-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7628FF4BD
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 20:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84FEE28F670
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 18:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA854D5AA;
	Thu,  6 Jun 2024 18:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSeW+yBS"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5104CE0F;
	Thu,  6 Jun 2024 18:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717698763; cv=none; b=qisroQ6lhpWHNbCiudHvigtqxVWK+y/izLsmG7+QH+3jhO4edhk1e0TPG/GNA5IMNTjLPUrth7IQvpFOZrhQnhsWBqFdArWm/l69B1pNpBWNz9O0ghKqrFx/1zXrVRgIZcTOIFUb39/rEWyX4SXULGphv5EepAsoccc2Zt3Hk4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717698763; c=relaxed/simple;
	bh=1qa4o8HDMXL+YJWLoVcmS+g2ahmPaT3STBJiQo/kF3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjnMDPVHPBOXEAbqQhy651WNo74gzwg/YInBN7+jub/fjYTrPGbdMPTvUE/PCEPcss8eZVL9ZFEK1ojw5qLI+WlaemDZH8LzfCBBGVppFkq6x/LlUUALNhzHtPdiOMaLbO6P7QfHD5yceKE4zHmzjWi0SvQoryXLPpYH6ZXEhxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSeW+yBS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717698762; x=1749234762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1qa4o8HDMXL+YJWLoVcmS+g2ahmPaT3STBJiQo/kF3s=;
  b=ZSeW+yBSy1ee0oaVpFv01HKb9Gl5fzbcyc7lICDV3DdWW8px4xbe965v
   HyKmljMo1z2jL3wid1vM/xuizGWnX8tktgYAGUQW3k+OxS84L3vZotizb
   EiKbopxEumDu/C7Pv4tApy292hNN6VxQ5kvzxWBhvGKebzbVG4n6kxEmT
   hiJHIzqgiW63FNOYzsxI0OsauylLAT3xdwn6jmnkpV7d4qTAhCENv/MXt
   PfEIBIi45WomO0ycp+3hSRbVy8RyHc8swmCpawsujf1dyKQHuYqRmwV6e
   I9Uc/6tKoqceNsx8NONlaBglwJoolKm21/1r5uA9SaTeBggV/XasVe2mG
   Q==;
X-CSE-ConnectionGUID: 7dhJwmqsQvqWBTZSBcZy6w==
X-CSE-MsgGUID: FQnWwt5qTNO2pXcLBTWiKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14510928"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14510928"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 11:32:41 -0700
X-CSE-ConnectionGUID: 9sp4gvEbTVCWOmHTpq3woQ==
X-CSE-MsgGUID: 0J9r/fZJRIWxd+AeQwnVgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38137919"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jun 2024 11:32:38 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFHud-0003Zi-2l;
	Thu, 06 Jun 2024 18:32:35 +0000
Date: Fri, 7 Jun 2024 02:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: wangshuaijie@awinic.com, dmitry.torokhov@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, jeff@labundy.com,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, wangshuaijie@awinic.com,
	liweilei@awinic.com, kangjiajun@awinic.com
Subject: Re: [PATCH V2 5/5] Add support for Awinic sar sensor.
Message-ID: <202406070207.ncwHTWh4-lkp@intel.com>
References: <20240605091143.163789-6-wangshuaijie@awinic.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605091143.163789-6-wangshuaijie@awinic.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 32f88d65f01bf6f45476d7edbe675e44fb9e1d58]

url:    https://github.com/intel-lab-lkp/linux/commits/wangshuaijie-awinic-com/dt-bindings-input-Add-YAML-to-Awinic-sar-sensor/20240605-172023
base:   32f88d65f01bf6f45476d7edbe675e44fb9e1d58
patch link:    https://lore.kernel.org/r/20240605091143.163789-6-wangshuaijie%40awinic.com
patch subject: [PATCH V2 5/5] Add support for Awinic sar sensor.
config: x86_64-randconfig-102-20240607 (https://download.01.org/0day-ci/archive/20240607/202406070207.ncwHTWh4-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070207.ncwHTWh4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/input/misc/aw_sar/aw_sar.c:2006:3-8: No need to set .owner here. The core will do it.

vim +2006 drivers/input/misc/aw_sar/aw_sar.c

  2002	
  2003	static struct i2c_driver aw_sar_i2c_driver = {
  2004		.driver = {
  2005			.name = AW_SAR_I2C_NAME,
> 2006			.owner = THIS_MODULE,
  2007			.of_match_table = aw_sar_dt_match,
  2008			.pm = &aw_sar_pm_ops,
  2009		},
  2010		.probe = aw_sar_i2c_probe,
  2011		.remove = aw_sar_i2c_remove,
  2012		.shutdown = aw_sar_i2c_shutdown,
  2013		.id_table = aw_sar_i2c_id,
  2014	};
  2015	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

