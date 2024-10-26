Return-Path: <linux-input+bounces-7710-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DB99B1529
	for <lists+linux-input@lfdr.de>; Sat, 26 Oct 2024 07:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E2002828F8
	for <lists+linux-input@lfdr.de>; Sat, 26 Oct 2024 05:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82AA86AE3;
	Sat, 26 Oct 2024 05:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLiCwIww"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3216E6A009;
	Sat, 26 Oct 2024 05:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729920892; cv=none; b=hA2cZZ08qyT0FOUHQj7A4GZQ54ZZBcunmWkBqcsQkijzsrQ8EB/CM7V7TEcxFvFc8GvhcQ7UW/OHfRzORc+flHoybi80wUeVKM3Rflmlo8xvZUuyjRRLDh5Y7VTybeTWGhu/JquKP+rxRcY4vTdbpGOXB9WhDKiOWQNN/8eobDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729920892; c=relaxed/simple;
	bh=ImACNOBLeo/IWPYy0OMBTrQMROC8/CrgLu5Bo02QvLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOYEdWx3Ngg+MsnFc09EcMTjNDAr70TrKcu1U3op3cUOZ/u8yT0qIyanHaqke3M1in41WBELR6I+VSXHsyvpqRdUIZvpSww9YPrrSeAv4LQ1s5I0tl7vTAuKGz7cjMTAOlRUwfaveLUc9n8y6tsOTcwTT7TBPLESC86YCMy3QsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLiCwIww; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729920889; x=1761456889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ImACNOBLeo/IWPYy0OMBTrQMROC8/CrgLu5Bo02QvLs=;
  b=QLiCwIwwRm6gwPH2mIkxCmD/n7W8R/eRKQl7rxxxmQsviEJTSVLp0d0y
   i/MtcBfeR8RJA0HMOz73D1xgF+lD+j9NqLOR5vViqNlwlT1yBD/bKC4iU
   qSo913m3BDoAHNj65LO02p5/hFG60Jb3t3E7ET4XMutMOC1Os5p5+dEPz
   HNPPxQj7SNpUz/ejyxPFqAvYyMvsYuAUg1F+odbcFT20ipP36ZKyBx8Oh
   sK7pOJvg7cLf9w0aXZwUm/ra6CKysrBlZThkOncATp9Z0SEnZIh3pkrV1
   EMfWVn3srLAB63L8xj+CeGYUPnsv97GwQINOVaChBDcI/KzxbnWeEE0rb
   A==;
X-CSE-ConnectionGUID: g7hQRE5dR0ahmDcaZej2PA==
X-CSE-MsgGUID: dHwgoWX9TGa0vBMUAdw4vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="47084276"
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="47084276"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 22:34:49 -0700
X-CSE-ConnectionGUID: ZYmrUNwbRYWxVAMBFTXiuQ==
X-CSE-MsgGUID: 9kaklKcPQvys6MK7dmoCmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="81216530"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Oct 2024 22:34:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4ZRl-000ZJI-0b;
	Sat, 26 Oct 2024 05:34:45 +0000
Date: Sat, 26 Oct 2024 13:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Erick Archer <erick.archer@outlook.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: maple_keyb - use guard notation when acquiring
 mutex
Message-ID: <202410261312.femv4WzA-lkp@intel.com>
References: <Zxr4TeGwDGIIyzwH@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zxr4TeGwDGIIyzwH@google.com>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on dtor-input/for-linus hid/for-next linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Torokhov/Input-maple_keyb-use-guard-notation-when-acquiring-mutex/20241025-094751
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/Zxr4TeGwDGIIyzwH%40google.com
patch subject: [PATCH] Input: maple_keyb - use guard notation when acquiring mutex
config: sh-dreamcast_defconfig (https://download.01.org/0day-ci/archive/20241026/202410261312.femv4WzA-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410261312.femv4WzA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261312.femv4WzA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/input/keyboard/maple_keyb.c: In function 'remove_maple_kbd':
>> drivers/input/keyboard/maple_keyb.c:211:39: error: macro "guard" passed 2 arguments, but takes just 1
     211 |         guard(mutex, &maple_keyb_mutex);
         |                                       ^
   In file included from include/linux/irqflags.h:17,
                    from arch/sh/include/asm/cmpxchg-irq.h:5,
                    from arch/sh/include/asm/cmpxchg.h:20,
                    from arch/sh/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/sh/include/asm/bitops.h:23,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from drivers/input/keyboard/maple_keyb.c:9:
   include/linux/cleanup.h:166: note: macro "guard" defined here
     166 | #define guard(_name) \
         | 
>> drivers/input/keyboard/maple_keyb.c:211:9: error: 'guard' undeclared (first use in this function)
     211 |         guard(mutex, &maple_keyb_mutex);
         |         ^~~~~
   drivers/input/keyboard/maple_keyb.c:211:9: note: each undeclared identifier is reported only once for each function it appears in


vim +/guard +211 drivers/input/keyboard/maple_keyb.c

   205	
   206	static int remove_maple_kbd(struct device *dev)
   207	{
   208		struct maple_device *mdev = to_maple_dev(dev);
   209		struct dc_kbd *kbd = maple_get_drvdata(mdev);
   210	
 > 211		guard(mutex, &maple_keyb_mutex);
   212	
   213		input_unregister_device(kbd->dev);
   214		kfree(kbd);
   215	
   216		maple_set_drvdata(mdev, NULL);
   217		return 0;
   218	}
   219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

