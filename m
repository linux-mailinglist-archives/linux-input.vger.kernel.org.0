Return-Path: <linux-input+bounces-12416-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9F2ABAD0E
	for <lists+linux-input@lfdr.de>; Sun, 18 May 2025 04:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4DD03BAE5D
	for <lists+linux-input@lfdr.de>; Sun, 18 May 2025 02:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B41C2B9AA;
	Sun, 18 May 2025 02:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVf39RKL"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0068D14F98
	for <linux-input@vger.kernel.org>; Sun, 18 May 2025 02:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747535448; cv=none; b=DjgfQsTZyWqjouAJU21ik4FeccTYNxxFFzW93Lce7ukEtgfiAtWiDnvsNQ0tI/xWufKnK+fYEOo6GZVeGyHQaMdIeNRSeMxitfUaMOQp0a/tpPg3CqbQeeq9GEHLl8ANbjrGRrk65gQqOFPR62OQduKM8UEqJh1lIXoyyTMbLnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747535448; c=relaxed/simple;
	bh=hXZMbMHboV9dgLcXQfGLUN7JsX0xrrCZ13LaXBFrAAY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GQWvEzpIuFvRdTSwjCSa8ldV12ypeRcDdFiaGM/UxxtmNovTw+deyFgXx7efteripn8Ih2+1t9fuD3fTueuUMYBkPiRPXTByWXBFCb4Mdpq+VQ/QoWrAYglFP3U8RGyUPlerJoZn16KF3atUlY5OnoUZb1DlaxPio3OhA+ZKpEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVf39RKL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747535446; x=1779071446;
  h=date:from:to:cc:subject:message-id;
  bh=hXZMbMHboV9dgLcXQfGLUN7JsX0xrrCZ13LaXBFrAAY=;
  b=EVf39RKL2kiNtkJYmFKZ/1/NEAxJkC82QtDNKXsTinMm/u2qacTjW9fB
   WAXRtMilMa9ahCBmsHLZujqMGIpgpUhnfWyUJg3HAPbL3P++1A+vR+y6c
   GIvy2zer+a7CpzVoHrwaxSBQEdiBeTKY3u+9jhUvC5uZvYitjqq3grQWa
   jwn2CwQmldpa9yZhy3R4CEHPXpn7I/FQp7iwc3CpMT/7cBePa/xIm9sVm
   MLaL+5VOTng4mMdfHsLBIP9PGyqtueFLsmTf2geyo2utl8a/6oStrACeV
   /q0WPlYuBq/aPPvMk6m9Eh/Z6fs67u4Y9ksj8OtJ5ydzImawYIUjWzN02
   g==;
X-CSE-ConnectionGUID: 0xaMgWTVSUCOKdq7fbNt5Q==
X-CSE-MsgGUID: 5gIs3nGESg6pw9abHoKkrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="53284175"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="53284175"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 19:30:45 -0700
X-CSE-ConnectionGUID: gTs057X/Sy+t6zx1nzfE2g==
X-CSE-MsgGUID: OLO9hKSKRNiwFTYV66sU9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="143822384"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 May 2025 19:30:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGTnW-000KZL-05;
	Sun, 18 May 2025 02:30:42 +0000
Date: Sun, 18 May 2025 10:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 f0d17942ea3edec191f1c0fc0d2cd7feca8de2f0
Message-ID: <202505181025.tJ7qVmgB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: f0d17942ea3edec191f1c0fc0d2cd7feca8de2f0  Input: xpad - add more controllers

elapsed time: 1450m

configs tested: 157
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250517    gcc-10.5.0
arc                   randconfig-002-20250517    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-21
arm                       multi_v4t_defconfig    clang-16
arm                   randconfig-001-20250517    clang-21
arm                   randconfig-002-20250517    gcc-8.5.0
arm                   randconfig-003-20250517    gcc-8.5.0
arm                   randconfig-004-20250517    clang-21
arm                           stm32_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250517    clang-17
arm64                 randconfig-002-20250517    clang-16
arm64                 randconfig-003-20250517    gcc-6.5.0
arm64                 randconfig-004-20250517    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250517    gcc-10.5.0
csky                  randconfig-002-20250517    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250517    clang-21
hexagon               randconfig-002-20250517    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250517    clang-20
i386        buildonly-randconfig-002-20250517    clang-20
i386        buildonly-randconfig-003-20250517    clang-20
i386        buildonly-randconfig-004-20250517    gcc-12
i386        buildonly-randconfig-005-20250517    clang-20
i386        buildonly-randconfig-006-20250517    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250517    gcc-14.2.0
loongarch             randconfig-002-20250517    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      maltaaprp_defconfig    clang-21
mips                           mtx1_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250517    gcc-14.2.0
nios2                 randconfig-002-20250517    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250517    gcc-5.5.0
parisc                randconfig-002-20250517    gcc-11.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    amigaone_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250517    gcc-6.5.0
powerpc               randconfig-002-20250517    gcc-6.5.0
powerpc               randconfig-003-20250517    clang-16
powerpc64             randconfig-001-20250517    clang-21
powerpc64             randconfig-002-20250517    gcc-6.5.0
powerpc64             randconfig-003-20250517    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250517    clang-21
riscv                 randconfig-002-20250517    clang-21
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250517    gcc-7.5.0
s390                  randconfig-002-20250517    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20250517    gcc-12.4.0
sh                    randconfig-002-20250517    gcc-10.5.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                           se7343_defconfig    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250517    gcc-11.5.0
sparc                 randconfig-002-20250517    gcc-7.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250517    gcc-7.5.0
sparc64               randconfig-002-20250517    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250517    gcc-12
um                    randconfig-002-20250517    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250517    gcc-12
x86_64      buildonly-randconfig-002-20250517    gcc-12
x86_64      buildonly-randconfig-003-20250517    clang-20
x86_64      buildonly-randconfig-004-20250517    clang-20
x86_64      buildonly-randconfig-005-20250517    clang-20
x86_64      buildonly-randconfig-006-20250517    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250518    clang-20
x86_64                randconfig-002-20250518    clang-20
x86_64                randconfig-003-20250518    clang-20
x86_64                randconfig-004-20250518    clang-20
x86_64                randconfig-005-20250518    clang-20
x86_64                randconfig-006-20250518    clang-20
x86_64                randconfig-007-20250518    clang-20
x86_64                randconfig-008-20250518    clang-20
x86_64                randconfig-071-20250518    gcc-12
x86_64                randconfig-072-20250518    gcc-12
x86_64                randconfig-073-20250518    gcc-12
x86_64                randconfig-074-20250518    gcc-12
x86_64                randconfig-075-20250518    gcc-12
x86_64                randconfig-076-20250518    gcc-12
x86_64                randconfig-077-20250518    gcc-12
x86_64                randconfig-078-20250518    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250517    gcc-9.3.0
xtensa                randconfig-002-20250517    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

