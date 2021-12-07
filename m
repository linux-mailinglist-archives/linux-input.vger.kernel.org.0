Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA8046C617
	for <lists+linux-input@lfdr.de>; Tue,  7 Dec 2021 22:05:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238249AbhLGVJU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Dec 2021 16:09:20 -0500
Received: from mga07.intel.com ([134.134.136.100]:55291 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238370AbhLGVJG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Dec 2021 16:09:06 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="301069993"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="301069993"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 13:05:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="479664206"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 07 Dec 2021 13:05:14 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1muheD-000MyP-L5; Tue, 07 Dec 2021 21:05:13 +0000
Date:   Wed, 08 Dec 2021 05:04:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 81e818869be522bc8fa6f7df1b92d7e76537926c
Message-ID: <61afcc69.L2P1UFvf2C/1QBk8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 81e818869be522bc8fa6f7df1b92d7e76537926c  Input: goodix - add id->model mapping for the "9111" model

elapsed time: 722m

configs tested: 201
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211207
sparc                            allyesconfig
arm                         axm55xx_defconfig
sh                         microdev_defconfig
mips                     loongson1c_defconfig
s390                             allmodconfig
sh                     sh7710voipgw_defconfig
powerpc                  iss476-smp_defconfig
arm                       omap2plus_defconfig
sh                             sh03_defconfig
arm                       cns3420vb_defconfig
mips                           rs90_defconfig
powerpc                     skiroot_defconfig
sh                                  defconfig
m68k                             alldefconfig
arc                           tb10x_defconfig
arm                           tegra_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                 mpc836x_rdk_defconfig
m68k                            q40_defconfig
riscv                            alldefconfig
arm                           u8500_defconfig
mips                        workpad_defconfig
m68k                        m5307c3_defconfig
m68k                         apollo_defconfig
m68k                          atari_defconfig
arm                       multi_v4t_defconfig
xtensa                  nommu_kc705_defconfig
h8300                            allyesconfig
h8300                     edosk2674_defconfig
mips                      maltasmvp_defconfig
nds32                            alldefconfig
powerpc                     redwood_defconfig
sh                          sdk7786_defconfig
arm                           h5000_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                     ppa8548_defconfig
mips                      malta_kvm_defconfig
riscv                    nommu_virt_defconfig
powerpc                     taishan_defconfig
arm                          iop32x_defconfig
arm                         mv78xx0_defconfig
arc                     nsimosci_hs_defconfig
arm                         bcm2835_defconfig
sh                        apsh4ad0a_defconfig
arm                         vf610m4_defconfig
sh                          lboxre2_defconfig
sh                           se7705_defconfig
mips                           xway_defconfig
powerpc                      cm5200_defconfig
sparc64                             defconfig
powerpc                         wii_defconfig
mips                          rm200_defconfig
mips                        maltaup_defconfig
mips                          ath79_defconfig
arm                         lpc32xx_defconfig
h8300                    h8300h-sim_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                   motionpro_defconfig
parisc                           alldefconfig
arm                           h3600_defconfig
mips                      loongson3_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                           ip22_defconfig
arm                        shmobile_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                       imx_v4_v5_defconfig
arm                           sama7_defconfig
arm                           omap1_defconfig
powerpc                       holly_defconfig
arm                      pxa255-idp_defconfig
openrisc                         alldefconfig
powerpc                   lite5200b_defconfig
mips                         mpc30x_defconfig
powerpc                 xes_mpc85xx_defconfig
parisc                generic-64bit_defconfig
m68k                       bvme6000_defconfig
sh                              ul2_defconfig
arc                         haps_hs_defconfig
sparc                            alldefconfig
arm                         s5pv210_defconfig
powerpc                     stx_gp3_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                         ecovec24_defconfig
arm                         orion5x_defconfig
sh                           se7780_defconfig
xtensa                generic_kc705_defconfig
arm                        mvebu_v7_defconfig
xtensa                  audio_kc705_defconfig
powerpc                    ge_imp3a_defconfig
sh                             espt_defconfig
powerpc                   microwatt_defconfig
mips                         tb0226_defconfig
arm                          pxa910_defconfig
powerpc                     pq2fads_defconfig
mips                        omega2p_defconfig
arm                        keystone_defconfig
arm                        cerfcube_defconfig
mips                     decstation_defconfig
powerpc                        fsp2_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     powernv_defconfig
arc                      axs103_smp_defconfig
mips                     cu1000-neo_defconfig
arm                  colibri_pxa270_defconfig
sh                           se7722_defconfig
arm                          moxart_defconfig
nds32                             allnoconfig
powerpc                     tqm8548_defconfig
sh                        sh7757lcr_defconfig
mips                  cavium_octeon_defconfig
mips                           mtx1_defconfig
sh                   sh7770_generic_defconfig
alpha                               defconfig
arm                      jornada720_defconfig
sh                 kfr2r09-romimage_defconfig
arm                         at91_dt_defconfig
sparc                               defconfig
mips                       rbtx49xx_defconfig
arm                  randconfig-c002-20211207
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211207
x86_64               randconfig-a005-20211207
x86_64               randconfig-a001-20211207
x86_64               randconfig-a002-20211207
x86_64               randconfig-a004-20211207
x86_64               randconfig-a003-20211207
i386                 randconfig-a001-20211207
i386                 randconfig-a005-20211207
i386                 randconfig-a002-20211207
i386                 randconfig-a003-20211207
i386                 randconfig-a006-20211207
i386                 randconfig-a004-20211207
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
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
x86_64               randconfig-c007-20211207
arm                  randconfig-c002-20211207
riscv                randconfig-c006-20211207
mips                 randconfig-c004-20211207
i386                 randconfig-c001-20211207
powerpc              randconfig-c003-20211207
s390                 randconfig-c005-20211207
x86_64               randconfig-a016-20211207
x86_64               randconfig-a011-20211207
x86_64               randconfig-a013-20211207
x86_64               randconfig-a014-20211207
x86_64               randconfig-a015-20211207
x86_64               randconfig-a012-20211207
i386                 randconfig-a016-20211207
i386                 randconfig-a013-20211207
i386                 randconfig-a011-20211207
i386                 randconfig-a014-20211207
i386                 randconfig-a012-20211207
i386                 randconfig-a015-20211207
hexagon              randconfig-r045-20211207
s390                 randconfig-r044-20211207
riscv                randconfig-r042-20211207
hexagon              randconfig-r041-20211207

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
