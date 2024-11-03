Return-Path: <linux-input+bounces-7844-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F499BA757
	for <lists+linux-input@lfdr.de>; Sun,  3 Nov 2024 19:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CE7F1F21535
	for <lists+linux-input@lfdr.de>; Sun,  3 Nov 2024 18:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2075C7083B;
	Sun,  3 Nov 2024 18:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQfhVYkQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09221369A8
	for <linux-input@vger.kernel.org>; Sun,  3 Nov 2024 18:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730657564; cv=none; b=RRr6kdOhtWykIifGDQsCWTMNS/AycazcbY64gzfE5fZ/7i0Zq19hpB2D1Ymihvm7HrkTrsJAtB8C4/YRmAe9IWe4uNfUv8ZBmvO6jAzsaGCY4XDaro/b0hLpda8+yVvwFNteyI6Gws5VMmss8nlMPIc4k1evLe13yZhQ/HIrmKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730657564; c=relaxed/simple;
	bh=E6DcEQB2Qcr74FkEXz28ijWZidI/3WAaf1r/o5Bt9Mw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mf/nD6ItJjIovdG/snyrZM1HBTTM/BOwlXI6T4t/MmhUL1svLH0kNxZAlTh48IDEZr7pGBLNLxIRDzgVi6z5Us4msR11ADNznK4+ACdjtwGruYhgUUcvzSRKWSOVTvlAWnlVZtLLCYuFE6z7VyddctVpbGPoMXFlfk1JcwCmlGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQfhVYkQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730657562; x=1762193562;
  h=date:from:to:cc:subject:message-id;
  bh=E6DcEQB2Qcr74FkEXz28ijWZidI/3WAaf1r/o5Bt9Mw=;
  b=AQfhVYkQZ0qG/LvzAIp8YshthFomsEkft7LDwe5pAY+6wk3IOvnytwMW
   601BmwjhwcV9CPE0HJT9A5C01fp/24pcAarZT1Wr+TZYTToIytaDbjNFZ
   fYBcGmqI6BP7USzn5JIyNBT9dv8Cev6eOd4W7KGA1pKm1Yt182rudjEIL
   gcR8IAJb1mNvM271DA8ONyJkicocASGekrWCq9oNcmNufZ5hZR6gQDr33
   0KDzGlCYJRtOGdGvfz/3MRRlXWaynGBBIeMsd3XUg3lhEXFxlJZUJZwUy
   mvUqF1tWjtYVSnfvp9eUbUA7Js4F/kfBFmxC+ewlePWm3+SNeVsUX33gR
   w==;
X-CSE-ConnectionGUID: JMthgh1gQ6aLxL4psy988w==
X-CSE-MsgGUID: kRoCmi0RS/GPGRHAfjk7yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30132472"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30132472"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 10:12:39 -0800
X-CSE-ConnectionGUID: ou9iMO/pSdm9SYf2gIB1aA==
X-CSE-MsgGUID: 2ClNiJ8cREK81nVE8KmL8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="84266972"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Nov 2024 10:12:37 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7f5W-000k7e-2g;
	Sun, 03 Nov 2024 18:12:34 +0000
Date: Mon, 04 Nov 2024 02:12:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 e1325e19d2256c4724fb465c547333af424e5de5
Message-ID: <202411040201.EkNyf397-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: e1325e19d2256c4724fb465c547333af424e5de5  Input: omap-keypad - use guard notation when acquiring mutex

elapsed time: 734m

configs tested: 179
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              alldefconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                      axs103_smp_defconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241103    gcc-14.1.0
arc                   randconfig-002-20241103    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                         assabet_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                          pxa168_defconfig    gcc-13.2.0
arm                          pxa3xx_defconfig    gcc-14.1.0
arm                   randconfig-001-20241103    gcc-14.1.0
arm                   randconfig-002-20241103    gcc-14.1.0
arm                   randconfig-003-20241103    gcc-14.1.0
arm                   randconfig-004-20241103    gcc-14.1.0
arm                           sama5_defconfig    gcc-13.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241103    gcc-14.1.0
arm64                 randconfig-002-20241103    gcc-14.1.0
arm64                 randconfig-003-20241103    gcc-14.1.0
arm64                 randconfig-004-20241103    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241103    gcc-14.1.0
csky                  randconfig-002-20241103    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241103    gcc-14.1.0
hexagon               randconfig-002-20241103    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241103    clang-19
i386        buildonly-randconfig-002-20241103    clang-19
i386        buildonly-randconfig-003-20241103    clang-19
i386        buildonly-randconfig-004-20241103    clang-19
i386        buildonly-randconfig-005-20241103    clang-19
i386        buildonly-randconfig-006-20241103    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241103    clang-19
i386                  randconfig-002-20241103    clang-19
i386                  randconfig-003-20241103    clang-19
i386                  randconfig-004-20241103    clang-19
i386                  randconfig-005-20241103    clang-19
i386                  randconfig-006-20241103    clang-19
i386                  randconfig-011-20241103    clang-19
i386                  randconfig-012-20241103    clang-19
i386                  randconfig-013-20241103    clang-19
i386                  randconfig-014-20241103    clang-19
i386                  randconfig-015-20241103    clang-19
i386                  randconfig-016-20241103    clang-19
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241103    gcc-14.1.0
loongarch             randconfig-002-20241103    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        stmark2_defconfig    gcc-13.2.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm63xx_defconfig    gcc-13.2.0
mips                           ip27_defconfig    gcc-13.2.0
mips                           ip32_defconfig    gcc-14.1.0
mips                           mtx1_defconfig    gcc-13.2.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241103    gcc-14.1.0
nios2                 randconfig-002-20241103    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                       virt_defconfig    gcc-13.2.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241103    gcc-14.1.0
parisc                randconfig-002-20241103    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                    amigaone_defconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    gcc-13.2.0
powerpc                       maple_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241103    gcc-14.1.0
powerpc               randconfig-002-20241103    gcc-14.1.0
powerpc               randconfig-003-20241103    gcc-14.1.0
powerpc                     redwood_defconfig    gcc-13.2.0
powerpc64             randconfig-001-20241103    gcc-14.1.0
powerpc64             randconfig-002-20241103    gcc-14.1.0
powerpc64             randconfig-003-20241103    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241103    gcc-14.1.0
riscv                 randconfig-002-20241103    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                          debug_defconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241103    gcc-14.1.0
s390                  randconfig-002-20241103    gcc-14.1.0
sh                               alldefconfig    gcc-13.2.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    gcc-14.1.0
sh                 kfr2r09-romimage_defconfig    gcc-14.1.0
sh                     magicpanelr2_defconfig    gcc-13.2.0
sh                    randconfig-001-20241103    gcc-14.1.0
sh                    randconfig-002-20241103    gcc-14.1.0
sh                          rsk7264_defconfig    gcc-14.1.0
sh                      rts7751r2d1_defconfig    gcc-14.1.0
sh                           se7343_defconfig    gcc-14.1.0
sh                           se7705_defconfig    gcc-13.2.0
sh                           se7722_defconfig    gcc-14.1.0
sh                            shmin_defconfig    gcc-13.2.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241103    gcc-14.1.0
sparc64               randconfig-002-20241103    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241103    gcc-14.1.0
um                    randconfig-002-20241103    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                    rhel-8.3-kselftests    gcc-12
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  audio_kc705_defconfig    gcc-14.1.0
xtensa                  cadence_csp_defconfig    gcc-13.2.0
xtensa                randconfig-001-20241103    gcc-14.1.0
xtensa                randconfig-002-20241103    gcc-14.1.0
xtensa                    smp_lx200_defconfig    gcc-13.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

