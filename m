Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6738B2DAD67
	for <lists+linux-input@lfdr.de>; Tue, 15 Dec 2020 13:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbgLOMmd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Dec 2020 07:42:33 -0500
Received: from mga01.intel.com ([192.55.52.88]:3067 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728494AbgLOMmc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Dec 2020 07:42:32 -0500
IronPort-SDR: NZp0oJ00bOa5BQ7l5IxN2OoOxob5MPDFD66hJRx3pWlQ5GtHWKTT4B1CPkFhSnRilZTRgj0jEq
 mZHWmBlVUdZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="193242278"
X-IronPort-AV: E=Sophos;i="5.78,421,1599548400"; 
   d="scan'208";a="193242278"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2020 04:41:50 -0800
IronPort-SDR: Jjj1vhflXd2X6vQkXDKBeakeNf3/v7d1V/JIXR2LbUJXYDnod6omnXdm5jjMYIxohKJK34OdyV
 xs8bmDqqWOxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,421,1599548400"; 
   d="scan'208";a="411889414"
Received: from lkp-server02.sh.intel.com (HELO a947d92d0467) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Dec 2020 04:41:49 -0800
Received: from kbuild by a947d92d0467 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kp9eG-0000kE-Ta; Tue, 15 Dec 2020 12:41:48 +0000
Date:   Tue, 15 Dec 2020 20:41:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 4b4193256c8d3bc3a5397b5cd9494c2ad386317d
Message-ID: <5fd8aef6.ZS894zkqRTm5kbZp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  for-linus
branch HEAD: 4b4193256c8d3bc3a5397b5cd9494c2ad386317d  Merge branch 'next' into for-linus

elapsed time: 723m

configs tested: 166
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                       maple_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                       ebony_defconfig
sh                   secureedge5410_defconfig
m68k                             allmodconfig
mips                        nlm_xlp_defconfig
arm                      pxa255-idp_defconfig
mips                    maltaup_xpa_defconfig
mips                          rb532_defconfig
arm                          badge4_defconfig
arc                          axs101_defconfig
sh                           se7206_defconfig
arm                              zx_defconfig
powerpc                      arches_defconfig
arc                              alldefconfig
powerpc                     kmeter1_defconfig
arm                      tct_hammer_defconfig
arm                       cns3420vb_defconfig
mips                      pistachio_defconfig
arc                        nsimosci_defconfig
mips                         rt305x_defconfig
alpha                            allyesconfig
h8300                       h8s-sim_defconfig
arm                     eseries_pxa_defconfig
sparc                            allyesconfig
m68k                          amiga_defconfig
arm                            dove_defconfig
powerpc                     akebono_defconfig
arc                                 defconfig
mips                         db1xxx_defconfig
mips                        vocore2_defconfig
h8300                     edosk2674_defconfig
sh                          sdk7780_defconfig
m68k                           sun3_defconfig
arm                            u300_defconfig
i386                             alldefconfig
arc                            hsdk_defconfig
m68k                          sun3x_defconfig
powerpc                      acadia_defconfig
arm                          pxa168_defconfig
arm                       omap2plus_defconfig
m68k                             alldefconfig
arm                         socfpga_defconfig
sparc64                             defconfig
arm                      footbridge_defconfig
sh                          rsk7264_defconfig
powerpc                      obs600_defconfig
mips                     cu1000-neo_defconfig
csky                                defconfig
sh                   rts7751r2dplus_defconfig
i386                             allyesconfig
nds32                             allnoconfig
arm                        realview_defconfig
sh                            hp6xx_defconfig
sh                          rsk7203_defconfig
xtensa                    smp_lx200_defconfig
sh                        edosk7705_defconfig
sh                          rsk7201_defconfig
powerpc                         ps3_defconfig
sh                ecovec24-romimage_defconfig
sh                   sh7770_generic_defconfig
mips                     loongson1b_defconfig
sh                             sh03_defconfig
x86_64                           alldefconfig
mips                      bmips_stb_defconfig
mips                     loongson1c_defconfig
powerpc                      pmac32_defconfig
xtensa                         virt_defconfig
sh                        edosk7760_defconfig
mips                       capcella_defconfig
sh                          lboxre2_defconfig
sh                          sdk7786_defconfig
sh                            titan_defconfig
powerpc                    gamecube_defconfig
c6x                        evmc6472_defconfig
powerpc                          g5_defconfig
powerpc                   currituck_defconfig
arm                           sunxi_defconfig
sh                         ap325rxa_defconfig
sh                         microdev_defconfig
powerpc64                        alldefconfig
mips                 decstation_r4k_defconfig
mips                  cavium_octeon_defconfig
sh                   sh7724_generic_defconfig
sh                         apsh4a3a_defconfig
h8300                               defconfig
sh                           se7619_defconfig
arm                           corgi_defconfig
parisc                           alldefconfig
mips                      pic32mzda_defconfig
mips                           xway_defconfig
arm                         mv78xx0_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20201214
i386                 randconfig-a004-20201214
i386                 randconfig-a003-20201214
i386                 randconfig-a002-20201214
i386                 randconfig-a006-20201214
i386                 randconfig-a005-20201214
x86_64               randconfig-a016-20201214
x86_64               randconfig-a012-20201214
x86_64               randconfig-a013-20201214
x86_64               randconfig-a015-20201214
x86_64               randconfig-a014-20201214
x86_64               randconfig-a011-20201214
i386                 randconfig-a014-20201214
i386                 randconfig-a013-20201214
i386                 randconfig-a012-20201214
i386                 randconfig-a011-20201214
i386                 randconfig-a015-20201214
i386                 randconfig-a016-20201214
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20201214
x86_64               randconfig-a006-20201214
x86_64               randconfig-a002-20201214
x86_64               randconfig-a005-20201214
x86_64               randconfig-a004-20201214
x86_64               randconfig-a001-20201214
x86_64               randconfig-a016-20201215
x86_64               randconfig-a012-20201215
x86_64               randconfig-a013-20201215
x86_64               randconfig-a015-20201215
x86_64               randconfig-a014-20201215
x86_64               randconfig-a011-20201215

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
