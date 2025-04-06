Return-Path: <linux-input+bounces-11546-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 623C4A7CCF6
	for <lists+linux-input@lfdr.de>; Sun,  6 Apr 2025 09:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C43CF3AE698
	for <lists+linux-input@lfdr.de>; Sun,  6 Apr 2025 07:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81552286A9;
	Sun,  6 Apr 2025 07:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gcvzWCXo"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AFD1C6BE
	for <linux-input@vger.kernel.org>; Sun,  6 Apr 2025 07:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743923149; cv=none; b=I0kS9SY0mGqUHlaZnN8Rr/gZe5GdR97NAAuSoni2dJOIrFShtjDdV5X76YZVRTcwDCPWaSheeFCCsm7ev/v98PLiC7Kh4PkL6ndahYZ+ZHVWcKct/kHT0mTO8REr9lovN53nDP9gcb0R/VubdlRjNoVHhdGcGeBFBKIyZR6gJfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743923149; c=relaxed/simple;
	bh=5askiriLdgQOlOjos4E0nnxPnCt54Ug1P4QqT9E97Ig=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SwGF9Ci5F9ZudbQRs4m8rW+HHJpWKhBXNWsU48W/rrHPDCgo8cRTRpSJLnMeNvow/IUWQm7VgB5zAchvoxD/zevsnLMlwQVebIwAfO0R8fCGuBvyOjCe79Om7LAI+tTH0pgA6R8Aw/oEVQO3vmPiU8A1kUgzfrD+WYpfKanwTR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gcvzWCXo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743923147; x=1775459147;
  h=date:from:to:cc:subject:message-id;
  bh=5askiriLdgQOlOjos4E0nnxPnCt54Ug1P4QqT9E97Ig=;
  b=gcvzWCXoD0s0gvkYfeCp26JR5DouBoqhORvMEO8Rd3C56LCYTafjH1KH
   6K1Yi6eIeuRUVUdYH5w7rsaJAMcelN3tyHjSpccZFWBKQ+Vt+qiZd7zpH
   MwecTu+NU6UiNgQgqK+IsbisprFndSQ2OgW4GP/VwuvjRsYHNsnG03gnh
   8VguZ6Qtknd1D2vXOaebrxy5B6+m5aZtf3+Yi4XfydyhUmumGDEZZ4/MP
   Q6LEROE1DhIYDRc/DPnlKTa2CXswrq4Fbz+xADfdSYWnQMS43j4hdiTqZ
   SaXoe4UTjyKsmrEGUGS4Z+L93/sGlOL/RLmn9io/F+jim94tK3Yez8f8a
   Q==;
X-CSE-ConnectionGUID: TeNxRyP9SI6pCEk4yo21sg==
X-CSE-MsgGUID: g6CufFuWS+aJ8J4lchTpXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="44565118"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="44565118"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 00:05:45 -0700
X-CSE-ConnectionGUID: gFbZrgdZRPy0r7BK7rPMzA==
X-CSE-MsgGUID: PrU1PUEsQnahJRKSH27p0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="132871449"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Apr 2025 00:05:43 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1K4b-0002TH-0d;
	Sun, 06 Apr 2025 07:05:41 +0000
Date: Sun, 06 Apr 2025 15:05:17 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 946661e3bef8efa11ba8079d4ebafe6fc3b0aaad
Message-ID: <202504061507.Ll53YuBT-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 946661e3bef8efa11ba8079d4ebafe6fc3b0aaad  Merge branch 'next' into for-linus

elapsed time: 1442m

configs tested: 134
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
arc                        nsim_700_defconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250405    gcc-14.2.0
arc                   randconfig-002-20250405    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-14
arm                          ep93xx_defconfig    clang-21
arm                            mps2_defconfig    clang-21
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20250405    clang-18
arm                   randconfig-002-20250405    gcc-7.5.0
arm                   randconfig-003-20250405    gcc-8.5.0
arm                   randconfig-004-20250405    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250405    clang-19
arm64                 randconfig-002-20250405    gcc-8.5.0
arm64                 randconfig-003-20250405    gcc-8.5.0
arm64                 randconfig-004-20250405    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250405    gcc-14.2.0
csky                  randconfig-002-20250405    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250405    clang-21
hexagon               randconfig-002-20250405    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250405    gcc-12
i386        buildonly-randconfig-002-20250405    clang-20
i386        buildonly-randconfig-003-20250405    clang-20
i386        buildonly-randconfig-004-20250405    clang-20
i386        buildonly-randconfig-005-20250405    clang-20
i386        buildonly-randconfig-006-20250405    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250405    gcc-14.2.0
loongarch             randconfig-002-20250405    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250405    gcc-12.4.0
nios2                 randconfig-002-20250405    gcc-6.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250405    gcc-11.5.0
parisc                randconfig-002-20250405    gcc-9.3.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                        cell_defconfig    gcc-14.2.0
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc                   lite5200b_defconfig    clang-21
powerpc               randconfig-001-20250405    gcc-8.5.0
powerpc               randconfig-002-20250405    gcc-8.5.0
powerpc               randconfig-003-20250405    gcc-8.5.0
powerpc64             randconfig-001-20250405    clang-21
powerpc64             randconfig-002-20250405    clang-21
powerpc64             randconfig-003-20250405    clang-18
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250405    clang-21
riscv                 randconfig-002-20250405    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250405    clang-15
s390                  randconfig-002-20250405    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250405    gcc-14.2.0
sh                    randconfig-002-20250405    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250405    gcc-11.5.0
sparc                 randconfig-002-20250405    gcc-10.3.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250405    gcc-9.3.0
sparc64               randconfig-002-20250405    gcc-11.5.0
um                               alldefconfig    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250405    clang-17
um                    randconfig-002-20250405    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250405    gcc-12
x86_64      buildonly-randconfig-002-20250405    clang-20
x86_64      buildonly-randconfig-003-20250405    clang-20
x86_64      buildonly-randconfig-004-20250405    clang-20
x86_64      buildonly-randconfig-005-20250405    gcc-12
x86_64      buildonly-randconfig-006-20250405    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250405    gcc-11.5.0
xtensa                randconfig-002-20250405    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

