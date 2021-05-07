Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEFB63763E4
	for <lists+linux-input@lfdr.de>; Fri,  7 May 2021 12:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234281AbhEGKgF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 May 2021 06:36:05 -0400
Received: from mga01.intel.com ([192.55.52.88]:63047 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234057AbhEGKgE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 7 May 2021 06:36:04 -0400
IronPort-SDR: eh7v9nkj4ux58Lzsra01+DgfM/qY1WVvHLHeE7GnsN6tQKzQTPpGSCc9xkywR1UxmgItIXRe3w
 1tvKdHus3qnw==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="219599169"
X-IronPort-AV: E=Sophos;i="5.82,280,1613462400"; 
   d="scan'208";a="219599169"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 03:35:04 -0700
IronPort-SDR: OXnHYxrISXiJAhB1/NgLE6BMm4jiuoXqpAt5+9jqxDiy98wJcIhdc+/TrIsPPfBvEIatrwc3x4
 oG5dmfSK8ojg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,280,1613462400"; 
   d="scan'208";a="540300552"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 May 2021 03:35:03 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lexp0-000B9a-Dq; Fri, 07 May 2021 10:35:02 +0000
Date:   Fri, 07 May 2021 18:34:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 05665cef4b745cb46b1d1b8e96deaa25464092d3
Message-ID: <609517a9.XlcdWd/oYuXfwFyD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 05665cef4b745cb46b1d1b8e96deaa25464092d3  Input: xpad - add support for Amazon Game Controller

elapsed time: 727m

configs tested: 124
configs skipped: 2

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
i386                             allyesconfig
riscv                            allyesconfig
arm                       imx_v4_v5_defconfig
parisc                           alldefconfig
m68k                         amcore_defconfig
microblaze                          defconfig
mips                     cu1000-neo_defconfig
arm                     am200epdkit_defconfig
um                            kunit_defconfig
powerpc                     ppa8548_defconfig
arm                          imote2_defconfig
powerpc                 mpc834x_itx_defconfig
sh                          r7780mp_defconfig
arm                         palmz72_defconfig
powerpc                 mpc834x_mds_defconfig
arm                              alldefconfig
mips                         bigsur_defconfig
arm                           sama5_defconfig
m68k                       m5249evb_defconfig
arm                      integrator_defconfig
sh                      rts7751r2d1_defconfig
mips                     loongson1c_defconfig
sparc64                          alldefconfig
sh                           se7722_defconfig
arm                       mainstone_defconfig
powerpc                 mpc8272_ads_defconfig
arm                         nhk8815_defconfig
sh                          sdk7780_defconfig
powerpc                     rainier_defconfig
powerpc                      katmai_defconfig
powerpc                        warp_defconfig
microblaze                      mmu_defconfig
ia64                        generic_defconfig
mips                        bcm47xx_defconfig
arm                          exynos_defconfig
m68k                                defconfig
mips                     cu1830-neo_defconfig
arc                            hsdk_defconfig
arm                        realview_defconfig
m68k                       m5275evb_defconfig
arm                       multi_v4t_defconfig
powerpc                    sam440ep_defconfig
sh                 kfr2r09-romimage_defconfig
mips                         cobalt_defconfig
mips                           ip22_defconfig
xtensa                generic_kc705_defconfig
powerpc                   currituck_defconfig
powerpc                     stx_gp3_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210506
i386                 randconfig-a006-20210506
i386                 randconfig-a001-20210506
i386                 randconfig-a005-20210506
i386                 randconfig-a004-20210506
i386                 randconfig-a002-20210506
x86_64               randconfig-a014-20210506
x86_64               randconfig-a015-20210506
x86_64               randconfig-a012-20210506
x86_64               randconfig-a013-20210506
x86_64               randconfig-a011-20210506
x86_64               randconfig-a016-20210506
i386                 randconfig-a015-20210506
i386                 randconfig-a013-20210506
i386                 randconfig-a016-20210506
i386                 randconfig-a014-20210506
i386                 randconfig-a012-20210506
i386                 randconfig-a011-20210506
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
x86_64               randconfig-a001-20210506
x86_64               randconfig-a003-20210506
x86_64               randconfig-a005-20210506
x86_64               randconfig-a002-20210506
x86_64               randconfig-a006-20210506
x86_64               randconfig-a004-20210506

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
