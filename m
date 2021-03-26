Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DBF534A5D8
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 11:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhCZKvV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Mar 2021 06:51:21 -0400
Received: from mga11.intel.com ([192.55.52.93]:20914 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229976AbhCZKut (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Mar 2021 06:50:49 -0400
IronPort-SDR: PPkCoaxLmYKnqQRj0DdQyQV8ZnG41dYwm/Qsqx/k5QuE7A4V53nRD9DD6tIvhDobH6xtduhxbL
 38SK8JbNBJqg==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="187835677"
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; 
   d="scan'208";a="187835677"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2021 03:50:48 -0700
IronPort-SDR: XiPIL5rNGCkZ4INZq5ykwLN0TlmVV9zvVcJVh7dFI77JMnCl5CH7QmtNlT3M7dAWvdC7dGhBsk
 J9GPbbnN9SNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; 
   d="scan'208";a="414510678"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 Mar 2021 03:50:47 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lPk3C-0002g9-HF; Fri, 26 Mar 2021 10:50:46 +0000
Date:   Fri, 26 Mar 2021 18:49:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 bfcf3d48dd02e95808a4693f2a49163f40fa5e74
Message-ID: <605dbc55.NjAPfPKXsDS4xkQh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: bfcf3d48dd02e95808a4693f2a49163f40fa5e74  Input: elan_i2c - fix a typo in parameter name

elapsed time: 731m

configs tested: 222
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                            allmodconfig
x86_64                           allyesconfig
i386                             allyesconfig
riscv                            allyesconfig
mips                           ip28_defconfig
powerpc                   lite5200b_defconfig
arm                         s5pv210_defconfig
powerpc                   currituck_defconfig
h8300                            alldefconfig
powerpc                     ksi8560_defconfig
powerpc                       maple_defconfig
powerpc                      obs600_defconfig
sparc64                             defconfig
arm                         assabet_defconfig
xtensa                              defconfig
sh                         ecovec24_defconfig
powerpc                    ge_imp3a_defconfig
arm                        shmobile_defconfig
powerpc                      cm5200_defconfig
powerpc                         wii_defconfig
arm                      jornada720_defconfig
sh                               alldefconfig
m68k                       m5475evb_defconfig
sh                   secureedge5410_defconfig
arm                        cerfcube_defconfig
powerpc                     mpc5200_defconfig
arm                          pxa3xx_defconfig
sh                          rsk7264_defconfig
csky                                defconfig
sh                     sh7710voipgw_defconfig
m68k                        stmark2_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                           gcw0_defconfig
arc                         haps_hs_defconfig
um                             i386_defconfig
arm                          badge4_defconfig
sh                           se7780_defconfig
mips                         tb0219_defconfig
sh                          r7780mp_defconfig
arm                             mxs_defconfig
powerpc                     tqm8560_defconfig
sh                   rts7751r2dplus_defconfig
um                                allnoconfig
powerpc64                           defconfig
mips                      bmips_stb_defconfig
mips                        maltaup_defconfig
arm                        mvebu_v7_defconfig
powerpc                         ps3_defconfig
parisc                generic-64bit_defconfig
mips                        qi_lb60_defconfig
sh                   sh7770_generic_defconfig
mips                        vocore2_defconfig
powerpc                       ppc64_defconfig
arm                           spitz_defconfig
arm                        keystone_defconfig
arm                          lpd270_defconfig
mips                      maltaaprp_defconfig
arm                        spear3xx_defconfig
arm                       imx_v6_v7_defconfig
mips                     loongson1c_defconfig
powerpc                     sequoia_defconfig
powerpc                      katmai_defconfig
arm                        multi_v7_defconfig
powerpc                      pcm030_defconfig
mips                            ar7_defconfig
openrisc                            defconfig
xtensa                  audio_kc705_defconfig
arm                          pxa168_defconfig
arm                           sunxi_defconfig
powerpc                   motionpro_defconfig
arm                         lpc18xx_defconfig
mips                     decstation_defconfig
sh                             espt_defconfig
mips                        bcm63xx_defconfig
m68k                                defconfig
mips                  cavium_octeon_defconfig
powerpc                 xes_mpc85xx_defconfig
sh                          sdk7780_defconfig
powerpc                      acadia_defconfig
powerpc                      makalu_defconfig
powerpc                     tqm5200_defconfig
powerpc                 linkstation_defconfig
mips                          malta_defconfig
csky                             alldefconfig
powerpc                      bamboo_defconfig
riscv                               defconfig
mips                        nlm_xlp_defconfig
nds32                            alldefconfig
riscv                    nommu_k210_defconfig
powerpc                      ep88xc_defconfig
xtensa                    xip_kc705_defconfig
mips                        omega2p_defconfig
sh                     magicpanelr2_defconfig
arm                          pcm027_defconfig
powerpc                     stx_gp3_defconfig
mips                           ip22_defconfig
m68k                          amiga_defconfig
arc                            hsdk_defconfig
xtensa                  cadence_csp_defconfig
arm                          imote2_defconfig
sh                           se7712_defconfig
arc                    vdk_hs38_smp_defconfig
arm                        multi_v5_defconfig
mips                         cobalt_defconfig
powerpc                        icon_defconfig
m68k                          multi_defconfig
arm                         axm55xx_defconfig
ia64                        generic_defconfig
m68k                            mac_defconfig
m68k                         amcore_defconfig
arm                         mv78xx0_defconfig
openrisc                 simple_smp_defconfig
arm                         orion5x_defconfig
powerpc                     tqm8548_defconfig
arm                           u8500_defconfig
arm                       netwinder_defconfig
powerpc                       eiger_defconfig
sh                          polaris_defconfig
mips                       lemote2f_defconfig
arm                       aspeed_g4_defconfig
sh                          kfr2r09_defconfig
mips                           ip32_defconfig
arm                     eseries_pxa_defconfig
sh                         apsh4a3a_defconfig
powerpc                     sbc8548_defconfig
arc                           tb10x_defconfig
h8300                               defconfig
arm                              alldefconfig
mips                         tb0226_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                     tqm8541_defconfig
m68k                            q40_defconfig
xtensa                    smp_lx200_defconfig
arm                  colibri_pxa270_defconfig
powerpc                 mpc837x_mds_defconfig
um                            kunit_defconfig
arm                          gemini_defconfig
arm                            mmp2_defconfig
powerpc64                        alldefconfig
arc                        nsimosci_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210325
x86_64               randconfig-a003-20210325
x86_64               randconfig-a006-20210325
x86_64               randconfig-a001-20210325
x86_64               randconfig-a005-20210325
x86_64               randconfig-a004-20210325
i386                 randconfig-a003-20210325
i386                 randconfig-a004-20210325
i386                 randconfig-a001-20210325
i386                 randconfig-a002-20210325
i386                 randconfig-a006-20210325
i386                 randconfig-a005-20210325
i386                 randconfig-a014-20210325
i386                 randconfig-a011-20210325
i386                 randconfig-a015-20210325
i386                 randconfig-a016-20210325
i386                 randconfig-a013-20210325
i386                 randconfig-a012-20210325
i386                 randconfig-a014-20210326
i386                 randconfig-a011-20210326
i386                 randconfig-a015-20210326
i386                 randconfig-a016-20210326
i386                 randconfig-a012-20210326
i386                 randconfig-a013-20210326
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210326
x86_64               randconfig-a003-20210326
x86_64               randconfig-a001-20210326
x86_64               randconfig-a006-20210326
x86_64               randconfig-a004-20210326
x86_64               randconfig-a005-20210326
x86_64               randconfig-a012-20210325
x86_64               randconfig-a015-20210325
x86_64               randconfig-a014-20210325
x86_64               randconfig-a013-20210325
x86_64               randconfig-a011-20210325
x86_64               randconfig-a016-20210325

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
