Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA931323021
	for <lists+linux-input@lfdr.de>; Tue, 23 Feb 2021 19:00:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233762AbhBWSAb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Feb 2021 13:00:31 -0500
Received: from mga11.intel.com ([192.55.52.93]:56466 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233764AbhBWSAa (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Feb 2021 13:00:30 -0500
IronPort-SDR: XFE84hK9S/MXkw6Lr2bAra6u8rR6xmlOw44rp2v15V3N1p3+DsT6iQY0LSATvqJLWosWsXgFmF
 /o+IpCajUloA==
X-IronPort-AV: E=McAfee;i="6000,8403,9904"; a="181461984"
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; 
   d="scan'208";a="181461984"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2021 09:59:47 -0800
IronPort-SDR: z88fmsRER5LHk8BUMSxiUCIpjRVsg6EdjQqrZ/Vd821eN13kNKNqjGtl3qhOPV6YbwiCfcf/tg
 iZN8yu86/hRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; 
   d="scan'208";a="423731506"
Received: from lkp-server01.sh.intel.com (HELO 16660e54978b) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 23 Feb 2021 09:59:44 -0800
Received: from kbuild by 16660e54978b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lEbyK-0001Re-2H; Tue, 23 Feb 2021 17:59:44 +0000
Date:   Wed, 24 Feb 2021 01:58:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 cbecf716ca618fd44feda6bd9a64a8179d031fc5
Message-ID: <6035425e.bQ7wV1BzOH08g0a2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: cbecf716ca618fd44feda6bd9a64a8179d031fc5  Merge branch 'next' into for-linus

elapsed time: 728m

configs tested: 129
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         axm55xx_defconfig
m68k                         amcore_defconfig
arm                          ep93xx_defconfig
powerpc                    gamecube_defconfig
ia64                         bigsur_defconfig
powerpc                     tqm8560_defconfig
mips                           ip27_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                           sama5_defconfig
arm                            hisi_defconfig
microblaze                      mmu_defconfig
arc                          axs101_defconfig
arm                         s3c6400_defconfig
mips                           jazz_defconfig
arm                            pleb_defconfig
xtensa                           alldefconfig
arm                          moxart_defconfig
sh                          r7785rp_defconfig
mips                           xway_defconfig
mips                        qi_lb60_defconfig
arm                          pxa910_defconfig
arc                          axs103_defconfig
powerpc                    klondike_defconfig
m68k                          amiga_defconfig
arc                        nsim_700_defconfig
arc                              alldefconfig
sh                          rsk7203_defconfig
powerpc                    amigaone_defconfig
mips                      fuloong2e_defconfig
arm                        spear6xx_defconfig
mips                        vocore2_defconfig
mips                            ar7_defconfig
sh                          sdk7786_defconfig
mips                           rs90_defconfig
arm                          iop32x_defconfig
mips                        nlm_xlp_defconfig
mips                       bmips_be_defconfig
m68k                        mvme147_defconfig
s390                          debug_defconfig
powerpc                      pcm030_defconfig
powerpc                 mpc8560_ads_defconfig
h8300                            alldefconfig
arm                        multi_v7_defconfig
sh                             espt_defconfig
arm                        mvebu_v5_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                      walnut_defconfig
mips                           ip32_defconfig
sh                        edosk7705_defconfig
sh                   secureedge5410_defconfig
mips                       rbtx49xx_defconfig
arm                          lpd270_defconfig
s390                                defconfig
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
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
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
i386                 randconfig-a006-20210223
i386                 randconfig-a005-20210223
i386                 randconfig-a004-20210223
i386                 randconfig-a003-20210223
i386                 randconfig-a001-20210223
i386                 randconfig-a002-20210223
x86_64               randconfig-a015-20210223
x86_64               randconfig-a011-20210223
x86_64               randconfig-a012-20210223
x86_64               randconfig-a016-20210223
x86_64               randconfig-a014-20210223
x86_64               randconfig-a013-20210223
i386                 randconfig-a013-20210223
i386                 randconfig-a012-20210223
i386                 randconfig-a011-20210223
i386                 randconfig-a014-20210223
i386                 randconfig-a016-20210223
i386                 randconfig-a015-20210223
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20210223
x86_64               randconfig-a002-20210223
x86_64               randconfig-a003-20210223
x86_64               randconfig-a005-20210223
x86_64               randconfig-a006-20210223
x86_64               randconfig-a004-20210223

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
