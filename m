Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B952473323
	for <lists+linux-input@lfdr.de>; Mon, 13 Dec 2021 18:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235736AbhLMRja (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Dec 2021 12:39:30 -0500
Received: from mga17.intel.com ([192.55.52.151]:14983 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234226AbhLMRja (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Dec 2021 12:39:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639417169; x=1670953169;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7MnupFRIBNhjNuw+Y13Mgnk+r01aKr+mCJpER3Eg+/o=;
  b=E2jaFt2/Yt+kN4o3L6WZOhUgyhpRX/9LtCux95N5iQsWYo6dNS5I7+i8
   EHmNIfwg7EZREExtVi713ZLJriK2PDtoScAy6yifxyjuE6BVPARlbXmDk
   Vm/pVAoOXhlPsNr0r1FAuMkKkPnW6YYYU7iFWAVNiaOeKZqgPZAjz2Maa
   VrIBT5FpfjBabQUT91fkIgfHCDyHVkAUc0PuRyPv9Y9wBk5dv6qRYFF5Y
   3jsB0hLC5mc+boU4WyOv6As7Sd40n1+P02siYRysSu4EhdEvTla7sNvlk
   cNFHvqUAMO6Wj6o6Rfhzs0wkEctbRThDF7WShCI00ZKwiG1HgiHD6J7eB
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="219467885"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="219467885"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 09:37:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="613908155"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 13 Dec 2021 09:37:52 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mwpGp-0006tm-Gv; Mon, 13 Dec 2021 17:37:51 +0000
Date:   Tue, 14 Dec 2021 01:37:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 12f247ab590a08856441efdbd351cf2cc8f60a2d
Message-ID: <61b784d8.nMK9oSmOegiHggcD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 12f247ab590a08856441efdbd351cf2cc8f60a2d  Input: atmel_mxt_ts - fix double free in mxt_read_info_block

elapsed time: 728m

configs tested: 171
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211213
m68k                             allmodconfig
s390                             allmodconfig
powerpc                          allmodconfig
m68k                             allyesconfig
powerpc                          allyesconfig
s390                             allyesconfig
sparc                            allyesconfig
s390                          debug_defconfig
powerpc                   bluestone_defconfig
arm                         s3c6400_defconfig
m68k                       bvme6000_defconfig
powerpc                     ppa8548_defconfig
powerpc                      pasemi_defconfig
mips                        jmr3927_defconfig
powerpc                       holly_defconfig
powerpc                     ep8248e_defconfig
arm                           omap1_defconfig
mips                  decstation_64_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                      pcm030_defconfig
mips                     loongson1b_defconfig
powerpc                      katmai_defconfig
powerpc                        warp_defconfig
ia64                      gensparse_defconfig
sh                           se7705_defconfig
sh                           se7750_defconfig
m68k                          amiga_defconfig
powerpc                     pseries_defconfig
powerpc                         wii_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                       imx_v6_v7_defconfig
sh                        apsh4ad0a_defconfig
arc                           tb10x_defconfig
mips                     cu1830-neo_defconfig
mips                           mtx1_defconfig
mips                     loongson1c_defconfig
mips                         rt305x_defconfig
arm                       mainstone_defconfig
parisc                generic-64bit_defconfig
m68k                            mac_defconfig
powerpc                     mpc83xx_defconfig
arc                        vdk_hs38_defconfig
xtensa                              defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                 mpc85xx_cds_defconfig
arc                                 defconfig
sh                          polaris_defconfig
powerpc                     redwood_defconfig
mips                        qi_lb60_defconfig
openrisc                 simple_smp_defconfig
mips                      maltaaprp_defconfig
arm                       aspeed_g4_defconfig
sh                         ap325rxa_defconfig
sh                             shx3_defconfig
arm                          pxa168_defconfig
arc                          axs103_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                     pq2fads_defconfig
arm                       cns3420vb_defconfig
arm                            hisi_defconfig
powerpc                      pmac32_defconfig
xtensa                  cadence_csp_defconfig
m68k                                defconfig
xtensa                  nommu_kc705_defconfig
sh                          kfr2r09_defconfig
sh                          r7785rp_defconfig
sh                           sh2007_defconfig
arc                     nsimosci_hs_defconfig
sh                   sh7724_generic_defconfig
m68k                        m5307c3_defconfig
sh                            migor_defconfig
sh                        edosk7705_defconfig
powerpc                     tqm8541_defconfig
sh                 kfr2r09-romimage_defconfig
arm                         at91_dt_defconfig
powerpc                      ppc64e_defconfig
mips                       rbtx49xx_defconfig
arm                      tct_hammer_defconfig
mips                           ip32_defconfig
h8300                    h8300h-sim_defconfig
powerpc64                        alldefconfig
nds32                               defconfig
i386                             alldefconfig
powerpc                     tqm8540_defconfig
powerpc                     skiroot_defconfig
microblaze                          defconfig
arm                          lpd270_defconfig
mips                         tb0287_defconfig
arm                          pxa3xx_defconfig
sh                          r7780mp_defconfig
ia64                        generic_defconfig
arm                  randconfig-c002-20211213
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a011-20211213
x86_64               randconfig-a012-20211213
x86_64               randconfig-a014-20211213
x86_64               randconfig-a013-20211213
x86_64               randconfig-a016-20211213
x86_64               randconfig-a015-20211213
i386                 randconfig-a013-20211213
i386                 randconfig-a011-20211213
i386                 randconfig-a016-20211213
i386                 randconfig-a014-20211213
i386                 randconfig-a015-20211213
i386                 randconfig-a012-20211213
arc                  randconfig-r043-20211213
riscv                randconfig-r042-20211213
s390                 randconfig-r044-20211213
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211213
arm                  randconfig-c002-20211213
riscv                randconfig-c006-20211213
mips                 randconfig-c004-20211213
i386                 randconfig-c001-20211213
s390                 randconfig-c005-20211213
powerpc              randconfig-c003-20211213
x86_64               randconfig-a006-20211213
x86_64               randconfig-a005-20211213
x86_64               randconfig-a001-20211213
x86_64               randconfig-a002-20211213
x86_64               randconfig-a003-20211213
x86_64               randconfig-a004-20211213
i386                 randconfig-a001-20211213
i386                 randconfig-a002-20211213
i386                 randconfig-a005-20211213
i386                 randconfig-a003-20211213
i386                 randconfig-a006-20211213
i386                 randconfig-a004-20211213
hexagon              randconfig-r045-20211213
hexagon              randconfig-r041-20211213

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
