Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0653C3906EA
	for <lists+linux-input@lfdr.de>; Tue, 25 May 2021 18:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232179AbhEYQwg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 May 2021 12:52:36 -0400
Received: from mga09.intel.com ([134.134.136.24]:39117 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230451AbhEYQwg (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 May 2021 12:52:36 -0400
IronPort-SDR: 6g5rMQ4sKXS3FtvCIGRWQOTRghmPmIekoCcaN8mlSPI3h8SpITw+SzYq7422fKwzb77R3oK+ZM
 WXBqUGx2IIUA==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="202258624"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="202258624"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 09:51:02 -0700
IronPort-SDR: BfiSri5q9Q0vaR1o79JsU+aZ/bSZpi4RiMJcBcgCUHTZ8W01FzTFBHsdG7YTJGhHs0PvXodm9j
 1LcraCeaFMBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="396909061"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 25 May 2021 09:51:01 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1llaGi-0001hk-E9; Tue, 25 May 2021 16:51:00 +0000
Date:   Wed, 26 May 2021 00:50:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 94a332bd8626f6c32e7ba5835dd17eeddbb76e89
Message-ID: <60ad2ae7.hHE7Jg1bo64YwPDn%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: 94a332bd8626f6c32e7ba5835dd17eeddbb76e89  Input: ims-pcu - replace some spaces with tabs

elapsed time: 722m

configs tested: 160
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                         tb0287_defconfig
arm                        clps711x_defconfig
sh                          kfr2r09_defconfig
powerpc                     rainier_defconfig
mips                         mpc30x_defconfig
um                               alldefconfig
mips                        qi_lb60_defconfig
arm                            hisi_defconfig
x86_64                              defconfig
powerpc                         wii_defconfig
arm                       spear13xx_defconfig
s390                                defconfig
xtensa                generic_kc705_defconfig
powerpc                      ep88xc_defconfig
sh                               j2_defconfig
powerpc                 mpc834x_mds_defconfig
mips                       lemote2f_defconfig
sh                           se7206_defconfig
sh                          sdk7786_defconfig
sh                            titan_defconfig
openrisc                    or1ksim_defconfig
mips                     decstation_defconfig
mips                      malta_kvm_defconfig
powerpc                     tqm8548_defconfig
ia64                            zx1_defconfig
h8300                            alldefconfig
h8300                       h8s-sim_defconfig
arm                         axm55xx_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                    mvme5100_defconfig
mips                       rbtx49xx_defconfig
powerpc                      pasemi_defconfig
csky                             alldefconfig
powerpc                       holly_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                      fuloong2e_defconfig
sh                         apsh4a3a_defconfig
sparc                            alldefconfig
arm                          iop32x_defconfig
nds32                            alldefconfig
sh                   secureedge5410_defconfig
powerpc                      bamboo_defconfig
powerpc                       ppc64_defconfig
microblaze                          defconfig
arm                            mps2_defconfig
sh                         ap325rxa_defconfig
mips                       bmips_be_defconfig
um                                allnoconfig
powerpc                   motionpro_defconfig
arc                     haps_hs_smp_defconfig
arm                           stm32_defconfig
powerpc                       maple_defconfig
mips                        jmr3927_defconfig
arm                           viper_defconfig
powerpc                        icon_defconfig
arm                         hackkit_defconfig
mips                           mtx1_defconfig
powerpc64                           defconfig
powerpc                 mpc8560_ads_defconfig
mips                        maltaup_defconfig
arm                        realview_defconfig
arc                           tb10x_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                    ge_imp3a_defconfig
sh                               alldefconfig
sparc64                             defconfig
mips                         tb0226_defconfig
arm                          lpd270_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                      pcm030_defconfig
mips                           jazz_defconfig
arm                        keystone_defconfig
arm                         orion5x_defconfig
arc                        nsimosci_defconfig
s390                       zfcpdump_defconfig
arm                       imx_v4_v5_defconfig
powerpc                 mpc834x_itx_defconfig
x86_64                           alldefconfig
m68k                        m5272c3_defconfig
mips                            e55_defconfig
sparc                            allyesconfig
mips                           rs90_defconfig
mips                       capcella_defconfig
powerpc                 mpc837x_rdb_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
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
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210525
i386                 randconfig-a002-20210525
i386                 randconfig-a005-20210525
i386                 randconfig-a006-20210525
i386                 randconfig-a003-20210525
i386                 randconfig-a004-20210525
x86_64               randconfig-a013-20210525
x86_64               randconfig-a012-20210525
x86_64               randconfig-a014-20210525
x86_64               randconfig-a016-20210525
x86_64               randconfig-a015-20210525
x86_64               randconfig-a011-20210525
i386                 randconfig-a011-20210525
i386                 randconfig-a016-20210525
i386                 randconfig-a015-20210525
i386                 randconfig-a012-20210525
i386                 randconfig-a014-20210525
i386                 randconfig-a013-20210525
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210525
x86_64               randconfig-a005-20210525
x86_64               randconfig-a006-20210525
x86_64               randconfig-a001-20210525
x86_64               randconfig-a003-20210525
x86_64               randconfig-a004-20210525
x86_64               randconfig-a002-20210525

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
