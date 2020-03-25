Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22CA9192198
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 08:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgCYHK2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 03:10:28 -0400
Received: from mga04.intel.com ([192.55.52.120]:17742 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725832AbgCYHK2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 03:10:28 -0400
IronPort-SDR: gAb6fgfbnqnzXiDsXao7J8HD7cAkB6OL0bk4nE5U58yX7jqf4ounoeU/6/ejFu9Yw+LlE7LcLC
 BPxHXldUEQTg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2020 00:10:25 -0700
IronPort-SDR: rUljuz6oxqDMv0NEzwF4/R1m4QCRABgjMYJ/rRhaYJQ2gbCAAZfgTiRbEfZs+ZBsMz3lj3kO+O
 o8rJ/my4gFmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,303,1580803200"; 
   d="scan'208";a="393540479"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 Mar 2020 00:10:23 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jH0BC-000G3k-Sq; Wed, 25 Mar 2020 15:10:22 +0800
Date:   Wed, 25 Mar 2020 15:09:32 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 52afa505a03d914081f40cb869a3248567a57573
Message-ID: <5e7b03ac.GXy2vTskKxIYfpmP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  for-linus
branch HEAD: 52afa505a03d914081f40cb869a3248567a57573  Input: avoid BIT() macro usage in the serio.h UAPI header

elapsed time: 480m

configs tested: 164
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
sparc                            allyesconfig
sh                          rsk7269_defconfig
sparc64                           allnoconfig
nios2                         3c120_defconfig
s390                             allyesconfig
sh                  sh7785lcr_32bit_defconfig
arc                                 defconfig
um                           x86_64_defconfig
nds32                             allnoconfig
powerpc                       ppc64_defconfig
riscv                    nommu_virt_defconfig
parisc                            allnoconfig
xtensa                          iss_defconfig
ia64                             allyesconfig
i386                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                                defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
c6x                              allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
alpha                               defconfig
csky                                defconfig
nds32                               defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
powerpc                             defconfig
powerpc                          rhel-kconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
x86_64               randconfig-a001-20200324
x86_64               randconfig-a002-20200324
x86_64               randconfig-a003-20200324
i386                 randconfig-a001-20200324
i386                 randconfig-a002-20200324
i386                 randconfig-a003-20200324
alpha                randconfig-a001-20200324
m68k                 randconfig-a001-20200324
mips                 randconfig-a001-20200324
nds32                randconfig-a001-20200324
parisc               randconfig-a001-20200324
riscv                randconfig-a001-20200324
h8300                randconfig-a001-20200324
microblaze           randconfig-a001-20200324
nios2                randconfig-a001-20200324
c6x                  randconfig-a001-20200324
sparc64              randconfig-a001-20200324
csky                 randconfig-a001-20200324
openrisc             randconfig-a001-20200324
s390                 randconfig-a001-20200324
xtensa               randconfig-a001-20200324
sh                   randconfig-a001-20200324
x86_64               randconfig-b001-20200324
x86_64               randconfig-b002-20200324
x86_64               randconfig-b003-20200324
i386                 randconfig-b001-20200324
i386                 randconfig-b002-20200324
i386                 randconfig-b003-20200324
x86_64               randconfig-c001-20200324
x86_64               randconfig-c002-20200324
x86_64               randconfig-c003-20200324
i386                 randconfig-c001-20200324
i386                 randconfig-c002-20200324
i386                 randconfig-c003-20200324
x86_64               randconfig-d001-20200324
x86_64               randconfig-d002-20200324
x86_64               randconfig-d003-20200324
i386                 randconfig-d001-20200324
i386                 randconfig-d002-20200324
i386                 randconfig-d003-20200324
x86_64               randconfig-e001-20200324
x86_64               randconfig-e002-20200324
x86_64               randconfig-e003-20200324
i386                 randconfig-e001-20200324
i386                 randconfig-e002-20200324
i386                 randconfig-e003-20200324
i386                 randconfig-f001-20200325
i386                 randconfig-f003-20200325
i386                 randconfig-f002-20200325
x86_64               randconfig-f002-20200325
x86_64               randconfig-f003-20200325
x86_64               randconfig-f001-20200325
i386                 randconfig-g003-20200324
x86_64               randconfig-g002-20200324
i386                 randconfig-g001-20200324
i386                 randconfig-g002-20200324
x86_64               randconfig-g001-20200324
x86_64               randconfig-g003-20200324
x86_64               randconfig-h001-20200324
x86_64               randconfig-h002-20200324
x86_64               randconfig-h003-20200324
i386                 randconfig-h001-20200324
i386                 randconfig-h002-20200324
i386                 randconfig-h003-20200324
arc                  randconfig-a001-20200324
arm                  randconfig-a001-20200324
arm64                randconfig-a001-20200324
ia64                 randconfig-a001-20200324
powerpc              randconfig-a001-20200324
sparc                randconfig-a001-20200324
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
