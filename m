Return-Path: <linux-input+bounces-12267-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4D3AB2A77
	for <lists+linux-input@lfdr.de>; Sun, 11 May 2025 21:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADF11172C7C
	for <lists+linux-input@lfdr.de>; Sun, 11 May 2025 19:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6FA1EA90;
	Sun, 11 May 2025 19:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+rKrcRa"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012281DFE8
	for <linux-input@vger.kernel.org>; Sun, 11 May 2025 19:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746990322; cv=none; b=S70uW6c+HsB1RiEd2ljvn3PCAAOV9SGU8kMw2wJPkpxe+5Vp/aGrUOTrwThEN7Goba0M5I2iwiDyeUPWqLWm1Zb63GgF34FN3NCvXD8D74jtSDij8bwsBs1JFrqiRwxSTyIIfES/C+Fx+LfsUPm/4tVAHygg0W3/t3NY6dhD6v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746990322; c=relaxed/simple;
	bh=OzYj/1+hYKIqkBZXBrf4sY98H43dgBh+0DQMlhnjEaU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e0sGjdTprqDLy/Akw1sTsBebRl+tdGpXt83QG9JSFETUCXQUj9ZKiJfUDD0Xh+rYmrsEDab6DanbA1/Ha02Dn3uk+myeKZVWZgKn34n6mJTRl8MPt8V76vNvCwMneBfTDx4gjKa6etTfr1+pYVSR1in1+QDQtEVkbyDiu0+nd2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+rKrcRa; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746990320; x=1778526320;
  h=date:from:to:cc:subject:message-id;
  bh=OzYj/1+hYKIqkBZXBrf4sY98H43dgBh+0DQMlhnjEaU=;
  b=R+rKrcRaVX+OB7p43Cd3iTp59idR//ApGSunBlHhAy74ZloqblMW3G/G
   vUlWtlA8GvrTvHMT6FY0ScRGdnx59kFs+spQ02k2sidTQIZQBbKQAGuy4
   NTueBHCHenwGWUttqy7vQ/CQVSQmffV51BT8Bia8glku++AAyCIBi8PKQ
   VR38BkkO8Ku/Fi3z+T5fxefQuHNtIfBesCu78ESBw55L5SnQBS8gnQSAM
   QiTj0Pu0TrHmjfHR7s6jQ6ZUzTKZ7XzYtRjBQNJB0tcHs1cpz3O4dCraW
   jhi3SkkePjhxm7MBA2bpyQsTqaCLf00LF61gMx8r62BQkzrbzOtzKIzvY
   Q==;
X-CSE-ConnectionGUID: ByOu/BL4QPK+zwCcFeEMaA==
X-CSE-MsgGUID: b0IzYDcPRRyioyswHGqWAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="59406515"
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="59406515"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 12:05:19 -0700
X-CSE-ConnectionGUID: 9MLFY+8wTOywe9NTOgVu7g==
X-CSE-MsgGUID: o1QEy9ioTnilb7TDrW8EfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="138094417"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 May 2025 12:05:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEBz9-000DxJ-3C;
	Sun, 11 May 2025 19:05:15 +0000
Date: Mon, 12 May 2025 03:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 93406e9d024058b3bf487656ddd0ac552e5a366e
Message-ID: <202505120354.CJ5FaMKW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 93406e9d024058b3bf487656ddd0ac552e5a366e  Input: xpad - fix xpad_device sorting

elapsed time: 765m

configs tested: 131
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250511    gcc-10.5.0
arc                   randconfig-002-20250511    gcc-14.2.0
arc                    vdk_hs38_smp_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         assabet_defconfig    clang-18
arm                             mxs_defconfig    clang-21
arm                   randconfig-001-20250511    clang-18
arm                   randconfig-002-20250511    clang-21
arm                   randconfig-003-20250511    gcc-8.5.0
arm                   randconfig-004-20250511    gcc-7.5.0
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250511    clang-21
arm64                 randconfig-002-20250511    clang-21
arm64                 randconfig-003-20250511    clang-21
arm64                 randconfig-004-20250511    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250511    gcc-12.4.0
csky                  randconfig-002-20250511    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250511    clang-21
hexagon               randconfig-002-20250511    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250511    clang-20
i386        buildonly-randconfig-002-20250511    gcc-12
i386        buildonly-randconfig-003-20250511    clang-20
i386        buildonly-randconfig-004-20250511    clang-20
i386        buildonly-randconfig-005-20250511    clang-20
i386        buildonly-randconfig-006-20250511    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250511    gcc-14.2.0
loongarch             randconfig-002-20250511    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
m68k                        mvme147_defconfig    gcc-14.2.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           jazz_defconfig    clang-17
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250511    gcc-10.5.0
nios2                 randconfig-002-20250511    gcc-8.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250511    gcc-11.5.0
parisc                randconfig-002-20250511    gcc-7.5.0
powerpc                     akebono_defconfig    clang-21
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    clang-21
powerpc               randconfig-001-20250511    clang-21
powerpc               randconfig-002-20250511    clang-21
powerpc               randconfig-003-20250511    clang-21
powerpc64             randconfig-001-20250511    gcc-6.5.0
powerpc64             randconfig-002-20250511    gcc-6.5.0
powerpc64             randconfig-003-20250511    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250511    gcc-8.5.0
riscv                 randconfig-002-20250511    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250511    gcc-9.3.0
s390                  randconfig-002-20250511    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                    randconfig-001-20250511    gcc-10.5.0
sh                    randconfig-002-20250511    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250511    gcc-7.5.0
sparc                 randconfig-002-20250511    gcc-6.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250511    gcc-5.5.0
sparc64               randconfig-002-20250511    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250511    clang-19
um                    randconfig-002-20250511    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250511    clang-20
x86_64      buildonly-randconfig-002-20250511    clang-20
x86_64      buildonly-randconfig-003-20250511    clang-20
x86_64      buildonly-randconfig-004-20250511    clang-20
x86_64      buildonly-randconfig-005-20250511    gcc-12
x86_64      buildonly-randconfig-006-20250511    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250511    gcc-11.5.0
xtensa                randconfig-002-20250511    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

