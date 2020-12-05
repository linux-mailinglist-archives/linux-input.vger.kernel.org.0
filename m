Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A44B2CFAA7
	for <lists+linux-input@lfdr.de>; Sat,  5 Dec 2020 09:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgLEIlg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Dec 2020 03:41:36 -0500
Received: from mga04.intel.com ([192.55.52.120]:34749 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727762AbgLEIlR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 5 Dec 2020 03:41:17 -0500
IronPort-SDR: x0K+F+33AKs/n+em3CHB0MesQNnZEqj9VkEHM3RrdTIV14ZuBJwm5jXRIdwmu+mNpe9lziinoA
 boKGoxDdIcAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9825"; a="170931843"
X-IronPort-AV: E=Sophos;i="5.78,395,1599548400"; 
   d="scan'208";a="170931843"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2020 00:40:32 -0800
IronPort-SDR: wMIIRfPbOKb98qAuhUokIh4Qjtq6w+Hj4JKzy2qHVRhPeS5JXzbMjhwJipaEifcaCTZFM8EjXs
 3CTAsOh0ZMHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,395,1599548400"; 
   d="scan'208";a="369141677"
Received: from lkp-server01.sh.intel.com (HELO 47754f1311fc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2020 00:40:31 -0800
Received: from kbuild by 47754f1311fc with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1klT7H-0000Dl-1V; Sat, 05 Dec 2020 08:40:31 +0000
Date:   Sat, 05 Dec 2020 16:40:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS WITH WARNING
 7ce8d91b8a849c4b9a010a8b773e3838a8e3d030
Message-ID: <5fcb4767.uP2kX1OBwsj/0qYM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  master
branch HEAD: 7ce8d91b8a849c4b9a010a8b773e3838a8e3d030  Input: vsxxxaa - fix Kconfig spelling mistake

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- sparc-randconfig-c003-20201204
    `-- drivers-input-input.c:Unneeded-variable:ret-Return-on-line

elapsed time: 720m

configs tested: 158
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nios2                            alldefconfig
arc                        vdk_hs38_defconfig
powerpc                      cm5200_defconfig
arm                          tango4_defconfig
mips                 decstation_r4k_defconfig
powerpc                     tqm8555_defconfig
s390                                defconfig
sh                           se7721_defconfig
m68k                          amiga_defconfig
sh                          r7785rp_defconfig
sh                         microdev_defconfig
m68k                       m5275evb_defconfig
arm                        shmobile_defconfig
um                           x86_64_defconfig
ia64                          tiger_defconfig
arm                         mv78xx0_defconfig
ia64                            zx1_defconfig
arm                         lpc18xx_defconfig
powerpc                     tqm5200_defconfig
sh                            titan_defconfig
mips                         tb0226_defconfig
mips                             allyesconfig
powerpc                      ep88xc_defconfig
arm                         bcm2835_defconfig
powerpc                      acadia_defconfig
arm                         assabet_defconfig
powerpc                     skiroot_defconfig
arm                          pcm027_defconfig
arm                           u8500_defconfig
powerpc                      ppc6xx_defconfig
arm                         vf610m4_defconfig
powerpc                   motionpro_defconfig
nds32                               defconfig
mips                           jazz_defconfig
powerpc                        cell_defconfig
ia64                             alldefconfig
arc                         haps_hs_defconfig
arm                           spitz_defconfig
arm                          exynos_defconfig
powerpc                     redwood_defconfig
powerpc                          g5_defconfig
powerpc                         wii_defconfig
powerpc                 mpc836x_mds_defconfig
arm                      jornada720_defconfig
arm                          pxa3xx_defconfig
openrisc                         alldefconfig
powerpc                      mgcoge_defconfig
arm                         s3c2410_defconfig
openrisc                    or1ksim_defconfig
powerpc                    amigaone_defconfig
powerpc               mpc834x_itxgp_defconfig
sparc                               defconfig
arm                        spear3xx_defconfig
arm                         at91_dt_defconfig
powerpc                       ebony_defconfig
powerpc                 mpc8272_ads_defconfig
sh                             espt_defconfig
arm                        multi_v5_defconfig
arm                         nhk8815_defconfig
arm                           sama5_defconfig
powerpc                 mpc8560_ads_defconfig
ia64                        generic_defconfig
arm                           omap1_defconfig
arm                        mini2440_defconfig
m68k                            q40_defconfig
sparc64                             defconfig
m68k                        m5307c3_defconfig
arm                      tct_hammer_defconfig
m68k                       bvme6000_defconfig
arm                        keystone_defconfig
s390                          debug_defconfig
arm                      pxa255-idp_defconfig
powerpc                     tqm8548_defconfig
xtensa                              defconfig
arm                        oxnas_v6_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                               tinyconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201204
x86_64               randconfig-a006-20201204
x86_64               randconfig-a002-20201204
x86_64               randconfig-a001-20201204
x86_64               randconfig-a005-20201204
x86_64               randconfig-a003-20201204
i386                 randconfig-a005-20201204
i386                 randconfig-a004-20201204
i386                 randconfig-a001-20201204
i386                 randconfig-a002-20201204
i386                 randconfig-a006-20201204
i386                 randconfig-a003-20201204
i386                 randconfig-a005-20201205
i386                 randconfig-a004-20201205
i386                 randconfig-a001-20201205
i386                 randconfig-a002-20201205
i386                 randconfig-a006-20201205
i386                 randconfig-a003-20201205
i386                 randconfig-a014-20201204
i386                 randconfig-a013-20201204
i386                 randconfig-a011-20201204
i386                 randconfig-a015-20201204
i386                 randconfig-a012-20201204
i386                 randconfig-a016-20201204
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201205
x86_64               randconfig-a006-20201205
x86_64               randconfig-a002-20201205
x86_64               randconfig-a001-20201205
x86_64               randconfig-a005-20201205
x86_64               randconfig-a003-20201205
x86_64               randconfig-a016-20201204
x86_64               randconfig-a012-20201204
x86_64               randconfig-a014-20201204
x86_64               randconfig-a013-20201204
x86_64               randconfig-a015-20201204
x86_64               randconfig-a011-20201204

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
