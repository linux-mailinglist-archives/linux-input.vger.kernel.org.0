Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E54452BAF95
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 17:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729054AbgKTQD4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Nov 2020 11:03:56 -0500
Received: from mga17.intel.com ([192.55.52.151]:40414 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728860AbgKTQDz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Nov 2020 11:03:55 -0500
IronPort-SDR: nkxJUa0aKlChLBSkHKUk6YTWSwtg2IFSKpb+YVI/T5DEe7t2fe9nCZ0w9LOdH2p33PE53bMatA
 NIoTObCZNvmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="151341071"
X-IronPort-AV: E=Sophos;i="5.78,357,1599548400"; 
   d="scan'208";a="151341071"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2020 08:03:55 -0800
IronPort-SDR: nKcSQtjGgU6B72FsbnOacnSDT36JadCH4IZP4ZND4UEGyJr/apI4KcI1i/74S2x6iniOFZxEIN
 ae5Dv7eZuvAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,357,1599548400"; 
   d="scan'208";a="477272431"
Received: from lkp-server01.sh.intel.com (HELO 00bc34107a07) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Nov 2020 08:03:53 -0800
Received: from kbuild by 00bc34107a07 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kg8t7-00001H-3t; Fri, 20 Nov 2020 16:03:53 +0000
Date:   Sat, 21 Nov 2020 00:03:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 3aa40a1ad36717114d9a267b08d884a387489fab
Message-ID: <5fb7e8d2.tz+omuwEmEAJrTuU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  master
branch HEAD: 3aa40a1ad36717114d9a267b08d884a387489fab  Input: vmmouse - demote obvious abuse of kernel-doc header

elapsed time: 720m

configs tested: 142
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                     haps_hs_smp_defconfig
mips                         db1xxx_defconfig
mips                      malta_kvm_defconfig
m68k                          sun3x_defconfig
s390                                defconfig
sh                           se7722_defconfig
nios2                         3c120_defconfig
m68k                       m5249evb_defconfig
powerpc                   lite5200b_defconfig
mips                       capcella_defconfig
xtensa                       common_defconfig
arm                         hackkit_defconfig
sh                   sh7724_generic_defconfig
powerpc                      obs600_defconfig
powerpc                     mpc512x_defconfig
powerpc                    socrates_defconfig
um                             i386_defconfig
sparc64                             defconfig
arm                          exynos_defconfig
arm                         cm_x300_defconfig
mips                      pic32mzda_defconfig
powerpc                     pseries_defconfig
mips                      maltaaprp_defconfig
arm                           u8500_defconfig
arm                          ep93xx_defconfig
alpha                               defconfig
ia64                            zx1_defconfig
ia64                      gensparse_defconfig
sh                            hp6xx_defconfig
mips                     decstation_defconfig
sh                          sdk7780_defconfig
mips                   sb1250_swarm_defconfig
mips                        jmr3927_defconfig
xtensa                          iss_defconfig
arm                              alldefconfig
mips                           ip28_defconfig
um                           x86_64_defconfig
arm                      tct_hammer_defconfig
powerpc                     ep8248e_defconfig
arm                        multi_v5_defconfig
arm                     davinci_all_defconfig
arm                             pxa_defconfig
mips                        workpad_defconfig
powerpc                 linkstation_defconfig
h8300                    h8300h-sim_defconfig
mips                            gpr_defconfig
xtensa                generic_kc705_defconfig
arm                       mainstone_defconfig
powerpc                      ep88xc_defconfig
m68k                          amiga_defconfig
m68k                         amcore_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                      pcm030_defconfig
arm                        magician_defconfig
m68k                           sun3_defconfig
um                            kunit_defconfig
powerpc                     ppa8548_defconfig
mips                            ar7_defconfig
arm                        mvebu_v5_defconfig
sparc                       sparc64_defconfig
sh                           se7750_defconfig
h8300                     edosk2674_defconfig
mips                     cu1830-neo_defconfig
csky                             alldefconfig
arm                  colibri_pxa270_defconfig
mips                           ci20_defconfig
powerpc                         ps3_defconfig
arm                          pxa3xx_defconfig
arm                           stm32_defconfig
powerpc                         wii_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20201120
x86_64               randconfig-a004-20201120
x86_64               randconfig-a001-20201120
x86_64               randconfig-a002-20201120
x86_64               randconfig-a006-20201120
x86_64               randconfig-a005-20201120
i386                 randconfig-a004-20201120
i386                 randconfig-a003-20201120
i386                 randconfig-a002-20201120
i386                 randconfig-a005-20201120
i386                 randconfig-a001-20201120
i386                 randconfig-a006-20201120
i386                 randconfig-a012-20201120
i386                 randconfig-a013-20201120
i386                 randconfig-a011-20201120
i386                 randconfig-a016-20201120
i386                 randconfig-a014-20201120
i386                 randconfig-a015-20201120
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20201120
x86_64               randconfig-a014-20201120
x86_64               randconfig-a012-20201120
x86_64               randconfig-a013-20201120
x86_64               randconfig-a015-20201120
x86_64               randconfig-a016-20201120

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
