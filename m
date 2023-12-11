Return-Path: <linux-input+bounces-666-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C778480C1EE
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 08:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 499031F20EE5
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 07:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04181F616;
	Mon, 11 Dec 2023 07:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2x9SWUS"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C833CD9
	for <linux-input@vger.kernel.org>; Sun, 10 Dec 2023 23:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702279904; x=1733815904;
  h=date:from:to:cc:subject:message-id;
  bh=AEbLudGu1dWExYD3uDe0PAeNSpuIB7eZ8fZOyYKCuL4=;
  b=G2x9SWUS9kJDDAvMyYrnPSQP65hOilLlASo3Jizh4ktJpG0K9NOoRIwU
   MGA0Y1VsCC3B1OSdMuJBCATlDjW6y6NEUyB1FJqhcTHczeK3VMF4QgDPK
   ULMcJKZD+E+hvICTDFGKztV2WMeWy6owy9D9Yavuo/+qNX+A1hOYZb8TO
   6coVhpK+/Fj3CxiVU5u6rKh31h39BV883zx7a/C0Il6S7PK6tG4Kc2gKS
   ekHucxfsHbDmaS6zPh03xuBSmmMU5vqNrF7Qdu8WrJihS9Hjzoq2hcEy2
   k06juQN55T4KUsEtWqHqg6Llsx0ndukQgprkicTwRPCKPHhfKrPilayQp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1444217"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="1444217"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 23:31:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="863664460"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="863664460"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Dec 2023 23:31:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCakm-000Hlu-0m;
	Mon, 11 Dec 2023 07:31:00 +0000
Date: Mon, 11 Dec 2023 15:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 909484169a7bd935b4e56e1d77d63e8fccf6c6f1
Message-ID: <202312111531.mEIvRso7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 909484169a7bd935b4e56e1d77d63e8fccf6c6f1  Input: pxrc - simplify mutex handling with guard macro

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-randconfig-r053-20231211
|   `-- drivers-input-touchscreen-edt-ft5x06.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- arc-randconfig-r132-20231211
|   |-- kernel-fork.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-file-assigned-old_exe_file-got-struct-file-noderef-__rcu-assigned-_val_
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__wsum-assigned-usertype-expec-got-int
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__wsum-assigned-usertype-sum-got-unsigned-int
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__wsum-usertype-expec-got-int
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__wsum-usertype-expec-got-restricted-__sum16-const
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__wsum-usertype-result-got-restricted-__sum16
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__wsum-usertype-sum-got-unsigned-int
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-long-long-left_value-got-restricted-__wsum-const-__left
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-long-long-right_value-got-restricted-__wsum-const-__right
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-restricted-__wsum-got-unsigned-int
|   `-- lib-checksum_kunit.c:sparse:sparse:restricted-__wsum-degrades-to-integer
|-- csky-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
|-- nios2-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
|-- nios2-randconfig-r063-20231211
|   `-- drivers-input-misc-iqs7222.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- openrisc-randconfig-r051-20231211
|   `-- drivers-input-touchscreen-edt-ft5x06.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- riscv-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
|-- sh-randconfig-r121-20231211
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__wsum-assigned-usertype-expec-got-int
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__wsum-assigned-usertype-sum-got-unsigned-int
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__wsum-usertype-expec-got-int
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__wsum-usertype-expec-got-restricted-__sum16-const
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__wsum-usertype-result-got-restricted-__sum16
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__wsum-usertype-sum-got-unsigned-int
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-long-long-left_value-got-restricted-__wsum-const-__left
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-long-long-right_value-got-restricted-__wsum-const-__right
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-restricted-__wsum-got-unsigned-int
|   `-- lib-checksum_kunit.c:sparse:sparse:restricted-__wsum-degrades-to-integer
`-- um-randconfig-r052-20231211
    `-- drivers-input-touchscreen-edt-ft5x06.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
clang_recent_errors
|-- arm64-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
|-- arm64-randconfig-r123-20231211
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-soc-amlogic-meson-secure-pwrc.o
|-- hexagon-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
|-- i386-randconfig-051-20231211
|   `-- drivers-input-misc-iqs7222.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- i386-randconfig-054-20231211
|   |-- drivers-input-touchscreen-edt-ft5x06.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|   `-- drivers-input-touchscreen-iqs7211.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- powerpc-randconfig-001-20231211
|   `-- PLEASE-submit-a-bug-report-to-https:github.com-llvm-llvm-project-issues-and-include-the-crash-backtrace-preprocessed-source-and-associated-run-script.
|-- x86_64-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
|-- x86_64-randconfig-103-20231211
|   |-- drivers-input-touchscreen-edt-ft5x06.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|   `-- drivers-input-touchscreen-iqs7211.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
`-- x86_64-randconfig-104-20231211
    `-- drivers-input-touchscreen-edt-ft5x06.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)

elapsed time: 1451m

configs tested: 194
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
arc                     haps_hs_smp_defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20231211   gcc  
arc                   randconfig-002-20231211   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   clang
arm                      jornada720_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20231211   clang
arm                   randconfig-002-20231211   clang
arm                   randconfig-003-20231211   clang
arm                   randconfig-004-20231211   clang
arm                           spitz_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231211   clang
arm64                 randconfig-002-20231211   clang
arm64                 randconfig-003-20231211   clang
arm64                 randconfig-004-20231211   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231211   gcc  
csky                  randconfig-002-20231211   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231211   clang
hexagon               randconfig-002-20231211   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231210   gcc  
i386         buildonly-randconfig-002-20231210   gcc  
i386         buildonly-randconfig-003-20231210   gcc  
i386         buildonly-randconfig-004-20231210   gcc  
i386         buildonly-randconfig-005-20231210   gcc  
i386         buildonly-randconfig-006-20231210   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231210   gcc  
i386                  randconfig-002-20231210   gcc  
i386                  randconfig-003-20231210   gcc  
i386                  randconfig-004-20231210   gcc  
i386                  randconfig-005-20231210   gcc  
i386                  randconfig-006-20231210   gcc  
i386                  randconfig-011-20231210   clang
i386                  randconfig-012-20231210   clang
i386                  randconfig-013-20231210   clang
i386                  randconfig-014-20231210   clang
i386                  randconfig-015-20231210   clang
i386                  randconfig-016-20231210   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231211   gcc  
loongarch             randconfig-002-20231211   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                       bmips_be_defconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                           ip28_defconfig   gcc  
mips                     loongson1c_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231211   gcc  
nios2                 randconfig-002-20231211   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231211   gcc  
parisc                randconfig-002-20231211   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                      arches_defconfig   gcc  
powerpc                 canyonlands_defconfig   gcc  
powerpc                        fsp2_defconfig   clang
powerpc                 linkstation_defconfig   gcc  
powerpc                     powernv_defconfig   clang
powerpc                      ppc40x_defconfig   gcc  
powerpc               randconfig-001-20231211   clang
powerpc               randconfig-002-20231211   clang
powerpc               randconfig-003-20231211   clang
powerpc                     tqm8548_defconfig   gcc  
powerpc64             randconfig-001-20231211   clang
powerpc64             randconfig-002-20231211   clang
powerpc64             randconfig-003-20231211   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231211   clang
riscv                 randconfig-002-20231211   clang
riscv                          rv32_defconfig   clang
s390                             alldefconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231211   gcc  
s390                  randconfig-002-20231211   gcc  
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231211   gcc  
sh                    randconfig-002-20231211   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231211   gcc  
sparc64               randconfig-002-20231211   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231211   clang
um                    randconfig-002-20231211   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231211   clang
x86_64       buildonly-randconfig-002-20231211   clang
x86_64       buildonly-randconfig-003-20231211   clang
x86_64       buildonly-randconfig-004-20231211   clang
x86_64       buildonly-randconfig-005-20231211   clang
x86_64       buildonly-randconfig-006-20231211   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231211   gcc  
x86_64                randconfig-002-20231211   gcc  
x86_64                randconfig-003-20231211   gcc  
x86_64                randconfig-004-20231211   gcc  
x86_64                randconfig-005-20231211   gcc  
x86_64                randconfig-006-20231211   gcc  
x86_64                randconfig-011-20231211   clang
x86_64                randconfig-012-20231211   clang
x86_64                randconfig-013-20231211   clang
x86_64                randconfig-014-20231211   clang
x86_64                randconfig-015-20231211   clang
x86_64                randconfig-016-20231211   clang
x86_64                randconfig-071-20231211   clang
x86_64                randconfig-072-20231211   clang
x86_64                randconfig-073-20231211   clang
x86_64                randconfig-074-20231211   clang
x86_64                randconfig-075-20231211   clang
x86_64                randconfig-076-20231211   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20231211   gcc  
xtensa                randconfig-002-20231211   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

