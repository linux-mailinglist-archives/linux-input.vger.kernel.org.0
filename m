Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0932F22C1
	for <lists+linux-input@lfdr.de>; Mon, 11 Jan 2021 23:29:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390033AbhAKW2y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Jan 2021 17:28:54 -0500
Received: from mga09.intel.com ([134.134.136.24]:60064 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387685AbhAKW2y (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Jan 2021 17:28:54 -0500
IronPort-SDR: 4qAmzVTFvh4uSlnvPY4Kak079Pok/TQtQ/pJ/adJPn+F2VPwSK+CoI+tTCMMmuNEPDDIgook8v
 8IaZzrEXrVuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="178096896"
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; 
   d="scan'208";a="178096896"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2021 14:28:12 -0800
IronPort-SDR: n4vZ/s/7ywFjdoDzkMOeR4aXsH6C4zW4Uljf3GIL7SO8JewPZHRd3z4mFb5U7vEkR9G8ZdjcyE
 bLu41GG8aLDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; 
   d="scan'208";a="464307245"
Received: from lkp-server01.sh.intel.com (HELO 3cff8e4c45aa) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Jan 2021 14:28:11 -0800
Received: from kbuild by 3cff8e4c45aa with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kz5fX-0000N0-3Q; Mon, 11 Jan 2021 22:28:11 +0000
Date:   Tue, 12 Jan 2021 06:28:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 2f6aa61d87e7d93c39e37b7ba2c4a9035000a0c8
Message-ID: <5ffcd0f1.P4qF2A1ZpZI+UXKS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  master
branch HEAD: 2f6aa61d87e7d93c39e37b7ba2c4a9035000a0c8  Input: omap4-keypad - implement errata check for lost key-up events

elapsed time: 720m

configs tested: 163
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nios2                            allyesconfig
powerpc                 mpc8560_ads_defconfig
sh                        dreamcast_defconfig
powerpc                      makalu_defconfig
powerpc                           allnoconfig
powerpc                    sam440ep_defconfig
arm                           tegra_defconfig
powerpc                     kmeter1_defconfig
arm                          pxa910_defconfig
c6x                        evmc6457_defconfig
arm                         s5pv210_defconfig
mips                          ath25_defconfig
arm                     eseries_pxa_defconfig
nds32                             allnoconfig
sh                          sdk7780_defconfig
riscv                            alldefconfig
mips                       rbtx49xx_defconfig
sh                             shx3_defconfig
mips                  cavium_octeon_defconfig
sh                           se7206_defconfig
powerpc                  storcenter_defconfig
arm                          ep93xx_defconfig
mips                        bcm63xx_defconfig
powerpc                  iss476-smp_defconfig
riscv                    nommu_k210_defconfig
i386                             alldefconfig
sh                          rsk7269_defconfig
sparc                               defconfig
sparc                       sparc64_defconfig
arm                          pxa168_defconfig
h8300                     edosk2674_defconfig
um                             i386_defconfig
arc                            hsdk_defconfig
powerpc                     tqm8540_defconfig
mips                      maltaaprp_defconfig
ia64                          tiger_defconfig
arm                        cerfcube_defconfig
mips                          ath79_defconfig
powerpc                      ep88xc_defconfig
arc                      axs103_smp_defconfig
s390                             allyesconfig
arm                       multi_v4t_defconfig
mips                         rt305x_defconfig
mips                         tb0219_defconfig
powerpc                      pcm030_defconfig
mips                      fuloong2e_defconfig
arm                         s3c2410_defconfig
powerpc                       maple_defconfig
sh                          polaris_defconfig
arc                     haps_hs_smp_defconfig
arm                             mxs_defconfig
parisc                generic-32bit_defconfig
xtensa                       common_defconfig
arm                         lpc18xx_defconfig
powerpc                      arches_defconfig
arm                          pcm027_defconfig
arm                           h5000_defconfig
powerpc                     tqm8560_defconfig
mips                      pic32mzda_defconfig
arm                        mini2440_defconfig
arm                          imote2_defconfig
mips                         bigsur_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                         cobalt_defconfig
arm                          gemini_defconfig
powerpc                     tqm5200_defconfig
powerpc                      bamboo_defconfig
arm                          badge4_defconfig
sh                          lboxre2_defconfig
sh                          sdk7786_defconfig
arc                           tb10x_defconfig
arm                         assabet_defconfig
xtensa                           alldefconfig
sh                  sh7785lcr_32bit_defconfig
arc                     nsimosci_hs_defconfig
parisc                           alldefconfig
powerpc                    mvme5100_defconfig
powerpc                     pseries_defconfig
sh                   secureedge5410_defconfig
mips                        qi_lb60_defconfig
sh                           se7619_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a006-20210111
x86_64               randconfig-a005-20210111
x86_64               randconfig-a004-20210111
x86_64               randconfig-a001-20210111
x86_64               randconfig-a003-20210111
x86_64               randconfig-a002-20210111
i386                 randconfig-a002-20210111
i386                 randconfig-a005-20210111
i386                 randconfig-a006-20210111
i386                 randconfig-a001-20210111
i386                 randconfig-a003-20210111
i386                 randconfig-a004-20210111
i386                 randconfig-a002-20210110
i386                 randconfig-a005-20210110
i386                 randconfig-a006-20210110
i386                 randconfig-a001-20210110
i386                 randconfig-a003-20210110
i386                 randconfig-a004-20210110
x86_64               randconfig-a015-20210110
x86_64               randconfig-a012-20210110
x86_64               randconfig-a013-20210110
x86_64               randconfig-a016-20210110
x86_64               randconfig-a014-20210110
x86_64               randconfig-a011-20210110
i386                 randconfig-a012-20210111
i386                 randconfig-a011-20210111
i386                 randconfig-a016-20210111
i386                 randconfig-a015-20210111
i386                 randconfig-a013-20210111
i386                 randconfig-a014-20210111
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210111
x86_64               randconfig-a012-20210111
x86_64               randconfig-a013-20210111
x86_64               randconfig-a016-20210111
x86_64               randconfig-a014-20210111
x86_64               randconfig-a011-20210111

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
