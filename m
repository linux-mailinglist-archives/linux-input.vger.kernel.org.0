Return-Path: <linux-input+bounces-13157-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BA0AECAB6
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 00:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9D281889C5F
	for <lists+linux-input@lfdr.de>; Sat, 28 Jun 2025 22:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CDD278F4B;
	Sat, 28 Jun 2025 22:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UyQaBxfp"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38BA2F1FD0
	for <linux-input@vger.kernel.org>; Sat, 28 Jun 2025 22:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751150599; cv=none; b=Sx2/Sp7NJuLWhweFCTa0n6iCWsyh9sp/c242ttmmGf/eknPsHOhEcp9VhJsYgLBNrKVWifJUXukAb02UAHiqAyo9qbdztOn5QEm0oRIdbwKF7i5SQqQrQUQkTfO//KxXWnwS555H4gkoI95bBgoJ1KfWFdHw1E8j+jgc17FljaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751150599; c=relaxed/simple;
	bh=lpoYsWAWRg2dp+iq3fFjoP+LbOtuUKEheyqURgCHO5k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PLJgILaLPXDcIwkrCKp/ZVxeGySsh3x6rXkAGwAqLR80OR9SXUg/BzxW7//1bdWpl/YIm+GRdyF82Y02glpvSclDU6uaG48fZYuQmT4C0Tkn+5DJIT8DAVi+FG/AbRMDmdZ0nCvfAkV+YYD8zrmvwqHiukYY4QYyGAdo0ik+cHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UyQaBxfp; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751150597; x=1782686597;
  h=date:from:to:cc:subject:message-id;
  bh=lpoYsWAWRg2dp+iq3fFjoP+LbOtuUKEheyqURgCHO5k=;
  b=UyQaBxfpxhdw13YC0rmXwHIlof/eHrb62qe2yIgGvhjqF5sG1XcYQSqH
   i0m/FQmeDMSBifQ0nIsoOoEbV5MUL2N36F4FGPbhHI+o5hrlLox462fYm
   a7zCoPGZ+Sywb30D5TQotyHRFXS+eL8IBYlu+uEoQXRowFN71n+G8XgLT
   KWntNq1wnaJOvD7u1UI+P0ndWpEuByfScIkb8Bkq2KX7ex8g+X1Kv5Qa4
   Btq3VYBXiSVWjXlCqfW+XSXTz7WogJ79o7M9imJ8HQtzdt/3nV/KKgkKv
   nFxYhij4eczpGnIqWTu1xL0lajhwF6FMudal71/kp6/x+1bZWY0mBH/Xz
   Q==;
X-CSE-ConnectionGUID: M6fCjwKGRle3GoxCOVRYWw==
X-CSE-MsgGUID: MotFpBqzSWWAo4EjN2EPjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="52539063"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="52539063"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 15:43:16 -0700
X-CSE-ConnectionGUID: QXEato8PQRiuuAIJ/Q3KNQ==
X-CSE-MsgGUID: xiqaybFzTky2COTnG4badg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="158602537"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jun 2025 15:43:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVeGP-000XRy-0s;
	Sat, 28 Jun 2025 22:43:13 +0000
Date: Sun, 29 Jun 2025 06:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 43a8440f396951eaae85db478b30a53aea8cda7d
Message-ID: <202506290620.br8tuGtp-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 43a8440f396951eaae85db478b30a53aea8cda7d  Input: adp5589 - use new GPIO line value setter callbacks

elapsed time: 1214m

configs tested: 241
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                         haps_hs_defconfig    gcc-15.1.0
arc                        nsim_700_defconfig    gcc-15.1.0
arc                   randconfig-001-20250628    gcc-15.1.0
arc                   randconfig-001-20250629    gcc-12.4.0
arc                   randconfig-002-20250628    gcc-15.1.0
arc                   randconfig-002-20250629    gcc-12.4.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                     davinci_all_defconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                          pxa3xx_defconfig    gcc-15.1.0
arm                   randconfig-001-20250628    gcc-12.4.0
arm                   randconfig-001-20250629    gcc-12.4.0
arm                   randconfig-002-20250628    clang-21
arm                   randconfig-002-20250629    gcc-12.4.0
arm                   randconfig-003-20250628    clang-17
arm                   randconfig-003-20250629    gcc-12.4.0
arm                   randconfig-004-20250628    clang-17
arm                   randconfig-004-20250629    gcc-12.4.0
arm                         s5pv210_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250628    gcc-14.3.0
arm64                 randconfig-001-20250629    gcc-12.4.0
arm64                 randconfig-002-20250628    clang-21
arm64                 randconfig-002-20250629    gcc-12.4.0
arm64                 randconfig-003-20250628    clang-21
arm64                 randconfig-003-20250629    gcc-12.4.0
arm64                 randconfig-004-20250628    clang-17
arm64                 randconfig-004-20250629    gcc-12.4.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250628    gcc-14.3.0
csky                  randconfig-001-20250629    clang-21
csky                  randconfig-002-20250628    gcc-14.3.0
csky                  randconfig-002-20250629    clang-21
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250628    clang-21
hexagon               randconfig-001-20250629    clang-21
hexagon               randconfig-002-20250628    clang-21
hexagon               randconfig-002-20250629    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250628    clang-20
i386        buildonly-randconfig-002-20250628    clang-20
i386        buildonly-randconfig-003-20250628    gcc-12
i386        buildonly-randconfig-004-20250628    clang-20
i386        buildonly-randconfig-005-20250628    clang-20
i386        buildonly-randconfig-006-20250628    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-011-20250629    gcc-11
i386                  randconfig-012-20250629    gcc-11
i386                  randconfig-013-20250629    gcc-11
i386                  randconfig-014-20250629    gcc-11
i386                  randconfig-015-20250629    gcc-11
i386                  randconfig-016-20250629    gcc-11
i386                  randconfig-017-20250629    gcc-11
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch                 loongson3_defconfig    gcc-15.1.0
loongarch             randconfig-001-20250628    gcc-12.4.0
loongarch             randconfig-001-20250629    clang-21
loongarch             randconfig-002-20250628    gcc-15.1.0
loongarch             randconfig-002-20250629    clang-21
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                          sun3x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
mips                     cu1830-neo_defconfig    gcc-15.1.0
mips                           mtx1_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250628    gcc-7.5.0
nios2                 randconfig-001-20250629    clang-21
nios2                 randconfig-002-20250628    gcc-9.3.0
nios2                 randconfig-002-20250629    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           alldefconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250628    gcc-5.5.0
parisc                randconfig-001-20250629    clang-21
parisc                randconfig-002-20250628    gcc-12.4.0
parisc                randconfig-002-20250629    clang-21
parisc64                            defconfig    gcc-15.1.0
powerpc                    adder875_defconfig    gcc-15.1.0
powerpc                     akebono_defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc                      ppc6xx_defconfig    gcc-15.1.0
powerpc                         ps3_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250628    gcc-5.5.0
powerpc               randconfig-001-20250629    clang-21
powerpc               randconfig-002-20250628    clang-19
powerpc               randconfig-002-20250629    clang-21
powerpc               randconfig-003-20250628    clang-21
powerpc               randconfig-003-20250629    clang-21
powerpc                     redwood_defconfig    gcc-15.1.0
powerpc                     tqm8555_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250628    clang-20
powerpc64             randconfig-001-20250629    clang-21
powerpc64             randconfig-002-20250628    gcc-7.5.0
powerpc64             randconfig-002-20250629    clang-21
powerpc64             randconfig-003-20250628    gcc-6.5.0
powerpc64             randconfig-003-20250629    clang-21
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250628    clang-21
riscv                 randconfig-001-20250629    gcc-8.5.0
riscv                 randconfig-002-20250628    clang-16
riscv                 randconfig-002-20250629    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250628    clang-21
s390                  randconfig-001-20250629    gcc-8.5.0
s390                  randconfig-002-20250628    gcc-11.5.0
s390                  randconfig-002-20250629    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250628    gcc-6.5.0
sh                    randconfig-001-20250629    gcc-8.5.0
sh                    randconfig-002-20250628    gcc-9.3.0
sh                    randconfig-002-20250629    gcc-8.5.0
sh                          rsk7269_defconfig    gcc-15.1.0
sh                      rts7751r2d1_defconfig    gcc-15.1.0
sh                           se7206_defconfig    gcc-15.1.0
sh                        sh7757lcr_defconfig    gcc-15.1.0
sh                        sh7763rdp_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250628    gcc-7.5.0
sparc                 randconfig-001-20250629    gcc-8.5.0
sparc                 randconfig-002-20250628    gcc-12.4.0
sparc                 randconfig-002-20250629    gcc-8.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250628    gcc-6.5.0
sparc64               randconfig-001-20250629    gcc-8.5.0
sparc64               randconfig-002-20250628    gcc-6.5.0
sparc64               randconfig-002-20250629    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250628    gcc-12
um                    randconfig-001-20250629    gcc-8.5.0
um                    randconfig-002-20250628    clang-20
um                    randconfig-002-20250629    gcc-8.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250628    gcc-12
x86_64      buildonly-randconfig-002-20250628    clang-20
x86_64      buildonly-randconfig-003-20250628    gcc-12
x86_64      buildonly-randconfig-004-20250628    clang-20
x86_64      buildonly-randconfig-005-20250628    clang-20
x86_64      buildonly-randconfig-006-20250628    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250629    clang-20
x86_64                randconfig-002-20250629    clang-20
x86_64                randconfig-003-20250629    clang-20
x86_64                randconfig-004-20250629    clang-20
x86_64                randconfig-005-20250629    clang-20
x86_64                randconfig-006-20250629    clang-20
x86_64                randconfig-007-20250629    clang-20
x86_64                randconfig-008-20250629    clang-20
x86_64                randconfig-071-20250629    clang-20
x86_64                randconfig-072-20250629    clang-20
x86_64                randconfig-073-20250629    clang-20
x86_64                randconfig-074-20250629    clang-20
x86_64                randconfig-075-20250629    clang-20
x86_64                randconfig-076-20250629    clang-20
x86_64                randconfig-077-20250629    clang-20
x86_64                randconfig-078-20250629    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250628    gcc-11.5.0
xtensa                randconfig-001-20250629    gcc-8.5.0
xtensa                randconfig-002-20250628    gcc-10.5.0
xtensa                randconfig-002-20250629    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

