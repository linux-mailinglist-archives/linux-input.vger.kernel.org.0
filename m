Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4BD19BED0
	for <lists+linux-input@lfdr.de>; Thu,  2 Apr 2020 11:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387736AbgDBJna (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Apr 2020 05:43:30 -0400
Received: from mga14.intel.com ([192.55.52.115]:62924 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387610AbgDBJna (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 2 Apr 2020 05:43:30 -0400
IronPort-SDR: 0y1o4XBxAtauiap36TrLSqHuGYraiTIfuDJ+1DoX6LmrByx1oCgO7mdnIo5GQ3ezcWcf4eS3SQ
 s09DUcCiDy1Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 02:43:30 -0700
IronPort-SDR: pocdWL2/pZ3iZnNmBpy52QoYmAI+j+S4f4CuUfmdLJj7GA0SiYlo7Ah4GJ8crFZ2n5JA12puo7
 siuiKtdoJLWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,335,1580803200"; 
   d="scan'208";a="449563279"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Apr 2020 02:43:28 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jJwNj-000Eq4-Ew; Thu, 02 Apr 2020 17:43:27 +0800
Date:   Thu, 02 Apr 2020 17:42:32 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 c9c20ee3cfce924e7b2a8138df2d6958c500858a
Message-ID: <5e85b388.OhcLW7onirVP7CML%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  master
branch HEAD: c9c20ee3cfce924e7b2a8138df2d6958c500858a  Input: goodix - fix compilation when ACPI support is disabled

elapsed time: 800m

configs tested: 222
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
s390                              allnoconfig
sh                                allnoconfig
h8300                    h8300h-sim_defconfig
m68k                          multi_defconfig
m68k                       m5475evb_defconfig
riscv                             allnoconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                     edosk2674_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
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
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
alpha                randconfig-a001-20200401
m68k                 randconfig-a001-20200401
mips                 randconfig-a001-20200401
nds32                randconfig-a001-20200401
parisc               randconfig-a001-20200401
riscv                randconfig-a001-20200401
alpha                randconfig-a001-20200402
m68k                 randconfig-a001-20200402
mips                 randconfig-a001-20200402
nds32                randconfig-a001-20200402
parisc               randconfig-a001-20200402
riscv                randconfig-a001-20200402
c6x                  randconfig-a001-20200402
h8300                randconfig-a001-20200402
microblaze           randconfig-a001-20200402
nios2                randconfig-a001-20200402
sparc64              randconfig-a001-20200402
sparc64              randconfig-a001-20200401
h8300                randconfig-a001-20200401
nios2                randconfig-a001-20200401
microblaze           randconfig-a001-20200401
c6x                  randconfig-a001-20200401
s390                 randconfig-a001-20200401
xtensa               randconfig-a001-20200401
csky                 randconfig-a001-20200401
openrisc             randconfig-a001-20200401
sh                   randconfig-a001-20200401
csky                 randconfig-a001-20200402
openrisc             randconfig-a001-20200402
s390                 randconfig-a001-20200402
sh                   randconfig-a001-20200402
xtensa               randconfig-a001-20200402
i386                 randconfig-b003-20200402
x86_64               randconfig-b002-20200402
x86_64               randconfig-b003-20200402
x86_64               randconfig-b001-20200402
i386                 randconfig-b001-20200402
i386                 randconfig-b002-20200402
i386                 randconfig-b003-20200401
x86_64               randconfig-b002-20200401
x86_64               randconfig-b003-20200401
i386                 randconfig-b001-20200401
x86_64               randconfig-b001-20200401
i386                 randconfig-b002-20200401
x86_64               randconfig-c001-20200401
x86_64               randconfig-c002-20200401
x86_64               randconfig-c003-20200401
i386                 randconfig-c001-20200401
i386                 randconfig-c002-20200401
i386                 randconfig-c003-20200401
i386                 randconfig-c001-20200402
i386                 randconfig-c003-20200402
x86_64               randconfig-c002-20200402
x86_64               randconfig-c003-20200402
i386                 randconfig-c002-20200402
x86_64               randconfig-c001-20200402
x86_64               randconfig-d001-20200402
x86_64               randconfig-d002-20200402
x86_64               randconfig-d003-20200402
i386                 randconfig-d001-20200402
i386                 randconfig-d002-20200402
i386                 randconfig-d003-20200402
x86_64               randconfig-d001-20200401
x86_64               randconfig-d002-20200401
x86_64               randconfig-d003-20200401
i386                 randconfig-d001-20200401
i386                 randconfig-d002-20200401
i386                 randconfig-d003-20200401
x86_64               randconfig-e001-20200402
x86_64               randconfig-e002-20200402
x86_64               randconfig-e003-20200402
i386                 randconfig-e001-20200402
i386                 randconfig-e002-20200402
i386                 randconfig-e003-20200402
x86_64               randconfig-e001-20200401
x86_64               randconfig-e002-20200401
x86_64               randconfig-e003-20200401
i386                 randconfig-e001-20200401
i386                 randconfig-e002-20200401
i386                 randconfig-e003-20200401
i386                 randconfig-f001-20200402
i386                 randconfig-f003-20200402
x86_64               randconfig-f003-20200402
x86_64               randconfig-f001-20200402
i386                 randconfig-f002-20200402
x86_64               randconfig-f002-20200402
i386                 randconfig-f001-20200401
i386                 randconfig-f003-20200401
x86_64               randconfig-f003-20200401
x86_64               randconfig-f001-20200401
i386                 randconfig-f002-20200401
x86_64               randconfig-f002-20200401
x86_64               randconfig-g003-20200401
i386                 randconfig-g003-20200401
x86_64               randconfig-g002-20200401
i386                 randconfig-g001-20200401
i386                 randconfig-g002-20200401
x86_64               randconfig-g001-20200401
x86_64               randconfig-g001-20200402
x86_64               randconfig-g002-20200402
x86_64               randconfig-g003-20200402
i386                 randconfig-g001-20200402
i386                 randconfig-g002-20200402
i386                 randconfig-g003-20200402
x86_64               randconfig-h001-20200401
x86_64               randconfig-h002-20200401
x86_64               randconfig-h003-20200401
i386                 randconfig-h001-20200401
i386                 randconfig-h002-20200401
i386                 randconfig-h003-20200401
x86_64               randconfig-h001-20200402
x86_64               randconfig-h002-20200402
x86_64               randconfig-h003-20200402
i386                 randconfig-h001-20200402
i386                 randconfig-h002-20200402
i386                 randconfig-h003-20200402
arm64                randconfig-a001-20200401
sparc                randconfig-a001-20200401
ia64                 randconfig-a001-20200401
arc                  randconfig-a001-20200401
arm                  randconfig-a001-20200401
powerpc              randconfig-a001-20200401
arc                  randconfig-a001-20200402
arm                  randconfig-a001-20200402
arm64                randconfig-a001-20200402
ia64                 randconfig-a001-20200402
powerpc              randconfig-a001-20200402
sparc                randconfig-a001-20200402
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                       zfcpdump_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                               allmodconfig
sh                          rsk7269_defconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                          allmodconfig
sparc64                             defconfig
sparc64                          allyesconfig
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
