Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0D80192883
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 13:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727286AbgCYMe3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 08:34:29 -0400
Received: from mga12.intel.com ([192.55.52.136]:34213 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727177AbgCYMe3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 08:34:29 -0400
IronPort-SDR: b8twcqpfStWEcyGbvxf1kDi+Eyvo5QDpKY4Clti24LGTGN1G3aAf1z70enGf6IkAqzKfC7SsCZ
 Kz0rvHNfgFqw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2020 05:34:29 -0700
IronPort-SDR: U25pLWPEhsiAcossKnZyBWaWl/9qK3+o49BrDod0tAzWP+V1sX/PbxOgPuxB88gcZG192V+NEE
 +kGsMVo0VEXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="357787254"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2020 05:34:27 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jH5Ep-0006hC-7t; Wed, 25 Mar 2020 20:34:27 +0800
Date:   Wed, 25 Mar 2020 20:33:22 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [input:master] BUILD REGRESSION
 10ad4845cd3d760c191ab4ecef446b99a6b2c779
Message-ID: <5e7b4f92.VjQFDkFG3J++zbtM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  master
branch HEAD: 10ad4845cd3d760c191ab4ecef446b99a6b2c779  dt-bindings: touchscreen: Convert edt-ft5x06 to json-schema

Regressions in current branch:

drivers/input/touchscreen/goodix.c:554:12: error: implicit declaration of function 'acpi_execute_simple_method' [-Werror=implicit-function-declaration]
drivers/input/touchscreen/goodix.c:624:12: error: implicit declaration of function 'acpi_execute_simple_method' [-Werror=implicit-function-declaration]

Error ids grouped by kconfigs:

recent_errors
|-- arm-allmodconfig
|   `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method
|-- arm-allyesconfig
|   `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method
|-- arm-imx_v6_v7_defconfig
|   `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method
|-- m68k-allmodconfig
|   `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method
|-- m68k-allyesconfig
|   `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method
|-- mips-allmodconfig
|   `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method
|-- mips-allyesconfig
|   `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method
|-- nds32-allmodconfig
|   `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method
|-- nds32-allyesconfig
|   `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method
|-- nds32-randconfig-a001-20200324
|   `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method
|-- parisc-allmodconfig
|   `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method
|-- parisc-allyesconfig
|   `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method
|-- riscv-allmodconfig
|   `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method
|-- riscv-allyesconfig
|   `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method
|-- s390-allmodconfig
|   `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method
|-- s390-allyesconfig
|   `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method
|-- sh-allmodconfig
|   `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method
|-- sparc-allyesconfig
|   `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method
|-- sparc-randconfig-a001-20200324
|   `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method
|-- sparc64-allmodconfig
|   `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method
`-- sparc64-allyesconfig
    `-- drivers-input-touchscreen-goodix.c:error:implicit-declaration-of-function-acpi_execute_simple_method

elapsed time: 798m

configs tested: 169
configs skipped: 0

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm                           sunxi_defconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
sparc                            allyesconfig
h8300                     edosk2674_defconfig
mips                      malta_kvm_defconfig
sh                  sh7785lcr_32bit_defconfig
arc                                 defconfig
um                           x86_64_defconfig
nds32                             allnoconfig
powerpc                       ppc64_defconfig
xtensa                          iss_defconfig
i386                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                             alldefconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
c6x                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
h8300                       h8s-sim_defconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
powerpc                          rhel-kconfig
arc                              allyesconfig
powerpc                             defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
parisc                            allnoconfig
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
c6x                  randconfig-a001-20200324
h8300                randconfig-a001-20200324
microblaze           randconfig-a001-20200324
nios2                randconfig-a001-20200324
sparc64              randconfig-a001-20200324
csky                 randconfig-a001-20200324
openrisc             randconfig-a001-20200324
s390                 randconfig-a001-20200324
xtensa               randconfig-a001-20200324
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
x86_64               randconfig-f001-20200324
x86_64               randconfig-f002-20200324
x86_64               randconfig-f003-20200324
i386                 randconfig-f001-20200324
i386                 randconfig-f002-20200324
i386                 randconfig-f003-20200324
x86_64               randconfig-g001-20200324
x86_64               randconfig-g002-20200324
x86_64               randconfig-g003-20200324
i386                 randconfig-g001-20200324
i386                 randconfig-g002-20200324
i386                 randconfig-g003-20200324
x86_64               randconfig-g001-20200325
x86_64               randconfig-g002-20200325
x86_64               randconfig-g003-20200325
i386                 randconfig-g001-20200325
i386                 randconfig-g002-20200325
i386                 randconfig-g003-20200325
x86_64               randconfig-h001-20200324
x86_64               randconfig-h002-20200324
x86_64               randconfig-h003-20200324
i386                 randconfig-h001-20200324
i386                 randconfig-h002-20200324
i386                 randconfig-h003-20200324
arm                  randconfig-a001-20200324
arm64                randconfig-a001-20200324
ia64                 randconfig-a001-20200324
arc                  randconfig-a001-20200324
sparc                randconfig-a001-20200324
powerpc              randconfig-a001-20200324
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
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
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
