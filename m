Return-Path: <linux-input+bounces-16559-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1515ACBB6FB
	for <lists+linux-input@lfdr.de>; Sun, 14 Dec 2025 07:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4966B3007ED0
	for <lists+linux-input@lfdr.de>; Sun, 14 Dec 2025 06:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDEFE26FA6C;
	Sun, 14 Dec 2025 06:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AlCxfaaL"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80146145355
	for <linux-input@vger.kernel.org>; Sun, 14 Dec 2025 06:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765693729; cv=none; b=ToPuaHdCXt/n+VM75XAanD3LOKW8hDOUzZXBhG4GuuFJ4q0HiNKQgBneAArHPPIvnyy6tFlLGrEuSEbVmDS7zo4mRM+BexAErrVXsFQp09VW5L7yl6xgyCeTW+BxVMuUpIDttL+ytymTYA6DT9vl3O5VhjzQE9AyuQyYgaaXeVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765693729; c=relaxed/simple;
	bh=sSjnZkMJt5YC4TAPUO2CRYkmCyjnUYnsYfSmal6gCWk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aIJrp7gf/5zNmikkz61n+FrivsJyVkehJWhIM6tH59tWjFlTDP37qqrDqOtQ/D0Refi8ayiNjIaamYJHw2tgA3PL6vF2dgJamLFfKpDChkrrSw8Pf9zGWH7jt70tHfjdIMfIUVd+6IQBx5fpVqzoB3JbhHoBbj6vKlXKNrTW3E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AlCxfaaL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765693727; x=1797229727;
  h=date:from:to:cc:subject:message-id;
  bh=sSjnZkMJt5YC4TAPUO2CRYkmCyjnUYnsYfSmal6gCWk=;
  b=AlCxfaaLiUVNt8dLviATGkcd8YK6KSdUuy/HiYJocEb5eE/blMsFMC2h
   BuMYCBScz0Ifphwlsd9H5GfXbghPPI9ntVYcGXwQ1xAgfm/hKxvtBqDYu
   F4xEIc276M6MGE7ERz77i+aH2+yMIiHGzw+cjTPD4orpVil+P5GbnJX2H
   bXjb5fu4RezBzK7lMhrq1ORmcnoV7wTVB7mOLn6jE9BhLoum4NVh3qPTm
   cnjSKYH3vnnccMxxgZW+5//30NQOO6hwOVL5X9gTLmsCo5pI4vDAETJpM
   1Lbq/owq6ps7u+sn68MunXeUHudD6j/yZrD23CsyfqQLEmgFTI+aDB8cD
   w==;
X-CSE-ConnectionGUID: L5qtk3AYQpGRGTUoFEnAHA==
X-CSE-MsgGUID: KZxwu5DTRye5C2fxcGMQ9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67704391"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67704391"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 22:28:47 -0800
X-CSE-ConnectionGUID: dcq2yv4qT+y58v2xSx/43w==
X-CSE-MsgGUID: 1sYEJN5vSD27A8+pi9DN1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197349202"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Dec 2025 22:28:46 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUfb1-000000008fr-2hmQ;
	Sun, 14 Dec 2025 06:28:43 +0000
Date: Sun, 14 Dec 2025 14:27:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 686c64557be48d28f532b26a90db600092c82418
Message-ID: <202512141437.VPUxwyeh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 686c64557be48d28f532b26a90db600092c82418  MAINTAINERS: adjust file entry in HIMAX HX83112B TOUCHSCREEN SUPPORT

elapsed time: 1212m

configs tested: 298
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.1.0
arc                      axs103_smp_defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251213    gcc-15.1.0
arc                   randconfig-001-20251214    gcc-10.5.0
arc                   randconfig-002-20251213    gcc-15.1.0
arc                   randconfig-002-20251214    gcc-10.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                       imx_v4_v5_defconfig    gcc-15.1.0
arm                   milbeaut_m10v_defconfig    gcc-15.1.0
arm                   randconfig-001-20251213    clang-20
arm                   randconfig-001-20251214    gcc-10.5.0
arm                   randconfig-002-20251213    gcc-8.5.0
arm                   randconfig-002-20251214    gcc-10.5.0
arm                   randconfig-003-20251213    clang-22
arm                   randconfig-003-20251214    gcc-10.5.0
arm                   randconfig-004-20251213    clang-22
arm                   randconfig-004-20251214    gcc-10.5.0
arm                           stm32_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251213    clang-22
arm64                 randconfig-001-20251214    gcc-8.5.0
arm64                 randconfig-002-20251213    clang-22
arm64                 randconfig-002-20251214    gcc-8.5.0
arm64                 randconfig-003-20251213    clang-22
arm64                 randconfig-003-20251214    gcc-8.5.0
arm64                 randconfig-004-20251213    clang-20
arm64                 randconfig-004-20251214    gcc-8.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251213    gcc-15.1.0
csky                  randconfig-001-20251214    gcc-8.5.0
csky                  randconfig-002-20251213    gcc-11.5.0
csky                  randconfig-002-20251214    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251213    clang-22
hexagon               randconfig-001-20251214    gcc-11.5.0
hexagon               randconfig-002-20251213    clang-20
hexagon               randconfig-002-20251214    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251213    clang-20
i386        buildonly-randconfig-001-20251214    clang-20
i386        buildonly-randconfig-002-20251213    gcc-14
i386        buildonly-randconfig-002-20251214    clang-20
i386        buildonly-randconfig-003-20251213    gcc-14
i386        buildonly-randconfig-003-20251214    clang-20
i386        buildonly-randconfig-004-20251213    clang-20
i386        buildonly-randconfig-004-20251214    clang-20
i386        buildonly-randconfig-005-20251213    clang-20
i386        buildonly-randconfig-005-20251214    clang-20
i386        buildonly-randconfig-006-20251213    gcc-14
i386        buildonly-randconfig-006-20251214    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251213    clang-20
i386                  randconfig-001-20251214    clang-20
i386                  randconfig-002-20251213    gcc-14
i386                  randconfig-002-20251214    clang-20
i386                  randconfig-003-20251213    gcc-13
i386                  randconfig-003-20251214    clang-20
i386                  randconfig-004-20251213    clang-20
i386                  randconfig-004-20251214    clang-20
i386                  randconfig-005-20251213    clang-20
i386                  randconfig-005-20251214    clang-20
i386                  randconfig-006-20251213    gcc-14
i386                  randconfig-006-20251214    clang-20
i386                  randconfig-007-20251213    gcc-14
i386                  randconfig-007-20251214    clang-20
i386                  randconfig-011-20251213    gcc-14
i386                  randconfig-011-20251214    clang-20
i386                  randconfig-012-20251213    gcc-14
i386                  randconfig-012-20251214    clang-20
i386                  randconfig-013-20251213    clang-20
i386                  randconfig-013-20251214    clang-20
i386                  randconfig-014-20251213    gcc-14
i386                  randconfig-014-20251214    clang-20
i386                  randconfig-015-20251213    gcc-14
i386                  randconfig-015-20251214    clang-20
i386                  randconfig-016-20251213    gcc-14
i386                  randconfig-016-20251214    clang-20
i386                  randconfig-017-20251213    clang-20
i386                  randconfig-017-20251214    clang-20
loongarch                        alldefconfig    gcc-15.1.0
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251213    clang-20
loongarch             randconfig-001-20251214    gcc-11.5.0
loongarch             randconfig-002-20251213    clang-20
loongarch             randconfig-002-20251214    gcc-11.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
m68k                           virt_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                          ath25_defconfig    clang-22
mips                        bcm47xx_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251213    gcc-9.5.0
nios2                 randconfig-001-20251214    gcc-11.5.0
nios2                 randconfig-002-20251213    gcc-11.5.0
nios2                 randconfig-002-20251214    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                 simple_smp_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-32bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20251213    gcc-8.5.0
parisc                randconfig-001-20251214    gcc-9.5.0
parisc                randconfig-002-20251213    gcc-8.5.0
parisc                randconfig-002-20251214    gcc-9.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      chrp32_defconfig    gcc-15.1.0
powerpc                       ebony_defconfig    gcc-15.1.0
powerpc                          g5_defconfig    gcc-15.1.0
powerpc                     mpc512x_defconfig    gcc-15.1.0
powerpc                      ppc6xx_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251213    clang-18
powerpc               randconfig-001-20251214    gcc-9.5.0
powerpc               randconfig-002-20251213    clang-22
powerpc               randconfig-002-20251214    gcc-9.5.0
powerpc                     taishan_defconfig    clang-17
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251213    clang-16
powerpc64             randconfig-001-20251214    gcc-9.5.0
powerpc64             randconfig-002-20251213    clang-16
powerpc64             randconfig-002-20251214    gcc-9.5.0
riscv                            alldefconfig    gcc-15.1.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv                 randconfig-001-20251213    clang-16
riscv                 randconfig-001-20251214    gcc-8.5.0
riscv                 randconfig-002-20251213    clang-22
riscv                 randconfig-002-20251214    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251213    gcc-13.4.0
s390                  randconfig-001-20251214    gcc-8.5.0
s390                  randconfig-002-20251213    clang-17
s390                  randconfig-002-20251214    gcc-8.5.0
s390                       zfcpdump_defconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251213    gcc-15.1.0
sh                    randconfig-001-20251214    gcc-8.5.0
sh                    randconfig-002-20251213    gcc-10.5.0
sh                    randconfig-002-20251214    gcc-8.5.0
sh                   secureedge5410_defconfig    gcc-15.1.0
sh                        sh7757lcr_defconfig    gcc-15.1.0
sh                            shmin_defconfig    gcc-15.1.0
sh                            titan_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251213    gcc-14.3.0
sparc                 randconfig-001-20251214    gcc-15.1.0
sparc                 randconfig-002-20251213    gcc-8.5.0
sparc                 randconfig-002-20251214    gcc-15.1.0
sparc                       sparc32_defconfig    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251213    gcc-15.1.0
sparc64               randconfig-001-20251214    gcc-15.1.0
sparc64               randconfig-002-20251213    gcc-14.3.0
sparc64               randconfig-002-20251214    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251213    clang-22
um                    randconfig-001-20251214    gcc-15.1.0
um                    randconfig-002-20251213    gcc-14
um                    randconfig-002-20251214    gcc-15.1.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251213    clang-20
x86_64      buildonly-randconfig-001-20251214    gcc-12
x86_64      buildonly-randconfig-002-20251213    clang-20
x86_64      buildonly-randconfig-002-20251214    gcc-12
x86_64      buildonly-randconfig-003-20251213    clang-20
x86_64      buildonly-randconfig-003-20251214    gcc-12
x86_64      buildonly-randconfig-004-20251213    clang-20
x86_64      buildonly-randconfig-004-20251214    gcc-12
x86_64      buildonly-randconfig-005-20251213    gcc-14
x86_64      buildonly-randconfig-005-20251214    gcc-12
x86_64      buildonly-randconfig-006-20251213    clang-20
x86_64      buildonly-randconfig-006-20251214    gcc-12
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251213    gcc-14
x86_64                randconfig-002-20251213    gcc-14
x86_64                randconfig-003-20251213    gcc-14
x86_64                randconfig-004-20251213    clang-20
x86_64                randconfig-005-20251213    gcc-14
x86_64                randconfig-006-20251213    clang-20
x86_64                randconfig-011-20251214    clang-20
x86_64                randconfig-012-20251214    clang-20
x86_64                randconfig-013-20251214    clang-20
x86_64                randconfig-014-20251214    clang-20
x86_64                randconfig-015-20251214    clang-20
x86_64                randconfig-016-20251214    clang-20
x86_64                randconfig-071-20251213    clang-20
x86_64                randconfig-071-20251214    clang-20
x86_64                randconfig-072-20251213    clang-20
x86_64                randconfig-072-20251214    clang-20
x86_64                randconfig-073-20251213    clang-20
x86_64                randconfig-073-20251214    clang-20
x86_64                randconfig-074-20251213    gcc-13
x86_64                randconfig-074-20251214    clang-20
x86_64                randconfig-075-20251213    clang-20
x86_64                randconfig-075-20251214    clang-20
x86_64                randconfig-076-20251213    gcc-14
x86_64                randconfig-076-20251214    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251213    gcc-15.1.0
xtensa                randconfig-001-20251214    gcc-15.1.0
xtensa                randconfig-002-20251213    gcc-8.5.0
xtensa                randconfig-002-20251214    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

