Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18C572CE5A9
	for <lists+linux-input@lfdr.de>; Fri,  4 Dec 2020 03:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbgLDCYd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Dec 2020 21:24:33 -0500
Received: from mga06.intel.com ([134.134.136.31]:25803 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbgLDCYb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 3 Dec 2020 21:24:31 -0500
IronPort-SDR: xyEaIlCLONstWhtjGztmMMbmajwHcPYuYDt+E4E0NRA4FYZNhn7ylk7lvv9VymiUSdFa+becf0
 lEHuVR3Q2dHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9824"; a="234921550"
X-IronPort-AV: E=Sophos;i="5.78,391,1599548400"; 
   d="scan'208";a="234921550"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2020 18:23:35 -0800
IronPort-SDR: S+wkUTSnFM7g4YZfX5yjRpgXRdEP3l0gK7HY+uFTpsa0CwG2+v2AysAsiAolJEjAewGjqpnYje
 wiEmFGZAHXGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,391,1599548400"; 
   d="scan'208";a="336186698"
Received: from lkp-server01.sh.intel.com (HELO 14e4acb3e84f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Dec 2020 18:23:34 -0800
Received: from kbuild by 14e4acb3e84f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kl0kv-00001A-C0; Fri, 04 Dec 2020 02:23:33 +0000
Date:   Fri, 04 Dec 2020 10:22:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 6d59224fdcc532dd7292e3657d796b3728ec1e8e
Message-ID: <5fc99d6b.es4yYoENt8WaZ/ag%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  master
branch HEAD: 6d59224fdcc532dd7292e3657d796b3728ec1e8e  Input: document inhibiting

elapsed time: 1197m

configs tested: 153
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                             pxa_defconfig
arm                           h3600_defconfig
arm                          tango4_defconfig
powerpc                 mpc837x_mds_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                   motionpro_defconfig
mips                     cu1830-neo_defconfig
sh                        sh7763rdp_defconfig
powerpc                   lite5200b_defconfig
powerpc                     sbc8548_defconfig
arm                      footbridge_defconfig
h8300                       h8s-sim_defconfig
arm                       aspeed_g4_defconfig
powerpc                    klondike_defconfig
arm                       imx_v6_v7_defconfig
arc                           tb10x_defconfig
powerpc                 mpc8315_rdb_defconfig
sh                          r7780mp_defconfig
sh                           se7712_defconfig
riscv                               defconfig
arc                         haps_hs_defconfig
arm                            mmp2_defconfig
xtensa                  audio_kc705_defconfig
m68k                          multi_defconfig
m68k                             alldefconfig
arm                         socfpga_defconfig
mips                     loongson1b_defconfig
sh                ecovec24-romimage_defconfig
m68k                       m5275evb_defconfig
arm                          moxart_defconfig
c6x                                 defconfig
xtensa                       common_defconfig
sh                                  defconfig
sh                          r7785rp_defconfig
powerpc                      arches_defconfig
arm                            xcep_defconfig
arm                            hisi_defconfig
arm                             ezx_defconfig
arm                      pxa255-idp_defconfig
arm                          iop32x_defconfig
sh                           se7343_defconfig
mips                           ip32_defconfig
powerpc                 canyonlands_defconfig
powerpc                      obs600_defconfig
sh                             sh03_defconfig
mips                           rs90_defconfig
sh                        sh7757lcr_defconfig
sh                           se7721_defconfig
nios2                            allyesconfig
mips                      malta_kvm_defconfig
arm                          pcm027_defconfig
mips                         tb0226_defconfig
sh                            titan_defconfig
arm                           omap1_defconfig
arm                       multi_v4t_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                    socrates_defconfig
m68k                          atari_defconfig
powerpc                   currituck_defconfig
arm                          badge4_defconfig
mips                           ci20_defconfig
sh                   sh7724_generic_defconfig
arm                         bcm2835_defconfig
mips                         mpc30x_defconfig
powerpc                     tqm8560_defconfig
powerpc                     skiroot_defconfig
arm                        multi_v5_defconfig
mips                  decstation_64_defconfig
ia64                            zx1_defconfig
xtensa                           alldefconfig
powerpc                          allyesconfig
arm                        magician_defconfig
m68k                                defconfig
powerpc                           allnoconfig
arm                     davinci_all_defconfig
s390                          debug_defconfig
powerpc                     tqm8555_defconfig
powerpc                     ppa8548_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                             espt_defconfig
powerpc                      cm5200_defconfig
powerpc                      makalu_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
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
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
i386                 randconfig-a004-20201203
i386                 randconfig-a005-20201203
i386                 randconfig-a001-20201203
i386                 randconfig-a002-20201203
i386                 randconfig-a006-20201203
i386                 randconfig-a003-20201203
x86_64               randconfig-a016-20201203
x86_64               randconfig-a012-20201203
x86_64               randconfig-a014-20201203
x86_64               randconfig-a013-20201203
x86_64               randconfig-a015-20201203
x86_64               randconfig-a011-20201203
i386                 randconfig-a014-20201203
i386                 randconfig-a013-20201203
i386                 randconfig-a011-20201203
i386                 randconfig-a015-20201203
i386                 randconfig-a012-20201203
i386                 randconfig-a016-20201203
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201203
x86_64               randconfig-a006-20201203
x86_64               randconfig-a001-20201203
x86_64               randconfig-a002-20201203
x86_64               randconfig-a005-20201203
x86_64               randconfig-a003-20201203

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
