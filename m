Return-Path: <linux-input+bounces-16610-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFA4CC6539
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 08:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B80B3008198
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 07:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EC0231836;
	Wed, 17 Dec 2025 07:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBkoKOXs"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E064A1DC1AB
	for <linux-input@vger.kernel.org>; Wed, 17 Dec 2025 07:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765954938; cv=none; b=JZg5FWN+OMdDVItLRAkaz2Z69n+CVBRgrxn51kN6dy8yuGAv77mSOIDw7ffDaL1gieEyZuiqK/gT258hdE9kumhRxHq146SGyppWeWZNvQVTa2L69OQ438w8kbyhOW2Qmp6dnWRneDyUMGzrn/83Qpa99luj2+irC6IDzCB4OHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765954938; c=relaxed/simple;
	bh=C8SpIFO3pq1Ek0ep4XdiUuBz6Ii1zVjeD02r7JZOeD4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lK0oC9ebrUrzMVU8J4Rmws1c0CLD3GJr3OSwDElYG9irGFk9+2EvCWWFfYeTKIlVbqrakMzHwksT3B0me+Ev9qZzYA+NL2/FdonVXHObXtuWW/yIxeVOziG1+N2UDRuLNHNxWpDpdmUvLn4iBNbpf1WW3rzJ+K/SPtzfzz54Ai0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBkoKOXs; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765954936; x=1797490936;
  h=date:from:to:cc:subject:message-id;
  bh=C8SpIFO3pq1Ek0ep4XdiUuBz6Ii1zVjeD02r7JZOeD4=;
  b=BBkoKOXsl6wN1K+Jy3yPCmezXpvz4IB6sa14YQi6qU67rxLfwrjPsBRR
   gTK/egxJtzsd0eQmjhrcvyQy2wmWyMwoKv9PKlmG/fBNQSPVAoytKR+z2
   mf4d+EQIP83PELGaggMKHm1agko/Pjhpdf5f0MNSvF560fpue5jK2QcRg
   CYUVclPG6x2W+6GeBZveEN/B0m/Z0+Tt50ehcboNnavevLZozzJIWl2ej
   qbk6cSODS1iQzlwF01Nfd3fqQG1TgS2vMTioF2yolsYtKCNpEJSQGsxmg
   zOB4ajgIhKtrYpm89rqbQbE+1MKRuqRk5wtrGyb3eCOIOGAUHRtYyv7Nq
   Q==;
X-CSE-ConnectionGUID: UA/c8Y3URbK9HWamf68+IQ==
X-CSE-MsgGUID: dzuZ2+VZT66LXoopVYqYmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78598631"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="78598631"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 23:02:16 -0800
X-CSE-ConnectionGUID: pTjYlLg+RZyea5MHquSD4w==
X-CSE-MsgGUID: kEJbWEtRS0GfmqTR+kUFCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="221611309"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Dec 2025 23:02:15 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVlY5-0000000007n-0w37;
	Wed, 17 Dec 2025 07:02:13 +0000
Date: Wed, 17 Dec 2025 15:02:01 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 d79f302f2f9829d04b0ab6181c38716c5a68804d
Message-ID: <202512171555.952oQcmt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: d79f302f2f9829d04b0ab6181c38716c5a68804d  dt-bindings: input: touchscreen: sitronix,st1232: Add Sitronix ST1624

elapsed time: 1460m

configs tested: 264
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251216    gcc-12.5.0
arc                   randconfig-001-20251217    clang-22
arc                   randconfig-002-20251216    gcc-12.5.0
arc                   randconfig-002-20251217    clang-22
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                           imxrt_defconfig    clang-22
arm                   milbeaut_m10v_defconfig    clang-19
arm                            mps2_defconfig    clang-22
arm                        mvebu_v7_defconfig    clang-22
arm                   randconfig-001-20251216    gcc-10.5.0
arm                   randconfig-001-20251217    clang-22
arm                   randconfig-002-20251216    gcc-8.5.0
arm                   randconfig-002-20251217    clang-22
arm                   randconfig-003-20251216    gcc-11.5.0
arm                   randconfig-003-20251217    clang-22
arm                   randconfig-004-20251216    clang-19
arm                   randconfig-004-20251217    clang-22
arm                    vt8500_v6_v7_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251217    gcc-8.5.0
arm64                 randconfig-002-20251217    clang-22
arm64                 randconfig-003-20251217    clang-22
arm64                 randconfig-004-20251217    clang-20
csky                             alldefconfig    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251217    gcc-15.1.0
csky                  randconfig-002-20251217    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251216    clang-22
hexagon               randconfig-001-20251217    gcc-11.5.0
hexagon               randconfig-002-20251216    clang-19
hexagon               randconfig-002-20251217    gcc-11.5.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251216    clang-20
i386        buildonly-randconfig-002-20251216    gcc-14
i386        buildonly-randconfig-003-20251216    gcc-14
i386        buildonly-randconfig-004-20251216    gcc-14
i386        buildonly-randconfig-005-20251216    clang-20
i386        buildonly-randconfig-006-20251216    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251216    clang-20
i386                  randconfig-001-20251217    clang-20
i386                  randconfig-001-20251217    gcc-14
i386                  randconfig-002-20251216    clang-20
i386                  randconfig-002-20251217    clang-20
i386                  randconfig-002-20251217    gcc-14
i386                  randconfig-003-20251216    gcc-14
i386                  randconfig-003-20251217    clang-20
i386                  randconfig-003-20251217    gcc-14
i386                  randconfig-004-20251216    gcc-14
i386                  randconfig-004-20251217    gcc-14
i386                  randconfig-005-20251216    gcc-14
i386                  randconfig-005-20251217    gcc-13
i386                  randconfig-005-20251217    gcc-14
i386                  randconfig-006-20251216    gcc-14
i386                  randconfig-006-20251217    clang-20
i386                  randconfig-006-20251217    gcc-14
i386                  randconfig-007-20251216    clang-20
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
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251216    gcc-15.1.0
loongarch             randconfig-001-20251217    gcc-11.5.0
loongarch             randconfig-002-20251216    clang-22
loongarch             randconfig-002-20251217    gcc-11.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
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
mips                          eyeq6_defconfig    clang-22
mips                       rbtx49xx_defconfig    gcc-15.1.0
nios2                         3c120_defconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251216    gcc-8.5.0
nios2                 randconfig-001-20251217    gcc-11.5.0
nios2                 randconfig-002-20251216    gcc-11.5.0
nios2                 randconfig-002-20251217    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
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
powerpc                     ppa8548_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251216    clang-22
powerpc               randconfig-001-20251217    gcc-8.5.0
powerpc               randconfig-002-20251216    clang-19
powerpc               randconfig-002-20251217    gcc-8.5.0
powerpc                     sequoia_defconfig    clang-17
powerpc                 xes_mpc85xx_defconfig    gcc-15.1.0
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
riscv                 randconfig-002-20251216    clang-17
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251216    clang-22
s390                  randconfig-002-20251216    clang-20
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251216    gcc-13.4.0
sh                    randconfig-002-20251216    gcc-12.5.0
sh                          rsk7203_defconfig    gcc-15.1.0
sh                           se7712_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sh                           se7751_defconfig    gcc-15.1.0
sh                   secureedge5410_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251216    gcc-8.5.0
sparc                 randconfig-002-20251216    gcc-14.3.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251216    clang-22
sparc64               randconfig-002-20251216    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251216    gcc-12
um                    randconfig-002-20251216    gcc-14
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251216    clang-20
x86_64      buildonly-randconfig-002-20251216    gcc-14
x86_64      buildonly-randconfig-003-20251216    clang-20
x86_64      buildonly-randconfig-004-20251216    clang-20
x86_64      buildonly-randconfig-005-20251216    gcc-14
x86_64      buildonly-randconfig-006-20251216    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251216    gcc-14
x86_64                randconfig-002-20251216    clang-20
x86_64                randconfig-003-20251216    clang-20
x86_64                randconfig-004-20251216    gcc-14
x86_64                randconfig-005-20251216    clang-20
x86_64                randconfig-006-20251216    gcc-14
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
x86_64                randconfig-071-20251216    clang-20
x86_64                randconfig-071-20251217    clang-20
x86_64                randconfig-072-20251216    gcc-14
x86_64                randconfig-072-20251217    gcc-13
x86_64                randconfig-073-20251216    gcc-14
x86_64                randconfig-073-20251217    gcc-14
x86_64                randconfig-074-20251216    gcc-12
x86_64                randconfig-074-20251217    clang-20
x86_64                randconfig-075-20251216    clang-20
x86_64                randconfig-075-20251217    clang-20
x86_64                randconfig-076-20251216    clang-20
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
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251216    gcc-8.5.0
xtensa                randconfig-002-20251216    gcc-12.5.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

