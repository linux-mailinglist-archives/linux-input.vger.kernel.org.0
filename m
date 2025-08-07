Return-Path: <linux-input+bounces-13848-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ABBB1D0F8
	for <lists+linux-input@lfdr.de>; Thu,  7 Aug 2025 04:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DFCC1636E3
	for <lists+linux-input@lfdr.de>; Thu,  7 Aug 2025 02:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB88524F;
	Thu,  7 Aug 2025 02:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q5cwjrNU"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D419199949
	for <linux-input@vger.kernel.org>; Thu,  7 Aug 2025 02:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754534257; cv=none; b=oP1Q5ih0ctSa9yLq+jNTYtBhCRlBkaS4ggx7+BBd+EgJxLIsjtrZwbYYrjUv0l8uGuXMIBTH/WyF9DyLgSofW0I2DtBYOK+Mdxsyhtx4IGjj5TnxtZKKL5v6Re39PJXT7Qs24/MXSnnLbBgH6E4MmbaAkLOAkkmwGoeNIAMrwrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754534257; c=relaxed/simple;
	bh=qISuMdpEDaR80BLXuoglcc60MLpp8tuXbvBIUypDj6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SxiNM52GwJy0DwbDGb/PI4gqm72B+Plo4OouCokSR+JTmlDK9ccLQBjiQ6Mz8bummEe6brx9LmyZN5M/sXL5ms07UiRV+n2OD2Yr5clrwGDTUXJ4THDaRytO5bfo9VkFUnyBxFoh/1ANd1mB3G3QKOqCoy1ehHp3aZwdvGwNu28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q5cwjrNU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754534256; x=1786070256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qISuMdpEDaR80BLXuoglcc60MLpp8tuXbvBIUypDj6g=;
  b=Q5cwjrNU+JxiyrlHaOC8lcM+KCZuihfddHyc9jIDhNzgTJ3EoTw3+lln
   lOZfMCtzY+9HCk+qYBjpCpxEc+eOpmGAvembejgzzATSuJkvyLswO4voH
   H5bkaOGvPgMhKJYUzMZRyGxWSkDOU81+M50ei2pXj+XEWlSMoJzcqWNyc
   zDMSDqfQvHNJ+gossLx/bh1jIIUBGXGluGWzShf2hmqTy4Jxp3FANgdL2
   2h4pfUydREixrbhEKoBMAXU0+coYVHn5uEtl/sFTFVN23PkOQqBo9NPhF
   T35AnMD6VU0fznZl7VGekpH6ARe+SxYHBkS1pSi7FEPtH2VW/kGsS0eoK
   A==;
X-CSE-ConnectionGUID: n8rQHcCtT2Sl/gIQ8x1lkQ==
X-CSE-MsgGUID: 623312oPQeSDOeMTKgvrJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56937332"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56937332"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 19:37:35 -0700
X-CSE-ConnectionGUID: U908j/FHTAKyzciGFbxMHg==
X-CSE-MsgGUID: gKshaqSaRJaCe/cZxUnzpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165299413"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 06 Aug 2025 19:37:33 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujqVW-0002IU-3C;
	Thu, 07 Aug 2025 02:37:30 +0000
Date: Thu, 7 Aug 2025 10:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [dtor-input:next 25/27] ERROR: modpost: __ex_table+0x1e28 references
 non-executable section '.rodata.xgene_rng_init.str1.4'
Message-ID: <202508071018.TcyVGL9C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
head:   4f67c41894674d351a4b4e7dd3471380b71b5bb3
commit: a7bee4e7f78089c101be2ad51f4b5ec64782053e [25/27] Merge tag 'ib-mfd-gpio-input-pwm-v6.17' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd into next
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071018.TcyVGL9C-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071018.TcyVGL9C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071018.TcyVGL9C-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x1c3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c44 (section: __ex_table) -> .LASF1336 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c48 (section: __ex_table) -> .LASF1320 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c50 (section: __ex_table) -> .LASF1339 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c54 (section: __ex_table) -> .LASF1320 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c5c (section: __ex_table) -> .LASF1342 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c60 (section: __ex_table) -> .LASF1320 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d28 (section: __ex_table) -> .LASF179 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d2c (section: __ex_table) -> .LASF181 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d34 (section: __ex_table) -> .LASF183 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d38 (section: __ex_table) -> .LASF185 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d40 (section: __ex_table) -> .LASF187 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d44 (section: __ex_table) -> .LASF189 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d4c (section: __ex_table) -> .LASF191 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d50 (section: __ex_table) -> .LASF189 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d58 (section: __ex_table) -> .LASF194 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d5c (section: __ex_table) -> .LASF196 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d64 (section: __ex_table) -> .LASF198 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d68 (section: __ex_table) -> .LASF200 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d70 (section: __ex_table) -> .LASF202 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d74 (section: __ex_table) -> .LASF204 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d7c (section: __ex_table) -> .LASF206 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d80 (section: __ex_table) -> .LASF204 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d80 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d88 (section: __ex_table) -> .LASF209 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d8c (section: __ex_table) -> .LASF211 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d94 (section: __ex_table) -> .LASF213 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d98 (section: __ex_table) -> .LASF215 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1da0 (section: __ex_table) -> .LASF1069 (section: .debug_str)
ERROR: modpost: __ex_table+0x1da0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1da4 (section: __ex_table) -> .LASF1071 (section: .debug_str)
ERROR: modpost: __ex_table+0x1da4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dac (section: __ex_table) -> .LASF1073 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1db0 (section: __ex_table) -> .LASF1075 (section: .debug_str)
ERROR: modpost: __ex_table+0x1db0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1db8 (section: __ex_table) -> .LASF3682 (section: .debug_str)
ERROR: modpost: __ex_table+0x1db8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dbc (section: __ex_table) -> .LASF3679 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dbc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dc4 (section: __ex_table) -> .LASF3685 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dc4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dc8 (section: __ex_table) -> .LASF3679 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dc8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dd0 (section: __ex_table) -> .LASF3688 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dd0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dd4 (section: __ex_table) -> .LASF3679 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dd4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ddc (section: __ex_table) -> .LASF3691 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ddc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1de0 (section: __ex_table) -> .LASF3693 (section: .debug_str)
ERROR: modpost: __ex_table+0x1de0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1de8 (section: __ex_table) -> .LASF3695 (section: .debug_str)
ERROR: modpost: __ex_table+0x1de8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dec (section: __ex_table) -> .LASF3693 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1df4 (section: __ex_table) -> .LASF3698 (section: .debug_str)
ERROR: modpost: __ex_table+0x1df4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1df8 (section: __ex_table) -> .LASF3693 (section: .debug_str)
ERROR: modpost: __ex_table+0x1df8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e00 (section: __ex_table) -> .LASF328 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e04 (section: __ex_table) -> .LASF330 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e0c (section: __ex_table) -> .LASF2574 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e10 (section: __ex_table) -> .LASF2576 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e18 (section: __ex_table) -> .LASF2578 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e1c (section: __ex_table) -> .LASF2580 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e24 (section: __ex_table) -> __key (section: .bss.__key.49711)
ERROR: modpost: __ex_table+0x1e24 references non-executable section '.bss.__key.49711'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e28 (section: __ex_table) -> .LC4 (section: .rodata.xgene_rng_init.str1.4)
>> ERROR: modpost: __ex_table+0x1e28 references non-executable section '.rodata.xgene_rng_init.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e54 (section: __ex_table) -> .LLST123 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1e54 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e60 (section: __ex_table) -> .LASF3011 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e64 (section: __ex_table) -> .LASF3013 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e6c (section: __ex_table) -> .LASF2740 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e70 (section: __ex_table) -> .LASF2742 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e78 (section: __ex_table) -> .LASF2744 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e7c (section: __ex_table) -> .LASF2742 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e84 (section: __ex_table) -> .LASF3290 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e88 (section: __ex_table) -> .LASF3292 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e90 (section: __ex_table) -> .LASF3294 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e94 (section: __ex_table) -> .LASF3292 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e9c (section: __ex_table) -> .LASF3297 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ea0 (section: __ex_table) -> .LASF3299 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ea0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ea8 (section: __ex_table) -> .LASF3301 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ea8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1eac (section: __ex_table) -> .LASF3303 (section: .debug_str)
ERROR: modpost: __ex_table+0x1eac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1eb4 (section: __ex_table) -> .LASF1607 (section: .debug_str)
ERROR: modpost: __ex_table+0x1eb4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1eb8 (section: __ex_table) -> .LASF1609 (section: .debug_str)
ERROR: modpost: __ex_table+0x1eb8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ec0 (section: __ex_table) -> .LASF1149 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ec0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ec4 (section: __ex_table) -> .LASF1151 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ec4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ecc (section: __ex_table) -> .LASF1153 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ecc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ed0 (section: __ex_table) -> .LASF1155 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ed0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ed8 (section: __ex_table) -> .LASF1157 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ed8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1edc (section: __ex_table) -> .LASF1155 (section: .debug_str)
ERROR: modpost: __ex_table+0x1edc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ee4 (section: __ex_table) -> .LASF1160 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ee4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ee8 (section: __ex_table) -> .LASF1162 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ee8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ef0 (section: __ex_table) -> .LASF243 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ef0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ef4 (section: __ex_table) -> .LASF245 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ef4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1efc (section: __ex_table) -> .LASF2038 (section: .debug_str)
ERROR: modpost: __ex_table+0x1efc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f00 (section: __ex_table) -> .LASF2040 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f08 (section: __ex_table) -> .LASF2042 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f0c (section: __ex_table) -> .LASF2044 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f14 (section: __ex_table) -> .LASF2046 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f18 (section: __ex_table) -> .LASF2040 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f20 (section: __ex_table) -> .LASF2049 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f24 (section: __ex_table) -> .LASF2051 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f2c (section: __ex_table) -> .LASF2053 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f30 (section: __ex_table) -> .LASF2055 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f38 (section: __ex_table) -> .LASF2057 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f3c (section: __ex_table) -> .LASF2059 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f44 (section: __ex_table) -> .LLST161 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1f44 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f48 (section: __ex_table) -> .LLST162 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1f48 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f54 (section: __ex_table) -> .LLST164 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1f54 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f5c (section: __ex_table) -> .LASF1143 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f60 (section: __ex_table) -> .LASF1145 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f68 (section: __ex_table) -> .LASF1147 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f6c (section: __ex_table) -> .LASF1149 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f74 (section: __ex_table) -> .LASF1151 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f78 (section: __ex_table) -> .LASF1153 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f80 (section: __ex_table) -> .LASF1155 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f80 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f84 (section: __ex_table) -> .LASF1157 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f84 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

