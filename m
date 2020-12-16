Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA2B2DC1BC
	for <lists+linux-input@lfdr.de>; Wed, 16 Dec 2020 14:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgLPN7Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Dec 2020 08:59:24 -0500
Received: from mga12.intel.com ([192.55.52.136]:25904 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725550AbgLPN7Y (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Dec 2020 08:59:24 -0500
IronPort-SDR: ymAkHf8LzfkQmHae0ImbznMpBkvnjGG3MIWi1rEt36n+eIBmlV0w/6e1hoVsMJJK9Y2zsc3f5V
 TKSZYp4LhvjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="154296697"
X-IronPort-AV: E=Sophos;i="5.78,424,1599548400"; 
   d="scan'208";a="154296697"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2020 05:58:43 -0800
IronPort-SDR: DEkrNKwOd83K9p805L2m0mOc7UZiUvjmZYwThv62f2EsdGukau3GM4utl06MQbFID7wM6N/CwH
 FNRTzR/c/Mew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,424,1599548400"; 
   d="scan'208";a="412634425"
Received: from lkp-server02.sh.intel.com (HELO 070e1a605002) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Dec 2020 05:58:42 -0800
Received: from kbuild by 070e1a605002 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kpXKD-000043-Dx; Wed, 16 Dec 2020 13:58:41 +0000
Date:   Wed, 16 Dec 2020 21:57:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 fafd320ae51b9c72d371585b2501f86640ea7b7d
Message-ID: <5fda1266.DddG1V/1aIGo9ogP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  master
branch HEAD: fafd320ae51b9c72d371585b2501f86640ea7b7d  Input: raydium_ts_i2c - do not send zero length

elapsed time: 720m

configs tested: 129
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7750_defconfig
powerpc                 xes_mpc85xx_defconfig
sh                           se7751_defconfig
arm                            xcep_defconfig
arm                           efm32_defconfig
powerpc                  mpc885_ads_defconfig
powerpc               mpc834x_itxgp_defconfig
arc                           tb10x_defconfig
powerpc                     ksi8560_defconfig
arm                    vt8500_v6_v7_defconfig
mips                            ar7_defconfig
powerpc                       ppc64_defconfig
arm                          ep93xx_defconfig
powerpc                        warp_defconfig
powerpc                    ge_imp3a_defconfig
c6x                                 defconfig
powerpc                     sequoia_defconfig
sh                            shmin_defconfig
xtensa                         virt_defconfig
sparc64                             defconfig
sparc                       sparc32_defconfig
mips                          ath79_defconfig
mips                        workpad_defconfig
s390                             alldefconfig
mips                           ip32_defconfig
s390                                defconfig
sh                           se7722_defconfig
mips                     loongson1c_defconfig
arm                       versatile_defconfig
arm                          pxa910_defconfig
arm                        clps711x_defconfig
powerpc                     ep8248e_defconfig
arm                       netwinder_defconfig
arm                           h5000_defconfig
powerpc                     kmeter1_defconfig
arm                      integrator_defconfig
powerpc                       maple_defconfig
mips                           ip27_defconfig
nds32                             allnoconfig
arm64                            alldefconfig
arm                             ezx_defconfig
mips                        bcm47xx_defconfig
powerpc                      mgcoge_defconfig
sh                         apsh4a3a_defconfig
mips                malta_qemu_32r6_defconfig
m68k                       bvme6000_defconfig
arm                        cerfcube_defconfig
h8300                    h8300h-sim_defconfig
mips                           gcw0_defconfig
m68k                             alldefconfig
mips                      malta_kvm_defconfig
arm                              zx_defconfig
mips                         cobalt_defconfig
sh                        dreamcast_defconfig
powerpc                 mpc85xx_cds_defconfig
parisc                              defconfig
s390                             allyesconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
c6x                              allyesconfig
nios2                               defconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
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
i386                 randconfig-a001-20201215
i386                 randconfig-a004-20201215
i386                 randconfig-a003-20201215
i386                 randconfig-a002-20201215
i386                 randconfig-a006-20201215
i386                 randconfig-a005-20201215
i386                 randconfig-a014-20201215
i386                 randconfig-a013-20201215
i386                 randconfig-a012-20201215
i386                 randconfig-a011-20201215
i386                 randconfig-a015-20201215
i386                 randconfig-a016-20201215
x86_64               randconfig-a006-20201215
x86_64               randconfig-a005-20201215
x86_64               randconfig-a003-20201215
x86_64               randconfig-a002-20201215
x86_64               randconfig-a004-20201215
x86_64               randconfig-a001-20201215
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                      rhel-8.3-kbuiltin
x86_64                               rhel-8.3
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20201215
x86_64               randconfig-a013-20201215
x86_64               randconfig-a014-20201215
x86_64               randconfig-a011-20201215
x86_64               randconfig-a016-20201215
x86_64               randconfig-a015-20201215

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
