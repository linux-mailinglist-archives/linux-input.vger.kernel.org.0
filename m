Return-Path: <linux-input+bounces-9419-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 142E6A18530
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 19:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 035DA188AD95
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 18:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6A41F7075;
	Tue, 21 Jan 2025 18:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T4aiQId6"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7191AA1E8
	for <linux-input@vger.kernel.org>; Tue, 21 Jan 2025 18:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737484149; cv=none; b=kbG6GNEyFXJy89YLha+bFSapUA6kNBsKCty8e9uuatNvnWNbM86RGj49cu0cDHdWXBY6eFvS8SM2/Ef4Zww+VuR1sdkvdfhkcmmCv0wj5aW7ihAn21ZgfY3eYbRYo/Ou6HLgfVRqXsVpbUzWgSDXA6sfQ295sUVKUu7++X/buXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737484149; c=relaxed/simple;
	bh=qi2yJcBhz9W9enWYsQ00TB7U8Mf/heCrzhB+WzFNm7I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JJ3MFjIpfalyfP1/tz8teOfQK1IGrhMB/IHzUL24E3WOKnp68t7E0XTfAgLla5UNfBi6F9tRWUjaQ4PBmvJERPI/YX2MbQlzgSXKg7PreZ7TRbMI7ekA/LLG4ariZM5FqzvQBhEMjhC/AbtX459XW8FDP3wnPapEIgzEM8PjkFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T4aiQId6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737484147; x=1769020147;
  h=date:from:to:cc:subject:message-id;
  bh=qi2yJcBhz9W9enWYsQ00TB7U8Mf/heCrzhB+WzFNm7I=;
  b=T4aiQId6cbl50d1ZhVnrLLT5vs+gks1IYFm1C4dLDC8AuSEMnVpK4Nqt
   i43Sjs5TYa35owjc1xEFoJfDgzwaSFv5SGSIToecOjm32VfKRS6E/uRif
   ik7zI+2aEusyi9QKRQxuT4vFxPqG3/19EzGX79+pIV0iQGX5h6ErrqFk3
   SQvvBKhOgvhWXucUeRiznpDD5utVVk02i3X4DaUPgXDofKQADq+vWkMCT
   l0zeS1QRYO/s0kyXr7tXy/WcEmAzkQBFBBdiZ3i3WyyYSwx3MeLoqqM/t
   CBGdeTXfhGgZfhcm/OFNJY63tKvaifsoF+l0ixk90qMChnAwaC75xY6TP
   A==;
X-CSE-ConnectionGUID: ipbq2/fZR+SAyqTOC4fs4Q==
X-CSE-MsgGUID: XZ3l1ChJSMiNwkHzF4/nNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38015713"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38015713"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 10:29:07 -0800
X-CSE-ConnectionGUID: KYy09IBHQz6asoSyIBqX7A==
X-CSE-MsgGUID: pvruwJiKQHOcH/BGiui2sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="106671284"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Jan 2025 10:29:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taIzn-000YqA-2E;
	Tue, 21 Jan 2025 18:29:03 +0000
Date: Wed, 22 Jan 2025 02:28:53 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 3a6e5ed2372bcb2a3c554fda32419efd91ff9b0c
Message-ID: <202501220247.QBxDRrNl-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 3a6e5ed2372bcb2a3c554fda32419efd91ff9b0c  Input: xpad - add support for Nacon Evol-X Xbox One Controller

elapsed time: 726m

configs tested: 117
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250121    gcc-13.2.0
arc                   randconfig-002-20250121    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                           omap1_defconfig    gcc-14.2.0
arm                   randconfig-001-20250121    clang-18
arm                   randconfig-002-20250121    gcc-14.2.0
arm                   randconfig-003-20250121    gcc-14.2.0
arm                   randconfig-004-20250121    gcc-14.2.0
arm                        realview_defconfig    clang-19
arm                        spear6xx_defconfig    clang-19
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250121    gcc-14.2.0
arm64                 randconfig-002-20250121    gcc-14.2.0
arm64                 randconfig-003-20250121    gcc-14.2.0
arm64                 randconfig-004-20250121    clang-18
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250121    gcc-14.2.0
csky                  randconfig-002-20250121    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250121    clang-19
hexagon               randconfig-002-20250121    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250121    gcc-12
i386        buildonly-randconfig-002-20250121    clang-19
i386        buildonly-randconfig-003-20250121    gcc-12
i386        buildonly-randconfig-004-20250121    gcc-12
i386        buildonly-randconfig-005-20250121    gcc-12
i386        buildonly-randconfig-006-20250121    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250121    gcc-14.2.0
loongarch             randconfig-002-20250121    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        mvme147_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                         10m50_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250121    gcc-14.2.0
nios2                 randconfig-002-20250121    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250121    gcc-14.2.0
parisc                randconfig-002-20250121    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                       eiger_defconfig    clang-17
powerpc                      pcm030_defconfig    clang-17
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250121    clang-20
powerpc               randconfig-003-20250121    gcc-14.2.0
powerpc64             randconfig-001-20250121    gcc-14.2.0
powerpc64             randconfig-002-20250121    clang-20
powerpc64             randconfig-003-20250121    clang-16
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250121    gcc-14.2.0
riscv                 randconfig-002-20250121    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250121    clang-15
s390                  randconfig-002-20250121    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250121    gcc-14.2.0
sh                    randconfig-002-20250121    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250121    gcc-14.2.0
sparc                 randconfig-002-20250121    gcc-14.2.0
sparc64               randconfig-001-20250121    gcc-14.2.0
sparc64               randconfig-002-20250121    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250121    clang-16
um                    randconfig-002-20250121    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250121    gcc-12
x86_64      buildonly-randconfig-002-20250121    clang-19
x86_64      buildonly-randconfig-003-20250121    gcc-12
x86_64      buildonly-randconfig-004-20250121    clang-19
x86_64      buildonly-randconfig-005-20250121    clang-19
x86_64      buildonly-randconfig-006-20250121    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250121    gcc-14.2.0
xtensa                randconfig-002-20250121    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

