Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6FEF2F34B3
	for <lists+linux-input@lfdr.de>; Tue, 12 Jan 2021 16:56:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392022AbhALPxE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jan 2021 10:53:04 -0500
Received: from mga06.intel.com ([134.134.136.31]:53248 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391882AbhALPxD (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jan 2021 10:53:03 -0500
IronPort-SDR: VqVRDU/XJQG/AWlG1i0lcuCkKemp15Ej+NDGwrQeDVoKO0cpV4HBbzlqNEem72cLcOSGrL7uZw
 qxIy9L5aN3+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="239600841"
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; 
   d="scan'208";a="239600841"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2021 07:52:20 -0800
IronPort-SDR: cqWCPZ4UjbB/vNGbv1ZJj5nK9fuu8NJb+gZfYf1HUhzvnSpgWncgr0LW5oo/rswwAal/WcmUFK
 /NjapWUbJVqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; 
   d="scan'208";a="464565853"
Received: from lkp-server01.sh.intel.com (HELO b73930e00c65) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2021 07:52:19 -0800
Received: from kbuild by b73930e00c65 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kzLxz-0000Hq-0A; Tue, 12 Jan 2021 15:52:19 +0000
Date:   Tue, 12 Jan 2021 23:52:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 5d06f72dc29c16a4868dd7ea0a6122454267809b
Message-ID: <5ffdc5a0.hxhbJpgCHvBjvTv5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  for-linus
branch HEAD: 5d06f72dc29c16a4868dd7ea0a6122454267809b  Input: ariel-pwrbutton - remove unused variable ariel_pwrbutton_id_table

elapsed time: 723m

configs tested: 235
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                          hp300_defconfig
arm                         bcm2835_defconfig
openrisc                            defconfig
mips                           rs90_defconfig
arm                          iop32x_defconfig
sh                           se7206_defconfig
sh                               allmodconfig
um                            kunit_defconfig
powerpc                       ebony_defconfig
c6x                         dsk6455_defconfig
mips                         tb0226_defconfig
mips                         rt305x_defconfig
mips                           ip27_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                             rpc_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                   motionpro_defconfig
c6x                        evmc6678_defconfig
m68k                       m5275evb_defconfig
h8300                               defconfig
sh                          r7785rp_defconfig
arm                         s5pv210_defconfig
sparc                       sparc32_defconfig
mips                           jazz_defconfig
powerpc                      cm5200_defconfig
arm                            xcep_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                     ep8248e_defconfig
mips                    maltaup_xpa_defconfig
arm                          collie_defconfig
arc                     nsimosci_hs_defconfig
sh                          sdk7786_defconfig
arm                         mv78xx0_defconfig
arm                          tango4_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                      walnut_defconfig
mips                           mtx1_defconfig
powerpc                      arches_defconfig
powerpc                      ppc6xx_defconfig
arm                            lart_defconfig
arm                         lubbock_defconfig
arm                     am200epdkit_defconfig
mips                        bcm47xx_defconfig
ia64                      gensparse_defconfig
arm                      tct_hammer_defconfig
m68k                          atari_defconfig
arm                         lpc32xx_defconfig
sh                           sh2007_defconfig
h8300                     edosk2674_defconfig
arm                           h5000_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                        bcm63xx_defconfig
mips                         tb0219_defconfig
sh                           se7712_defconfig
m68k                          sun3x_defconfig
mips                  decstation_64_defconfig
arm                         orion5x_defconfig
arm                         cm_x300_defconfig
sh                      rts7751r2d1_defconfig
arm                          moxart_defconfig
openrisc                  or1klitex_defconfig
arm                        magician_defconfig
powerpc                  mpc885_ads_defconfig
sh                        sh7763rdp_defconfig
sh                     magicpanelr2_defconfig
sh                                  defconfig
mips                      malta_kvm_defconfig
sh                ecovec24-romimage_defconfig
mips                        maltaup_defconfig
sh                        dreamcast_defconfig
nios2                         3c120_defconfig
sh                             espt_defconfig
mips                        qi_lb60_defconfig
arm                      footbridge_defconfig
powerpc                 canyonlands_defconfig
arm                           h3600_defconfig
m68k                         amcore_defconfig
sh                            shmin_defconfig
c6x                        evmc6472_defconfig
sh                              ul2_defconfig
powerpc                     mpc5200_defconfig
sh                           se7724_defconfig
mips                         db1xxx_defconfig
xtensa                       common_defconfig
arm                        oxnas_v6_defconfig
mips                         tb0287_defconfig
powerpc                      ep88xc_defconfig
m68k                       m5249evb_defconfig
powerpc                     rainier_defconfig
sh                   secureedge5410_defconfig
arm                        vexpress_defconfig
sh                           se7722_defconfig
powerpc                 mpc834x_itx_defconfig
csky                             alldefconfig
arm                           omap1_defconfig
mips                         cobalt_defconfig
mips                malta_kvm_guest_defconfig
powerpc                      ppc64e_defconfig
arm                         vf610m4_defconfig
m68k                           sun3_defconfig
m68k                       bvme6000_defconfig
arm                        cerfcube_defconfig
sh                             shx3_defconfig
arm                         axm55xx_defconfig
arm                            pleb_defconfig
sh                        sh7785lcr_defconfig
arm                        multi_v7_defconfig
arm                          prima2_defconfig
arm                           stm32_defconfig
arc                           tb10x_defconfig
arc                              alldefconfig
mips                 decstation_r4k_defconfig
powerpc                      mgcoge_defconfig
powerpc                       ppc64_defconfig
mips                       rbtx49xx_defconfig
powerpc                      makalu_defconfig
arm                       cns3420vb_defconfig
parisc                generic-32bit_defconfig
powerpc                      bamboo_defconfig
arm                          ixp4xx_defconfig
arm                           efm32_defconfig
nios2                            alldefconfig
mips                  maltasmvp_eva_defconfig
powerpc                     sbc8548_defconfig
arm                         palmz72_defconfig
arm                        mvebu_v7_defconfig
arm                         hackkit_defconfig
arm                              zx_defconfig
powerpc                          g5_defconfig
m68k                            mac_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
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
parisc                              defconfig
s390                             allyesconfig
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
x86_64               randconfig-a004-20210111
x86_64               randconfig-a006-20210111
x86_64               randconfig-a001-20210111
x86_64               randconfig-a003-20210111
x86_64               randconfig-a005-20210111
x86_64               randconfig-a002-20210111
i386                 randconfig-a002-20210111
i386                 randconfig-a005-20210111
i386                 randconfig-a006-20210111
i386                 randconfig-a001-20210111
i386                 randconfig-a003-20210111
i386                 randconfig-a004-20210111
i386                 randconfig-a002-20210112
i386                 randconfig-a005-20210112
i386                 randconfig-a006-20210112
i386                 randconfig-a003-20210112
i386                 randconfig-a001-20210112
i386                 randconfig-a004-20210112
i386                 randconfig-a002-20210110
i386                 randconfig-a005-20210110
i386                 randconfig-a006-20210110
i386                 randconfig-a001-20210110
i386                 randconfig-a003-20210110
i386                 randconfig-a004-20210110
x86_64               randconfig-a015-20210112
x86_64               randconfig-a012-20210112
x86_64               randconfig-a013-20210112
x86_64               randconfig-a016-20210112
x86_64               randconfig-a014-20210112
x86_64               randconfig-a011-20210112
i386                 randconfig-a012-20210111
i386                 randconfig-a011-20210111
i386                 randconfig-a016-20210111
i386                 randconfig-a015-20210111
i386                 randconfig-a013-20210111
i386                 randconfig-a014-20210111
i386                 randconfig-a012-20210112
i386                 randconfig-a011-20210112
i386                 randconfig-a016-20210112
i386                 randconfig-a013-20210112
i386                 randconfig-a015-20210112
i386                 randconfig-a014-20210112
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
x86_64               randconfig-a006-20210112
x86_64               randconfig-a004-20210112
x86_64               randconfig-a001-20210112
x86_64               randconfig-a005-20210112
x86_64               randconfig-a003-20210112
x86_64               randconfig-a002-20210112
x86_64               randconfig-a015-20210111
x86_64               randconfig-a012-20210111
x86_64               randconfig-a013-20210111
x86_64               randconfig-a016-20210111
x86_64               randconfig-a014-20210111
x86_64               randconfig-a011-20210111

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
