Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34E213085A9
	for <lists+linux-input@lfdr.de>; Fri, 29 Jan 2021 07:24:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232160AbhA2GXS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 Jan 2021 01:23:18 -0500
Received: from mga02.intel.com ([134.134.136.20]:4009 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232113AbhA2GXM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 Jan 2021 01:23:12 -0500
IronPort-SDR: iCYI5CHBkyDpV+EvXpbBaDb+AhtYJViT/fIrZbi57ijYg1Q1hHT6ciGbuAA3VKNh4u1z7JLjSz
 YeJNNG4b421w==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="167473202"
X-IronPort-AV: E=Sophos;i="5.79,384,1602572400"; 
   d="scan'208";a="167473202"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 22:22:30 -0800
IronPort-SDR: Lt5xtcdtzJRkT2OPVwn/ULRzgJTai2vG1t5WByaS50+OQfBy81VlPbe2Y0RLkVBrXzrbAEKjgP
 HIaxpmbO39Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,384,1602572400"; 
   d="scan'208";a="409447327"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2021 22:22:29 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l5NAq-0003aG-U6; Fri, 29 Jan 2021 06:22:28 +0000
Date:   Fri, 29 Jan 2021 14:22:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 7a6a53b2b1a3e68b69cd75a74783f4d8fd5b6fb5
Message-ID: <6013a999.T+XMBmTSCn6tVXwd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: 7a6a53b2b1a3e68b69cd75a74783f4d8fd5b6fb5  Input: iqs5xx - initialize an uninitialized variable

elapsed time: 722m

configs tested: 132
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     tqm5200_defconfig
mips                         bigsur_defconfig
arm                   milbeaut_m10v_defconfig
mips                            gpr_defconfig
mips                          ath79_defconfig
powerpc                         ps3_defconfig
arm                          pxa3xx_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
m68k                           sun3_defconfig
mips                malta_kvm_guest_defconfig
arm                       imx_v6_v7_defconfig
powerpc                     pseries_defconfig
sparc64                             defconfig
powerpc                     tqm8540_defconfig
powerpc                      pcm030_defconfig
powerpc                     taishan_defconfig
mips                    maltaup_xpa_defconfig
sparc                       sparc32_defconfig
powerpc                 mpc837x_mds_defconfig
arm                            u300_defconfig
sh                           se7721_defconfig
powerpc                      pasemi_defconfig
nios2                         10m50_defconfig
arm                            pleb_defconfig
powerpc                       eiger_defconfig
xtensa                          iss_defconfig
c6x                        evmc6457_defconfig
powerpc64                           defconfig
mips                         db1xxx_defconfig
arm                           stm32_defconfig
m68k                       bvme6000_defconfig
ia64                            zx1_defconfig
nds32                               defconfig
powerpc                     powernv_defconfig
ia64                                defconfig
sh                               j2_defconfig
openrisc                            defconfig
powerpc                 mpc8272_ads_defconfig
arm                        shmobile_defconfig
arm                           u8500_defconfig
mips                       bmips_be_defconfig
powerpc                  mpc885_ads_defconfig
arc                      axs103_smp_defconfig
arm                      tct_hammer_defconfig
mips                     cu1000-neo_defconfig
arc                           tb10x_defconfig
arm                         socfpga_defconfig
nios2                            allyesconfig
arm                        keystone_defconfig
arm                        magician_defconfig
m68k                        m5307c3_defconfig
sh                           se7751_defconfig
arm                           h3600_defconfig
arc                        nsimosci_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
i386                               tinyconfig
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210128
i386                 randconfig-a002-20210128
i386                 randconfig-a004-20210128
i386                 randconfig-a005-20210128
i386                 randconfig-a003-20210128
i386                 randconfig-a006-20210128
x86_64               randconfig-a012-20210128
x86_64               randconfig-a015-20210128
x86_64               randconfig-a016-20210128
x86_64               randconfig-a011-20210128
x86_64               randconfig-a013-20210128
x86_64               randconfig-a014-20210128
i386                 randconfig-a013-20210128
i386                 randconfig-a011-20210128
i386                 randconfig-a012-20210128
i386                 randconfig-a016-20210128
i386                 randconfig-a014-20210128
i386                 randconfig-a015-20210128
riscv                            allyesconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210128
x86_64               randconfig-a003-20210128
x86_64               randconfig-a001-20210128
x86_64               randconfig-a005-20210128
x86_64               randconfig-a006-20210128
x86_64               randconfig-a004-20210128
x86_64               randconfig-a012-20210129
x86_64               randconfig-a015-20210129
x86_64               randconfig-a016-20210129
x86_64               randconfig-a011-20210129
x86_64               randconfig-a013-20210129
x86_64               randconfig-a014-20210129

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
