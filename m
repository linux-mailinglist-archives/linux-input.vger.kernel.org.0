Return-Path: <linux-input+bounces-6834-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B7F988D26
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 02:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93616B219BD
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 00:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBFE7494;
	Sat, 28 Sep 2024 00:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EHUjWzE4"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B133C2F;
	Sat, 28 Sep 2024 00:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727482439; cv=none; b=V7fFUMTV8QHiioi8N3rr9h4N/rKgmkkCFBxvqU8bVtN27CxMT6Ruz31MQhaSOtlny0EarwNlnvk/dZfD8Qn2CoKebc42GfCwkcVcIOpGYWuGptS84rdhZlC/3mqUHZxsxRxo4tHSgOkuRtADc0zwGsum+V2XyCtIPCeOBhfB19w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727482439; c=relaxed/simple;
	bh=tMdDNPln+5JG3CoVlvPxtRqM5Xi9/OR8+asQHPe2hdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSToVMXXmIbXlNhPcKdQpDF2SLHbrUUvQmt1cey6CpU7nUXmVM5bvUhuWKInWWfDGN6fsAm4YRoA8PlxgyLkajW2iT2OdVmx5mJTxEfn2zNDfBbDZfLqQ6Ndx/CTJHyRR7YvcMvSIG0ZUQttGhymVMu0TtcXX3nmw1ig9ogevjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EHUjWzE4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727482438; x=1759018438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tMdDNPln+5JG3CoVlvPxtRqM5Xi9/OR8+asQHPe2hdE=;
  b=EHUjWzE48h6HB/WodfMyT4RQWKuOSogqTGWq0BvoqhVWyvVZdaXt1pgt
   keU92pZXdQCX/Kvdtvd1Xw6eEQjV28AoOCVyothrTl8RNifEqpLnYgQca
   bw3BbyO8SeQN0Zh7FLmTILsvuN0Soo55ef5MHL1SUTo6HpW1awpFTjajN
   pKPNBAKwxLjhoB+Twj/ULqbYvZ0Efyl+lCqvKfbFiMW37rgrifx8OnmVB
   wLFpcC5kT/5j5zZDqMf2Ez+Hvga7ypR0IvfQjWszibm10ARQw6YusZBLb
   /yYQes5/FDRyhief9UYTfmK181UCxf/lyy/U09wjemh44U9kof9ZgpE3U
   w==;
X-CSE-ConnectionGUID: O7EHH527R+Kc7/DxUayJIw==
X-CSE-MsgGUID: kjXvmkXJTh6U2IxO7chh2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="38029211"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="38029211"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 17:13:55 -0700
X-CSE-ConnectionGUID: rGsBccu7QGmPsVPZd9zjYw==
X-CSE-MsgGUID: R9SKE1glQluwUs0USghVZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77637858"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Sep 2024 17:13:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suL5q-000MlF-0S;
	Sat, 28 Sep 2024 00:13:50 +0000
Date: Sat, 28 Sep 2024 08:13:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Luke D. Jones" <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	bentiss@kernel.org, jikos@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com, corentin.chary@gmail.com, superm1@kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: Re: [PATCH v4 9/9] platform/x86: asus-wmi: deprecate bios features
Message-ID: <202409280735.meXnoMkl-lkp@intel.com>
References: <20240926092952.1284435-10-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926092952.1284435-10-luke@ljones.dev>

Hi Luke,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master next-20240927]
[cannot apply to v6.11]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luke-D-Jones/platform-x86-asus-wmi-export-symbols-used-for-read-write-WMI/20240926-173528
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240926092952.1284435-10-luke%40ljones.dev
patch subject: [PATCH v4 9/9] platform/x86: asus-wmi: deprecate bios features
config: i386-randconfig-061-20240928 (https://download.01.org/0day-ci/archive/20240928/202409280735.meXnoMkl-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280735.meXnoMkl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280735.meXnoMkl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/asus-wmi.c:154:35: warning: unused variable 'asus_ally_mcu_quirk' [-Wunused-const-variable]
     154 | static const struct dmi_system_id asus_ally_mcu_quirk[] = {
         |                                   ^~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/asus_ally_mcu_quirk +154 drivers/platform/x86/asus-wmi.c

0f0ac158d28ff7 Luke D. Jones 2021-10-24  153  
d2dfed310aae07 Luke D. Jones 2024-08-06 @154  static const struct dmi_system_id asus_ally_mcu_quirk[] = {
d2dfed310aae07 Luke D. Jones 2024-08-06  155  	{
d2dfed310aae07 Luke D. Jones 2024-08-06  156  		.matches = {
d2dfed310aae07 Luke D. Jones 2024-08-06  157  			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
d2dfed310aae07 Luke D. Jones 2024-08-06  158  		},
d2dfed310aae07 Luke D. Jones 2024-08-06  159  	},
d2dfed310aae07 Luke D. Jones 2024-08-06  160  	{
d2dfed310aae07 Luke D. Jones 2024-08-06  161  		.matches = {
d2dfed310aae07 Luke D. Jones 2024-08-06  162  			DMI_MATCH(DMI_BOARD_NAME, "RC72L"),
d2dfed310aae07 Luke D. Jones 2024-08-06  163  		},
d2dfed310aae07 Luke D. Jones 2024-08-06  164  	},
d2dfed310aae07 Luke D. Jones 2024-08-06  165  	{ },
d2dfed310aae07 Luke D. Jones 2024-08-06  166  };
d2dfed310aae07 Luke D. Jones 2024-08-06  167  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

