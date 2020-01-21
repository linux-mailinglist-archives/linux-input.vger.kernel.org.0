Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D804C144050
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2020 16:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbgAUPO7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jan 2020 10:14:59 -0500
Received: from mga02.intel.com ([134.134.136.20]:35625 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727059AbgAUPO7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Jan 2020 10:14:59 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Jan 2020 07:14:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,346,1574150400"; 
   d="scan'208";a="244725066"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Jan 2020 07:14:57 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1itvF2-0005gQ-S9; Tue, 21 Jan 2020 23:14:56 +0800
Date:   Tue, 21 Jan 2020 23:14:06 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:next] BUILD SUCCESS
 0dfed6dc24576f256782d5288537927c69256081
Message-ID: <5e27153e.w5sl3+eIN8pm1wOw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  next
branch HEAD: 0dfed6dc24576f256782d5288537927c69256081  Input: ads7846 - use new `delay` structure for SPI transfer delays

elapsed time: 322m

configs tested: 152
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
arc                  randconfig-a001-20200121
arm                  randconfig-a001-20200121
arm64                randconfig-a001-20200121
ia64                 randconfig-a001-20200121
powerpc              randconfig-a001-20200121
sparc                randconfig-a001-20200121
x86_64               randconfig-h001-20200121
x86_64               randconfig-h002-20200121
x86_64               randconfig-h003-20200121
i386                 randconfig-h001-20200121
i386                 randconfig-h002-20200121
i386                 randconfig-h003-20200121
parisc                            allnoconfig
parisc                            allyesonfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
csky                 randconfig-a001-20200121
openrisc             randconfig-a001-20200121
s390                 randconfig-a001-20200121
sh                   randconfig-a001-20200121
xtensa               randconfig-a001-20200121
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
x86_64               randconfig-b001-20200121
x86_64               randconfig-b002-20200121
x86_64               randconfig-b003-20200121
i386                 randconfig-b001-20200121
i386                 randconfig-b002-20200121
i386                 randconfig-b003-20200121
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
alpha                randconfig-a001-20200121
m68k                 randconfig-a001-20200121
mips                 randconfig-a001-20200121
nds32                randconfig-a001-20200121
parisc               randconfig-a001-20200121
riscv                randconfig-a001-20200121
x86_64               randconfig-d001-20200121
x86_64               randconfig-d002-20200121
x86_64               randconfig-d003-20200121
i386                 randconfig-d001-20200121
i386                 randconfig-d002-20200121
i386                 randconfig-d003-20200121
x86_64               randconfig-e001-20200121
x86_64               randconfig-e002-20200121
x86_64               randconfig-e003-20200121
i386                 randconfig-e001-20200121
i386                 randconfig-e002-20200121
i386                 randconfig-e003-20200121
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
arm64                               defconfig
um                           x86_64_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
arm                              allmodconfig
arm64                            allmodconfig
um                                  defconfig
um                             i386_defconfig
x86_64               randconfig-g001-20200121
x86_64               randconfig-g002-20200121
x86_64               randconfig-g003-20200121
i386                 randconfig-g001-20200121
i386                 randconfig-g002-20200121
i386                 randconfig-g003-20200121
i386                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
c6x                  randconfig-a001-20200121
h8300                randconfig-a001-20200121
microblaze           randconfig-a001-20200121
nios2                randconfig-a001-20200121
sparc64              randconfig-a001-20200121
x86_64               randconfig-f001-20200121
x86_64               randconfig-f002-20200121
x86_64               randconfig-f003-20200121
i386                 randconfig-f001-20200121
i386                 randconfig-f002-20200121
i386                 randconfig-f003-20200121
arm                               allnoconfig
arm                              allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                             allnoconfig
arm64                            allyesconfig

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
