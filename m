Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C998402EA4
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 21:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240940AbhIGTCA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 15:02:00 -0400
Received: from mga11.intel.com ([192.55.52.93]:45136 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230203AbhIGTB7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Sep 2021 15:01:59 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="217133190"
X-IronPort-AV: E=Sophos;i="5.85,276,1624345200"; 
   d="scan'208";a="217133190"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 12:00:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,276,1624345200"; 
   d="scan'208";a="547074241"
Received: from lkp-server01.sh.intel.com (HELO 730d49888f40) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Sep 2021 12:00:52 -0700
Received: from kbuild by 730d49888f40 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mNgKx-0001D4-Dr; Tue, 07 Sep 2021 19:00:51 +0000
Date:   Wed, 08 Sep 2021 03:00:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 ab108678195ff70edf50025379a5de94b0bb26be
Message-ID: <6137b6c6.W+KbKX13MeqFnr75%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: ab108678195ff70edf50025379a5de94b0bb26be  Input: mms114 - support MMS134S

elapsed time: 730m

configs tested: 178
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210906
mips                           ip28_defconfig
powerpc                        icon_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                 canyonlands_defconfig
arc                          axs103_defconfig
mips                         rt305x_defconfig
sh                           se7722_defconfig
mips                           jazz_defconfig
powerpc                     stx_gp3_defconfig
mips                        bcm63xx_defconfig
mips                        nlm_xlr_defconfig
sh                           se7780_defconfig
nios2                            alldefconfig
powerpc                 mpc8560_ads_defconfig
powerpc                      cm5200_defconfig
mips                        qi_lb60_defconfig
powerpc                           allnoconfig
powerpc                 mpc8313_rdb_defconfig
arc                    vdk_hs38_smp_defconfig
ia64                             alldefconfig
arm                        multi_v7_defconfig
powerpc                     redwood_defconfig
mips                     decstation_defconfig
m68k                          amiga_defconfig
arm                            xcep_defconfig
arm                            mps2_defconfig
arm64                            alldefconfig
h8300                       h8s-sim_defconfig
sh                   sh7724_generic_defconfig
arm                         at91_dt_defconfig
sh                               alldefconfig
mips                        nlm_xlp_defconfig
alpha                               defconfig
sh                           se7721_defconfig
m68k                         apollo_defconfig
arm                            zeus_defconfig
arm                            pleb_defconfig
arm                           h5000_defconfig
microblaze                      mmu_defconfig
arm                           h3600_defconfig
powerpc                 mpc834x_itx_defconfig
mips                           ip27_defconfig
sh                        sh7763rdp_defconfig
arm                          badge4_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                         bigsur_defconfig
arm                          pcm027_defconfig
xtensa                    smp_lx200_defconfig
powerpc                    gamecube_defconfig
powerpc                      pmac32_defconfig
sh                   secureedge5410_defconfig
mips                      maltasmvp_defconfig
mips                      pic32mzda_defconfig
mips                        maltaup_defconfig
arm                       versatile_defconfig
arm                          imote2_defconfig
powerpc                    sam440ep_defconfig
sh                           se7751_defconfig
powerpc                     mpc83xx_defconfig
arm                          ixp4xx_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                               j2_defconfig
alpha                            allyesconfig
sparc                       sparc32_defconfig
powerpc                 mpc836x_mds_defconfig
mips                         tb0287_defconfig
powerpc                     tqm8541_defconfig
alpha                            alldefconfig
sh                         apsh4a3a_defconfig
mips                    maltaup_xpa_defconfig
sh                             espt_defconfig
mips                          rb532_defconfig
riscv                               defconfig
sh                          rsk7264_defconfig
mips                      fuloong2e_defconfig
sh                            shmin_defconfig
mips                           ip22_defconfig
arm                   milbeaut_m10v_defconfig
m68k                        mvme147_defconfig
arm                         s3c2410_defconfig
powerpc                       maple_defconfig
powerpc                   bluestone_defconfig
sh                          rsk7203_defconfig
ia64                        generic_defconfig
arm                         hackkit_defconfig
nios2                         10m50_defconfig
powerpc                       ebony_defconfig
powerpc64                           defconfig
powerpc                     taishan_defconfig
sh                           se7619_defconfig
arm                  randconfig-c002-20210906
arm                  randconfig-c002-20210907
x86_64                            allnoconfig
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
csky                                defconfig
nios2                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a006-20210906
x86_64               randconfig-a004-20210906
x86_64               randconfig-a003-20210906
x86_64               randconfig-a005-20210906
x86_64               randconfig-a001-20210906
x86_64               randconfig-a002-20210906
i386                 randconfig-a005-20210906
i386                 randconfig-a004-20210906
i386                 randconfig-a006-20210906
i386                 randconfig-a002-20210906
i386                 randconfig-a003-20210906
i386                 randconfig-a001-20210906
arc                  randconfig-r043-20210906
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20210906
mips                 randconfig-c004-20210906
powerpc              randconfig-c003-20210906
i386                 randconfig-c001-20210906
arm                  randconfig-c002-20210906
s390                 randconfig-c005-20210907
mips                 randconfig-c004-20210907
powerpc              randconfig-c003-20210907
arm                  randconfig-c002-20210907
riscv                randconfig-c006-20210907
x86_64               randconfig-a011-20210906
x86_64               randconfig-a016-20210906
x86_64               randconfig-a012-20210906
x86_64               randconfig-a015-20210906
x86_64               randconfig-a014-20210906
x86_64               randconfig-a013-20210906
i386                 randconfig-a012-20210906
i386                 randconfig-a011-20210906
i386                 randconfig-a013-20210906
i386                 randconfig-a015-20210906
i386                 randconfig-a014-20210906
i386                 randconfig-a016-20210906
riscv                randconfig-r042-20210906
hexagon              randconfig-r045-20210906
s390                 randconfig-r044-20210906
hexagon              randconfig-r041-20210906

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
