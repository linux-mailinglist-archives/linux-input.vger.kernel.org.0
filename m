Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A2B35F7E8
	for <lists+linux-input@lfdr.de>; Wed, 14 Apr 2021 17:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233074AbhDNPeb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Apr 2021 11:34:31 -0400
Received: from mga06.intel.com ([134.134.136.31]:55921 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230281AbhDNPea (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Apr 2021 11:34:30 -0400
IronPort-SDR: fxNr5biy5juZWswMIpO0deoWvJwdDENrMN6rHExqP6MtRrfODd05bTomww+IDS4pHMv5IsSwIk
 X2XEfd6ueXIw==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="255983498"
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; 
   d="scan'208";a="255983498"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 08:34:09 -0700
IronPort-SDR: MK4CyN+//NPrx1YFuifJEdapQ/1SypabACibuL1qoxYAKjNa8uK22tsRf0/+Uo0Bfjt4qtfUF1
 OpLzuJeuF09A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; 
   d="scan'208";a="399219606"
Received: from lkp-server02.sh.intel.com (HELO fa9c8fcc3464) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Apr 2021 08:34:08 -0700
Received: from kbuild by fa9c8fcc3464 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lWhWp-00005Y-BF; Wed, 14 Apr 2021 15:34:07 +0000
Date:   Wed, 14 Apr 2021 23:33:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 aa2f62cf211a0985c14fd78a17d55296769698d6
Message-ID: <60770b61.Lt83+x9EBk5N0rVZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: aa2f62cf211a0985c14fd78a17d55296769698d6  Input: add driver for the Hycon HY46XX touchpanel series

elapsed time: 720m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
i386                             allyesconfig
sh                 kfr2r09-romimage_defconfig
csky                             alldefconfig
mips                      pistachio_defconfig
mips                          ath79_defconfig
mips                           ip22_defconfig
powerpc                 mpc836x_mds_defconfig
nds32                            alldefconfig
arm                         socfpga_defconfig
sparc64                             defconfig
powerpc                        warp_defconfig
mips                        nlm_xlr_defconfig
ia64                      gensparse_defconfig
powerpc                      cm5200_defconfig
sh                   secureedge5410_defconfig
s390                             alldefconfig
mips                        bcm47xx_defconfig
mips                  decstation_64_defconfig
h8300                       h8s-sim_defconfig
powerpc                       ebony_defconfig
powerpc                      ppc6xx_defconfig
mips                          rb532_defconfig
sh                        sh7785lcr_defconfig
arm                  colibri_pxa300_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                      acadia_defconfig
arm                          pxa168_defconfig
powerpc                         ps3_defconfig
sh                                  defconfig
s390                             allyesconfig
arm                           sunxi_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                    sam440ep_defconfig
sh                          rsk7203_defconfig
powerpc                   currituck_defconfig
sh                            hp6xx_defconfig
sh                ecovec24-romimage_defconfig
arm                          lpd270_defconfig
mips                           ci20_defconfig
arm                        multi_v7_defconfig
arm                        spear3xx_defconfig
powerpc                       eiger_defconfig
powerpc                     mpc512x_defconfig
sh                   rts7751r2dplus_defconfig
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
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
sparc                            allyesconfig
i386                                defconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210414
i386                 randconfig-a006-20210414
i386                 randconfig-a001-20210414
i386                 randconfig-a005-20210414
i386                 randconfig-a004-20210414
i386                 randconfig-a002-20210414
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210414
x86_64               randconfig-a002-20210414
x86_64               randconfig-a005-20210414
x86_64               randconfig-a001-20210414
x86_64               randconfig-a006-20210414
x86_64               randconfig-a004-20210414

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
