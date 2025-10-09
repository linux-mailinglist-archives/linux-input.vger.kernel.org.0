Return-Path: <linux-input+bounces-15348-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F31BCAD68
	for <lists+linux-input@lfdr.de>; Thu, 09 Oct 2025 22:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 78B2335359B
	for <lists+linux-input@lfdr.de>; Thu,  9 Oct 2025 20:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36F723D7DE;
	Thu,  9 Oct 2025 20:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKXnOMtC"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5AA1F7580
	for <linux-input@vger.kernel.org>; Thu,  9 Oct 2025 20:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760043231; cv=none; b=NpFhtpnfD66Rmu/gXhG0sM9e7qQqOgEezzIWaoih2VBqxRyxbe4Rv7qj+qU8MDA5NlglkvWR8b2XXsS8dsslmA4RNM8hIxt2nhTiSRjEaklkBnKWl67iAdNLj5Udz1gniRvFlmNaBZpZizUzGjiOqwS/32e/AEUV7L4JjnM3AvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760043231; c=relaxed/simple;
	bh=W+vwcvMNkj6m1ZRVtn55xMa9S1JlJuElMc+Qs7wh/FQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oMfw/RfVFvCH+kDyDVOUV2ZC5eFZkYB3byMkQkPk5qfBxcgOAp3v0kHoJVK0UGvvUgWqjjjqyg2qL8YFrnzwqZmeI5ZoN7ATbrZpL7yi1QNMt2+hsQGa119lEq0kjLfKNa/g9QtPtkYUe5AnAvorV10Rr3DI5W5dlkSwZKpXnuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iKXnOMtC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760043227; x=1791579227;
  h=date:from:to:cc:subject:message-id;
  bh=W+vwcvMNkj6m1ZRVtn55xMa9S1JlJuElMc+Qs7wh/FQ=;
  b=iKXnOMtCe34Pp5MfQDJ5p4aeh74dwkXq7Iy7bZ/UMS8fcvA6nfuz9g+U
   AY/14dnynEALN3N+h9HpWVBXmICn0vrlFO/BtsRPFABMqXGiu2VC1mnQU
   6jB1Bkbq4w4UuWmEepmeSWI6pd2bPKiXlzyhFBBF0KmIFyYydvtZUS+QR
   gOVjBHG4bLp/H0JoY3m8G5eRPBoxwYQLrZqjQFpVifvDos9mZKsp+snIl
   uVuq39m0xkrqrhDQR/n6qA7umV75sxwI/x5VNk4YTVbor7RehB++zoK7h
   R+Pw+8Z0jAZuq4a0sNjmoDYDjqUafDLKqN4H3EgrwGSmmS4sTwb1VpstU
   A==;
X-CSE-ConnectionGUID: Jr1VB7wqSBqL9dul+IBxCQ==
X-CSE-MsgGUID: 7lllWeQsRMSmJVaiCnXn4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62305023"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="62305023"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 13:53:46 -0700
X-CSE-ConnectionGUID: ovhptOiQRXeniOrZr88SlQ==
X-CSE-MsgGUID: ZaBy/NPNStWdOvekjQpkOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="185928203"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Oct 2025 13:53:44 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6xdu-0001PH-0B;
	Thu, 09 Oct 2025 20:53:42 +0000
Date: Fri, 10 Oct 2025 04:53:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 8b87f67b4c87452e21721887fa8dec1f4c6b2b7c
Message-ID: <202510100429.NPhnqBE6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 8b87f67b4c87452e21721887fa8dec1f4c6b2b7c  Merge branch 'next' into for-linus

elapsed time: 843m

configs tested: 142
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                          axs101_defconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                       imx_v4_v5_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20251009    clang-16
csky                  randconfig-002-20251009    clang-16
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251009    clang-16
hexagon               randconfig-002-20251009    clang-16
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251009    gcc-14
i386        buildonly-randconfig-002-20251009    gcc-14
i386        buildonly-randconfig-003-20251009    gcc-14
i386        buildonly-randconfig-004-20251009    gcc-14
i386        buildonly-randconfig-005-20251009    gcc-14
i386        buildonly-randconfig-006-20251009    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251010    clang-20
i386                  randconfig-002-20251010    clang-20
i386                  randconfig-003-20251010    clang-20
i386                  randconfig-004-20251010    clang-20
i386                  randconfig-005-20251010    clang-20
i386                  randconfig-006-20251010    clang-20
i386                  randconfig-007-20251010    clang-20
i386                  randconfig-011-20251009    clang-20
i386                  randconfig-012-20251009    clang-20
i386                  randconfig-013-20251009    clang-20
i386                  randconfig-014-20251009    clang-20
i386                  randconfig-015-20251009    clang-20
i386                  randconfig-016-20251009    clang-20
i386                  randconfig-017-20251009    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251009    clang-16
loongarch             randconfig-002-20251009    clang-16
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                                defconfig    clang-19
m68k                          hp300_defconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251009    clang-16
nios2                 randconfig-002-20251009    clang-16
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251009    clang-16
parisc                randconfig-002-20251009    clang-16
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                        icon_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251009    clang-16
powerpc               randconfig-002-20251009    clang-16
powerpc               randconfig-003-20251009    clang-16
powerpc64             randconfig-002-20251009    clang-16
powerpc64             randconfig-003-20251009    clang-16
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    gcc-15.1.0
riscv                 randconfig-001-20251009    clang-22
riscv                 randconfig-002-20251009    clang-22
s390                             alldefconfig    gcc-15.1.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251009    clang-22
s390                  randconfig-002-20251009    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                    randconfig-001-20251009    clang-22
sh                    randconfig-002-20251009    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251009    clang-22
sparc                 randconfig-002-20251009    clang-22
sparc64               randconfig-001-20251009    clang-22
sparc64               randconfig-002-20251009    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                    randconfig-001-20251009    clang-22
um                    randconfig-002-20251009    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251009    clang-20
x86_64      buildonly-randconfig-002-20251009    clang-20
x86_64      buildonly-randconfig-003-20251009    clang-20
x86_64      buildonly-randconfig-004-20251009    clang-20
x86_64      buildonly-randconfig-005-20251009    clang-20
x86_64      buildonly-randconfig-006-20251009    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20251009    gcc-14
x86_64                randconfig-072-20251009    gcc-14
x86_64                randconfig-073-20251009    gcc-14
x86_64                randconfig-074-20251009    gcc-14
x86_64                randconfig-075-20251009    gcc-14
x86_64                randconfig-076-20251009    gcc-14
x86_64                randconfig-077-20251009    gcc-14
x86_64                randconfig-078-20251009    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251009    clang-22
xtensa                randconfig-002-20251009    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

