Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6F453BC2D7
	for <lists+linux-input@lfdr.de>; Mon,  5 Jul 2021 20:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhGESrc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Jul 2021 14:47:32 -0400
Received: from mga03.intel.com ([134.134.136.65]:45667 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229770AbhGESrc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 5 Jul 2021 14:47:32 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10036"; a="209056508"
X-IronPort-AV: E=Sophos;i="5.83,326,1616482800"; 
   d="scan'208";a="209056508"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2021 11:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,326,1616482800"; 
   d="scan'208";a="627445741"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Jul 2021 11:44:53 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m0TaP-000CXP-2N; Mon, 05 Jul 2021 18:44:53 +0000
Date:   Tue, 06 Jul 2021 02:44:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 f8f84af5da9ee04ef1d271528656dac42a090d00
Message-ID: <60e35309.PNCi2dFY8z2xzmN5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: f8f84af5da9ee04ef1d271528656dac42a090d00  Input: joydev - prevent use of not validated data in JSIOCSBTNMAP ioctl

elapsed time: 725m

configs tested: 153
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
xtensa                         virt_defconfig
arc                                 defconfig
arm                            pleb_defconfig
xtensa                    smp_lx200_defconfig
arc                        nsim_700_defconfig
arm                        vexpress_defconfig
arm                         axm55xx_defconfig
ia64                                defconfig
sh                  sh7785lcr_32bit_defconfig
sh                          rsk7201_defconfig
mips                     loongson2k_defconfig
arm                        mvebu_v5_defconfig
x86_64                           alldefconfig
m68k                       m5275evb_defconfig
powerpc                     tqm8560_defconfig
arm                     davinci_all_defconfig
arm                         socfpga_defconfig
mips                     loongson1c_defconfig
mips                        maltaup_defconfig
sparc64                          alldefconfig
xtensa                          iss_defconfig
arm                       aspeed_g5_defconfig
arc                            hsdk_defconfig
powerpc                  storcenter_defconfig
sh                           se7343_defconfig
sh                      rts7751r2d1_defconfig
arc                        vdk_hs38_defconfig
powerpc                       holly_defconfig
sh                             shx3_defconfig
sh                           se7619_defconfig
mips                           ci20_defconfig
sh                             sh03_defconfig
sh                            titan_defconfig
mips                       rbtx49xx_defconfig
powerpc                        cell_defconfig
arm                         hackkit_defconfig
powerpc                 mpc832x_mds_defconfig
arm                        magician_defconfig
arm                         cm_x300_defconfig
sh                           se7750_defconfig
arm                       multi_v4t_defconfig
m68k                          hp300_defconfig
mips                         tb0219_defconfig
powerpc                     ep8248e_defconfig
mips                       capcella_defconfig
mips                           gcw0_defconfig
powerpc                     mpc512x_defconfig
sh                        sh7757lcr_defconfig
arc                        nsimosci_defconfig
powerpc                    amigaone_defconfig
mips                        bcm47xx_defconfig
powerpc                    ge_imp3a_defconfig
arm                        realview_defconfig
csky                             alldefconfig
xtensa                       common_defconfig
m68k                       m5249evb_defconfig
arm                       netwinder_defconfig
powerpc                 mpc837x_mds_defconfig
arm                      integrator_defconfig
powerpc                      pcm030_defconfig
mips                      fuloong2e_defconfig
sh                          r7780mp_defconfig
arm                       imx_v6_v7_defconfig
arm                           stm32_defconfig
powerpc                     ppa8548_defconfig
arm                      pxa255-idp_defconfig
powerpc                      ppc40x_defconfig
powerpc                     kilauea_defconfig
powerpc                 mpc85xx_cds_defconfig
csky                                defconfig
openrisc                  or1klitex_defconfig
arm                       cns3420vb_defconfig
um                             i386_defconfig
parisc                generic-32bit_defconfig
powerpc                  mpc885_ads_defconfig
m68k                        mvme16x_defconfig
m68k                         amcore_defconfig
parisc                           allyesconfig
sh                           se7721_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
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
x86_64               randconfig-a004-20210705
x86_64               randconfig-a002-20210705
x86_64               randconfig-a005-20210705
x86_64               randconfig-a006-20210705
x86_64               randconfig-a003-20210705
x86_64               randconfig-a001-20210705
i386                 randconfig-a004-20210705
i386                 randconfig-a006-20210705
i386                 randconfig-a005-20210705
i386                 randconfig-a001-20210705
i386                 randconfig-a003-20210705
i386                 randconfig-a002-20210705
i386                 randconfig-a015-20210705
i386                 randconfig-a016-20210705
i386                 randconfig-a012-20210705
i386                 randconfig-a011-20210705
i386                 randconfig-a014-20210705
i386                 randconfig-a013-20210705
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210705
x86_64               randconfig-a015-20210705
x86_64               randconfig-a014-20210705
x86_64               randconfig-a012-20210705
x86_64               randconfig-a011-20210705
x86_64               randconfig-a016-20210705
x86_64               randconfig-a013-20210705

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
