Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8655E19D8B8
	for <lists+linux-input@lfdr.de>; Fri,  3 Apr 2020 16:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbgDCOMB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Apr 2020 10:12:01 -0400
Received: from mga12.intel.com ([192.55.52.136]:55597 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727431AbgDCOMB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 3 Apr 2020 10:12:01 -0400
IronPort-SDR: 1DNPkp5cg0GgR5TLZCFKT8Byi56BSpxnbzy3ZA0UWqFTV7u8Cuc2ZZbvOuoY6arCdpaGOhOgxl
 WjlRDNgLqWTQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2020 07:12:00 -0700
IronPort-SDR: 79QVNc1m0ksFA2k+P/FZ8UPmJyyIJ7gHud5t4NHaQr0h9Po4XWIFzZXr88DPKB12CRJnuQZJ26
 KONecocHUNTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,339,1580803200"; 
   d="scan'208";a="268368414"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Apr 2020 07:11:59 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jKN38-000Bs1-9k; Fri, 03 Apr 2020 22:11:58 +0800
Date:   Fri, 03 Apr 2020 22:11:44 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 3a8579629665bd6c0b37afcb2291080e959b885d
Message-ID: <5e874420.x4x1PR5VvvmQZ+lU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  master
branch HEAD: 3a8579629665bd6c0b37afcb2291080e959b885d  Input: update SPDX tag for input-event-codes.h

elapsed time: 1136m

configs tested: 161
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
c6x                              allyesconfig
nds32                               defconfig
s390                       zfcpdump_defconfig
ia64                              allnoconfig
sh                  sh7785lcr_32bit_defconfig
csky                                defconfig
parisc                            allnoconfig
powerpc                       ppc64_defconfig
i386                                defconfig
openrisc                    or1ksim_defconfig
i386                             alldefconfig
i386                             allyesconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
alpha                               defconfig
nds32                             allnoconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200403
x86_64               randconfig-a002-20200403
x86_64               randconfig-a003-20200403
i386                 randconfig-a001-20200403
i386                 randconfig-a002-20200403
i386                 randconfig-a003-20200403
mips                 randconfig-a001-20200403
alpha                randconfig-a001-20200403
m68k                 randconfig-a001-20200403
nds32                randconfig-a001-20200403
parisc               randconfig-a001-20200403
c6x                  randconfig-a001-20200403
h8300                randconfig-a001-20200403
microblaze           randconfig-a001-20200403
nios2                randconfig-a001-20200403
sparc64              randconfig-a001-20200403
csky                 randconfig-a001-20200403
openrisc             randconfig-a001-20200403
s390                 randconfig-a001-20200403
sh                   randconfig-a001-20200403
xtensa               randconfig-a001-20200403
x86_64               randconfig-b001-20200403
x86_64               randconfig-b002-20200403
x86_64               randconfig-b003-20200403
i386                 randconfig-b001-20200403
i386                 randconfig-b002-20200403
i386                 randconfig-b003-20200403
x86_64               randconfig-c001-20200403
x86_64               randconfig-c002-20200403
x86_64               randconfig-c003-20200403
i386                 randconfig-c001-20200403
i386                 randconfig-c002-20200403
i386                 randconfig-c003-20200403
x86_64               randconfig-d001-20200403
x86_64               randconfig-d002-20200403
x86_64               randconfig-d003-20200403
i386                 randconfig-d001-20200403
i386                 randconfig-d002-20200403
i386                 randconfig-d003-20200403
x86_64               randconfig-e001-20200403
x86_64               randconfig-e002-20200403
x86_64               randconfig-e003-20200403
i386                 randconfig-e001-20200403
i386                 randconfig-e002-20200403
i386                 randconfig-e003-20200403
x86_64               randconfig-f001-20200403
x86_64               randconfig-f002-20200403
x86_64               randconfig-f003-20200403
i386                 randconfig-f001-20200403
i386                 randconfig-f002-20200403
i386                 randconfig-f003-20200403
x86_64               randconfig-g001-20200403
x86_64               randconfig-g002-20200403
x86_64               randconfig-g003-20200403
i386                 randconfig-g001-20200403
i386                 randconfig-g002-20200403
i386                 randconfig-g003-20200403
x86_64               randconfig-h001-20200403
x86_64               randconfig-h002-20200403
x86_64               randconfig-h003-20200403
i386                 randconfig-h001-20200403
i386                 randconfig-h002-20200403
i386                 randconfig-h003-20200403
arc                  randconfig-a001-20200403
arm                  randconfig-a001-20200403
arm64                randconfig-a001-20200403
ia64                 randconfig-a001-20200403
powerpc              randconfig-a001-20200403
sparc                randconfig-a001-20200403
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
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                            titan_defconfig
sparc                               defconfig
sparc64                          allmodconfig
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
