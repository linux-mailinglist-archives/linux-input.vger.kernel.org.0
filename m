Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D758E31E6E7
	for <lists+linux-input@lfdr.de>; Thu, 18 Feb 2021 08:30:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhBRHZ7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Feb 2021 02:25:59 -0500
Received: from mga03.intel.com ([134.134.136.65]:52890 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230309AbhBRHQM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Feb 2021 02:16:12 -0500
IronPort-SDR: IrvBknfwCT3+f9Trw6l9+MseKAFN/vTvviMVOPQQbCggcXT9QsORbssch5YBjZpYS+5Nb5sZKF
 FtfRi0BxC1QA==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="183490430"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="183490430"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 23:14:32 -0800
IronPort-SDR: X7UKwccHOgBoJES2wbHtA5QVTvXzDJmtO/ME+ptrnvXDIZhaEe4pAQYpoIDT0VQyhwKgZRwsS1
 XIMxk9z483og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="427894131"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 Feb 2021 23:14:30 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lCdW8-0009WU-AD; Thu, 18 Feb 2021 07:14:28 +0000
Date:   Thu, 18 Feb 2021 15:13:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 b0b7d2815839024e5181bd2572f5d8d4f65363b3
Message-ID: <602e13ac.C4LIoBwBV7dRk7hg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: b0b7d2815839024e5181bd2572f5d8d4f65363b3  Input: sur40 - fix an error code in sur40_probe()

elapsed time: 725m

configs tested: 157
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                        multi_v5_defconfig
arm                            u300_defconfig
powerpc                        icon_defconfig
mips                         db1xxx_defconfig
arm                          prima2_defconfig
arm                       cns3420vb_defconfig
arm                  colibri_pxa270_defconfig
mips                  maltasmvp_eva_defconfig
mips                           xway_defconfig
powerpc                    amigaone_defconfig
arm                           sama5_defconfig
m68k                         amcore_defconfig
sparc                       sparc64_defconfig
m68k                        mvme147_defconfig
mips                        nlm_xlr_defconfig
arm                              zx_defconfig
arm                         lubbock_defconfig
ia64                         bigsur_defconfig
mips                     loongson1c_defconfig
arm                           spitz_defconfig
arm                        neponset_defconfig
mips                          ath79_defconfig
arm                          lpd270_defconfig
sh                          polaris_defconfig
arm                            lart_defconfig
powerpc                     rainier_defconfig
arm                        cerfcube_defconfig
arm                         lpc32xx_defconfig
arm                         s3c2410_defconfig
x86_64                           alldefconfig
sh                        apsh4ad0a_defconfig
powerpc                         wii_defconfig
powerpc                     mpc512x_defconfig
arc                        vdk_hs38_defconfig
arc                        nsim_700_defconfig
xtensa                  nommu_kc705_defconfig
arm                       imx_v4_v5_defconfig
arm                     eseries_pxa_defconfig
parisc                generic-64bit_defconfig
arm                           omap1_defconfig
powerpc                     sbc8548_defconfig
arm                          pxa3xx_defconfig
m68k                       m5208evb_defconfig
mips                      pic32mzda_defconfig
powerpc                      katmai_defconfig
powerpc                      acadia_defconfig
nios2                               defconfig
sh                         microdev_defconfig
mips                       capcella_defconfig
arm                          exynos_defconfig
ia64                      gensparse_defconfig
mips                           ip27_defconfig
powerpc                 xes_mpc85xx_defconfig
arc                         haps_hs_defconfig
xtensa                           alldefconfig
sh                     sh7710voipgw_defconfig
powerpc                 mpc8315_rdb_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210216
x86_64               randconfig-a002-20210216
x86_64               randconfig-a004-20210216
x86_64               randconfig-a001-20210216
x86_64               randconfig-a005-20210216
x86_64               randconfig-a006-20210216
i386                 randconfig-a003-20210216
i386                 randconfig-a005-20210216
i386                 randconfig-a002-20210216
i386                 randconfig-a006-20210216
i386                 randconfig-a001-20210216
i386                 randconfig-a004-20210216
i386                 randconfig-a003-20210217
i386                 randconfig-a005-20210217
i386                 randconfig-a002-20210217
i386                 randconfig-a006-20210217
i386                 randconfig-a001-20210217
i386                 randconfig-a004-20210217
x86_64               randconfig-a013-20210217
x86_64               randconfig-a016-20210217
x86_64               randconfig-a012-20210217
x86_64               randconfig-a015-20210217
x86_64               randconfig-a014-20210217
x86_64               randconfig-a011-20210217
i386                 randconfig-a016-20210217
i386                 randconfig-a014-20210217
i386                 randconfig-a012-20210217
i386                 randconfig-a013-20210217
i386                 randconfig-a011-20210217
i386                 randconfig-a015-20210217
i386                 randconfig-a016-20210216
i386                 randconfig-a014-20210216
i386                 randconfig-a012-20210216
i386                 randconfig-a013-20210216
i386                 randconfig-a011-20210216
i386                 randconfig-a015-20210216
i386                 randconfig-a016-20210215
i386                 randconfig-a014-20210215
i386                 randconfig-a012-20210215
i386                 randconfig-a013-20210215
i386                 randconfig-a011-20210215
i386                 randconfig-a015-20210215
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
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210216
x86_64               randconfig-a016-20210216
x86_64               randconfig-a012-20210216
x86_64               randconfig-a015-20210216
x86_64               randconfig-a014-20210216
x86_64               randconfig-a011-20210216

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
