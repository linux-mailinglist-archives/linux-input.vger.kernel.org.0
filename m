Return-Path: <linux-input+bounces-12404-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EED26ABA8C5
	for <lists+linux-input@lfdr.de>; Sat, 17 May 2025 09:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C54559E8247
	for <lists+linux-input@lfdr.de>; Sat, 17 May 2025 07:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9251D5AC0;
	Sat, 17 May 2025 07:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f85PPfWr"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C250F19047F;
	Sat, 17 May 2025 07:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747468401; cv=none; b=MLAU+Jp7Jx6aTZqzSH7rhAPMoEya35EWCWtSJFZd1aqkoa6xUisScdD0e/WMJ8dxuUYQ09Z0e25+TZdHT1XazlTPO/ECyaJUMLFejhyw41eg1cYLUqJr3Y4O7NfWs+4QVhCOo+vJJPSXJyDECK8LySLnbztfYHAY7JCiqiD0wgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747468401; c=relaxed/simple;
	bh=bkyAutU5aluPJG5m0qPDsBW2dnn+e6enuHRk5zy1yFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CfbrnKlOxHwOseZ/hicAMArvLGEG60/FfFT40A4AnBspEqkuCGest7rAgd7iOw2wiFIat83VALDZ37oXw09k2nRA9FMYDXxgnfJMcMjvl2iDkMnA251n0ZFEku0kEURm8xOMRohsrT46BFMuG1Q4tPv9dcSHMpnlVzKd1dWqCvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f85PPfWr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747468399; x=1779004399;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bkyAutU5aluPJG5m0qPDsBW2dnn+e6enuHRk5zy1yFY=;
  b=f85PPfWrqO+DPERBW2hF9Q+6CttejKBV49+cBmPC3n534kAyjfAjqHvp
   O2A0v1UoBPTMwIADL9AcXXsC624ILAVs/IySbikgSrHuPm0eoOjWn4OCi
   wZvbns2nYXfrdm3yd+J5zss60gb7AOyF7wxCb+3sBZx8nIJr4P7yxVycg
   qWIh9koLwl7wA2oAN77SOU66XDmyyg0SSUPMKEQumn3AeILK0o7mp3WnJ
   2Zw872/ZsSpjT8RG4AbQUwDP2KB8HrwRgUUreJaLYinQP/6PIsQ5wiJgF
   VnFUcTqnV4AUcPdgu3cZ9rXWFAOyOpob7ww+JfmnAdJYZKdj/JM+6mzh6
   Q==;
X-CSE-ConnectionGUID: jRxeT8UnRKqm/2FxYXyRDQ==
X-CSE-MsgGUID: h5bIKQVSTjyHAqH+rNDIYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60779423"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="60779423"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 00:53:18 -0700
X-CSE-ConnectionGUID: OaTLfoUeSamInBJ4Ny9vxQ==
X-CSE-MsgGUID: FTIsr3dGQ0uFyh6EnhFRew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="138808544"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 May 2025 00:53:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGCM5-000K0V-29;
	Sat, 17 May 2025 07:53:13 +0000
Date: Sat, 17 May 2025 15:53:05 +0800
From: kernel test robot <lkp@intel.com>
To: Even Xu <even.xu@intel.com>, jikos@kernel.org, bentiss@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Even Xu <even.xu@intel.com>,
	Chong Han <chong.han@intel.com>
Subject: Re: [PATCH v1 7/7] HID: Intel-thc-hid: Intel-quicki2c: Add two new
 features to PTL
Message-ID: <202505171535.Yrj5T8jh-lkp@intel.com>
References: <20250514061944.125857-8-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514061944.125857-8-even.xu@intel.com>

Hi Even,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.15-rc6 next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Even-Xu/HID-Intel-thc-hid-Intel-thc-Add-thc_dma_content-into-kernel-doc/20250514-142347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20250514061944.125857-8-even.xu%40intel.com
patch subject: [PATCH v1 7/7] HID: Intel-thc-hid: Intel-quicki2c: Add two new features to PTL
config: x86_64-randconfig-121-20250517 (https://download.01.org/0day-ci/archive/20250517/202505171535.Yrj5T8jh-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505171535.Yrj5T8jh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171535.Yrj5T8jh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c:21:23: sparse: sparse: symbol 'ptl_ddata' was not declared. Should it be static?

vim +/ptl_ddata +21 drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c

    20	
  > 21	struct quicki2c_ddata ptl_ddata = {
    22		.max_detect_size = MAX_RX_DETECT_SIZE_PTL,
    23	};
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

