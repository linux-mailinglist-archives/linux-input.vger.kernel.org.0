Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC0A7358E83
	for <lists+linux-input@lfdr.de>; Thu,  8 Apr 2021 22:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbhDHUfM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Apr 2021 16:35:12 -0400
Received: from mga09.intel.com ([134.134.136.24]:8172 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231676AbhDHUfM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 8 Apr 2021 16:35:12 -0400
IronPort-SDR: hPaExXltDOUujVYx2m+jjbOQSdHylNiW/3OVEN1kK2V8mUiHWq2xJpd8nwQy17bFUsHmm0srx1
 o+PNm995DWqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="193742408"
X-IronPort-AV: E=Sophos;i="5.82,207,1613462400"; 
   d="scan'208";a="193742408"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 13:35:00 -0700
IronPort-SDR: rO4BA3Ir/MdQ1HIYasKv4buQ71x3jsW1c1NO+mB3DDzoJj0EUfi4U1Xroptn6hYwTur3Xf42lE
 GZATUSUGMATA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,207,1613462400"; 
   d="scan'208";a="422406191"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Apr 2021 13:34:58 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lUbMg-000FbK-5t; Thu, 08 Apr 2021 20:34:58 +0000
Date:   Fri, 09 Apr 2021 04:34:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 2531fdbf8bfc22b0a2554bb3e3772dd8105d74ad
Message-ID: <606f68eb.sDzNJTqOZ9AVghKS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: 2531fdbf8bfc22b0a2554bb3e3772dd8105d74ad  Input: gpio-keys - fix crash when disabliing GPIO-less buttons

elapsed time: 826m

configs tested: 248
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
arm                         lpc18xx_defconfig
arc                         haps_hs_defconfig
riscv                            alldefconfig
powerpc                     mpc83xx_defconfig
openrisc                 simple_smp_defconfig
mips                         rt305x_defconfig
um                                allnoconfig
sh                          urquell_defconfig
sh                            titan_defconfig
arm                             ezx_defconfig
arm                        oxnas_v6_defconfig
arm                            lart_defconfig
x86_64                              defconfig
arm                         assabet_defconfig
arm                          exynos_defconfig
arm                           viper_defconfig
sh                          lboxre2_defconfig
mips                        maltaup_defconfig
mips                         mpc30x_defconfig
arm                        cerfcube_defconfig
xtensa                  cadence_csp_defconfig
m68k                             allyesconfig
powerpc                     akebono_defconfig
arm                     eseries_pxa_defconfig
arm                            pleb_defconfig
m68k                         amcore_defconfig
sparc                       sparc32_defconfig
powerpc                     ppa8548_defconfig
m68k                        m5307c3_defconfig
m68k                       m5208evb_defconfig
mips                malta_qemu_32r6_defconfig
sh                           se7712_defconfig
mips                           ci20_defconfig
x86_64                           alldefconfig
mips                    maltaup_xpa_defconfig
powerpc                           allnoconfig
m68k                         apollo_defconfig
sh                          r7785rp_defconfig
powerpc                      pmac32_defconfig
mips                       lemote2f_defconfig
arm                         bcm2835_defconfig
arc                      axs103_smp_defconfig
arm                            hisi_defconfig
mips                            e55_defconfig
powerpc                      mgcoge_defconfig
powerpc                 linkstation_defconfig
sh                            migor_defconfig
sh                               j2_defconfig
powerpc                      ppc40x_defconfig
powerpc                     tqm8548_defconfig
i386                                defconfig
arm                        clps711x_defconfig
openrisc                  or1klitex_defconfig
powerpc                    amigaone_defconfig
sh                ecovec24-romimage_defconfig
mips                         cobalt_defconfig
m68k                        m5407c3_defconfig
arm                           spitz_defconfig
arm                         palmz72_defconfig
arm                         lpc32xx_defconfig
ia64                             alldefconfig
mips                      malta_kvm_defconfig
arm                       imx_v6_v7_defconfig
mips                           jazz_defconfig
m68k                        stmark2_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                      ppc6xx_defconfig
sh                   sh7770_generic_defconfig
sh                           sh2007_defconfig
arm                         at91_dt_defconfig
powerpc                     rainier_defconfig
xtensa                    smp_lx200_defconfig
xtensa                    xip_kc705_defconfig
m68k                       bvme6000_defconfig
h8300                            alldefconfig
arc                     nsimosci_hs_defconfig
mips                  cavium_octeon_defconfig
ia64                        generic_defconfig
arm                           tegra_defconfig
powerpc                     stx_gp3_defconfig
sh                      rts7751r2d1_defconfig
riscv             nommu_k210_sdcard_defconfig
m68k                            mac_defconfig
um                            kunit_defconfig
mips                      maltasmvp_defconfig
m68k                                defconfig
mips                           gcw0_defconfig
arm                          moxart_defconfig
m68k                       m5475evb_defconfig
s390                             allyesconfig
riscv                    nommu_k210_defconfig
mips                     loongson1b_defconfig
arm                        multi_v5_defconfig
mips                  decstation_64_defconfig
m68k                             alldefconfig
arm                          gemini_defconfig
mips                           mtx1_defconfig
arm                         lubbock_defconfig
arc                           tb10x_defconfig
mips                            gpr_defconfig
powerpc                      ppc64e_defconfig
mips                          rb532_defconfig
powerpc                     kmeter1_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                       maple_defconfig
powerpc64                           defconfig
mips                     cu1000-neo_defconfig
sh                   secureedge5410_defconfig
arm                         nhk8815_defconfig
sh                          landisk_defconfig
powerpc                      arches_defconfig
parisc                           allyesconfig
sh                           se7343_defconfig
sh                        sh7785lcr_defconfig
sh                          rsk7201_defconfig
powerpc                 mpc832x_rdb_defconfig
m68k                          hp300_defconfig
s390                          debug_defconfig
sh                 kfr2r09-romimage_defconfig
arm                             mxs_defconfig
mips                          malta_defconfig
arm                           u8500_defconfig
powerpc                    socrates_defconfig
mips                            ar7_defconfig
sh                          sdk7786_defconfig
arm                     am200epdkit_defconfig
sh                            shmin_defconfig
arm                           sunxi_defconfig
sh                           se7206_defconfig
nios2                            alldefconfig
arc                        vdk_hs38_defconfig
arm                            zeus_defconfig
powerpc                     sbc8548_defconfig
arm                       netwinder_defconfig
powerpc                        warp_defconfig
arm                          pxa3xx_defconfig
um                           x86_64_defconfig
mips                           ip28_defconfig
sh                   sh7724_generic_defconfig
sh                          rsk7269_defconfig
mips                        bcm47xx_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                      footbridge_defconfig
mips                           ip22_defconfig
m68k                          multi_defconfig
powerpc                      walnut_defconfig
m68k                       m5275evb_defconfig
arm                        mini2440_defconfig
xtensa                  audio_kc705_defconfig
arm64                            alldefconfig
arm                         hackkit_defconfig
powerpc                     mpc5200_defconfig
powerpc                      ep88xc_defconfig
m68k                          amiga_defconfig
arm                  colibri_pxa270_defconfig
powerpc                    mvme5100_defconfig
arm                        trizeps4_defconfig
arm                            xcep_defconfig
ia64                            zx1_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                      pasemi_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                          ep93xx_defconfig
sh                          r7780mp_defconfig
arm                            dove_defconfig
powerpc                 mpc85xx_cds_defconfig
xtensa                         virt_defconfig
m68k                        mvme16x_defconfig
powerpc                     kilauea_defconfig
arc                    vdk_hs38_smp_defconfig
mips                           ip32_defconfig
arm                        realview_defconfig
arm                        mvebu_v7_defconfig
arm                          collie_defconfig
arm                         shannon_defconfig
powerpc                 mpc8272_ads_defconfig
openrisc                            defconfig
mips                          ath25_defconfig
mips                          ath79_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a004-20210408
x86_64               randconfig-a005-20210408
x86_64               randconfig-a003-20210408
x86_64               randconfig-a001-20210408
x86_64               randconfig-a002-20210408
x86_64               randconfig-a006-20210408
i386                 randconfig-a006-20210408
i386                 randconfig-a003-20210408
i386                 randconfig-a001-20210408
i386                 randconfig-a004-20210408
i386                 randconfig-a005-20210408
i386                 randconfig-a002-20210408
i386                 randconfig-a011-20210408
i386                 randconfig-a012-20210408
i386                 randconfig-a013-20210408
i386                 randconfig-a014-20210408
i386                 randconfig-a016-20210408
i386                 randconfig-a015-20210408
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20210408
x86_64               randconfig-a015-20210408
x86_64               randconfig-a012-20210408
x86_64               randconfig-a011-20210408
x86_64               randconfig-a013-20210408
x86_64               randconfig-a016-20210408

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
