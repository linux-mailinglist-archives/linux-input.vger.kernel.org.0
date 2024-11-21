Return-Path: <linux-input+bounces-8192-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B40379D5103
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 17:53:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D7C42877A1
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 16:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1596CDBA;
	Thu, 21 Nov 2024 16:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T1+6dZVE"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4312B1A304A
	for <linux-input@vger.kernel.org>; Thu, 21 Nov 2024 16:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732208008; cv=none; b=ECeI650c+0XK9Ee0rU+GP5QV7WWEAyUKzq7u7tWjBnaakayHZA5CEdVhp8owaQvbSASkw86Kkzqyhsjfa963KnY5oZzqS1XLx1vXlOXKlm2zUaeV6Bn3BDsvHb9vCDzmYvlOY48EKjrEhEEAQz61nz2S/7JzPB/Kk9K9wriLSkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732208008; c=relaxed/simple;
	bh=10BpPeqOznMkt43BWU6oKnqGmATlZm+NGKUEzaKvTWM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K2arIXucnZ7uJ5AB0fngIxBYTYEJ/JJDl9p5F4SoYKSS9HgIIj7AHJBg755porv/WkgeDuOgIMERNlJq6isGfw3+UtTflhs6wWS1kLutuYTciJsSRiV0vtoRT7DTC+t5+lO3jmYy2n1sm3hSWZCZu2EpG4oXXxGyzuQ56aLlLYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T1+6dZVE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732208006; x=1763744006;
  h=date:from:to:cc:subject:message-id;
  bh=10BpPeqOznMkt43BWU6oKnqGmATlZm+NGKUEzaKvTWM=;
  b=T1+6dZVEedJx50lXaWWak3PXEu5FmqlisI5d8ykCuMOOhLbq9c25wLQW
   P3EnsxF51Ma21qjV9Bb70y6jPzxrd+wYUk+kihl/o+RvuwXli2P3SnXvI
   ZWjgLkg6A0w8ktSZ2AGqdHCZEnhdQSN5wXgRa6/6Bn+0z9hNqiMMzV81v
   QsumzFL3OLDK/KgAxDG6c3+W/aPqVGX9czZU8jBrFMj+49nk2IQkf9OBp
   1lRlnD2pWBbECKp/rYt7dVvSY2RbcOWmPO3Q8tWbR6292tj/Pf51KYdCX
   BtZi+zdM0O3kO3bZheP5ivNM3kPAjB6C3Foyy5X/TXBokaJBFbw7jZXIr
   w==;
X-CSE-ConnectionGUID: bgL1z6MnQNyymXNN6ghZSw==
X-CSE-MsgGUID: xwX3OhdIRRGjIiH3jD0jUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32189209"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="32189209"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 08:53:26 -0800
X-CSE-ConnectionGUID: ltWChyfMR3eofVfJ7U1QaA==
X-CSE-MsgGUID: qJypMYo7T1yrqC+ZoU2J1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="127832617"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Nov 2024 08:53:25 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEAQk-0003BK-11;
	Thu, 21 Nov 2024 16:53:22 +0000
Date: Fri, 22 Nov 2024 00:52:28 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 04337738629e8020c272c0dfcd56b9ae0a55ce98
Message-ID: <202411220021.k28cplaD-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 04337738629e8020c272c0dfcd56b9ae0a55ce98  Input: mpr121 - use devm_regulator_get_enable_read_voltage()

elapsed time: 732m

configs tested: 148
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              alldefconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                        clps711x_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                          gemini_defconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    gcc-14.2.0
arm                         s3c6400_defconfig    gcc-14.2.0
arm                         s5pv210_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241121    clang-19
i386        buildonly-randconfig-002-20241121    clang-19
i386        buildonly-randconfig-003-20241121    clang-19
i386        buildonly-randconfig-004-20241121    clang-19
i386        buildonly-randconfig-005-20241121    clang-19
i386        buildonly-randconfig-006-20241121    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241121    clang-19
i386                  randconfig-002-20241121    clang-19
i386                  randconfig-003-20241121    clang-19
i386                  randconfig-004-20241121    clang-19
i386                  randconfig-005-20241121    clang-19
i386                  randconfig-006-20241121    clang-19
i386                  randconfig-011-20241121    clang-19
i386                  randconfig-012-20241121    clang-19
i386                  randconfig-013-20241121    clang-19
i386                  randconfig-014-20241121    clang-19
i386                  randconfig-015-20241121    clang-19
i386                  randconfig-016-20241121    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                           ci20_defconfig    gcc-14.2.0
mips                         db1xxx_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.2.0
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                       holly_defconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                   lite5200b_defconfig    gcc-14.2.0
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc                      pcm030_defconfig    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                               defconfig    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    gcc-14.2.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                          polaris_defconfig    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241121    clang-19
x86_64      buildonly-randconfig-002-20241121    clang-19
x86_64      buildonly-randconfig-003-20241121    clang-19
x86_64      buildonly-randconfig-004-20241121    clang-19
x86_64      buildonly-randconfig-005-20241121    clang-19
x86_64      buildonly-randconfig-006-20241121    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241121    clang-19
x86_64                randconfig-002-20241121    clang-19
x86_64                randconfig-003-20241121    clang-19
x86_64                randconfig-004-20241121    clang-19
x86_64                randconfig-005-20241121    clang-19
x86_64                randconfig-006-20241121    clang-19
x86_64                randconfig-011-20241121    clang-19
x86_64                randconfig-012-20241121    clang-19
x86_64                randconfig-013-20241121    clang-19
x86_64                randconfig-014-20241121    clang-19
x86_64                randconfig-015-20241121    clang-19
x86_64                randconfig-016-20241121    clang-19
x86_64                randconfig-071-20241121    clang-19
x86_64                randconfig-072-20241121    clang-19
x86_64                randconfig-073-20241121    clang-19
x86_64                randconfig-074-20241121    clang-19
x86_64                randconfig-075-20241121    clang-19
x86_64                randconfig-076-20241121    clang-19
x86_64                               rhel-9.4    gcc-12
xtensa                            allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

