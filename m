Return-Path: <linux-input+bounces-1212-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0721482AABC
	for <lists+linux-input@lfdr.de>; Thu, 11 Jan 2024 10:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A42E1C26941
	for <lists+linux-input@lfdr.de>; Thu, 11 Jan 2024 09:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CE411C8C;
	Thu, 11 Jan 2024 09:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fprZTILC"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A28A11C85
	for <linux-input@vger.kernel.org>; Thu, 11 Jan 2024 09:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704964895; x=1736500895;
  h=date:from:to:cc:subject:message-id;
  bh=6NX7817AgSU+NoPXaY09kaTbT0Fy4RECTnZXrA52W/o=;
  b=fprZTILCAiNiKgYzlkZww/tqxI0HJYbJXRFp5tQUOlLD3DC67Z2pSCY8
   iqMZ8px8wA0MUHAfILtFApDg3D3EfFZkAwD+IOalA7fAYAY3XecnY47K3
   O2jTztQx1xZ4TSvFKKKKP6MI4u/88QUOYDBPVGecR37j3psU7gsjH02gH
   KRgfir+avCGD6cfj27+inmML5CY5p1f/HYoZUFwVITgybuFP21l61YHYa
   kJTVJalxMefdwbrzmhB6S9zWFfcyYB3A632AitBg+ZnNVLM3/SI91lNzu
   EgRINNnXMCPzkYapWtmjCvoUhI7LPt0gOXvd74UeTZd09ZnsCIlCxaGpQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="397665261"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="397665261"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 01:21:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="24569585"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jan 2024 01:21:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNrFi-000846-2o;
	Thu, 11 Jan 2024 09:21:30 +0000
Date: Thu, 11 Jan 2024 17:20:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 52c4e5985a730796a3fa555b83b404708b960f9d
Message-ID: <202401111737.xlp716rR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 52c4e5985a730796a3fa555b83b404708b960f9d  Input: driver for Adafruit Seesaw Gamepad

elapsed time: 1446m

configs tested: 193
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
arc                     haps_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240111   gcc  
arc                   randconfig-002-20240111   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                          collie_defconfig   clang
arm                                 defconfig   clang
arm                       multi_v4t_defconfig   gcc  
arm                           omap1_defconfig   clang
arm                   randconfig-001-20240111   gcc  
arm                   randconfig-002-20240111   gcc  
arm                   randconfig-003-20240111   gcc  
arm                   randconfig-004-20240111   gcc  
arm                         s5pv210_defconfig   clang
arm                         socfpga_defconfig   clang
arm                           spitz_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240111   gcc  
arm64                 randconfig-002-20240111   gcc  
arm64                 randconfig-003-20240111   gcc  
arm64                 randconfig-004-20240111   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240111   gcc  
csky                  randconfig-002-20240111   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240111   clang
hexagon               randconfig-002-20240111   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240111   gcc  
i386         buildonly-randconfig-002-20240111   gcc  
i386         buildonly-randconfig-003-20240111   gcc  
i386         buildonly-randconfig-004-20240111   gcc  
i386         buildonly-randconfig-005-20240111   gcc  
i386         buildonly-randconfig-006-20240111   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240111   gcc  
i386                  randconfig-002-20240111   gcc  
i386                  randconfig-003-20240111   gcc  
i386                  randconfig-004-20240111   gcc  
i386                  randconfig-005-20240111   gcc  
i386                  randconfig-006-20240111   gcc  
i386                  randconfig-011-20240111   clang
i386                  randconfig-012-20240111   clang
i386                  randconfig-013-20240111   clang
i386                  randconfig-014-20240111   clang
i386                  randconfig-015-20240111   clang
i386                  randconfig-016-20240111   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240111   gcc  
loongarch             randconfig-002-20240111   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                            mac_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                     cu1000-neo_defconfig   clang
mips                           ip27_defconfig   gcc  
mips                          malta_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240111   gcc  
nios2                 randconfig-002-20240111   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240111   gcc  
parisc                randconfig-002-20240111   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        icon_defconfig   clang
powerpc                 mpc832x_rdb_defconfig   clang
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20240111   gcc  
powerpc               randconfig-002-20240111   gcc  
powerpc               randconfig-003-20240111   gcc  
powerpc                     redwood_defconfig   gcc  
powerpc64             randconfig-001-20240111   gcc  
powerpc64             randconfig-002-20240111   gcc  
powerpc64             randconfig-003-20240111   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                 randconfig-001-20240111   gcc  
riscv                 randconfig-002-20240111   gcc  
riscv                          rv32_defconfig   clang
s390                             alldefconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240111   clang
s390                  randconfig-002-20240111   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                    randconfig-001-20240111   gcc  
sh                    randconfig-002-20240111   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240111   gcc  
sparc64               randconfig-002-20240111   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240111   gcc  
um                    randconfig-002-20240111   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240111   gcc  
x86_64       buildonly-randconfig-002-20240111   gcc  
x86_64       buildonly-randconfig-003-20240111   gcc  
x86_64       buildonly-randconfig-004-20240111   gcc  
x86_64       buildonly-randconfig-005-20240111   gcc  
x86_64       buildonly-randconfig-006-20240111   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240111   clang
x86_64                randconfig-002-20240111   clang
x86_64                randconfig-003-20240111   clang
x86_64                randconfig-004-20240111   clang
x86_64                randconfig-005-20240111   clang
x86_64                randconfig-006-20240111   clang
x86_64                randconfig-011-20240111   gcc  
x86_64                randconfig-012-20240111   gcc  
x86_64                randconfig-013-20240111   gcc  
x86_64                randconfig-014-20240111   gcc  
x86_64                randconfig-015-20240111   gcc  
x86_64                randconfig-016-20240111   gcc  
x86_64                randconfig-071-20240111   gcc  
x86_64                randconfig-072-20240111   gcc  
x86_64                randconfig-073-20240111   gcc  
x86_64                randconfig-074-20240111   gcc  
x86_64                randconfig-075-20240111   gcc  
x86_64                randconfig-076-20240111   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240111   gcc  
xtensa                randconfig-002-20240111   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

