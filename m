Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85AE0488CE4
	for <lists+linux-input@lfdr.de>; Sun,  9 Jan 2022 23:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235362AbiAIWmC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Jan 2022 17:42:02 -0500
Received: from mga11.intel.com ([192.55.52.93]:33351 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235592AbiAIWmA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 9 Jan 2022 17:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641768120; x=1673304120;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=J4Az5kvnLPjwAgVc4h0fCI3EwcXeKi0qG2FIqSbakSc=;
  b=fi3VBvl6NggDLnLPn/qkAhrnVWcajxjXvCaETNytUmRW0mB/c0iC0/A2
   WbVJAM8g+SRrg1pvebTVSZXbHSVpu4xcbmFlF7c+I2ez5x8rOguTTTf0z
   I/um7bhotSDXgC2duWGIoByP/ih6eNnpF1Fd3dZqPPrA9qvEZpOGvVqXz
   uLEuyt4vsSBrpZZ9BPEWgQ1tWg3q5uardjTnJoJcMXtt3rsl5bDLo07Hp
   LxO4T0iIcrTnZv6/K3pUfrx4VAOpEHLZPlQcMgwpNE0wSzKR7jlfvF+LD
   DedtMo9LNQrb3e/OTVhBevfH726j2qIex1DUoSsEhS7LEg2dTqdi4xnbp
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="240671138"
X-IronPort-AV: E=Sophos;i="5.88,275,1635231600"; 
   d="scan'208";a="240671138"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2022 14:42:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,275,1635231600"; 
   d="scan'208";a="557807986"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Jan 2022 14:41:59 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n6gsw-0001wK-I2; Sun, 09 Jan 2022 22:41:58 +0000
Date:   Mon, 10 Jan 2022 06:41:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 cf73ed894ee939d6706d65e0cd186e4a64e3af6d
Message-ID: <61db6485.cQiNv6ZVPhzsAoxz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: cf73ed894ee939d6706d65e0cd186e4a64e3af6d  Input: zinitix - make sure the IRQ is allocated before it gets enabled

elapsed time: 847m

configs tested: 181
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                         ps3_defconfig
nios2                         10m50_defconfig
sh                           se7712_defconfig
mips                      maltasmvp_defconfig
sh                   sh7724_generic_defconfig
powerpc                     rainier_defconfig
powerpc                        warp_defconfig
arm                        keystone_defconfig
mips                            ar7_defconfig
powerpc                     taishan_defconfig
sh                        dreamcast_defconfig
sh                             sh03_defconfig
m68k                             alldefconfig
powerpc                 mpc8540_ads_defconfig
um                                  defconfig
powerpc                    klondike_defconfig
sh                            titan_defconfig
powerpc                      ppc6xx_defconfig
arm                           tegra_defconfig
arm                           sunxi_defconfig
alpha                            allyesconfig
powerpc                 mpc837x_mds_defconfig
sh                          rsk7203_defconfig
arm                            qcom_defconfig
sh                          sdk7786_defconfig
um                             i386_defconfig
m68k                            mac_defconfig
sh                            migor_defconfig
powerpc                     tqm8555_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                 mpc834x_mds_defconfig
nds32                            alldefconfig
arc                          axs101_defconfig
arc                     nsimosci_hs_defconfig
mips                         db1xxx_defconfig
ia64                                defconfig
m68k                        m5272c3_defconfig
sh                  sh7785lcr_32bit_defconfig
s390                          debug_defconfig
sh                           se7722_defconfig
m68k                        m5307c3_defconfig
mips                             allyesconfig
powerpc                  iss476-smp_defconfig
sh                           sh2007_defconfig
sh                           se7619_defconfig
arm                        oxnas_v6_defconfig
sh                      rts7751r2d1_defconfig
m68k                       m5475evb_defconfig
arm                            mps2_defconfig
mips                     decstation_defconfig
powerpc                       ppc64_defconfig
h8300                    h8300h-sim_defconfig
powerpc                      pasemi_defconfig
m68k                        mvme16x_defconfig
m68k                        mvme147_defconfig
arm                           viper_defconfig
arm                         lpc18xx_defconfig
sh                          landisk_defconfig
arm                          exynos_defconfig
powerpc                      makalu_defconfig
sh                           se7780_defconfig
s390                             allmodconfig
sparc                       sparc32_defconfig
powerpc                    sam440ep_defconfig
sh                ecovec24-romimage_defconfig
x86_64                              defconfig
powerpc                      ppc40x_defconfig
sh                                  defconfig
sh                          polaris_defconfig
arc                              alldefconfig
mips                 decstation_r4k_defconfig
powerpc                      chrp32_defconfig
m68k                            q40_defconfig
sh                         ecovec24_defconfig
arm                            lart_defconfig
riscv                            allyesconfig
mips                          rb532_defconfig
arm                          lpd270_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                     eseries_pxa_defconfig
arm                       aspeed_g5_defconfig
sparc                            alldefconfig
arm                  randconfig-c002-20220109
ia64                             allmodconfig
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
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20220109
x86_64               randconfig-a001-20220109
x86_64               randconfig-a004-20220109
x86_64               randconfig-a006-20220109
x86_64               randconfig-a003-20220109
x86_64               randconfig-a002-20220109
i386                 randconfig-a003-20220109
i386                 randconfig-a005-20220109
i386                 randconfig-a006-20220109
i386                 randconfig-a004-20220109
i386                 randconfig-a001-20220109
i386                 randconfig-a002-20220109
x86_64               randconfig-a005-20220110
x86_64               randconfig-a004-20220110
x86_64               randconfig-a001-20220110
x86_64               randconfig-a006-20220110
x86_64               randconfig-a002-20220110
x86_64               randconfig-a003-20220110
arc                  randconfig-r043-20220109
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220109
mips                 randconfig-c004-20220109
i386                 randconfig-c001-20220109
riscv                randconfig-c006-20220109
powerpc              randconfig-c003-20220109
x86_64               randconfig-c007-20220109
s390                 randconfig-c005-20220109
powerpc                     mpc512x_defconfig
powerpc                     tqm8540_defconfig
powerpc                          allyesconfig
powerpc                     ksi8560_defconfig
arm                                 defconfig
powerpc                 mpc832x_mds_defconfig
x86_64               randconfig-a015-20220109
x86_64               randconfig-a012-20220109
x86_64               randconfig-a014-20220109
x86_64               randconfig-a013-20220109
x86_64               randconfig-a011-20220109
x86_64               randconfig-a016-20220109
x86_64               randconfig-a016-20220110
x86_64               randconfig-a012-20220110
x86_64               randconfig-a013-20220110
x86_64               randconfig-a011-20220110
x86_64               randconfig-a014-20220110
x86_64               randconfig-a015-20220110
i386                 randconfig-a012-20220109
i386                 randconfig-a016-20220109
i386                 randconfig-a015-20220109
i386                 randconfig-a014-20220109
i386                 randconfig-a011-20220109
i386                 randconfig-a013-20220109
hexagon              randconfig-r041-20220109
riscv                randconfig-r042-20220109
hexagon              randconfig-r045-20220109
s390                 randconfig-r044-20220109

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
