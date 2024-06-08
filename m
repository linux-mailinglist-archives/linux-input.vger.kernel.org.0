Return-Path: <linux-input+bounces-4243-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E9A900F3E
	for <lists+linux-input@lfdr.de>; Sat,  8 Jun 2024 04:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7228C1F2263C
	for <lists+linux-input@lfdr.de>; Sat,  8 Jun 2024 02:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CBBBE4D;
	Sat,  8 Jun 2024 02:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdtUBxd/"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330E58C05;
	Sat,  8 Jun 2024 02:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717813386; cv=none; b=AbbD41DL5Kv6BvI1lNRtMuYXLPtqMimzYPWN9uojzM7+ckkKOL+xSSJot9ZuOYC74Dw5HvQAA8TeKGggE/ZX7PmmejTgDtzOA63ccZgsJVfR/WgJZenhKiBqq1rojV9IZck09fpMBBUoiS7nmxUegn5cHLWTheDZk6mOg3181pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717813386; c=relaxed/simple;
	bh=jxTmO74D+6vADQ2Xmg68XfWJXA/J18hIQnFFA7Ko9u8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MAia10MXgg6lf2X/KhX6QMHyzvrQf33igJcznlnvWk7draYXT4BdZVhtg9YdsYwYSBdmGIlKKMvVoOErsX74tN4gFaa91ve75qkj3stTdz5hKJXfWaU4eHbPhN90llrKQ+kN6+ASda6s6phpIxyuxZeN4nXDr8BnFXOHYIXDNCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdtUBxd/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717813384; x=1749349384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jxTmO74D+6vADQ2Xmg68XfWJXA/J18hIQnFFA7Ko9u8=;
  b=AdtUBxd/1NxVtOraWJAvkU+Vh20opPDfzlRMRgKAOcpJd9onAiFYFoGH
   2+d6hcWWzCz/Q3dCrVllySKM1xANJUnBGK2AnlETOFsOcr2V1wpy3MKwW
   KbXkWdO+J1pA4TEUza5R2UmgZ61A+7hcCPbrB87SgMOfiH64F0dTVcBjD
   1EBPNPfNl0gzPXCLxMrxz8Rv2g19/bvddbFZJ5uTPTmq9itFqHxtduL/L
   PYIsIuwlLv95YlxRLcrJF9GT17xWnTT8v9FyVVXkXD7xSZ02VF/1DRtGD
   0o/99ahcE3lVBqzfdmTVv/gDRfQ0s3SLI4GRQOuG1SXOtxN5BerIV5ZkQ
   A==;
X-CSE-ConnectionGUID: 02vEoETXRhWNqOt/n/APzQ==
X-CSE-MsgGUID: Y4EnGjqZRLae/mPaYedPHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25126116"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="25126116"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 19:23:03 -0700
X-CSE-ConnectionGUID: a6eIpv6YTWupXaVjcl4nLQ==
X-CSE-MsgGUID: 5KjNWwhaRXejfETX6IKdHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="38444895"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Jun 2024 19:23:00 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFljN-0000r6-2F;
	Sat, 08 Jun 2024 02:22:57 +0000
Date: Sat, 8 Jun 2024 10:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: wangshuaijie@awinic.com, dmitry.torokhov@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, jeff@labundy.com,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, wangshuaijie@awinic.com,
	liweilei@awinic.com, kangjiajun@awinic.com
Subject: Re: [PATCH V2 5/5] Add support for Awinic sar sensor.
Message-ID: <202406081000.gRWyFGXO-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 32f88d65f01bf6f45476d7edbe675e44fb9e1d58]

url:    https://github.com/intel-lab-lkp/linux/commits/wangshuaijie-awinic-com/dt-bindings-input-Add-YAML-to-Awinic-sar-sensor/20240605-172023
base:   32f88d65f01bf6f45476d7edbe675e44fb9e1d58
patch link:    https://lore.kernel.org/r/20240605091143.163789-6-wangshuaijie%40awinic.com
patch subject: [PATCH V2 5/5] Add support for Awinic sar sensor.
config: arm-randconfig-r061-20240608 (https://download.01.org/0day-ci/archive/20240608/202406081000.gRWyFGXO-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081000.gRWyFGXO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081000.gRWyFGXO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: power_supply_reg_notifier
   >>> referenced by aw_sar.c
   >>>               drivers/input/misc/aw_sar/aw_sar.o:(aw_sar_i2c_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: power_supply_unreg_notifier
   >>> referenced by aw_sar.c
   >>>               drivers/input/misc/aw_sar/aw_sar.o:(aw_sar_i2c_probe) in archive vmlinux.a
   >>> referenced by aw_sar.c
   >>>               drivers/input/misc/aw_sar/aw_sar.o:(aw_sar_i2c_probe) in archive vmlinux.a
   >>> referenced by aw_sar.c
   >>>               drivers/input/misc/aw_sar/aw_sar.o:(aw_sar_i2c_probe) in archive vmlinux.a
   >>> referenced 2 more times
--
>> ld.lld: error: undefined symbol: power_supply_get_property
   >>> referenced by aw_sar.c
   >>>               drivers/input/misc/aw_sar/aw_sar.o:(aw_sar_ps_notify_callback) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

