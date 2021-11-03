Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE00D4446AF
	for <lists+linux-input@lfdr.de>; Wed,  3 Nov 2021 18:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhKCRMI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Nov 2021 13:12:08 -0400
Received: from mga05.intel.com ([192.55.52.43]:32466 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229698AbhKCRMI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 3 Nov 2021 13:12:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="317755450"
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; 
   d="scan'208";a="317755450"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2021 10:09:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; 
   d="scan'208";a="489641920"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 03 Nov 2021 10:09:25 -0700
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1miJlM-0005j0-U4; Wed, 03 Nov 2021 17:09:24 +0000
Date:   Thu, 04 Nov 2021 01:08:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 5fe11512cdc24ccc66ac5da3c815ac9e59449abc
Message-ID: <6182c225.oE7svWTHPbGxYY3/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 5fe11512cdc24ccc66ac5da3c815ac9e59449abc  Input: remove unused header <linux/input/cy8ctmg110_pdata.h>

elapsed time: 925m

configs tested: 132
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211103
m68k                        m5307c3_defconfig
arc                      axs103_smp_defconfig
arm                        spear6xx_defconfig
i386                                defconfig
powerpc                    sam440ep_defconfig
m68k                          hp300_defconfig
m68k                            q40_defconfig
mips                         bigsur_defconfig
s390                                defconfig
arm                         lpc18xx_defconfig
sh                         ecovec24_defconfig
mips                       lemote2f_defconfig
sh                          lboxre2_defconfig
mips                         rt305x_defconfig
powerpc                     pq2fads_defconfig
sh                          rsk7264_defconfig
m68k                       m5249evb_defconfig
sh                               j2_defconfig
powerpc                         wii_defconfig
arm                          badge4_defconfig
mips                      maltaaprp_defconfig
mips                         tb0219_defconfig
h8300                               defconfig
sh                           se7619_defconfig
arm                            mps2_defconfig
sh                          kfr2r09_defconfig
powerpc                      obs600_defconfig
mips                     loongson1b_defconfig
powerpc                  storcenter_defconfig
arm                     eseries_pxa_defconfig
arm                       imx_v6_v7_defconfig
riscv                    nommu_virt_defconfig
h8300                    h8300h-sim_defconfig
h8300                     edosk2674_defconfig
sh                          r7780mp_defconfig
powerpc                     tqm8548_defconfig
sh                             shx3_defconfig
arc                          axs101_defconfig
mips                      maltasmvp_defconfig
arc                     haps_hs_smp_defconfig
arm                         s3c6400_defconfig
openrisc                 simple_smp_defconfig
arm                         hackkit_defconfig
sh                          sdk7780_defconfig
powerpc                      arches_defconfig
powerpc                       ppc64_defconfig
arm                            xcep_defconfig
x86_64                              defconfig
m68k                            mac_defconfig
powerpc                 mpc837x_mds_defconfig
arm                  randconfig-c002-20211103
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
i386                              debian-10.3
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a012-20211103
x86_64               randconfig-a015-20211103
x86_64               randconfig-a016-20211103
x86_64               randconfig-a011-20211103
x86_64               randconfig-a013-20211103
x86_64               randconfig-a014-20211103
i386                 randconfig-a014-20211103
i386                 randconfig-a016-20211103
i386                 randconfig-a013-20211103
i386                 randconfig-a015-20211103
i386                 randconfig-a011-20211103
i386                 randconfig-a012-20211103
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
mips                 randconfig-c004-20211103
arm                  randconfig-c002-20211103
i386                 randconfig-c001-20211103
s390                 randconfig-c005-20211103
powerpc              randconfig-c003-20211103
riscv                randconfig-c006-20211103
x86_64               randconfig-c007-20211103
i386                 randconfig-a005-20211103
i386                 randconfig-a003-20211103
i386                 randconfig-a001-20211103
i386                 randconfig-a004-20211103
i386                 randconfig-a006-20211103
i386                 randconfig-a002-20211103
x86_64               randconfig-a006-20211103
x86_64               randconfig-a004-20211103
x86_64               randconfig-a001-20211103
x86_64               randconfig-a002-20211103
x86_64               randconfig-a005-20211103
x86_64               randconfig-a003-20211103
hexagon              randconfig-r041-20211103
hexagon              randconfig-r045-20211103

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
