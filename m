Return-Path: <linux-input+bounces-12257-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A82AB1FA5
	for <lists+linux-input@lfdr.de>; Sat, 10 May 2025 00:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E87D01BC7B68
	for <lists+linux-input@lfdr.de>; Fri,  9 May 2025 22:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F96D2609D5;
	Fri,  9 May 2025 22:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HT5LieFJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5A424166F;
	Fri,  9 May 2025 22:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746828430; cv=none; b=ctb7MF40hKkpWZIXiSBt2ArDjjETGAlVpr4UIzAIzruxbahZIAvjPaRVeQjxH8cd3q9+gXMrg81AmB10gWvmdHgFqperKM4A+FS3DLYCwxB0O2N/MaXRJWf2TQ4WpJBgwhdrHXuVUVYTRr7Hpz7CQt1VSI3Yubl66rZMkRWThig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746828430; c=relaxed/simple;
	bh=qzolQ9zAXlix8Uv4YMfcm3JAjVfSoZCJhSBzEM48lDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+3AfGwBAJeYvI8V4SvAAZdn/DBPPhj3nS70AWYAK3zcveIdpSph4kEtol8le7DPIzNDmM7cmuE4SqZkCVu4VfZBtiUK+RxZPBNFvHiruJMheYk1mLkk5wTE0iRRKcqBt9Mp8hgjPLfmDxgbvFDjnXG6RAg1joYbg/Bnwx23zUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HT5LieFJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746828425; x=1778364425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qzolQ9zAXlix8Uv4YMfcm3JAjVfSoZCJhSBzEM48lDI=;
  b=HT5LieFJllkbYqumvbtYaySEUfjYPRzar7XFWaM59FSzOT2OiRaDlgwd
   Bg3Q7U3qvRPkFiyRT2Ln6CbVx/r0w59DA8bGdrR/vb22TeRrQCdj4d0uX
   OCWK1vDmojZMtNmdVff2zUPYbnAxUbunBiOPfAVKz5yi7pYIk0hyVKfjv
   Sm95LWnY/Ezn3IsBju2UTuAw7UezNKwAuFcUsID0wl6fxcfTdOA6FwKyB
   UC31AOfbY+npZZkd/KizNLB0tYUvjFfILmeL6rAB+SpD7RiQ33/wJZNLq
   qYzjpibEG5c9cFhK1v1Ki+DuXKq8ZanDXGhonvY1WaSAe+hNClxd04VcY
   g==;
X-CSE-ConnectionGUID: 7ICG+aO2QcakdpRNieixXw==
X-CSE-MsgGUID: 484ieHPzSv2aOmggQAYyLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59667271"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="59667271"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 15:07:05 -0700
X-CSE-ConnectionGUID: FEOYnr/RQQeBO3ypicW14Q==
X-CSE-MsgGUID: NxVB0DElS+KMK/v+55P5sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="137683755"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 May 2025 15:07:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDVrx-000CWx-0U;
	Fri, 09 May 2025 22:07:01 +0000
Date: Sat, 10 May 2025 06:06:34 +0800
From: kernel test robot <lkp@intel.com>
To: Vadym Tytan <titanv3585@gmail.com>,
	Roderick Colenbrander <roderick.colenbrander@sony.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Vadym Tytan <titanv3585@gmail.com>
Subject: Re: [PATCH] HID: playstation: DS4: Add BT poll interval adjustment
Message-ID: <202505100535.vKH3zHW6-lkp@intel.com>
References: <20250508214305.836406-1-titanv3585@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508214305.836406-1-titanv3585@gmail.com>

Hi Vadym,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.15-rc5 next-20250509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadym-Tytan/HID-playstation-DS4-Add-BT-poll-interval-adjustment/20250509-054413
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20250508214305.836406-1-titanv3585%40gmail.com
patch subject: [PATCH] HID: playstation: DS4: Add BT poll interval adjustment
config: x86_64-randconfig-122-20250509 (https://download.01.org/0day-ci/archive/20250510/202505100535.vKH3zHW6-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505100535.vKH3zHW6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505100535.vKH3zHW6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/hid-playstation.c:1773:25: sparse: sparse: symbol 'dev_attr_dualshock4_bt_poll_interval' was not declared. Should it be static?

vim +/dev_attr_dualshock4_bt_poll_interval +1773 drivers/hid/hid-playstation.c

  1772	
> 1773	struct device_attribute dev_attr_dualshock4_bt_poll_interval = {
  1774		.attr	= { .name = "bt_poll_interval", .mode = 0644 },
  1775		.show	= dualshock4_show_poll_interval,
  1776		.store	= dualshock4_store_poll_interval,
  1777	};
  1778	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

