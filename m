Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4428648C69E
	for <lists+linux-input@lfdr.de>; Wed, 12 Jan 2022 15:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354393AbiALO7D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jan 2022 09:59:03 -0500
Received: from mga02.intel.com ([134.134.136.20]:38196 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347865AbiALO7B (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jan 2022 09:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641999541; x=1673535541;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=o1rC3dFK4swC/JOsc9a4qZwcic+oLc451oVMJ3hErb8=;
  b=BFGGxbOwL/iUn6TYjo6Pxr7GZqtYm/BGw/PnO2WPK/Z3+m0saosPSvNz
   lHY5nC2B3PtAxUGpJfSUbhw3r3QFE0te02WmyuB36H9+1oLVUYDXAkVSV
   znMy/mNa9589IbD2fKvm4gAdXP3mgX2ogtiRfteNA9HrNPYgeDYt74/oc
   H7+hR+z/4jnmutcXkyUmx57Ew8yTpV4H4j/rK8BS0BVDffMLyfPhHr+qI
   X3+KNRbn2CUfK1casCpt4dm0u51dQvNL3zgAoudz5i6A0w6TQL0IaHobV
   +2Rkhc0x/QvnioL1xDQ6Rls8e1KzJHCjv5PiNYYBsAns6KIoGQdGymjZV
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="231092196"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="231092196"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 06:58:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="474930102"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Jan 2022 06:58:54 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n7f5R-0005y3-SQ; Wed, 12 Jan 2022 14:58:53 +0000
Date:   Wed, 12 Jan 2022 22:58:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 9df136b555221e8eb3f4e5d3958d8fe11783abcf
Message-ID: <61deec8a.nSWeTZLFbG6KlzVf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 9df136b555221e8eb3f4e5d3958d8fe11783abcf  Input: zinitix - add compatible for bt532

elapsed time: 4695m

configs tested: 125
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
i386                          randconfig-c001
arm                            zeus_defconfig
mips                         db1xxx_defconfig
m68k                        m5272c3_defconfig
nios2                         10m50_defconfig
m68k                             alldefconfig
powerpc                 mpc8540_ads_defconfig
um                                  defconfig
nds32                            alldefconfig
arc                          axs101_defconfig
arc                     nsimosci_hs_defconfig
arm                     eseries_pxa_defconfig
arm                            xcep_defconfig
arm                           tegra_defconfig
arm                         lpc18xx_defconfig
riscv             nommu_k210_sdcard_defconfig
x86_64                           alldefconfig
sh                        sh7757lcr_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                      cm5200_defconfig
sh                                  defconfig
powerpc                       ppc64_defconfig
sh                      rts7751r2d1_defconfig
powerpc                      chrp32_defconfig
m68k                            q40_defconfig
sh                         ecovec24_defconfig
arm                  randconfig-c002-20220109
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a006-20220109
i386                 randconfig-a003-20220109
i386                 randconfig-a005-20220109
i386                 randconfig-a004-20220109
i386                 randconfig-a001-20220109
i386                 randconfig-a002-20220109
i386                 randconfig-a006-20220109
x86_64               randconfig-a001-20220109
x86_64               randconfig-a004-20220109
x86_64               randconfig-a003-20220109
x86_64               randconfig-a002-20220109
x86_64               randconfig-a005-20220109
arc                  randconfig-r043-20220109
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                              defconfig
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                               rhel-8.3

clang tested configs:
arm                  randconfig-c002-20220109
mips                 randconfig-c004-20220109
i386                 randconfig-c001-20220109
powerpc              randconfig-c003-20220109
x86_64               randconfig-c007-20220109
s390                 randconfig-c005-20220109
riscv                randconfig-c006-20220109
powerpc                 mpc832x_rdb_defconfig
mips                     loongson1c_defconfig
powerpc                   bluestone_defconfig
arm                         shannon_defconfig
powerpc                     ppa8548_defconfig
mips                      maltaaprp_defconfig
arm                            mmp2_defconfig
arm                       versatile_defconfig
arm                         mv78xx0_defconfig
x86_64               randconfig-a012-20220109
x86_64               randconfig-a014-20220109
x86_64               randconfig-a013-20220109
x86_64               randconfig-a011-20220109
x86_64               randconfig-a015-20220109
x86_64               randconfig-a016-20220109
i386                 randconfig-a012-20220109
i386                 randconfig-a015-20220109
i386                 randconfig-a011-20220109
i386                 randconfig-a013-20220109
i386                 randconfig-a016-20220109
i386                 randconfig-a014-20220109
s390                 randconfig-r044-20220109
hexagon              randconfig-r041-20220109
riscv                randconfig-r042-20220109
hexagon              randconfig-r045-20220109

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
