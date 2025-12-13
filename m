Return-Path: <linux-input+bounces-16558-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22966CBA7D6
	for <lists+linux-input@lfdr.de>; Sat, 13 Dec 2025 10:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8486030C27D3
	for <lists+linux-input@lfdr.de>; Sat, 13 Dec 2025 09:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36FD2EA490;
	Sat, 13 Dec 2025 09:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQ/oLoJ/"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC33D2EA151
	for <linux-input@vger.kernel.org>; Sat, 13 Dec 2025 09:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765619550; cv=none; b=fAr4A2bsCyUri5AXJEyZPTBrjnVABa11e6s+zRbRziRN1hrUrz+6ByqyPZm5gV9FePBX/oX7WEK+Wpo3E8fwzVOBbCETO+/lR6oUk32AsxPb7890m1XydxqBVx5FkqPpqJ5WSBy9yNQH7ywqRZzK9kNh6mPio3/q69T/CigKaJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765619550; c=relaxed/simple;
	bh=tU6qeEO8xilq3+h0ZLckJ3XGzU20b9E2X8ZR1sxEBJk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kD3YsO/TgVjx0QwBZuMrWaOUNM/odwm1X4DVTazioKSH5xAg3i+5n65qK0C3s60wE0HHQdgfB40j8K7w3n5wOv2jnd6/hz0OvemQLEFZ/jOSgPZAgFP/Ief2qrqMyFYlj6C1fJ4IeHstagZ6Ov4vPy6f1FXPDBq41vH0F68GLkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQ/oLoJ/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765619549; x=1797155549;
  h=date:from:to:cc:subject:message-id;
  bh=tU6qeEO8xilq3+h0ZLckJ3XGzU20b9E2X8ZR1sxEBJk=;
  b=KQ/oLoJ/NDct1sHfvWE/cRbLXRZ/W1F4ln8lJpXQgWSK5Odb62n4X14R
   7XCQgaLKR+2fKnitC4dUMRj9GsW2VEYYST6NVjfFP0Hu48Xk3ZP09XWg6
   fP4ybbod3XbVPfj71Qvz62gb/J1CPWbSe12bZsey4i7piQ33Do8VPQVQH
   imp76OtgUDzadjKYNeN5NHQOzLuK6DBvniBJbTun4Xhyz6XjgdalRgx6S
   ClPqZJSrVtQeyvID46Xvl8Iqz5m23a9rYFVUBqv1xWVJdSLto07GHts4C
   oa9m/DBy22Mk+zdXxTisKhEI/0GYNIrbU37Au1jU7P70L63QglOz17Hf7
   g==;
X-CSE-ConnectionGUID: C8obpSHiTme+Ng2Klj0O/g==
X-CSE-MsgGUID: Vxk3JpHbR1uygN1C3uqfqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="90257150"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="90257150"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 01:52:28 -0800
X-CSE-ConnectionGUID: ZW5ode1ST1egMzp4oHzCtQ==
X-CSE-MsgGUID: ptE+cc6qSIuUFR//xFblvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196573968"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 01:52:27 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUMIb-000000007Sg-1epY;
	Sat, 13 Dec 2025 09:52:25 +0000
Date: Sat, 13 Dec 2025 17:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 e58c88f0cb2d8ed89de78f6f17409d29cfab6c5c
Message-ID: <202512131731.MWnGiMjN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: e58c88f0cb2d8ed89de78f6f17409d29cfab6c5c  Input: lkkbd - disable pending work before freeing device

elapsed time: 1453m

configs tested: 139
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251213    gcc-15.1.0
arc                   randconfig-002-20251213    gcc-15.1.0
arc                           tb10x_defconfig    gcc-15.1.0
arm                              allyesconfig    gcc-15.1.0
arm                         at91_dt_defconfig    clang-22
arm                         bcm2835_defconfig    clang-22
arm                                 defconfig    clang-22
arm                   randconfig-001-20251213    clang-20
arm                   randconfig-002-20251213    gcc-8.5.0
arm                   randconfig-003-20251213    clang-22
arm                   randconfig-004-20251213    clang-22
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251213    clang-22
arm64                 randconfig-002-20251213    clang-22
arm64                 randconfig-003-20251213    clang-22
arm64                 randconfig-004-20251213    clang-20
csky                             allmodconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251213    gcc-15.1.0
csky                  randconfig-002-20251213    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251212    clang-22
hexagon               randconfig-002-20251212    clang-22
i386                             allmodconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251213    clang-20
i386        buildonly-randconfig-002-20251213    gcc-14
i386        buildonly-randconfig-003-20251213    gcc-14
i386        buildonly-randconfig-004-20251213    clang-20
i386        buildonly-randconfig-005-20251213    clang-20
i386        buildonly-randconfig-006-20251213    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251213    clang-20
i386                  randconfig-002-20251213    gcc-14
i386                  randconfig-003-20251213    gcc-13
i386                  randconfig-004-20251213    clang-20
i386                  randconfig-005-20251213    clang-20
i386                  randconfig-006-20251213    gcc-14
i386                  randconfig-007-20251213    gcc-14
i386                  randconfig-011-20251213    gcc-14
i386                  randconfig-012-20251213    gcc-14
i386                  randconfig-013-20251213    clang-20
i386                  randconfig-014-20251213    gcc-14
i386                  randconfig-015-20251213    gcc-14
i386                  randconfig-016-20251213    gcc-14
i386                  randconfig-017-20251213    clang-20
loongarch                           defconfig    clang-19
loongarch                 loongson3_defconfig    clang-22
loongarch             randconfig-001-20251212    clang-22
loongarch             randconfig-002-20251212    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                           ci20_defconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251212    gcc-11.5.0
nios2                 randconfig-002-20251212    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                 simple_smp_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251213    gcc-8.5.0
parisc                randconfig-002-20251213    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251213    clang-18
powerpc               randconfig-002-20251213    clang-22
powerpc64             randconfig-001-20251213    clang-16
powerpc64             randconfig-002-20251213    clang-16
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251213    clang-16
riscv                 randconfig-002-20251213    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251213    gcc-13.4.0
s390                  randconfig-002-20251213    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251213    gcc-15.1.0
sh                    randconfig-002-20251213    gcc-10.5.0
sh                        sh7757lcr_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251213    gcc-14
x86_64                randconfig-002-20251213    gcc-14
x86_64                randconfig-003-20251213    gcc-14
x86_64                randconfig-004-20251213    clang-20
x86_64                randconfig-005-20251213    gcc-14
x86_64                randconfig-006-20251213    clang-20
x86_64                randconfig-011-20251213    gcc-14
x86_64                randconfig-012-20251213    gcc-14
x86_64                randconfig-013-20251213    clang-20
x86_64                randconfig-014-20251213    clang-20
x86_64                randconfig-015-20251213    gcc-14
x86_64                randconfig-016-20251213    clang-20
x86_64                randconfig-071-20251213    clang-20
x86_64                randconfig-072-20251213    clang-20
x86_64                randconfig-073-20251213    clang-20
x86_64                randconfig-074-20251213    gcc-13
x86_64                randconfig-075-20251213    clang-20
x86_64                randconfig-076-20251213    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

