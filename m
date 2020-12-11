Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0852D8013
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 21:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgLKUgA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 15:36:00 -0500
Received: from mga17.intel.com ([192.55.52.151]:31498 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727561AbgLKUft (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 15:35:49 -0500
IronPort-SDR: wjUnl64O0JUOMGaBf9kiNwo+S5wL8p8EiuHi5Oe9K6ovHsJDl7yg5+VD8soSNK9FtpYwxR84EA
 kUAhSeSvNz2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9832"; a="154305422"
X-IronPort-AV: E=Sophos;i="5.78,412,1599548400"; 
   d="scan'208";a="154305422"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2020 12:35:08 -0800
IronPort-SDR: SOEOtChD6Tt1uYiVwuyQEIKLW2R+Y+pCKswCcaJNoaNCOeQyn2cJeXld0zPCgkSa4ME7FFTALs
 V/nhcM8L0tbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,412,1599548400"; 
   d="scan'208";a="442060951"
Received: from lkp-server01.sh.intel.com (HELO ecc0cebe68d1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Dec 2020 12:35:06 -0800
Received: from kbuild by ecc0cebe68d1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1knp86-00014c-9Q; Fri, 11 Dec 2020 20:35:06 +0000
Date:   Sat, 12 Dec 2020 04:34:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 cd3f609823a5896a6f4c229b3c2077475531e23d
Message-ID: <5fd3d7be.g0rhDUnHC7YyTFwM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  master
branch HEAD: cd3f609823a5896a6f4c229b3c2077475531e23d  Input: new da7280 haptic driver

elapsed time: 722m

configs tested: 212
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 linkstation_defconfig
sh                         apsh4a3a_defconfig
arm                           omap1_defconfig
powerpc                     mpc512x_defconfig
microblaze                    nommu_defconfig
arm                         hackkit_defconfig
arm                          moxart_defconfig
mips                           ip27_defconfig
mips                      bmips_stb_defconfig
openrisc                            defconfig
arm                            pleb_defconfig
arm                          collie_defconfig
arm                           sunxi_defconfig
ia64                             allyesconfig
arc                         haps_hs_defconfig
arm                          ixp4xx_defconfig
arm                          simpad_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                      tct_hammer_defconfig
m68k                       bvme6000_defconfig
arm                         nhk8815_defconfig
mips                           ip28_defconfig
mips                           ci20_defconfig
powerpc                     tqm8541_defconfig
sh                          landisk_defconfig
powerpc                       holly_defconfig
arm                          exynos_defconfig
s390                                defconfig
arm                            zeus_defconfig
sh                            migor_defconfig
mips                        vocore2_defconfig
arm                         orion5x_defconfig
powerpc                 mpc836x_mds_defconfig
sh                           se7343_defconfig
arm                          gemini_defconfig
sh                          rsk7269_defconfig
sh                        apsh4ad0a_defconfig
m68k                        m5272c3_defconfig
mips                   sb1250_swarm_defconfig
xtensa                    xip_kc705_defconfig
sh                          kfr2r09_defconfig
sparc                            alldefconfig
mips                        bcm47xx_defconfig
microblaze                      mmu_defconfig
arc                          axs103_defconfig
arm                       aspeed_g4_defconfig
powerpc                        warp_defconfig
arm                     eseries_pxa_defconfig
powerpc                    mvme5100_defconfig
powerpc                      acadia_defconfig
sh                             shx3_defconfig
arm                          imote2_defconfig
parisc                           alldefconfig
powerpc                    klondike_defconfig
mips                      loongson3_defconfig
arm                       spear13xx_defconfig
arm                        trizeps4_defconfig
mips                malta_kvm_guest_defconfig
sh                          sdk7780_defconfig
powerpc                 mpc8560_ads_defconfig
arm                         lubbock_defconfig
arm                          tango4_defconfig
mips                            ar7_defconfig
mips                     loongson1c_defconfig
powerpc                  storcenter_defconfig
arm                      footbridge_defconfig
arm                          iop32x_defconfig
riscv                    nommu_virt_defconfig
powerpc                      chrp32_defconfig
mips                           gcw0_defconfig
i386                             allyesconfig
powerpc                   currituck_defconfig
nds32                               defconfig
ia64                                defconfig
arm                         assabet_defconfig
alpha                            alldefconfig
sh                         microdev_defconfig
arm                           u8500_defconfig
powerpc                        icon_defconfig
powerpc                  mpc885_ads_defconfig
mips                           xway_defconfig
powerpc                      cm5200_defconfig
mips                      pistachio_defconfig
mips                      maltaaprp_defconfig
m68k                             alldefconfig
sh                          r7785rp_defconfig
sh                   secureedge5410_defconfig
ia64                          tiger_defconfig
arm                        mini2440_defconfig
sh                              ul2_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc64                           defconfig
powerpc                     rainier_defconfig
arm                          badge4_defconfig
s390                          debug_defconfig
powerpc                    ge_imp3a_defconfig
c6x                                 defconfig
mips                          rb532_defconfig
sh                             sh03_defconfig
arm                        keystone_defconfig
ia64                            zx1_defconfig
m68k                          multi_defconfig
sh                          lboxre2_defconfig
sh                          urquell_defconfig
sh                          sdk7786_defconfig
powerpc                      ppc64e_defconfig
arm                         palmz72_defconfig
sh                  sh7785lcr_32bit_defconfig
xtensa                         virt_defconfig
xtensa                generic_kc705_defconfig
sparc                            allyesconfig
powerpc                          g5_defconfig
arm                         shannon_defconfig
sh                               j2_defconfig
m68k                       m5249evb_defconfig
arm                       versatile_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                      pasemi_defconfig
mips                     cu1000-neo_defconfig
xtensa                    smp_lx200_defconfig
sh                           se7619_defconfig
arm                       omap2plus_defconfig
powerpc                       ebony_defconfig
arm                         s5pv210_defconfig
powerpc                      makalu_defconfig
sh                           se7724_defconfig
sh                            hp6xx_defconfig
mips                          rm200_defconfig
arm                             mxs_defconfig
riscv                            alldefconfig
powerpc                      arches_defconfig
powerpc                 mpc837x_rdb_defconfig
ia64                             allmodconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201209
i386                 randconfig-a005-20201209
i386                 randconfig-a001-20201209
i386                 randconfig-a002-20201209
i386                 randconfig-a006-20201209
i386                 randconfig-a003-20201209
i386                 randconfig-a001-20201210
i386                 randconfig-a004-20201210
i386                 randconfig-a003-20201210
i386                 randconfig-a002-20201210
i386                 randconfig-a005-20201210
i386                 randconfig-a006-20201210
x86_64               randconfig-a016-20201209
x86_64               randconfig-a012-20201209
x86_64               randconfig-a013-20201209
x86_64               randconfig-a014-20201209
x86_64               randconfig-a015-20201209
x86_64               randconfig-a011-20201209
i386                 randconfig-a014-20201209
i386                 randconfig-a015-20201209
i386                 randconfig-a016-20201209
i386                 randconfig-a013-20201209
i386                 randconfig-a011-20201209
i386                 randconfig-a012-20201209
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201209
x86_64               randconfig-a005-20201209
x86_64               randconfig-a001-20201209
x86_64               randconfig-a002-20201209
x86_64               randconfig-a003-20201209
x86_64               randconfig-a006-20201209
x86_64               randconfig-a003-20201210
x86_64               randconfig-a006-20201210
x86_64               randconfig-a002-20201210
x86_64               randconfig-a005-20201210
x86_64               randconfig-a004-20201210
x86_64               randconfig-a001-20201210

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
