Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19DC4368CAE
	for <lists+linux-input@lfdr.de>; Fri, 23 Apr 2021 07:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbhDWFbv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Apr 2021 01:31:51 -0400
Received: from mga09.intel.com ([134.134.136.24]:33001 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229456AbhDWFbv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Apr 2021 01:31:51 -0400
IronPort-SDR: x3+RnuS/lPyDFliWFqv4GJ/IHE5qvYFGnILs++JRL2IbWMFFtn6XglmJOQR2EK1dhXYdpWtMwy
 iHO2Bj2geh9Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="196131199"
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; 
   d="scan'208";a="196131199"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2021 22:31:14 -0700
IronPort-SDR: NIuPhvEs9/wZX6M+TbA/bO2pQ4db0KKUPj2yQKQUAyJvUvqh5pmWSgp/xHn23R8LwoJng2bZYN
 7yGv5KmRi65w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,244,1613462400"; 
   d="scan'208";a="384999314"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Apr 2021 22:31:13 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lZoPI-0004Xk-M4; Fri, 23 Apr 2021 05:31:12 +0000
Date:   Fri, 23 Apr 2021 13:30:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 d12b64b9764ea17554fb230784ebf91287ed807e
Message-ID: <60825b7a.rfY+pDDHSWiJQF4d%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: d12b64b9764ea17554fb230784ebf91287ed807e  MAINTAINERS: repair reference in HYCON HY46XX TOUCHSCREEN SUPPORT

elapsed time: 721m

configs tested: 227
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
i386                             allyesconfig
powerpc                       ebony_defconfig
powerpc                      cm5200_defconfig
um                             i386_defconfig
arm                      jornada720_defconfig
arm                              alldefconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     redwood_defconfig
m68k                          atari_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                           spitz_defconfig
xtensa                  audio_kc705_defconfig
powerpc                      acadia_defconfig
ia64                             allyesconfig
um                           x86_64_defconfig
sh                            titan_defconfig
powerpc                  storcenter_defconfig
powerpc                 mpc834x_mds_defconfig
riscv                             allnoconfig
powerpc                      ep88xc_defconfig
arc                      axs103_smp_defconfig
powerpc                 linkstation_defconfig
arm                         s5pv210_defconfig
sparc                       sparc32_defconfig
sh                              ul2_defconfig
m68k                         apollo_defconfig
sh                   sh7770_generic_defconfig
um                               allyesconfig
mips                            e55_defconfig
sh                        sh7757lcr_defconfig
sh                          lboxre2_defconfig
nios2                            alldefconfig
mips                         bigsur_defconfig
arm                           h3600_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                       maple_defconfig
nds32                             allnoconfig
arm                       aspeed_g5_defconfig
m68k                       m5275evb_defconfig
arc                     nsimosci_hs_defconfig
arm                     eseries_pxa_defconfig
parisc                           alldefconfig
powerpc                      mgcoge_defconfig
mips                        omega2p_defconfig
arm                          exynos_defconfig
arm                          gemini_defconfig
sh                          rsk7269_defconfig
arc                            hsdk_defconfig
arm                       versatile_defconfig
arm                        cerfcube_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                      chrp32_defconfig
sh                          sdk7786_defconfig
arm                       cns3420vb_defconfig
um                               alldefconfig
arm                          lpd270_defconfig
sh                           se7724_defconfig
arm                          pcm027_defconfig
sh                        apsh4ad0a_defconfig
arm                        magician_defconfig
ia64                            zx1_defconfig
mips                      maltasmvp_defconfig
sh                         microdev_defconfig
powerpc                 mpc832x_mds_defconfig
arm                       spear13xx_defconfig
ia64                             alldefconfig
arm                           sama5_defconfig
mips                malta_qemu_32r6_defconfig
mips                     cu1000-neo_defconfig
arm                           u8500_defconfig
sh                           se7343_defconfig
mips                           ip32_defconfig
xtensa                         virt_defconfig
openrisc                         alldefconfig
powerpc                     powernv_defconfig
powerpc                   currituck_defconfig
ia64                      gensparse_defconfig
sh                          kfr2r09_defconfig
sh                        sh7763rdp_defconfig
csky                             alldefconfig
powerpc                     kmeter1_defconfig
powerpc                  iss476-smp_defconfig
openrisc                  or1klitex_defconfig
mips                      pic32mzda_defconfig
nios2                            allyesconfig
mips                        maltaup_defconfig
mips                        vocore2_defconfig
arc                          axs101_defconfig
mips                     decstation_defconfig
arm                   milbeaut_m10v_defconfig
arm                         mv78xx0_defconfig
um                            kunit_defconfig
arm                       omap2plus_defconfig
powerpc                 mpc832x_rdb_defconfig
openrisc                    or1ksim_defconfig
h8300                       h8s-sim_defconfig
sparc                               defconfig
powerpc                     ep8248e_defconfig
mips                          rb532_defconfig
powerpc                     tqm8548_defconfig
powerpc                     mpc512x_defconfig
mips                         tb0287_defconfig
arm                         nhk8815_defconfig
arm                         at91_dt_defconfig
arm                         palmz72_defconfig
arm                            dove_defconfig
arm                           sunxi_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                      walnut_defconfig
powerpc                     rainier_defconfig
arm                           stm32_defconfig
powerpc                     mpc83xx_defconfig
arm                        trizeps4_defconfig
powerpc                         ps3_defconfig
arm                    vt8500_v6_v7_defconfig
nios2                         3c120_defconfig
arm                        neponset_defconfig
arm                      tct_hammer_defconfig
m68k                        mvme16x_defconfig
ia64                          tiger_defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210421
x86_64               randconfig-a002-20210421
x86_64               randconfig-a001-20210421
x86_64               randconfig-a005-20210421
x86_64               randconfig-a006-20210421
x86_64               randconfig-a003-20210421
x86_64               randconfig-a002-20210423
x86_64               randconfig-a004-20210423
x86_64               randconfig-a001-20210423
x86_64               randconfig-a005-20210423
x86_64               randconfig-a006-20210423
x86_64               randconfig-a003-20210423
i386                 randconfig-a005-20210421
i386                 randconfig-a002-20210421
i386                 randconfig-a001-20210421
i386                 randconfig-a006-20210421
i386                 randconfig-a004-20210421
i386                 randconfig-a003-20210421
i386                 randconfig-a005-20210423
i386                 randconfig-a002-20210423
i386                 randconfig-a001-20210423
i386                 randconfig-a006-20210423
i386                 randconfig-a004-20210423
i386                 randconfig-a003-20210423
x86_64               randconfig-a015-20210422
x86_64               randconfig-a016-20210422
x86_64               randconfig-a011-20210422
x86_64               randconfig-a014-20210422
x86_64               randconfig-a012-20210422
x86_64               randconfig-a013-20210422
i386                 randconfig-a012-20210421
i386                 randconfig-a014-20210421
i386                 randconfig-a011-20210421
i386                 randconfig-a013-20210421
i386                 randconfig-a015-20210421
i386                 randconfig-a016-20210421
i386                 randconfig-a014-20210423
i386                 randconfig-a012-20210423
i386                 randconfig-a011-20210423
i386                 randconfig-a013-20210423
i386                 randconfig-a015-20210423
i386                 randconfig-a016-20210423
i386                 randconfig-a014-20210422
i386                 randconfig-a012-20210422
i386                 randconfig-a011-20210422
i386                 randconfig-a013-20210422
i386                 randconfig-a015-20210422
i386                 randconfig-a016-20210422
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210423
x86_64               randconfig-a016-20210423
x86_64               randconfig-a011-20210423
x86_64               randconfig-a014-20210423
x86_64               randconfig-a012-20210423
x86_64               randconfig-a013-20210423
x86_64               randconfig-a015-20210421
x86_64               randconfig-a016-20210421
x86_64               randconfig-a011-20210421
x86_64               randconfig-a014-20210421
x86_64               randconfig-a013-20210421
x86_64               randconfig-a012-20210421

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
