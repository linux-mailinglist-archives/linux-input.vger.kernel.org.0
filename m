Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0F2A323022
	for <lists+linux-input@lfdr.de>; Tue, 23 Feb 2021 19:00:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233711AbhBWSA3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Feb 2021 13:00:29 -0500
Received: from mga05.intel.com ([192.55.52.43]:32307 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233762AbhBWSA2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Feb 2021 13:00:28 -0500
IronPort-SDR: nwqmkcHozZyUxi+aih8gGON3YNXf5SyifjtkAknFmrcp5wwENuBYHNVS1MXE/LhhGH4hDtZi7T
 fD8zYbxG1dkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9904"; a="269849815"
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; 
   d="scan'208";a="269849815"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2021 09:59:46 -0800
IronPort-SDR: Z+DqevrEzsKw5Th/18SuYkbVRZuiM65PaL9k1ODS1TLzvOPqk5iQ6GS5PZSUryKQYpSAA25bPN
 PfEjl/9MEwRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; 
   d="scan'208";a="593276025"
Received: from lkp-server01.sh.intel.com (HELO 16660e54978b) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Feb 2021 09:59:44 -0800
Received: from kbuild by 16660e54978b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lEbyK-0001Rk-4D; Tue, 23 Feb 2021 17:59:44 +0000
Date:   Wed, 24 Feb 2021 01:58:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 4c47097f8514e4b35a31e04e33172d0193cb38ed
Message-ID: <60354262.ik8jtM3yMkKh4G0A%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: 4c47097f8514e4b35a31e04e33172d0193cb38ed  Input: aiptek - convert sysfs sprintf/snprintf family to sysfs_emit

elapsed time: 724m

configs tested: 131
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                  colibri_pxa300_defconfig
um                           x86_64_defconfig
arc                         haps_hs_defconfig
mips                        maltaup_defconfig
arm                         axm55xx_defconfig
m68k                         amcore_defconfig
arm                          ep93xx_defconfig
powerpc                    gamecube_defconfig
ia64                         bigsur_defconfig
powerpc                     tqm8560_defconfig
mips                           ip27_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                           sama5_defconfig
arm                            hisi_defconfig
microblaze                      mmu_defconfig
arc                          axs101_defconfig
arm                         s3c6400_defconfig
mips                           jazz_defconfig
arm                            pleb_defconfig
xtensa                           alldefconfig
arm                          moxart_defconfig
sh                          r7785rp_defconfig
mips                           xway_defconfig
mips                        qi_lb60_defconfig
arm                          pxa910_defconfig
arc                          axs103_defconfig
powerpc                    klondike_defconfig
m68k                          amiga_defconfig
arc                        nsim_700_defconfig
arc                              alldefconfig
sh                          rsk7203_defconfig
powerpc                    amigaone_defconfig
mips                      fuloong2e_defconfig
arm                        spear6xx_defconfig
mips                        vocore2_defconfig
mips                       bmips_be_defconfig
m68k                        mvme147_defconfig
s390                          debug_defconfig
powerpc                      pcm030_defconfig
powerpc                 mpc8560_ads_defconfig
h8300                            alldefconfig
arm                        multi_v7_defconfig
sh                             espt_defconfig
arm                        mvebu_v5_defconfig
powerpc                     mpc5200_defconfig
sh                        edosk7760_defconfig
powerpc                     ksi8560_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                      walnut_defconfig
mips                           ip32_defconfig
sh                        edosk7705_defconfig
sh                   secureedge5410_defconfig
mips                       rbtx49xx_defconfig
arm                          lpd270_defconfig
s390                                defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20210223
i386                 randconfig-a005-20210223
i386                 randconfig-a004-20210223
i386                 randconfig-a003-20210223
i386                 randconfig-a001-20210223
i386                 randconfig-a002-20210223
x86_64               randconfig-a015-20210223
x86_64               randconfig-a011-20210223
x86_64               randconfig-a012-20210223
x86_64               randconfig-a016-20210223
x86_64               randconfig-a014-20210223
x86_64               randconfig-a013-20210223
i386                 randconfig-a013-20210223
i386                 randconfig-a012-20210223
i386                 randconfig-a011-20210223
i386                 randconfig-a014-20210223
i386                 randconfig-a016-20210223
i386                 randconfig-a015-20210223
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20210223
x86_64               randconfig-a002-20210223
x86_64               randconfig-a003-20210223
x86_64               randconfig-a005-20210223
x86_64               randconfig-a006-20210223
x86_64               randconfig-a004-20210223

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
