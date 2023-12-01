Return-Path: <linux-input+bounces-361-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97336800024
	for <lists+linux-input@lfdr.de>; Fri,  1 Dec 2023 01:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B915A1C20403
	for <lists+linux-input@lfdr.de>; Fri,  1 Dec 2023 00:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D02F7FF;
	Fri,  1 Dec 2023 00:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5VEKjYA"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F25B4170B
	for <linux-input@vger.kernel.org>; Thu, 30 Nov 2023 16:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701390006; x=1732926006;
  h=date:from:to:cc:subject:message-id;
  bh=9GfB0OxCTjjcir5EV/3QSY+5zsMeQeRLkCy7+OGI2Kw=;
  b=H5VEKjYA/9f7qpQi66FKytW6qQnjp6464M4fNyecKjuJKXdoBXF1bzxO
   OdMrcbhhXV9LXFsXIQBNwSNoMDoQGR9Wu5H61a9GhTUneYNhAxiIenKB6
   dPBIIb0iof1tLz9PE9HIqfXVT0CtuzZn+PUwla/88OMRL9w9+xsBTycGm
   LtyGQOlh79p+UyYMj+hu1TLw/v8Jz8QhiVVIJ61VGKuCP8MXLlGquJj+u
   Xu1eE6DUPXs159kJTI/6821p5NIEHqB/WaX13PdQWr86H24mw4jspWD9g
   651RUYsHFUkwJa8p/mlm7cPzV1Nd68nqY4KklDHkLB00NvyPFdQO7UwrP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="424563467"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="424563467"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 16:20:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="719301056"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="719301056"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Nov 2023 16:20:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8rGB-0002qX-0d;
	Fri, 01 Dec 2023 00:19:59 +0000
Date: Fri, 01 Dec 2023 08:19:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 a42b4bd51b2aec77fb38f1ce0f41846055a8d33c
Message-ID: <202312010809.pzWxJ7Au-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: a42b4bd51b2aec77fb38f1ce0f41846055a8d33c  dt-bindings: input: mediatek,pmic-keys: Drop incomplete example

elapsed time: 1461m

configs tested: 226
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
arc                        nsim_700_defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20231130   gcc  
arc                   randconfig-001-20231201   gcc  
arc                   randconfig-002-20231130   gcc  
arc                   randconfig-002-20231201   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                                 defconfig   clang
arm                          exynos_defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                   randconfig-001-20231130   gcc  
arm                   randconfig-001-20231201   gcc  
arm                   randconfig-002-20231130   gcc  
arm                   randconfig-002-20231201   gcc  
arm                   randconfig-003-20231130   gcc  
arm                   randconfig-003-20231201   gcc  
arm                   randconfig-004-20231130   gcc  
arm                   randconfig-004-20231201   gcc  
arm                        spear6xx_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231130   gcc  
arm64                 randconfig-001-20231201   gcc  
arm64                 randconfig-002-20231130   gcc  
arm64                 randconfig-002-20231201   gcc  
arm64                 randconfig-003-20231130   gcc  
arm64                 randconfig-003-20231201   gcc  
arm64                 randconfig-004-20231130   gcc  
arm64                 randconfig-004-20231201   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231130   gcc  
csky                  randconfig-001-20231201   gcc  
csky                  randconfig-002-20231130   gcc  
csky                  randconfig-002-20231201   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386                                defconfig   gcc  
i386                  randconfig-011-20231130   clang
i386                  randconfig-011-20231201   clang
i386                  randconfig-012-20231130   clang
i386                  randconfig-012-20231201   clang
i386                  randconfig-013-20231130   clang
i386                  randconfig-013-20231201   clang
i386                  randconfig-014-20231130   clang
i386                  randconfig-014-20231201   clang
i386                  randconfig-015-20231130   clang
i386                  randconfig-015-20231201   clang
i386                  randconfig-016-20231130   clang
i386                  randconfig-016-20231201   clang
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231130   gcc  
loongarch             randconfig-001-20231201   gcc  
loongarch             randconfig-002-20231130   gcc  
loongarch             randconfig-002-20231201   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                         db1xxx_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                          rb532_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231130   gcc  
nios2                 randconfig-001-20231201   gcc  
nios2                 randconfig-002-20231130   gcc  
nios2                 randconfig-002-20231201   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231130   gcc  
parisc                randconfig-001-20231201   gcc  
parisc                randconfig-002-20231130   gcc  
parisc                randconfig-002-20231201   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      bamboo_defconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                       maple_defconfig   gcc  
powerpc               randconfig-001-20231130   gcc  
powerpc               randconfig-001-20231201   gcc  
powerpc               randconfig-002-20231130   gcc  
powerpc               randconfig-002-20231201   gcc  
powerpc               randconfig-003-20231130   gcc  
powerpc               randconfig-003-20231201   gcc  
powerpc                     taishan_defconfig   gcc  
powerpc                     tqm8541_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20231130   gcc  
powerpc64             randconfig-001-20231201   gcc  
powerpc64             randconfig-002-20231130   gcc  
powerpc64             randconfig-002-20231201   gcc  
powerpc64             randconfig-003-20231130   gcc  
powerpc64             randconfig-003-20231201   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231130   gcc  
riscv                 randconfig-001-20231201   gcc  
riscv                 randconfig-002-20231130   gcc  
riscv                 randconfig-002-20231201   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                    randconfig-001-20231130   gcc  
sh                    randconfig-001-20231201   gcc  
sh                    randconfig-002-20231130   gcc  
sh                    randconfig-002-20231201   gcc  
sh                          rsk7269_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231130   gcc  
sparc64               randconfig-001-20231201   gcc  
sparc64               randconfig-002-20231130   gcc  
sparc64               randconfig-002-20231201   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231130   gcc  
um                    randconfig-001-20231201   gcc  
um                    randconfig-002-20231130   gcc  
um                    randconfig-002-20231201   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231130   gcc  
x86_64       buildonly-randconfig-002-20231130   gcc  
x86_64       buildonly-randconfig-003-20231130   gcc  
x86_64       buildonly-randconfig-004-20231130   gcc  
x86_64       buildonly-randconfig-005-20231130   gcc  
x86_64       buildonly-randconfig-006-20231130   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20231130   gcc  
x86_64                randconfig-012-20231130   gcc  
x86_64                randconfig-013-20231130   gcc  
x86_64                randconfig-014-20231130   gcc  
x86_64                randconfig-015-20231130   gcc  
x86_64                randconfig-016-20231130   gcc  
x86_64                randconfig-071-20231130   gcc  
x86_64                randconfig-072-20231130   gcc  
x86_64                randconfig-073-20231130   gcc  
x86_64                randconfig-074-20231130   gcc  
x86_64                randconfig-075-20231130   gcc  
x86_64                randconfig-076-20231130   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20231130   gcc  
xtensa                randconfig-001-20231201   gcc  
xtensa                randconfig-002-20231130   gcc  
xtensa                randconfig-002-20231201   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

