Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E60AD151EC9
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2020 17:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbgBDQ50 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Feb 2020 11:57:26 -0500
Received: from mga09.intel.com ([134.134.136.24]:42900 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727442AbgBDQ5Z (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 Feb 2020 11:57:25 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Feb 2020 08:57:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,402,1574150400"; 
   d="scan'208";a="224661991"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Feb 2020 08:57:23 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iz1Vr-000GNK-0D; Wed, 05 Feb 2020 00:57:23 +0800
Date:   Wed, 05 Feb 2020 00:56:51 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD SUCCESS
 c5ccf2ad3d33413fee06ae87d0b970d8cc540db6
Message-ID: <5e39a253.xmfPcmIYhtjMdp0P%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  master
branch HEAD: c5ccf2ad3d33413fee06ae87d0b970d8cc540db6  Input: synaptics-rmi4 - switch to reduced reporting mode

elapsed time: 5186m

configs tested: 196
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                         at91_dt_defconfig
arm64                               defconfig
arm                              allyesconfig
arm                               allnoconfig
arm                           efm32_defconfig
arm64                             allnoconfig
arm64                            allmodconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                            allyesconfig
sparc                            allyesconfig
mips                      fuloong2e_defconfig
i386                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
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
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
powerpc                             defconfig
microblaze                    nommu_defconfig
microblaze                      mmu_defconfig
arc                                 defconfig
powerpc                           allnoconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                             allyesconfig
mips                      malta_kvm_defconfig
mips                             allmodconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                              allnoconfig
parisc                              defconfig
parisc                            allnoconfig
parisc                            allyesonfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
x86_64               randconfig-a001-20200204
x86_64               randconfig-a002-20200204
x86_64               randconfig-a003-20200204
i386                 randconfig-a001-20200204
i386                 randconfig-a002-20200204
i386                 randconfig-a003-20200204
alpha                randconfig-a001-20200204
m68k                 randconfig-a001-20200204
mips                 randconfig-a001-20200204
nds32                randconfig-a001-20200204
parisc               randconfig-a001-20200204
riscv                randconfig-a001-20200204
c6x                  randconfig-a001-20200204
h8300                randconfig-a001-20200204
microblaze           randconfig-a001-20200204
nios2                randconfig-a001-20200204
sparc64              randconfig-a001-20200204
x86_64               randconfig-b001-20200202
x86_64               randconfig-b002-20200202
x86_64               randconfig-b003-20200202
i386                 randconfig-b001-20200202
i386                 randconfig-b002-20200202
i386                 randconfig-b003-20200202
x86_64               randconfig-b001-20200204
x86_64               randconfig-b002-20200204
x86_64               randconfig-b003-20200204
i386                 randconfig-b001-20200204
i386                 randconfig-b002-20200204
i386                 randconfig-b003-20200204
x86_64               randconfig-c001-20200204
x86_64               randconfig-c002-20200204
x86_64               randconfig-c003-20200204
i386                 randconfig-c001-20200204
i386                 randconfig-c002-20200204
i386                 randconfig-c003-20200204
x86_64               randconfig-d001-20200204
x86_64               randconfig-d002-20200204
x86_64               randconfig-d003-20200204
i386                 randconfig-d001-20200204
i386                 randconfig-d002-20200204
i386                 randconfig-d003-20200204
x86_64               randconfig-d001-20200202
x86_64               randconfig-d002-20200202
x86_64               randconfig-d003-20200202
i386                 randconfig-d001-20200202
i386                 randconfig-d002-20200202
i386                 randconfig-d003-20200202
x86_64               randconfig-e001-20200204
x86_64               randconfig-e002-20200204
x86_64               randconfig-e003-20200204
i386                 randconfig-e001-20200204
i386                 randconfig-e002-20200204
i386                 randconfig-e003-20200204
x86_64               randconfig-f001-20200204
x86_64               randconfig-f002-20200204
x86_64               randconfig-f003-20200204
i386                 randconfig-f001-20200204
i386                 randconfig-f002-20200204
i386                 randconfig-f003-20200204
x86_64               randconfig-f001-20200202
x86_64               randconfig-f002-20200202
x86_64               randconfig-f003-20200202
i386                 randconfig-f001-20200202
i386                 randconfig-f002-20200202
i386                 randconfig-f003-20200202
x86_64               randconfig-g001-20200204
x86_64               randconfig-g002-20200204
x86_64               randconfig-g003-20200204
i386                 randconfig-g001-20200204
i386                 randconfig-g002-20200204
i386                 randconfig-g003-20200204
x86_64               randconfig-g003-20200202
x86_64               randconfig-g001-20200202
i386                 randconfig-g001-20200202
x86_64               randconfig-g002-20200202
i386                 randconfig-g002-20200202
i386                 randconfig-g003-20200202
x86_64               randconfig-h001-20200202
i386                 randconfig-h002-20200202
x86_64               randconfig-h002-20200202
i386                 randconfig-h003-20200202
x86_64               randconfig-h003-20200202
i386                 randconfig-h001-20200202
x86_64               randconfig-h001-20200204
x86_64               randconfig-h002-20200204
x86_64               randconfig-h003-20200204
i386                 randconfig-h001-20200204
i386                 randconfig-h002-20200204
i386                 randconfig-h003-20200204
arc                  randconfig-a001-20200203
arm                  randconfig-a001-20200203
arm64                randconfig-a001-20200203
ia64                 randconfig-a001-20200203
powerpc              randconfig-a001-20200203
sparc                randconfig-a001-20200203
arc                  randconfig-a001-20200204
arm                  randconfig-a001-20200204
arm64                randconfig-a001-20200204
ia64                 randconfig-a001-20200204
powerpc              randconfig-a001-20200204
sparc                randconfig-a001-20200204
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
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
