Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEE5346576
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 17:39:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233135AbhCWQii (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Mar 2021 12:38:38 -0400
Received: from mga05.intel.com ([192.55.52.43]:36391 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233256AbhCWQiK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Mar 2021 12:38:10 -0400
IronPort-SDR: NT2jRtgIT8dz+KPqj50Ko9apoc0DStnuxLY96KPyXo9rH3t7Ku8xQHyZEyoWHcWQp0IP4WRpqK
 II3rKxr0fv0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="275614375"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; 
   d="scan'208";a="275614375"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 09:38:10 -0700
IronPort-SDR: 9vy+ZqgIuH3aMMitgawkWGrQp9lKIfOOW5RI8R+fcS8sMqeMb2hc1b35iuTG8fLxQjCEUQHlpz
 r4ckZnmonZpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; 
   d="scan'208";a="435619034"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 23 Mar 2021 09:38:08 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lOk2h-0000hu-64; Tue, 23 Mar 2021 16:38:07 +0000
Date:   Wed, 24 Mar 2021 00:37:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 ac1e4ca591c0c1369387e5155aac4071b9cdc1ca
Message-ID: <605a1954.b6qXX5tnJ4NwJEwq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: ac1e4ca591c0c1369387e5155aac4071b9cdc1ca  Input: cyttsp - verbose error on soft reset

elapsed time: 722m

configs tested: 120
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
xtensa                         virt_defconfig
powerpc                 mpc837x_mds_defconfig
arm                        neponset_defconfig
arm                          pxa168_defconfig
xtensa                  nommu_kc705_defconfig
csky                                defconfig
powerpc                       maple_defconfig
powerpc                   lite5200b_defconfig
sparc                            alldefconfig
mips                    maltaup_xpa_defconfig
m68k                          hp300_defconfig
sh                           se7206_defconfig
um                           x86_64_defconfig
powerpc                       ebony_defconfig
sparc                               defconfig
mips                      bmips_stb_defconfig
powerpc                      chrp32_defconfig
powerpc                      arches_defconfig
arm                      footbridge_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                malta_kvm_guest_defconfig
arc                     haps_hs_smp_defconfig
powerpc                     sequoia_defconfig
mips                       rbtx49xx_defconfig
powerpc                   bluestone_defconfig
xtensa                    xip_kc705_defconfig
arm                      tct_hammer_defconfig
sh                           se7751_defconfig
powerpc                      makalu_defconfig
arc                           tb10x_defconfig
powerpc                     mpc83xx_defconfig
xtensa                       common_defconfig
mips                      loongson3_defconfig
powerpc                      pmac32_defconfig
mips                           ip28_defconfig
powerpc                      obs600_defconfig
m68k                        mvme16x_defconfig
arm                         orion5x_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                 linkstation_defconfig
powerpc                     rainier_defconfig
mips                        maltaup_defconfig
arm                          collie_defconfig
powerpc                  mpc866_ads_defconfig
arm                       mainstone_defconfig
sh                             sh03_defconfig
m68k                          multi_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
sh                               allmodconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                             allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210323
x86_64               randconfig-a004-20210323
x86_64               randconfig-a005-20210323
x86_64               randconfig-a002-20210323
x86_64               randconfig-a006-20210323
x86_64               randconfig-a001-20210323
i386                 randconfig-a003-20210323
i386                 randconfig-a004-20210323
i386                 randconfig-a001-20210323
i386                 randconfig-a002-20210323
i386                 randconfig-a006-20210323
i386                 randconfig-a005-20210323
i386                 randconfig-a014-20210323
i386                 randconfig-a011-20210323
i386                 randconfig-a015-20210323
i386                 randconfig-a016-20210323
i386                 randconfig-a012-20210323
i386                 randconfig-a013-20210323
riscv                             allnoconfig
riscv                               defconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20210323
x86_64               randconfig-a015-20210323
x86_64               randconfig-a013-20210323
x86_64               randconfig-a014-20210323
x86_64               randconfig-a011-20210323
x86_64               randconfig-a016-20210323

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
