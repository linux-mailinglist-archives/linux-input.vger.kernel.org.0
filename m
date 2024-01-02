Return-Path: <linux-input+bounces-1085-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C0F8224DC
	for <lists+linux-input@lfdr.de>; Tue,  2 Jan 2024 23:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F07AB20BB1
	for <lists+linux-input@lfdr.de>; Tue,  2 Jan 2024 22:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E5017727;
	Tue,  2 Jan 2024 22:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4MO+Pv5"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B7F17722
	for <linux-input@vger.kernel.org>; Tue,  2 Jan 2024 22:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704235212; x=1735771212;
  h=date:from:to:cc:subject:message-id;
  bh=r0h2p/8uBuRm53IIfKd4XxDjiq89nG5WbsFtbBu8/OU=;
  b=N4MO+Pv5JACbsM7FfHc32Qa05gwTsUK+C9WVippav8xV1jd+iLeF77d3
   Z5teifAlj1pdCxleVn39jtYEVvjWFbUsK9Vgog7gkjIn2BrtC7Tt1MoQ0
   MVXmiL9SK9SV4bRahhPFMUHjlbvzCG8FAELvImYweN8w3TT7cvfg7J9Pp
   ZlVQT8kMqf+bFw4O0gjre2DnPbXcn5alGZtdaskoo4qKCp51MmktcxMci
   D20xWxGvW8xP48mEHiAJ+UwmqtaYpwJ41WHfLm26OjYaVNGeerwd3U7XZ
   dSMLTUQF2EWjdxVlVkghxIczzjPRMG9D9u+vyuE5F/RHPY6q09ZpVunkH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="4275149"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; 
   d="scan'208";a="4275149"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 14:40:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="1111174052"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; 
   d="scan'208";a="1111174052"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 02 Jan 2024 14:40:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKnQd-000LWR-39;
	Tue, 02 Jan 2024 22:40:07 +0000
Date: Wed, 03 Jan 2024 06:39:54 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 992bbc9e9ab9abe5bc1ea9a1a8d61331b28f848e
Message-ID: <202401030649.37wusXV8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 992bbc9e9ab9abe5bc1ea9a1a8d61331b28f848e  Input: iqs269a - add support for OTP variants

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-randconfig-r051-20240102
|   |-- drivers-input-misc-iqs7222.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|   |-- drivers-input-touchscreen-edt-ft5x06.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|   `-- drivers-input-touchscreen-iqs7211.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- arm-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
|-- m68k-randconfig-r061-20240102
|   |-- drivers-input-misc-iqs7222.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|   `-- drivers-input-touchscreen-edt-ft5x06.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- nios2-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
|-- riscv-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
|-- riscv-randconfig-r053-20240102
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
|-- riscv-randconfig-r054-20240102
|   |-- drivers-input-misc-iqs7222.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|   `-- drivers-input-touchscreen-iqs7211.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- sparc64-randconfig-r062-20240102
|   |-- drivers-input-touchscreen-edt-ft5x06.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|   `-- drivers-input-touchscreen-iqs7211.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- x86_64-randconfig-101-20240102
|   |-- drivers-input-touchscreen-edt-ft5x06.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|   `-- drivers-input-touchscreen-iqs7211.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- x86_64-randconfig-104-20240102
|   `-- drivers-input-touchscreen-iqs7211.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
`-- x86_64-randconfig-r053-20240102
    `-- drivers-input-misc-iqs7222.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
clang_recent_errors
|-- arm-randconfig-r051-20240102
|   `-- drivers-input-misc-iqs7222.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- arm-randconfig-r061-20240102
|   |-- drivers-input-touchscreen-edt-ft5x06.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|   `-- drivers-input-touchscreen-iqs7211.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- arm64-allmodconfig
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-soc-amlogic-meson-secure-pwrc.o
|-- hexagon-randconfig-r052-20240102
|   `-- drivers-input-touchscreen-edt-ft5x06.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- i386-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
|-- powerpc-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
|-- x86_64-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
|-- x86_64-randconfig-001-20240102
|   `-- PLEASE-submit-a-bug-report-to-https:github.com-llvm-llvm-project-issues-and-include-the-crash-backtrace-preprocessed-source-and-associated-run-script.
|-- x86_64-randconfig-003-20240102
|   `-- PLEASE-submit-a-bug-report-to-https:github.com-llvm-llvm-project-issues-and-include-the-crash-backtrace-preprocessed-source-and-associated-run-script.
`-- x86_64-randconfig-006-20240102
    `-- PLEASE-submit-a-bug-report-to-https:github.com-llvm-llvm-project-issues-and-include-the-crash-backtrace-preprocessed-source-and-associated-run-script.

elapsed time: 1462m

configs tested: 239
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              alldefconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20240102   gcc  
arc                   randconfig-002-20240102   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                          moxart_defconfig   clang
arm                       multi_v4t_defconfig   gcc  
arm                         mv78xx0_defconfig   clang
arm                        neponset_defconfig   clang
arm                   randconfig-001-20240102   gcc  
arm                   randconfig-002-20240102   gcc  
arm                   randconfig-003-20240102   gcc  
arm                   randconfig-004-20240102   gcc  
arm                           tegra_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240102   gcc  
arm64                 randconfig-002-20240102   gcc  
arm64                 randconfig-003-20240102   gcc  
arm64                 randconfig-004-20240102   gcc  
csky                             alldefconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240102   gcc  
csky                  randconfig-002-20240102   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240102   clang
hexagon               randconfig-002-20240102   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240102   gcc  
i386         buildonly-randconfig-002-20240102   gcc  
i386         buildonly-randconfig-003-20240102   gcc  
i386         buildonly-randconfig-004-20240102   gcc  
i386         buildonly-randconfig-005-20240102   gcc  
i386         buildonly-randconfig-006-20240102   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240102   gcc  
i386                  randconfig-002-20240102   gcc  
i386                  randconfig-003-20240102   gcc  
i386                  randconfig-004-20240102   gcc  
i386                  randconfig-005-20240102   gcc  
i386                  randconfig-006-20240102   gcc  
i386                  randconfig-011-20240102   clang
i386                  randconfig-011-20240103   gcc  
i386                  randconfig-012-20240102   clang
i386                  randconfig-012-20240103   gcc  
i386                  randconfig-013-20240102   clang
i386                  randconfig-013-20240103   gcc  
i386                  randconfig-014-20240102   clang
i386                  randconfig-014-20240103   gcc  
i386                  randconfig-015-20240102   clang
i386                  randconfig-015-20240103   gcc  
i386                  randconfig-016-20240102   clang
i386                  randconfig-016-20240103   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240102   gcc  
loongarch             randconfig-002-20240102   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                            q40_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                       lemote2f_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                        vocore2_defconfig   gcc  
mips                           xway_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240102   gcc  
nios2                 randconfig-002-20240102   gcc  
openrisc                         alldefconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240102   gcc  
parisc                randconfig-002-20240102   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                    gamecube_defconfig   clang
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                     ksi8560_defconfig   gcc  
powerpc                      makalu_defconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   clang
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                  mpc866_ads_defconfig   clang
powerpc                     ppa8548_defconfig   gcc  
powerpc               randconfig-001-20240102   gcc  
powerpc               randconfig-002-20240102   gcc  
powerpc               randconfig-003-20240102   gcc  
powerpc                     tqm8555_defconfig   gcc  
powerpc                      tqm8xx_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-001-20240102   gcc  
powerpc64             randconfig-002-20240102   gcc  
powerpc64             randconfig-003-20240102   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                    nommu_virt_defconfig   clang
riscv                 randconfig-001-20240102   gcc  
riscv                 randconfig-002-20240102   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240102   clang
s390                  randconfig-002-20240102   clang
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240102   gcc  
sh                    randconfig-002-20240102   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240102   gcc  
sparc64               randconfig-002-20240102   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240102   gcc  
um                    randconfig-002-20240102   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240102   gcc  
x86_64       buildonly-randconfig-002-20240102   gcc  
x86_64       buildonly-randconfig-003-20240102   gcc  
x86_64       buildonly-randconfig-004-20240102   gcc  
x86_64       buildonly-randconfig-005-20240102   gcc  
x86_64       buildonly-randconfig-006-20240102   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20240102   clang
x86_64                randconfig-002-20240102   clang
x86_64                randconfig-003-20240102   clang
x86_64                randconfig-004-20240102   clang
x86_64                randconfig-005-20240102   clang
x86_64                randconfig-006-20240102   clang
x86_64                randconfig-011-20240102   gcc  
x86_64                randconfig-012-20240102   gcc  
x86_64                randconfig-013-20240102   gcc  
x86_64                randconfig-014-20240102   gcc  
x86_64                randconfig-015-20240102   gcc  
x86_64                randconfig-016-20240102   gcc  
x86_64                randconfig-071-20240102   gcc  
x86_64                randconfig-072-20240102   gcc  
x86_64                randconfig-073-20240102   gcc  
x86_64                randconfig-074-20240102   gcc  
x86_64                randconfig-075-20240102   gcc  
x86_64                randconfig-076-20240102   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20240102   gcc  
xtensa                randconfig-002-20240102   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

