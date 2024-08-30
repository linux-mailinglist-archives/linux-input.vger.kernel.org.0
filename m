Return-Path: <linux-input+bounces-6030-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 932FE966A66
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 22:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7D0FB20BA1
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 20:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248B31BF317;
	Fri, 30 Aug 2024 20:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIeSQLYz"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F9313B297
	for <linux-input@vger.kernel.org>; Fri, 30 Aug 2024 20:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725049482; cv=none; b=npimeD3McG1+ztwSanrMfFYW1bF3mHUSUciLLHRoGglAMi0rYDMTkdzM4hTWb0DLblMV7zw9pD2T6enI3YT0tWOGv/02OJjOPgTLwvDaUjKippMp1aiXCjHnvW98jIxttjqAXG5fo3rRJMP+E3oGgPAMk8fBeEEg5e81FYegSXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725049482; c=relaxed/simple;
	bh=q8bUlOVK2+r/9WQPiELjZswwVw6Ky/ujZN4W37O2IQc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dIcQWxybBWx0TYZI7hDEy87iMXu2zCC7PYVdN8vbAF5N44uvGLhs2kLkLwXtQlpF0PTDh4bOkP3uzCI+ZkHtT4a2y0Cw6LyCJASOkWdFozlBdk9vlqxwG2UAqWYN6GWrwPLitESeCa2ntUiskndJznOuAMyAL3z2KrRbR7fPRdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIeSQLYz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725049480; x=1756585480;
  h=date:from:to:cc:subject:message-id;
  bh=q8bUlOVK2+r/9WQPiELjZswwVw6Ky/ujZN4W37O2IQc=;
  b=IIeSQLYzIK4krJUqETjJgzRB+b3FbytAvnf9aZNRemWh1w9CL4KqajTU
   CCS4kakyMf0HAFCwtRY02BHi+H0F4kZ3k5shbxo84QUbdA7qxgRCs89lX
   hzEMzp2xjOG0K/qQQjMnJ6eXbgDrEnh6wo5oruFurTg3zvG19e7EywEb6
   ynq2ICiuE4TRa1DH1uoiF0oF890azvI/cm7REtkRzM3PlrRiZ2P6+06rL
   Q1iI/Usjqb+xnKOhCvtQHEv7T8+YZ9/lZzREHaA1VP1MFV1elEMuXFfkO
   ZTUWTeNp4GzFiPkcGAYQTy5pwfi7tjCZ3OP+5zyKT3DtUc9lLkTAcoQ1/
   w==;
X-CSE-ConnectionGUID: ljJ4XrF4SEG7DxFX6cOTJQ==
X-CSE-MsgGUID: ANK3bv8IRl6T1QxKKEZ1ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23841183"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="23841183"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 13:21:37 -0700
X-CSE-ConnectionGUID: gNtaj2GkSnujryUZZAsXow==
X-CSE-MsgGUID: 117Wkd2OQSObVwikR/MvxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="64751775"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Aug 2024 13:21:35 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sk87g-00023P-2Z;
	Fri, 30 Aug 2024 20:21:32 +0000
Date: Sat, 31 Aug 2024 04:20:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 c472d33bcbf7a1ed3710efe93822b5e94eabe18c
Message-ID: <202408310437.gMvB9idW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: c472d33bcbf7a1ed3710efe93822b5e94eabe18c  Input: cypress_ps2 - fix waiting for command response

elapsed time: 1585m

configs tested: 167
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-14.1.0
arc                   randconfig-001-20240830   gcc-14.1.0
arc                   randconfig-002-20240830   gcc-14.1.0
arm                              allmodconfig   clang-20
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   gcc-14.1.0
arm                        multi_v5_defconfig   gcc-14.1.0
arm                       omap2plus_defconfig   gcc-14.1.0
arm                            qcom_defconfig   gcc-14.1.0
arm                   randconfig-001-20240830   gcc-14.1.0
arm                   randconfig-002-20240830   gcc-14.1.0
arm                   randconfig-003-20240830   gcc-14.1.0
arm                   randconfig-004-20240830   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240830   gcc-14.1.0
arm64                 randconfig-002-20240830   gcc-14.1.0
arm64                 randconfig-003-20240830   gcc-14.1.0
arm64                 randconfig-004-20240830   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240830   gcc-14.1.0
csky                  randconfig-002-20240830   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
hexagon               randconfig-001-20240830   gcc-14.1.0
hexagon               randconfig-002-20240830   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240830   gcc-12
i386         buildonly-randconfig-002-20240830   gcc-12
i386         buildonly-randconfig-003-20240830   gcc-12
i386         buildonly-randconfig-004-20240830   gcc-12
i386         buildonly-randconfig-005-20240830   gcc-12
i386         buildonly-randconfig-006-20240830   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240830   gcc-12
i386                  randconfig-002-20240830   gcc-12
i386                  randconfig-003-20240830   gcc-12
i386                  randconfig-004-20240830   gcc-12
i386                  randconfig-005-20240830   gcc-12
i386                  randconfig-006-20240830   gcc-12
i386                  randconfig-011-20240830   gcc-12
i386                  randconfig-012-20240830   gcc-12
i386                  randconfig-013-20240830   gcc-12
i386                  randconfig-014-20240830   gcc-12
i386                  randconfig-015-20240830   gcc-12
i386                  randconfig-016-20240830   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
loongarch             randconfig-001-20240830   gcc-14.1.0
loongarch             randconfig-002-20240830   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
m68k                       m5275evb_defconfig   gcc-14.1.0
m68k                           virt_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                           jazz_defconfig   gcc-14.1.0
mips                     loongson2k_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
nios2                 randconfig-001-20240830   gcc-14.1.0
nios2                 randconfig-002-20240830   gcc-14.1.0
openrisc                         alldefconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                            defconfig   gcc-12
parisc                            allnoconfig   clang-20
parisc                              defconfig   gcc-12
parisc                randconfig-001-20240830   gcc-14.1.0
parisc                randconfig-002-20240830   gcc-14.1.0
parisc64                            defconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                        cell_defconfig   gcc-14.1.0
powerpc                      ep88xc_defconfig   gcc-14.1.0
powerpc                         ps3_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240830   gcc-14.1.0
powerpc               randconfig-002-20240830   gcc-14.1.0
powerpc64             randconfig-001-20240830   gcc-14.1.0
powerpc64             randconfig-002-20240830   gcc-14.1.0
powerpc64             randconfig-003-20240830   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                               defconfig   gcc-12
riscv                 randconfig-001-20240830   gcc-14.1.0
riscv                 randconfig-002-20240830   gcc-14.1.0
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
s390                  randconfig-001-20240830   gcc-14.1.0
s390                  randconfig-002-20240830   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                          landisk_defconfig   gcc-14.1.0
sh                    randconfig-001-20240830   gcc-14.1.0
sh                    randconfig-002-20240830   gcc-14.1.0
sh                          rsk7269_defconfig   gcc-14.1.0
sh                           se7722_defconfig   gcc-14.1.0
sh                             sh03_defconfig   gcc-14.1.0
sh                          urquell_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
sparc64               randconfig-001-20240830   gcc-14.1.0
sparc64               randconfig-002-20240830   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240830   gcc-14.1.0
um                    randconfig-002-20240830   gcc-14.1.0
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240830   clang-18
x86_64       buildonly-randconfig-002-20240830   clang-18
x86_64       buildonly-randconfig-003-20240830   clang-18
x86_64       buildonly-randconfig-004-20240830   clang-18
x86_64       buildonly-randconfig-005-20240830   clang-18
x86_64       buildonly-randconfig-006-20240830   clang-18
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240830   clang-18
x86_64                randconfig-002-20240830   clang-18
x86_64                randconfig-003-20240830   clang-18
x86_64                randconfig-004-20240830   clang-18
x86_64                randconfig-005-20240830   clang-18
x86_64                randconfig-006-20240830   clang-18
x86_64                randconfig-011-20240830   clang-18
x86_64                randconfig-012-20240830   clang-18
x86_64                randconfig-013-20240830   clang-18
x86_64                randconfig-014-20240830   clang-18
x86_64                randconfig-015-20240830   clang-18
x86_64                randconfig-016-20240830   clang-18
x86_64                randconfig-071-20240830   clang-18
x86_64                randconfig-072-20240830   clang-18
x86_64                randconfig-073-20240830   clang-18
x86_64                randconfig-074-20240830   clang-18
x86_64                randconfig-075-20240830   clang-18
x86_64                randconfig-076-20240830   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                       common_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240830   gcc-14.1.0
xtensa                randconfig-002-20240830   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

