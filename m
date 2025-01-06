Return-Path: <linux-input+bounces-8961-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AD0A02FBD
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 19:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 858E33A46BA
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 18:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB801DF72D;
	Mon,  6 Jan 2025 18:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nivM7HUu"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791051DED79;
	Mon,  6 Jan 2025 18:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736188042; cv=none; b=KRv9xQXxU9ISuukXn4TFyzkkmcGN6MfnOCVgG+dtsRAA+Bj29xwN+3nWqhPK4F3kSeNrjBQn6i5U0fHei51D2BvVdHAjC8rRIN/U9kFb2osVImx0eZPjek647SecwSfAU+qd+7GTwINYrf4Ww2DMZKxLBUuEVE+Ng1uC/g3XC2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736188042; c=relaxed/simple;
	bh=9NvDwZvFg7r1qwT4ypIYBEKI5qLP+aP69YwjZJZLQgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJbEEXOOjO2DjvFOr+Yz+8p8RsIVEKdf6c0AFaDIDsAyzSUQxn7OSkcySYN47ZW9N702fN0sho5zTbg5iqdqSY1NlnN6EqN4csuctbY7gc3aMnJA0z/xhO8zHZpYhMi6oChKEB5Wc+xq18ipiHqDiTI0ckPMiC2dmo1SB67xMDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nivM7HUu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736188041; x=1767724041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9NvDwZvFg7r1qwT4ypIYBEKI5qLP+aP69YwjZJZLQgs=;
  b=nivM7HUuYfpQxv8Z0FZ0ZibFb5VDHEDvn6gJPH3AlJR6hmMo7bG0BUEh
   1cTo4WGegJW5RuXGLojP8MnIg32A9vbv4S9mXUYJbeGM8zObMK4i7j0Fs
   +WeTgzX9rN8s+AVj223NLEfn9I2xvGbCOOEePfGnsjFyqlUuczwT1bRDo
   OTIF57lC8SV8+0tau+iolgVam8IoDfJjeIupr0V+YgiBgnb5CSzhS1iH9
   PJnpoMDLslNEoaYXa/x49txZ+dXAeypdUAmQQenKOklRc1P+SUmPijIEv
   +adn7IjaOtl73//0mKRyOg5zGoqlUxJMVl4CH43mFIZzuez9HWX+bhgyH
   w==;
X-CSE-ConnectionGUID: fFD7MZ2xQkC2v4x0PfB0OQ==
X-CSE-MsgGUID: rxf3VZcKTzqlOjx8mhjOBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="47337762"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="47337762"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 10:27:20 -0800
X-CSE-ConnectionGUID: H4cNptL1RQa/uJfpJZqLsQ==
X-CSE-MsgGUID: htWPl3GMRWeJn3SLA/Lyqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="102317803"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Jan 2025 10:27:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUroq-000Dod-0L;
	Mon, 06 Jan 2025 18:27:16 +0000
Date: Tue, 7 Jan 2025 02:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	jikos@kernel.org, bentiss@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 10/10] HID: Add hid-universal-pidff driver and
 supported device ids
Message-ID: <202501070200.pA9ifqd5-lkp@intel.com>
References: <20250105193628.296350-11-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250105193628.296350-11-tomasz.pakula.oficjalny@gmail.com>

Hi Tomasz,

kernel test robot noticed the following build errors:

[auto build test ERROR on hid/for-next]
[also build test ERROR on linus/master v6.13-rc6 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomasz-Paku-a/HID-pidff-Convert-infinite-length-from-Linux-API-to-PID-standard/20250106-033931
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20250105193628.296350-11-tomasz.pakula.oficjalny%40gmail.com
patch subject: [PATCH v2 10/10] HID: Add hid-universal-pidff driver and supported device ids
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250107/202501070200.pA9ifqd5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501070200.pA9ifqd5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501070200.pA9ifqd5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hid/hid-universal-pidff.c:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hid/hid-universal-pidff.c:90:16: error: incompatible function pointer types assigning to 'void (*)(struct hid_device *, __u32)' (aka 'void (*)(struct hid_device *, unsigned int)') from 'int (struct hid_device *, __u32)' (aka 'int (struct hid_device *, unsigned int)') [-Wincompatible-function-pointer-types]
      90 |         init_function = hid_pidff_init_with_quirks;
         |                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hid/hid-universal-pidff.c:97:8: error: assigning to 'int' from incompatible type 'void'
      97 |         error = init_function(hdev, id->driver_data);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 2 errors generated.


vim +90 drivers/hid/hid-universal-pidff.c

    66	
    67	
    68	/*
    69	 * Check if the device is PID and initialize it
    70	 * Add quirks after initialisation
    71	 */
    72	static int universal_pidff_probe(struct hid_device *hdev,
    73					 const struct hid_device_id *id)
    74	{
    75		int error;
    76		error = hid_parse(hdev);
    77		if (error) {
    78			hid_err(hdev, "HID parse failed\n");
    79			goto err;
    80		}
    81	
    82		error = hid_hw_start(hdev, HID_CONNECT_DEFAULT & ~HID_CONNECT_FF);
    83		if (error) {
    84			hid_err(hdev, "HID hw start failed\n");
    85			goto err;
    86		}
    87	
    88		// Check if HID_PID support is enabled
    89		void (*init_function)(struct hid_device *, __u32);
  > 90		init_function = hid_pidff_init_with_quirks;
    91	
    92		if (!init_function) {
    93			hid_warn(hdev, "HID_PID support not enabled!\n");
    94			return 0;
    95		}
    96	
  > 97		error = init_function(hdev, id->driver_data);
    98		if (error) {
    99			hid_warn(hdev, "Force Feedback initialization failed\n");
   100			goto err;
   101		}
   102	
   103		hid_info(hdev, "Universal pidff driver loaded sucesfully!");
   104	
   105		return 0;
   106	err:
   107		return error;
   108	}
   109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

