Return-Path: <linux-input+bounces-3745-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 478168C9DF1
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2024 15:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0195E283D31
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2024 13:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B026135A6B;
	Mon, 20 May 2024 13:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rm/+k9rK"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD23A2D
	for <linux-input@vger.kernel.org>; Mon, 20 May 2024 13:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716210821; cv=none; b=bl8FlqjjwbA78M6+Kx4JHCTx7C8mO+2SDJ1xARCecSU8x4BFMNk1xjAao9mXGi8ef+LUniDPUe3kYNnJYHPgO2UVL7ALz3ySxvRkR6MVv6z8FPKmcyf90XhVUMyLGbdjjK49SODTkTQAIcIm1Gvni0BfUM4sc2ayFtbgoZrfKiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716210821; c=relaxed/simple;
	bh=uHFhviT7LbmHI2vlmKPWS+p893QIJaaIBvop391WpJE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ey8A6I0mti5rMGZC0H76ZQrWXwoNz+hdLP0yNkuLx5lBoVa1E64YDCF3S/LuS/5YYI7yQmgSkzOu4mz8D5dRgYwHxauBunp7NbzFr0wnhp9wxyhECt2KUUTdUnGjaT/x7SkCCVfp0Ii4Fe651umzjjieEI8uNByAV2LzxIsBunU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rm/+k9rK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716210819; x=1747746819;
  h=date:from:to:cc:subject:message-id;
  bh=uHFhviT7LbmHI2vlmKPWS+p893QIJaaIBvop391WpJE=;
  b=Rm/+k9rKCDdPpQ4Px88vyJHmI3GIoiebVH8ynL6PUQ3LaeqvB7gcyoXf
   VyxZGgz3KW7EBiA0W/FYTj5rpe0e3dR3SFePsfyM2yIkpakxsmAcPk0KT
   +d+p1iM0hhoOhuW61YwFitiQz1S8NG/9XSf8QF5C3snA8E4ma5sM5/IJD
   MMwp7FevrTYepy9ASiQwAv65Yt9hijOI06J41m5iow3yB6kgVj1VJ10Dg
   N8guGoLyDb0otfgY8LiqPY5hZ5SdTpPWs6GzJmW2eMwhJi5PyfM16siMj
   iGgcJecKJiuFO38qqhFgzVN0R+txbReTA8nUXEhiTfm3Wt+xmmH6R36Ku
   Q==;
X-CSE-ConnectionGUID: ROzZzfwCSmSMhzcqDubGQg==
X-CSE-MsgGUID: 30zPHe4ERdyk7PzlV2ex6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15284833"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="15284833"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 06:13:19 -0700
X-CSE-ConnectionGUID: 3c6uq7R0SSKfaMnhQdKiQA==
X-CSE-MsgGUID: hJvdRkFGQ1y63kL/lIF7GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="63763877"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 20 May 2024 06:13:18 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s92pH-0004s7-2z;
	Mon, 20 May 2024 13:13:15 +0000
Date: Mon, 20 May 2024 21:12:48 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 0774d19038c496f0c3602fb505c43e1b2d8eed85
Message-ID: <202405202146.8fPUi88y-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 0774d19038c496f0c3602fb505c43e1b2d8eed85  Input: try trimming too long modalias strings

elapsed time: 726m

configs tested: 196
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
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240520   gcc  
arc                   randconfig-002-20240520   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   clang
arm                          collie_defconfig   gcc  
arm                                 defconfig   clang
arm                          ep93xx_defconfig   clang
arm                          exynos_defconfig   clang
arm                            hisi_defconfig   gcc  
arm                       imx_v6_v7_defconfig   clang
arm                         lpc18xx_defconfig   clang
arm                          moxart_defconfig   gcc  
arm                       netwinder_defconfig   gcc  
arm                          pxa168_defconfig   clang
arm                   randconfig-001-20240520   clang
arm                   randconfig-002-20240520   clang
arm                   randconfig-003-20240520   gcc  
arm                   randconfig-004-20240520   clang
arm                       spear13xx_defconfig   gcc  
arm                        spear3xx_defconfig   clang
arm                       versatile_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240520   clang
arm64                 randconfig-002-20240520   clang
arm64                 randconfig-003-20240520   clang
arm64                 randconfig-004-20240520   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240520   gcc  
csky                  randconfig-002-20240520   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240520   clang
hexagon               randconfig-002-20240520   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240520   clang
i386         buildonly-randconfig-002-20240520   clang
i386         buildonly-randconfig-003-20240520   clang
i386         buildonly-randconfig-004-20240520   clang
i386         buildonly-randconfig-005-20240520   clang
i386         buildonly-randconfig-006-20240520   clang
i386                                defconfig   clang
i386                  randconfig-001-20240520   clang
i386                  randconfig-002-20240520   clang
i386                  randconfig-003-20240520   gcc  
i386                  randconfig-004-20240520   gcc  
i386                  randconfig-005-20240520   clang
i386                  randconfig-006-20240520   gcc  
i386                  randconfig-011-20240520   gcc  
i386                  randconfig-012-20240520   gcc  
i386                  randconfig-013-20240520   clang
i386                  randconfig-014-20240520   gcc  
i386                  randconfig-015-20240520   clang
i386                  randconfig-016-20240520   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240520   gcc  
loongarch             randconfig-002-20240520   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                     loongson2k_defconfig   gcc  
mips                          malta_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                        vocore2_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240520   gcc  
nios2                 randconfig-002-20240520   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240520   gcc  
parisc                randconfig-002-20240520   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      arches_defconfig   gcc  
powerpc                      bamboo_defconfig   clang
powerpc                   currituck_defconfig   clang
powerpc                      katmai_defconfig   clang
powerpc                       maple_defconfig   clang
powerpc                 mpc8315_rdb_defconfig   clang
powerpc               randconfig-001-20240520   gcc  
powerpc               randconfig-002-20240520   clang
powerpc               randconfig-003-20240520   clang
powerpc                     sequoia_defconfig   clang
powerpc                  storcenter_defconfig   gcc  
powerpc64             randconfig-001-20240520   clang
powerpc64             randconfig-002-20240520   gcc  
powerpc64             randconfig-003-20240520   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240520   gcc  
riscv                 randconfig-002-20240520   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240520   gcc  
s390                  randconfig-002-20240520   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240520   gcc  
sh                    randconfig-002-20240520   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240520   gcc  
sparc64               randconfig-002-20240520   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240520   clang
um                    randconfig-002-20240520   gcc  
um                           x86_64_defconfig   clang
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240520   clang
x86_64       buildonly-randconfig-002-20240520   gcc  
x86_64       buildonly-randconfig-003-20240520   gcc  
x86_64       buildonly-randconfig-004-20240520   gcc  
x86_64       buildonly-randconfig-005-20240520   gcc  
x86_64       buildonly-randconfig-006-20240520   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240520   clang
x86_64                randconfig-002-20240520   gcc  
x86_64                randconfig-003-20240520   gcc  
x86_64                randconfig-004-20240520   gcc  
x86_64                randconfig-005-20240520   gcc  
x86_64                randconfig-006-20240520   clang
x86_64                randconfig-011-20240520   clang
x86_64                randconfig-012-20240520   gcc  
x86_64                randconfig-013-20240520   clang
x86_64                randconfig-014-20240520   clang
x86_64                randconfig-015-20240520   gcc  
x86_64                randconfig-016-20240520   gcc  
x86_64                randconfig-071-20240520   clang
x86_64                randconfig-072-20240520   gcc  
x86_64                randconfig-073-20240520   clang
x86_64                randconfig-074-20240520   gcc  
x86_64                randconfig-075-20240520   clang
x86_64                randconfig-076-20240520   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240520   gcc  
xtensa                randconfig-002-20240520   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

