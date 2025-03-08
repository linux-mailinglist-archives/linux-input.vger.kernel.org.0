Return-Path: <linux-input+bounces-10642-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C410A577B9
	for <lists+linux-input@lfdr.de>; Sat,  8 Mar 2025 03:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3092B7A7477
	for <lists+linux-input@lfdr.de>; Sat,  8 Mar 2025 02:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0F2146A72;
	Sat,  8 Mar 2025 02:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jI5dVtmp"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD5BC8EB;
	Sat,  8 Mar 2025 02:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741402551; cv=none; b=eFwzC4imyon0rkFe25fkMD6+Wt5RXQZHUIilJRuxWUjZVa1/rWnGP89TITDKzxEP0fscvlH59Wa+wtF4gkligDc5KB/vJ9Dx8qWsFH1JcQdme4PbWIgYyMFfn8ihVxdG5HgtUOVMkVu8reMTvcbrfGvXdGvm3zbfKtFPUirGkYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741402551; c=relaxed/simple;
	bh=OgLe/TVHlI8PQ2TzGXiuS59t0LVkdTCnfy5f9AbwGsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7KRJcudDy0mrHNWjMN3AKX71bAggh8yCistmpaP9735n+g/Nt0EeUhJUM3q6YJ+huLeo5aTAyZKY2516YtSjfbWewsPOIZN5/e3XsN1Ziji0s6Ok9t8D159wvpB3NX2BOtxixImOTIAPRTRZAJxaUhNF+RyOvg2KsjqNrAhGME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jI5dVtmp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741402550; x=1772938550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OgLe/TVHlI8PQ2TzGXiuS59t0LVkdTCnfy5f9AbwGsk=;
  b=jI5dVtmpCDQpqGIxsFJeKYsLpgMW/4cd62gS++KaYEt6tGfJ1aMBprCD
   +5QvkSOiEn/aajwsYDgEwQNOFOlAF3mOmzGPYZ0ly4968nupSzCuEbGKk
   kfPPpoMalsr6YkvqXfdjrSxVsBXOTxa6djLfF2ZAmXobVgbeTgVWiuxH3
   feKfZEzAIk0VIwnLnsgMm0g3Q1W60GqS/Ijk7s/yzoW0hizZUdpLJqQ7+
   JtvzcHfsN+z0buAjDT81r4AzzKSzerGkCMQH6NGIC61GZS09iLKwdyWmt
   kSN1Aedrfb0LZllXY7xX1eT6yzOhQ+PKhpDDyhJ8otTIfy6qCIau9QHTO
   A==;
X-CSE-ConnectionGUID: k2RTAcTgQdOAYzdED5E3+g==
X-CSE-MsgGUID: sF9v3E8/Tc2BzfB/iWLI2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="67829946"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="67829946"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 18:55:49 -0800
X-CSE-ConnectionGUID: b2iXX8kwS/KP0fcr/2ac4A==
X-CSE-MsgGUID: ENYvoTDaQO+lSIlVtXA0cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124711463"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 07 Mar 2025 18:55:47 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqkLo-0001OO-11;
	Sat, 08 Mar 2025 02:55:44 +0000
Date: Sat, 8 Mar 2025 10:55:24 +0800
From: kernel test robot <lkp@intel.com>
To: Luke Jones <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org, bentiss@kernel.org, jikos@kernel.org,
	mario.limonciello@amd.com, "Luke D. Jones" <luke@ljones.dev>
Subject: Re: [PATCH v3 2/2] platform/x86: asus-wmi: Refactor Ally
 suspend/resume
Message-ID: <202503081003.gNlKWt4M-lkp@intel.com>
References: <20250227085817.1007697-3-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227085817.1007697-3-luke@ljones.dev>

Hi Luke,

kernel test robot noticed the following build errors:

[auto build test ERROR on hid/for-next]
[also build test ERROR on linus/master v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luke-Jones/hid-asus-check-ROG-Ally-MCU-version-and-warn/20250227-165941
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20250227085817.1007697-3-luke%40ljones.dev
patch subject: [PATCH v3 2/2] platform/x86: asus-wmi: Refactor Ally suspend/resume
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250308/202503081003.gNlKWt4M-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081003.gNlKWt4M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081003.gNlKWt4M-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hid/hid-asus.c:29:
   include/linux/platform_data/x86/asus-wmi.h: In function 'set_ally_mcu_hack':
>> include/linux/platform_data/x86/asus-wmi.h:168:16: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
     168 |         return -ENODEV;
         |                ^
   include/linux/platform_data/x86/asus-wmi.h:166:20: note: declared here
     166 | static inline void set_ally_mcu_hack(bool enabled)
         |                    ^~~~~~~~~~~~~~~~~
   include/linux/platform_data/x86/asus-wmi.h: In function 'set_ally_mcu_powersave':
   include/linux/platform_data/x86/asus-wmi.h:172:16: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
     172 |         return -ENODEV;
         |                ^
   include/linux/platform_data/x86/asus-wmi.h:170:20: note: declared here
     170 | static inline void set_ally_mcu_powersave(bool enabled)
         |                    ^~~~~~~~~~~~~~~~~~~~~~


vim +/return +168 include/linux/platform_data/x86/asus-wmi.h

   159	
   160	#if IS_REACHABLE(CONFIG_ASUS_WMI)
   161	void set_ally_mcu_hack(bool enabled);
   162	void set_ally_mcu_powersave(bool enabled);
   163	int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
   164	int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
   165	#else
   166	static inline void set_ally_mcu_hack(bool enabled)
   167	{
 > 168		return -ENODEV;
   169	}
   170	static inline void set_ally_mcu_powersave(bool enabled)
   171	{
   172		return -ENODEV;
   173	}
   174	static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
   175	{
   176		return -ENODEV;
   177	}
   178	static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
   179						   u32 *retval)
   180	{
   181		return -ENODEV;
   182	}
   183	#endif
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

