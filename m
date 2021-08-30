Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDB913FB85A
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 16:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237121AbhH3Oi2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 10:38:28 -0400
Received: from mga02.intel.com ([134.134.136.20]:33937 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237084AbhH3Oi2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 10:38:28 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="205499159"
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; 
   d="scan'208";a="205499159"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 07:37:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; 
   d="scan'208";a="459410923"
Received: from lkp-server01.sh.intel.com (HELO 4fbc2b3ce5aa) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Aug 2021 07:37:33 -0700
Received: from kbuild by 4fbc2b3ce5aa with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mKiPk-0005CB-Ew; Mon, 30 Aug 2021 14:37:32 +0000
Date:   Mon, 30 Aug 2021 22:36:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 247141f5286b6a915dd225de076c29d8591e9a94
Message-ID: <612cecff.F5qjQhPINp6EWyYJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: 247141f5286b6a915dd225de076c29d8591e9a94  dt-bindings: input: tsc2005: Convert to YAML schema

elapsed time: 723m

configs tested: 178
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210830
nios2                         3c120_defconfig
sh                          rsk7264_defconfig
arm                        spear6xx_defconfig
arm                           h3600_defconfig
powerpc                 mpc832x_mds_defconfig
sh                          polaris_defconfig
powerpc                     rainier_defconfig
arm                             rpc_defconfig
powerpc                     pseries_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                     tqm8541_defconfig
i386                             allyesconfig
mips                          ath25_defconfig
arc                     nsimosci_hs_defconfig
arm                         nhk8815_defconfig
sh                           se7206_defconfig
mips                     loongson2k_defconfig
arm                           h5000_defconfig
sh                           se7724_defconfig
arm                          pcm027_defconfig
arm                         palmz72_defconfig
xtensa                  audio_kc705_defconfig
powerpc                     ksi8560_defconfig
m68k                       m5475evb_defconfig
sh                          kfr2r09_defconfig
mips                      pic32mzda_defconfig
arm                            lart_defconfig
sh                         apsh4a3a_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                    klondike_defconfig
m68k                       m5275evb_defconfig
mips                         tb0219_defconfig
mips                           xway_defconfig
mips                         mpc30x_defconfig
arm                          badge4_defconfig
mips                         cobalt_defconfig
sh                        edosk7705_defconfig
mips                           ip28_defconfig
openrisc                  or1klitex_defconfig
mips                      malta_kvm_defconfig
powerpc                      cm5200_defconfig
sparc                       sparc32_defconfig
powerpc                  mpc885_ads_defconfig
arm                            mmp2_defconfig
powerpc                      ppc6xx_defconfig
sh                           se7721_defconfig
m68k                                defconfig
mips                           gcw0_defconfig
powerpc                     powernv_defconfig
powerpc                    socrates_defconfig
arm                       netwinder_defconfig
arc                           tb10x_defconfig
sh                          rsk7201_defconfig
openrisc                         alldefconfig
arm                           sama5_defconfig
mips                        bcm47xx_defconfig
arm                            dove_defconfig
riscv                          rv32_defconfig
m68k                            q40_defconfig
sh                           se7751_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                   sh7770_generic_defconfig
mips                        workpad_defconfig
powerpc                      pasemi_defconfig
arm                        shmobile_defconfig
m68k                       m5208evb_defconfig
arm                            pleb_defconfig
sh                      rts7751r2d1_defconfig
i386                             alldefconfig
powerpc                    amigaone_defconfig
powerpc                     tqm5200_defconfig
mips                       rbtx49xx_defconfig
arm                       imx_v6_v7_defconfig
sh                   secureedge5410_defconfig
mips                        qi_lb60_defconfig
arm                        mvebu_v7_defconfig
mips                        bcm63xx_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nds32                               defconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a014-20210830
x86_64               randconfig-a015-20210830
x86_64               randconfig-a013-20210830
x86_64               randconfig-a016-20210830
x86_64               randconfig-a012-20210830
x86_64               randconfig-a011-20210830
x86_64               randconfig-a014-20210829
x86_64               randconfig-a016-20210829
x86_64               randconfig-a015-20210829
x86_64               randconfig-a012-20210829
x86_64               randconfig-a013-20210829
x86_64               randconfig-a011-20210829
i386                 randconfig-a011-20210829
i386                 randconfig-a016-20210829
i386                 randconfig-a012-20210829
i386                 randconfig-a014-20210829
i386                 randconfig-a013-20210829
i386                 randconfig-a015-20210829
i386                 randconfig-a016-20210830
i386                 randconfig-a011-20210830
i386                 randconfig-a015-20210830
i386                 randconfig-a014-20210830
i386                 randconfig-a012-20210830
i386                 randconfig-a013-20210830
s390                 randconfig-r044-20210830
arc                  randconfig-r043-20210830
riscv                randconfig-r042-20210830
riscv                randconfig-r042-20210829
s390                 randconfig-r044-20210829
arc                  randconfig-r043-20210829
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
i386                 randconfig-c001-20210830
s390                 randconfig-c005-20210830
riscv                randconfig-c006-20210830
powerpc              randconfig-c003-20210830
mips                 randconfig-c004-20210830
arm                  randconfig-c002-20210830
x86_64               randconfig-c007-20210830
x86_64               randconfig-a005-20210830
x86_64               randconfig-a001-20210830
x86_64               randconfig-a003-20210830
x86_64               randconfig-a002-20210830
x86_64               randconfig-a004-20210830
x86_64               randconfig-a006-20210830
i386                 randconfig-a005-20210830
i386                 randconfig-a002-20210830
i386                 randconfig-a003-20210830
i386                 randconfig-a006-20210830
i386                 randconfig-a004-20210830
i386                 randconfig-a001-20210830
hexagon              randconfig-r041-20210829
hexagon              randconfig-r045-20210829

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
