Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B4D374ECD
	for <lists+linux-input@lfdr.de>; Thu,  6 May 2021 07:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhEFFPC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 May 2021 01:15:02 -0400
Received: from mga05.intel.com ([192.55.52.43]:41054 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229622AbhEFFPC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 6 May 2021 01:15:02 -0400
IronPort-SDR: nyvUZNjhXnKiyAdtGqHb1AYFr2urJn7KwJxm7sfdeRG4y68tckdOTNyBJM4savf2IbSi7HVLoP
 9G8tOq2E8Yig==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="283816394"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; 
   d="scan'208";a="283816394"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2021 22:14:04 -0700
IronPort-SDR: UOP8YMFfr1HZd+97yaKZwNqOyt1jUsvY9lqFYHefRZXp4wAnjUXn+cTSNzGosiIsig+dLYSNF7
 XfFPaRs6uIoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; 
   d="scan'208";a="532356422"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 May 2021 22:14:03 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1leWKp-000AMK-9j; Thu, 06 May 2021 05:14:03 +0000
Date:   Thu, 06 May 2021 13:13:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 d0034a7a4ac7fae708146ac0059b9c47a1543f0d
Message-ID: <60937b00.x8G/8kYF296JgDIs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: d0034a7a4ac7fae708146ac0059b9c47a1543f0d  Merge branch 'next' into for-linus

elapsed time: 722m

configs tested: 145
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
powerpc                   motionpro_defconfig
powerpc                     redwood_defconfig
arm                       cns3420vb_defconfig
powerpc                      ppc40x_defconfig
powerpc                 mpc8315_rdb_defconfig
sh                           se7705_defconfig
sh                             sh03_defconfig
sh                         ecovec24_defconfig
powerpc                  mpc885_ads_defconfig
sh                           sh2007_defconfig
arm                          pxa168_defconfig
arm                         orion5x_defconfig
sh                          rsk7201_defconfig
sh                          rsk7203_defconfig
xtensa                  audio_kc705_defconfig
arm                        multi_v5_defconfig
arm                      jornada720_defconfig
arm                              alldefconfig
arm                         cm_x300_defconfig
arm                        vexpress_defconfig
arm                        neponset_defconfig
arm                          imote2_defconfig
powerpc                     mpc5200_defconfig
mips                     loongson1b_defconfig
arm                          iop32x_defconfig
arm                         nhk8815_defconfig
mips                           ip27_defconfig
sh                          r7785rp_defconfig
mips                        omega2p_defconfig
sparc64                          alldefconfig
arc                     nsimosci_hs_defconfig
powerpc                  mpc866_ads_defconfig
mips                     cu1830-neo_defconfig
powerpc                     rainier_defconfig
sh                        dreamcast_defconfig
sh                     sh7710voipgw_defconfig
nios2                            alldefconfig
powerpc                     tqm5200_defconfig
um                             i386_defconfig
arm                      footbridge_defconfig
i386                                defconfig
mips                      malta_kvm_defconfig
xtensa                    smp_lx200_defconfig
mips                        qi_lb60_defconfig
powerpc                        warp_defconfig
arm                            mps2_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                             pxa_defconfig
powerpc                      ep88xc_defconfig
arm                       aspeed_g4_defconfig
alpha                            alldefconfig
m68k                       m5275evb_defconfig
arm                          ep93xx_defconfig
sh                            migor_defconfig
openrisc                  or1klitex_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                         palmz72_defconfig
mips                       bmips_be_defconfig
sh                           se7619_defconfig
xtensa                generic_kc705_defconfig
powerpc                    mvme5100_defconfig
h8300                    h8300h-sim_defconfig
arc                          axs103_defconfig
parisc                              defconfig
mips                             allyesconfig
m68k                       m5249evb_defconfig
mips                           ip32_defconfig
riscv                               defconfig
arm                       imx_v4_v5_defconfig
sh                           se7751_defconfig
m68k                            mac_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20210505
x86_64               randconfig-a003-20210505
x86_64               randconfig-a005-20210505
x86_64               randconfig-a002-20210505
x86_64               randconfig-a006-20210505
x86_64               randconfig-a004-20210505
i386                 randconfig-a003-20210505
i386                 randconfig-a006-20210505
i386                 randconfig-a001-20210505
i386                 randconfig-a005-20210505
i386                 randconfig-a004-20210505
i386                 randconfig-a002-20210505
i386                 randconfig-a015-20210505
i386                 randconfig-a013-20210505
i386                 randconfig-a016-20210505
i386                 randconfig-a014-20210505
i386                 randconfig-a012-20210505
i386                 randconfig-a011-20210505
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20210505
x86_64               randconfig-a015-20210505
x86_64               randconfig-a012-20210505
x86_64               randconfig-a013-20210505
x86_64               randconfig-a011-20210505
x86_64               randconfig-a016-20210505

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
