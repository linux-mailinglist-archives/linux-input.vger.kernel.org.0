Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48F234E0EA
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 07:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbhC3F50 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 01:57:26 -0400
Received: from mga05.intel.com ([192.55.52.43]:57890 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230122AbhC3F5R (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 01:57:17 -0400
IronPort-SDR: seEHQhSbcdFONEBXsP4eOyniOyfe0WeExnBdtzVkNbu8XFL4JZphTSPxVo0L73Oz8MKjHDxeTt
 qzT5gGGX0GPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="276862243"
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; 
   d="scan'208";a="276862243"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 22:57:15 -0700
IronPort-SDR: BbgSbPVpYAyZduEZkzb+UeoWnOhURWxdvDVlsSbHY7JHixJ/bTqEXbn7mg4DgIrVycneSPQPxN
 sTdkTGj2wm3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; 
   d="scan'208";a="595347031"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Mar 2021 22:57:13 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lR7NJ-00054P-2x; Tue, 30 Mar 2021 05:57:13 +0000
Date:   Tue, 30 Mar 2021 13:56:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 56cfe6f820a6315291eb5a1b82bb49633b993d3b
Message-ID: <6062bda3.Z7Aa0kheh7Y0qT6/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 56cfe6f820a6315291eb5a1b82bb49633b993d3b  Input: elants_i2c - drop zero-checking of ABS_MT_TOUCH_MAJOR resolution

elapsed time: 1381m

configs tested: 193
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                            allmodconfig
x86_64                           allyesconfig
i386                             allyesconfig
riscv                            allyesconfig
arm64                            alldefconfig
xtensa                              defconfig
powerpc                 mpc837x_rdb_defconfig
m68k                          atari_defconfig
sh                           se7712_defconfig
arc                           tb10x_defconfig
arm                        keystone_defconfig
arc                        nsim_700_defconfig
powerpc                      pcm030_defconfig
powerpc                    socrates_defconfig
mips                       lemote2f_defconfig
powerpc                      ppc44x_defconfig
powerpc               mpc834x_itxgp_defconfig
arc                            hsdk_defconfig
sh                            hp6xx_defconfig
powerpc                      makalu_defconfig
powerpc                      walnut_defconfig
parisc                generic-32bit_defconfig
sh                         ecovec24_defconfig
sh                                  defconfig
arm                      pxa255-idp_defconfig
arm                          iop32x_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     pseries_defconfig
arm                        mini2440_defconfig
mips                          ath25_defconfig
mips                          ath79_defconfig
powerpc                    sam440ep_defconfig
powerpc                  storcenter_defconfig
parisc                           allyesconfig
arm                          simpad_defconfig
m68k                        stmark2_defconfig
xtensa                generic_kc705_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                        mvme16x_defconfig
mips                    maltaup_xpa_defconfig
powerpc                      ppc40x_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                       ebony_defconfig
sh                            titan_defconfig
sparc64                             defconfig
powerpc                 mpc834x_itx_defconfig
mips                         tb0219_defconfig
mips                            ar7_defconfig
arm                     am200epdkit_defconfig
arm                          pxa910_defconfig
arm                          collie_defconfig
sh                           se7722_defconfig
parisc                generic-64bit_defconfig
m68k                        mvme147_defconfig
h8300                    h8300h-sim_defconfig
m68k                       m5475evb_defconfig
sh                ecovec24-romimage_defconfig
powerpc                   motionpro_defconfig
mips                           gcw0_defconfig
arm                          gemini_defconfig
powerpc                     ppa8548_defconfig
mips                         cobalt_defconfig
arm                      tct_hammer_defconfig
powerpc                       holly_defconfig
m68k                            mac_defconfig
powerpc64                        alldefconfig
sh                           se7750_defconfig
arc                        vdk_hs38_defconfig
arm                         lubbock_defconfig
sh                           se7343_defconfig
powerpc                     tqm8541_defconfig
i386                             alldefconfig
sparc                       sparc64_defconfig
arm                  colibri_pxa300_defconfig
arm                        vexpress_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                           se7724_defconfig
m68k                        m5407c3_defconfig
arm                          pcm027_defconfig
mips                           rs90_defconfig
sh                        dreamcast_defconfig
arm                           tegra_defconfig
mips                      pistachio_defconfig
openrisc                 simple_smp_defconfig
mips                        nlm_xlp_defconfig
h8300                     edosk2674_defconfig
sh                          kfr2r09_defconfig
mips                        maltaup_defconfig
arm                             pxa_defconfig
sh                         ap325rxa_defconfig
powerpc                      katmai_defconfig
powerpc                     mpc5200_defconfig
powerpc                  mpc885_ads_defconfig
mips                     loongson1b_defconfig
mips                     decstation_defconfig
sh                         apsh4a3a_defconfig
arm                         assabet_defconfig
sh                               alldefconfig
arm                         s3c6400_defconfig
xtensa                       common_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      bamboo_defconfig
powerpc                        warp_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                     pq2fads_defconfig
sh                        edosk7760_defconfig
sh                        sh7757lcr_defconfig
powerpc                         ps3_defconfig
powerpc                      chrp32_defconfig
arm                       mainstone_defconfig
arm                           omap1_defconfig
riscv                    nommu_virt_defconfig
arc                      axs103_smp_defconfig
powerpc                      ppc6xx_defconfig
arm                           spitz_defconfig
arm                         s3c2410_defconfig
arm                      jornada720_defconfig
mips                      pic32mzda_defconfig
mips                        jmr3927_defconfig
m68k                       m5275evb_defconfig
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
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210329
x86_64               randconfig-a003-20210329
x86_64               randconfig-a006-20210329
x86_64               randconfig-a001-20210329
x86_64               randconfig-a005-20210329
x86_64               randconfig-a004-20210329
i386                 randconfig-a003-20210329
i386                 randconfig-a004-20210329
i386                 randconfig-a001-20210329
i386                 randconfig-a002-20210329
i386                 randconfig-a006-20210329
i386                 randconfig-a005-20210329
i386                 randconfig-a014-20210329
i386                 randconfig-a011-20210329
i386                 randconfig-a015-20210329
i386                 randconfig-a016-20210329
i386                 randconfig-a013-20210329
i386                 randconfig-a012-20210329
riscv                    nommu_k210_defconfig
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
x86_64               randconfig-a015-20210329
x86_64               randconfig-a012-20210329
x86_64               randconfig-a013-20210329
x86_64               randconfig-a014-20210329
x86_64               randconfig-a011-20210329
x86_64               randconfig-a016-20210329

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
