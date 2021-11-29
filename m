Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D50BA462357
	for <lists+linux-input@lfdr.de>; Mon, 29 Nov 2021 22:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbhK2Vck (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Nov 2021 16:32:40 -0500
Received: from mga12.intel.com ([192.55.52.136]:58475 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232604AbhK2Vak (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Nov 2021 16:30:40 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="216098170"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; 
   d="scan'208";a="216098170"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 13:27:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; 
   d="scan'208";a="499497954"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 29 Nov 2021 13:27:20 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mroBD-000CMM-U1; Mon, 29 Nov 2021 21:27:19 +0000
Date:   Tue, 30 Nov 2021 05:26:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 fafc66387dc069140e52739c0c86c8169d44c2dc
Message-ID: <61a54588.WMzKIEy6Y6mzLTG7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: fafc66387dc069140e52739c0c86c8169d44c2dc  Input: wacom_i2c - clean up the query device fields

elapsed time: 730m

configs tested: 262
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211128
nios2                            alldefconfig
arm                        shmobile_defconfig
mips                      fuloong2e_defconfig
arc                            hsdk_defconfig
powerpc                      pasemi_defconfig
powerpc                 mpc832x_mds_defconfig
xtensa                    smp_lx200_defconfig
arm                          iop32x_defconfig
mips                        vocore2_defconfig
powerpc                     mpc5200_defconfig
sh                           se7751_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                   bluestone_defconfig
sh                          rsk7269_defconfig
sh                          sdk7780_defconfig
powerpc                   lite5200b_defconfig
powerpc                        warp_defconfig
mips                       capcella_defconfig
powerpc                     tqm8555_defconfig
arm                         mv78xx0_defconfig
s390                          debug_defconfig
arm                         axm55xx_defconfig
sh                             espt_defconfig
sh                        apsh4ad0a_defconfig
arm                        multi_v5_defconfig
m68k                           sun3_defconfig
powerpc                     tqm8540_defconfig
um                                  defconfig
mips                          ath79_defconfig
arm                              alldefconfig
sh                 kfr2r09-romimage_defconfig
arm                             mxs_defconfig
arm                        mini2440_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                        spear3xx_defconfig
arc                          axs103_defconfig
arm                     davinci_all_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                      cm5200_defconfig
mips                        qi_lb60_defconfig
mips                         cobalt_defconfig
sh                           se7619_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                        icon_defconfig
powerpc                     akebono_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                       ebony_defconfig
mips                          rm200_defconfig
sh                   sh7770_generic_defconfig
arm                          lpd270_defconfig
h8300                       h8s-sim_defconfig
sh                         ap325rxa_defconfig
mips                  decstation_64_defconfig
powerpc                     skiroot_defconfig
powerpc                     kmeter1_defconfig
sparc                               defconfig
arm                        magician_defconfig
arm                          exynos_defconfig
ia64                            zx1_defconfig
mips                         tb0219_defconfig
arm                            qcom_defconfig
mips                           xway_defconfig
parisc                generic-64bit_defconfig
powerpc                      makalu_defconfig
arm                             rpc_defconfig
nios2                         3c120_defconfig
arc                              allyesconfig
xtensa                    xip_kc705_defconfig
powerpc                 mpc836x_mds_defconfig
s390                       zfcpdump_defconfig
mips                      pic32mzda_defconfig
sparc64                          alldefconfig
arm                           viper_defconfig
powerpc                         ps3_defconfig
powerpc                      ep88xc_defconfig
powerpc                 linkstation_defconfig
mips                           mtx1_defconfig
arm                            dove_defconfig
arm                          pxa168_defconfig
m68k                             alldefconfig
mips                        maltaup_defconfig
arm                            xcep_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                        realview_defconfig
powerpc                     taishan_defconfig
arm                         palmz72_defconfig
powerpc                         wii_defconfig
mips                       rbtx49xx_defconfig
sh                          rsk7201_defconfig
arm                        mvebu_v7_defconfig
x86_64                              defconfig
arm                       versatile_defconfig
microblaze                      mmu_defconfig
arm                         orion5x_defconfig
mips                           ip22_defconfig
arm                       imx_v4_v5_defconfig
sh                                  defconfig
arm                         s3c6400_defconfig
powerpc                      ppc40x_defconfig
arm                      jornada720_defconfig
powerpc                    socrates_defconfig
riscv             nommu_k210_sdcard_defconfig
sparc                       sparc32_defconfig
sh                           se7722_defconfig
arc                                 defconfig
mips                        omega2p_defconfig
parisc                           allyesconfig
mips                           ip28_defconfig
mips                  maltasmvp_eva_defconfig
m68k                        m5407c3_defconfig
arc                        nsim_700_defconfig
arm                         lubbock_defconfig
sh                     magicpanelr2_defconfig
powerpc                     redwood_defconfig
arm                     am200epdkit_defconfig
powerpc                     ksi8560_defconfig
powerpc                     tqm8541_defconfig
i386                             alldefconfig
sh                           se7712_defconfig
mips                    maltaup_xpa_defconfig
mips                           ip32_defconfig
mips                           gcw0_defconfig
arm                       imx_v6_v7_defconfig
mips                           rs90_defconfig
arm                           h5000_defconfig
arc                     haps_hs_smp_defconfig
m68k                       bvme6000_defconfig
openrisc                            defconfig
arm                          pcm027_defconfig
mips                 decstation_r4k_defconfig
arm                       omap2plus_defconfig
mips                             allyesconfig
mips                          rb532_defconfig
powerpc                  iss476-smp_defconfig
arm                          simpad_defconfig
m68k                       m5249evb_defconfig
mips                      bmips_stb_defconfig
arm                          ep93xx_defconfig
arm                        neponset_defconfig
arc                        vdk_hs38_defconfig
arm                         socfpga_defconfig
ia64                          tiger_defconfig
powerpc64                        alldefconfig
arm                   milbeaut_m10v_defconfig
sh                            shmin_defconfig
m68k                        m5272c3_defconfig
arm                        trizeps4_defconfig
powerpc                       maple_defconfig
openrisc                  or1klitex_defconfig
sparc                            allyesconfig
xtensa                              defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                          atari_defconfig
arm                          ixp4xx_defconfig
arm                         cm_x300_defconfig
powerpc                     ep8248e_defconfig
arm                         shannon_defconfig
sh                          rsk7203_defconfig
arm                           u8500_defconfig
arm                        cerfcube_defconfig
arm                  randconfig-c002-20211128
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20211129
i386                 randconfig-a002-20211129
i386                 randconfig-a006-20211129
i386                 randconfig-a005-20211129
i386                 randconfig-a004-20211129
i386                 randconfig-a003-20211129
x86_64               randconfig-a011-20211128
x86_64               randconfig-a014-20211128
x86_64               randconfig-a012-20211128
x86_64               randconfig-a013-20211128
x86_64               randconfig-a015-20211128
x86_64               randconfig-a016-20211128
i386                 randconfig-a013-20211128
i386                 randconfig-a012-20211128
i386                 randconfig-a011-20211128
i386                 randconfig-a015-20211128
i386                 randconfig-a016-20211128
i386                 randconfig-a014-20211128
arc                  randconfig-r043-20211129
arc                  randconfig-r043-20211128
s390                 randconfig-r044-20211128
riscv                randconfig-r042-20211128
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20211128
i386                 randconfig-c001-20211128
riscv                randconfig-c006-20211128
arm                  randconfig-c002-20211128
powerpc              randconfig-c003-20211128
x86_64               randconfig-c007-20211128
mips                 randconfig-c004-20211128
x86_64               randconfig-a001-20211128
x86_64               randconfig-a006-20211128
x86_64               randconfig-a003-20211128
x86_64               randconfig-a005-20211128
x86_64               randconfig-a004-20211128
x86_64               randconfig-a002-20211128
i386                 randconfig-a001-20211128
i386                 randconfig-a002-20211128
i386                 randconfig-a006-20211128
i386                 randconfig-a005-20211128
i386                 randconfig-a004-20211128
i386                 randconfig-a003-20211128
i386                 randconfig-a013-20211129
i386                 randconfig-a012-20211129
i386                 randconfig-a014-20211129
i386                 randconfig-a011-20211129
i386                 randconfig-a015-20211129
i386                 randconfig-a016-20211129
hexagon              randconfig-r045-20211129
hexagon              randconfig-r041-20211129
s390                 randconfig-r044-20211129
riscv                randconfig-r042-20211129
hexagon              randconfig-r045-20211128
hexagon              randconfig-r041-20211128

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
