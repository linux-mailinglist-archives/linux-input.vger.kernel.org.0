Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB6B17CCCE
	for <lists+linux-input@lfdr.de>; Sat,  7 Mar 2020 09:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgCGIXa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Mar 2020 03:23:30 -0500
Received: from mga18.intel.com ([134.134.136.126]:18665 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726065AbgCGIXa (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 7 Mar 2020 03:23:30 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Mar 2020 00:23:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,525,1574150400"; 
   d="scan'208";a="414205014"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Mar 2020 00:23:27 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jAUk3-0005xM-1n; Sat, 07 Mar 2020 16:23:27 +0800
Date:   Sat, 07 Mar 2020 16:23:11 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 da3289044833769188c0da945d2cec90af35e87e
Message-ID: <5e6359ef.brk+ZjiZxbGzpzYQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  for-linus
branch HEAD: da3289044833769188c0da945d2cec90af35e87e  Input: tm2-touchkey - add support for Coreriver TC360 variant

elapsed time: 577m

configs tested: 193
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
sparc                            allyesconfig
i386                              allnoconfig
h8300                    h8300h-sim_defconfig
openrisc                 simple_smp_defconfig
sparc64                          allmodconfig
h8300                       h8s-sim_defconfig
csky                                defconfig
mips                             allmodconfig
mips                              allnoconfig
xtensa                       common_defconfig
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
xtensa                          iss_defconfig
c6x                              allyesconfig
openrisc                    or1ksim_defconfig
alpha                               defconfig
nds32                             allnoconfig
nds32                               defconfig
h8300                     edosk2674_defconfig
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
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
alpha                randconfig-a001-20200306
m68k                 randconfig-a001-20200306
mips                 randconfig-a001-20200306
nds32                randconfig-a001-20200306
parisc               randconfig-a001-20200306
riscv                randconfig-a001-20200306
alpha                randconfig-a001-20200307
m68k                 randconfig-a001-20200307
mips                 randconfig-a001-20200307
nds32                randconfig-a001-20200307
parisc               randconfig-a001-20200307
csky                 randconfig-a001-20200307
openrisc             randconfig-a001-20200307
s390                 randconfig-a001-20200307
sh                   randconfig-a001-20200307
xtensa               randconfig-a001-20200307
csky                 randconfig-a001-20200305
openrisc             randconfig-a001-20200305
s390                 randconfig-a001-20200305
sh                   randconfig-a001-20200305
xtensa               randconfig-a001-20200305
x86_64               randconfig-b001-20200305
x86_64               randconfig-b002-20200305
x86_64               randconfig-b003-20200305
i386                 randconfig-b001-20200305
i386                 randconfig-b002-20200305
i386                 randconfig-b003-20200305
x86_64               randconfig-b001-20200306
x86_64               randconfig-b002-20200306
x86_64               randconfig-b003-20200306
i386                 randconfig-b001-20200306
i386                 randconfig-b002-20200306
i386                 randconfig-b003-20200306
x86_64               randconfig-c001-20200306
x86_64               randconfig-c002-20200306
x86_64               randconfig-c003-20200306
i386                 randconfig-c001-20200306
i386                 randconfig-c002-20200306
i386                 randconfig-c003-20200306
x86_64               randconfig-d001-20200305
x86_64               randconfig-d002-20200305
x86_64               randconfig-d003-20200305
i386                 randconfig-d001-20200305
i386                 randconfig-d002-20200305
i386                 randconfig-d003-20200305
x86_64               randconfig-d001-20200307
x86_64               randconfig-d002-20200307
x86_64               randconfig-d003-20200307
i386                 randconfig-d001-20200307
i386                 randconfig-d002-20200307
i386                 randconfig-d003-20200307
x86_64               randconfig-e001-20200305
x86_64               randconfig-e002-20200305
x86_64               randconfig-e003-20200305
i386                 randconfig-e001-20200305
i386                 randconfig-e002-20200305
i386                 randconfig-e003-20200305
x86_64               randconfig-e001-20200307
x86_64               randconfig-e002-20200307
x86_64               randconfig-e003-20200307
i386                 randconfig-e001-20200307
i386                 randconfig-e002-20200307
i386                 randconfig-e003-20200307
x86_64               randconfig-f001-20200305
x86_64               randconfig-f002-20200305
x86_64               randconfig-f003-20200305
i386                 randconfig-f001-20200305
i386                 randconfig-f002-20200305
i386                 randconfig-f003-20200305
i386                 randconfig-f003-20200306
x86_64               randconfig-f001-20200306
i386                 randconfig-f001-20200306
i386                 randconfig-f002-20200306
x86_64               randconfig-f002-20200306
x86_64               randconfig-f003-20200306
x86_64               randconfig-g001-20200305
x86_64               randconfig-g002-20200305
x86_64               randconfig-g003-20200305
i386                 randconfig-g001-20200305
i386                 randconfig-g002-20200305
i386                 randconfig-g003-20200305
x86_64               randconfig-h001-20200305
x86_64               randconfig-h002-20200305
x86_64               randconfig-h003-20200305
i386                 randconfig-h001-20200305
i386                 randconfig-h002-20200305
i386                 randconfig-h003-20200305
arc                  randconfig-a001-20200307
arm                  randconfig-a001-20200307
arm64                randconfig-a001-20200307
ia64                 randconfig-a001-20200307
powerpc              randconfig-a001-20200307
sparc                randconfig-a001-20200307
arc                  randconfig-a001-20200306
arm                  randconfig-a001-20200306
arm64                randconfig-a001-20200306
ia64                 randconfig-a001-20200306
powerpc              randconfig-a001-20200306
sparc                randconfig-a001-20200306
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
