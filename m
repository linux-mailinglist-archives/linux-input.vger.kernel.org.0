Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79EFE48FDE4
	for <lists+linux-input@lfdr.de>; Sun, 16 Jan 2022 17:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232907AbiAPQdG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Jan 2022 11:33:06 -0500
Received: from mga12.intel.com ([192.55.52.136]:57938 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231292AbiAPQdE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Jan 2022 11:33:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642350784; x=1673886784;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/TDXWTpoLXABI8m0DYpLQyZrX1qLqopQSkltYsTR4GU=;
  b=eAl8i5n/lieXtRZCA5zUekFZGlR9sIz0np+eMnKRD4EQoen0FceBfTlQ
   mxyNXBSk62GHFhGQaJhwRvCRWBZMXE3qyRGJjQJUlEG7hH43UnxKKyFR9
   lxKnJUjglqmL1Zxbs6maQ2+ml6fzUBgt/5nCt+cfpyWtbK/fyJg82kfiq
   jV5YcHve5fnPWX2ikXX28uINzNludbNhxa7dNjwQ/tfmrz5sibN3ZUjGj
   XqokS2JGcQH/54iqwUDao2tQ+PLr/Bs/1FFI6jMgltxUxwDdb0XpJnhL3
   bIxKAM21pQ5ZTqXyjUTHkNbxK945/EJLoUPJd+Y/2OMbE7hVLW9J0oYRT
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10228"; a="224480745"
X-IronPort-AV: E=Sophos;i="5.88,293,1635231600"; 
   d="scan'208";a="224480745"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2022 08:33:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,293,1635231600"; 
   d="scan'208";a="560127576"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Jan 2022 08:33:02 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n98Sj-000Apy-Nx; Sun, 16 Jan 2022 16:33:01 +0000
Date:   Mon, 17 Jan 2022 00:32:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 b6e43dddaea3dbfa93327f986beb3ec5e8157c4c
Message-ID: <61e448b0.tJP++Q6ZSus5nNaI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: b6e43dddaea3dbfa93327f986beb3ec5e8157c4c  Input: ti_am335x_tsc - fix a typo in a comment

elapsed time: 1114m

configs tested: 136
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
arm64                            alldefconfig
arm                          pxa910_defconfig
m68k                        stmark2_defconfig
openrisc                  or1klitex_defconfig
powerpc                      bamboo_defconfig
arm                          exynos_defconfig
powerpc                      ppc6xx_defconfig
riscv             nommu_k210_sdcard_defconfig
h8300                            alldefconfig
m68k                        mvme16x_defconfig
mips                           ci20_defconfig
arc                     haps_hs_smp_defconfig
sh                          urquell_defconfig
arm                       omap2plus_defconfig
powerpc                 mpc8540_ads_defconfig
arm                         s3c6400_defconfig
sh                         apsh4a3a_defconfig
sh                              ul2_defconfig
mips                         bigsur_defconfig
parisc                generic-32bit_defconfig
xtensa                  audio_kc705_defconfig
powerpc                     stx_gp3_defconfig
m68k                          multi_defconfig
arm                           h3600_defconfig
powerpc                     tqm8541_defconfig
sh                          rsk7269_defconfig
xtensa                           alldefconfig
sh                           se7780_defconfig
powerpc                     asp8347_defconfig
arc                           tb10x_defconfig
sh                           sh2007_defconfig
arm                        oxnas_v6_defconfig
arm                  randconfig-c002-20220116
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
csky                                defconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
h8300                            allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                                defconfig
sparc                               defconfig
sparc                            allyesconfig
i386                              debian-10.3
i386                             allyesconfig
i386                   debian-10.3-kselftests
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a005
i386                          randconfig-a003
x86_64                        randconfig-a015
x86_64                        randconfig-a011
x86_64                        randconfig-a013
i386                          randconfig-a014
i386                          randconfig-a016
i386                          randconfig-a012
arc                  randconfig-r043-20220116
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests

clang tested configs:
arm                  randconfig-c002-20220116
x86_64                        randconfig-c007
i386                          randconfig-c001
mips                 randconfig-c004-20220116
riscv                randconfig-c006-20220116
powerpc              randconfig-c003-20220116
s390                 randconfig-c005-20220116
arm                         s3c2410_defconfig
powerpc                     ksi8560_defconfig
powerpc                      ppc44x_defconfig
arm                      tct_hammer_defconfig
mips                          ath79_defconfig
powerpc                 mpc8272_ads_defconfig
arm64                            allyesconfig
arm                           sama7_defconfig
powerpc                          allmodconfig
powerpc                     mpc512x_defconfig
mips                        workpad_defconfig
mips                      bmips_stb_defconfig
arm                         palmz72_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                           omap1_defconfig
arm                    vt8500_v6_v7_defconfig
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a015
i386                          randconfig-a011
i386                          randconfig-a013
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220116
riscv                randconfig-r042-20220116
s390                 randconfig-r044-20220116
hexagon              randconfig-r041-20220116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
