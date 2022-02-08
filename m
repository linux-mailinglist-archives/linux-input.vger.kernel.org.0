Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3394AE4BE
	for <lists+linux-input@lfdr.de>; Tue,  8 Feb 2022 23:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350417AbiBHWeR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Feb 2022 17:34:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388584AbiBHWdO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Feb 2022 17:33:14 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C5AC01CB35
        for <linux-input@vger.kernel.org>; Tue,  8 Feb 2022 14:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644359114; x=1675895114;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7+0zZWxH92THZStgmoh8ItFFO9wTYO2mFFpVJY2xJwc=;
  b=ai66XILYRAlkxy3cBr+i1kYlSDfM7tvVHfnFbyCF79TwoHqpnR/DB4IX
   3t7mCe4IOLNF01bm6nJfNktKuLZz65Y6GlMFIKCILPDXGZ3R5vhdMPJlf
   M6ei9YXn0IcsZ9iqv3DjoWckP2QCue2xOzkk/oq+GJ/dlnOeVvwuib9r7
   bbNY6icBrRJAeZVlJCBpEHpQ2wcxB0ubOiUEwq9VR2gKTC5tla6h40yj9
   F4wae+9VrqFki6phPFulPiSE9aztckEDeAaTOO1C8u5rzqsJ9Dh5zV8Tb
   RV0LJ+fDPG4LwZ+v8CIB4EpVfdJH+bAIZGuw8jlO5EM4DaGQvu4NwVYGa
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="232631437"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; 
   d="scan'208";a="232631437"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 14:25:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; 
   d="scan'208";a="484977950"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Feb 2022 14:25:12 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nHYv9-0000pK-P5; Tue, 08 Feb 2022 22:25:11 +0000
Date:   Wed, 09 Feb 2022 06:24:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 994673dc66578be75bf32b6046c0d3df9e6dae1c
Message-ID: <6202eda5.duVMKUk6nJUV+LMm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 994673dc66578be75bf32b6046c0d3df9e6dae1c  Input: mtk-pmic-keys - add support for MT6358

elapsed time: 835m

configs tested: 167
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
sh                          sdk7780_defconfig
sh                         apsh4a3a_defconfig
ia64                             alldefconfig
powerpc                 mpc837x_rdb_defconfig
sh                          rsk7264_defconfig
mips                  decstation_64_defconfig
powerpc                     tqm8541_defconfig
arm                         axm55xx_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                           se7750_defconfig
openrisc                         alldefconfig
sparc                       sparc64_defconfig
m68k                        m5272c3_defconfig
powerpc                        warp_defconfig
alpha                               defconfig
mips                         cobalt_defconfig
sh                          rsk7203_defconfig
arc                      axs103_smp_defconfig
mips                         db1xxx_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                     sequoia_defconfig
powerpc                mpc7448_hpc2_defconfig
arm64                            alldefconfig
sh                          r7785rp_defconfig
arm                      footbridge_defconfig
mips                     decstation_defconfig
sh                               j2_defconfig
sh                           se7712_defconfig
arm                        mini2440_defconfig
powerpc                      cm5200_defconfig
h8300                    h8300h-sim_defconfig
sh                        sh7785lcr_defconfig
arm                            xcep_defconfig
arm                          iop32x_defconfig
arm                      jornada720_defconfig
sh                                  defconfig
sh                             shx3_defconfig
sh                           se7780_defconfig
arm                     eseries_pxa_defconfig
powerpc                 mpc8540_ads_defconfig
sh                           se7724_defconfig
mips                      fuloong2e_defconfig
mips                        bcm47xx_defconfig
xtensa                  nommu_kc705_defconfig
arm                           corgi_defconfig
mips                       capcella_defconfig
powerpc                     tqm8555_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                            shmin_defconfig
parisc                           alldefconfig
m68k                        m5407c3_defconfig
powerpc                     tqm8548_defconfig
arm                            zeus_defconfig
nios2                            alldefconfig
powerpc                 mpc837x_mds_defconfig
powerpc                  storcenter_defconfig
arm                         assabet_defconfig
sh                           se7343_defconfig
mips                 decstation_r4k_defconfig
powerpc                     ep8248e_defconfig
m68k                          sun3x_defconfig
powerpc                 canyonlands_defconfig
s390                       zfcpdump_defconfig
arm                  randconfig-c002-20220208
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
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
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a002
x86_64                        randconfig-a004
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a016
i386                          randconfig-a012
i386                          randconfig-a014
arc                  randconfig-r043-20220208
riscv                    nommu_virt_defconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig

clang tested configs:
riscv                randconfig-c006-20220208
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220208
mips                 randconfig-c004-20220208
arm                  randconfig-c002-20220208
i386                          randconfig-c001
mips                        qi_lb60_defconfig
arm                          ixp4xx_defconfig
mips                           ip27_defconfig
arm                  colibri_pxa270_defconfig
powerpc                   bluestone_defconfig
powerpc                          allyesconfig
arm                          ep93xx_defconfig
mips                      bmips_stb_defconfig
arm                        spear3xx_defconfig
mips                  cavium_octeon_defconfig
powerpc                     kmeter1_defconfig
arm                         orion5x_defconfig
arm                         hackkit_defconfig
powerpc                     mpc512x_defconfig
arm                          pcm027_defconfig
powerpc                 mpc8272_ads_defconfig
arm                        neponset_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a004
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a015
i386                          randconfig-a013
i386                          randconfig-a011
hexagon              randconfig-r045-20220208
hexagon              randconfig-r041-20220208
riscv                randconfig-r042-20220208
s390                 randconfig-r044-20220208

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
