Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 545C0400CCB
	for <lists+linux-input@lfdr.de>; Sat,  4 Sep 2021 21:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237456AbhIDTOT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Sep 2021 15:14:19 -0400
Received: from mga12.intel.com ([192.55.52.136]:6037 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232424AbhIDTOT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 4 Sep 2021 15:14:19 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10097"; a="199216860"
X-IronPort-AV: E=Sophos;i="5.85,268,1624345200"; 
   d="scan'208";a="199216860"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2021 12:13:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,268,1624345200"; 
   d="scan'208";a="603884017"
Received: from lkp-server01.sh.intel.com (HELO 2115029a3e5c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Sep 2021 12:13:12 -0700
Received: from kbuild by 2115029a3e5c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mMb6F-0001sm-8l; Sat, 04 Sep 2021 19:13:11 +0000
Date:   Sun, 05 Sep 2021 03:12:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 3e204d6b76b29274cc8e57f8bd8d9873f04a7f48
Message-ID: <6133c531.0csZEgujjgUWkCh/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: 3e204d6b76b29274cc8e57f8bd8d9873f04a7f48  Input: adc-keys - drop bogus __refdata annotation

elapsed time: 725m

configs tested: 183
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210904
m68k                       m5208evb_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     rainier_defconfig
m68k                        m5272c3_defconfig
arm                          pxa910_defconfig
sh                           se7343_defconfig
um                               alldefconfig
powerpc                     kilauea_defconfig
powerpc                     tqm8541_defconfig
powerpc                      ep88xc_defconfig
powerpc                   lite5200b_defconfig
arc                        nsimosci_defconfig
sh                          rsk7201_defconfig
mips                        workpad_defconfig
powerpc                      pasemi_defconfig
sh                   sh7770_generic_defconfig
arm                         s5pv210_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                         axm55xx_defconfig
powerpc                 mpc834x_itx_defconfig
mips                         tb0226_defconfig
mips                        bcm63xx_defconfig
arm                         socfpga_defconfig
arm                        spear6xx_defconfig
powerpc                 mpc8560_ads_defconfig
m68k                         amcore_defconfig
sparc                       sparc64_defconfig
powerpc                   motionpro_defconfig
mips                            ar7_defconfig
xtensa                              defconfig
arm                          simpad_defconfig
arm                        trizeps4_defconfig
riscv                    nommu_k210_defconfig
sh                             sh03_defconfig
powerpc                        fsp2_defconfig
mips                 decstation_r4k_defconfig
riscv                            allmodconfig
h8300                     edosk2674_defconfig
s390                             allmodconfig
powerpc                     mpc83xx_defconfig
powerpc                      makalu_defconfig
sh                          urquell_defconfig
microblaze                      mmu_defconfig
xtensa                  nommu_kc705_defconfig
sh                          polaris_defconfig
powerpc                     asp8347_defconfig
arm                       versatile_defconfig
mips                        nlm_xlr_defconfig
sh                             shx3_defconfig
sh                          rsk7203_defconfig
arc                 nsimosci_hs_smp_defconfig
ia64                        generic_defconfig
powerpc                   microwatt_defconfig
h8300                               defconfig
mips                         rt305x_defconfig
mips                        maltaup_defconfig
arm                           viper_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                      pxa255-idp_defconfig
ia64                         bigsur_defconfig
nds32                            alldefconfig
powerpc                          g5_defconfig
arm                         lubbock_defconfig
h8300                    h8300h-sim_defconfig
openrisc                 simple_smp_defconfig
arm                       imx_v4_v5_defconfig
arc                     haps_hs_smp_defconfig
arm                          ep93xx_defconfig
sh                           se7722_defconfig
arm                         at91_dt_defconfig
sh                ecovec24-romimage_defconfig
m68k                       bvme6000_defconfig
arm                        keystone_defconfig
xtensa                  cadence_csp_defconfig
mips                  cavium_octeon_defconfig
powerpc                    amigaone_defconfig
powerpc                   currituck_defconfig
mips                      loongson3_defconfig
mips                          ath79_defconfig
powerpc                      mgcoge_defconfig
sparc64                          alldefconfig
arm                            mps2_defconfig
powerpc                     akebono_defconfig
sh                         microdev_defconfig
mips                      maltaaprp_defconfig
powerpc                 mpc85xx_cds_defconfig
nios2                            alldefconfig
mips                     loongson2k_defconfig
powerpc                    adder875_defconfig
arm                       imx_v6_v7_defconfig
mips                        nlm_xlp_defconfig
xtensa                generic_kc705_defconfig
parisc                generic-32bit_defconfig
arm                          exynos_defconfig
arm                  randconfig-c002-20210904
i386                 randconfig-c001-20210905
arm                  randconfig-c002-20210905
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210904
x86_64               randconfig-a004-20210904
x86_64               randconfig-a003-20210904
x86_64               randconfig-a005-20210904
x86_64               randconfig-a001-20210904
x86_64               randconfig-a002-20210904
i386                 randconfig-a005-20210904
i386                 randconfig-a004-20210904
i386                 randconfig-a006-20210904
i386                 randconfig-a002-20210904
i386                 randconfig-a003-20210904
i386                 randconfig-a001-20210904
arc                  randconfig-r043-20210904
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
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20210904
mips                 randconfig-c004-20210904
powerpc              randconfig-c003-20210904
x86_64               randconfig-c007-20210904
i386                 randconfig-c001-20210904
arm                  randconfig-c002-20210904
riscv                randconfig-c006-20210904
x86_64               randconfig-a011-20210904
x86_64               randconfig-a016-20210904
x86_64               randconfig-a012-20210904
x86_64               randconfig-a015-20210904
x86_64               randconfig-a014-20210904
x86_64               randconfig-a013-20210904
i386                 randconfig-a012-20210904
i386                 randconfig-a015-20210904
i386                 randconfig-a011-20210904
i386                 randconfig-a013-20210904
i386                 randconfig-a014-20210904
i386                 randconfig-a016-20210904
riscv                randconfig-r042-20210904
hexagon              randconfig-r045-20210904
s390                 randconfig-r044-20210904
hexagon              randconfig-r041-20210904

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
