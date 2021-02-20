Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B06F53206D1
	for <lists+linux-input@lfdr.de>; Sat, 20 Feb 2021 20:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbhBTTNf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 14:13:35 -0500
Received: from mga05.intel.com ([192.55.52.43]:13655 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229809AbhBTTNd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 14:13:33 -0500
IronPort-SDR: K2M1Mii5YLw0R3vlT8ShLSJQPxym7XAQ0ScZIwiAZgaN9RQ2SR6818RGG/idPfTW6SwFf6tswm
 22N49Fq//3MA==
X-IronPort-AV: E=McAfee;i="6000,8403,9901"; a="269012995"
X-IronPort-AV: E=Sophos;i="5.81,193,1610438400"; 
   d="scan'208";a="269012995"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2021 11:12:49 -0800
IronPort-SDR: rAPZe34W5ilKdlc0y8LkkK5e5zKGOLW6GKj5SXpBtNNJuBo14GYDB0WKhUAK/ktfY4coOjXhzb
 /1g6kraApVbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,193,1610438400"; 
   d="scan'208";a="402429646"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 20 Feb 2021 11:12:48 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lDXgN-000BDu-E6; Sat, 20 Feb 2021 19:12:47 +0000
Date:   Sun, 21 Feb 2021 03:12:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 6524d8eac258452e547f8a49c8a965ac6dd8a161
Message-ID: <60315f21.46SNxS8Pq/qABUIP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 6524d8eac258452e547f8a49c8a965ac6dd8a161  Input: st1232 - add IDLE state as ready condition

elapsed time: 723m

configs tested: 117
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
xtensa                         virt_defconfig
sh                                  defconfig
nios2                            alldefconfig
xtensa                    smp_lx200_defconfig
m68k                        stmark2_defconfig
arm                           sama5_defconfig
powerpc                 mpc832x_mds_defconfig
arm                           spitz_defconfig
mips                          ath79_defconfig
powerpc                      makalu_defconfig
sh                          landisk_defconfig
powerpc                     tqm5200_defconfig
xtensa                       common_defconfig
h8300                               defconfig
sh                           se7619_defconfig
powerpc                 mpc834x_mds_defconfig
h8300                       h8s-sim_defconfig
mips                         tb0219_defconfig
arm                          badge4_defconfig
mips                 decstation_r4k_defconfig
arm                          lpd270_defconfig
powerpc                      tqm8xx_defconfig
sh                             sh03_defconfig
ia64                                defconfig
powerpc                      arches_defconfig
arm                          tango4_defconfig
i386                             allyesconfig
arc                        vdk_hs38_defconfig
mips                           mtx1_defconfig
arm                            dove_defconfig
sh                          rsk7201_defconfig
sh                           se7705_defconfig
mips                     cu1830-neo_defconfig
arm                       imx_v6_v7_defconfig
arm                        mvebu_v5_defconfig
powerpc                     pseries_defconfig
arm                        multi_v7_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
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
i386                 randconfig-a005-20210220
i386                 randconfig-a006-20210220
i386                 randconfig-a004-20210220
i386                 randconfig-a003-20210220
i386                 randconfig-a001-20210220
i386                 randconfig-a002-20210220
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
x86_64               randconfig-a001-20210220
x86_64               randconfig-a002-20210220
x86_64               randconfig-a003-20210220
x86_64               randconfig-a005-20210220
x86_64               randconfig-a006-20210220
x86_64               randconfig-a004-20210220
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
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
x86_64               randconfig-a015-20210220
x86_64               randconfig-a011-20210220
x86_64               randconfig-a012-20210220
x86_64               randconfig-a016-20210220
x86_64               randconfig-a014-20210220
x86_64               randconfig-a013-20210220

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
