Return-Path: <linux-input+bounces-16518-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF7ECB1C59
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 04:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42E1330647B5
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 03:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FCC225A39;
	Wed, 10 Dec 2025 03:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3P3bN/T"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7920E222582
	for <linux-input@vger.kernel.org>; Wed, 10 Dec 2025 03:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765336120; cv=none; b=h5pC5pZ/l0Zazc+JRJrV21a8R28D5KSk3N6q1jvQ+oGn/0VCSSIFjHPLnvCkC0xq7sLQXDuZuA3SA/68vL1VnPKfj459vcMUnwNNQq4G4/YIbtkoSkA/3gQiCVWLBJziMb7QGrvT9uRyyo7BiN2qQyQ1CYHGjXOsHY9rGPv4TEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765336120; c=relaxed/simple;
	bh=1FS6pDPXX9++yvKrafWhn1InOYbPYpIG1tWyeSzMQhA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sAJ/DeKKMUSPxnK8vtaEHx6DDA3fCx+fdafC/MgYGD+P1F0SGxvt27duzoB4uHqPEY0e3xR75zoVSarA2sH2vtrUvtBRrabqJW3wOitTKxJ1JQCyAqfK7FTBz94ATVQkhi1S/WqeKKctWM8+T2Kde5FE1DT8StqdcFGEEAzYePs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3P3bN/T; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765336119; x=1796872119;
  h=date:from:to:cc:subject:message-id;
  bh=1FS6pDPXX9++yvKrafWhn1InOYbPYpIG1tWyeSzMQhA=;
  b=H3P3bN/TmIh+PxwgWiI7pECF2Jbtfdt1qilyTt6rDKTiEtChyKtrYSlr
   MmCzXgoDXoIextiIX2xoLmTISn2NQGzIB01Tl1i0KSeZXSjQpudDRftNE
   H42bVJD0+u8O1m8ZNHyDmJsbt8PZV2HvU8ddFT8XLlNN95OmlpbCT6ihz
   X3syg9djy+c+mGrhHJJwDlTOokLjKtV79MfanGeywO/sTM7upAizoWUqL
   Ddg9mRdkCA4e0e89Mu5c0kQZCUQIxoHoSJ+eqloJqAMzOyUBMiBdbgeUU
   X5heWrO+uJXCOfvrc7M4IFPKYhDODfqWd3KuC+ALddt64s9cHXpiB4nLW
   w==;
X-CSE-ConnectionGUID: iv7bWbUdTaugTXPoPiibOg==
X-CSE-MsgGUID: A9897xy6SJyZeh98nEn2UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="54847885"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="54847885"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 19:08:38 -0800
X-CSE-ConnectionGUID: 8FcWnVKgRLuwEZNa6A/MMQ==
X-CSE-MsgGUID: rLd+pL4xRYmhD2XQc8vtZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="196143626"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Dec 2025 19:08:37 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTAZ8-000000002ay-1XdG;
	Wed, 10 Dec 2025 03:08:34 +0000
Date: Wed, 10 Dec 2025 11:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 429c4727011ead99129b14dc9ff4c87a747a50ab
Message-ID: <202512101151.iPdGDYyZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 429c4727011ead99129b14dc9ff4c87a747a50ab  Merge branch 'next' into for-linus

elapsed time: 1459m

configs tested: 333
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
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251209    clang-22
arc                   randconfig-001-20251209    gcc-13.4.0
arc                   randconfig-001-20251210    gcc-11.5.0
arc                   randconfig-002-20251209    clang-22
arc                   randconfig-002-20251209    gcc-9.5.0
arc                   randconfig-002-20251210    gcc-11.5.0
arc                        vdk_hs38_defconfig    gcc-15.1.0
arc                    vdk_hs38_smp_defconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.1.0
arm                      jornada720_defconfig    clang-22
arm                            mps2_defconfig    clang-22
arm                   randconfig-001-20251209    clang-19
arm                   randconfig-001-20251209    clang-22
arm                   randconfig-001-20251210    gcc-11.5.0
arm                   randconfig-002-20251209    clang-20
arm                   randconfig-002-20251209    clang-22
arm                   randconfig-002-20251210    gcc-11.5.0
arm                   randconfig-003-20251209    clang-22
arm                   randconfig-003-20251210    gcc-11.5.0
arm                   randconfig-004-20251209    clang-22
arm                   randconfig-004-20251210    gcc-11.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251209    gcc-8.5.0
arm64                 randconfig-001-20251209    gcc-9.5.0
arm64                 randconfig-001-20251210    clang-17
arm64                 randconfig-002-20251209    gcc-9.5.0
arm64                 randconfig-002-20251210    clang-17
arm64                 randconfig-003-20251209    clang-22
arm64                 randconfig-003-20251209    gcc-9.5.0
arm64                 randconfig-003-20251210    clang-17
arm64                 randconfig-004-20251209    gcc-11.5.0
arm64                 randconfig-004-20251209    gcc-9.5.0
arm64                 randconfig-004-20251210    clang-17
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251209    gcc-15.1.0
csky                  randconfig-001-20251209    gcc-9.5.0
csky                  randconfig-001-20251210    clang-17
csky                  randconfig-002-20251209    gcc-15.1.0
csky                  randconfig-002-20251209    gcc-9.5.0
csky                  randconfig-002-20251210    clang-17
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251209    clang-22
hexagon               randconfig-001-20251210    gcc-10.5.0
hexagon               randconfig-002-20251209    clang-22
hexagon               randconfig-002-20251210    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251209    clang-20
i386        buildonly-randconfig-001-20251209    gcc-14
i386        buildonly-randconfig-001-20251210    clang-20
i386        buildonly-randconfig-002-20251209    clang-20
i386        buildonly-randconfig-002-20251209    gcc-14
i386        buildonly-randconfig-002-20251210    clang-20
i386        buildonly-randconfig-003-20251209    gcc-14
i386        buildonly-randconfig-003-20251210    clang-20
i386        buildonly-randconfig-004-20251209    gcc-14
i386        buildonly-randconfig-004-20251210    clang-20
i386        buildonly-randconfig-005-20251209    gcc-14
i386        buildonly-randconfig-005-20251210    clang-20
i386        buildonly-randconfig-006-20251209    gcc-14
i386        buildonly-randconfig-006-20251210    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251209    gcc-14
i386                  randconfig-001-20251210    clang-20
i386                  randconfig-002-20251209    clang-20
i386                  randconfig-002-20251210    clang-20
i386                  randconfig-003-20251209    clang-20
i386                  randconfig-003-20251210    clang-20
i386                  randconfig-004-20251209    gcc-14
i386                  randconfig-004-20251210    clang-20
i386                  randconfig-005-20251209    gcc-14
i386                  randconfig-005-20251210    clang-20
i386                  randconfig-006-20251209    clang-20
i386                  randconfig-006-20251210    clang-20
i386                  randconfig-007-20251209    gcc-14
i386                  randconfig-007-20251210    clang-20
i386                  randconfig-011-20251209    clang-20
i386                  randconfig-011-20251209    gcc-14
i386                  randconfig-011-20251210    gcc-14
i386                  randconfig-012-20251209    clang-20
i386                  randconfig-012-20251209    gcc-14
i386                  randconfig-012-20251210    gcc-14
i386                  randconfig-013-20251209    clang-20
i386                  randconfig-013-20251209    gcc-14
i386                  randconfig-013-20251210    gcc-14
i386                  randconfig-014-20251209    clang-20
i386                  randconfig-014-20251209    gcc-14
i386                  randconfig-014-20251210    gcc-14
i386                  randconfig-015-20251209    clang-20
i386                  randconfig-015-20251209    gcc-14
i386                  randconfig-015-20251210    gcc-14
i386                  randconfig-016-20251209    clang-20
i386                  randconfig-016-20251209    gcc-14
i386                  randconfig-016-20251210    gcc-14
i386                  randconfig-017-20251209    gcc-14
i386                  randconfig-017-20251210    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251209    clang-22
loongarch             randconfig-001-20251210    gcc-10.5.0
loongarch             randconfig-002-20251209    clang-22
loongarch             randconfig-002-20251210    gcc-10.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
m68k                        m5407c3_defconfig    gcc-15.1.0
m68k                          sun3x_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
mips                       rbtx49xx_defconfig    clang-22
mips                       rbtx49xx_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251209    gcc-8.5.0
nios2                 randconfig-001-20251210    gcc-10.5.0
nios2                 randconfig-002-20251209    gcc-11.5.0
nios2                 randconfig-002-20251210    gcc-10.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                 simple_smp_defconfig    clang-22
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251209    gcc-15.1.0
parisc                randconfig-001-20251209    gcc-8.5.0
parisc                randconfig-001-20251210    clang-19
parisc                randconfig-002-20251209    gcc-13.4.0
parisc                randconfig-002-20251209    gcc-15.1.0
parisc                randconfig-002-20251210    clang-19
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      chrp32_defconfig    gcc-15.1.0
powerpc                    ge_imp3a_defconfig    gcc-15.1.0
powerpc                   lite5200b_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251209    gcc-14.3.0
powerpc               randconfig-001-20251209    gcc-15.1.0
powerpc               randconfig-001-20251210    clang-19
powerpc               randconfig-002-20251209    clang-22
powerpc               randconfig-002-20251209    gcc-15.1.0
powerpc               randconfig-002-20251210    clang-19
powerpc64             randconfig-001-20251209    gcc-14.3.0
powerpc64             randconfig-001-20251209    gcc-15.1.0
powerpc64             randconfig-001-20251210    clang-19
powerpc64             randconfig-002-20251209    gcc-15.1.0
powerpc64             randconfig-002-20251210    clang-19
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251209    clang-22
riscv                 randconfig-001-20251210    clang-22
riscv                 randconfig-002-20251209    clang-18
riscv                 randconfig-002-20251210    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251209    gcc-12.5.0
s390                  randconfig-001-20251210    clang-22
s390                  randconfig-002-20251209    gcc-12.5.0
s390                  randconfig-002-20251210    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                               j2_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    clang-22
sh                    randconfig-001-20251209    gcc-14.3.0
sh                    randconfig-001-20251210    clang-22
sh                    randconfig-002-20251209    gcc-13.4.0
sh                    randconfig-002-20251210    clang-22
sh                           se7206_defconfig    clang-22
sh                           sh2007_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251209    gcc-11.5.0
sparc                 randconfig-001-20251210    gcc-15.1.0
sparc                 randconfig-002-20251209    gcc-15.1.0
sparc                 randconfig-002-20251210    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251209    clang-22
sparc64               randconfig-001-20251210    gcc-15.1.0
sparc64               randconfig-002-20251209    clang-20
sparc64               randconfig-002-20251210    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251209    gcc-14
um                    randconfig-001-20251210    gcc-15.1.0
um                    randconfig-002-20251209    gcc-14
um                    randconfig-002-20251210    gcc-15.1.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251209    clang-20
x86_64      buildonly-randconfig-001-20251209    gcc-14
x86_64      buildonly-randconfig-001-20251210    clang-20
x86_64      buildonly-randconfig-002-20251209    gcc-14
x86_64      buildonly-randconfig-002-20251210    clang-20
x86_64      buildonly-randconfig-003-20251209    gcc-14
x86_64      buildonly-randconfig-003-20251210    clang-20
x86_64      buildonly-randconfig-004-20251209    clang-20
x86_64      buildonly-randconfig-004-20251209    gcc-14
x86_64      buildonly-randconfig-004-20251210    clang-20
x86_64      buildonly-randconfig-005-20251209    clang-20
x86_64      buildonly-randconfig-005-20251209    gcc-14
x86_64      buildonly-randconfig-005-20251210    clang-20
x86_64      buildonly-randconfig-006-20251209    clang-20
x86_64      buildonly-randconfig-006-20251209    gcc-14
x86_64      buildonly-randconfig-006-20251210    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251209    clang-20
x86_64                randconfig-001-20251210    gcc-14
x86_64                randconfig-002-20251209    clang-20
x86_64                randconfig-002-20251210    gcc-14
x86_64                randconfig-003-20251209    clang-20
x86_64                randconfig-003-20251210    gcc-14
x86_64                randconfig-004-20251209    gcc-14
x86_64                randconfig-004-20251210    gcc-14
x86_64                randconfig-005-20251209    gcc-14
x86_64                randconfig-005-20251210    gcc-14
x86_64                randconfig-006-20251209    gcc-14
x86_64                randconfig-006-20251210    gcc-14
x86_64                randconfig-011-20251209    gcc-14
x86_64                randconfig-011-20251210    clang-20
x86_64                randconfig-012-20251209    clang-20
x86_64                randconfig-012-20251210    clang-20
x86_64                randconfig-013-20251209    gcc-14
x86_64                randconfig-013-20251210    clang-20
x86_64                randconfig-014-20251209    clang-20
x86_64                randconfig-014-20251210    clang-20
x86_64                randconfig-015-20251209    clang-20
x86_64                randconfig-015-20251210    clang-20
x86_64                randconfig-016-20251209    clang-20
x86_64                randconfig-016-20251210    clang-20
x86_64                randconfig-071-20251209    clang-20
x86_64                randconfig-071-20251210    clang-20
x86_64                randconfig-072-20251209    gcc-14
x86_64                randconfig-072-20251210    clang-20
x86_64                randconfig-073-20251209    gcc-14
x86_64                randconfig-073-20251210    clang-20
x86_64                randconfig-074-20251209    gcc-14
x86_64                randconfig-074-20251210    clang-20
x86_64                randconfig-075-20251209    gcc-14
x86_64                randconfig-075-20251210    clang-20
x86_64                randconfig-076-20251209    clang-20
x86_64                randconfig-076-20251210    clang-20
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
xtensa                generic_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251209    gcc-13.4.0
xtensa                randconfig-001-20251210    gcc-15.1.0
xtensa                randconfig-002-20251209    gcc-10.5.0
xtensa                randconfig-002-20251210    gcc-15.1.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0
xtensa                    xip_kc705_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

