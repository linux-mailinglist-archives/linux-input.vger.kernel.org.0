Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 708352B9B7E
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 20:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727401AbgKST1r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 14:27:47 -0500
Received: from mga04.intel.com ([192.55.52.120]:11363 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727192AbgKST1r (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 14:27:47 -0500
IronPort-SDR: HjQTpyrhHqyxdHJGkwEHjJhBn1bfErAjIC2YrZ08swigZKfTCVMMwPKnWVk4aesC6VhNiIICUr
 R8uk9LIG86tw==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="168777349"
X-IronPort-AV: E=Sophos;i="5.78,354,1599548400"; 
   d="scan'208";a="168777349"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 11:27:45 -0800
IronPort-SDR: cqhwXoCVSDh1/S/Dy6zUb70+Dk8rIVS05OtreKj6UwN/BUtIDq19GFBlSJ+ec+nSXuAmYwaBFn
 CXs6PiACur1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,354,1599548400"; 
   d="scan'208";a="476935174"
Received: from lkp-server01.sh.intel.com (HELO 1b817e3f8ad2) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Nov 2020 11:27:44 -0800
Received: from kbuild by 1b817e3f8ad2 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kfpap-0000At-UA; Thu, 19 Nov 2020 19:27:43 +0000
Date:   Fri, 20 Nov 2020 03:27:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 30df385e35a48f773b85117fc490152c2395e45b
Message-ID: <5fb6c704.XQwpvcyswg9maaju%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  master
branch HEAD: 30df385e35a48f773b85117fc490152c2395e45b  Input: adp5589-keys - use devm_add_action_or_reset() for register clear

elapsed time: 724m

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
powerpc                    ge_imp3a_defconfig
mips                     cu1830-neo_defconfig
powerpc                     powernv_defconfig
mips                        nlm_xlr_defconfig
parisc                           allyesconfig
microblaze                    nommu_defconfig
mips                         mpc30x_defconfig
xtensa                          iss_defconfig
powerpc                      ppc40x_defconfig
powerpc                     kmeter1_defconfig
arm                        oxnas_v6_defconfig
powerpc                     mpc5200_defconfig
arm                     davinci_all_defconfig
arm                         hackkit_defconfig
sparc                       sparc64_defconfig
m68k                        mvme147_defconfig
xtensa                           alldefconfig
powerpc                      obs600_defconfig
m68k                          atari_defconfig
sh                           se7712_defconfig
arm                       multi_v4t_defconfig
mips                        workpad_defconfig
arm                          pcm027_defconfig
powerpc                     stx_gp3_defconfig
arm                         bcm2835_defconfig
powerpc                     rainier_defconfig
powerpc                     tqm8540_defconfig
arm                        trizeps4_defconfig
xtensa                         virt_defconfig
m68k                            q40_defconfig
ia64                          tiger_defconfig
arm                        realview_defconfig
m68k                          sun3x_defconfig
arm                          exynos_defconfig
mips                      pistachio_defconfig
mips                        nlm_xlp_defconfig
mips                           ip27_defconfig
csky                                defconfig
powerpc                    gamecube_defconfig
powerpc                  mpc866_ads_defconfig
m68k                        m5407c3_defconfig
powerpc                       eiger_defconfig
um                            kunit_defconfig
mips                      bmips_stb_defconfig
sh                            titan_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                          prima2_defconfig
xtensa                  audio_kc705_defconfig
arm                          ixp4xx_defconfig
powerpc                    klondike_defconfig
mips                     cu1000-neo_defconfig
arm                     am200epdkit_defconfig
arm                           h5000_defconfig
arm                  colibri_pxa270_defconfig
mips                        vocore2_defconfig
mips                          rm200_defconfig
sparc                            alldefconfig
m68k                       m5275evb_defconfig
mips                        omega2p_defconfig
arm                          badge4_defconfig
xtensa                    smp_lx200_defconfig
arm                         lpc32xx_defconfig
mips                       bmips_be_defconfig
powerpc                 mpc837x_mds_defconfig
arm                            zeus_defconfig
arc                         haps_hs_defconfig
arm                         s5pv210_defconfig
powerpc                           allnoconfig
powerpc                       ebony_defconfig
sh                          r7785rp_defconfig
arm                      footbridge_defconfig
sh                            shmin_defconfig
openrisc                 simple_smp_defconfig
arm                         nhk8815_defconfig
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
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                                defconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a006-20201119
i386                 randconfig-a005-20201119
i386                 randconfig-a002-20201119
i386                 randconfig-a001-20201119
i386                 randconfig-a003-20201119
i386                 randconfig-a004-20201119
x86_64               randconfig-a015-20201119
x86_64               randconfig-a014-20201119
x86_64               randconfig-a011-20201119
x86_64               randconfig-a013-20201119
x86_64               randconfig-a016-20201119
x86_64               randconfig-a012-20201119
i386                 randconfig-a012-20201119
i386                 randconfig-a014-20201119
i386                 randconfig-a016-20201119
i386                 randconfig-a011-20201119
i386                 randconfig-a013-20201119
i386                 randconfig-a015-20201119
riscv                            allyesconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a005-20201119
x86_64               randconfig-a003-20201119
x86_64               randconfig-a004-20201119
x86_64               randconfig-a002-20201119
x86_64               randconfig-a006-20201119
x86_64               randconfig-a001-20201119

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
