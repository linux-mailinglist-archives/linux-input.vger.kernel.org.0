Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2813206DC
	for <lists+linux-input@lfdr.de>; Sat, 20 Feb 2021 20:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhBTTTd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 14:19:33 -0500
Received: from mga09.intel.com ([134.134.136.24]:40784 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229871AbhBTTTb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 14:19:31 -0500
IronPort-SDR: 7u+6BFj9hkqoyVfamDWnCwm0LIA3onAprn2bYYFAC8orV0I+BrvkRZtVStDSsWJIcycIQQbL3R
 6x4r8CCNpO4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9901"; a="184233641"
X-IronPort-AV: E=Sophos;i="5.81,193,1610438400"; 
   d="scan'208";a="184233641"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2021 11:18:50 -0800
IronPort-SDR: 6dHJKhaDG3weMp86QT9BScw0hZmIZVpnhCuvFvcVmXHl5ozFVA+LRYHvI7R1vdukMzvhqyBUDa
 9p4TYMlnIh+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,193,1610438400"; 
   d="scan'208";a="440749843"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 20 Feb 2021 11:18:49 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lDXmC-000BE6-PS; Sat, 20 Feb 2021 19:18:48 +0000
Date:   Sun, 21 Feb 2021 03:18:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 e64123949e6c9581c97fc14594f1cf34bf1d87a8
Message-ID: <6031607a.s58oinqtCXxJifwg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: e64123949e6c9581c97fc14594f1cf34bf1d87a8  Input: applespi - fix occasional crc errors under load.

elapsed time: 725m

configs tested: 131
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                           sama5_defconfig
powerpc                 mpc832x_mds_defconfig
arm                           spitz_defconfig
mips                          ath79_defconfig
powerpc                      makalu_defconfig
arm                      tct_hammer_defconfig
arm                        mvebu_v5_defconfig
powerpc                        fsp2_defconfig
arm                             ezx_defconfig
sh                          landisk_defconfig
powerpc                     tqm5200_defconfig
xtensa                       common_defconfig
h8300                               defconfig
sh                           se7619_defconfig
powerpc                 mpc834x_mds_defconfig
arm                        spear6xx_defconfig
parisc                generic-32bit_defconfig
arm                            hisi_defconfig
sparc64                          alldefconfig
h8300                       h8s-sim_defconfig
mips                         tb0219_defconfig
arm                          badge4_defconfig
mips                 decstation_r4k_defconfig
arm                          lpd270_defconfig
i386                             allyesconfig
arc                        vdk_hs38_defconfig
mips                           mtx1_defconfig
arm                            dove_defconfig
sh                          rsk7201_defconfig
powerpc                    amigaone_defconfig
sh                          sdk7786_defconfig
sh                        dreamcast_defconfig
mips                         db1xxx_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                 canyonlands_defconfig
arm                            zeus_defconfig
powerpc                      pcm030_defconfig
riscv                            alldefconfig
mips                        qi_lb60_defconfig
powerpc                        cell_defconfig
arm                           u8500_defconfig
arm                         assabet_defconfig
c6x                        evmc6472_defconfig
xtensa                           alldefconfig
microblaze                          defconfig
sh                           se7705_defconfig
mips                     cu1830-neo_defconfig
arm                       imx_v6_v7_defconfig
powerpc                     pseries_defconfig
arm                        multi_v7_defconfig
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20210220
x86_64               randconfig-a006-20210220
x86_64               randconfig-a004-20210220
i386                 randconfig-a005-20210220
i386                 randconfig-a006-20210220
i386                 randconfig-a004-20210220
i386                 randconfig-a003-20210220
i386                 randconfig-a001-20210220
i386                 randconfig-a002-20210220
x86_64               randconfig-a001-20210220
x86_64               randconfig-a002-20210220
x86_64               randconfig-a003-20210220
i386                 randconfig-a013-20210220
i386                 randconfig-a012-20210220
i386                 randconfig-a011-20210220
i386                 randconfig-a014-20210220
i386                 randconfig-a016-20210220
i386                 randconfig-a015-20210220
i386                 randconfig-a016-20210219
i386                 randconfig-a012-20210219
i386                 randconfig-a014-20210219
i386                 randconfig-a013-20210219
i386                 randconfig-a011-20210219
i386                 randconfig-a015-20210219
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin

clang tested configs:
x86_64               randconfig-a015-20210220
x86_64               randconfig-a016-20210220
x86_64               randconfig-a014-20210220
x86_64               randconfig-a011-20210220
x86_64               randconfig-a012-20210220
x86_64               randconfig-a013-20210220

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
