Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3E73ADAF7
	for <lists+linux-input@lfdr.de>; Sat, 19 Jun 2021 18:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234806AbhFSQ7e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Jun 2021 12:59:34 -0400
Received: from mga11.intel.com ([192.55.52.93]:8826 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234792AbhFSQ7d (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Jun 2021 12:59:33 -0400
IronPort-SDR: k9edk+yz1oTfQkEyxrj5Fg/uW+yCQLryfuTsimuCbsgkUChFO7WGn9YeB72Ktqg45g96lEHpAO
 zc9RUuIrOl7w==
X-IronPort-AV: E=McAfee;i="6200,9189,10020"; a="203658922"
X-IronPort-AV: E=Sophos;i="5.83,285,1616482800"; 
   d="scan'208";a="203658922"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2021 09:57:22 -0700
IronPort-SDR: cF7d7kSp0ua04D/IWf9vc0PBvT60lttNR6Y2v52WCiZyrNbtHrHg4ZRzkdDN969DCg2xXLzr/m
 ZK4V1J3kqubQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,285,1616482800"; 
   d="scan'208";a="555854098"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2021 09:57:21 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lueHY-0003gd-Uo; Sat, 19 Jun 2021 16:57:20 +0000
Date:   Sun, 20 Jun 2021 00:56:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 aaf35899668ffca7999f8a5b02bf051b5fe5dc1a
Message-ID: <60ce21c7.6HhltXBf5E38LG8a%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git master
branch HEAD: aaf35899668ffca7999f8a5b02bf051b5fe5dc1a  dt-bindings: input: touchscreen: st1232: Convert to json-schema

elapsed time: 721m

configs tested: 140
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          rsk7269_defconfig
powerpc                     asp8347_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     skiroot_defconfig
arm                         bcm2835_defconfig
ia64                                defconfig
powerpc                    klondike_defconfig
mips                          rb532_defconfig
powerpc                     tqm8540_defconfig
powerpc                 mpc834x_itx_defconfig
sh                          polaris_defconfig
x86_64                            allnoconfig
xtensa                       common_defconfig
arm                          pxa168_defconfig
powerpc                 mpc836x_rdk_defconfig
h8300                     edosk2674_defconfig
arm                        clps711x_defconfig
riscv                            allyesconfig
sh                           se7722_defconfig
mips                  maltasmvp_eva_defconfig
m68k                       m5249evb_defconfig
mips                         cobalt_defconfig
m68k                        stmark2_defconfig
um                           x86_64_defconfig
powerpc                        fsp2_defconfig
arm                          badge4_defconfig
sh                           se7619_defconfig
powerpc                      pmac32_defconfig
arc                          axs101_defconfig
sh                          sdk7786_defconfig
powerpc                     pseries_defconfig
m68k                         amcore_defconfig
arm                             pxa_defconfig
sh                                  defconfig
arm                            pleb_defconfig
m68k                        m5272c3_defconfig
mips                      maltaaprp_defconfig
arm                         axm55xx_defconfig
arc                        vdk_hs38_defconfig
m68k                        mvme16x_defconfig
microblaze                          defconfig
s390                                defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                      obs600_defconfig
arm                           spitz_defconfig
powerpc                     mpc83xx_defconfig
ia64                            zx1_defconfig
csky                             alldefconfig
powerpc                      ppc40x_defconfig
ia64                      gensparse_defconfig
arm                        oxnas_v6_defconfig
mips                      malta_kvm_defconfig
mips                           xway_defconfig
mips                          ath25_defconfig
s390                          debug_defconfig
powerpc                     tqm5200_defconfig
arm                       netwinder_defconfig
arc                           tb10x_defconfig
arm                             ezx_defconfig
powerpc                     kmeter1_defconfig
powerpc                       maple_defconfig
powerpc                      ep88xc_defconfig
sparc                            alldefconfig
sh                           sh2007_defconfig
arm                        realview_defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20210618
i386                 randconfig-a006-20210618
i386                 randconfig-a004-20210618
i386                 randconfig-a001-20210618
i386                 randconfig-a005-20210618
i386                 randconfig-a003-20210618
x86_64               randconfig-a015-20210618
x86_64               randconfig-a014-20210618
x86_64               randconfig-a016-20210618
x86_64               randconfig-a011-20210618
x86_64               randconfig-a012-20210618
x86_64               randconfig-a013-20210618
i386                 randconfig-a015-20210618
i386                 randconfig-a016-20210618
i386                 randconfig-a013-20210618
i386                 randconfig-a014-20210618
i386                 randconfig-a012-20210618
i386                 randconfig-a011-20210618
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210618
x86_64               randconfig-a002-20210618
x86_64               randconfig-a001-20210618
x86_64               randconfig-a004-20210618
x86_64               randconfig-a003-20210618
x86_64               randconfig-a006-20210618
x86_64               randconfig-a005-20210618

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
