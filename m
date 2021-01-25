Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0404A303205
	for <lists+linux-input@lfdr.de>; Tue, 26 Jan 2021 03:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729467AbhAYP4K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Jan 2021 10:56:10 -0500
Received: from mga02.intel.com ([134.134.136.20]:62534 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730577AbhAYPv7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jan 2021 10:51:59 -0500
IronPort-SDR: 6eVvFC6QuTiJooKIiWPK8am97pXvuDf2fZitQvb6sPXIDutQ5cKT9a4fqSztvfHGWOHhRgiGjq
 6iLE4Y6LXJwg==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="166841800"
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; 
   d="scan'208";a="166841800"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 07:11:36 -0800
IronPort-SDR: X+R1pmPh6sO5+UbMF4EXad3PyUaTvXlRk412JNhPfYLSb0WDyJrg4QGhcqrnxS626X5fMMM92V
 S+DE6b97HF2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; 
   d="scan'208";a="368704977"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 25 Jan 2021 07:11:35 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l43Wg-0000Gd-SJ; Mon, 25 Jan 2021 15:11:34 +0000
Date:   Mon, 25 Jan 2021 23:10:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 9bbd77d5bbc9aff8cb74d805c31751f5f0691ba8
Message-ID: <600edf7a.GlxhSF/+r1Ss5Nhy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 9bbd77d5bbc9aff8cb74d805c31751f5f0691ba8  Input: xpad - sync supported devices with fork on GitHub

elapsed time: 726m

configs tested: 120
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
h8300                     edosk2674_defconfig
arm                         axm55xx_defconfig
c6x                                 defconfig
powerpc                 mpc832x_mds_defconfig
sparc                               defconfig
arm                       aspeed_g5_defconfig
mips                        qi_lb60_defconfig
mips                  decstation_64_defconfig
arm                  colibri_pxa300_defconfig
ia64                          tiger_defconfig
arm                         lpc32xx_defconfig
h8300                    h8300h-sim_defconfig
s390                       zfcpdump_defconfig
arm                        spear6xx_defconfig
x86_64                           alldefconfig
powerpc                     ksi8560_defconfig
arc                     nsimosci_hs_defconfig
arm                          pxa3xx_defconfig
arm                         hackkit_defconfig
arm                          pcm027_defconfig
sh                            shmin_defconfig
powerpc                     mpc512x_defconfig
arm                      integrator_defconfig
powerpc                      ep88xc_defconfig
arm                           omap1_defconfig
arc                           tb10x_defconfig
m68k                            mac_defconfig
sh                           se7619_defconfig
arm                           viper_defconfig
powerpc                      mgcoge_defconfig
powerpc                     ep8248e_defconfig
sh                        sh7763rdp_defconfig
arm                        mini2440_defconfig
arm                            mps2_defconfig
sh                        sh7757lcr_defconfig
m68k                       m5475evb_defconfig
c6x                        evmc6678_defconfig
ia64                             allyesconfig
powerpc                     tqm8560_defconfig
xtensa                  nommu_kc705_defconfig
mips                  cavium_octeon_defconfig
mips                           ip28_defconfig
arm                     eseries_pxa_defconfig
powerpc                 linkstation_defconfig
powerpc64                        alldefconfig
xtensa                  cadence_csp_defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210125
i386                 randconfig-a002-20210125
i386                 randconfig-a004-20210125
i386                 randconfig-a006-20210125
i386                 randconfig-a005-20210125
i386                 randconfig-a003-20210125
i386                 randconfig-a013-20210125
i386                 randconfig-a011-20210125
i386                 randconfig-a012-20210125
i386                 randconfig-a015-20210125
i386                 randconfig-a014-20210125
i386                 randconfig-a016-20210125
x86_64               randconfig-a003-20210125
x86_64               randconfig-a002-20210125
x86_64               randconfig-a001-20210125
x86_64               randconfig-a005-20210125
x86_64               randconfig-a006-20210125
x86_64               randconfig-a004-20210125
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
x86_64               randconfig-a012-20210125
x86_64               randconfig-a016-20210125
x86_64               randconfig-a015-20210125
x86_64               randconfig-a011-20210125
x86_64               randconfig-a013-20210125
x86_64               randconfig-a014-20210125

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
