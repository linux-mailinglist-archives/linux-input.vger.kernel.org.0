Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB7E0430507
	for <lists+linux-input@lfdr.de>; Sat, 16 Oct 2021 23:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235044AbhJPVV2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 16 Oct 2021 17:21:28 -0400
Received: from mga07.intel.com ([134.134.136.100]:10379 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230062AbhJPVV1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 16 Oct 2021 17:21:27 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10139"; a="291550796"
X-IronPort-AV: E=Sophos;i="5.85,378,1624345200"; 
   d="scan'208";a="291550796"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2021 14:19:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,378,1624345200"; 
   d="scan'208";a="482203156"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Oct 2021 14:19:17 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mbr5I-0009eo-SN; Sat, 16 Oct 2021 21:19:16 +0000
Date:   Sun, 17 Oct 2021 05:19:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 a88638c4e69cfcbfebc7523d777d1273f2fce806
Message-ID: <616b41c8.wR+hgPc6ctl5k0bC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: a88638c4e69cfcbfebc7523d777d1273f2fce806  Input: max8925_onkey - don't mark comment as kernel-doc

elapsed time: 907m

configs tested: 227
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211016
arm                          moxart_defconfig
sh                          rsk7264_defconfig
arm                           spitz_defconfig
powerpc                     skiroot_defconfig
powerpc                 mpc834x_mds_defconfig
sh                                  defconfig
riscv                            alldefconfig
mips                        maltaup_defconfig
arm                           tegra_defconfig
arm                          collie_defconfig
powerpc                      ep88xc_defconfig
powerpc                      pasemi_defconfig
powerpc                     sequoia_defconfig
xtensa                          iss_defconfig
mips                            gpr_defconfig
powerpc                       maple_defconfig
powerpc                      obs600_defconfig
arm                          pcm027_defconfig
powerpc64                        alldefconfig
arm                           h3600_defconfig
mips                       capcella_defconfig
riscv                               defconfig
arc                          axs101_defconfig
arm                        keystone_defconfig
powerpc                 canyonlands_defconfig
sh                           se7721_defconfig
arm                           sama7_defconfig
powerpc                     kmeter1_defconfig
ia64                             alldefconfig
powerpc                  iss476-smp_defconfig
sh                          landisk_defconfig
mips                     loongson1b_defconfig
mips                           xway_defconfig
ia64                        generic_defconfig
arm                           h5000_defconfig
nds32                            alldefconfig
arm                       mainstone_defconfig
mips                      maltasmvp_defconfig
mips                        nlm_xlp_defconfig
arc                         haps_hs_defconfig
arm                  colibri_pxa270_defconfig
sh                        edosk7705_defconfig
sh                 kfr2r09-romimage_defconfig
sh                        apsh4ad0a_defconfig
sparc                       sparc32_defconfig
m68k                        stmark2_defconfig
sh                         ap325rxa_defconfig
sh                           se7751_defconfig
m68k                        m5272c3_defconfig
arm                           viper_defconfig
sparc64                             defconfig
riscv                             allnoconfig
mips                            e55_defconfig
arm                  colibri_pxa300_defconfig
sh                   sh7724_generic_defconfig
arm                    vt8500_v6_v7_defconfig
arm                          pxa3xx_defconfig
arm                        magician_defconfig
arc                     haps_hs_smp_defconfig
sh                          kfr2r09_defconfig
sh                         apsh4a3a_defconfig
arm                       versatile_defconfig
arm                            zeus_defconfig
arm                         s5pv210_defconfig
mips                             allmodconfig
m68k                                defconfig
arm                         cm_x300_defconfig
powerpc                    gamecube_defconfig
powerpc                 mpc837x_mds_defconfig
mips                   sb1250_swarm_defconfig
arm                         socfpga_defconfig
m68k                           sun3_defconfig
h8300                            alldefconfig
arm                            xcep_defconfig
arm                         mv78xx0_defconfig
mips                         cobalt_defconfig
arm                        vexpress_defconfig
powerpc                 xes_mpc85xx_defconfig
microblaze                      mmu_defconfig
powerpc                   bluestone_defconfig
xtensa                    xip_kc705_defconfig
mips                     cu1000-neo_defconfig
openrisc                            defconfig
arm                      pxa255-idp_defconfig
s390                                defconfig
powerpc                     taishan_defconfig
arm                          iop32x_defconfig
arm                           sunxi_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                      tqm8xx_defconfig
sh                          sdk7786_defconfig
powerpc                      bamboo_defconfig
arm                          badge4_defconfig
powerpc                     asp8347_defconfig
sparc                       sparc64_defconfig
mips                     decstation_defconfig
m68k                       bvme6000_defconfig
mips                           ip32_defconfig
arm                       imx_v6_v7_defconfig
powerpc                        cell_defconfig
powerpc                          allmodconfig
h8300                            allyesconfig
mips                           gcw0_defconfig
arm                             rpc_defconfig
arm                           u8500_defconfig
arm                            hisi_defconfig
powerpc                  mpc866_ads_defconfig
arc                 nsimosci_hs_smp_defconfig
ia64                          tiger_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc64                           defconfig
arm                        mvebu_v7_defconfig
sh                            shmin_defconfig
sh                        dreamcast_defconfig
arm                  randconfig-c002-20211016
x86_64               randconfig-c001-20211016
arm                  randconfig-c002-20211017
i386                 randconfig-c001-20211017
x86_64               randconfig-c001-20211017
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
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
x86_64               randconfig-a006-20211016
x86_64               randconfig-a004-20211016
x86_64               randconfig-a001-20211016
x86_64               randconfig-a005-20211016
x86_64               randconfig-a002-20211016
x86_64               randconfig-a003-20211016
i386                 randconfig-a005-20211016
i386                 randconfig-a004-20211016
i386                 randconfig-a006-20211016
i386                 randconfig-a003-20211016
i386                 randconfig-a001-20211016
i386                 randconfig-a002-20211016
x86_64               randconfig-a012-20211017
x86_64               randconfig-a015-20211017
x86_64               randconfig-a016-20211017
x86_64               randconfig-a014-20211017
x86_64               randconfig-a011-20211017
x86_64               randconfig-a013-20211017
i386                 randconfig-a016-20211015
i386                 randconfig-a014-20211015
i386                 randconfig-a011-20211015
i386                 randconfig-a015-20211015
i386                 randconfig-a012-20211015
i386                 randconfig-a013-20211015
i386                 randconfig-a016-20211017
i386                 randconfig-a014-20211017
i386                 randconfig-a011-20211017
i386                 randconfig-a015-20211017
i386                 randconfig-a012-20211017
i386                 randconfig-a013-20211017
arc                  randconfig-r043-20211016
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
i386                 randconfig-a003-20211017
i386                 randconfig-a001-20211017
i386                 randconfig-a005-20211017
i386                 randconfig-a004-20211017
i386                 randconfig-a002-20211017
i386                 randconfig-a006-20211017
x86_64               randconfig-a012-20211016
x86_64               randconfig-a015-20211016
x86_64               randconfig-a016-20211016
x86_64               randconfig-a014-20211016
x86_64               randconfig-a011-20211016
x86_64               randconfig-a013-20211016
i386                 randconfig-a016-20211016
i386                 randconfig-a014-20211016
i386                 randconfig-a011-20211016
i386                 randconfig-a015-20211016
i386                 randconfig-a012-20211016
i386                 randconfig-a013-20211016
x86_64               randconfig-a006-20211017
x86_64               randconfig-a004-20211017
x86_64               randconfig-a001-20211017
x86_64               randconfig-a005-20211017
x86_64               randconfig-a002-20211017
x86_64               randconfig-a003-20211017
hexagon              randconfig-r041-20211016
s390                 randconfig-r044-20211016
riscv                randconfig-r042-20211016
hexagon              randconfig-r045-20211016
hexagon              randconfig-r041-20211017
hexagon              randconfig-r045-20211017

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
