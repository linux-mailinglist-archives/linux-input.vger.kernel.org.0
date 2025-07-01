Return-Path: <linux-input+bounces-13311-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FBCAEFFCE
	for <lists+linux-input@lfdr.de>; Tue,  1 Jul 2025 18:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C86016B2AC
	for <lists+linux-input@lfdr.de>; Tue,  1 Jul 2025 16:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3539427C163;
	Tue,  1 Jul 2025 16:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IasHVzv2"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E256927B4FC
	for <linux-input@vger.kernel.org>; Tue,  1 Jul 2025 16:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387263; cv=none; b=G0gX5DSFqw9iJ9f8GlHf2vTbSnIbatieFGbdt7fCByITvtl9Th57YctvDDtmna0k4NlO14jFtlh+GHzrNv7jJmuObRjbPdxqHA45gFBp47cxKKtG5Jz2xkohlYjxGNgUWxj9Nub+JlZMeImlZLVuf4cE6BhQ3UsuZcnXcs9xYw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387263; c=relaxed/simple;
	bh=MJRPokPJovDg60I5OSRq2yw6kBn7IfQpVYxFJ/qBNGs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cUS5z6nCfO2VzLvbT3U6fLG8XBv3QW8v+0r7NBtGOF7VjQdKZNEF13Bd0JqBB0ulo32HkAUAgk2M6vaqL26v09pf7GxpcySc8mlt/IVAbier+K8K3o0xyfco2fKwoNDBuEma87PRIYdEI+Vgnj/TheZGsQdJTej/KMrZD3TgDnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IasHVzv2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751387261; x=1782923261;
  h=date:from:to:cc:subject:message-id;
  bh=MJRPokPJovDg60I5OSRq2yw6kBn7IfQpVYxFJ/qBNGs=;
  b=IasHVzv2Qwyb+DnvDT/q2DEhf/kGdOo146BXpucL3m7kjlLmI7tMC29J
   eatfMM1qUK3KYQA8uPkSbABWsCbxc2FxTeOeBDliKn2Fvdt8Kwn7iljqE
   ZdUGlvA1aLXKtMQ1gf8pcVv7Jqa8h3Qozx3NKLD++/rpAHa2EQpo0vrTc
   IgJRMFbF2m1KNRpWmVNxYNooa+a9LYw4LMS/zSc5nqNr/Wsarf8XbfsrB
   tD+KnDGqbTkRz/vACeVjeu8RI2dTd0F0BCPnyIPRvf6n/iDgDC1zWnn3z
   oECc02Q8Be/4QjnJ1yTOaxYNKGc7Z6+JlSTEpijaB767qtcIgpVaZAt+1
   w==;
X-CSE-ConnectionGUID: hUD9TGorTlCist05rmWWgg==
X-CSE-MsgGUID: 9oGQIoDASXidIN7SPw47RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53524140"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53524140"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:27:41 -0700
X-CSE-ConnectionGUID: psl1TE6QQlWv7yBf9N74EQ==
X-CSE-MsgGUID: 6ekSbW3KSc6QOmi+N4TZBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153228222"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2025 09:27:39 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWdpZ-000aQM-0J;
	Tue, 01 Jul 2025 16:27:37 +0000
Date: Wed, 02 Jul 2025 00:27:30 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 54e626d097b05af9421534d211c9f96211d07d66
Message-ID: <202507020020.IjJFo16y-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 54e626d097b05af9421534d211c9f96211d07d66  Input: max8997_haptic - optimize PWM configuration

elapsed time: 1244m

configs tested: 218
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.1.0
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250701    gcc-13.3.0
arc                   randconfig-001-20250701    gcc-8.5.0
arc                   randconfig-002-20250701    gcc-15.1.0
arc                   randconfig-002-20250701    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-15.1.0
arm                   randconfig-001-20250701    clang-17
arm                   randconfig-001-20250701    gcc-8.5.0
arm                   randconfig-002-20250701    gcc-8.5.0
arm                   randconfig-003-20250701    clang-21
arm                   randconfig-003-20250701    gcc-8.5.0
arm                   randconfig-004-20250701    clang-21
arm                   randconfig-004-20250701    gcc-8.5.0
arm                           sama5_defconfig    gcc-15.1.0
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250701    clang-21
arm64                 randconfig-001-20250701    gcc-8.5.0
arm64                 randconfig-002-20250701    gcc-15.1.0
arm64                 randconfig-002-20250701    gcc-8.5.0
arm64                 randconfig-003-20250701    clang-18
arm64                 randconfig-003-20250701    gcc-8.5.0
arm64                 randconfig-004-20250701    gcc-5.5.0
arm64                 randconfig-004-20250701    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250701    gcc-11.5.0
csky                  randconfig-001-20250701    gcc-13.3.0
csky                  randconfig-002-20250701    gcc-10.5.0
csky                  randconfig-002-20250701    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250701    clang-21
hexagon               randconfig-001-20250701    gcc-13.3.0
hexagon               randconfig-002-20250701    clang-21
hexagon               randconfig-002-20250701    gcc-13.3.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250701    gcc-12
i386        buildonly-randconfig-002-20250701    gcc-12
i386        buildonly-randconfig-003-20250701    gcc-12
i386        buildonly-randconfig-004-20250701    gcc-12
i386        buildonly-randconfig-005-20250701    gcc-12
i386        buildonly-randconfig-006-20250701    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250701    clang-20
i386                  randconfig-002-20250701    clang-20
i386                  randconfig-003-20250701    clang-20
i386                  randconfig-004-20250701    clang-20
i386                  randconfig-005-20250701    clang-20
i386                  randconfig-006-20250701    clang-20
i386                  randconfig-007-20250701    clang-20
i386                  randconfig-011-20250701    clang-20
i386                  randconfig-012-20250701    clang-20
i386                  randconfig-013-20250701    clang-20
i386                  randconfig-014-20250701    clang-20
i386                  randconfig-015-20250701    clang-20
i386                  randconfig-016-20250701    clang-20
i386                  randconfig-017-20250701    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250701    gcc-13.3.0
loongarch             randconfig-002-20250701    gcc-13.3.0
loongarch             randconfig-002-20250701    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5275evb_defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250701    gcc-13.3.0
nios2                 randconfig-001-20250701    gcc-14.2.0
nios2                 randconfig-002-20250701    gcc-13.3.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250701    gcc-13.3.0
parisc                randconfig-001-20250701    gcc-14.3.0
parisc                randconfig-002-20250701    gcc-10.5.0
parisc                randconfig-002-20250701    gcc-13.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   currituck_defconfig    gcc-15.1.0
powerpc                   motionpro_defconfig    gcc-15.1.0
powerpc                 mpc8313_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250701    gcc-13.3.0
powerpc               randconfig-002-20250701    clang-21
powerpc               randconfig-002-20250701    gcc-13.3.0
powerpc               randconfig-003-20250701    clang-21
powerpc               randconfig-003-20250701    gcc-13.3.0
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250701    clang-21
powerpc64             randconfig-001-20250701    gcc-13.3.0
powerpc64             randconfig-002-20250701    clang-21
powerpc64             randconfig-002-20250701    gcc-13.3.0
powerpc64             randconfig-003-20250701    gcc-10.5.0
powerpc64             randconfig-003-20250701    gcc-13.3.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    gcc-15.1.0
riscv                 randconfig-001-20250701    gcc-12
riscv                 randconfig-001-20250701    gcc-14.3.0
riscv                 randconfig-002-20250701    gcc-10.5.0
riscv                 randconfig-002-20250701    gcc-12
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250701    gcc-12
s390                  randconfig-001-20250701    gcc-9.3.0
s390                  randconfig-002-20250701    clang-17
s390                  randconfig-002-20250701    gcc-12
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250701    gcc-12
sh                    randconfig-001-20250701    gcc-5.5.0
sh                    randconfig-002-20250701    gcc-12
sh                    randconfig-002-20250701    gcc-13.3.0
sh                          rsk7201_defconfig    gcc-15.1.0
sh                   sh7724_generic_defconfig    gcc-15.1.0
sh                            titan_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250701    gcc-10.3.0
sparc                 randconfig-001-20250701    gcc-12
sparc                 randconfig-002-20250701    gcc-12
sparc                 randconfig-002-20250701    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250701    gcc-12
sparc64               randconfig-001-20250701    gcc-8.5.0
sparc64               randconfig-002-20250701    gcc-12
sparc64               randconfig-002-20250701    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250701    gcc-12
um                    randconfig-002-20250701    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250701    gcc-12
x86_64      buildonly-randconfig-002-20250701    gcc-12
x86_64      buildonly-randconfig-003-20250701    gcc-12
x86_64      buildonly-randconfig-004-20250701    gcc-12
x86_64      buildonly-randconfig-005-20250701    clang-20
x86_64      buildonly-randconfig-005-20250701    gcc-12
x86_64      buildonly-randconfig-006-20250701    clang-20
x86_64      buildonly-randconfig-006-20250701    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250701    gcc-12
x86_64                randconfig-002-20250701    gcc-12
x86_64                randconfig-003-20250701    gcc-12
x86_64                randconfig-004-20250701    gcc-12
x86_64                randconfig-005-20250701    gcc-12
x86_64                randconfig-006-20250701    gcc-12
x86_64                randconfig-007-20250701    gcc-12
x86_64                randconfig-008-20250701    gcc-12
x86_64                randconfig-071-20250701    gcc-12
x86_64                randconfig-072-20250701    gcc-12
x86_64                randconfig-073-20250701    gcc-12
x86_64                randconfig-074-20250701    gcc-12
x86_64                randconfig-075-20250701    gcc-12
x86_64                randconfig-076-20250701    gcc-12
x86_64                randconfig-077-20250701    gcc-12
x86_64                randconfig-078-20250701    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  nommu_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250701    gcc-12
xtensa                randconfig-001-20250701    gcc-15.1.0
xtensa                randconfig-002-20250701    gcc-12
xtensa                randconfig-002-20250701    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

