Return-Path: <linux-input+bounces-8944-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 619DBA01F34
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 07:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA7E33A3DA9
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 06:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CCC1A2631;
	Mon,  6 Jan 2025 06:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1Ea9bK0"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7788194A64;
	Mon,  6 Jan 2025 06:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736144946; cv=none; b=P/dq0uPRgdavm5WAXM2dwCT8MBbyX32eqTSbAN3SVl1/lh7ge3CT1BNORV4Olmgu/il1b8ULCBHHFOA5tYrQiCReMikOUbMDV72jeUKro+kcht+ljvpRL1znx538CBaBOI3/dtOTUpl3ja8YcwWmY2ij/QF58jgxVaEBRiGWMq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736144946; c=relaxed/simple;
	bh=TVbzn6A95XNB7VX6WHfDFdPSCdS4sboCHVyKf1ch3Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejrStANmBP0oNn8Taw8drgxgGdgp6TMhzl/2D5iH6H/gwzz6zXmkFTK7J7haUWl/CmeZIgRm0NlSyjwA9BG33LejDVSuivBTrLYihcDzMTLvietwxWlfgs28RQQmAk53/iwap6e4Za5GyiIOd8Kpp19RGzgstWWeB5b08qKxy+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1Ea9bK0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736144944; x=1767680944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TVbzn6A95XNB7VX6WHfDFdPSCdS4sboCHVyKf1ch3Qk=;
  b=Q1Ea9bK0zrEh/MeMQBckpO7j86JzVu0tWGty55FddTbYdNo0Ch5I0OHj
   TwRW2o72kwYsyvqUMTt0SmjFBjYO+l/BPyMAl73RpAHjGEQw4Vz9hrIRS
   gz3KN+YthGji1kuWgmuoRyB0SzZlcIkxyuELJAqwCwwKxyNc9J0zphGi0
   ruvq15ooESuZuW83G9GkVlxnYkOFkf5Yl2ga50+gWIKvQvUx5T8Mup74T
   T0HCVJ7bG6IDpcOhftM1C+1LfmNl1Mh9nZgVYSNDzcBzeMuQ2P5JEcYjF
   7Rgt814vU44Vs87upvlOPMqQ6w3LaOJf5r4AQ224jk0I9Fe5zA+yznczK
   w==;
X-CSE-ConnectionGUID: BfzIoVfcSf67Ll+rOWqF1g==
X-CSE-MsgGUID: wzbTvFHLSpu+H9Pqli6clw==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="39968267"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="39968267"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 22:29:03 -0800
X-CSE-ConnectionGUID: Y1kodxODRXeXQkc/zGs3Ow==
X-CSE-MsgGUID: 8cbBXr1bRbOmNpn0IjfE6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125636357"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jan 2025 22:29:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUgbj-000CJn-0e;
	Mon, 06 Jan 2025 06:28:59 +0000
Date: Mon, 6 Jan 2025 14:28:41 +0800
From: kernel test robot <lkp@intel.com>
To: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	jikos@kernel.org, bentiss@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 10/10] HID: Add hid-universal-pidff driver and
 supported device ids
Message-ID: <202501061243.bXGf8kc8-lkp@intel.com>
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250106/202501061243.bXGf8kc8-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061243.bXGf8kc8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501061243.bXGf8kc8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hid/hid-universal-pidff.c: In function 'universal_pidff_probe':
>> drivers/hid/hid-universal-pidff.c:90:23: error: assignment to 'void (*)(struct hid_device *, __u32)' {aka 'void (*)(struct hid_device *, unsigned int)'} from incompatible pointer type 'int (*)(struct hid_device *, __u32)' {aka 'int (*)(struct hid_device *, unsigned int)'} [-Wincompatible-pointer-types]
      90 |         init_function = hid_pidff_init_with_quirks;
         |                       ^
>> drivers/hid/hid-universal-pidff.c:97:15: error: void value not ignored as it ought to be
      97 |         error = init_function(hdev, id->driver_data);
         |               ^


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

