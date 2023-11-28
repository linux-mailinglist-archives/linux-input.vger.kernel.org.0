Return-Path: <linux-input+bounces-278-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD18D7FB20B
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 07:44:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BFE4B20E53
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 06:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602415682;
	Tue, 28 Nov 2023 06:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HtVOSHwT"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D0DF113
	for <linux-input@vger.kernel.org>; Mon, 27 Nov 2023 22:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701153873; x=1732689873;
  h=date:from:to:cc:subject:message-id;
  bh=8xdCfjxcUWSqykeDbKIg/IBRzFlUO8CNiHeAhy1NS38=;
  b=HtVOSHwTZzbUxsIpV+Y6hgw7W/QJTgyoTltJv48rwD2UGGZVV0NZ7Fhj
   ucI+lLlt7r3S50xRhTgzrwOc14gRf28mKw5o43Lj88xLvFVTZ2sqQeSFE
   GMC5NtqVvyJSgI/xJkFPKAMy6GxNlMgwTgqOI43otZ3E925M4T/wKdCbZ
   zKOFwvuAxYe/9EuT4ybwWFMNPUWth59XuH3pnnxJnMeeDBfXlK/1zAUnN
   iDArReZebMHVJqCJKsVhew77Yl2GiA0s4h2vAyKguUSBFVuQBExKrtkWw
   5efqGaYlKe6sjg7qwg33DjCWm9n/ACnuzqVBlPXleVxM/kHp3xyQUr2EN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="14419591"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="14419591"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 22:44:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="838967955"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="838967955"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Nov 2023 22:44:31 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7rpd-0007CN-2M;
	Tue, 28 Nov 2023 06:44:29 +0000
Date: Tue, 28 Nov 2023 14:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 936e4d49ecbc8c404790504386e1422b599dec39
Message-ID: <202311281435.v2ojgQtD-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 936e4d49ecbc8c404790504386e1422b599dec39  Input: atkbd - skip ATKBD_CMD_GETID in translated mode

elapsed time: 2807m

configs tested: 310
configs skipped: 3

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
arc                         haps_hs_defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20231126   gcc  
arc                   randconfig-001-20231127   gcc  
arc                   randconfig-002-20231126   gcc  
arc                   randconfig-002-20231127   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   clang
arm                           h3600_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                            mmp2_defconfig   clang
arm                       omap2plus_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                            qcom_defconfig   gcc  
arm                   randconfig-001-20231126   clang
arm                   randconfig-001-20231127   gcc  
arm                   randconfig-002-20231126   clang
arm                   randconfig-002-20231127   gcc  
arm                   randconfig-003-20231126   clang
arm                   randconfig-003-20231127   gcc  
arm                   randconfig-004-20231126   clang
arm                   randconfig-004-20231127   gcc  
arm                        shmobile_defconfig   gcc  
arm                        spear3xx_defconfig   clang
arm                        spear6xx_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231126   clang
arm64                 randconfig-001-20231127   gcc  
arm64                 randconfig-002-20231126   clang
arm64                 randconfig-002-20231127   gcc  
arm64                 randconfig-003-20231126   clang
arm64                 randconfig-003-20231127   gcc  
arm64                 randconfig-004-20231126   clang
arm64                 randconfig-004-20231127   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231126   gcc  
csky                  randconfig-001-20231127   gcc  
csky                  randconfig-002-20231126   gcc  
csky                  randconfig-002-20231127   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231126   clang
hexagon               randconfig-002-20231126   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231126   clang
i386         buildonly-randconfig-002-20231126   clang
i386         buildonly-randconfig-003-20231126   clang
i386         buildonly-randconfig-004-20231126   clang
i386         buildonly-randconfig-005-20231126   clang
i386         buildonly-randconfig-006-20231126   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231126   clang
i386                  randconfig-002-20231126   clang
i386                  randconfig-003-20231126   clang
i386                  randconfig-004-20231126   clang
i386                  randconfig-005-20231126   clang
i386                  randconfig-006-20231126   clang
i386                  randconfig-011-20231126   gcc  
i386                  randconfig-011-20231127   clang
i386                  randconfig-012-20231126   gcc  
i386                  randconfig-012-20231127   clang
i386                  randconfig-013-20231126   gcc  
i386                  randconfig-013-20231127   clang
i386                  randconfig-014-20231126   gcc  
i386                  randconfig-014-20231127   clang
i386                  randconfig-015-20231126   gcc  
i386                  randconfig-015-20231127   clang
i386                  randconfig-016-20231126   gcc  
i386                  randconfig-016-20231127   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231126   gcc  
loongarch             randconfig-001-20231127   gcc  
loongarch             randconfig-002-20231126   gcc  
loongarch             randconfig-002-20231127   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                           jazz_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                        omega2p_defconfig   clang
mips                           rs90_defconfig   clang
mips                         rt305x_defconfig   gcc  
mips                        vocore2_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231126   gcc  
nios2                 randconfig-001-20231127   gcc  
nios2                 randconfig-002-20231126   gcc  
nios2                 randconfig-002-20231127   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20231126   gcc  
parisc                randconfig-001-20231127   gcc  
parisc                randconfig-002-20231126   gcc  
parisc                randconfig-002-20231127   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      bamboo_defconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                    gamecube_defconfig   clang
powerpc                       holly_defconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                       maple_defconfig   gcc  
powerpc                      mgcoge_defconfig   gcc  
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                      pcm030_defconfig   gcc  
powerpc               randconfig-001-20231126   clang
powerpc               randconfig-001-20231127   gcc  
powerpc               randconfig-002-20231126   clang
powerpc               randconfig-002-20231127   gcc  
powerpc               randconfig-003-20231126   clang
powerpc               randconfig-003-20231127   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     stx_gp3_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc64                        alldefconfig   gcc  
powerpc64             randconfig-001-20231126   clang
powerpc64             randconfig-001-20231127   gcc  
powerpc64             randconfig-002-20231126   clang
powerpc64             randconfig-002-20231127   gcc  
powerpc64             randconfig-003-20231126   clang
powerpc64             randconfig-003-20231127   gcc  
riscv                            alldefconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                 randconfig-001-20231126   clang
riscv                 randconfig-001-20231127   gcc  
riscv                 randconfig-002-20231126   clang
riscv                 randconfig-002-20231127   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231126   gcc  
s390                  randconfig-002-20231126   gcc  
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20231126   gcc  
sh                    randconfig-001-20231127   gcc  
sh                    randconfig-002-20231126   gcc  
sh                    randconfig-002-20231127   gcc  
sh                          rsk7269_defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          alldefconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231126   gcc  
sparc64               randconfig-001-20231127   gcc  
sparc64               randconfig-002-20231126   gcc  
sparc64               randconfig-002-20231127   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231126   clang
um                    randconfig-001-20231127   gcc  
um                    randconfig-002-20231126   clang
um                    randconfig-002-20231127   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231126   clang
x86_64       buildonly-randconfig-001-20231127   gcc  
x86_64       buildonly-randconfig-002-20231126   clang
x86_64       buildonly-randconfig-002-20231127   gcc  
x86_64       buildonly-randconfig-003-20231126   clang
x86_64       buildonly-randconfig-003-20231127   gcc  
x86_64       buildonly-randconfig-004-20231126   clang
x86_64       buildonly-randconfig-004-20231127   gcc  
x86_64       buildonly-randconfig-005-20231126   clang
x86_64       buildonly-randconfig-005-20231127   gcc  
x86_64       buildonly-randconfig-006-20231126   clang
x86_64       buildonly-randconfig-006-20231127   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231126   gcc  
x86_64                randconfig-002-20231126   gcc  
x86_64                randconfig-003-20231126   gcc  
x86_64                randconfig-004-20231126   gcc  
x86_64                randconfig-005-20231126   gcc  
x86_64                randconfig-006-20231126   gcc  
x86_64                randconfig-011-20231126   clang
x86_64                randconfig-011-20231127   gcc  
x86_64                randconfig-012-20231126   clang
x86_64                randconfig-012-20231127   gcc  
x86_64                randconfig-013-20231126   clang
x86_64                randconfig-013-20231127   gcc  
x86_64                randconfig-014-20231126   clang
x86_64                randconfig-014-20231127   gcc  
x86_64                randconfig-015-20231126   clang
x86_64                randconfig-015-20231127   gcc  
x86_64                randconfig-016-20231126   clang
x86_64                randconfig-016-20231127   gcc  
x86_64                randconfig-071-20231126   clang
x86_64                randconfig-071-20231127   gcc  
x86_64                randconfig-072-20231126   clang
x86_64                randconfig-072-20231127   gcc  
x86_64                randconfig-073-20231126   clang
x86_64                randconfig-073-20231127   gcc  
x86_64                randconfig-074-20231126   clang
x86_64                randconfig-074-20231127   gcc  
x86_64                randconfig-075-20231126   clang
x86_64                randconfig-075-20231127   gcc  
x86_64                randconfig-076-20231126   clang
x86_64                randconfig-076-20231127   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20231126   gcc  
xtensa                randconfig-001-20231127   gcc  
xtensa                randconfig-002-20231126   gcc  
xtensa                randconfig-002-20231127   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

