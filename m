Return-Path: <linux-input+bounces-16553-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E29BCBA6F2
	for <lists+linux-input@lfdr.de>; Sat, 13 Dec 2025 09:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BFCBF30012F8
	for <lists+linux-input@lfdr.de>; Sat, 13 Dec 2025 08:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3761EB5F8;
	Sat, 13 Dec 2025 08:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgKD9+gV"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925112356BE
	for <linux-input@vger.kernel.org>; Sat, 13 Dec 2025 08:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765612820; cv=none; b=dR09ljrOxTqJYmEFQDYi67G3/yC4u5vhn5LugLU/6yFDRhHdmzJfTSc6IKT2Mjukyx8iqS+JxocYgHJPcPUNPUhsDXKtwOQrbKgJQkaLGELYBksAktYIdTSW+29yTFlq/G0MnBAUJVblJD+qKGkvXM/EFNXUT09/I0yOzrP8v70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765612820; c=relaxed/simple;
	bh=PnxhOhcVodI1hcT8186VlPeyBgT+zQwKDKdH3tgXT+k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SKHI9QWXj7zcPD6faOHZPoXmUZ/dz+IAR7qsHHYpbOz0n6hr9wi4FEPjA16SHOtr+x04bilPvpfXKZNK95giRtQAXhSc2isUX0ZM8CvNjbzN35y3YoklQnYbsJxtMLBbEtXt+vfC8MeQTwPkJviQGD0QHWIzwcZZOee9Dq4HjTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgKD9+gV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765612817; x=1797148817;
  h=date:from:to:cc:subject:message-id;
  bh=PnxhOhcVodI1hcT8186VlPeyBgT+zQwKDKdH3tgXT+k=;
  b=jgKD9+gVUpEIRf7WvuK1pvwRx0NaNb56bVkMK2331A83uxyuaep0ohpw
   TpNpFTXpYb+2kfGKyDCPkYrpyyE07/BGd/g84F24SIR0JhKgkfE/j1rZ1
   7BG5T9uvE4qVBRI9qP3DyIG5pHNrSlSH7hOYxeK1Ph4ji16rwfFz0h9Rd
   o4RhXxwGPOejv/x2NBlKjDPxaoFJ5ReLuqNCx9IXPKtrq/f6/Q9oQ66Mr
   FGYQzIEkAWQATNy2wvlnaPol5ZOxspiEKKEd/+qZAQiwmMv0+JGXvTlUS
   1h08wiHu2vNahJWIrS9w2TwFVnXiWY/P5uPfRcAo+qlGRl+pLkzeMnJg2
   w==;
X-CSE-ConnectionGUID: Rfe9zUXGT6WteVsBSRiS/g==
X-CSE-MsgGUID: 8KonCi1MQoeabkcjookpmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="85198296"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="85198296"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 00:00:17 -0800
X-CSE-ConnectionGUID: SnJRJJlcSo6oX3lKMNiniA==
X-CSE-MsgGUID: lf703oVeSzKvUIXK7YxsOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197175204"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Dec 2025 00:00:14 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUKY0-000000007GU-1Zv9;
	Sat, 13 Dec 2025 08:00:12 +0000
Date: Sat, 13 Dec 2025 15:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 c4b3133c6a2fc283cb3d34c64d40ed2fa254b608
Message-ID: <202512131515.jYJlNSaa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: c4b3133c6a2fc283cb3d34c64d40ed2fa254b608  Input: byd - use %*ph for Z packet dump

elapsed time: 1340m

configs tested: 296
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
arc                     nsimosci_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20251212    gcc-8.5.0
arc                   randconfig-001-20251213    gcc-15.1.0
arc                   randconfig-001-20251213    gcc-8.5.0
arc                   randconfig-002-20251212    gcc-15.1.0
arc                   randconfig-002-20251213    gcc-15.1.0
arc                   randconfig-002-20251213    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                         lpc32xx_defconfig    gcc-15.1.0
arm                            mps2_defconfig    clang-22
arm                       multi_v4t_defconfig    clang-16
arm                          pxa168_defconfig    gcc-15.1.0
arm                   randconfig-001-20251212    clang-22
arm                   randconfig-001-20251213    clang-20
arm                   randconfig-001-20251213    gcc-8.5.0
arm                   randconfig-002-20251212    clang-22
arm                   randconfig-002-20251213    gcc-8.5.0
arm                   randconfig-003-20251212    gcc-8.5.0
arm                   randconfig-003-20251213    clang-22
arm                   randconfig-003-20251213    gcc-8.5.0
arm                   randconfig-004-20251212    gcc-15.1.0
arm                   randconfig-004-20251213    clang-22
arm                   randconfig-004-20251213    gcc-8.5.0
arm                          sp7021_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251212    clang-18
arm64                 randconfig-001-20251213    clang-22
arm64                 randconfig-002-20251212    clang-19
arm64                 randconfig-002-20251213    clang-22
arm64                 randconfig-003-20251212    clang-22
arm64                 randconfig-003-20251213    clang-22
arm64                 randconfig-004-20251212    gcc-8.5.0
arm64                 randconfig-004-20251213    clang-22
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251212    gcc-14.3.0
csky                  randconfig-001-20251213    clang-22
csky                  randconfig-002-20251212    gcc-13.4.0
csky                  randconfig-002-20251213    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251212    clang-22
hexagon               randconfig-001-20251213    gcc-9.5.0
hexagon               randconfig-002-20251212    clang-22
hexagon               randconfig-002-20251213    gcc-9.5.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251213    clang-20
i386        buildonly-randconfig-002-20251213    clang-20
i386        buildonly-randconfig-002-20251213    gcc-14
i386        buildonly-randconfig-003-20251213    clang-20
i386        buildonly-randconfig-003-20251213    gcc-14
i386        buildonly-randconfig-004-20251213    clang-20
i386        buildonly-randconfig-005-20251213    clang-20
i386        buildonly-randconfig-006-20251213    clang-20
i386        buildonly-randconfig-006-20251213    gcc-14
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251212    clang-20
i386                  randconfig-001-20251213    clang-20
i386                  randconfig-002-20251212    gcc-14
i386                  randconfig-002-20251213    clang-20
i386                  randconfig-002-20251213    gcc-14
i386                  randconfig-003-20251212    clang-20
i386                  randconfig-003-20251213    clang-20
i386                  randconfig-003-20251213    gcc-13
i386                  randconfig-004-20251212    gcc-14
i386                  randconfig-004-20251213    clang-20
i386                  randconfig-005-20251212    gcc-14
i386                  randconfig-005-20251213    clang-20
i386                  randconfig-006-20251212    gcc-14
i386                  randconfig-006-20251213    clang-20
i386                  randconfig-006-20251213    gcc-14
i386                  randconfig-007-20251212    gcc-14
i386                  randconfig-007-20251213    clang-20
i386                  randconfig-007-20251213    gcc-14
i386                  randconfig-011-20251212    gcc-14
i386                  randconfig-011-20251213    gcc-14
i386                  randconfig-012-20251212    gcc-14
i386                  randconfig-012-20251213    gcc-14
i386                  randconfig-013-20251212    gcc-14
i386                  randconfig-013-20251213    clang-20
i386                  randconfig-013-20251213    gcc-14
i386                  randconfig-014-20251212    gcc-14
i386                  randconfig-014-20251213    gcc-14
i386                  randconfig-015-20251212    clang-20
i386                  randconfig-015-20251213    gcc-14
i386                  randconfig-016-20251212    gcc-14
i386                  randconfig-016-20251213    gcc-14
i386                  randconfig-017-20251212    gcc-14
i386                  randconfig-017-20251213    clang-20
i386                  randconfig-017-20251213    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch                 loongson3_defconfig    clang-22
loongarch             randconfig-001-20251212    clang-22
loongarch             randconfig-001-20251213    gcc-9.5.0
loongarch             randconfig-002-20251212    clang-18
loongarch             randconfig-002-20251213    gcc-9.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                          ath79_defconfig    gcc-15.1.0
mips                           ip30_defconfig    gcc-15.1.0
mips                       rbtx49xx_defconfig    gcc-15.1.0
mips                   sb1250_swarm_defconfig    gcc-15.1.0
nios2                         10m50_defconfig    gcc-11.5.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251212    gcc-11.5.0
nios2                 randconfig-001-20251213    gcc-9.5.0
nios2                 randconfig-002-20251212    gcc-8.5.0
nios2                 randconfig-002-20251213    gcc-9.5.0
openrisc                         alldefconfig    gcc-15.1.0
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
parisc                randconfig-001-20251212    gcc-10.5.0
parisc                randconfig-001-20251213    clang-18
parisc                randconfig-001-20251213    gcc-8.5.0
parisc                randconfig-002-20251212    gcc-12.5.0
parisc                randconfig-002-20251213    clang-18
parisc                randconfig-002-20251213    gcc-8.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                   bluestone_defconfig    gcc-15.1.0
powerpc                      mgcoge_defconfig    clang-22
powerpc                 mpc8313_rdb_defconfig    gcc-15.1.0
powerpc                      pmac32_defconfig    clang-22
powerpc                         ps3_defconfig    gcc-15.1.0
powerpc                     rainier_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251212    clang-22
powerpc               randconfig-001-20251213    clang-18
powerpc               randconfig-002-20251212    gcc-12.5.0
powerpc               randconfig-002-20251213    clang-18
powerpc               randconfig-002-20251213    clang-22
powerpc64             randconfig-001-20251212    gcc-11.5.0
powerpc64             randconfig-001-20251213    clang-16
powerpc64             randconfig-001-20251213    clang-18
powerpc64             randconfig-002-20251212    clang-22
powerpc64             randconfig-002-20251213    clang-16
powerpc64             randconfig-002-20251213    clang-18
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251213    clang-16
riscv                 randconfig-001-20251213    clang-22
riscv                 randconfig-002-20251213    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251213    clang-22
s390                  randconfig-001-20251213    gcc-13.4.0
s390                  randconfig-002-20251213    clang-17
s390                  randconfig-002-20251213    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                             espt_defconfig    gcc-15.1.0
sh                          lboxre2_defconfig    gcc-15.1.0
sh                    randconfig-001-20251213    clang-22
sh                    randconfig-001-20251213    gcc-15.1.0
sh                    randconfig-002-20251213    clang-22
sh                    randconfig-002-20251213    gcc-10.5.0
sh                   rts7751r2dplus_defconfig    gcc-15.1.0
sh                           se7343_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251213    gcc-14.3.0
sparc                 randconfig-002-20251213    gcc-14.3.0
sparc                 randconfig-002-20251213    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251213    gcc-14.3.0
sparc64               randconfig-001-20251213    gcc-15.1.0
sparc64               randconfig-002-20251213    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251213    clang-22
um                    randconfig-001-20251213    gcc-14.3.0
um                    randconfig-002-20251213    gcc-14
um                    randconfig-002-20251213    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251213    clang-20
x86_64      buildonly-randconfig-002-20251213    clang-20
x86_64      buildonly-randconfig-003-20251213    clang-20
x86_64      buildonly-randconfig-004-20251213    clang-20
x86_64      buildonly-randconfig-005-20251213    clang-20
x86_64      buildonly-randconfig-005-20251213    gcc-14
x86_64      buildonly-randconfig-006-20251213    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251213    gcc-14
x86_64                randconfig-002-20251213    gcc-14
x86_64                randconfig-003-20251213    gcc-14
x86_64                randconfig-004-20251213    clang-20
x86_64                randconfig-004-20251213    gcc-14
x86_64                randconfig-005-20251213    gcc-14
x86_64                randconfig-006-20251213    clang-20
x86_64                randconfig-006-20251213    gcc-14
x86_64                randconfig-011-20251213    clang-20
x86_64                randconfig-011-20251213    gcc-14
x86_64                randconfig-012-20251213    clang-20
x86_64                randconfig-012-20251213    gcc-14
x86_64                randconfig-013-20251213    clang-20
x86_64                randconfig-014-20251213    clang-20
x86_64                randconfig-015-20251213    clang-20
x86_64                randconfig-015-20251213    gcc-14
x86_64                randconfig-016-20251213    clang-20
x86_64                randconfig-071-20251213    clang-20
x86_64                randconfig-072-20251213    clang-20
x86_64                randconfig-073-20251213    clang-20
x86_64                randconfig-074-20251213    clang-20
x86_64                randconfig-075-20251213    clang-20
x86_64                randconfig-076-20251213    clang-20
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
xtensa                randconfig-001-20251213    gcc-14.3.0
xtensa                randconfig-001-20251213    gcc-15.1.0
xtensa                randconfig-002-20251213    gcc-14.3.0
xtensa                randconfig-002-20251213    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

