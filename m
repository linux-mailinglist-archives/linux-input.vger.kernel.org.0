Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6EFF405D1A
	for <lists+linux-input@lfdr.de>; Thu,  9 Sep 2021 21:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232409AbhIITDB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Sep 2021 15:03:01 -0400
Received: from mga05.intel.com ([192.55.52.43]:57318 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231422AbhIITDA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 Sep 2021 15:03:00 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="306448207"
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; 
   d="scan'208";a="306448207"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2021 12:01:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; 
   d="scan'208";a="649059040"
Received: from lkp-server01.sh.intel.com (HELO 730d49888f40) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 Sep 2021 12:01:48 -0700
Received: from kbuild by 730d49888f40 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mOPIx-0003Rk-Lj; Thu, 09 Sep 2021 19:01:47 +0000
Date:   Fri, 10 Sep 2021 03:01:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 0c5483a5778fa9910538453b5a9f1a6ed49e95ad
Message-ID: <613a5a0d.tqubKL450ADFpXcY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 0c5483a5778fa9910538453b5a9f1a6ed49e95ad  Input: analog - always use ktime functions

elapsed time: 727m

configs tested: 173
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210908
powerpc                      obs600_defconfig
powerpc                      walnut_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                       ppc64_defconfig
h8300                    h8300h-sim_defconfig
sh                        edosk7705_defconfig
sh                           se7751_defconfig
mips                         bigsur_defconfig
nios2                            allyesconfig
m68k                          amiga_defconfig
arm                            pleb_defconfig
m68k                            mac_defconfig
nios2                            alldefconfig
powerpc                      pcm030_defconfig
powerpc                  storcenter_defconfig
arm                          ep93xx_defconfig
sparc                       sparc32_defconfig
powerpc                     mpc5200_defconfig
arm                        spear6xx_defconfig
s390                                defconfig
arc                        nsimosci_defconfig
alpha                            allyesconfig
s390                          debug_defconfig
powerpc                      mgcoge_defconfig
powerpc                   lite5200b_defconfig
arm                             rpc_defconfig
arm                     am200epdkit_defconfig
powerpc                     skiroot_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                    klondike_defconfig
openrisc                            defconfig
mips                          ath79_defconfig
m68k                       m5208evb_defconfig
m68k                        m5407c3_defconfig
arm                       versatile_defconfig
arm                        cerfcube_defconfig
arm                          ixp4xx_defconfig
mips                      fuloong2e_defconfig
powerpc                 canyonlands_defconfig
ia64                             allmodconfig
arm                         at91_dt_defconfig
powerpc                      ppc6xx_defconfig
arm                        multi_v5_defconfig
powerpc                     kilauea_defconfig
sh                               j2_defconfig
sh                             espt_defconfig
ia64                        generic_defconfig
arm                         vf610m4_defconfig
mips                           ip32_defconfig
sh                           se7750_defconfig
mips                        workpad_defconfig
powerpc                        warp_defconfig
arm                         mv78xx0_defconfig
sh                           se7343_defconfig
powerpc                     redwood_defconfig
sh                        sh7763rdp_defconfig
sh                          r7785rp_defconfig
x86_64                           alldefconfig
sh                      rts7751r2d1_defconfig
arc                      axs103_smp_defconfig
sh                          sdk7780_defconfig
powerpc                        fsp2_defconfig
arm                       netwinder_defconfig
arm                        keystone_defconfig
ia64                          tiger_defconfig
mips                       capcella_defconfig
powerpc                         wii_defconfig
mips                          ath25_defconfig
mips                       lemote2f_defconfig
mips                       rbtx49xx_defconfig
mips                        vocore2_defconfig
powerpc                      makalu_defconfig
nios2                         3c120_defconfig
powerpc                      ep88xc_defconfig
arm                           sama7_defconfig
arc                          axs103_defconfig
microblaze                      mmu_defconfig
powerpc                    sam440ep_defconfig
openrisc                         alldefconfig
xtensa                    smp_lx200_defconfig
arm                           viper_defconfig
sh                        sh7785lcr_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                    vt8500_v6_v7_defconfig
arm                            qcom_defconfig
sh                        apsh4ad0a_defconfig
arm                        spear3xx_defconfig
x86_64               randconfig-c001-20210908
arm                  randconfig-c002-20210908
x86_64                            allnoconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a004-20210908
x86_64               randconfig-a006-20210908
x86_64               randconfig-a003-20210908
x86_64               randconfig-a001-20210908
x86_64               randconfig-a005-20210908
x86_64               randconfig-a002-20210908
i386                 randconfig-a005-20210908
i386                 randconfig-a004-20210908
i386                 randconfig-a006-20210908
i386                 randconfig-a002-20210908
i386                 randconfig-a001-20210908
i386                 randconfig-a003-20210908
arc                  randconfig-r043-20210908
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
s390                 randconfig-c005-20210908
powerpc              randconfig-c003-20210908
mips                 randconfig-c004-20210908
i386                 randconfig-c001-20210908
x86_64               randconfig-c007-20210908
arm                  randconfig-c002-20210908
riscv                randconfig-c006-20210908
x86_64               randconfig-a016-20210908
x86_64               randconfig-a011-20210908
x86_64               randconfig-a012-20210908
x86_64               randconfig-a015-20210908
x86_64               randconfig-a014-20210908
x86_64               randconfig-a013-20210908
i386                 randconfig-a012-20210908
i386                 randconfig-a015-20210908
i386                 randconfig-a011-20210908
i386                 randconfig-a013-20210908
i386                 randconfig-a014-20210908
i386                 randconfig-a016-20210908
s390                 randconfig-r044-20210908
riscv                randconfig-r042-20210908
hexagon              randconfig-r045-20210908
hexagon              randconfig-r041-20210908

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
