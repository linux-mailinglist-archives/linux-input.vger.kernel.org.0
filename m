Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC0D1392DD0
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 14:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234797AbhE0MTR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 May 2021 08:19:17 -0400
Received: from mga01.intel.com ([192.55.52.88]:36624 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234091AbhE0MTR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 May 2021 08:19:17 -0400
IronPort-SDR: Dw3I5Ai7nbahOwCqIkbPTljTL5j1esHuCU2G2nm02EXw5YK+/ASZQRAk98gnDtKRNIs3krTPv7
 zgUmeKeYTJAQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223921201"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; 
   d="scan'208";a="223921201"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2021 05:17:28 -0700
IronPort-SDR: 21MWuLq/9u4McXm3o1gVDOqmgZlUxHmKg3FieT9yg4751cL0O0RKOxWdqIF6ARuoqgYk4+FWtU
 DUSdpHbeYVwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; 
   d="scan'208";a="398182528"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 May 2021 05:17:26 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lmEx4-0002ks-7a; Thu, 27 May 2021 12:17:26 +0000
Date:   Thu, 27 May 2021 20:16:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS WITH WARNING
 6cf3b3abbf0b3b778138c0f8936aa7820af62cfc
Message-ID: <60af8d98.tyIcAFCQdyiul2xO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: 6cf3b3abbf0b3b778138c0f8936aa7820af62cfc  Input: cyttsp - obtain regulators

possible Warning in current branch:

drivers/input/touchscreen/resistive-adc-touch.c:101 grts_cb() error: uninitialized symbol 'y'.
drivers/input/touchscreen/resistive-adc-touch.c:84 grts_cb() error: uninitialized symbol 'z2'.
drivers/input/touchscreen/resistive-adc-touch.c:88 grts_cb() error: uninitialized symbol 'x'.

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- x86_64-randconfig-m001-20210526
    |-- drivers-input-touchscreen-resistive-adc-touch.c-grts_cb()-error:uninitialized-symbol-x-.
    |-- drivers-input-touchscreen-resistive-adc-touch.c-grts_cb()-error:uninitialized-symbol-y-.
    `-- drivers-input-touchscreen-resistive-adc-touch.c-grts_cb()-error:uninitialized-symbol-z2-.

elapsed time: 725m

configs tested: 147
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                          pcm027_defconfig
powerpc                          g5_defconfig
mips                       capcella_defconfig
powerpc                     tqm8555_defconfig
arm                             ezx_defconfig
mips                           ip32_defconfig
m68k                         amcore_defconfig
mips                        jmr3927_defconfig
powerpc                      ppc44x_defconfig
mips                        nlm_xlp_defconfig
powerpc                  iss476-smp_defconfig
powerpc                  mpc866_ads_defconfig
xtensa                         virt_defconfig
arm                          ep93xx_defconfig
s390                                defconfig
sh                           se7705_defconfig
powerpc                       maple_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                              alldefconfig
powerpc                    sam440ep_defconfig
sh                        edosk7760_defconfig
arm                          iop32x_defconfig
arm                         lpc32xx_defconfig
arm                          ixp4xx_defconfig
sh                          lboxre2_defconfig
powerpc                     tqm8560_defconfig
powerpc                     skiroot_defconfig
arm                     davinci_all_defconfig
arc                        vdk_hs38_defconfig
sparc64                          alldefconfig
i386                                defconfig
arm                          pxa910_defconfig
powerpc                 mpc8313_rdb_defconfig
arc                     nsimosci_hs_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                       ebony_defconfig
mips                        vocore2_defconfig
mips                        workpad_defconfig
arm                          moxart_defconfig
mips                          malta_defconfig
powerpc                     pseries_defconfig
powerpc                 mpc834x_mds_defconfig
sh                          r7780mp_defconfig
m68k                          amiga_defconfig
powerpc                    mvme5100_defconfig
mips                          ath79_defconfig
arm                          lpd270_defconfig
powerpc                   lite5200b_defconfig
alpha                               defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                     tqm8548_defconfig
arm                        multi_v5_defconfig
mips                            e55_defconfig
powerpc                      mgcoge_defconfig
openrisc                            defconfig
mips                     loongson1c_defconfig
m68k                             allmodconfig
arm                            qcom_defconfig
arm                       cns3420vb_defconfig
arc                        nsim_700_defconfig
m68k                        mvme147_defconfig
mips                        nlm_xlr_defconfig
mips                     cu1830-neo_defconfig
arm                           corgi_defconfig
mips                     cu1000-neo_defconfig
parisc                generic-64bit_defconfig
sh                            shmin_defconfig
mips                           ci20_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20210526
x86_64               randconfig-a001-20210526
x86_64               randconfig-a006-20210526
x86_64               randconfig-a003-20210526
x86_64               randconfig-a004-20210526
x86_64               randconfig-a002-20210526
i386                 randconfig-a001-20210526
i386                 randconfig-a002-20210526
i386                 randconfig-a005-20210526
i386                 randconfig-a004-20210526
i386                 randconfig-a003-20210526
i386                 randconfig-a006-20210526
i386                 randconfig-a011-20210526
i386                 randconfig-a016-20210526
i386                 randconfig-a015-20210526
i386                 randconfig-a012-20210526
i386                 randconfig-a014-20210526
i386                 randconfig-a013-20210526
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210526
x86_64               randconfig-a013-20210526
x86_64               randconfig-a012-20210526
x86_64               randconfig-a014-20210526
x86_64               randconfig-a016-20210526
x86_64               randconfig-a015-20210526
x86_64               randconfig-a011-20210526

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
