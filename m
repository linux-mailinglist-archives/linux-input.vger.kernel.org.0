Return-Path: <linux-input+bounces-1712-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FB984BEDA
	for <lists+linux-input@lfdr.de>; Tue,  6 Feb 2024 21:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E1DD1F27E32
	for <lists+linux-input@lfdr.de>; Tue,  6 Feb 2024 20:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FEDD1B944;
	Tue,  6 Feb 2024 20:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMxfEoWy"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F64F1B941
	for <linux-input@vger.kernel.org>; Tue,  6 Feb 2024 20:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707252203; cv=none; b=ZRNYBWFB2sYYrECC5RpEpyeObKoZIh52V0w2110V5z4RpvqbM4rWf7KwSJ7p8xJgC2+iBXbj1EAl5MCfoyimaz8U0O7hjWcl1rifQ3bYTRk7vkzrsBA6XiPcoo+jqf8SniOmVn8Cd8qUdoJTpMZrhPBlZ4/yFtikdtVdtBucy6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707252203; c=relaxed/simple;
	bh=PB7WaCSuqvMpil+wo8dPVV179uRArflwFIIfe6JpyQ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lr6SO0ls9zMpCQtp2qvVQqBa4ESICNza7l36alQGCkQrgleXdBS2mzG5FvjEmecnoOHGyEeTJOsHQOsohefsvxJDbtyr0LJpaVLGftIWRHOwSmTNrFJOEP3YTxeX/L6+bSTLQxhAky9p1vklnswuzXpeZBsqKgZcTvhVG3IB4Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMxfEoWy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707252201; x=1738788201;
  h=date:from:to:cc:subject:message-id;
  bh=PB7WaCSuqvMpil+wo8dPVV179uRArflwFIIfe6JpyQ4=;
  b=BMxfEoWyvg6a4NLodjOaeZPVtAGJ3PA0fZ/XgCbOg+Fy+uTHSZRlQbI5
   Z6y2xsZ+elYKJX/ehLIJjKCLdlZHt5YGpwW1BFzA2Bo5pdPS2YYbETN3k
   ki3y5oJzm5iAGdE4kaAcAVEEQfxTEtHU+01cOg6Yjznf1/L0SJPk3Iwr4
   qiRfnQMT5+65c7dPMqcDcKgEyx8prlRwiZvlK3bEaf70pRlrC1RSKvS2E
   yKUHI+p+ZpAjaCPHmxUlT2cxPJBgMatGdpABwrH29U9+olKrjRD9TmPFN
   m4xUr8J0EfZjlwXIzGaiWpBV1IBvF5QCStnFwJFkrOGvwEwrGCybPwwLu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="4653774"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="4653774"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 12:43:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1126291"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Feb 2024 12:43:19 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXSHl-0001mG-0u;
	Tue, 06 Feb 2024 20:43:17 +0000
Date: Wed, 07 Feb 2024 04:42:46 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 a0835e67031d9dc27eac7355243aefa2702ffbc3
Message-ID: <202402070440.8GfxMjOW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: a0835e67031d9dc27eac7355243aefa2702ffbc3  input: gameport: make gameport_bus const

elapsed time: 1507m

configs tested: 236
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              alldefconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240206   gcc  
arc                   randconfig-001-20240207   gcc  
arc                   randconfig-002-20240206   gcc  
arc                   randconfig-002-20240207   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                          collie_defconfig   gcc  
arm                                 defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                        mvebu_v5_defconfig   gcc  
arm                        neponset_defconfig   gcc  
arm                   randconfig-002-20240206   gcc  
arm                   randconfig-003-20240206   gcc  
arm                   randconfig-004-20240207   gcc  
arm                          sp7021_defconfig   gcc  
arm                           spitz_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240206   gcc  
arm64                 randconfig-003-20240206   gcc  
arm64                 randconfig-004-20240206   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240206   gcc  
csky                  randconfig-001-20240207   gcc  
csky                  randconfig-002-20240206   gcc  
csky                  randconfig-002-20240207   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240206   clang
i386         buildonly-randconfig-002-20240206   clang
i386         buildonly-randconfig-003-20240206   gcc  
i386         buildonly-randconfig-004-20240206   clang
i386         buildonly-randconfig-005-20240206   gcc  
i386         buildonly-randconfig-006-20240206   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240206   clang
i386                  randconfig-001-20240207   gcc  
i386                  randconfig-002-20240206   clang
i386                  randconfig-003-20240206   clang
i386                  randconfig-003-20240207   gcc  
i386                  randconfig-004-20240206   clang
i386                  randconfig-004-20240207   gcc  
i386                  randconfig-005-20240206   clang
i386                  randconfig-005-20240207   gcc  
i386                  randconfig-006-20240206   clang
i386                  randconfig-011-20240206   clang
i386                  randconfig-011-20240207   gcc  
i386                  randconfig-012-20240206   gcc  
i386                  randconfig-012-20240207   gcc  
i386                  randconfig-013-20240206   clang
i386                  randconfig-013-20240207   gcc  
i386                  randconfig-014-20240206   gcc  
i386                  randconfig-014-20240207   gcc  
i386                  randconfig-015-20240206   gcc  
i386                  randconfig-015-20240207   gcc  
i386                  randconfig-016-20240206   gcc  
i386                  randconfig-016-20240207   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240206   gcc  
loongarch             randconfig-001-20240207   gcc  
loongarch             randconfig-002-20240206   gcc  
loongarch             randconfig-002-20240207   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                            q40_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                          malta_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                           rs90_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240206   gcc  
nios2                 randconfig-001-20240207   gcc  
nios2                 randconfig-002-20240206   gcc  
nios2                 randconfig-002-20240207   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20240206   gcc  
parisc                randconfig-001-20240207   gcc  
parisc                randconfig-002-20240206   gcc  
parisc                randconfig-002-20240207   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                  iss476-smp_defconfig   gcc  
powerpc                   microwatt_defconfig   gcc  
powerpc                     powernv_defconfig   gcc  
powerpc                     ppa8548_defconfig   gcc  
powerpc                      ppc64e_defconfig   gcc  
powerpc               randconfig-002-20240206   gcc  
powerpc               randconfig-003-20240207   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240206   gcc  
powerpc64             randconfig-002-20240207   gcc  
powerpc64             randconfig-003-20240206   gcc  
powerpc64             randconfig-003-20240207   gcc  
riscv                            alldefconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240206   gcc  
riscv                 randconfig-002-20240207   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240207   gcc  
s390                  randconfig-002-20240207   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                    randconfig-001-20240206   gcc  
sh                    randconfig-001-20240207   gcc  
sh                    randconfig-002-20240206   gcc  
sh                    randconfig-002-20240207   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240206   gcc  
sparc64               randconfig-001-20240207   gcc  
sparc64               randconfig-002-20240206   gcc  
sparc64               randconfig-002-20240207   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-002-20240206   gcc  
um                    randconfig-002-20240207   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240206   gcc  
x86_64       buildonly-randconfig-002-20240206   clang
x86_64       buildonly-randconfig-003-20240206   gcc  
x86_64       buildonly-randconfig-004-20240206   gcc  
x86_64       buildonly-randconfig-005-20240206   gcc  
x86_64       buildonly-randconfig-006-20240206   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240206   clang
x86_64                randconfig-002-20240206   clang
x86_64                randconfig-003-20240206   gcc  
x86_64                randconfig-004-20240206   gcc  
x86_64                randconfig-005-20240206   gcc  
x86_64                randconfig-006-20240206   clang
x86_64                randconfig-011-20240206   gcc  
x86_64                randconfig-012-20240206   clang
x86_64                randconfig-013-20240206   gcc  
x86_64                randconfig-014-20240206   clang
x86_64                randconfig-015-20240206   gcc  
x86_64                randconfig-016-20240206   clang
x86_64                randconfig-071-20240206   gcc  
x86_64                randconfig-072-20240206   gcc  
x86_64                randconfig-073-20240206   gcc  
x86_64                randconfig-074-20240206   gcc  
x86_64                randconfig-075-20240206   clang
x86_64                randconfig-076-20240206   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240206   gcc  
xtensa                randconfig-001-20240207   gcc  
xtensa                randconfig-002-20240206   gcc  
xtensa                randconfig-002-20240207   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

