Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D40CA2DED9F
	for <lists+linux-input@lfdr.de>; Sat, 19 Dec 2020 08:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgLSHBA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Dec 2020 02:01:00 -0500
Received: from mga06.intel.com ([134.134.136.31]:61453 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726254AbgLSHBA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Dec 2020 02:01:00 -0500
IronPort-SDR: gdfCA0mN0xrY/P5MaXRNmc7TqX3Rik8SduiVMDLQEkaRsU/Qpg37eBCcVQnGe3H4zALnEVhsTn
 TDBKFtlMebUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9839"; a="237126195"
X-IronPort-AV: E=Sophos;i="5.78,432,1599548400"; 
   d="scan'208";a="237126195"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2020 23:00:19 -0800
IronPort-SDR: wwo5qvJjaz6D2bccdG18/IQtMEHCZ0rRXRXhempOxRtVI9IJYXeubBryTThdO/4CinPfFQ+N6b
 2dWwaRjSkOXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,432,1599548400"; 
   d="scan'208";a="354416836"
Received: from lkp-server02.sh.intel.com (HELO c4fb2a2464e8) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 18 Dec 2020 23:00:18 -0800
Received: from kbuild by c4fb2a2464e8 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kqWDx-0000fn-O7; Sat, 19 Dec 2020 07:00:17 +0000
Date:   Sat, 19 Dec 2020 14:59:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 f5cace4b93d736cef348211ae0814cabdd26d86a
Message-ID: <5fdda4df.ajIPtIV7sj17EtWA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  master
branch HEAD: f5cace4b93d736cef348211ae0814cabdd26d86a  Input: imx_keypad - add dependency on HAS_IOMEM

elapsed time: 725m

configs tested: 142
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     tqm8541_defconfig
m68k                         apollo_defconfig
arm                        mini2440_defconfig
powerpc                 canyonlands_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                   motionpro_defconfig
powerpc                      ep88xc_defconfig
parisc                           alldefconfig
arm                           omap1_defconfig
mips                            e55_defconfig
arm                         shannon_defconfig
mips                      maltasmvp_defconfig
ia64                                defconfig
arm                          pxa3xx_defconfig
arm                         at91_dt_defconfig
mips                     cu1000-neo_defconfig
powerpc                     sequoia_defconfig
arm                     davinci_all_defconfig
arm                       mainstone_defconfig
m68k                        mvme16x_defconfig
sh                           se7343_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                     sbc8548_defconfig
mips                    maltaup_xpa_defconfig
m68k                                defconfig
arm                        spear3xx_defconfig
sh                          urquell_defconfig
sh                          rsk7264_defconfig
x86_64                           allyesconfig
mips                       capcella_defconfig
xtensa                  nommu_kc705_defconfig
sh                         apsh4a3a_defconfig
arm                          tango4_defconfig
mips                  decstation_64_defconfig
sh                           se7206_defconfig
powerpc                       holly_defconfig
arm                         vf610m4_defconfig
riscv                             allnoconfig
mips                        vocore2_defconfig
i386                             alldefconfig
mips                      fuloong2e_defconfig
arm                            mps2_defconfig
riscv                               defconfig
powerpc                      tqm8xx_defconfig
xtensa                          iss_defconfig
c6x                              allyesconfig
openrisc                            defconfig
ia64                          tiger_defconfig
parisc                generic-32bit_defconfig
arm                         lpc32xx_defconfig
arm                           viper_defconfig
arm                       cns3420vb_defconfig
parisc                           allyesconfig
powerpc                     kilauea_defconfig
sh                          rsk7201_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
x86_64               randconfig-a003-20201217
x86_64               randconfig-a006-20201217
x86_64               randconfig-a002-20201217
x86_64               randconfig-a005-20201217
x86_64               randconfig-a004-20201217
x86_64               randconfig-a001-20201217
i386                 randconfig-a001-20201217
i386                 randconfig-a004-20201217
i386                 randconfig-a003-20201217
i386                 randconfig-a002-20201217
i386                 randconfig-a006-20201217
i386                 randconfig-a005-20201217
x86_64               randconfig-a016-20201218
x86_64               randconfig-a013-20201218
x86_64               randconfig-a012-20201218
x86_64               randconfig-a015-20201218
x86_64               randconfig-a014-20201218
x86_64               randconfig-a011-20201218
i386                 randconfig-a014-20201218
i386                 randconfig-a013-20201218
i386                 randconfig-a011-20201218
i386                 randconfig-a012-20201218
i386                 randconfig-a016-20201218
i386                 randconfig-a015-20201218
i386                 randconfig-a014-20201217
i386                 randconfig-a013-20201217
i386                 randconfig-a012-20201217
i386                 randconfig-a011-20201217
i386                 randconfig-a015-20201217
i386                 randconfig-a016-20201217
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a016-20201217
x86_64               randconfig-a012-20201217
x86_64               randconfig-a013-20201217
x86_64               randconfig-a015-20201217
x86_64               randconfig-a014-20201217
x86_64               randconfig-a011-20201217
x86_64               randconfig-a003-20201218
x86_64               randconfig-a006-20201218
x86_64               randconfig-a002-20201218
x86_64               randconfig-a005-20201218
x86_64               randconfig-a001-20201218
x86_64               randconfig-a004-20201218

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
