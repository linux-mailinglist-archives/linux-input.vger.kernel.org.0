Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD931391372
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 11:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233368AbhEZJNK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 05:13:10 -0400
Received: from mga05.intel.com ([192.55.52.43]:17563 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233321AbhEZJNJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 05:13:09 -0400
IronPort-SDR: xAiMy7N6V6zDTVr42J8ZMr5B4xcx8bNNzoveNDmbnVTETg5TOI8SwkHhzdvYW6LGoknHWTvHY5
 EOTAGHu0aL8A==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="287996348"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="287996348"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 02:11:37 -0700
IronPort-SDR: 6kT/J0y2vbYP7YqMq9T+WnPZkNbqze/ry94D1P2K9Arf3/TGjqEGsBURtKzbcaW66/zULsi+lo
 V1dktyuZEF7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="397227641"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 26 May 2021 02:11:36 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1llpZf-000260-IM; Wed, 26 May 2021 09:11:35 +0000
Date:   Wed, 26 May 2021 17:11:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 fb082cd59afa7fbd3a610e9835050675040b1b99
Message-ID: <60ae10a9.K/opn9tglCA19wwX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: fb082cd59afa7fbd3a610e9835050675040b1b99  Input: resistive-adc-touch - add support for z1 and z2 channels

elapsed time: 724m

configs tested: 176
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                     haps_hs_smp_defconfig
sh                           se7751_defconfig
arm                           sunxi_defconfig
powerpc                  mpc866_ads_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                     tqm8548_defconfig
powerpc                      ppc44x_defconfig
sh                           se7780_defconfig
arm                        spear3xx_defconfig
powerpc                     tqm5200_defconfig
sh                            titan_defconfig
csky                                defconfig
arm                       multi_v4t_defconfig
mips                           ip22_defconfig
m68k                             allyesconfig
powerpc                     redwood_defconfig
mips                        omega2p_defconfig
arm                            xcep_defconfig
i386                                defconfig
powerpc                       eiger_defconfig
powerpc                    ge_imp3a_defconfig
um                               allmodconfig
powerpc                     pq2fads_defconfig
arm                         at91_dt_defconfig
powerpc                       holly_defconfig
sh                          rsk7269_defconfig
sparc                            allyesconfig
sh                         microdev_defconfig
powerpc                        fsp2_defconfig
arm                       netwinder_defconfig
mips                  cavium_octeon_defconfig
powerpc                    klondike_defconfig
powerpc                 mpc832x_mds_defconfig
mips                    maltaup_xpa_defconfig
arm                         orion5x_defconfig
mips                           ip28_defconfig
mips                         db1xxx_defconfig
xtensa                         virt_defconfig
nios2                            alldefconfig
arm                      jornada720_defconfig
powerpc                     tqm8541_defconfig
nds32                               defconfig
powerpc                      obs600_defconfig
powerpc64                           defconfig
powerpc                      bamboo_defconfig
mips                        bcm47xx_defconfig
arm                         cm_x300_defconfig
mips                          rm200_defconfig
arm                            pleb_defconfig
sparc64                             defconfig
arm                           omap1_defconfig
mips                         mpc30x_defconfig
sh                           se7750_defconfig
arc                        vdk_hs38_defconfig
mips                      pic32mzda_defconfig
csky                             alldefconfig
sparc                       sparc32_defconfig
sh                           se7343_defconfig
sh                           se7619_defconfig
sh                           se7206_defconfig
arm                       cns3420vb_defconfig
powerpc                     sequoia_defconfig
s390                                defconfig
arc                          axs101_defconfig
sh                           se7724_defconfig
powerpc               mpc834x_itxgp_defconfig
parisc                generic-32bit_defconfig
nios2                            allyesconfig
arm                         lpc18xx_defconfig
arm                            qcom_defconfig
mips                      fuloong2e_defconfig
sparc                       sparc64_defconfig
m68k                        stmark2_defconfig
riscv                    nommu_k210_defconfig
alpha                            alldefconfig
arc                    vdk_hs38_smp_defconfig
m68k                        mvme147_defconfig
microblaze                      mmu_defconfig
arm                         nhk8815_defconfig
powerpc                 mpc8272_ads_defconfig
mips                          malta_defconfig
powerpc                         wii_defconfig
powerpc                      tqm8xx_defconfig
um                               allyesconfig
powerpc                   currituck_defconfig
mips                          ath25_defconfig
arm                        oxnas_v6_defconfig
m68k                          hp300_defconfig
s390                          debug_defconfig
arm                       aspeed_g5_defconfig
arc                            hsdk_defconfig
mips                          rb532_defconfig
arm                        trizeps4_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
i386                             allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20210526
x86_64               randconfig-a001-20210526
x86_64               randconfig-a006-20210526
x86_64               randconfig-a003-20210526
x86_64               randconfig-a004-20210526
x86_64               randconfig-a002-20210526
i386                 randconfig-a001-20210525
i386                 randconfig-a002-20210525
i386                 randconfig-a005-20210525
i386                 randconfig-a006-20210525
i386                 randconfig-a003-20210525
i386                 randconfig-a001-20210526
i386                 randconfig-a002-20210526
i386                 randconfig-a005-20210526
i386                 randconfig-a004-20210526
i386                 randconfig-a003-20210526
i386                 randconfig-a006-20210526
x86_64               randconfig-a014-20210525
x86_64               randconfig-a016-20210525
i386                 randconfig-a011-20210526
i386                 randconfig-a016-20210526
i386                 randconfig-a015-20210526
i386                 randconfig-a012-20210526
i386                 randconfig-a014-20210526
i386                 randconfig-a013-20210526
i386                 randconfig-a016-20210525
i386                 randconfig-a011-20210525
i386                 randconfig-a015-20210525
i386                 randconfig-a012-20210525
i386                 randconfig-a014-20210525
i386                 randconfig-a013-20210525
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                                allnoconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210526
x86_64               randconfig-a013-20210526
x86_64               randconfig-a012-20210526
x86_64               randconfig-a014-20210526
x86_64               randconfig-a016-20210526
x86_64               randconfig-a015-20210526
x86_64               randconfig-a011-20210526

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
