Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD797334634
	for <lists+linux-input@lfdr.de>; Wed, 10 Mar 2021 19:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233336AbhCJSCA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Mar 2021 13:02:00 -0500
Received: from mga14.intel.com ([192.55.52.115]:10243 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233354AbhCJSBe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Mar 2021 13:01:34 -0500
IronPort-SDR: 2cTWrWZ/8d1fcxolMJW5p2w9C4doslKIqX2JRiVS2045YFbkkBNIF05JOrjuGZ5lTEqm8uFa1U
 obeSRjd4tM5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="187890329"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="187890329"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 10:01:32 -0800
IronPort-SDR: XXR8b4NtKqRvH6ciZiHKoABNMb/ih8Hkqqcry/jrnFzMxjsSDrIjBBE+RN/Hd0Xp35XzmZudq2
 +ljNBo8+Y2CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="370278397"
Received: from lkp-server02.sh.intel.com (HELO ce64c092ff93) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Mar 2021 10:01:29 -0800
Received: from kbuild by ce64c092ff93 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lK39D-0000Iu-CJ; Wed, 10 Mar 2021 18:01:27 +0000
Date:   Thu, 11 Mar 2021 02:00:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 2d8aaa1720c6128ce263a2afcd3f8ee2e5551af8
Message-ID: <60490958.EDF5GIOfjqWsVqe2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 2d8aaa1720c6128ce263a2afcd3f8ee2e5551af8  Input: n64joy - fix return value check in n64joy_probe()

elapsed time: 727m

configs tested: 118
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                             mxs_defconfig
sh                         microdev_defconfig
mips                       capcella_defconfig
arm                        mvebu_v7_defconfig
xtensa                  cadence_csp_defconfig
arm                         hackkit_defconfig
sh                               j2_defconfig
mips                        omega2p_defconfig
arm                       versatile_defconfig
sh                        sh7757lcr_defconfig
mips                         tb0219_defconfig
arm                        cerfcube_defconfig
powerpc                   currituck_defconfig
ia64                            zx1_defconfig
arm                          imote2_defconfig
i386                                defconfig
microblaze                          defconfig
powerpc                      ppc44x_defconfig
powerpc                 mpc836x_mds_defconfig
sh                          lboxre2_defconfig
sh                      rts7751r2d1_defconfig
powerpc                    ge_imp3a_defconfig
mips                     loongson1b_defconfig
h8300                            alldefconfig
mips                             allyesconfig
powerpc                 mpc832x_mds_defconfig
riscv                               defconfig
arm                         s3c2410_defconfig
mips                          ath79_defconfig
arm                  colibri_pxa300_defconfig
arm                         at91_dt_defconfig
arm                          pcm027_defconfig
arm                          ep93xx_defconfig
sh                          rsk7201_defconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210308
x86_64               randconfig-a001-20210308
x86_64               randconfig-a004-20210308
x86_64               randconfig-a002-20210308
x86_64               randconfig-a005-20210308
x86_64               randconfig-a003-20210308
i386                 randconfig-a005-20210309
i386                 randconfig-a003-20210309
i386                 randconfig-a002-20210309
i386                 randconfig-a006-20210309
i386                 randconfig-a004-20210309
i386                 randconfig-a001-20210309
i386                 randconfig-a005-20210308
i386                 randconfig-a003-20210308
i386                 randconfig-a002-20210308
i386                 randconfig-a006-20210308
i386                 randconfig-a004-20210308
i386                 randconfig-a001-20210308
x86_64               randconfig-a013-20210309
x86_64               randconfig-a016-20210309
x86_64               randconfig-a015-20210309
x86_64               randconfig-a014-20210309
x86_64               randconfig-a011-20210309
x86_64               randconfig-a012-20210309
i386                 randconfig-a016-20210309
i386                 randconfig-a012-20210309
i386                 randconfig-a014-20210309
i386                 randconfig-a013-20210309
i386                 randconfig-a011-20210309
i386                 randconfig-a015-20210309
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210309
x86_64               randconfig-a001-20210309
x86_64               randconfig-a004-20210309
x86_64               randconfig-a002-20210309
x86_64               randconfig-a005-20210309
x86_64               randconfig-a003-20210309

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
