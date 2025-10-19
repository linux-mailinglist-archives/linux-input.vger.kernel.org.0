Return-Path: <linux-input+bounces-15608-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6C1BEDEB8
	for <lists+linux-input@lfdr.de>; Sun, 19 Oct 2025 08:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FE62189608B
	for <lists+linux-input@lfdr.de>; Sun, 19 Oct 2025 06:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D251FBCA1;
	Sun, 19 Oct 2025 06:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OqmVMOBv"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96533F4FA
	for <linux-input@vger.kernel.org>; Sun, 19 Oct 2025 06:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760853821; cv=none; b=LhyeGVo2zeFCliilkpjsznPtd9NZKqq0ik7vIfBYiCpGHw8GlPXD7G84s+cvyCMA1OOfg3bOQpJbW+NT01kMgTyatTEGzEVbfb11bPcOqoohDppApLbvzDTbO3R4yVjypiZl8DGP83vWdxgJrRccVSkoi6Npt/kbaADvb9U8Cc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760853821; c=relaxed/simple;
	bh=+FlF3EcRWsOikVWGNxK5gpHwMwiP39vuN+6OtZWwcwk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JYdtSiVZH56aW81DsS6JtXp6UY0QH5+v+N0jWyHzMQwBy9c8wC+kosGKiZWhbfqPhWkf0GExfYPPAGBhVCXU5XbYTKpxrchEnUBJI1anWhmjUMoU46269PKo3PKhV7Hy5FS9ejKvfdayWjkIzks97da6rY1RAUBXO/NpiBV4GRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OqmVMOBv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760853820; x=1792389820;
  h=date:from:to:cc:subject:message-id;
  bh=+FlF3EcRWsOikVWGNxK5gpHwMwiP39vuN+6OtZWwcwk=;
  b=OqmVMOBvVJ0ZeLze9VZBsXVTMR65m8nnefrkHCW5n4YT6/GIIsK3JDZ6
   AtdqbTCLXrrw+GIkXwreU3Ik+reXCDItFWPgB0UQJ346e/6Xle1vh52E3
   0xpiwW0s5xQ155nHL+3UPSSM4a7VpGWdfL/bhpXiF928Tx7oQV4jlWJ9H
   7FTkpxZPHkGR0+7yX+DJaTOrSBBFLcQ+dxGVNAJqm/ZvHBhVwB/cXUXmd
   FFQF9TOedIfTdKLZwnViIh2drYUiqOQBwsxSp7Tsv6fmv0Q1CsYrg5FXg
   LoQIreWudlXeltlSNhuCgCxjmg+0LnjQcy9MG4u9CDT5wslO1yIWwFrEq
   A==;
X-CSE-ConnectionGUID: yM9ryNRpRRq6QxeZ9pPBMw==
X-CSE-MsgGUID: t5nmOSiBQSSN4osRCzbgVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65630098"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="65630098"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 23:03:39 -0700
X-CSE-ConnectionGUID: PPl789I7Tuy6/GHS3f301A==
X-CSE-MsgGUID: ugOeJ/MVTqe9CFCu/3wu/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="206778347"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 Oct 2025 23:03:38 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAMVz-0008sr-2f;
	Sun, 19 Oct 2025 06:03:35 +0000
Date: Sun, 19 Oct 2025 14:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 69aeb507312306f73495598a055293fa749d454e
Message-ID: <202510191453.zA8mds5s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 69aeb507312306f73495598a055293fa749d454e  Input: pegasus-notetaker - fix potential out-of-bounds access

elapsed time: 1449m

configs tested: 243
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                          axs101_defconfig    clang-22
arc                                 defconfig    clang-19
arc                        nsim_700_defconfig    gcc-15.1.0
arc                   randconfig-001-20251018    gcc-12.5.0
arc                   randconfig-001-20251019    clang-22
arc                   randconfig-002-20251018    gcc-8.5.0
arc                   randconfig-002-20251019    clang-22
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
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
m68k                         amcore_defconfig    gcc-15.1.0
m68k                         apollo_defconfig    gcc-15.1.0
m68k                          atari_defconfig    clang-22
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    clang-22
mips                           ip30_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251018    gcc-11.5.0
nios2                 randconfig-001-20251019    clang-16
nios2                 randconfig-002-20251018    gcc-8.5.0
nios2                 randconfig-002-20251019    clang-16
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251018    gcc-10.5.0
parisc                randconfig-001-20251019    clang-16
parisc                randconfig-002-20251018    gcc-14.3.0
parisc                randconfig-002-20251019    clang-16
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                    amigaone_defconfig    gcc-15.1.0
powerpc                        fsp2_defconfig    gcc-15.1.0
powerpc                 mpc834x_itx_defconfig    clang-22
powerpc                  mpc866_ads_defconfig    clang-22
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
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
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
sh                             espt_defconfig    gcc-15.1.0
sh                    randconfig-001-20251019    gcc-11.5.0
sh                    randconfig-001-20251019    gcc-15.1.0
sh                    randconfig-002-20251019    gcc-11.5.0
sh                    randconfig-002-20251019    gcc-15.1.0
sh                          sdk7786_defconfig    clang-22
sparc                            alldefconfig    clang-22
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

