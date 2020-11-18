Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0122B8104
	for <lists+linux-input@lfdr.de>; Wed, 18 Nov 2020 16:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgKRPns (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Nov 2020 10:43:48 -0500
Received: from mga04.intel.com ([192.55.52.120]:62015 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbgKRPnr (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Nov 2020 10:43:47 -0500
IronPort-SDR: hWiYLFbtLvtdsf5Q9XKwlKLsA0evO9gy5y8Cz7tfLK3+H4CTNGqJdr0tlaZS2ENSPRABoCE9Yk
 0g7G3hVNbOBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="168562719"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="168562719"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 07:43:46 -0800
IronPort-SDR: i3FSC46PfKDkgilKZQb7LFh1E/olaXZxdH7Tg+oWdRjOVxcwqMQZmVWk7KLyh+r0W5PofIKmZy
 6T+FmvlS0G3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="325629235"
Received: from lkp-server02.sh.intel.com (HELO 67996b229c47) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 18 Nov 2020 07:43:45 -0800
Received: from kbuild by 67996b229c47 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kfPcW-00009J-Kx; Wed, 18 Nov 2020 15:43:44 +0000
Date:   Wed, 18 Nov 2020 23:43:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 c6c746508981f22ffa754e0c8fcee00da6923b9e
Message-ID: <5fb54114.WEl2p19EDPm7LKKC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  master
branch HEAD: c6c746508981f22ffa754e0c8fcee00da6923b9e  Input: atmel_mxt_ts - support regulator supplies

elapsed time: 725m

configs tested: 154
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          rsk7269_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                        edosk7760_defconfig
sh                         microdev_defconfig
sh                            shmin_defconfig
sh                            migor_defconfig
sh                 kfr2r09-romimage_defconfig
arm                           corgi_defconfig
powerpc64                           defconfig
arm                            lart_defconfig
powerpc                     rainier_defconfig
powerpc                     mpc5200_defconfig
m68k                            mac_defconfig
arm                          tango4_defconfig
arm                        spear3xx_defconfig
mips                malta_kvm_guest_defconfig
powerpc                       maple_defconfig
arm                            qcom_defconfig
c6x                         dsk6455_defconfig
arc                           tb10x_defconfig
powerpc                    ge_imp3a_defconfig
arm                          gemini_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     ksi8560_defconfig
microblaze                    nommu_defconfig
arm                          exynos_defconfig
mips                 decstation_r4k_defconfig
mips                      maltasmvp_defconfig
mips                           ci20_defconfig
arc                         haps_hs_defconfig
sh                   sh7770_generic_defconfig
mips                      loongson3_defconfig
arm                            mps2_defconfig
arc                     nsimosci_hs_defconfig
mips                            ar7_defconfig
powerpc                      cm5200_defconfig
mips                          malta_defconfig
openrisc                    or1ksim_defconfig
arm                         hackkit_defconfig
m68k                         apollo_defconfig
mips                          rm200_defconfig
mips                  decstation_64_defconfig
sh                            hp6xx_defconfig
mips                       bmips_be_defconfig
c6x                        evmc6472_defconfig
sh                                  defconfig
mips                        omega2p_defconfig
arm                         mv78xx0_defconfig
powerpc                           allnoconfig
s390                       zfcpdump_defconfig
powerpc                     pq2fads_defconfig
powerpc                      pmac32_defconfig
powerpc                 mpc8315_rdb_defconfig
sh                          polaris_defconfig
sh                           se7724_defconfig
m68k                          atari_defconfig
sh                        dreamcast_defconfig
mips                      maltaaprp_defconfig
arm                         socfpga_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                               j2_defconfig
xtensa                  cadence_csp_defconfig
arm                          prima2_defconfig
powerpc                    gamecube_defconfig
h8300                            alldefconfig
mips                      bmips_stb_defconfig
s390                             alldefconfig
arm                           h5000_defconfig
arm                        neponset_defconfig
i386                                defconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a005-20201118
x86_64               randconfig-a003-20201118
x86_64               randconfig-a004-20201118
x86_64               randconfig-a002-20201118
x86_64               randconfig-a006-20201118
x86_64               randconfig-a001-20201118
i386                 randconfig-a006-20201117
i386                 randconfig-a005-20201117
i386                 randconfig-a001-20201117
i386                 randconfig-a002-20201117
i386                 randconfig-a004-20201117
i386                 randconfig-a003-20201117
i386                 randconfig-a006-20201118
i386                 randconfig-a005-20201118
i386                 randconfig-a002-20201118
i386                 randconfig-a001-20201118
i386                 randconfig-a003-20201118
i386                 randconfig-a004-20201118
i386                 randconfig-a012-20201118
i386                 randconfig-a014-20201118
i386                 randconfig-a016-20201118
i386                 randconfig-a011-20201118
i386                 randconfig-a013-20201118
i386                 randconfig-a015-20201118
i386                 randconfig-a016-20201117
i386                 randconfig-a015-20201117
i386                 randconfig-a012-20201117
i386                 randconfig-a014-20201117
i386                 randconfig-a011-20201117
i386                 randconfig-a013-20201117
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20201118
x86_64               randconfig-a014-20201118
x86_64               randconfig-a011-20201118
x86_64               randconfig-a013-20201118
x86_64               randconfig-a016-20201118
x86_64               randconfig-a012-20201118

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
