Return-Path: <linux-input+bounces-9795-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D06A29074
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 15:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DE75163306
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 14:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9267DA6A;
	Wed,  5 Feb 2025 14:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTt/VmgJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3FC151988
	for <linux-input@vger.kernel.org>; Wed,  5 Feb 2025 14:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738766176; cv=none; b=L9vB0RqOjeaEtEOMG1we1w26koAya3yQc9Se0/vo7KDLCk0+3oIFj/ail7rbGfT7PEsn1mPvwj7PXhNTg8P4YM6a9BIpbvLf8tdArrJY1z+GNW9m1d8zL9zzHbnr8jq+uat1Nu4GCasAXcw4BT1xjwn0yLgUhjbsina+jfkd1jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738766176; c=relaxed/simple;
	bh=OkUy4F2q0nUV8MFUgx73lh8rSDaVk3JRMUKiJPnOMAk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jrrgdceqwddV8qDVLNxBmE4PTY3h5PDGiC7PQzP4jxFhcToKLDRAbAhXngJAszQEk0r7Z1jSLlcYYp7t8gYAFXLmoXF3FFX4/+ISmqhsP8QvN0k/ck4ZmIFGpCImg2LewYDuC9cp9ZaJUXogF9yH81beJQCFPR6+DBI+WvX8u8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hTt/VmgJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738766173; x=1770302173;
  h=date:from:to:cc:subject:message-id;
  bh=OkUy4F2q0nUV8MFUgx73lh8rSDaVk3JRMUKiJPnOMAk=;
  b=hTt/VmgJWsCYo7DzyvNJp/zoGWPVblomv0oDYoaOMzpABKPnOYtq+BE4
   vwv1LOBfI30AFgVCOhzNB9CaxfTa9oftu6c3NCRVv65ovtqk0N8QfXmjp
   zZncRzRCK2ZkQ9jObOxAk7pPlKdXWi/0IS5j8Jgas64XZ/Uj9qz66asYh
   WfIcUO2CdOnZYWFU8z1DUZmDO1tg7ywvtlNI+LjRbD6xnaTfFAqNwnVYb
   /HuEocqZukmCU699Ju0h3zJD6d1SQMlUs0GyuD++P7W4kfK2dcd+rHBXW
   sATFjyVwD/JbSrIFTAoFvhlhio6fcWALv36d4Plg3IA8dM0rTOMP5fDrJ
   Q==;
X-CSE-ConnectionGUID: bZC6lH08TGymY3ynarA4eA==
X-CSE-MsgGUID: CearyjRcSqaTt7cF16Ac2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39032914"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39032914"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 06:36:13 -0800
X-CSE-ConnectionGUID: FNvqdHntQSyXv1ZVGo2QnQ==
X-CSE-MsgGUID: Du+264eQTPiLE6EcnMbwyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115919249"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Feb 2025 06:36:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfgVc-000uZX-2e;
	Wed, 05 Feb 2025 14:36:08 +0000
Date: Wed, 05 Feb 2025 22:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 3492321e2e60ddfe91aa438bb9ac209016f48f7a
Message-ID: <202502052246.wNezy1p2-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 3492321e2e60ddfe91aa438bb9ac209016f48f7a  Input: xpad - add multiple supported devices

elapsed time: 1444m

configs tested: 216
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                                 defconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250205    gcc-13.2.0
arc                   randconfig-002-20250205    gcc-13.2.0
arc                           tb10x_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                                 defconfig    gcc-14.2.0
arm                          gemini_defconfig    clang-15
arm                           h3600_defconfig    clang-21
arm                            hisi_defconfig    gcc-14.2.0
arm                       multi_v4t_defconfig    clang-21
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250205    gcc-13.2.0
arm                   randconfig-001-20250205    gcc-14.2.0
arm                   randconfig-002-20250205    gcc-13.2.0
arm                   randconfig-002-20250205    gcc-14.2.0
arm                   randconfig-003-20250205    clang-16
arm                   randconfig-003-20250205    gcc-13.2.0
arm                   randconfig-004-20250205    gcc-13.2.0
arm                   randconfig-004-20250205    gcc-14.2.0
arm                         s3c6400_defconfig    clang-15
arm                         socfpga_defconfig    gcc-14.2.0
arm                       spear13xx_defconfig    clang-21
arm                        vexpress_defconfig    clang-21
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250205    gcc-13.2.0
arm64                 randconfig-001-20250205    gcc-14.2.0
arm64                 randconfig-002-20250205    gcc-13.2.0
arm64                 randconfig-002-20250205    gcc-14.2.0
arm64                 randconfig-003-20250205    gcc-13.2.0
arm64                 randconfig-003-20250205    gcc-14.2.0
arm64                 randconfig-004-20250205    gcc-13.2.0
arm64                 randconfig-004-20250205    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250205    gcc-14.2.0
csky                  randconfig-002-20250205    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250205    clang-17
hexagon               randconfig-002-20250205    clang-19
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20250204    gcc-12
i386        buildonly-randconfig-001-20250205    gcc-12
i386        buildonly-randconfig-002-20250204    clang-19
i386        buildonly-randconfig-002-20250205    gcc-12
i386        buildonly-randconfig-003-20250204    clang-19
i386        buildonly-randconfig-003-20250205    gcc-12
i386        buildonly-randconfig-004-20250204    gcc-12
i386        buildonly-randconfig-004-20250205    gcc-12
i386        buildonly-randconfig-005-20250204    clang-19
i386        buildonly-randconfig-005-20250205    gcc-12
i386        buildonly-randconfig-006-20250204    gcc-12
i386        buildonly-randconfig-006-20250205    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250205    gcc-12
i386                  randconfig-002-20250205    gcc-12
i386                  randconfig-003-20250205    gcc-12
i386                  randconfig-004-20250205    gcc-12
i386                  randconfig-005-20250205    gcc-12
i386                  randconfig-006-20250205    gcc-12
i386                  randconfig-007-20250205    gcc-12
i386                  randconfig-011-20250205    clang-19
i386                  randconfig-012-20250205    clang-19
i386                  randconfig-013-20250205    clang-19
i386                  randconfig-014-20250205    clang-19
i386                  randconfig-015-20250205    clang-19
i386                  randconfig-016-20250205    clang-19
i386                  randconfig-017-20250205    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250205    gcc-14.2.0
loongarch             randconfig-002-20250205    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    clang-15
m68k                                defconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-15
mips                           ip22_defconfig    gcc-14.2.0
mips                        vocore2_defconfig    clang-15
nios2                         3c120_defconfig    gcc-14.2.0
nios2                            alldefconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250205    gcc-14.2.0
nios2                 randconfig-002-20250205    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250205    gcc-14.2.0
parisc                randconfig-002-20250205    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    clang-15
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250205    clang-16
powerpc               randconfig-002-20250205    gcc-14.2.0
powerpc               randconfig-003-20250205    gcc-14.2.0
powerpc                     taishan_defconfig    clang-21
powerpc                      tqm8xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250205    clang-18
powerpc64             randconfig-002-20250205    gcc-14.2.0
powerpc64             randconfig-003-20250205    clang-18
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250205    gcc-14.2.0
riscv                 randconfig-002-20250205    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250205    gcc-14.2.0
s390                  randconfig-002-20250205    gcc-14.2.0
sh                               alldefconfig    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        edosk7705_defconfig    clang-21
sh                        edosk7760_defconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                    randconfig-001-20250205    gcc-14.2.0
sh                    randconfig-002-20250205    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                            titan_defconfig    gcc-14.2.0
sh                          urquell_defconfig    clang-15
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250205    gcc-14.2.0
sparc                 randconfig-002-20250205    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250205    gcc-14.2.0
sparc64               randconfig-002-20250205    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250205    gcc-14.2.0
um                    randconfig-002-20250205    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250204    clang-19
x86_64      buildonly-randconfig-001-20250205    clang-19
x86_64      buildonly-randconfig-002-20250204    clang-19
x86_64      buildonly-randconfig-002-20250205    clang-19
x86_64      buildonly-randconfig-003-20250204    clang-19
x86_64      buildonly-randconfig-003-20250205    clang-19
x86_64      buildonly-randconfig-004-20250204    gcc-11
x86_64      buildonly-randconfig-004-20250205    clang-19
x86_64      buildonly-randconfig-005-20250204    clang-19
x86_64      buildonly-randconfig-005-20250205    clang-19
x86_64      buildonly-randconfig-006-20250204    clang-19
x86_64      buildonly-randconfig-006-20250205    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250205    clang-19
x86_64                randconfig-002-20250205    clang-19
x86_64                randconfig-003-20250205    clang-19
x86_64                randconfig-004-20250205    clang-19
x86_64                randconfig-005-20250205    clang-19
x86_64                randconfig-006-20250205    clang-19
x86_64                randconfig-007-20250205    clang-19
x86_64                randconfig-008-20250205    clang-19
x86_64                randconfig-071-20250205    gcc-12
x86_64                randconfig-072-20250205    gcc-12
x86_64                randconfig-073-20250205    gcc-12
x86_64                randconfig-074-20250205    gcc-12
x86_64                randconfig-075-20250205    gcc-12
x86_64                randconfig-076-20250205    gcc-12
x86_64                randconfig-077-20250205    gcc-12
x86_64                randconfig-078-20250205    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250205    gcc-14.2.0
xtensa                randconfig-002-20250205    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

