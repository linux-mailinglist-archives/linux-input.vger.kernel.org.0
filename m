Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C094F3D14FE
	for <lists+linux-input@lfdr.de>; Wed, 21 Jul 2021 19:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbhGUQjo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Jul 2021 12:39:44 -0400
Received: from mga18.intel.com ([134.134.136.126]:51167 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229943AbhGUQjo (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Jul 2021 12:39:44 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="198752336"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; 
   d="scan'208";a="198752336"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2021 10:20:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; 
   d="scan'208";a="662187375"
Received: from lkp-server01.sh.intel.com (HELO b8b92b2878b0) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Jul 2021 10:20:07 -0700
Received: from kbuild by b8b92b2878b0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m6Ft8-0000V5-GV; Wed, 21 Jul 2021 17:20:06 +0000
Date:   Thu, 22 Jul 2021 01:19:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 7d3370e506ec5cd781ef6b938cf29c046eb77585
Message-ID: <60f8571f.oOakNDFyXoNpDH1h%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: 7d3370e506ec5cd781ef6b938cf29c046eb77585  Revert "Input: serio - make write method mandatory"

elapsed time: 721m

configs tested: 109
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
s390                       zfcpdump_defconfig
arm                          ep93xx_defconfig
mips                      maltasmvp_defconfig
m68k                       m5208evb_defconfig
arm                           sama5_defconfig
mips                       rbtx49xx_defconfig
mips                          ath25_defconfig
sh                          rsk7269_defconfig
parisc                generic-64bit_defconfig
arm                           stm32_defconfig
arm                         vf610m4_defconfig
x86_64                            allnoconfig
arm                        multi_v5_defconfig
mips                     loongson2k_defconfig
sh                        edosk7760_defconfig
m68k                          sun3x_defconfig
mips                    maltaup_xpa_defconfig
powerpc                      ppc40x_defconfig
powerpc                     tqm8560_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nds32                               defconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
parisc                              defconfig
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
x86_64               randconfig-a003-20210720
x86_64               randconfig-a001-20210720
x86_64               randconfig-a002-20210720
x86_64               randconfig-a006-20210720
x86_64               randconfig-a005-20210720
x86_64               randconfig-a004-20210720
i386                 randconfig-a005-20210720
i386                 randconfig-a003-20210720
i386                 randconfig-a004-20210720
i386                 randconfig-a002-20210720
i386                 randconfig-a001-20210720
i386                 randconfig-a006-20210720
i386                 randconfig-a005-20210719
i386                 randconfig-a004-20210719
i386                 randconfig-a006-20210719
i386                 randconfig-a001-20210719
i386                 randconfig-a003-20210719
i386                 randconfig-a002-20210719
i386                 randconfig-a005-20210721
i386                 randconfig-a003-20210721
i386                 randconfig-a004-20210721
i386                 randconfig-a002-20210721
i386                 randconfig-a001-20210721
i386                 randconfig-a006-20210721
x86_64               randconfig-a011-20210721
x86_64               randconfig-a016-20210721
x86_64               randconfig-a013-20210721
x86_64               randconfig-a014-20210721
x86_64               randconfig-a012-20210721
x86_64               randconfig-a015-20210721
i386                 randconfig-a016-20210720
i386                 randconfig-a013-20210720
i386                 randconfig-a012-20210720
i386                 randconfig-a014-20210720
i386                 randconfig-a011-20210720
i386                 randconfig-a015-20210720
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210720

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
