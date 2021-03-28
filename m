Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6AE434BD74
	for <lists+linux-input@lfdr.de>; Sun, 28 Mar 2021 19:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbhC1RN1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 28 Mar 2021 13:13:27 -0400
Received: from mga12.intel.com ([192.55.52.136]:57597 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229538AbhC1RNU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 28 Mar 2021 13:13:20 -0400
IronPort-SDR: kX/p/w+hM/FFWZeNXl1jKTkqO990a/ct1mPiDhdmCq6Tb+6W0DyndpexgHBZ2o1qFNqg65SjNF
 zHPdUVcuI9hw==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="170819033"
X-IronPort-AV: E=Sophos;i="5.81,285,1610438400"; 
   d="scan'208";a="170819033"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2021 10:13:20 -0700
IronPort-SDR: qLl4fZeQkZRZZGdbAKgW7iLs5kw1Y7PGDCObFZhOZLso9W/ihg2iXaiiFRiyeWvz+3QIZIUvIC
 Z2uCNutERIQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,285,1610438400"; 
   d="scan'208";a="515712862"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Mar 2021 10:13:19 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lQYyU-00046I-Mg; Sun, 28 Mar 2021 17:13:18 +0000
Date:   Mon, 29 Mar 2021 01:12:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 781bab3238c21c8cc6d1999a6ee43de76252fdfd
Message-ID: <6060b911.MzrI8DWlWvtFgUZ+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 781bab3238c21c8cc6d1999a6ee43de76252fdfd  Input: elants_i2c - fix division by zero if firmware reports zero phys size

elapsed time: 726m

configs tested: 97
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
riscv                            allyesconfig
arm                         at91_dt_defconfig
parisc                generic-64bit_defconfig
powerpc                  storcenter_defconfig
arm                          ep93xx_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                      mgcoge_defconfig
powerpc                      walnut_defconfig
mips                     cu1000-neo_defconfig
arm                            mmp2_defconfig
arm                         palmz72_defconfig
um                                  defconfig
arm                         axm55xx_defconfig
arm                      integrator_defconfig
powerpc                     tqm8541_defconfig
arm                      tct_hammer_defconfig
powerpc                          g5_defconfig
powerpc                     mpc512x_defconfig
mips                          ath79_defconfig
mips                      maltaaprp_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20210328
i386                 randconfig-a003-20210328
i386                 randconfig-a001-20210328
i386                 randconfig-a002-20210328
i386                 randconfig-a006-20210328
i386                 randconfig-a005-20210328
x86_64               randconfig-a015-20210328
x86_64               randconfig-a012-20210328
x86_64               randconfig-a013-20210328
x86_64               randconfig-a014-20210328
x86_64               randconfig-a016-20210328
x86_64               randconfig-a011-20210328
i386                 randconfig-a014-20210328
i386                 randconfig-a011-20210328
i386                 randconfig-a015-20210328
i386                 randconfig-a016-20210328
i386                 randconfig-a013-20210328
i386                 randconfig-a012-20210328
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210328
x86_64               randconfig-a003-20210328
x86_64               randconfig-a001-20210328
x86_64               randconfig-a006-20210328
x86_64               randconfig-a005-20210328
x86_64               randconfig-a004-20210328

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
