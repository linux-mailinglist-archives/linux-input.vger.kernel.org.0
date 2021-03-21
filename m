Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2C58343624
	for <lists+linux-input@lfdr.de>; Mon, 22 Mar 2021 02:11:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbhCVBLB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 21:11:01 -0400
Received: from mga06.intel.com ([134.134.136.31]:4738 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229579AbhCVBK2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 21:10:28 -0400
IronPort-SDR: HAMWyov4O5K99oaYW7ZhdVKBG7gc6v1sLedf4uNL0NC3TXj4Z41mCUivNaA98WSix/JuuL8YX+
 vEqSgdpMoGzQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="251533448"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="251533448"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:10:25 -0700
IronPort-SDR: US43eRZl9+BrBE/xC6GdYaxgMJ9srL+rz68DVVFGwZfF2SzB3FvqsIeugH+p4Eo6IPspgWO3tv
 78W2qgMpaWCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="373671016"
Received: from lkp-server01.sh.intel.com (HELO cf98f15ee95b) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Mar 2021 18:10:23 -0700
Received: from kbuild by cf98f15ee95b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lO95K-00009S-It; Mon, 22 Mar 2021 01:10:22 +0000
Date:   Sun, 21 Mar 2021 23:36:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 f0a77ed9080a39a75faecff53fa37b3328926421
Message-ID: <6057681a.0qLPvKTTWl/ZyfSo%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: f0a77ed9080a39a75faecff53fa37b3328926421  ARM: tegra: acer-a500: Add atmel,wakeup-method property

elapsed time: 722m

configs tested: 121
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm64                            allyesconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
powerpc                 mpc8540_ads_defconfig
powerpc                        fsp2_defconfig
arm                             rpc_defconfig
arm                        keystone_defconfig
powerpc                     ppa8548_defconfig
parisc                           alldefconfig
mips                      fuloong2e_defconfig
powerpc                 mpc8560_ads_defconfig
arm                       spear13xx_defconfig
arm                          simpad_defconfig
powerpc                  mpc885_ads_defconfig
arm                       aspeed_g4_defconfig
powerpc                    adder875_defconfig
csky                                defconfig
powerpc                     tqm8560_defconfig
xtensa                generic_kc705_defconfig
mips                           jazz_defconfig
powerpc                  storcenter_defconfig
mips                             allmodconfig
arm                     am200epdkit_defconfig
arm                         vf610m4_defconfig
arc                        vdk_hs38_defconfig
arm                            pleb_defconfig
m68k                         amcore_defconfig
powerpc                       eiger_defconfig
powerpc                     tqm8540_defconfig
arm                         shannon_defconfig
arm                       omap2plus_defconfig
arm                          pcm027_defconfig
arm                        cerfcube_defconfig
arm                        neponset_defconfig
arm                         socfpga_defconfig
mips                         db1xxx_defconfig
powerpc                   lite5200b_defconfig
powerpc                          allmodconfig
sh                        dreamcast_defconfig
openrisc                         alldefconfig
powerpc                        cell_defconfig
arm                          collie_defconfig
powerpc                      makalu_defconfig
m68k                          multi_defconfig
arm                           sama5_defconfig
powerpc                    klondike_defconfig
mips                           mtx1_defconfig
arm                   milbeaut_m10v_defconfig
mips                 decstation_r4k_defconfig
sh                          urquell_defconfig
mips                           xway_defconfig
sh                        sh7785lcr_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
alpha                               defconfig
alpha                            allyesconfig
nds32                               defconfig
nios2                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
s390                             allyesconfig
s390                                defconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210321
x86_64               randconfig-a003-20210321
x86_64               randconfig-a001-20210321
i386                 randconfig-a004-20210321
i386                 randconfig-a006-20210321
i386                 randconfig-a005-20210321
i386                 randconfig-a003-20210321
i386                 randconfig-a001-20210321
i386                 randconfig-a002-20210321
i386                 randconfig-a014-20210321
i386                 randconfig-a011-20210321
i386                 randconfig-a015-20210321
i386                 randconfig-a016-20210321
i386                 randconfig-a013-20210321
i386                 randconfig-a012-20210321
x86_64               randconfig-a006-20210321
x86_64               randconfig-a005-20210321
x86_64               randconfig-a004-20210321
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20210321
x86_64               randconfig-a013-20210321
x86_64               randconfig-a011-20210321
x86_64               randconfig-a015-20210321
x86_64               randconfig-a014-20210321
x86_64               randconfig-a016-20210321

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
