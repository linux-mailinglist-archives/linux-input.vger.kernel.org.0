Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0BB81A0D5A
	for <lists+linux-input@lfdr.de>; Tue,  7 Apr 2020 14:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728548AbgDGMNX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Apr 2020 08:13:23 -0400
Received: from mga17.intel.com ([192.55.52.151]:47081 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726562AbgDGMNX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Apr 2020 08:13:23 -0400
IronPort-SDR: HdKWSznzNDMhBp4WIrpEACVTGVpjdRjnfLrh6st1k7wnd/3ZpzHOJG8yjT72DUsNm0zKsJQ5w0
 smLtfTD2aKxA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 05:13:22 -0700
IronPort-SDR: ro26UaMH4QGcyyDwPcd7Aima6euepPd0ipZVlmdSrw4tNgQwMmJotaZ2uRAfzOEkFO6tDTJYSV
 yftP4/xM83Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,354,1580803200"; 
   d="scan'208";a="242058507"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Apr 2020 05:13:21 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jLn6W-0005I9-TU; Tue, 07 Apr 2020 20:13:20 +0800
Date:   Tue, 07 Apr 2020 20:12:28 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:for-linus] BUILD SUCCESS
 cd510679f4b588b7726fc8b25e5a0afd6f889b14
Message-ID: <5e8c6e2c.GQ2yg05DnLqOY5tY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  for-linus
branch HEAD: cd510679f4b588b7726fc8b25e5a0afd6f889b14  Merge branch 'next' into for-linus

elapsed time: 480m

configs tested: 139
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
m68k                           sun3_defconfig
microblaze                    nommu_defconfig
ia64                             allmodconfig
xtensa                       common_defconfig
sparc64                          allyesconfig
ia64                                defconfig
powerpc                             defconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
ia64                             alldefconfig
ia64                              allnoconfig
ia64                             allyesconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                          iss_defconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
m68k                          multi_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
powerpc                           allnoconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                      malta_kvm_defconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200407
x86_64               randconfig-a002-20200407
x86_64               randconfig-a003-20200407
i386                 randconfig-a001-20200407
i386                 randconfig-a002-20200407
i386                 randconfig-a003-20200407
riscv                randconfig-a001-20200407
alpha                randconfig-a001-20200407
m68k                 randconfig-a001-20200407
nds32                randconfig-a001-20200407
parisc               randconfig-a001-20200407
sparc64              randconfig-a001-20200407
h8300                randconfig-a001-20200407
nios2                randconfig-a001-20200407
microblaze           randconfig-a001-20200407
c6x                  randconfig-a001-20200407
csky                 randconfig-a001-20200407
openrisc             randconfig-a001-20200407
s390                 randconfig-a001-20200407
sh                   randconfig-a001-20200407
xtensa               randconfig-a001-20200407
s390                 randconfig-a001-20200406
xtensa               randconfig-a001-20200406
csky                 randconfig-a001-20200406
openrisc             randconfig-a001-20200406
sh                   randconfig-a001-20200406
x86_64               randconfig-b001-20200407
x86_64               randconfig-b002-20200407
x86_64               randconfig-b003-20200407
i386                 randconfig-b001-20200407
i386                 randconfig-b002-20200407
i386                 randconfig-b003-20200407
x86_64               randconfig-d001-20200407
x86_64               randconfig-d002-20200407
x86_64               randconfig-d003-20200407
i386                 randconfig-d001-20200407
i386                 randconfig-d002-20200407
i386                 randconfig-d003-20200407
x86_64               randconfig-f001-20200407
x86_64               randconfig-f002-20200407
x86_64               randconfig-f003-20200407
i386                 randconfig-f001-20200407
i386                 randconfig-f002-20200407
i386                 randconfig-f003-20200407
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
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
