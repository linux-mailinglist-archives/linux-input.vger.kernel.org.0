Return-Path: <linux-input+bounces-15192-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F55BB194A
	for <lists+linux-input@lfdr.de>; Wed, 01 Oct 2025 21:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 16F2B4E16A8
	for <lists+linux-input@lfdr.de>; Wed,  1 Oct 2025 19:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4BD270EC1;
	Wed,  1 Oct 2025 19:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5Zf1sSB"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF362D6E48
	for <linux-input@vger.kernel.org>; Wed,  1 Oct 2025 19:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759346322; cv=none; b=W8YIbdZnFaCKM7xL9wrWLMGA5iGyptdCkyjOjDtiKR/m8ogh3sLJFM1T3HhcKfIPg7L47b+sJ9cIKx5vsatBpMLHszVI+KuJdLLi4INDV91/ZAGw94/5xnKvOu0ivGZh/GApr6CX1yrL4rzS7mdyH60qtxNEdjbnyvWqxInSwlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759346322; c=relaxed/simple;
	bh=hrQwJbprhGO6+T7orKjy/cLB3usNB22i+IW7JEQh450=;
	h=Date:From:To:Cc:Subject:Message-ID; b=duDIAcjBi+hXB1CesCFVHCc4a1JLxLNpWTpyZ/eLmKSHlwq7e4kGV8XAOBgKauBPTgqTETUcdAdf4K9iMXm0YyU30IevS2cjacpcn5sgGTNCA9guwG5h7WXL3/t+0nOS6LY9OsL/AR+SKkwIfVX6x6XedGNPV9EnRiQd3t1Cnvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5Zf1sSB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759346320; x=1790882320;
  h=date:from:to:cc:subject:message-id;
  bh=hrQwJbprhGO6+T7orKjy/cLB3usNB22i+IW7JEQh450=;
  b=L5Zf1sSBYe1LeLaI1LJJX7O84jkScQRjwh6y7K16A10y6tW76u5Q3Lel
   DVHIkZU8F5QVfdeT5utKqS9Nw5mnw8vHmm7GtAhPKq6mL0KV6AYkaQ0JS
   LJ9d0qYZzb9DUkGHvdLnijdn8aVkE03yWM3sV+Rl8P332XLg4mDh4gJ+i
   aePceCvECByhep5EVNXa++2fxjzSJRjAYxb1ZYQzx93K65kHV4Z94m10T
   1cDRUmBMhwHQGMKQPa08vtm7alWUYMmcFt+N2mTwxP3ftwMi8c8MgNrCk
   Tec8vPBm5O82Ofc97u2yCOs7CJNO50LBs/hPBaVgdiA86uAYY2y+72VFX
   g==;
X-CSE-ConnectionGUID: niqP0yPBR9uCOWD3XGVedw==
X-CSE-MsgGUID: EjyTbuQoR5SXfdONVY8vZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="71878796"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; 
   d="scan'208";a="71878796"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 12:18:40 -0700
X-CSE-ConnectionGUID: fZz9n1lvT9ClyrPTfFt+og==
X-CSE-MsgGUID: 8pco9VJ/RsyWravx4mdxBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; 
   d="scan'208";a="209582421"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Oct 2025 12:18:39 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v42LU-0003JR-0D;
	Wed, 01 Oct 2025 19:18:36 +0000
Date: Thu, 02 Oct 2025 03:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 d655a684c24dde9e9f3f98f3dbae5a4f592117d4
Message-ID: <202510020321.7GIKeqUX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: d655a684c24dde9e9f3f98f3dbae5a4f592117d4  Input: aw86927 - fix error code in probe()

elapsed time: 1274m

configs tested: 130
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                         haps_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20251001    gcc-8.5.0
arc                   randconfig-002-20251001    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                         orion5x_defconfig    clang-22
arm                   randconfig-001-20251001    gcc-14.3.0
arm                   randconfig-002-20251001    clang-22
arm                   randconfig-003-20251001    gcc-12.5.0
arm                   randconfig-004-20251001    gcc-8.5.0
arm                           sama5_defconfig    gcc-15.1.0
arm                           stm32_defconfig    gcc-15.1.0
arm64                            alldefconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251001    clang-22
arm64                 randconfig-002-20251001    gcc-9.5.0
arm64                 randconfig-003-20251001    gcc-8.5.0
arm64                 randconfig-004-20251001    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251001    gcc-13.4.0
csky                  randconfig-002-20251001    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251001    clang-22
hexagon               randconfig-002-20251001    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251001    clang-20
i386        buildonly-randconfig-002-20251001    clang-20
i386        buildonly-randconfig-003-20251001    gcc-14
i386        buildonly-randconfig-004-20251001    clang-20
i386        buildonly-randconfig-005-20251001    clang-20
i386        buildonly-randconfig-006-20251001    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251001    gcc-13.4.0
loongarch             randconfig-002-20251001    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip32_defconfig    clang-22
mips                        omega2p_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251001    gcc-11.5.0
nios2                 randconfig-002-20251001    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251001    gcc-8.5.0
parisc                randconfig-002-20251001    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20251001    gcc-8.5.0
powerpc               randconfig-002-20251001    clang-22
powerpc               randconfig-003-20251001    clang-22
powerpc64             randconfig-001-20251001    gcc-8.5.0
powerpc64             randconfig-002-20251001    clang-22
powerpc64             randconfig-003-20251001    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251001    clang-22
riscv                 randconfig-002-20251001    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251001    clang-22
s390                  randconfig-002-20251001    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20251001    gcc-13.4.0
sh                    randconfig-002-20251001    gcc-11.5.0
sh                   rts7751r2dplus_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251001    gcc-15.1.0
sparc                 randconfig-002-20251001    gcc-8.5.0
sparc                       sparc64_defconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251001    gcc-8.5.0
sparc64               randconfig-002-20251001    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251001    gcc-14
um                    randconfig-002-20251001    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251001    clang-20
x86_64      buildonly-randconfig-002-20251001    clang-20
x86_64      buildonly-randconfig-003-20251001    clang-20
x86_64      buildonly-randconfig-004-20251001    clang-20
x86_64      buildonly-randconfig-005-20251001    clang-20
x86_64      buildonly-randconfig-006-20251001    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251001    gcc-15.1.0
xtensa                randconfig-002-20251001    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

