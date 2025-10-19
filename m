Return-Path: <linux-input+bounces-15609-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39439BEDEBB
	for <lists+linux-input@lfdr.de>; Sun, 19 Oct 2025 08:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 933431895F9C
	for <lists+linux-input@lfdr.de>; Sun, 19 Oct 2025 06:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10472036FE;
	Sun, 19 Oct 2025 06:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fnkyQRpi"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9205F354AC1
	for <linux-input@vger.kernel.org>; Sun, 19 Oct 2025 06:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760853821; cv=none; b=gEpvUHSBGEz8hFEIeP940FYlcxPh/VCxdeCkCIIiN7XppCja7/xiB255SStwrZUJdu6hwDc/6uXIL7cfN3yxWkw3kFMDU/a3O6xtx3HwURiNT4N5EGIHZNHNiTcy0k4AP3AHaeAtUYd23aqVLofdN8QXixQKSWZTFOuJW0CV3/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760853821; c=relaxed/simple;
	bh=decdicgvlTpFSzy7MCD0FsXZcJcEcW0HjJZPlNpeQws=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s+8mJddlG+bxKjckidvxSsmFtZTnvMJpuSmu7iJX9/edodgKt6kOojYr7bhhvYRAPsyrWplJTWAEHblOPuwk/bl1oS28DyT/KgytgBoP0zWM2fBIarmUIox7mre98XIPnL4NjndX7ySf+jjd5GDqeHmfmhZxN0hPFaKAD+Qz+tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fnkyQRpi; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760853819; x=1792389819;
  h=date:from:to:cc:subject:message-id;
  bh=decdicgvlTpFSzy7MCD0FsXZcJcEcW0HjJZPlNpeQws=;
  b=fnkyQRpipqlhNn/S4Ne2UBwmaXyCUKfKny453JKkWJv6SobV3ws2qDWG
   Odb/4RQLTfVedo9X/bgnuSBuIcLDwMJqpVZAG4+XPnE7wjdnYxJLgSi+Y
   h2v+MUe83K7/aNQP9C66DZsVhtB9uOSkmqIJhTe//r9Aol4JvTcexz12f
   K1PKGqgFmB3iq3aTZR9Hjzb37erzQZPM/3VXu48dGzQ9NIYBuDsx4yGGV
   1GwSt/2pO0AKTzn0k45vFKK661RPeJbAPH5AxSXpngZvC93P50CgAaeDV
   pDwQOEAO6c73MYRQmeMPK7esSDjcMISPUkgS8lkGT4FMiTdIwqJfdueMU
   Q==;
X-CSE-ConnectionGUID: Nvk0NWbGRX2QFL4gUjFE2Q==
X-CSE-MsgGUID: QsROycoIR4KpvcxWUv7UrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50583909"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="50583909"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 23:03:39 -0700
X-CSE-ConnectionGUID: MiJUqgW3Q9KVsg4GrHuqug==
X-CSE-MsgGUID: fuxA5GHfQzGuJT+mnPr7LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="214040766"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Oct 2025 23:03:37 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAMVz-0008su-2p;
	Sun, 19 Oct 2025 06:03:35 +0000
Date: Sun, 19 Oct 2025 14:03:10 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 e8ec34ed4616043026aa11caa2daf9cecb4b93a7
Message-ID: <202510191404.GRwp6PKO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: e8ec34ed4616043026aa11caa2daf9cecb4b93a7  dt-bindings: input: ti,twl4030-keypad: convert to DT schema

elapsed time: 1449m

configs tested: 249
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                          axs101_defconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251018    gcc-12.5.0
arc                   randconfig-001-20251019    clang-22
arc                   randconfig-002-20251018    gcc-8.5.0
arc                   randconfig-002-20251019    clang-22
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                                 defconfig    clang-22
arm                   milbeaut_m10v_defconfig    clang-19
arm                   randconfig-001-20251018    clang-19
arm                   randconfig-001-20251019    clang-22
arm                   randconfig-002-20251018    clang-20
arm                   randconfig-002-20251019    clang-22
arm                   randconfig-003-20251018    clang-22
arm                   randconfig-003-20251019    clang-22
arm                   randconfig-004-20251018    gcc-15.1.0
arm                   randconfig-004-20251019    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251018    gcc-8.5.0
arm64                 randconfig-001-20251019    clang-22
arm64                 randconfig-002-20251018    clang-22
arm64                 randconfig-002-20251019    clang-22
arm64                 randconfig-003-20251018    gcc-13.4.0
arm64                 randconfig-003-20251019    clang-22
arm64                 randconfig-004-20251018    gcc-11.5.0
arm64                 randconfig-004-20251019    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251018    gcc-9.5.0
csky                  randconfig-001-20251019    clang-16
csky                  randconfig-002-20251018    gcc-9.5.0
csky                  randconfig-002-20251019    clang-16
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251018    clang-22
hexagon               randconfig-001-20251019    clang-16
hexagon               randconfig-002-20251018    clang-22
hexagon               randconfig-002-20251019    clang-16
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251018    gcc-14
i386        buildonly-randconfig-001-20251019    gcc-13
i386        buildonly-randconfig-002-20251018    gcc-14
i386        buildonly-randconfig-002-20251019    gcc-13
i386        buildonly-randconfig-003-20251018    clang-20
i386        buildonly-randconfig-003-20251019    gcc-13
i386        buildonly-randconfig-004-20251018    gcc-14
i386        buildonly-randconfig-004-20251019    gcc-13
i386        buildonly-randconfig-005-20251018    clang-20
i386        buildonly-randconfig-005-20251019    gcc-13
i386        buildonly-randconfig-006-20251018    clang-20
i386        buildonly-randconfig-006-20251019    gcc-13
i386                                defconfig    clang-20
i386                  randconfig-001-20251019    clang-20
i386                  randconfig-002-20251019    clang-20
i386                  randconfig-003-20251019    clang-20
i386                  randconfig-004-20251019    clang-20
i386                  randconfig-005-20251019    clang-20
i386                  randconfig-006-20251019    clang-20
i386                  randconfig-007-20251019    clang-20
i386                  randconfig-011-20251019    gcc-14
i386                  randconfig-012-20251019    gcc-14
i386                  randconfig-013-20251019    gcc-14
i386                  randconfig-014-20251019    gcc-14
i386                  randconfig-015-20251019    gcc-14
i386                  randconfig-016-20251019    gcc-14
i386                  randconfig-017-20251019    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251018    clang-22
loongarch             randconfig-001-20251019    clang-16
loongarch             randconfig-002-20251018    gcc-13.4.0
loongarch             randconfig-002-20251019    clang-16
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                          atari_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251018    gcc-11.5.0
nios2                 randconfig-001-20251019    clang-16
nios2                 randconfig-002-20251018    gcc-8.5.0
nios2                 randconfig-002-20251019    clang-16
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251018    gcc-10.5.0
parisc                randconfig-001-20251019    clang-16
parisc                randconfig-002-20251018    gcc-14.3.0
parisc                randconfig-002-20251019    clang-16
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                       holly_defconfig    clang-22
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc                  mpc866_ads_defconfig    clang-22
powerpc                     rainier_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251018    clang-22
powerpc               randconfig-001-20251019    clang-16
powerpc               randconfig-002-20251018    clang-22
powerpc               randconfig-002-20251019    clang-16
powerpc               randconfig-003-20251018    gcc-14.3.0
powerpc               randconfig-003-20251019    clang-16
powerpc                        warp_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251018    gcc-10.5.0
powerpc64             randconfig-002-20251018    gcc-12.5.0
powerpc64             randconfig-002-20251019    clang-16
powerpc64             randconfig-003-20251018    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251019    clang-19
riscv                 randconfig-001-20251019    gcc-11.5.0
riscv                 randconfig-002-20251019    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251019    gcc-11.5.0
s390                  randconfig-001-20251019    gcc-8.5.0
s390                  randconfig-002-20251019    clang-22
s390                  randconfig-002-20251019    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                        edosk7705_defconfig    gcc-15.1.0
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20251019    gcc-11.5.0
sh                    randconfig-001-20251019    gcc-15.1.0
sh                    randconfig-002-20251019    gcc-11.5.0
sh                    randconfig-002-20251019    gcc-15.1.0
sh                          sdk7786_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251019    gcc-11.5.0
sparc                 randconfig-002-20251019    gcc-11.5.0
sparc                 randconfig-002-20251019    gcc-13.4.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251019    gcc-11.5.0
sparc64               randconfig-001-20251019    gcc-8.5.0
sparc64               randconfig-002-20251019    gcc-11.5.0
sparc64               randconfig-002-20251019    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251019    gcc-11.5.0
um                    randconfig-001-20251019    gcc-13
um                    randconfig-002-20251019    clang-22
um                    randconfig-002-20251019    gcc-11.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251018    gcc-14
x86_64      buildonly-randconfig-001-20251019    clang-20
x86_64      buildonly-randconfig-002-20251018    gcc-14
x86_64      buildonly-randconfig-002-20251019    clang-20
x86_64      buildonly-randconfig-003-20251018    gcc-14
x86_64      buildonly-randconfig-003-20251019    clang-20
x86_64      buildonly-randconfig-004-20251018    gcc-14
x86_64      buildonly-randconfig-004-20251019    clang-20
x86_64      buildonly-randconfig-005-20251018    gcc-14
x86_64      buildonly-randconfig-005-20251019    clang-20
x86_64      buildonly-randconfig-006-20251018    clang-20
x86_64      buildonly-randconfig-006-20251019    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251019    clang-20
x86_64                randconfig-002-20251019    clang-20
x86_64                randconfig-003-20251019    clang-20
x86_64                randconfig-004-20251019    clang-20
x86_64                randconfig-005-20251019    clang-20
x86_64                randconfig-006-20251019    clang-20
x86_64                randconfig-007-20251019    clang-20
x86_64                randconfig-008-20251019    clang-20
x86_64                randconfig-071-20251019    clang-20
x86_64                randconfig-072-20251019    clang-20
x86_64                randconfig-073-20251019    clang-20
x86_64                randconfig-074-20251019    clang-20
x86_64                randconfig-075-20251019    clang-20
x86_64                randconfig-076-20251019    clang-20
x86_64                randconfig-077-20251019    clang-20
x86_64                randconfig-078-20251019    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251019    gcc-11.5.0
xtensa                randconfig-001-20251019    gcc-14.3.0
xtensa                randconfig-002-20251019    gcc-11.5.0
xtensa                randconfig-002-20251019    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

