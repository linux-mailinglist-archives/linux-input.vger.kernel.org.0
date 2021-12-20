Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB0147B5EA
	for <lists+linux-input@lfdr.de>; Mon, 20 Dec 2021 23:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhLTWda (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Dec 2021 17:33:30 -0500
Received: from mga17.intel.com ([192.55.52.151]:31377 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229474AbhLTWd3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Dec 2021 17:33:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640039609; x=1671575609;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=19WTHUkRRXajrFtQ3TUseSoLPFKWsEAhdK1anJOUlew=;
  b=GyhQfZWCb9i9orYCT2XsGZo0SPTn+Relbrk3qb2NNfoLrDowrvbZ/vcb
   fueRsN89ZwhWbQXkEoX2B9crUCasN69ukP5K/GLa4tIz5PgDayEb+r0Xb
   wrRkehhIpdK8s+AOlSRKg+uwj9/RDSDAMoB0KxCj+UGxiM0J5SH3q9P3l
   9kZrmfX7TzgLHblscwejA0OWa+fKnxw55xCmigMmUw/5IcMY2xp7GF/We
   O62ghKwQZ4ccWwTFotEGOfhCiwdqLqk9pA6NWQPu6A8fCz2ioTyDRBZb6
   Xw0rsYQcvwUn35uIesAcgw4OiwldICdZaDI+asaGlIedgcepJ21ZMQtNk
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="220956444"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="220956444"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 14:33:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="507852541"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 20 Dec 2021 14:33:26 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mzRDh-0008Kz-Mm; Mon, 20 Dec 2021 22:33:25 +0000
Date:   Tue, 21 Dec 2021 06:33:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 652c0441de588dafb68516eccd4a89662830d23b
Message-ID: <61c1049e.QU3MensoPPK3UPxl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 652c0441de588dafb68516eccd4a89662830d23b  Input: byd - fix typo in a comment

elapsed time: 730m

configs tested: 172
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                      rts7751r2d1_defconfig
arc                     haps_hs_smp_defconfig
sh                ecovec24-romimage_defconfig
ia64                        generic_defconfig
powerpc                 mpc837x_rdb_defconfig
m68k                       m5208evb_defconfig
mips                         bigsur_defconfig
arm                        magician_defconfig
powerpc                mpc7448_hpc2_defconfig
m68k                        m5272c3_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                       maple_defconfig
arm                       imx_v4_v5_defconfig
sh                           se7712_defconfig
arm                        vexpress_defconfig
mips                       bmips_be_defconfig
mips                             allmodconfig
mips                     cu1830-neo_defconfig
sparc                       sparc32_defconfig
xtensa                  nommu_kc705_defconfig
i386                             allyesconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                     sequoia_defconfig
arm                        cerfcube_defconfig
h8300                    h8300h-sim_defconfig
xtensa                              defconfig
arm                       spear13xx_defconfig
powerpc                      ep88xc_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                          iop32x_defconfig
arm                         s3c2410_defconfig
powerpc                      chrp32_defconfig
csky                                defconfig
parisc                           allyesconfig
arm                      integrator_defconfig
sh                        edosk7705_defconfig
sh                             sh03_defconfig
powerpc                 mpc832x_mds_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                 canyonlands_defconfig
powerpc                      ppc44x_defconfig
powerpc                           allnoconfig
powerpc                     tqm8541_defconfig
m68k                             alldefconfig
sh                          urquell_defconfig
sh                             shx3_defconfig
powerpc                        warp_defconfig
powerpc                     tqm8548_defconfig
arm                        oxnas_v6_defconfig
arm                          collie_defconfig
openrisc                  or1klitex_defconfig
powerpc                     tqm5200_defconfig
arm                           omap1_defconfig
arm                     davinci_all_defconfig
sh                          rsk7269_defconfig
arm                            mmp2_defconfig
h8300                            alldefconfig
nios2                               defconfig
powerpc                      walnut_defconfig
powerpc64                        alldefconfig
arm                         hackkit_defconfig
powerpc                 mpc832x_rdb_defconfig
parisc                generic-64bit_defconfig
powerpc                       eiger_defconfig
sh                            hp6xx_defconfig
m68k                          hp300_defconfig
powerpc                    amigaone_defconfig
sh                           se7750_defconfig
arm                         lubbock_defconfig
alpha                               defconfig
powerpc                   currituck_defconfig
arm                          exynos_defconfig
sh                     magicpanelr2_defconfig
s390                       zfcpdump_defconfig
sh                          landisk_defconfig
sh                        sh7763rdp_defconfig
arm                       versatile_defconfig
mips                      pic32mzda_defconfig
arm                        neponset_defconfig
mips                        jmr3927_defconfig
arc                              alldefconfig
arm                         nhk8815_defconfig
nios2                         3c120_defconfig
powerpc                 mpc834x_itx_defconfig
um                             i386_defconfig
powerpc                      pmac32_defconfig
sh                         apsh4a3a_defconfig
sh                        edosk7760_defconfig
arm                          ixp4xx_defconfig
sh                           se7619_defconfig
arm                  randconfig-c002-20211220
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
s390                                defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a001-20211220
x86_64               randconfig-a003-20211220
x86_64               randconfig-a006-20211220
x86_64               randconfig-a004-20211220
x86_64               randconfig-a002-20211220
x86_64               randconfig-a005-20211220
i386                 randconfig-a006-20211220
i386                 randconfig-a004-20211220
i386                 randconfig-a002-20211220
i386                 randconfig-a003-20211220
i386                 randconfig-a005-20211220
i386                 randconfig-a001-20211220
i386                 randconfig-a013-20211219
i386                 randconfig-a011-20211219
i386                 randconfig-a016-20211219
i386                 randconfig-a015-20211219
i386                 randconfig-a014-20211219
i386                 randconfig-a012-20211219
arc                  randconfig-r043-20211220
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20211220
x86_64               randconfig-a016-20211220
x86_64               randconfig-a012-20211220
x86_64               randconfig-a013-20211220
x86_64               randconfig-a015-20211220
x86_64               randconfig-a014-20211220
i386                 randconfig-a011-20211220
i386                 randconfig-a014-20211220
i386                 randconfig-a012-20211220
i386                 randconfig-a013-20211220
i386                 randconfig-a015-20211220
i386                 randconfig-a016-20211220
s390                 randconfig-r044-20211220
hexagon              randconfig-r041-20211220
hexagon              randconfig-r045-20211220
riscv                randconfig-r042-20211220

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
