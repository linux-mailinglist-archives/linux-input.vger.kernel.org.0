Return-Path: <linux-input+bounces-2290-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF72875E85
	for <lists+linux-input@lfdr.de>; Fri,  8 Mar 2024 08:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9969B281B94
	for <lists+linux-input@lfdr.de>; Fri,  8 Mar 2024 07:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A544EB47;
	Fri,  8 Mar 2024 07:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLkjey2G"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B314EB4F
	for <linux-input@vger.kernel.org>; Fri,  8 Mar 2024 07:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709883000; cv=none; b=oFrKp1vXI1mqxCNjqF/oclcN7Wi4xJBBEDjwUzgOP+NCkycDwpmrAF9UUxrKvHkwpx9K1cyMLnqNO4b/1yiemIZsK/t32T3ShZYNjB9wsOTdxSukN26YWF5BS5IfixLOeZlXLuo5J6y35ocHfddrviyUvp9199VQazBcoZXp0QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709883000; c=relaxed/simple;
	bh=TsOKSE235mPf3FMC84mG++/0oOqRZWrMWUdjqJKN/q0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BS+KskiAzEc/LiGim11SJii2zayFA+jkcYdnp6jYbw6IxuvARxPF+YpbK+7p0IhvGklXBxKbpN42arYJ+aOqTJViZuE7J0dEltuVXzzVYmMT76Vel+ZrqoeWQak/XHx8O7S8btMZsCMf7fRJiRk7d54PcRFWkpqxyUyU5f704lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLkjey2G; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709882998; x=1741418998;
  h=date:from:to:cc:subject:message-id;
  bh=TsOKSE235mPf3FMC84mG++/0oOqRZWrMWUdjqJKN/q0=;
  b=VLkjey2GRi2xaTe0TTG6C8u4YV6aKTwUzmXkZILDHD5ofPKpdnI/IZne
   WUvvhak98gdlURo7FbKuFubhxT+4SFuL5dX0Yuck0cFl7S7NwS7o6Qdsn
   P8RDSn3SaoegMJM8sSfaeMQXsqrWdFU2gmsuKKMtxEshWQvx8UhANt/NB
   eu2dh/f8VPtW17dh1OlxRYxeEEW0crkShx0PVJpw5qDZ/l8cvUd+xGaxz
   uOtkjJj4nf2aTV6datDjjjNg1zcGJSdsBzduYtVt1Z1EZqdlr9uXWwbdY
   rcnmMCLvrqWO7by3kK5wqk0pCbNgdMx7J4JkoeFvrOcqB/2WvvX8bLskc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="16000091"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="16000091"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 23:29:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="41361988"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Mar 2024 23:29:42 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riUfk-00069N-0e;
	Fri, 08 Mar 2024 07:29:40 +0000
Date: Fri, 08 Mar 2024 15:29:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 992cf65674778e22436807796b2df927de21bb75
Message-ID: <202403081509.LPTCNQCq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 992cf65674778e22436807796b2df927de21bb75  Input: iqs7222 - add support for IQS7222D v1.1 and v1.2

elapsed time: 728m

configs tested: 156
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240308   gcc  
arc                   randconfig-002-20240308   gcc  
arm                              alldefconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   gcc  
arm                                 defconfig   clang
arm                        neponset_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20240308   gcc  
arm                        shmobile_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-004-20240308   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240308   gcc  
csky                  randconfig-002-20240308   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240308   clang
i386         buildonly-randconfig-002-20240308   clang
i386         buildonly-randconfig-003-20240308   gcc  
i386         buildonly-randconfig-004-20240308   gcc  
i386         buildonly-randconfig-005-20240308   gcc  
i386         buildonly-randconfig-006-20240308   clang
i386                                defconfig   clang
i386                  randconfig-001-20240308   clang
i386                  randconfig-002-20240308   clang
i386                  randconfig-003-20240308   clang
i386                  randconfig-004-20240308   gcc  
i386                  randconfig-005-20240308   clang
i386                  randconfig-006-20240308   clang
i386                  randconfig-011-20240308   gcc  
i386                  randconfig-012-20240308   clang
i386                  randconfig-013-20240308   clang
i386                  randconfig-014-20240308   clang
i386                  randconfig-015-20240308   gcc  
i386                  randconfig-016-20240308   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240308   gcc  
loongarch             randconfig-002-20240308   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     loongson1c_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240308   gcc  
nios2                 randconfig-002-20240308   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240308   gcc  
parisc                randconfig-002-20240308   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20240308   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc64             randconfig-001-20240308   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240308   gcc  
s390                  randconfig-002-20240308   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                    randconfig-001-20240308   gcc  
sh                    randconfig-002-20240308   gcc  
sh                           se7724_defconfig   gcc  
sh                            titan_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240308   gcc  
sparc64               randconfig-002-20240308   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-002-20240308   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-002-20240308   gcc  
x86_64       buildonly-randconfig-003-20240308   gcc  
x86_64       buildonly-randconfig-005-20240308   gcc  
x86_64       buildonly-randconfig-006-20240308   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240308   gcc  
x86_64                randconfig-005-20240308   gcc  
x86_64                randconfig-006-20240308   gcc  
x86_64                randconfig-012-20240308   gcc  
x86_64                randconfig-015-20240308   gcc  
x86_64                randconfig-016-20240308   gcc  
x86_64                randconfig-072-20240308   gcc  
x86_64                randconfig-073-20240308   gcc  
x86_64                randconfig-074-20240308   gcc  
x86_64                randconfig-075-20240308   gcc  
x86_64                randconfig-076-20240308   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240308   gcc  
xtensa                randconfig-002-20240308   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

