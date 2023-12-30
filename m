Return-Path: <linux-input+bounces-1057-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EBA8203FB
	for <lists+linux-input@lfdr.de>; Sat, 30 Dec 2023 09:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D611A2821E6
	for <lists+linux-input@lfdr.de>; Sat, 30 Dec 2023 08:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B8B1FC5;
	Sat, 30 Dec 2023 08:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOU7rAfe"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EE51864
	for <linux-input@vger.kernel.org>; Sat, 30 Dec 2023 08:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703923700; x=1735459700;
  h=date:from:to:cc:subject:message-id;
  bh=0Qk2H/8UNfJeVpyv2qM+orHaye48rxc3Js0TwG94IZE=;
  b=YOU7rAfeM14tQwmJV+KWtnyh7RmIQQE5sQvrMBx513rLNybM7aG6jYf1
   sgqnSuCK/5oSYgEQ+t64MVLRxZc23CQ0/Ehue7YPyx7rRPyeiHf6B5IjO
   R6EJ8HTQ56azI9vN5sqPnQcNEzVkv3qhYum2a6BnfTN2GugcHc94kDf21
   OiICgo5K/sx+aKqZGcSVrltAhlJVUv06NxtJYn7J8Qfvvg1bHpfvSNkOl
   m8iErFh+DigiK9hyuzSSwNwYCx+00nLWP3RbV7J7YLQjb38g8iteiiUfl
   D9eCfoP7fW1jZ/qQToSUj/a7giomBPvX0c7z8XaUKDgVO1Rj1WQE/DBqS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="376856126"
X-IronPort-AV: E=Sophos;i="6.04,317,1695711600"; 
   d="scan'208";a="376856126"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2023 00:08:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="922523628"
X-IronPort-AV: E=Sophos;i="6.04,317,1695711600"; 
   d="scan'208";a="922523628"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2023 00:08:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJUOG-000IF5-04;
	Sat, 30 Dec 2023 08:08:16 +0000
Date: Sat, 30 Dec 2023 16:07:27 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 0b670b54119902de75fcd20a50585cf7b573f801
Message-ID: <202312301623.aGN9hECa-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 0b670b54119902de75fcd20a50585cf7b573f801  Input: gpio-keys - filter gpio_keys -EPROBE_DEFER error messages

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-randconfig-r123-20231229
|   `-- kernel-fork.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-file-assigned-old_exe_file-got-struct-file-noderef-__rcu-assigned-_val_
|-- loongarch-randconfig-r062-20231230
|   `-- drivers-input-misc-iqs7222.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- nios2-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
|-- nios2-randconfig-001-20231229
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
|-- nios2-randconfig-r064-20231230
|   `-- drivers-input-misc-iqs7222.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
`-- riscv-allmodconfig
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
    `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
clang_recent_errors
|-- arm64-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
|-- arm64-randconfig-r063-20231230
|   |-- drivers-input-misc-iqs7222.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|   `-- drivers-input-touchscreen-iqs7211.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- hexagon-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
|-- hexagon-randconfig-r051-20231230
|   `-- drivers-input-touchscreen-edt-ft5x06.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- i386-randconfig-052-20231230
|   |-- drivers-input-misc-iqs7222.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|   `-- drivers-input-touchscreen-iqs7211.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- i386-randconfig-053-20231230
|   `-- drivers-input-misc-iqs7222.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- powerpc-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
|-- riscv-randconfig-r052-20231230
|   `-- drivers-input-misc-iqs7222.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- riscv-randconfig-r061-20231230
|   `-- drivers-input-misc-iqs7222.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- x86_64-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
|-- x86_64-buildonly-randconfig-001-20231229
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
|-- x86_64-randconfig-011-20231229
|   `-- PLEASE-submit-a-bug-report-to-https:github.com-llvm-llvm-project-issues-and-include-the-crash-backtrace-preprocessed-source-and-associated-run-script.
|-- x86_64-randconfig-012-20231229
|   `-- PLEASE-submit-a-bug-report-to-https:github.com-llvm-llvm-project-issues-and-include-the-crash-backtrace-preprocessed-source-and-associated-run-script.
|-- x86_64-randconfig-101-20231230
|   |-- drivers-input-misc-iqs7222.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|   `-- drivers-input-touchscreen-edt-ft5x06.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- x86_64-randconfig-102-20231230
|   `-- drivers-input-touchscreen-iqs7211.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
`-- x86_64-randconfig-104-20231230
    `-- drivers-input-touchscreen-edt-ft5x06.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)

elapsed time: 1446m

configs tested: 191
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231229   gcc  
arc                   randconfig-002-20231229   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                      footbridge_defconfig   gcc  
arm                         lpc32xx_defconfig   clang
arm                   milbeaut_m10v_defconfig   clang
arm                            mps2_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                   randconfig-001-20231229   clang
arm                   randconfig-002-20231229   clang
arm                   randconfig-003-20231229   clang
arm                   randconfig-004-20231229   clang
arm                        spear3xx_defconfig   clang
arm                        spear6xx_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231229   clang
arm64                 randconfig-002-20231229   clang
arm64                 randconfig-003-20231229   clang
arm64                 randconfig-004-20231229   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231229   gcc  
csky                  randconfig-002-20231229   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231229   clang
hexagon               randconfig-002-20231229   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231229   clang
i386         buildonly-randconfig-002-20231229   clang
i386         buildonly-randconfig-003-20231229   clang
i386         buildonly-randconfig-004-20231229   clang
i386         buildonly-randconfig-005-20231229   clang
i386         buildonly-randconfig-006-20231229   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231229   clang
i386                  randconfig-002-20231229   clang
i386                  randconfig-003-20231229   clang
i386                  randconfig-004-20231229   clang
i386                  randconfig-005-20231229   clang
i386                  randconfig-006-20231229   clang
i386                  randconfig-011-20231229   gcc  
i386                  randconfig-012-20231229   gcc  
i386                  randconfig-013-20231229   gcc  
i386                  randconfig-014-20231229   gcc  
i386                  randconfig-015-20231229   gcc  
i386                  randconfig-016-20231229   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231229   gcc  
loongarch             randconfig-002-20231229   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   gcc  
mips                     cu1830-neo_defconfig   clang
mips                           gcw0_defconfig   gcc  
mips                           ip22_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                     loongson2k_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231229   gcc  
nios2                 randconfig-002-20231229   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231229   gcc  
parisc                randconfig-002-20231229   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 canyonlands_defconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                      pasemi_defconfig   gcc  
powerpc               randconfig-001-20231229   clang
powerpc               randconfig-002-20231229   clang
powerpc               randconfig-003-20231229   clang
powerpc                     tqm5200_defconfig   clang
powerpc                     tqm8548_defconfig   gcc  
powerpc64             randconfig-001-20231229   clang
powerpc64             randconfig-002-20231229   clang
powerpc64             randconfig-003-20231229   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231229   clang
riscv                 randconfig-002-20231229   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231229   gcc  
s390                  randconfig-002-20231229   gcc  
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20231229   gcc  
sh                    randconfig-002-20231229   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          alldefconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231229   gcc  
sparc64               randconfig-002-20231229   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231229   clang
um                    randconfig-002-20231229   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231229   clang
x86_64       buildonly-randconfig-002-20231229   clang
x86_64       buildonly-randconfig-003-20231229   clang
x86_64       buildonly-randconfig-004-20231229   clang
x86_64       buildonly-randconfig-005-20231229   clang
x86_64       buildonly-randconfig-006-20231229   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231229   gcc  
x86_64                randconfig-002-20231229   gcc  
x86_64                randconfig-003-20231229   gcc  
x86_64                randconfig-004-20231229   gcc  
x86_64                randconfig-005-20231229   gcc  
x86_64                randconfig-006-20231229   gcc  
x86_64                randconfig-011-20231229   clang
x86_64                randconfig-012-20231229   clang
x86_64                randconfig-013-20231229   clang
x86_64                randconfig-014-20231229   clang
x86_64                randconfig-015-20231229   clang
x86_64                randconfig-016-20231229   clang
x86_64                randconfig-071-20231229   clang
x86_64                randconfig-072-20231229   clang
x86_64                randconfig-073-20231229   clang
x86_64                randconfig-074-20231229   clang
x86_64                randconfig-075-20231229   clang
x86_64                randconfig-076-20231229   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20231229   gcc  
xtensa                randconfig-002-20231229   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

