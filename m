Return-Path: <linux-input+bounces-6288-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D511D96FEA9
	for <lists+linux-input@lfdr.de>; Sat,  7 Sep 2024 02:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 616441F22D11
	for <lists+linux-input@lfdr.de>; Sat,  7 Sep 2024 00:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D85CA29;
	Sat,  7 Sep 2024 00:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nd8g7FTJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1C9211C
	for <linux-input@vger.kernel.org>; Sat,  7 Sep 2024 00:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725668206; cv=none; b=mzahpN/dTWvmvDtrrBR4B2vaJVfVwb/9Yl7MK5ZNrmFS4Jc9hOgDGbMtieWizFJtZC757Y3NHSLsG4eN/w2A2kZaQvtnITvvmirw8RW2d+DbSS8+Pzs8KonGWXtR3NHEAX3+t6xBTi/BuCn9giP5/qjHjhEqo59ftuOpvmMyUfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725668206; c=relaxed/simple;
	bh=GUrrb/LMzYbMcz1Ur9LqsuEa2kNUa/mDEFQNGNp+aGk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D8x05qeKNQYod230L+yCTog8Ns7QoUXlZwOk6PoPf5t3TOp57qY1gvtl6AB73qXfCBktHV1Zoe6JDcn6RcEfAvuYNi//EwuEVw0j2EW1hvbIM+9BgT/EFtJZ0eZOKbIlt94VJ29Vf++OF7Ci8ElgxxZRmhvhPjBzniHeob33GEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nd8g7FTJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725668205; x=1757204205;
  h=date:from:to:cc:subject:message-id;
  bh=GUrrb/LMzYbMcz1Ur9LqsuEa2kNUa/mDEFQNGNp+aGk=;
  b=nd8g7FTJ/6d2WKuCmWNJQyjuMlYcxh4J8uGXyF/7zMwiPmGoNLh564sP
   qjRTIgIlczQ+3xRnfAci5nek9iChsdjtvr6KiEk2sVc8Ub6MwU7YX8NtE
   MzYM6L654bbNCeCIyg/79XSqVaYjdbIS1OR1m/onqJPSZqYxDadvHrypf
   e3rRDUp0gqg5damEM5HAE1v2tAzcF97S2USupsXA35zWdQ7iebjGPxOFb
   dNrt2kOMVGEJN1m95YTirYFw4ZYT3ySt/GPTlJCQ1oASMFUUhcjhSbOH6
   TIMALMcAlSRBXWo4QuIOaokJIHS9SdK2v8fZK+uBCzp20G7VVMhTMxuVa
   A==;
X-CSE-ConnectionGUID: kd7enLJwR1eu83Lzxo087w==
X-CSE-MsgGUID: 9uFkzBX7SlyOOeWOPAEASw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="41952901"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="41952901"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 17:16:45 -0700
X-CSE-ConnectionGUID: poDjRVokT+e+nJHa8fiMBg==
X-CSE-MsgGUID: L+hTuRGGQsmBj6l0Zlmc9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="66132413"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Sep 2024 17:16:20 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smj7i-000Bsz-1D;
	Sat, 07 Sep 2024 00:16:18 +0000
Date: Sat, 07 Sep 2024 08:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 e06edf96dea065dd1d9df695bf8b92784992333e
Message-ID: <202409070832.aiBvv5Ce-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: e06edf96dea065dd1d9df695bf8b92784992333e  Input: i8042 - add TUXEDO Stellaris 16 Gen5 AMD to i8042 quirk table

elapsed time: 1054m

configs tested: 134
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                                 defconfig   gcc-14.1.0
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm                        neponset_defconfig   clang-15
arm                          pxa168_defconfig   clang-15
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240906   gcc-12
i386         buildonly-randconfig-002-20240906   gcc-12
i386         buildonly-randconfig-003-20240906   gcc-12
i386         buildonly-randconfig-004-20240906   gcc-12
i386         buildonly-randconfig-005-20240906   gcc-12
i386         buildonly-randconfig-006-20240906   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240906   gcc-12
i386                  randconfig-002-20240906   gcc-12
i386                  randconfig-003-20240906   gcc-12
i386                  randconfig-004-20240906   gcc-12
i386                  randconfig-005-20240906   gcc-12
i386                  randconfig-006-20240906   gcc-12
i386                  randconfig-011-20240906   gcc-12
i386                  randconfig-012-20240906   gcc-12
i386                  randconfig-013-20240906   gcc-12
i386                  randconfig-014-20240906   gcc-12
i386                  randconfig-015-20240906   gcc-12
i386                  randconfig-016-20240906   gcc-12
loongarch                        alldefconfig   clang-15
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          atari_defconfig   clang-15
m68k                                defconfig   gcc-14.1.0
m68k                        m5407c3_defconfig   clang-15
m68k                       m5475evb_defconfig   clang-15
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                        vocore2_defconfig   clang-15
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      cm5200_defconfig   clang-15
powerpc                       eiger_defconfig   clang-15
powerpc                  iss476-smp_defconfig   clang-15
powerpc                         ps3_defconfig   clang-15
powerpc                     tqm8555_defconfig   clang-15
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
riscv             nommu_k210_sdcard_defconfig   clang-15
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                               j2_defconfig   clang-15
sh                           se7750_defconfig   clang-15
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   clang-15
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240907   gcc-12
x86_64       buildonly-randconfig-002-20240907   gcc-12
x86_64       buildonly-randconfig-003-20240907   gcc-12
x86_64       buildonly-randconfig-004-20240907   gcc-12
x86_64       buildonly-randconfig-005-20240907   gcc-12
x86_64       buildonly-randconfig-006-20240907   gcc-12
x86_64                              defconfig   clang-18
x86_64                                  kexec   gcc-12
x86_64                randconfig-001-20240907   gcc-12
x86_64                randconfig-002-20240907   gcc-12
x86_64                randconfig-003-20240907   gcc-12
x86_64                randconfig-004-20240907   gcc-12
x86_64                randconfig-005-20240907   gcc-12
x86_64                randconfig-006-20240907   gcc-12
x86_64                randconfig-011-20240907   gcc-12
x86_64                randconfig-012-20240907   gcc-12
x86_64                randconfig-013-20240907   gcc-12
x86_64                randconfig-014-20240907   gcc-12
x86_64                randconfig-015-20240907   gcc-12
x86_64                randconfig-016-20240907   gcc-12
x86_64                randconfig-071-20240907   gcc-12
x86_64                randconfig-072-20240907   gcc-12
x86_64                randconfig-073-20240907   gcc-12
x86_64                randconfig-074-20240907   gcc-12
x86_64                randconfig-075-20240907   gcc-12
x86_64                randconfig-076-20240907   gcc-12
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

