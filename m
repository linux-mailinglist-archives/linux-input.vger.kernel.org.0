Return-Path: <linux-input+bounces-9254-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C90A12E56
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2025 23:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B45E1887405
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2025 22:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3251D90CB;
	Wed, 15 Jan 2025 22:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGhI1Bp8"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCE519CC2A
	for <linux-input@vger.kernel.org>; Wed, 15 Jan 2025 22:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736980593; cv=none; b=mSIhMvTsoD4yiOZF72NtUE4CUqpGUEAIjw1SxN0Q4jW+RRatVVoDqNxSTNmt1f0Ocq7/n+0ilQ+vFdIbdRRIYcI4Dy/y0iXkXdKS9flv2nrcF+P+BIPbo9AwZlqS66XeIuObDB1UfK6CRVwGwjBMi+9HrW85wsdkMZuTZ5NfRgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736980593; c=relaxed/simple;
	bh=Q92ksp+dX8YLFKBm6+vQqOXfUBJgB2OFQSoHk4IB7yY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jdLkhMNzMMZCrX75frfJj26We6PLGKfo5XAybpki2BzStT4cwHOo0Gc47H/PKKUNFkLAGyU/42jXLMzt3NTrsHfeP+2Zlp4DVsXgcrS2V2NPKIhNMmXhjzD/+RuYI2dzELKSp9Z/BRi9XBXhnUqR53vDq3aGeBTcT1g2PoJ9Bn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGhI1Bp8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736980591; x=1768516591;
  h=date:from:to:cc:subject:message-id;
  bh=Q92ksp+dX8YLFKBm6+vQqOXfUBJgB2OFQSoHk4IB7yY=;
  b=fGhI1Bp8lPvie93mebxY6tBXYFtb/3SPSCHXB/IuEST83NWI7yM7SrPN
   nMrnoEzLeXJgETr6HiqG+1kt1NvuztQhUHXqk69xUNHKpjRPQF2Ij/PMD
   AChCRurlP0FVB43FCrxMnDlTlldQRSKI3MvdRjOlXboJNyqiNz7ORpQhn
   CMWRkulp5s4amNT0k3Dtt/uBV1vNEAlNHEuBKg2OuAh6rRklEB3QipgfB
   nkJ/IgXZ//8CWdMqPgY0N2s/3YBqiKfNFEGdpwOhGdBNLCKFXLayCtswW
   uO1l4DFRVGZw0rYzKcNSnARloTPyYQ6gAmtvjQ/gCpnrLGfpkAJvgk9X7
   g==;
X-CSE-ConnectionGUID: vBQ0gANIToukYKBhxQB7hg==
X-CSE-MsgGUID: 3ANbjcloRHqPDI/IprpRzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="54755594"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="54755594"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 14:36:30 -0800
X-CSE-ConnectionGUID: y9ViUAs9R7m1PHJvR29YRw==
X-CSE-MsgGUID: 8g9UnhV9RPSuzP3xW532zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="105826311"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Jan 2025 14:36:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYBzv-000Qxb-11;
	Wed, 15 Jan 2025 22:36:27 +0000
Date: Thu, 16 Jan 2025 06:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 d3561c4098de9666b87630ad3f090b41e67cdd62
Message-ID: <202501160607.pp2vyMnr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: d3561c4098de9666b87630ad3f090b41e67cdd62  Input: joystick - use str_off_on() helper in sw_connect()

elapsed time: 1455m

configs tested: 203
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-14.2.0
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-18
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                   randconfig-001-20250115    gcc-13.2.0
arc                   randconfig-001-20250116    clang-15
arc                   randconfig-002-20250115    gcc-13.2.0
arc                   randconfig-002-20250116    clang-15
arc                        vdk_hs38_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                         lpc32xx_defconfig    gcc-14.2.0
arm                        multi_v5_defconfig    gcc-14.2.0
arm                        neponset_defconfig    gcc-14.2.0
arm                   randconfig-001-20250115    clang-16
arm                   randconfig-001-20250116    clang-15
arm                   randconfig-002-20250115    clang-20
arm                   randconfig-002-20250116    clang-15
arm                   randconfig-003-20250115    clang-20
arm                   randconfig-003-20250116    clang-15
arm                   randconfig-004-20250115    clang-20
arm                   randconfig-004-20250116    clang-15
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250115    clang-20
arm64                 randconfig-001-20250116    clang-15
arm64                 randconfig-002-20250115    gcc-14.2.0
arm64                 randconfig-002-20250116    clang-15
arm64                 randconfig-003-20250115    clang-18
arm64                 randconfig-003-20250116    clang-15
arm64                 randconfig-004-20250115    gcc-14.2.0
arm64                 randconfig-004-20250116    clang-15
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250115    gcc-14.2.0
csky                  randconfig-001-20250116    clang-20
csky                  randconfig-002-20250115    gcc-14.2.0
csky                  randconfig-002-20250116    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20250115    clang-20
hexagon               randconfig-001-20250116    clang-20
hexagon               randconfig-002-20250115    clang-19
hexagon               randconfig-002-20250116    clang-20
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20250115    clang-19
i386        buildonly-randconfig-001-20250116    clang-19
i386        buildonly-randconfig-002-20250115    gcc-12
i386        buildonly-randconfig-002-20250116    clang-19
i386        buildonly-randconfig-003-20250115    gcc-12
i386        buildonly-randconfig-003-20250116    clang-19
i386        buildonly-randconfig-004-20250115    gcc-12
i386        buildonly-randconfig-004-20250116    clang-19
i386        buildonly-randconfig-005-20250115    gcc-12
i386        buildonly-randconfig-005-20250116    clang-19
i386        buildonly-randconfig-006-20250115    gcc-12
i386        buildonly-randconfig-006-20250116    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20250116    clang-19
i386                  randconfig-002-20250116    clang-19
i386                  randconfig-003-20250116    clang-19
i386                  randconfig-004-20250116    clang-19
i386                  randconfig-005-20250116    clang-19
i386                  randconfig-006-20250116    clang-19
i386                  randconfig-007-20250116    clang-19
i386                  randconfig-011-20250116    gcc-12
i386                  randconfig-012-20250116    gcc-12
i386                  randconfig-013-20250116    gcc-12
i386                  randconfig-014-20250116    gcc-12
i386                  randconfig-015-20250116    gcc-12
i386                  randconfig-016-20250116    gcc-12
i386                  randconfig-017-20250116    gcc-12
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20250115    gcc-14.2.0
loongarch             randconfig-001-20250116    clang-20
loongarch             randconfig-002-20250115    gcc-14.2.0
loongarch             randconfig-002-20250116    clang-20
m68k                              allnoconfig    gcc-14.2.0
m68k                         apollo_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       rbtx49xx_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250115    gcc-14.2.0
nios2                 randconfig-001-20250116    clang-20
nios2                 randconfig-002-20250115    gcc-14.2.0
nios2                 randconfig-002-20250116    clang-20
openrisc                          allnoconfig    clang-20
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-20
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250115    gcc-14.2.0
parisc                randconfig-001-20250116    clang-20
parisc                randconfig-002-20250115    gcc-14.2.0
parisc                randconfig-002-20250116    clang-20
powerpc                           allnoconfig    clang-20
powerpc                 linkstation_defconfig    gcc-14.2.0
powerpc                      pcm030_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250115    gcc-14.2.0
powerpc               randconfig-001-20250116    clang-20
powerpc               randconfig-002-20250115    gcc-14.2.0
powerpc               randconfig-002-20250116    clang-20
powerpc               randconfig-003-20250115    gcc-14.2.0
powerpc               randconfig-003-20250116    clang-20
powerpc64             randconfig-001-20250115    gcc-14.2.0
powerpc64             randconfig-001-20250116    clang-20
powerpc64             randconfig-002-20250115    gcc-14.2.0
powerpc64             randconfig-002-20250116    clang-20
powerpc64             randconfig-003-20250115    clang-18
powerpc64             randconfig-003-20250116    clang-20
riscv                             allnoconfig    clang-20
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250115    gcc-14.2.0
riscv                 randconfig-001-20250116    gcc-14.2.0
riscv                 randconfig-002-20250115    clang-16
riscv                 randconfig-002-20250116    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250115    clang-20
s390                  randconfig-001-20250116    gcc-14.2.0
s390                  randconfig-002-20250115    clang-15
s390                  randconfig-002-20250116    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250115    gcc-14.2.0
sh                    randconfig-001-20250116    gcc-14.2.0
sh                    randconfig-002-20250115    gcc-14.2.0
sh                    randconfig-002-20250116    gcc-14.2.0
sh                          rsk7269_defconfig    gcc-14.2.0
sh                   sh7770_generic_defconfig    gcc-14.2.0
sparc                            alldefconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250115    gcc-14.2.0
sparc                 randconfig-001-20250116    gcc-14.2.0
sparc                 randconfig-002-20250115    gcc-14.2.0
sparc                 randconfig-002-20250116    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250115    gcc-14.2.0
sparc64               randconfig-001-20250116    gcc-14.2.0
sparc64               randconfig-002-20250115    gcc-14.2.0
sparc64               randconfig-002-20250116    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250115    clang-18
um                    randconfig-001-20250116    gcc-14.2.0
um                    randconfig-002-20250115    gcc-12
um                    randconfig-002-20250116    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250115    gcc-12
x86_64      buildonly-randconfig-001-20250116    gcc-12
x86_64      buildonly-randconfig-002-20250115    gcc-12
x86_64      buildonly-randconfig-002-20250116    gcc-12
x86_64      buildonly-randconfig-003-20250115    clang-19
x86_64      buildonly-randconfig-003-20250116    gcc-12
x86_64      buildonly-randconfig-004-20250115    clang-19
x86_64      buildonly-randconfig-004-20250116    gcc-12
x86_64      buildonly-randconfig-005-20250115    gcc-12
x86_64      buildonly-randconfig-005-20250116    gcc-12
x86_64      buildonly-randconfig-006-20250115    clang-19
x86_64      buildonly-randconfig-006-20250116    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250116    gcc-12
x86_64                randconfig-002-20250116    gcc-12
x86_64                randconfig-003-20250116    gcc-12
x86_64                randconfig-004-20250116    gcc-12
x86_64                randconfig-005-20250116    gcc-12
x86_64                randconfig-006-20250116    gcc-12
x86_64                randconfig-007-20250116    gcc-12
x86_64                randconfig-008-20250116    gcc-12
x86_64                randconfig-071-20250116    gcc-12
x86_64                randconfig-072-20250116    gcc-12
x86_64                randconfig-073-20250116    gcc-12
x86_64                randconfig-074-20250116    gcc-12
x86_64                randconfig-075-20250116    gcc-12
x86_64                randconfig-076-20250116    gcc-12
x86_64                randconfig-077-20250116    gcc-12
x86_64                randconfig-078-20250116    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250115    gcc-14.2.0
xtensa                randconfig-001-20250116    gcc-14.2.0
xtensa                randconfig-002-20250115    gcc-14.2.0
xtensa                randconfig-002-20250116    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

