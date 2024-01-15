Return-Path: <linux-input+bounces-1236-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B025982D4D9
	for <lists+linux-input@lfdr.de>; Mon, 15 Jan 2024 09:03:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1ED4F1F21723
	for <lists+linux-input@lfdr.de>; Mon, 15 Jan 2024 08:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D046FA4;
	Mon, 15 Jan 2024 08:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CrisPuS9"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F646FA1
	for <linux-input@vger.kernel.org>; Mon, 15 Jan 2024 08:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705305816; x=1736841816;
  h=date:from:to:cc:subject:message-id;
  bh=hkw24sneuv8gfAJgDsMdF+ouVaEqX0aaiamr44Uf/nk=;
  b=CrisPuS9U+I/hqGPqoi6Q6hI4wTMSnt36iPE61OPR6knmztjigRKVurJ
   zvvX2dB31q/oflBlKHTD6x23JRGbODQVFu+qI2RUqPNfrkrxDOn2kuMIT
   R8U5EqI6clPcIo+CLLDsJTniMQkGywkDHVSPTicCHH4sogqhBZK8Iveep
   uukgX4N5BEDfvs40TVVr3Ydx5fv1k58W144bKHYlj4suqTcuOzf9uZp2t
   MOtZya4gmBgYDlaFFiout66jI/UTiLJbvMrvofKMWHKvp7+yjD8FZiniy
   M24def1X+TuD6gZGG4DdkDQDR5IStDxYdoRH6lg/BaMCNhK4HI6vIOUuB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="465939972"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="465939972"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 00:03:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="817741394"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="817741394"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Jan 2024 00:03:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPHwL-000CJ6-0o;
	Mon, 15 Jan 2024 08:03:31 +0000
Date: Mon, 15 Jan 2024 16:02:54 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 e2a2501af13cfeb1f21bb628db54c49d61949a53
Message-ID: <202401151652.Tl5LqEEp-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: e2a2501af13cfeb1f21bb628db54c49d61949a53  Merge branch 'next' into for-linus

elapsed time: 1476m

configs tested: 157
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                   randconfig-001-20240115   gcc  
arc                   randconfig-002-20240115   gcc  
arm                               allnoconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                   randconfig-001-20240115   gcc  
arm                   randconfig-002-20240115   gcc  
arm                   randconfig-003-20240115   gcc  
arm                   randconfig-004-20240115   gcc  
arm                           sama5_defconfig   gcc  
arm                        spear6xx_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240115   gcc  
arm64                 randconfig-002-20240115   gcc  
arm64                 randconfig-003-20240115   gcc  
arm64                 randconfig-004-20240115   gcc  
csky                             alldefconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240115   gcc  
csky                  randconfig-002-20240115   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386                  randconfig-011-20240115   clang
i386                  randconfig-012-20240115   clang
i386                  randconfig-013-20240115   clang
i386                  randconfig-014-20240115   clang
i386                  randconfig-015-20240115   clang
i386                  randconfig-016-20240115   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20240115   gcc  
loongarch             randconfig-002-20240115   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240115   gcc  
nios2                 randconfig-002-20240115   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240115   gcc  
parisc                randconfig-002-20240115   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        cell_defconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                      pasemi_defconfig   gcc  
powerpc               randconfig-001-20240115   gcc  
powerpc               randconfig-002-20240115   gcc  
powerpc               randconfig-003-20240115   gcc  
powerpc                     sequoia_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20240115   gcc  
powerpc64             randconfig-002-20240115   gcc  
powerpc64             randconfig-003-20240115   gcc  
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20240115   gcc  
riscv                 randconfig-002-20240115   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                    randconfig-001-20240115   gcc  
sh                    randconfig-002-20240115   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240115   gcc  
sparc64               randconfig-002-20240115   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240115   gcc  
um                    randconfig-002-20240115   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240115   gcc  
x86_64       buildonly-randconfig-002-20240115   gcc  
x86_64       buildonly-randconfig-003-20240115   gcc  
x86_64       buildonly-randconfig-004-20240115   gcc  
x86_64       buildonly-randconfig-005-20240115   gcc  
x86_64       buildonly-randconfig-006-20240115   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20240115   gcc  
x86_64                randconfig-012-20240115   gcc  
x86_64                randconfig-013-20240115   gcc  
x86_64                randconfig-014-20240115   gcc  
x86_64                randconfig-015-20240115   gcc  
x86_64                randconfig-016-20240115   gcc  
x86_64                randconfig-071-20240115   gcc  
x86_64                randconfig-072-20240115   gcc  
x86_64                randconfig-073-20240115   gcc  
x86_64                randconfig-074-20240115   gcc  
x86_64                randconfig-075-20240115   gcc  
x86_64                randconfig-076-20240115   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20240115   gcc  
xtensa                randconfig-002-20240115   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

