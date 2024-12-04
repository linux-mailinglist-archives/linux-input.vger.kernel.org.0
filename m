Return-Path: <linux-input+bounces-8387-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F40F9E4272
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 18:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 598411697E0
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 17:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF40A211496;
	Wed,  4 Dec 2024 17:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="boImCWjO"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE12211480;
	Wed,  4 Dec 2024 17:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733332450; cv=none; b=S1kbXOpTkJQkKprhjc/q2CIsX8PUAbTuxh8azkmYJTi1vuPrDz3x51bXjT2JxEx20vOd7LFQeRyFgK7bFqgnSKuwvrkwLcLuhS4AtdnyN6wvYd1WWIhpj0MDsZGsICFNo3olZtUA4TMRFr+7xb/m/I53iT3sn6/VV1svwg6emYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733332450; c=relaxed/simple;
	bh=T11iJzjX9vhpO8MRlSolJbG6EMQMPdcnGxRx1r7tIio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n02Cf/YREZzCIpBKDDMBPLaYxE23SH/9nn7BJRZvCd4Iyg7BM19trRijkN8vyvWBJfD2FHz0lUia5c9n+/OicxhD45HmG878r7wtfkubWUKbz3nUfHpY/ZQN1ZwYCFktZjIa0N9PNHF6/RD10UKAgfPAxAGvDUliyrpsite3e/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=boImCWjO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733332448; x=1764868448;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T11iJzjX9vhpO8MRlSolJbG6EMQMPdcnGxRx1r7tIio=;
  b=boImCWjO6cTXFR01iCdglWYzG089SvwKpbvWJ0LtVTUl+2oniOCRfPng
   CbiaYGHI9FFm1wD9rlwxudg5WSVAD/xEkBWWfUh8EJzTZOiw7yUSViIrI
   0gOMh1ZtwNGJz0ILTp8uSLIIu1Q3sXODjCqL2ftn9U8kgGGFmrjAWDb73
   w88WxBi+0gxZYzR9uSVoB4h3hrr4mJ3vKy4XOMvEya3NIQ1z2Ukny7iC2
   z06Kmg4vMEohF+EC5QRJGEIbknkkPnVv/BG+IA96cbsqKVdODphfZ/+ZQ
   ro6lTofFqCRrs3Kr/O2VjItsCHnEv59jUuVHwUQ4GT25VhiymMOFZMFIf
   Q==;
X-CSE-ConnectionGUID: jdldZrfLSKqvT77Ycj+o0w==
X-CSE-MsgGUID: iae4sPP+QH2+jcHJm/avqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33740163"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="33740163"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 09:14:08 -0800
X-CSE-ConnectionGUID: x8sYC6H4Qi6SJ44mNX5BEw==
X-CSE-MsgGUID: QQmmU4T7T5e817uTO49iCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="94012859"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 04 Dec 2024 09:14:04 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIsws-0003KL-2C;
	Wed, 04 Dec 2024 17:14:02 +0000
Date: Thu, 5 Dec 2024 01:13:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ming-Jen Chen <mjchen0829@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, sudeep.holla@arm.com,
	arnd@arndb.de, peng.fan@nxp.com, conor+dt@kernel.org,
	krzk+dt@kernel.org, robh@kernel.org, dmitry.torokhov@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 1/2] input: keypad: add new keypad driver for MA35D1
Message-ID: <202412050142.nkbl6PnK-lkp@intel.com>
References: <20241204021014.5083-2-mjchen0829@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204021014.5083-2-mjchen0829@gmail.com>

Hi Ming-Jen,

kernel test robot noticed the following build errors:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on dtor-input/for-linus hid/for-next soc/for-next linus/master v6.13-rc1 next-20241203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Jen-Chen/input-keypad-add-new-keypad-driver-for-MA35D1/20241204-123001
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20241204021014.5083-2-mjchen0829%40gmail.com
patch subject: [PATCH v4 1/2] input: keypad: add new keypad driver for MA35D1
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241205/202412050142.nkbl6PnK-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050142.nkbl6PnK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050142.nkbl6PnK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/input/keyboard/ma35d1_keypad.c:9:
   In file included from include/linux/input.h:19:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/input/keyboard/ma35d1_keypad.c:83:17: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      83 |         key_event[0] = readl(keypad->mmio_base + KPI_KPE0);
         |                        ^
   drivers/input/keyboard/ma35d1_keypad.c:89:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      89 |         writel(key_event[0], (keypad->mmio_base + KPI_KPE0));
         |         ^
   drivers/input/keyboard/ma35d1_keypad.c:123:12: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     123 |         kstatus = readl(keypad->mmio_base + KPI_STATUS);
         |                   ^
   drivers/input/keyboard/ma35d1_keypad.c:129:4: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     129 |                         writel(PDWAKE, (keypad->mmio_base + KPI_STATUS));
         |                         ^
   drivers/input/keyboard/ma35d1_keypad.c:148:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     148 |         writel(val, keypad->mmio_base + KPI_CONF);
         |         ^
   drivers/input/keyboard/ma35d1_keypad.c:159:8: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     159 |         val = readl(keypad->mmio_base + KPI_KPE0) & ~ENKP;
         |               ^
   drivers/input/keyboard/ma35d1_keypad.c:160:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     160 |         writel(val, keypad->mmio_base + KPI_CONF);
         |         ^
   drivers/input/keyboard/ma35d1_keypad.c:166:17: warning: array index 12 is past the end of the array (that has type 'const unsigned int[12]') [-Warray-bounds]
     166 |         u32 min_diff = debounce_values[NUM_SETTINGS];
         |                        ^               ~~~~~~~~~~~~
   drivers/input/keyboard/ma35d1_keypad.c:53:1: note: array 'debounce_values' declared here
      53 | static const unsigned int debounce_values[NUM_SETTINGS] = {
         | ^
   drivers/input/keyboard/ma35d1_keypad.c:173:25: warning: array index 12 is past the end of the array (that has type 'const unsigned int[12]') [-Warray-bounds]
     173 |         keypad->debounce_val = debounce_register[NUM_SETTINGS];
         |                                ^                 ~~~~~~~~~~~~
   drivers/input/keyboard/ma35d1_keypad.c:57:1: note: array 'debounce_register' declared here
      57 | static const unsigned int debounce_register[NUM_SETTINGS] = {
         | ^
   drivers/input/keyboard/ma35d1_keypad.c:349:3: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     349 |                 writel(readl(keypad->mmio_base + KPI_CONF) | WAKEUP, keypad->mmio_base + KPI_CONF);
         |                 ^
   drivers/input/keyboard/ma35d1_keypad.c:349:10: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     349 |                 writel(readl(keypad->mmio_base + KPI_CONF) | WAKEUP, keypad->mmio_base + KPI_CONF);
         |                        ^
   drivers/input/keyboard/ma35d1_keypad.c:359:3: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     359 |                 writel(readl(keypad->mmio_base + KPI_CONF) & ~(WAKEUP),
         |                 ^
   drivers/input/keyboard/ma35d1_keypad.c:359:10: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     359 |                 writel(readl(keypad->mmio_base + KPI_CONF) & ~(WAKEUP),
         |                        ^
   6 warnings and 11 errors generated.


vim +/readl +83 drivers/input/keyboard/ma35d1_keypad.c

    72	
    73	static void ma35d1_keypad_scan_matrix(struct ma35d1_keypad *keypad, unsigned int status)
    74	{
    75		struct input_dev *input_dev = keypad->input_dev;
    76		u32 row_shift = get_count_order(keypad->kpi_col);
    77		u32 *keymap = input_dev->keycode;
    78		u32 code, key, index;
    79		u32 key_event[4];
    80		u64 pressed_keys = 0, released_keys = 0;
    81	
    82		/* Read key event status */
  > 83		key_event[0] = readl(keypad->mmio_base + KPI_KPE0);
    84		key_event[1] = readl(keypad->mmio_base + KPI_KPE1);
    85		key_event[2] = readl(keypad->mmio_base + KPI_KRE0);
    86		key_event[3] = readl(keypad->mmio_base + KPI_KRE1);
    87	
    88		/* Clear key event status */
    89		writel(key_event[0], (keypad->mmio_base + KPI_KPE0));
    90		writel(key_event[1], (keypad->mmio_base + KPI_KPE1));
    91		writel(key_event[2], (keypad->mmio_base + KPI_KRE0));
    92		writel(key_event[3], (keypad->mmio_base + KPI_KRE1));
    93	
    94		pressed_keys  = key_event[0] | ((u64)key_event[1] << 32);
    95		released_keys = key_event[2] | ((u64)key_event[3] << 32);
    96	
    97		/* Process pressed keys */
    98		for_each_set_bit(index, (const unsigned long *)&pressed_keys, KEY_EVENT_BITS) {
    99			code = MATRIX_SCAN_CODE(index / 8, (index % 8), row_shift);
   100			key = keymap[code];
   101	
   102			input_event(input_dev, EV_MSC, MSC_SCAN, code);
   103			input_report_key(input_dev, key, 1);
   104		}
   105	
   106		/* Process released keys */
   107		for_each_set_bit(index, (const unsigned long *)&released_keys, KEY_EVENT_BITS) {
   108			code = MATRIX_SCAN_CODE(index / 8, (index % 8), row_shift);
   109			key = keymap[code];
   110	
   111			input_event(input_dev, EV_MSC, MSC_SCAN, code);
   112			input_report_key(input_dev, key, 0);
   113		}
   114	
   115		input_sync(input_dev);
   116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

