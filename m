Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1BE14457CB
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 18:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbhKDRDr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 13:03:47 -0400
Received: from mga02.intel.com ([134.134.136.20]:22413 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231616AbhKDRDq (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Nov 2021 13:03:46 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="218943168"
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; 
   d="scan'208";a="218943168"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 10:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; 
   d="scan'208";a="600315614"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 04 Nov 2021 10:01:02 -0700
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mig6o-0006ay-2z; Thu, 04 Nov 2021 17:01:02 +0000
Date:   Fri, 05 Nov 2021 01:00:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 322a552e19550872eb9f3a54330a5f615db42916
Message-ID: <618411bd.Ijy/jTsajzLwSRnX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 322a552e19550872eb9f3a54330a5f615db42916  Input: cap11xx - add support for cap1206

elapsed time: 1428m

configs tested: 180
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211103
i386                 randconfig-c001-20211104
powerpc                   motionpro_defconfig
riscv                    nommu_k210_defconfig
arm                      tct_hammer_defconfig
powerpc                    klondike_defconfig
parisc                generic-32bit_defconfig
powerpc                    sam440ep_defconfig
mips                           ip32_defconfig
arm                      integrator_defconfig
arm                         nhk8815_defconfig
arm                     eseries_pxa_defconfig
mips                        qi_lb60_defconfig
sh                        sh7785lcr_defconfig
arc                          axs101_defconfig
powerpc                     powernv_defconfig
mips                           rs90_defconfig
arm                          ixp4xx_defconfig
powerpc                     skiroot_defconfig
mips                      maltasmvp_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                       aspeed_g4_defconfig
mips                           mtx1_defconfig
powerpc                      cm5200_defconfig
powerpc                      acadia_defconfig
powerpc                      tqm8xx_defconfig
powerpc                   bluestone_defconfig
arm                         at91_dt_defconfig
arc                            hsdk_defconfig
xtensa                  audio_kc705_defconfig
arm                       imx_v6_v7_defconfig
powerpc                      bamboo_defconfig
i386                                defconfig
powerpc64                        alldefconfig
powerpc                           allnoconfig
nios2                         3c120_defconfig
nds32                               defconfig
powerpc                 mpc8540_ads_defconfig
arm                        neponset_defconfig
powerpc                     tqm8560_defconfig
arm                          collie_defconfig
powerpc                     asp8347_defconfig
powerpc                  storcenter_defconfig
arm                         bcm2835_defconfig
powerpc                      mgcoge_defconfig
sh                             sh03_defconfig
arm                           tegra_defconfig
arm                        multi_v5_defconfig
arm                          simpad_defconfig
m68k                       m5208evb_defconfig
arm                        spear6xx_defconfig
mips                          rb532_defconfig
mips                        bcm63xx_defconfig
s390                       zfcpdump_defconfig
arm                        shmobile_defconfig
powerpc                    socrates_defconfig
mips                      loongson3_defconfig
riscv                            allmodconfig
sh                          rsk7269_defconfig
arm                         s3c6400_defconfig
m68k                          amiga_defconfig
openrisc                  or1klitex_defconfig
powerpc                     pq2fads_defconfig
nios2                         10m50_defconfig
powerpc                      ppc6xx_defconfig
mips                     loongson2k_defconfig
sparc                       sparc64_defconfig
sh                           se7721_defconfig
arm                  randconfig-c002-20211103
arm                  randconfig-c002-20211104
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
h8300                            allyesconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
parisc                              defconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a004-20211104
x86_64               randconfig-a006-20211104
x86_64               randconfig-a001-20211104
x86_64               randconfig-a002-20211104
x86_64               randconfig-a003-20211104
x86_64               randconfig-a005-20211104
i386                 randconfig-a005-20211104
i386                 randconfig-a001-20211104
i386                 randconfig-a003-20211104
i386                 randconfig-a004-20211104
i386                 randconfig-a006-20211104
i386                 randconfig-a002-20211104
x86_64               randconfig-a012-20211103
x86_64               randconfig-a011-20211103
x86_64               randconfig-a013-20211103
x86_64               randconfig-a014-20211103
x86_64               randconfig-a015-20211103
x86_64               randconfig-a016-20211103
i386                 randconfig-a014-20211103
i386                 randconfig-a016-20211103
i386                 randconfig-a013-20211103
i386                 randconfig-a015-20211103
i386                 randconfig-a011-20211103
i386                 randconfig-a012-20211103
s390                 randconfig-r044-20211103
arc                  randconfig-r043-20211103
riscv                randconfig-r042-20211103
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
mips                 randconfig-c004-20211103
arm                  randconfig-c002-20211103
i386                 randconfig-c001-20211103
s390                 randconfig-c005-20211103
powerpc              randconfig-c003-20211103
riscv                randconfig-c006-20211103
x86_64               randconfig-c007-20211103
mips                 randconfig-c004-20211104
i386                 randconfig-c001-20211104
arm                  randconfig-c002-20211104
s390                 randconfig-c005-20211104
riscv                randconfig-c006-20211104
powerpc              randconfig-c003-20211104
x86_64               randconfig-c007-20211104
x86_64               randconfig-a006-20211103
x86_64               randconfig-a004-20211103
x86_64               randconfig-a001-20211103
x86_64               randconfig-a002-20211103
x86_64               randconfig-a005-20211103
x86_64               randconfig-a003-20211103
i386                 randconfig-a006-20211103
i386                 randconfig-a005-20211103
i386                 randconfig-a003-20211103
i386                 randconfig-a001-20211103
i386                 randconfig-a004-20211103
i386                 randconfig-a002-20211103
x86_64               randconfig-a012-20211104
x86_64               randconfig-a016-20211104
x86_64               randconfig-a015-20211104
x86_64               randconfig-a013-20211104
x86_64               randconfig-a011-20211104
x86_64               randconfig-a014-20211104
hexagon              randconfig-r041-20211103
hexagon              randconfig-r045-20211103
hexagon              randconfig-r041-20211104
riscv                randconfig-r042-20211104
s390                 randconfig-r044-20211104
hexagon              randconfig-r045-20211104

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
