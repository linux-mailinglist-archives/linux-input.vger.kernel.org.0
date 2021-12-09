Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9395D46F53F
	for <lists+linux-input@lfdr.de>; Thu,  9 Dec 2021 21:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbhLIUxP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Dec 2021 15:53:15 -0500
Received: from mga04.intel.com ([192.55.52.120]:14986 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229842AbhLIUxP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 Dec 2021 15:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639082981; x=1670618981;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sl9mxyAw6Bhlvxo5iMfXL9JC80OkYZ0/lxdr25/e0Dk=;
  b=j3eX5b2vSc7B1byJqHqhunh7S1CG6UL9xMHxRwPHru59wlEk4KERVwIP
   TnYc8br7PUYt2klluFWq19ZTBerPxl03thdDMg783U98blG4sdHQ1Ijj+
   ntdEdtBoKn8wP0mvcoRkYFSGzyJeIJtGV7+DLcq0Xq2yO81x58zC+uR/0
   dfXQorgyWeFJgtBvMwPKzU28Frlk+QDQk1OW4qI3Ta/u0Xm0rPhGV5nyj
   vX1acUedSiTYbqXVKyRiYfS1f2EpU9hw7Lotdbv6IFmJQjGfGJjACT7ek
   Xk0je1NA/S2sdZGq16ZFWWMhbpAUlZScXAukWEYyPoihye4O3BRWOpKbJ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="236940839"
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; 
   d="scan'208";a="236940839"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2021 12:49:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; 
   d="scan'208";a="503644372"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 09 Dec 2021 12:49:39 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mvQME-0002N8-Jc; Thu, 09 Dec 2021 20:49:38 +0000
Date:   Fri, 10 Dec 2021 04:49:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 5ede7f0cfb93f0f8edf2245671e18e982a247f55
Message-ID: <61b26bdc.aVk8QCRLjQ0I+S53%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 5ede7f0cfb93f0f8edf2245671e18e982a247f55  Input: goodix - add pen support

elapsed time: 730m

configs tested: 193
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211209
x86_64                           allyesconfig
arc                      axs103_smp_defconfig
powerpc                      mgcoge_defconfig
arm                        mvebu_v7_defconfig
m68k                        stmark2_defconfig
arm                          imote2_defconfig
arm                          pxa3xx_defconfig
m68k                       m5475evb_defconfig
ia64                            zx1_defconfig
ia64                      gensparse_defconfig
powerpc                      chrp32_defconfig
arm                         hackkit_defconfig
arm                             mxs_defconfig
powerpc                       holly_defconfig
mips                         mpc30x_defconfig
sh                           se7206_defconfig
mips                           mtx1_defconfig
m68k                       m5249evb_defconfig
arm                           spitz_defconfig
powerpc64                        alldefconfig
sh                            titan_defconfig
powerpc                  storcenter_defconfig
arm                          lpd270_defconfig
powerpc                    sam440ep_defconfig
powerpc                      tqm8xx_defconfig
m68k                        m5307c3_defconfig
sh                        apsh4ad0a_defconfig
alpha                            allyesconfig
mips                          rm200_defconfig
arm                        keystone_defconfig
mips                      loongson3_defconfig
xtensa                  nommu_kc705_defconfig
arm                            pleb_defconfig
ia64                        generic_defconfig
mips                          malta_defconfig
h8300                    h8300h-sim_defconfig
openrisc                 simple_smp_defconfig
sh                        sh7763rdp_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                     kilauea_defconfig
powerpc                      makalu_defconfig
sh                          lboxre2_defconfig
powerpc                      pasemi_defconfig
m68k                        mvme16x_defconfig
arm                             rpc_defconfig
mips                        bcm63xx_defconfig
mips                     loongson2k_defconfig
sh                          kfr2r09_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                            dove_defconfig
powerpc                     tqm8548_defconfig
mips                        workpad_defconfig
arm                           corgi_defconfig
s390                             allyesconfig
alpha                               defconfig
arm                  colibri_pxa270_defconfig
powerpc                     stx_gp3_defconfig
powerpc                       ebony_defconfig
powerpc                        fsp2_defconfig
powerpc                      ppc6xx_defconfig
riscv                             allnoconfig
mips                           ip27_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                    socrates_defconfig
nds32                             allnoconfig
mips                  maltasmvp_eva_defconfig
mips                           rs90_defconfig
mips                         tb0287_defconfig
sh                          landisk_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                      pxa255-idp_defconfig
riscv                               defconfig
mips                       lemote2f_defconfig
sh                           se7705_defconfig
sh                          sdk7786_defconfig
arm                           sama7_defconfig
mips                         cobalt_defconfig
sh                          rsk7201_defconfig
arm                        multi_v5_defconfig
arm                             pxa_defconfig
riscv                    nommu_k210_defconfig
powerpc                   lite5200b_defconfig
riscv                    nommu_virt_defconfig
powerpc                       eiger_defconfig
powerpc                     ppa8548_defconfig
m68k                          hp300_defconfig
arm                       omap2plus_defconfig
ia64                                defconfig
powerpc                     ep8248e_defconfig
arm                             ezx_defconfig
arm                       multi_v4t_defconfig
h8300                       h8s-sim_defconfig
sh                   sh7724_generic_defconfig
powerpc               mpc834x_itxgp_defconfig
um                                  defconfig
arc                     nsimosci_hs_defconfig
powerpc                   motionpro_defconfig
mips                           gcw0_defconfig
arm                        mvebu_v5_defconfig
sh                           se7721_defconfig
arm                    vt8500_v6_v7_defconfig
nios2                         3c120_defconfig
arm                        spear6xx_defconfig
arc                            hsdk_defconfig
powerpc                 canyonlands_defconfig
powerpc                     tqm8560_defconfig
arm                         cm_x300_defconfig
arm                      tct_hammer_defconfig
m68k                        m5272c3_defconfig
powerpc                 mpc836x_rdk_defconfig
xtensa                generic_kc705_defconfig
sh                           se7712_defconfig
sh                   secureedge5410_defconfig
sparc64                             defconfig
arm                  randconfig-c002-20211209
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
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
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211209
x86_64               randconfig-a005-20211209
x86_64               randconfig-a001-20211209
x86_64               randconfig-a002-20211209
x86_64               randconfig-a004-20211209
x86_64               randconfig-a003-20211209
i386                 randconfig-a001-20211209
i386                 randconfig-a005-20211209
i386                 randconfig-a003-20211209
i386                 randconfig-a002-20211209
i386                 randconfig-a006-20211209
i386                 randconfig-a004-20211209
riscv                            allyesconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211209
x86_64               randconfig-c007-20211209
riscv                randconfig-c006-20211209
i386                 randconfig-c001-20211209
mips                 randconfig-c004-20211209
powerpc              randconfig-c003-20211209
s390                 randconfig-c005-20211209
x86_64               randconfig-a016-20211209
x86_64               randconfig-a011-20211209
x86_64               randconfig-a013-20211209
x86_64               randconfig-a015-20211209
x86_64               randconfig-a012-20211209
x86_64               randconfig-a014-20211209
i386                 randconfig-a013-20211209
i386                 randconfig-a016-20211209
i386                 randconfig-a011-20211209
i386                 randconfig-a014-20211209
i386                 randconfig-a012-20211209
i386                 randconfig-a015-20211209
hexagon              randconfig-r045-20211209
s390                 randconfig-r044-20211209
hexagon              randconfig-r041-20211209
riscv                randconfig-r042-20211209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
