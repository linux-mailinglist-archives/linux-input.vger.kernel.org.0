Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E035E473324
	for <lists+linux-input@lfdr.de>; Mon, 13 Dec 2021 18:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237330AbhLMRje (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Dec 2021 12:39:34 -0500
Received: from mga07.intel.com ([134.134.136.100]:20804 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237297AbhLMRjd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Dec 2021 12:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639417173; x=1670953173;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=j1Nf+2TtuXsT9Ocg/7N+RSaR1OCEG7aQz3yBT1tQpGM=;
  b=cBOYwRTqfAQMB6OqVtQ8WylrHh6VuZHkBQzMcqlc4yI8G2m0O8tAAT7y
   vGrws7easEcGol0szhR//ifN/JSKFqIDkoFWa0ncGwN0yV4Aaczx/NlBq
   WlsCmLNsjHHuCUImI8hUufU6ySLI/y6wWEOt2Nb/SfZOC7xsytVmVjlZV
   9JcW4BH1a2KhP9PXsARUuDXUjhAxkbUu5csS0gW/AypTiXAEDgpd0HG5x
   DN5WyyOmVmM9Z6rEEc6qIpipCFYeNSBF70ZhPSeZzJnC6DEbZqIr98NgJ
   5i5cNwrrRt1184rO5EdBjp6SDvkTKMvkGoJWzDiJrFav+Ksnhj7EsSu0y
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="302166181"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="302166181"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 09:37:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="464720794"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Dec 2021 09:37:52 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mwpGp-0006tj-FS; Mon, 13 Dec 2021 17:37:51 +0000
Date:   Tue, 14 Dec 2021 01:37:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:master] BUILD SUCCESS
 831cc77635e0d83db9581ce4362a1df5fc0199f7
Message-ID: <61b784dc.7SzaumWDPXttaWfR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: 831cc77635e0d83db9581ce4362a1df5fc0199f7  Input: ti_am335x_tsc - lower the X and Y sampling time

elapsed time: 720m

configs tested: 175
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
s390                          debug_defconfig
powerpc                   bluestone_defconfig
arm                         s3c6400_defconfig
m68k                       bvme6000_defconfig
powerpc                     ppa8548_defconfig
powerpc                      pasemi_defconfig
mips                        jmr3927_defconfig
powerpc                       holly_defconfig
powerpc                          allmodconfig
powerpc                      ep88xc_defconfig
arm                           h3600_defconfig
sh                        edosk7760_defconfig
sh                        sh7757lcr_defconfig
powerpc                     ep8248e_defconfig
arm                           omap1_defconfig
mips                  decstation_64_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                           se7705_defconfig
powerpc                      pcm030_defconfig
mips                     loongson1b_defconfig
powerpc                      katmai_defconfig
powerpc                        warp_defconfig
ia64                      gensparse_defconfig
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
arc                                 defconfig
xtensa                              defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                 mpc85xx_cds_defconfig
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
xtensa                  nommu_kc705_defconfig
m68k                                defconfig
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
nds32                               defconfig
arm                      tct_hammer_defconfig
mips                           ip32_defconfig
h8300                    h8300h-sim_defconfig
powerpc64                        alldefconfig
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
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
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
s390                 randconfig-r044-20211213
riscv                randconfig-r042-20211213
arc                  randconfig-r043-20211213
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211213
arm                  randconfig-c002-20211213
mips                 randconfig-c004-20211213
i386                 randconfig-c001-20211213
riscv                randconfig-c006-20211213
s390                 randconfig-c005-20211213
powerpc              randconfig-c003-20211213
x86_64               randconfig-a005-20211213
x86_64               randconfig-a006-20211213
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
