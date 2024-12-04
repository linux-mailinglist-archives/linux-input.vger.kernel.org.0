Return-Path: <linux-input+bounces-8386-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAE99E3D62
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 15:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6147B3A954
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 14:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EFCA20B1F4;
	Wed,  4 Dec 2024 14:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GgWqHh0J"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C531F709B;
	Wed,  4 Dec 2024 14:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733323746; cv=none; b=qbB2DaS3LlWsDDCuq3m6g1TYnD1w9+wY6PzGEBGg5FJW2LY+GI5aJXUgdsdm5xsR4asDcqP+ykVQnsA+vjPb9WiZWLDreYs80R0w78uMLbNmhcwFEuyMSMFXSOlbmIQDPLb2HrseW7Gx9FRLDxWvpEqNc9YTdgozcPlXB19agHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733323746; c=relaxed/simple;
	bh=f3vtN1u5WBFqe7Z+wdQv6YdkOLXhLcLZNvoW4Nv5FkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzAX5ixFKaMUDhRyiB6plARP9nOC+xxxIQPQKdRB4yEbdimmkqDiJByIESa7YqUMO+zrz4Akoo2XiDMnQv7qbXjJYycgF2pBmvmo3YGXkocpbcdJrwHTEG394XwBdU1pgTgnZiCtUBQuwsU5ExpI6ffHnCyabFj/76OZIkXifFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GgWqHh0J; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733323744; x=1764859744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f3vtN1u5WBFqe7Z+wdQv6YdkOLXhLcLZNvoW4Nv5FkI=;
  b=GgWqHh0J06YK5etmuVzq3n9FOID+hjWMJLRG/i5w6+MZ+3+8bbDzfnyt
   ObtwJjryeRL+lnhABAWeienzsQ8fca+5mpECLZi9zk8FcQY8fRItrYj11
   37S7rt+PyX3hGOyByewstwroA8mL/iPTMqGyw5A/ajfJ17nQYqSFLoleS
   w8GfzcNgJYewwg4Owc63Mg4bVCNqW+cuWOl34idRzKuCnJlA5RU204jNU
   pgpVeRZSzLGdDvUD7Q2IfTbVXV45fYX/98Q53dtZuEWtMgiqcUdbrZ0kF
   HElnjAkAqSRZPowKcpayKqhLYHUU8udWHM7/EZ0FXuDtTdZzsj5smyROm
   w==;
X-CSE-ConnectionGUID: o5sGyxOiSgW2Xx093kRvJg==
X-CSE-MsgGUID: FL2iznceSK69RrrldjabKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="36436392"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="36436392"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 06:49:02 -0800
X-CSE-ConnectionGUID: dcVWHyIOSUqKjoi5sxDWTA==
X-CSE-MsgGUID: 7l9lL/7nT7SoVdN1u8A6gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="94614100"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Dec 2024 06:48:58 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIqgR-00038r-32;
	Wed, 04 Dec 2024 14:48:55 +0000
Date: Wed, 4 Dec 2024 22:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ming-Jen Chen <mjchen0829@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, sudeep.holla@arm.com,
	arnd@arndb.de, peng.fan@nxp.com, conor+dt@kernel.org,
	krzk+dt@kernel.org, robh@kernel.org, dmitry.torokhov@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 1/2] input: keypad: add new keypad driver for MA35D1
Message-ID: <202412042245.5jwzbfGS-lkp@intel.com>
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
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241204/202412042245.5jwzbfGS-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412042245.5jwzbfGS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412042245.5jwzbfGS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/input/keyboard/ma35d1_keypad.c: In function 'ma35d1_keypad_scan_matrix':
   drivers/input/keyboard/ma35d1_keypad.c:83:24: error: implicit declaration of function 'readl' [-Wimplicit-function-declaration]
      83 |         key_event[0] = readl(keypad->mmio_base + KPI_KPE0);
         |                        ^~~~~
>> drivers/input/keyboard/ma35d1_keypad.c:89:9: error: implicit declaration of function 'writel' [-Wimplicit-function-declaration]
      89 |         writel(key_event[0], (keypad->mmio_base + KPI_KPE0));
         |         ^~~~~~


vim +/writel +89 drivers/input/keyboard/ma35d1_keypad.c

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
    83		key_event[0] = readl(keypad->mmio_base + KPI_KPE0);
    84		key_event[1] = readl(keypad->mmio_base + KPI_KPE1);
    85		key_event[2] = readl(keypad->mmio_base + KPI_KRE0);
    86		key_event[3] = readl(keypad->mmio_base + KPI_KRE1);
    87	
    88		/* Clear key event status */
  > 89		writel(key_event[0], (keypad->mmio_base + KPI_KPE0));
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

