Return-Path: <linux-input+bounces-6287-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3BB96FDE9
	for <lists+linux-input@lfdr.de>; Sat,  7 Sep 2024 00:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFBEF1F251D0
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 22:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6917E158523;
	Fri,  6 Sep 2024 22:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePysp/B+"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6789114A4E9
	for <linux-input@vger.kernel.org>; Fri,  6 Sep 2024 22:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725661207; cv=none; b=l48zJWrWtNN2JjX3Xqj4debEdiDpY2Mfh+rhlwKIvxpy6fWSFzIsAlsmfVjfytx8Qj6dZjGgUPJMWeuC+KKo0KDpnCEJ7E/demhMN8ztNrqmLP8L29lRLkEIyR3rsReTwhYLAMm9X7aUXaunsArgals6y9QdHmkCmYrQiqPrjTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725661207; c=relaxed/simple;
	bh=zDHYnLHi6wa3/nQPCkTyzdJiJMa9HxOUMLRMqaIvGgw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kvhgYa4yTM16x9jKvLSTZHuIPftRntrZFmHCBddDDbBk35+XmVs10GNOwIKLbZZQbMU1sHH1cORwazMNdduRPGx0L6MVMmhVVDXNub/OVKv62MIucqCW75s8hr+gtf/vMzfQBa7RwYE3xcobW4g941a+pgU624TtuUlXGASqAMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePysp/B+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725661205; x=1757197205;
  h=date:from:to:cc:subject:message-id;
  bh=zDHYnLHi6wa3/nQPCkTyzdJiJMa9HxOUMLRMqaIvGgw=;
  b=ePysp/B+n2zsElhi6bqvXtmTVezWDT/VEwm11GM1//8Pyf09LXfLyiWS
   T+6PUT6SAJf/ckDFhKNnQVb1CC9lYb7q/f+pKZA6g6T/trcyOqRvPF01T
   xur5AQuA6AU+//2/88YDzp1kZx0h9sCNVm3OG3CB9EXbq9j2sYNua6PUS
   O811MbnM3RLwB+KOagP3Oi71HttGkX8hsGtgKCISqEoUl+ntUxqRWH9kb
   yRxq9Sbp8K9qJMJD7Z4zyJIlM7vWrGCnjTDJdcWJ/YilKBi/a5LPLry2T
   Tdgvgrvot4lXUPTOFEvRFvSSgBsC4eqDUG6SHLQKhwn+IXcHoTdau9cPx
   g==;
X-CSE-ConnectionGUID: OvSwFXd7RBeu5P3BuFGkKQ==
X-CSE-MsgGUID: 0UhDM+vAR0GuqcBb9jgTew==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="27360758"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="27360758"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 15:20:05 -0700
X-CSE-ConnectionGUID: stjH9h06TtS/uiczHPKNmQ==
X-CSE-MsgGUID: VhpMmtLRS9aTEpfFdJYl/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="66321407"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Sep 2024 15:20:04 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smhJB-000BnC-2X;
	Fri, 06 Sep 2024 22:20:01 +0000
Date: Sat, 07 Sep 2024 06:19:05 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:ib/6.11-rc6-matrix-keypad-spitz] BUILD SUCCESS
 de35996d4b364749194c5b473d1912578880833e
Message-ID: <202409070601.9HsvbYVZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git ib/6.11-rc6-matrix-keypad-spitz
branch HEAD: de35996d4b364749194c5b473d1912578880833e  Input: matrix_keypad - remove support for platform data

elapsed time: 1011m

configs tested: 134
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                                 defconfig   gcc-14.1.0
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm                        neponset_defconfig   clang-15
arm                          pxa168_defconfig   clang-15
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240906   gcc-12
i386         buildonly-randconfig-002-20240906   gcc-12
i386         buildonly-randconfig-003-20240906   gcc-12
i386         buildonly-randconfig-004-20240906   gcc-12
i386         buildonly-randconfig-005-20240906   gcc-12
i386         buildonly-randconfig-006-20240906   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240906   gcc-12
i386                  randconfig-002-20240906   gcc-12
i386                  randconfig-003-20240906   gcc-12
i386                  randconfig-004-20240906   gcc-12
i386                  randconfig-005-20240906   gcc-12
i386                  randconfig-006-20240906   gcc-12
i386                  randconfig-011-20240906   gcc-12
i386                  randconfig-012-20240906   gcc-12
i386                  randconfig-013-20240906   gcc-12
i386                  randconfig-014-20240906   gcc-12
i386                  randconfig-015-20240906   gcc-12
i386                  randconfig-016-20240906   gcc-12
loongarch                        alldefconfig   clang-15
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          atari_defconfig   clang-15
m68k                                defconfig   gcc-14.1.0
m68k                        m5407c3_defconfig   clang-15
m68k                       m5475evb_defconfig   clang-15
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                        vocore2_defconfig   clang-15
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      cm5200_defconfig   clang-15
powerpc                       eiger_defconfig   clang-15
powerpc                  iss476-smp_defconfig   clang-15
powerpc                         ps3_defconfig   clang-15
powerpc                     tqm8555_defconfig   clang-15
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
riscv             nommu_k210_sdcard_defconfig   clang-15
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                               j2_defconfig   clang-15
sh                           se7750_defconfig   clang-15
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   clang-15
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240907   gcc-12
x86_64       buildonly-randconfig-002-20240907   gcc-12
x86_64       buildonly-randconfig-003-20240907   gcc-12
x86_64       buildonly-randconfig-004-20240907   gcc-12
x86_64       buildonly-randconfig-005-20240907   gcc-12
x86_64       buildonly-randconfig-006-20240907   gcc-12
x86_64                              defconfig   clang-18
x86_64                                  kexec   gcc-12
x86_64                randconfig-001-20240907   gcc-12
x86_64                randconfig-002-20240907   gcc-12
x86_64                randconfig-003-20240907   gcc-12
x86_64                randconfig-004-20240907   gcc-12
x86_64                randconfig-005-20240907   gcc-12
x86_64                randconfig-006-20240907   gcc-12
x86_64                randconfig-011-20240907   gcc-12
x86_64                randconfig-012-20240907   gcc-12
x86_64                randconfig-013-20240907   gcc-12
x86_64                randconfig-014-20240907   gcc-12
x86_64                randconfig-015-20240907   gcc-12
x86_64                randconfig-016-20240907   gcc-12
x86_64                randconfig-071-20240907   gcc-12
x86_64                randconfig-072-20240907   gcc-12
x86_64                randconfig-073-20240907   gcc-12
x86_64                randconfig-074-20240907   gcc-12
x86_64                randconfig-075-20240907   gcc-12
x86_64                randconfig-076-20240907   gcc-12
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

