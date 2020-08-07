Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A88EB23ED82
	for <lists+linux-input@lfdr.de>; Fri,  7 Aug 2020 14:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbgHGMol (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Aug 2020 08:44:41 -0400
Received: from mga01.intel.com ([192.55.52.88]:46169 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728478AbgHGMol (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 7 Aug 2020 08:44:41 -0400
IronPort-SDR: n1na//o/TQb8AbWK4dxn5Va5A3NvVhtYIxrTHgnAt1hE4CDW0mzbvlya+Q5y47N0mB+2VJLE8o
 rqVWxAIOT1Mw==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="171138684"
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; 
   d="scan'208";a="171138684"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2020 05:44:40 -0700
IronPort-SDR: sox4OBhnspRcauVy8dtskAEuNEKenAOBbIxf9m0E+rDM9Ne4SRWx8l6yvBY+yZK47RuYdeIJSg
 xWhtxG//zAig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; 
   d="scan'208";a="493543255"
Received: from lkp-server02.sh.intel.com (HELO 090e49ab5480) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 07 Aug 2020 05:44:39 -0700
Received: from kbuild by 090e49ab5480 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k41jj-0000FJ-3W; Fri, 07 Aug 2020 12:44:39 +0000
Date:   Fri, 07 Aug 2020 20:44:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 d862a3068ea593dc904ef524d8548467755ce36f
Message-ID: <5f2d4c90.OLy9VuPMMS+Kd+xc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  master
branch HEAD: d862a3068ea593dc904ef524d8548467755ce36f  Input: exc3000 - add support to query model and fw_version

elapsed time: 720m

configs tested: 135
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                       mainstone_defconfig
sh                   sh7770_generic_defconfig
mips                       rbtx49xx_defconfig
ia64                         bigsur_defconfig
arm                          simpad_defconfig
sh                          polaris_defconfig
powerpc64                           defconfig
mips                  mips_paravirt_defconfig
microblaze                      mmu_defconfig
sh                          rsk7201_defconfig
arm                         axm55xx_defconfig
xtensa                    xip_kc705_defconfig
m68k                       m5475evb_defconfig
powerpc                       holly_defconfig
powerpc                    amigaone_defconfig
sh                           se7712_defconfig
arc                           tb10x_defconfig
sh                           se7780_defconfig
mips                   sb1250_swarm_defconfig
sh                          r7780mp_defconfig
arm                        realview_defconfig
arm                           sunxi_defconfig
microblaze                    nommu_defconfig
mips                        jmr3927_defconfig
arm                          ep93xx_defconfig
mips                            e55_defconfig
arc                      axs103_smp_defconfig
mips                      fuloong2e_defconfig
powerpc                    mvme5100_defconfig
mips                        bcm47xx_defconfig
mips                     loongson1b_defconfig
sh                         apsh4a3a_defconfig
m68k                       m5249evb_defconfig
powerpc                      chrp32_defconfig
mips                        omega2p_defconfig
arm                            xcep_defconfig
sh                   rts7751r2dplus_defconfig
arm                       imx_v4_v5_defconfig
arm                     eseries_pxa_defconfig
arm                            pleb_defconfig
arm                        keystone_defconfig
arm                          collie_defconfig
mips                           jazz_defconfig
sh                        sh7763rdp_defconfig
arm                             ezx_defconfig
sh                          lboxre2_defconfig
s390                          debug_defconfig
sh                           se7722_defconfig
ia64                            zx1_defconfig
mips                 decstation_r4k_defconfig
openrisc                    or1ksim_defconfig
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
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
x86_64               randconfig-a006-20200806
x86_64               randconfig-a001-20200806
x86_64               randconfig-a004-20200806
x86_64               randconfig-a005-20200806
x86_64               randconfig-a003-20200806
x86_64               randconfig-a002-20200806
i386                 randconfig-a005-20200807
i386                 randconfig-a004-20200807
i386                 randconfig-a001-20200807
i386                 randconfig-a002-20200807
i386                 randconfig-a003-20200807
i386                 randconfig-a006-20200807
i386                 randconfig-a005-20200806
i386                 randconfig-a004-20200806
i386                 randconfig-a001-20200806
i386                 randconfig-a002-20200806
i386                 randconfig-a003-20200806
i386                 randconfig-a006-20200806
x86_64               randconfig-a013-20200807
x86_64               randconfig-a011-20200807
x86_64               randconfig-a012-20200807
x86_64               randconfig-a016-20200807
x86_64               randconfig-a015-20200807
x86_64               randconfig-a014-20200807
i386                 randconfig-a015-20200805
i386                 randconfig-a016-20200805
i386                 randconfig-a011-20200805
i386                 randconfig-a012-20200805
i386                 randconfig-a013-20200805
i386                 randconfig-a014-20200805
i386                 randconfig-a011-20200807
i386                 randconfig-a012-20200807
i386                 randconfig-a013-20200807
i386                 randconfig-a015-20200807
i386                 randconfig-a014-20200807
i386                 randconfig-a016-20200807
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
