Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 803404075B5
	for <lists+linux-input@lfdr.de>; Sat, 11 Sep 2021 11:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235334AbhIKJPF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Sep 2021 05:15:05 -0400
Received: from mga03.intel.com ([134.134.136.65]:21731 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229494AbhIKJPF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Sep 2021 05:15:05 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10103"; a="221325437"
X-IronPort-AV: E=Sophos;i="5.85,284,1624345200"; 
   d="scan'208";a="221325437"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2021 02:13:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,284,1624345200"; 
   d="scan'208";a="697516286"
Received: from lkp-server01.sh.intel.com (HELO 730d49888f40) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Sep 2021 02:13:51 -0700
Received: from kbuild by 730d49888f40 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mOz55-0005Gm-1b; Sat, 11 Sep 2021 09:13:51 +0000
Date:   Sat, 11 Sep 2021 17:13:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 e2afe95a87a268bcdca2fb489d9c8a485e3aca85
Message-ID: <613c7340.VH1vTuxXU52L0VEZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: e2afe95a87a268bcdca2fb489d9c8a485e3aca85  dt-bindings: input: Add binding for cypress-sf

elapsed time: 1634m

configs tested: 134
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210910
nios2                            alldefconfig
arm                         bcm2835_defconfig
powerpc                 mpc8540_ads_defconfig
arm                         mv78xx0_defconfig
arc                          axs103_defconfig
powerpc                     akebono_defconfig
nios2                         3c120_defconfig
sh                         ap325rxa_defconfig
m68k                          atari_defconfig
h8300                    h8300h-sim_defconfig
m68k                          multi_defconfig
arm                       mainstone_defconfig
sh                          rsk7269_defconfig
powerpc                     powernv_defconfig
arm                      pxa255-idp_defconfig
um                             i386_defconfig
mips                         tb0287_defconfig
h8300                       h8s-sim_defconfig
powerpc                   bluestone_defconfig
mips                           ip27_defconfig
powerpc                     tqm8548_defconfig
powerpc                     ksi8560_defconfig
powerpc                     tqm8541_defconfig
m68k                             alldefconfig
m68k                       m5475evb_defconfig
powerpc                   microwatt_defconfig
mips                          ath25_defconfig
arm                            zeus_defconfig
arm                      tct_hammer_defconfig
arm                        magician_defconfig
powerpc                     tqm8540_defconfig
microblaze                          defconfig
powerpc                     mpc5200_defconfig
arm                  colibri_pxa300_defconfig
arm                        clps711x_defconfig
s390                             alldefconfig
ia64                      gensparse_defconfig
sh                           se7712_defconfig
arm                         assabet_defconfig
arm                          ixp4xx_defconfig
powerpc                      pmac32_defconfig
ia64                             allyesconfig
arm                         lpc18xx_defconfig
powerpc                      bamboo_defconfig
um                                  defconfig
powerpc                    adder875_defconfig
parisc                              defconfig
sh                          r7785rp_defconfig
arm                          ep93xx_defconfig
arm                           h5000_defconfig
mips                        workpad_defconfig
arm                         palmz72_defconfig
arm                       versatile_defconfig
x86_64               randconfig-c001-20210910
arm                  randconfig-c002-20210910
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
xtensa                           allyesconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
x86_64               randconfig-a013-20210910
x86_64               randconfig-a016-20210910
x86_64               randconfig-a012-20210910
x86_64               randconfig-a011-20210910
x86_64               randconfig-a014-20210910
x86_64               randconfig-a015-20210910
i386                 randconfig-a011-20210910
i386                 randconfig-a012-20210910
i386                 randconfig-a013-20210910
i386                 randconfig-a014-20210910
i386                 randconfig-a016-20210910
i386                 randconfig-a015-20210910
riscv                randconfig-r042-20210910
arc                  randconfig-r043-20210910
s390                 randconfig-r044-20210910
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-a006-20210910
x86_64               randconfig-a005-20210910
x86_64               randconfig-a002-20210910
x86_64               randconfig-a003-20210910
x86_64               randconfig-a004-20210910
x86_64               randconfig-a001-20210910
i386                 randconfig-a004-20210910
i386                 randconfig-a005-20210910
i386                 randconfig-a002-20210910
i386                 randconfig-a006-20210910
i386                 randconfig-a001-20210910
i386                 randconfig-a003-20210910
hexagon              randconfig-r045-20210910
hexagon              randconfig-r041-20210910

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
