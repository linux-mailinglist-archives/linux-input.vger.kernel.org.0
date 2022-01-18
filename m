Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB36D492D9E
	for <lists+linux-input@lfdr.de>; Tue, 18 Jan 2022 19:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239612AbiARSnH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Jan 2022 13:43:07 -0500
Received: from mga02.intel.com ([134.134.136.20]:40314 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232540AbiARSnG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Jan 2022 13:43:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642531386; x=1674067386;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WI+3eL+7V0qTqayaD6JxQ2BWkbKBKG9WMeFd49mZHQE=;
  b=ap7CuBDukbqT0/Iwz69C6HdzNmPFcSUW166TdCRJ0cNG/+gyW/kJ/1Xw
   EP5/+gfrubP8bGLJQM4vE+DPsqg4ssLBeO0ijE0Mo9nvJ8oJTiW9WTAWe
   5vhB45LVKyuyONiNMdJEdMC8MwbBRMYTcdVCskf4EANByuVYSclR7ea3y
   c6zLwGQsCNAwkrEQFX/9SKCaT9fkWPZRPLvos/bezk2ShxiiGEcOw0QnX
   suDX/FlWcTNETAlx7LhDnxYKzlsgA/Ph1D2UZw/zdiz9d0Q6TfIH+eG3v
   t+qoEF9K0fgZgQJ4HuNDbkIVUqLD0EA6ukqfBu1lBtmMJY49Z6z9T8Nfe
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="232247234"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; 
   d="scan'208";a="232247234"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2022 10:43:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; 
   d="scan'208";a="474856835"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Jan 2022 10:43:04 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n9tRg-000Cqf-8Z; Tue, 18 Jan 2022 18:43:04 +0000
Date:   Wed, 19 Jan 2022 02:42:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:master] BUILD SUCCESS
 87a0b2fafc09766d8c55461a18345a1cfb10a7fe
Message-ID: <61e70a00.5fTBuaFMC7ZgdrsP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: 87a0b2fafc09766d8c55461a18345a1cfb10a7fe  Merge tag 'v5.16' into next

elapsed time: 720m

configs tested: 139
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
arm64                               defconfig
powerpc              randconfig-c003-20220118
i386                 randconfig-c001-20220117
arm64                            alldefconfig
arm                      integrator_defconfig
powerpc                     redwood_defconfig
powerpc                     tqm8548_defconfig
arm                        oxnas_v6_defconfig
xtensa                    xip_kc705_defconfig
powerpc                      pasemi_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                          sdk7786_defconfig
arm                           tegra_defconfig
sh                           se7722_defconfig
arm                        mini2440_defconfig
arc                        nsimosci_defconfig
powerpc                  iss476-smp_defconfig
arm                      jornada720_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                           corgi_defconfig
mips                  decstation_64_defconfig
sh                              ul2_defconfig
arm                        spear6xx_defconfig
arm                             pxa_defconfig
m68k                       m5208evb_defconfig
arm                  randconfig-c002-20220117
arm                  randconfig-c002-20220118
arm                  randconfig-c002-20220116
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
sparc                               defconfig
sparc                            allyesconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a012-20220117
x86_64               randconfig-a013-20220117
x86_64               randconfig-a011-20220117
x86_64               randconfig-a014-20220117
x86_64               randconfig-a015-20220117
x86_64               randconfig-a016-20220117
i386                 randconfig-a014-20220117
i386                 randconfig-a011-20220117
i386                 randconfig-a013-20220117
i386                 randconfig-a012-20220117
i386                 randconfig-a015-20220117
i386                 randconfig-a016-20220117
riscv                randconfig-r042-20220117
arc                  randconfig-r043-20220116
arc                  randconfig-r043-20220117
s390                 randconfig-r044-20220117
arc                  randconfig-r043-20220118
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                              defconfig
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                               rhel-8.3

clang tested configs:
riscv                randconfig-c006-20220118
riscv                randconfig-c006-20220116
powerpc              randconfig-c003-20220116
powerpc              randconfig-c003-20220118
mips                 randconfig-c004-20220118
mips                 randconfig-c004-20220116
s390                 randconfig-c005-20220116
x86_64                        randconfig-c007
i386                          randconfig-c001
s390                 randconfig-c005-20220118
arm                  randconfig-c002-20220116
arm                  randconfig-c002-20220118
mips                      bmips_stb_defconfig
powerpc                     skiroot_defconfig
arm                         lpc32xx_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                    socrates_defconfig
riscv                             allnoconfig
mips                       lemote2f_defconfig
powerpc                    gamecube_defconfig
arm                  colibri_pxa300_defconfig
powerpc                     pseries_defconfig
i386                             allyesconfig
powerpc                      walnut_defconfig
x86_64               randconfig-a001-20220117
x86_64               randconfig-a002-20220117
x86_64               randconfig-a003-20220117
x86_64               randconfig-a004-20220117
i386                 randconfig-a002-20220117
i386                 randconfig-a003-20220117
i386                 randconfig-a001-20220117
i386                 randconfig-a004-20220117
i386                 randconfig-a006-20220117
i386                 randconfig-a005-20220117
riscv                randconfig-r042-20220118
hexagon              randconfig-r045-20220117
riscv                randconfig-r042-20220116
hexagon              randconfig-r041-20220118
s390                 randconfig-r044-20220118
s390                 randconfig-r044-20220116
hexagon              randconfig-r041-20220116
hexagon              randconfig-r041-20220117
hexagon              randconfig-r045-20220116
hexagon              randconfig-r045-20220118
x86_64               randconfig-a006-20220117
x86_64               randconfig-a005-20220117

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
