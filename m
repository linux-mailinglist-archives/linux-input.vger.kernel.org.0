Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E34435B05B
	for <lists+linux-input@lfdr.de>; Sat, 10 Apr 2021 22:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234708AbhDJUSR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Apr 2021 16:18:17 -0400
Received: from mga12.intel.com ([192.55.52.136]:26366 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234548AbhDJUSR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Apr 2021 16:18:17 -0400
IronPort-SDR: wcOQcuJoi3fDvSoN1+oFjXOqJMQ8Xtbcs9K/yuUtm23apkgfzPis6/PAgl7vygczWgPagFaQPA
 gB+t/PwIgpJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9950"; a="173444131"
X-IronPort-AV: E=Sophos;i="5.82,212,1613462400"; 
   d="scan'208";a="173444131"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2021 13:18:02 -0700
IronPort-SDR: paqr/rAhdSULvx7qTizCFFmlyp2k41ZpYu5b+jOuLpp7mkY21lZ7xcbrOlxMLvDvolo0ej6nKr
 j15UbV/wJHpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,212,1613462400"; 
   d="scan'208";a="423215716"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Apr 2021 13:18:01 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lVK3M-000Iac-Ap; Sat, 10 Apr 2021 20:18:00 +0000
Date:   Sun, 11 Apr 2021 04:17:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 dadf1fd8807e61b1b1744836c96f48eb9ad56f5b
Message-ID: <607207dd.Y88TFWqg6c+CETz7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: dadf1fd8807e61b1b1744836c96f48eb9ad56f5b  Input: cyttsp - flag the device properly

elapsed time: 720m

configs tested: 169
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
sh                           se7750_defconfig
powerpc                       ebony_defconfig
mips                           xway_defconfig
powerpc                     mpc83xx_defconfig
ia64                      gensparse_defconfig
arm                          simpad_defconfig
powerpc                    klondike_defconfig
mips                           rs90_defconfig
powerpc                     taishan_defconfig
arm                            hisi_defconfig
arm                     am200epdkit_defconfig
arm                          gemini_defconfig
powerpc                     ep8248e_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                    socrates_defconfig
sh                           se7751_defconfig
arm                         s3c6400_defconfig
sh                         apsh4a3a_defconfig
mips                        bcm63xx_defconfig
powerpc                      tqm8xx_defconfig
openrisc                         alldefconfig
arm                            mmp2_defconfig
um                             i386_defconfig
powerpc64                           defconfig
sh                             espt_defconfig
arm                         vf610m4_defconfig
mips                          rb532_defconfig
mips                            gpr_defconfig
arc                     haps_hs_smp_defconfig
arm                             mxs_defconfig
powerpc                      arches_defconfig
mips                         tb0287_defconfig
mips                         tb0219_defconfig
sh                          urquell_defconfig
arm                        spear6xx_defconfig
sh                            titan_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                 mpc836x_rdk_defconfig
m68k                       m5249evb_defconfig
ia64                            zx1_defconfig
arm                          ixp4xx_defconfig
powerpc                   bluestone_defconfig
mips                      loongson3_defconfig
m68k                          multi_defconfig
arc                                 defconfig
arc                          axs101_defconfig
sh                          sdk7780_defconfig
s390                             allyesconfig
arm                          badge4_defconfig
openrisc                 simple_smp_defconfig
arm                         shannon_defconfig
mips                malta_kvm_guest_defconfig
arm                        multi_v5_defconfig
sh                           se7619_defconfig
powerpc                      mgcoge_defconfig
m68k                        m5407c3_defconfig
csky                                defconfig
i386                                defconfig
arm                        vexpress_defconfig
sh                        dreamcast_defconfig
sh                               alldefconfig
mips                     loongson1b_defconfig
arm                            pleb_defconfig
arm                          collie_defconfig
powerpc                 mpc837x_rdb_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210410
i386                 randconfig-a001-20210410
i386                 randconfig-a006-20210410
i386                 randconfig-a005-20210410
i386                 randconfig-a004-20210410
i386                 randconfig-a002-20210410
i386                 randconfig-a006-20210409
i386                 randconfig-a003-20210409
i386                 randconfig-a001-20210409
i386                 randconfig-a004-20210409
i386                 randconfig-a002-20210409
i386                 randconfig-a005-20210409
x86_64               randconfig-a014-20210409
x86_64               randconfig-a015-20210409
x86_64               randconfig-a012-20210409
x86_64               randconfig-a011-20210409
x86_64               randconfig-a013-20210409
x86_64               randconfig-a016-20210409
x86_64               randconfig-a014-20210410
x86_64               randconfig-a015-20210410
x86_64               randconfig-a011-20210410
x86_64               randconfig-a013-20210410
x86_64               randconfig-a012-20210410
x86_64               randconfig-a016-20210410
i386                 randconfig-a014-20210409
i386                 randconfig-a011-20210409
i386                 randconfig-a016-20210409
i386                 randconfig-a012-20210409
i386                 randconfig-a013-20210409
i386                 randconfig-a015-20210409
i386                 randconfig-a015-20210411
i386                 randconfig-a014-20210411
i386                 randconfig-a013-20210411
i386                 randconfig-a012-20210411
i386                 randconfig-a016-20210411
i386                 randconfig-a011-20210411
i386                 randconfig-a015-20210410
i386                 randconfig-a014-20210410
i386                 randconfig-a013-20210410
i386                 randconfig-a012-20210410
i386                 randconfig-a016-20210410
i386                 randconfig-a011-20210410
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
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin

clang tested configs:
x86_64               randconfig-a003-20210410
x86_64               randconfig-a002-20210410
x86_64               randconfig-a001-20210410
x86_64               randconfig-a005-20210410
x86_64               randconfig-a006-20210410
x86_64               randconfig-a004-20210410
x86_64               randconfig-a004-20210409
x86_64               randconfig-a005-20210409
x86_64               randconfig-a003-20210409
x86_64               randconfig-a001-20210409
x86_64               randconfig-a002-20210409
x86_64               randconfig-a006-20210409

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
