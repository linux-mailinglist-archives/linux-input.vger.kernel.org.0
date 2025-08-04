Return-Path: <linux-input+bounces-13811-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E58C5B1A622
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 17:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A55E7A4A88
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 15:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA4121A94F;
	Mon,  4 Aug 2025 15:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hd6exWiN"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FE71F1527;
	Mon,  4 Aug 2025 15:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754321711; cv=none; b=TLeIuIpPVvke4OJnlyTFVkHxDXzW85ZZfHBtpOGsMop8rQ3AfJ4kHw5a1h1ISIfBcqxULmcX+mwcEZ/YK0do/RdSt14ujr2aFFd7nbs3/8HFYxDxBC1rSXkFe5g1KFGiUpaQ2XlDc/ZErtunS5j+SVx6dlJIZgQsqBnsnmkVhWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754321711; c=relaxed/simple;
	bh=29Ldb5UUbUcj8wdaADM/N6FyZf4XIgKKRgzEI5Xt/wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKT6lie8g2uR95kUi95c2EPnI/QEmZNWFEBwVdgKgZDdCRUENxq7ipLTgSE+qFnpIfP89vMQaAiJnOQxv34lzHW/zqKJmAx30ydcKcshIEGxtRxuvepfOmqglAfl94kPj8EqwmJqp5ijXuoWBtybtnhKhS6jolpcU8XP3tdN5c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hd6exWiN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754321710; x=1785857710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=29Ldb5UUbUcj8wdaADM/N6FyZf4XIgKKRgzEI5Xt/wQ=;
  b=hd6exWiNiAdqdUBv/HCR2b9H/QRDhHwhhzuknTn7ZLd1dF2+jylHZCnD
   R/XJwNab1SSY6FnaIKMnk1JJ8RYoht+aqLTMy+DEjHfCJXZRSBcbpo+dv
   dbkGgZDp3aIkuiMCI1brjWaK7AVGoG+NigB41okFd+gRXg0/S3em8UuCO
   ATELx8M88TRpabgUAKyqT/xMZKCMwWdupkTsNYLfgGDVHaBqHNfdaXGUv
   7lpwiPAJc0rjJ2AgkyYb4HRSO6ZgaNFtwb2SQ3izAsMe0MHbLTXDYI2yL
   hF5QGwSRTejeQzgIi0zAIQJzB2fb7sfaClH0PwXEYG87DAFCTQWu88zG4
   g==;
X-CSE-ConnectionGUID: cdFzcc6xRP6I7AmCHEc8/Q==
X-CSE-MsgGUID: fAOEhwsGSDy2+DOBJyK6Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="60419968"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="60419968"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 08:35:09 -0700
X-CSE-ConnectionGUID: 6oTGNMSHRcC6i+s+QPQf4w==
X-CSE-MsgGUID: UE5ZDn0lR12koFaaGN9RVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164642061"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 04 Aug 2025 08:35:08 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uixDN-00006d-27;
	Mon, 04 Aug 2025 15:35:05 +0000
Date: Mon, 4 Aug 2025 23:34:40 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	jikos@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, bentiss@kernel.org, luguohong@xiaomi.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH 2/2] HID: input: report battery status changes immediately
Message-ID: <202508042305.PBym6Evd-lkp@intel.com>
References: <20250804091215.6637-2-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250804091215.6637-2-jose.exposito89@gmail.com>

Hi José,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.16 next-20250804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jos-Exp-sito/HID-input-report-battery-status-changes-immediately/20250804-171355
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20250804091215.6637-2-jose.exposito89%40gmail.com
patch subject: [PATCH 2/2] HID: input: report battery status changes immediately
config: arm-randconfig-004-20250804 (https://download.01.org/0day-ci/archive/20250804/202508042305.PBym6Evd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508042305.PBym6Evd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508042305.PBym6Evd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/hid-input.c:651:13: warning: 'hidinput_update_battery_charge_status' defined but not used [-Wunused-function]
     651 | static bool hidinput_update_battery_charge_status(struct hid_device *dev,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hidinput_update_battery_charge_status +651 drivers/hid/hid-input.c

581c4484769e69 Dmitry Torokhov 2017-08-01  650  
133568dfb5acfa José Expósito   2025-08-04 @651  static bool hidinput_update_battery_charge_status(struct hid_device *dev,
133568dfb5acfa José Expósito   2025-08-04  652  						  unsigned int usage, int value)
581c4484769e69 Dmitry Torokhov 2017-08-01  653  {
133568dfb5acfa José Expósito   2025-08-04  654  	return false;
581c4484769e69 Dmitry Torokhov 2017-08-01  655  }
a608dc1c06397d José Expósito   2022-11-24  656  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

