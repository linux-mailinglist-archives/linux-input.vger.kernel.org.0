Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F27DF3BC2BB
	for <lists+linux-input@lfdr.de>; Mon,  5 Jul 2021 20:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbhGEShe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Jul 2021 14:37:34 -0400
Received: from mga12.intel.com ([192.55.52.136]:35296 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229757AbhGEShd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 5 Jul 2021 14:37:33 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10036"; a="188695691"
X-IronPort-AV: E=Sophos;i="5.83,326,1616482800"; 
   d="scan'208";a="188695691"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2021 11:34:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,326,1616482800"; 
   d="scan'208";a="644327352"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 Jul 2021 11:34:53 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m0TQi-000CXA-OH; Mon, 05 Jul 2021 18:34:52 +0000
Date:   Tue, 06 Jul 2021 02:34:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 818b26588994d9d95743fca0a427f08ec6c1c41d
Message-ID: <60e350a6.2sX/orvbYnR3dG2S%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 818b26588994d9d95743fca0a427f08ec6c1c41d  Merge branch 'next' into for-linus

elapsed time: 723m

configs tested: 148
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
xtensa                         virt_defconfig
arm                            pleb_defconfig
xtensa                    smp_lx200_defconfig
arc                        nsim_700_defconfig
arm                        vexpress_defconfig
arc                                 defconfig
arm                     eseries_pxa_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                       ppc64_defconfig
powerpc                     kilauea_defconfig
xtensa                  nommu_kc705_defconfig
arm                         axm55xx_defconfig
ia64                                defconfig
sh                  sh7785lcr_32bit_defconfig
sh                          rsk7201_defconfig
powerpc                     sbc8548_defconfig
arm                         vf610m4_defconfig
powerpc                      acadia_defconfig
mips                   sb1250_swarm_defconfig
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
arm                         cm_x300_defconfig
sh                           se7750_defconfig
arm                       multi_v4t_defconfig
powerpc                     mpc5200_defconfig
nds32                               defconfig
parisc                              defconfig
riscv                               defconfig
powerpc                     tqm8540_defconfig
m68k                          hp300_defconfig
mips                         tb0219_defconfig
powerpc                     ep8248e_defconfig
mips                       capcella_defconfig
mips                           gcw0_defconfig
powerpc                     mpc512x_defconfig
sh                        sh7757lcr_defconfig
arc                        nsimosci_defconfig
powerpc                    ge_imp3a_defconfig
arm                        realview_defconfig
csky                             alldefconfig
xtensa                       common_defconfig
m68k                       m5249evb_defconfig
arm                       netwinder_defconfig
powerpc                 mpc837x_mds_defconfig
arm                      integrator_defconfig
sh                           se7206_defconfig
m68k                          atari_defconfig
arm                        multi_v5_defconfig
ia64                            zx1_defconfig
arm                      pxa255-idp_defconfig
csky                                defconfig
powerpc                      ppc40x_defconfig
powerpc                 mpc85xx_cds_defconfig
openrisc                  or1klitex_defconfig
arm                       aspeed_g5_defconfig
arm                       cns3420vb_defconfig
um                             i386_defconfig
parisc                generic-32bit_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
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
x86_64               randconfig-a004-20210705
x86_64               randconfig-a002-20210705
x86_64               randconfig-a005-20210705
x86_64               randconfig-a006-20210705
x86_64               randconfig-a003-20210705
x86_64               randconfig-a001-20210705
i386                 randconfig-a004-20210705
i386                 randconfig-a006-20210705
i386                 randconfig-a001-20210705
i386                 randconfig-a003-20210705
i386                 randconfig-a005-20210705
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
