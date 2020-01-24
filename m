Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21E99149026
	for <lists+linux-input@lfdr.de>; Fri, 24 Jan 2020 22:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728731AbgAXVas (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Jan 2020 16:30:48 -0500
Received: from mga06.intel.com ([134.134.136.31]:17977 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725747AbgAXVas (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Jan 2020 16:30:48 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Jan 2020 13:30:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; 
   d="scan'208";a="221148427"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Jan 2020 13:30:46 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iv6XN-000IMi-TJ; Sat, 25 Jan 2020 05:30:45 +0800
Date:   Sat, 25 Jan 2020 05:30:06 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD INCOMPLETE
 273db8f03509619cd570a4b1225b399f8fb4b0b7
Message-ID: <5e2b61de.mlKnYarA7ps6d1nd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  master
branch HEAD: 273db8f03509619cd570a4b1225b399f8fb4b0b7  Input: add IOC3 serio driver

TIMEOUT after 2885m


Sorry we cannot finish the testset for your branch within a reasonable time.
It's our fault -- either some build server is down or some build worker is busy
doing bisects for _other_ trees. The branch will get more complete coverage and
possible error reports when our build infrastructure is restored or catches up.
There will be no more build success notification for this branch head, but you
can expect reasonably good test coverage after waiting for 1 day.

configs timed out: 50

alpha                               defconfig
arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm64                               defconfig
csky                                defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
nds32                             allnoconfig
nds32                               defconfig
parisc                            allnoconfig
parisc                            allyesonfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

configs tested: 72
configs skipped: 0

x86_64               randconfig-f001-20200123
x86_64               randconfig-f002-20200123
x86_64               randconfig-f003-20200123
i386                 randconfig-f001-20200123
i386                 randconfig-f002-20200123
i386                 randconfig-f003-20200123
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
x86_64               randconfig-h001-20200123
x86_64               randconfig-h002-20200123
x86_64               randconfig-h003-20200123
i386                 randconfig-h001-20200123
i386                 randconfig-h002-20200123
i386                 randconfig-h003-20200123
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
openrisc                 simple_smp_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
i386                             alldefconfig
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
x86_64               randconfig-g001-20200123
x86_64               randconfig-g002-20200123
x86_64               randconfig-g003-20200123
i386                 randconfig-g001-20200123
i386                 randconfig-g002-20200123
i386                 randconfig-g003-20200123
x86_64               randconfig-e001-20200123
x86_64               randconfig-e002-20200123
x86_64               randconfig-e003-20200123
i386                 randconfig-e001-20200123
i386                 randconfig-e002-20200123
i386                 randconfig-e003-20200123
csky                 randconfig-a001-20200123
openrisc             randconfig-a001-20200123
s390                 randconfig-a001-20200123
sh                   randconfig-a001-20200123
xtensa               randconfig-a001-20200123

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
