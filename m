Return-Path: <linux-input+bounces-16609-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCC9CC653C
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 08:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3CEC30088B1
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 07:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F382DBF76;
	Wed, 17 Dec 2025 07:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABCO8Ws/"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECFA1400C
	for <linux-input@vger.kernel.org>; Wed, 17 Dec 2025 07:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765954938; cv=none; b=ko9VISURGm/WOtVCVfc57uQhiA28CmqY0MBsKPPmTFFXcWnp/BBmWxwsuvRcZWBidFQcsKvGysHxEaodTqw9giR2ujjT/sqiOMJxtKs+rtCHdGhk4cNkI8xRVAI1g/Wm9jya49KgGiow/+iTzXTnpeC3bK+I8MAGVZJoQ0iEd7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765954938; c=relaxed/simple;
	bh=urMYtG1WhMIiSte4TEadRtdC6RRBEVRub5xsUuKF4B0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pno2n+YwogofglAP54ldSGPlWnZA/WW/tw+PuaFmF0LLPxM7WJpxnhsr9zDSbBuPBp1kuFG0irCKmsPnyKWmRob04TZj0ceXonj+rMAkl8bikQ6Ke6/F2brz/WxtBfjjh/DOBkERzib/m3in5zLGOKjXQKGE1WRfJcnbNwKhO2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABCO8Ws/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765954937; x=1797490937;
  h=date:from:to:cc:subject:message-id;
  bh=urMYtG1WhMIiSte4TEadRtdC6RRBEVRub5xsUuKF4B0=;
  b=ABCO8Ws/ZXOYQjgnUABQbLAvMrVkFMBE+Bhq4QiFEcn4EuPpTh1vqzjw
   yVptRGokzZsizYkyCQequli/SUGdjPo91g1sIr3LNcOBZBdIgZ9VkZgOK
   ygGVF2iWn4e38S9JbkJFwdSxEBVldBxC7mrA4A5uq8ePItgzSUJ+rWdBo
   32sk8Uy/dsYM05Va8JoyxQtjdba+E5TI9ZANtE2BMDvEN/l1EEKeHaI14
   7vGb+iE0isqmGBFWvhY3OvIoaTpEIdZT9+BNlOh4oj7HMhqnaNi539LtF
   cLRXixMCZA3bOWMNLk/HWu19zbKUYxWoNT04Gjh/HFCLpnC7v9FSEf+1o
   A==;
X-CSE-ConnectionGUID: ey3eQcxySjaXkoc0I1FbDw==
X-CSE-MsgGUID: Tj73qCY5QwSk6mMSeMVRkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71742829"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="71742829"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 23:02:16 -0800
X-CSE-ConnectionGUID: tJlDFjOZSuCi4wR0aO6W+g==
X-CSE-MsgGUID: aphUYtlqTtOrfEEYBtF+LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="197978631"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Dec 2025 23:02:16 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVlY5-0000000007l-0olo;
	Wed, 17 Dec 2025 07:02:13 +0000
Date: Wed, 17 Dec 2025 15:01:33 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 aed3716db7fff74919cc5775ca3a80c8bb246489
Message-ID: <202512171526.wksGxYAI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: aed3716db7fff74919cc5775ca3a80c8bb246489  Input: i8042 - add TUXEDO InfinityBook Max Gen10 AMD to i8042 quirk table

elapsed time: 1460m

configs tested: 292
configs skipped: 1

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
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251216    gcc-12.5.0
arc                   randconfig-001-20251217    clang-22
arc                   randconfig-002-20251216    gcc-12.5.0
arc                   randconfig-002-20251217    clang-22
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                     am200epdkit_defconfig    clang-22
arm                       aspeed_g4_defconfig    clang-22
arm                         bcm2835_defconfig    clang-22
arm                                 defconfig    gcc-15.1.0
arm                          ep93xx_defconfig    clang-22
arm                          ixp4xx_defconfig    clang-22
arm                         lpc18xx_defconfig    clang-22
arm                         nhk8815_defconfig    clang-22
arm                   randconfig-001-20251216    gcc-10.5.0
arm                   randconfig-001-20251217    clang-22
arm                   randconfig-002-20251216    gcc-8.5.0
arm                   randconfig-002-20251217    clang-22
arm                   randconfig-003-20251216    gcc-11.5.0
arm                   randconfig-003-20251217    clang-22
arm                   randconfig-004-20251216    clang-19
arm                   randconfig-004-20251217    clang-22
arm                    vt8500_v6_v7_defconfig    clang-22
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251217    clang-22
arm64                 randconfig-002-20251217    clang-22
arm64                 randconfig-003-20251217    clang-22
arm64                 randconfig-004-20251217    clang-22
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251217    clang-22
csky                  randconfig-002-20251217    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251216    clang-22
hexagon               randconfig-001-20251217    gcc-11.5.0
hexagon               randconfig-002-20251216    clang-19
hexagon               randconfig-002-20251217    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251216    clang-20
i386        buildonly-randconfig-001-20251217    clang-20
i386        buildonly-randconfig-002-20251216    gcc-14
i386        buildonly-randconfig-002-20251217    clang-20
i386        buildonly-randconfig-003-20251216    gcc-14
i386        buildonly-randconfig-003-20251217    clang-20
i386        buildonly-randconfig-004-20251216    gcc-14
i386        buildonly-randconfig-004-20251217    clang-20
i386        buildonly-randconfig-005-20251216    clang-20
i386        buildonly-randconfig-005-20251217    clang-20
i386        buildonly-randconfig-006-20251216    gcc-14
i386        buildonly-randconfig-006-20251217    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251217    clang-20
i386                  randconfig-001-20251217    gcc-14
i386                  randconfig-002-20251217    clang-20
i386                  randconfig-002-20251217    gcc-14
i386                  randconfig-003-20251217    clang-20
i386                  randconfig-003-20251217    gcc-14
i386                  randconfig-004-20251217    gcc-14
i386                  randconfig-005-20251217    gcc-13
i386                  randconfig-005-20251217    gcc-14
i386                  randconfig-006-20251217    clang-20
i386                  randconfig-006-20251217    gcc-14
i386                  randconfig-007-20251217    clang-20
i386                  randconfig-007-20251217    gcc-14
i386                  randconfig-011-20251216    gcc-13
i386                  randconfig-011-20251217    clang-20
i386                  randconfig-012-20251216    clang-20
i386                  randconfig-012-20251217    clang-20
i386                  randconfig-013-20251216    gcc-13
i386                  randconfig-013-20251217    clang-20
i386                  randconfig-014-20251216    gcc-13
i386                  randconfig-014-20251217    clang-20
i386                  randconfig-015-20251216    clang-20
i386                  randconfig-015-20251217    clang-20
i386                  randconfig-016-20251216    clang-20
i386                  randconfig-016-20251217    clang-20
i386                  randconfig-017-20251216    clang-20
i386                  randconfig-017-20251217    clang-20
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251216    gcc-15.1.0
loongarch             randconfig-001-20251217    gcc-11.5.0
loongarch             randconfig-002-20251216    clang-22
loongarch             randconfig-002-20251217    gcc-11.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
m68k                            mac_defconfig    clang-22
m68k                           virt_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    clang-22
mips                           gcw0_defconfig    clang-22
mips                      maltaaprp_defconfig    clang-22
mips                          rb532_defconfig    clang-18
mips                          rb532_defconfig    clang-22
nios2                         10m50_defconfig    gcc-11.5.0
nios2                         3c120_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251216    gcc-8.5.0
nios2                 randconfig-001-20251217    gcc-11.5.0
nios2                 randconfig-002-20251216    gcc-11.5.0
nios2                 randconfig-002-20251217    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251216    gcc-11.5.0
parisc                randconfig-001-20251217    gcc-8.5.0
parisc                randconfig-002-20251216    gcc-11.5.0
parisc                randconfig-002-20251217    gcc-8.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      chrp32_defconfig    gcc-15.1.0
powerpc                       ebony_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251216    clang-22
powerpc               randconfig-001-20251217    gcc-8.5.0
powerpc               randconfig-002-20251216    clang-19
powerpc               randconfig-002-20251217    gcc-8.5.0
powerpc                     tqm8560_defconfig    clang-22
powerpc64             randconfig-001-20251216    clang-22
powerpc64             randconfig-001-20251217    gcc-8.5.0
powerpc64             randconfig-002-20251216    clang-17
powerpc64             randconfig-002-20251217    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                    nommu_k210_defconfig    gcc-15.1.0
riscv                 randconfig-001-20251216    gcc-9.5.0
riscv                 randconfig-001-20251217    clang-18
riscv                 randconfig-002-20251216    clang-17
riscv                 randconfig-002-20251217    clang-18
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251216    clang-22
s390                  randconfig-001-20251217    clang-18
s390                  randconfig-002-20251216    clang-20
s390                  randconfig-002-20251217    clang-18
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                        dreamcast_defconfig    gcc-15.1.0
sh                    randconfig-001-20251216    gcc-13.4.0
sh                    randconfig-001-20251217    clang-18
sh                    randconfig-002-20251216    gcc-12.5.0
sh                    randconfig-002-20251217    clang-18
sh                          rsk7203_defconfig    gcc-15.1.0
sh                           se7750_defconfig    clang-22
sh                   secureedge5410_defconfig    gcc-15.1.0
sh                          urquell_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251217    gcc-15.1.0
sparc                 randconfig-002-20251217    gcc-15.1.0
sparc64                          alldefconfig    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251217    clang-20
sparc64               randconfig-001-20251217    gcc-15.1.0
sparc64               randconfig-002-20251217    gcc-12.5.0
sparc64               randconfig-002-20251217    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251217    clang-22
um                    randconfig-001-20251217    gcc-15.1.0
um                    randconfig-002-20251217    clang-22
um                    randconfig-002-20251217    gcc-15.1.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251217    clang-20
x86_64      buildonly-randconfig-001-20251217    gcc-14
x86_64      buildonly-randconfig-002-20251217    clang-20
x86_64      buildonly-randconfig-002-20251217    gcc-14
x86_64      buildonly-randconfig-003-20251217    gcc-13
x86_64      buildonly-randconfig-003-20251217    gcc-14
x86_64      buildonly-randconfig-004-20251217    gcc-14
x86_64      buildonly-randconfig-005-20251217    gcc-14
x86_64      buildonly-randconfig-006-20251217    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251216    gcc-14
x86_64                randconfig-001-20251217    clang-20
x86_64                randconfig-002-20251216    clang-20
x86_64                randconfig-002-20251217    clang-20
x86_64                randconfig-003-20251216    clang-20
x86_64                randconfig-003-20251217    clang-20
x86_64                randconfig-004-20251216    gcc-14
x86_64                randconfig-004-20251217    clang-20
x86_64                randconfig-005-20251216    clang-20
x86_64                randconfig-005-20251217    clang-20
x86_64                randconfig-006-20251216    gcc-14
x86_64                randconfig-006-20251217    clang-20
x86_64                randconfig-011-20251216    gcc-14
x86_64                randconfig-011-20251217    gcc-14
x86_64                randconfig-012-20251216    gcc-14
x86_64                randconfig-012-20251217    gcc-14
x86_64                randconfig-013-20251216    clang-20
x86_64                randconfig-013-20251217    gcc-14
x86_64                randconfig-014-20251216    clang-20
x86_64                randconfig-014-20251217    gcc-14
x86_64                randconfig-015-20251216    clang-20
x86_64                randconfig-015-20251217    gcc-14
x86_64                randconfig-016-20251216    clang-20
x86_64                randconfig-016-20251217    gcc-14
x86_64                randconfig-071-20251217    gcc-14
x86_64                randconfig-072-20251217    gcc-14
x86_64                randconfig-073-20251217    gcc-14
x86_64                randconfig-074-20251217    gcc-14
x86_64                randconfig-075-20251217    gcc-14
x86_64                randconfig-076-20251217    gcc-14
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
xtensa                randconfig-001-20251217    gcc-15.1.0
xtensa                randconfig-001-20251217    gcc-8.5.0
xtensa                randconfig-002-20251217    gcc-15.1.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

