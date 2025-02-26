Return-Path: <linux-input+bounces-10402-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1651DA46D4F
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 22:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 815903B0447
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 21:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967BC15852E;
	Wed, 26 Feb 2025 21:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jifc3LCr"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBAF258CEA
	for <linux-input@vger.kernel.org>; Wed, 26 Feb 2025 21:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740604907; cv=none; b=Ix+ITihB7ZcCNXky9Hug2LxoLK8vcmJ7HSo2OIemftJLIk33I8fQYu/BnC13DDH5qe45kWHa6uSnmpT6oVqXhvjGoo96heGctJcTMN7yUE94WzcrITf2Zv24svSrLCX03Vx7VavkMgoFeKcxCHeYmEnGMztfoM9fObOQdFl64D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740604907; c=relaxed/simple;
	bh=/+S5rKzEWj2Ag6ZOc1L/HZGmar1TSubU+/8QizXeOxY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=piwIOAykR8TPgF0ydZ41DhZQn/tqWERRI6IY9iqpkEmTB6gslbW1hCV6gkSJC0gFx2GqUeWakiRDC89TBFtkKu3dDfqRUy5YxHZMJLsW2sStNFJYiBmPuFvrflwU8iBDER0ktQPCTAW6K2GzV9n1mtV9/MFwK5Utp6xgJ1uoBn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jifc3LCr; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740604905; x=1772140905;
  h=date:from:to:cc:subject:message-id;
  bh=/+S5rKzEWj2Ag6ZOc1L/HZGmar1TSubU+/8QizXeOxY=;
  b=jifc3LCr6wc3lZJrfBo/Z2wi5qjnqIv4TB/Th2YW1xrnfi9cYNJRWnun
   GfruXODQMY8urvwMdb6rJgaR8gXO61bqQaZg+84EzqTDvdqCnmYUyUImt
   s0TZ/HA7eg0ExNG9Ol53WhuLx5KvxHm8rYzDlLwG6rho6jayaJuTFRyHX
   VK4ooeZChezU+VSEq0W4r0urxzgDHChXuchpjSmlkww5PuHz3WRARdXj3
   u/ny3OYV4lY0hQSMzK4DZpbSGyzVTCdzA1qG0Keywm8NHuKbtZmTWSh17
   nN5QY7bhHWIcZ65rWCKfJzngxurAJiO0PdItEYiIT+Qeh/JadNBWhfTas
   w==;
X-CSE-ConnectionGUID: XZH7J5nnRK+iBTwC2LVs8Q==
X-CSE-MsgGUID: GFS2Ip8aSVOL8C4/r0YwpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="44300981"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="44300981"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 13:21:42 -0800
X-CSE-ConnectionGUID: kuEOigjVS4ys3dnIJxlmJw==
X-CSE-MsgGUID: +pUWSnt5TLC3DnUszAufaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="121766447"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 26 Feb 2025 13:21:41 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnOqY-000CSu-2I;
	Wed, 26 Feb 2025 21:21:38 +0000
Date: Thu, 27 Feb 2025 05:20:40 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 7f7573bd4f37d4edc168c5b5def0bc2a1951c657
Message-ID: <202502270534.yhpydzUW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 7f7573bd4f37d4edc168c5b5def0bc2a1951c657  Input: pm8941-pwrkey - fix dev_dbg() output in pm8941_pwrkey_irq()

elapsed time: 1446m

configs tested: 90
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              alldefconfig    gcc-13.2.0
arc                              allmodconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250226    gcc-13.2.0
arc                   randconfig-002-20250226    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250226    gcc-14.2.0
arm                   randconfig-002-20250226    clang-21
arm                   randconfig-003-20250226    gcc-14.2.0
arm                   randconfig-004-20250226    gcc-14.2.0
arm                         socfpga_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                 randconfig-001-20250226    gcc-14.2.0
arm64                 randconfig-002-20250226    gcc-14.2.0
arm64                 randconfig-003-20250226    clang-21
arm64                 randconfig-004-20250226    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250226    gcc-14.2.0
csky                  randconfig-002-20250226    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250226    clang-21
hexagon               randconfig-002-20250226    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250226    gcc-12
i386        buildonly-randconfig-002-20250226    gcc-12
i386        buildonly-randconfig-003-20250226    gcc-12
i386        buildonly-randconfig-004-20250226    clang-19
i386        buildonly-randconfig-005-20250226    gcc-12
i386        buildonly-randconfig-006-20250226    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20250226    gcc-14.2.0
loongarch             randconfig-002-20250226    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                          eyeq5_defconfig    gcc-14.2.0
nios2                 randconfig-001-20250226    gcc-14.2.0
nios2                 randconfig-002-20250226    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250226    gcc-14.2.0
parisc                randconfig-002-20250226    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250226    gcc-14.2.0
powerpc               randconfig-002-20250226    clang-18
powerpc               randconfig-003-20250226    clang-21
powerpc64             randconfig-001-20250226    clang-18
powerpc64             randconfig-002-20250226    gcc-14.2.0
powerpc64             randconfig-003-20250226    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250226    clang-18
riscv                 randconfig-002-20250226    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250226    gcc-14.2.0
s390                  randconfig-002-20250226    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250226    gcc-14.2.0
sh                    randconfig-002-20250226    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20250226    gcc-14.2.0
sparc                 randconfig-002-20250226    gcc-14.2.0
sparc64               randconfig-001-20250226    gcc-14.2.0
sparc64               randconfig-002-20250226    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250226    clang-18
um                    randconfig-002-20250226    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250226    clang-19
x86_64      buildonly-randconfig-002-20250226    clang-19
x86_64      buildonly-randconfig-003-20250226    gcc-12
x86_64      buildonly-randconfig-004-20250226    clang-19
x86_64      buildonly-randconfig-005-20250226    gcc-12
x86_64      buildonly-randconfig-006-20250226    gcc-12
x86_64                              defconfig    gcc-11
xtensa                randconfig-001-20250226    gcc-14.2.0
xtensa                randconfig-002-20250226    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

