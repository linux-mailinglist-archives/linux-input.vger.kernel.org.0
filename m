Return-Path: <linux-input+bounces-16215-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 57259C6DD33
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 10:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4CA7834E36E
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 09:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0EC33555D;
	Wed, 19 Nov 2025 09:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uqg80en0"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4473030504D
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 09:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763545830; cv=none; b=n3mw5WOpOpJyVmFlBb6omMvvWnny7BzHxWq/D57W9Y3ORA4Jt32VoOwdCR0Sq7JEsTOs6y0vvHD/SGsZriAAE/Xk8LxKvdoF1KJBK+9/636lWJnx77KCNpUSQhfZZA/C1pi6vyl7jLWwsm3x+AKCjxOEwUqSEwMpA1hhVrde2po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763545830; c=relaxed/simple;
	bh=MI3QirTR7xe6VA9PxxAtPZKEAyFHXqy6snMFXLxsPxc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o5ymt7EZnSuEAM5D8QV5YKnpzvoxWrRJKSR/cTPOK11TT3s14YuhhIkmuw6gfVrVtm+rbzDP4GrPboyk098zXZbIXzqDcgSvjMZkl3GJ9Qr1Jvj8+qRrbTDJa+33+HdwG5A1omBP/XZ2fLJlQTBlRlFm9hkCmySzjyS6Q0JqYiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uqg80en0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763545828; x=1795081828;
  h=date:from:to:cc:subject:message-id;
  bh=MI3QirTR7xe6VA9PxxAtPZKEAyFHXqy6snMFXLxsPxc=;
  b=Uqg80en0HbZR4z1PeK/ygdTyST8a+t+wvbiMJxQcjWSUdt0GdQJFYO9C
   7Ej0QA56+1lcRCouHVCqxIZFKLAP42RMrEHANVAhSJHYgPEYEFrP2/qUL
   gGTz9mqpEdNfJMFcy+zXUcKEAiDx+rCpoKx+0tlWUM8S7HDzDoXRSeK/x
   d1ppJkIBK/AcAPYOIbIEP38fRzObw6w5MykIMqgLoTDyDofD6/NPfdSqt
   ER05E5YxXS/3L7FMXlyif2lQGoQUrrE1y56xwb5MIXp+o/7L6M7xzFgc4
   Y8PdBj9HSS1qC1sNXiIxNQONNt2VK2Uoo4q4Sq3MtqQoRA/ia/4EMHBy9
   g==;
X-CSE-ConnectionGUID: 9eEKLSmEQOG6v6R5aXnyUg==
X-CSE-MsgGUID: nA2MIcS1TTGIaNKawcBWog==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="69433359"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="69433359"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 01:50:28 -0800
X-CSE-ConnectionGUID: F51VqanERIWvfZhR0VLz6w==
X-CSE-MsgGUID: cIDa8HonRUmb7yUpbpLlIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190806580"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Nov 2025 01:50:27 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLepU-0002gN-2G;
	Wed, 19 Nov 2025 09:50:24 +0000
Date: Wed, 19 Nov 2025 17:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 ae8966b7b5bd69b86209cc34bcca1ba9f18b68e6
Message-ID: <202511191704.WPjmof18-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: ae8966b7b5bd69b86209cc34bcca1ba9f18b68e6  Input: rename INPUT_PROP_HAPTIC_TOUCHPAD to INPUT_PROP_PRESSUREPAD

elapsed time: 1546m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.1.0
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                         haps_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20251118    gcc-14.3.0
arc                   randconfig-002-20251118    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                          moxart_defconfig    gcc-15.1.0
arm                   randconfig-001-20251118    gcc-8.5.0
arm                   randconfig-002-20251118    gcc-10.5.0
arm                   randconfig-003-20251118    clang-22
arm                   randconfig-004-20251118    clang-22
arm                        realview_defconfig    clang-16
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251119    clang-22
arm64                 randconfig-002-20251119    gcc-8.5.0
arm64                 randconfig-003-20251119    clang-22
arm64                 randconfig-004-20251119    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251119    gcc-15.1.0
csky                  randconfig-002-20251119    gcc-10.5.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251119    clang-22
hexagon               randconfig-002-20251119    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251119    gcc-14
i386        buildonly-randconfig-002-20251119    clang-20
i386        buildonly-randconfig-003-20251119    clang-20
i386        buildonly-randconfig-004-20251119    clang-20
i386        buildonly-randconfig-005-20251119    gcc-14
i386        buildonly-randconfig-006-20251119    gcc-14
i386                  randconfig-007-20251119    gcc-14
i386                  randconfig-011-20251119    clang-20
i386                  randconfig-012-20251119    clang-20
i386                  randconfig-013-20251119    clang-20
i386                  randconfig-014-20251119    gcc-14
i386                  randconfig-015-20251119    gcc-14
i386                  randconfig-016-20251119    clang-20
i386                  randconfig-017-20251119    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251119    clang-22
loongarch             randconfig-002-20251119    gcc-14.3.0
m68k                              allnoconfig    gcc-15.1.0
m68k                         apollo_defconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251119    gcc-11.5.0
nios2                 randconfig-002-20251119    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251119    gcc-8.5.0
parisc                randconfig-002-20251119    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                    amigaone_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251119    clang-16
powerpc               randconfig-002-20251119    clang-22
powerpc64             randconfig-001-20251119    clang-19
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251119    gcc-15.1.0
riscv                 randconfig-002-20251119    gcc-10.5.0
s390                              allnoconfig    clang-22
s390                          debug_defconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251119    gcc-8.5.0
s390                  randconfig-002-20251119    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251119    gcc-11.5.0
sh                    randconfig-002-20251119    gcc-9.5.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251119    gcc-15.1.0
sparc                 randconfig-002-20251119    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251119    gcc-15.1.0
sparc64               randconfig-002-20251119    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251119    clang-16
um                    randconfig-002-20251119    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251119    gcc-14
x86_64      buildonly-randconfig-002-20251119    gcc-14
x86_64      buildonly-randconfig-003-20251119    clang-20
x86_64      buildonly-randconfig-004-20251119    clang-20
x86_64      buildonly-randconfig-005-20251119    gcc-14
x86_64      buildonly-randconfig-006-20251119    gcc-12
x86_64                              defconfig    gcc-14
x86_64                randconfig-071-20251119    gcc-14
x86_64                randconfig-072-20251119    clang-20
x86_64                randconfig-073-20251119    gcc-12
x86_64                randconfig-074-20251119    clang-20
x86_64                randconfig-075-20251119    clang-20
x86_64                randconfig-076-20251119    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251119    gcc-8.5.0
xtensa                randconfig-002-20251119    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

