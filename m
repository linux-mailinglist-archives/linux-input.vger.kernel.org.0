Return-Path: <linux-input+bounces-7602-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8F99A9501
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 02:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C4411C2144F
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 00:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F139A81E;
	Tue, 22 Oct 2024 00:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvYuG6Z5"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977742233B
	for <linux-input@vger.kernel.org>; Tue, 22 Oct 2024 00:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729557243; cv=none; b=IYIZyWVhZyZQ+9XnstRK44GcEr1kuKKwt5KHo6JABeEzMYsYc/3JukG7AsjHVQniVM8VO/p7fluCioLuth9obO4K3eB3wGWWbrMddAh0NaML+u3NOCqYZxulxXyDJR0lGApTIuc+GYZyG+PWZfkerg0dDsQxCUxXnR8Hdj2dq+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729557243; c=relaxed/simple;
	bh=bHNLY43M/5PWSunosIX18Q4TLUO3WpBXMMTSb9IceVY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qIVK62zpPV8tKP8Wx25jcGkaviQ4dKOUjlXOds+F47b/eEjki+KSiPx0zeN20sMR5RL7TE4i72c/8Usjj9CO4I7CmVpY4mhDdueFTJlX+yakpHcmgLiIE6qlp5+tugHi9aBhM4+ogaotGyqv0URskZuTk8M68RdttFExf/sOy9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvYuG6Z5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729557241; x=1761093241;
  h=date:from:to:cc:subject:message-id;
  bh=bHNLY43M/5PWSunosIX18Q4TLUO3WpBXMMTSb9IceVY=;
  b=hvYuG6Z5DXY3axK9ONVDFr3Rz10h6qYZxXBWjEykStNToXwKzd2xV5KG
   lx8o10gQdKI6ZZP7M/Lz78KXfxnLnRrw6/0hCwAjStVZCSkw49YgLLqlE
   0kBDRc5qy4GLlDB8XaqVL+nWM+XJ/FgbOtEkmZS+XQWt0DGZGripOOm6b
   BWeJcfLZX/Eo+wT0j551aCKxTyOHxwJ/8X3rkQcbtf+b1AzZ34Fu6EfOe
   Ul0i9SiO8NyR/hhGAH6Xp9va+OhyUUmj17avj52t7RWFWrnXMSdu6zqM6
   0vkyRvjRNbtfAsV14LeyPfM+Az0kVb/2TIS+thA4r6poKgvOeLzhPO0ER
   w==;
X-CSE-ConnectionGUID: I5UzUj3QQZCS40pfg70lrA==
X-CSE-MsgGUID: kdkagKb5Tk+I0VBt3SRWlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28945841"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28945841"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 17:34:01 -0700
X-CSE-ConnectionGUID: bmX6aMXGTB6S8ymbfO2Exw==
X-CSE-MsgGUID: dUY66iz9RRy9yyBNzqJLLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="79324147"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Oct 2024 17:34:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t32qT-000Sp2-2S;
	Tue, 22 Oct 2024 00:33:57 +0000
Date: Tue, 22 Oct 2024 08:33:30 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 d0c3a7aa814c091843ccca467c02078db9da4e1e
Message-ID: <202410220822.kBwAgpCP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: d0c3a7aa814c091843ccca467c02078db9da4e1e  Input: serio_raw - fix uninitialized variable bug

elapsed time: 990m

configs tested: 165
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                      axs103_smp_defconfig    gcc-14.1.0
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241021    gcc-14.1.0
arc                   randconfig-002-20241021    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                        clps711x_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                             mxs_defconfig    gcc-14.1.0
arm                       omap2plus_defconfig    gcc-14.1.0
arm                   randconfig-001-20241021    gcc-14.1.0
arm                   randconfig-002-20241021    gcc-14.1.0
arm                   randconfig-003-20241021    gcc-14.1.0
arm                   randconfig-004-20241021    gcc-14.1.0
arm                             rpc_defconfig    gcc-14.1.0
arm                         socfpga_defconfig    gcc-14.1.0
arm                       versatile_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241021    gcc-14.1.0
arm64                 randconfig-002-20241021    gcc-14.1.0
arm64                 randconfig-003-20241021    gcc-14.1.0
arm64                 randconfig-004-20241021    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241021    gcc-14.1.0
csky                  randconfig-002-20241021    gcc-14.1.0
hexagon                          alldefconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241021    gcc-14.1.0
hexagon               randconfig-002-20241021    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241021    clang-18
i386        buildonly-randconfig-002-20241021    clang-18
i386        buildonly-randconfig-003-20241021    clang-18
i386        buildonly-randconfig-004-20241021    clang-18
i386        buildonly-randconfig-005-20241021    clang-18
i386        buildonly-randconfig-006-20241021    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241021    clang-18
i386                  randconfig-002-20241021    clang-18
i386                  randconfig-003-20241021    clang-18
i386                  randconfig-004-20241021    clang-18
i386                  randconfig-005-20241021    clang-18
i386                  randconfig-006-20241021    clang-18
i386                  randconfig-011-20241021    clang-18
i386                  randconfig-012-20241021    clang-18
i386                  randconfig-013-20241021    clang-18
i386                  randconfig-014-20241021    clang-18
i386                  randconfig-015-20241021    clang-18
i386                  randconfig-016-20241021    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241021    gcc-14.1.0
loongarch             randconfig-002-20241021    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        m5307c3_defconfig    gcc-14.1.0
m68k                       m5475evb_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm47xx_defconfig    gcc-14.1.0
mips                        bcm63xx_defconfig    gcc-14.1.0
mips                          eyeq6_defconfig    gcc-14.1.0
mips                     loongson1b_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241021    gcc-14.1.0
nios2                 randconfig-002-20241021    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241021    gcc-14.1.0
parisc                randconfig-002-20241021    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                       maple_defconfig    gcc-14.1.0
powerpc                     mpc512x_defconfig    gcc-14.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.1.0
powerpc                       ppc64_defconfig    gcc-14.1.0
powerpc                      ppc64e_defconfig    gcc-14.1.0
powerpc                         ps3_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241021    gcc-14.1.0
powerpc               randconfig-002-20241021    gcc-14.1.0
powerpc               randconfig-003-20241021    gcc-14.1.0
powerpc                     tqm5200_defconfig    gcc-14.1.0
powerpc                     tqm8548_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241021    gcc-14.1.0
powerpc64             randconfig-002-20241021    gcc-14.1.0
powerpc64             randconfig-003-20241021    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241021    gcc-14.1.0
riscv                 randconfig-002-20241021    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241021    gcc-14.1.0
s390                  randconfig-002-20241021    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                        apsh4ad0a_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                        edosk7705_defconfig    gcc-14.1.0
sh                          landisk_defconfig    gcc-14.1.0
sh                    randconfig-001-20241021    gcc-14.1.0
sh                    randconfig-002-20241021    gcc-14.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-14.1.0
sh                             shx3_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241021    gcc-14.1.0
sparc64               randconfig-002-20241021    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241021    gcc-14.1.0
um                    randconfig-002-20241021    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                    rhel-8.3-kselftests    gcc-12
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241021    gcc-14.1.0
xtensa                randconfig-002-20241021    gcc-14.1.0
xtensa                    smp_lx200_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

