Return-Path: <linux-input+bounces-16995-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18289D14656
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 18:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEED9302CB99
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 17:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00E637E2FA;
	Mon, 12 Jan 2026 17:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bbZeEmV9"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93222379986;
	Mon, 12 Jan 2026 17:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768239167; cv=none; b=McTSGJXRKkOuHxulRF2zZltyBBd9DfCcqRlLei3GnbKL9kT31iUGPQE30igQoQkExd3by6gxfQh/YQdb2OkUYaDrkMUy4wBvndu3H3NFAdtYarrl33zHX7qqCkJTdsJJTllq7BThbvTPbV0UgmcJx9x2Up2AmpwA+pYQnZ/oTnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768239167; c=relaxed/simple;
	bh=/F0DHPES9V4UKhWUy41xbv8wKwwgas3zZAi12ZfuGjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlY8/tUndL2rubEcqjOI26jFpItd/hjbSEjNXDgC3iZrfF50eVe6+I70LFGaX3hwF+07xFtahhIY1e6YL9NpNV+byodYBSaGmG6rWo8c8TionvBGR3ND8di6GX/76B1zl5mANomNLAnXOAuIxEzxIlCK0bU6bQ9mgPtVqtPcrjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bbZeEmV9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768239165; x=1799775165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/F0DHPES9V4UKhWUy41xbv8wKwwgas3zZAi12ZfuGjU=;
  b=bbZeEmV9UKmDUsRmdl4jgqIXGqU2voKmlG+YG9ezi725erXy3rUF0YjB
   +JRgQCqwmkS32tZxIn41Yb35mV2SKmObuVjkxEbWu73hCwLRBq4EFKAh1
   6L8VfdFeDfqbqVT7QxC+QlWpx1XEIQqRsSdfyWlLHiv4toL85UBkadzJq
   j046lrD3UNEHJhp4hs5KCGxFXxTKSfFYFBrrhPOtDvaITWU4YtYwPd8sn
   VQCxQ0NkebG2CJxrxOEOWgoEgO/DU6iy72rIWA7JxB7/k+GTqbzYjkwMC
   OJPqr7+QRa2NsHYUzslLfYKE5BzYt3OXS6NfN9NLDFGIxik6YPyAp13Ew
   w==;
X-CSE-ConnectionGUID: hfluwQVOS8+Ebe7siciIYg==
X-CSE-MsgGUID: odTTQ9jfRbuEyEJvcjlq4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="79812953"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="79812953"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 09:32:45 -0800
X-CSE-ConnectionGUID: iAiCqQUSSjiRtSTQ9Cz4SQ==
X-CSE-MsgGUID: QvBqkciATtaz7EMufw/x0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208983881"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jan 2026 09:32:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfLmR-00000000Dg0-2gaC;
	Mon, 12 Jan 2026 17:32:39 +0000
Date: Tue, 13 Jan 2026 01:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: Re: [PATCH 09/12] HID: sony: Use pm_ptr instead of #ifdef CONFIG_PM
Message-ID: <202601130046.THZRFNIA-lkp@intel.com>
References: <20260112105500.3664834-10-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112105500.3664834-10-hadess@hadess.net>

Hi Bastien,

kernel test robot noticed the following build errors:

[auto build test ERROR on hid/for-next]
[also build test ERROR on linus/master v6.19-rc5 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bastien-Nocera/HID-hid-alps-Use-pm_ptr-instead-of-ifdef-CONFIG_PM/20260112-190559
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20260112105500.3664834-10-hadess%40hadess.net
patch subject: [PATCH 09/12] HID: sony: Use pm_ptr instead of #ifdef CONFIG_PM
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260113/202601130046.THZRFNIA-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130046.THZRFNIA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130046.THZRFNIA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:36,
                    from include/linux/random.h:7,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/hid/hid-sony.c:31:
>> drivers/hid/hid-sony.c:2402:36: error: 'sony_suspend' undeclared here (not in a function)
    2402 |         .suspend          = pm_ptr(sony_suspend),
         |                                    ^~~~~~~~~~~~
   include/linux/util_macros.h:136:44: note: in definition of macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   drivers/hid/hid-sony.c:2402:29: note: in expansion of macro 'pm_ptr'
    2402 |         .suspend          = pm_ptr(sony_suspend),
         |                             ^~~~~~
>> drivers/hid/hid-sony.c:2403:36: error: 'sony_resume' undeclared here (not in a function); did you mean 'sony_remove'?
    2403 |         .resume           = pm_ptr(sony_resume),
         |                                    ^~~~~~~~~~~
   include/linux/util_macros.h:136:44: note: in definition of macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   drivers/hid/hid-sony.c:2403:29: note: in expansion of macro 'pm_ptr'
    2403 |         .resume           = pm_ptr(sony_resume),
         |                             ^~~~~~


vim +/sony_suspend +2402 drivers/hid/hid-sony.c

  2392	
  2393	static struct hid_driver sony_driver = {
  2394		.name             = "sony",
  2395		.id_table         = sony_devices,
  2396		.input_mapping    = sony_mapping,
  2397		.input_configured = sony_input_configured,
  2398		.probe            = sony_probe,
  2399		.remove           = sony_remove,
  2400		.report_fixup     = sony_report_fixup,
  2401		.raw_event        = sony_raw_event,
> 2402		.suspend          = pm_ptr(sony_suspend),
> 2403		.resume	          = pm_ptr(sony_resume),
  2404		.reset_resume     = pm_ptr(sony_resume),
  2405	};
  2406	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

