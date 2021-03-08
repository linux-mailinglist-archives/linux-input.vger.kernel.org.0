Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33070331765
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 20:36:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbhCHTfl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 14:35:41 -0500
Received: from mga14.intel.com ([192.55.52.115]:35544 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230046AbhCHTf3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 14:35:29 -0500
IronPort-SDR: z8g10iKbaJZZGmUnUXvEHM8+ekZ2xDJegJ9Azzzq6/1XeC+jCDSMxcBi7bPUZue8CAXh/kwosA
 T77cyeNUcSJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="187456610"
X-IronPort-AV: E=Sophos;i="5.81,233,1610438400"; 
   d="scan'208";a="187456610"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 11:35:29 -0800
IronPort-SDR: aLlyGEbij0Ci4F06gWJpJynjJOumh8sKoZVqCt6V/XtOYyugUaQ+uKb5FU7+FK4ugQpnjnUols
 W9b5Hs2dGNZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,233,1610438400"; 
   d="scan'208";a="408344930"
Received: from lkp-server01.sh.intel.com (HELO 3e992a48ca98) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 Mar 2021 11:35:27 -0800
Received: from kbuild by 3e992a48ca98 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lJLf4-000185-Ur; Mon, 08 Mar 2021 19:35:26 +0000
Date:   Tue, 09 Mar 2021 03:34:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 ad117c558e838f9fa93af265d8f9dd54e87e15b1
Message-ID: <60467c4f.56gAiEfqBMkKMym9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: ad117c558e838f9fa93af265d8f9dd54e87e15b1  Input: exc3000 - add type sysfs attribute

elapsed time: 726m

configs tested: 143
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
mips                         tb0287_defconfig
powerpc                   bluestone_defconfig
sh                            titan_defconfig
xtensa                    smp_lx200_defconfig
powerpc                     tqm8555_defconfig
powerpc                     kmeter1_defconfig
s390                       zfcpdump_defconfig
powerpc                     akebono_defconfig
arc                            hsdk_defconfig
powerpc                        warp_defconfig
mips                      loongson3_defconfig
m68k                                defconfig
mips                         tb0219_defconfig
xtensa                  audio_kc705_defconfig
sparc                       sparc32_defconfig
h8300                               defconfig
powerpc                       maple_defconfig
arm                       omap2plus_defconfig
sh                   sh7770_generic_defconfig
sh                           se7343_defconfig
arm                          simpad_defconfig
powerpc                       holly_defconfig
arc                           tb10x_defconfig
powerpc                         wii_defconfig
arm                          collie_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                         at91_dt_defconfig
powerpc                     powernv_defconfig
csky                             alldefconfig
mips                        nlm_xlr_defconfig
xtensa                       common_defconfig
arm                          pxa168_defconfig
m68k                          hp300_defconfig
arm                          pxa3xx_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                             espt_defconfig
mips                  decstation_64_defconfig
sh                              ul2_defconfig
powerpc                  mpc885_ads_defconfig
sh                          sdk7786_defconfig
arm                     am200epdkit_defconfig
mips                            gpr_defconfig
mips                       capcella_defconfig
m68k                           sun3_defconfig
powerpc                     stx_gp3_defconfig
sh                   rts7751r2dplus_defconfig
arm                         cm_x300_defconfig
arc                        vdk_hs38_defconfig
sh                          polaris_defconfig
arc                    vdk_hs38_smp_defconfig
mips                       rbtx49xx_defconfig
powerpc                 mpc834x_itx_defconfig
parisc                           alldefconfig
mips                           rs90_defconfig
sparc64                             defconfig
m68k                            mac_defconfig
sh                           se7721_defconfig
m68k                        mvme16x_defconfig
arm                       imx_v6_v7_defconfig
arm                            xcep_defconfig
arm                     eseries_pxa_defconfig
m68k                        m5307c3_defconfig
powerpc                     tqm8548_defconfig
sh                          lboxre2_defconfig
h8300                       h8s-sim_defconfig
i386                             alldefconfig
sh                          rsk7264_defconfig
mips                    maltaup_xpa_defconfig
arm                         nhk8815_defconfig
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
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                             allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210308
x86_64               randconfig-a001-20210308
x86_64               randconfig-a004-20210308
x86_64               randconfig-a002-20210308
x86_64               randconfig-a005-20210308
x86_64               randconfig-a003-20210308
i386                 randconfig-a005-20210308
i386                 randconfig-a003-20210308
i386                 randconfig-a002-20210308
i386                 randconfig-a006-20210308
i386                 randconfig-a004-20210308
i386                 randconfig-a001-20210308
i386                 randconfig-a016-20210308
i386                 randconfig-a012-20210308
i386                 randconfig-a014-20210308
i386                 randconfig-a013-20210308
i386                 randconfig-a011-20210308
i386                 randconfig-a015-20210308
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210308
x86_64               randconfig-a016-20210308
x86_64               randconfig-a011-20210308
x86_64               randconfig-a012-20210308
x86_64               randconfig-a015-20210308
x86_64               randconfig-a014-20210308

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
