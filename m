Return-Path: <linux-input+bounces-14009-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D88B26523
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 14:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BF5A9E15C4
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 12:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79472FD1AD;
	Thu, 14 Aug 2025 12:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6AHeAwd"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8832FCBF1
	for <linux-input@vger.kernel.org>; Thu, 14 Aug 2025 12:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755173643; cv=none; b=ZQxSpCk9QswAc6fHSCYDCK/ydwPSGrcz2AUT9nqtvXeoT5l2V6MXxkhOdQ92fFi5xkksi1mkfJhk+md0/+jIXjwqweCuHlbd1cJlLWYVM5/lhh7QaZO30NRryTRbgYfit/V1SLttpPqimHwLP+IfD09WfMzsOomkzr6acyFvMGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755173643; c=relaxed/simple;
	bh=Ytkzsq34t03UZd7zYtT5jBq8m7VV0cquLP/8+ry7xaQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KVG4TxDGekNamKqSXMZy/s8WFFr3rOV+m//uX3uOjEVS3k8BOaP5BdeBJkBSdwVGQVWuL3/khH3P8+1+IlwBTKHEfqsBFEYXmEB78xzJKOmwtdY9d2ND7GIeFtllgcAKwaNrDPq4iXSD0NfnBzUekOi8xI5Aw2UfjydABN66fwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6AHeAwd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755173641; x=1786709641;
  h=date:from:to:cc:subject:message-id;
  bh=Ytkzsq34t03UZd7zYtT5jBq8m7VV0cquLP/8+ry7xaQ=;
  b=l6AHeAwd+INMwGvJ4+LMgu1j420rxu0eSuV9zWtqGg5B69NQruKZsjfn
   r60N/rZ9Yufnb6xiTiWJ/IOJXb6+ixJ1vpny+edZChtVxaRRJFW7c3VaM
   HFWlwN5k8NfxuKb+9ZbGMkAlJhPUdqUvSU2pPeu30Z4DFZR37pV8mV7+f
   2BeDAWQDkp57fl+JDuXf17QAEjxSDyov0UX39UX5XU3tL/V+Q/ont5LzP
   HMXLKEKM4kp3NEYQFOQmScHjOHIAuq/sQK7HM8zmyr3DUWMzSX31VtVff
   ea4GtTwwEirSAx8p16oAFKEUHX23ReAHSktb4JylbBuWv0ITX98hv+ye3
   Q==;
X-CSE-ConnectionGUID: 09qgf5zaQaCDgyx8/zI9qw==
X-CSE-MsgGUID: yRZumPMSRDK6vdP6wsCm5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57554283"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57554283"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 05:14:01 -0700
X-CSE-ConnectionGUID: r8uwFMm5TNCfZ3t8ITMjHQ==
X-CSE-MsgGUID: 695p0SYlTC+a0dsv/A9f9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="171972161"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 14 Aug 2025 05:13:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umWqD-000AwI-23;
	Thu, 14 Aug 2025 12:13:57 +0000
Date: Thu, 14 Aug 2025 20:13:47 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS WITH WARNING
 9549ff7e584694f0605bc7955b90073041580b24
Message-ID: <202508142026.leCsWs2q-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 9549ff7e584694f0605bc7955b90073041580b24  Input: remove unneeded 'fast_io' parameter in regmap_config

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202508041754.ykl25o1q-lkp@intel.com

    drivers/input/touch-overlay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- alpha-allyesconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-randconfig-001-20250814
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-randconfig-002-20250814
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-001-20250814
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-002-20250814
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-003-20250814
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- csky-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- csky-randconfig-001-20250814
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- csky-randconfig-002-20250814
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-allmodconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-allyesconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-randconfig-001-20250814
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-randconfig-002-20250814
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-006-20250814
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- loongarch-allmodconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- loongarch-randconfig-001-20250814
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- m68k-allmodconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- m68k-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- m68k-allyesconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- microblaze-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- microblaze-allyesconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- microblaze-defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- mips-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- nios2-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- nios2-defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- openrisc-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc-defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc64-defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-randconfig-001-20250814
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc64-randconfig-001-20250814
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc64-randconfig-002-20250814
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- riscv-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- riscv-randconfig-002-20250814
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-randconfig-001-20250814
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-randconfig-002-20250814
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-randconfig-001-20250814
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc-defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-allmodconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-randconfig-001-20250814
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-randconfig-002-20250814
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
`-- xtensa-randconfig-001-20250814
    `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing

elapsed time: 853m

configs tested: 208
configs skipped: 4

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              alldefconfig    clang-22
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                        nsimosci_defconfig    clang-22
arc                   randconfig-001-20250814    gcc-10.5.0
arc                   randconfig-001-20250814    gcc-12.5.0
arc                   randconfig-002-20250814    gcc-10.5.0
arc                   randconfig-002-20250814    gcc-13.4.0
arc                           tb10x_defconfig    clang-22
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                       multi_v4t_defconfig    clang-22
arm                        mvebu_v7_defconfig    clang-22
arm                   randconfig-001-20250814    clang-22
arm                   randconfig-001-20250814    gcc-10.5.0
arm                   randconfig-002-20250814    clang-22
arm                   randconfig-002-20250814    gcc-10.5.0
arm                   randconfig-003-20250814    gcc-10.5.0
arm                   randconfig-004-20250814    gcc-10.5.0
arm                   randconfig-004-20250814    gcc-8.5.0
arm                         s3c6400_defconfig    clang-22
arm                        spear3xx_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250814    clang-17
arm64                 randconfig-001-20250814    gcc-10.5.0
arm64                 randconfig-002-20250814    gcc-10.5.0
arm64                 randconfig-002-20250814    gcc-8.5.0
arm64                 randconfig-003-20250814    gcc-10.5.0
arm64                 randconfig-004-20250814    gcc-10.5.0
arm64                 randconfig-004-20250814    gcc-13.4.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250814    gcc-10.5.0
csky                  randconfig-001-20250814    gcc-15.1.0
csky                  randconfig-002-20250814    gcc-10.5.0
csky                  randconfig-002-20250814    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250814    clang-20
hexagon               randconfig-001-20250814    gcc-10.5.0
hexagon               randconfig-002-20250814    clang-22
hexagon               randconfig-002-20250814    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250814    clang-20
i386        buildonly-randconfig-002-20250814    clang-20
i386        buildonly-randconfig-002-20250814    gcc-12
i386        buildonly-randconfig-003-20250814    clang-20
i386        buildonly-randconfig-003-20250814    gcc-12
i386        buildonly-randconfig-004-20250814    clang-20
i386        buildonly-randconfig-005-20250814    clang-20
i386        buildonly-randconfig-005-20250814    gcc-12
i386        buildonly-randconfig-006-20250814    clang-20
i386        buildonly-randconfig-006-20250814    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250814    clang-20
i386                  randconfig-002-20250814    clang-20
i386                  randconfig-003-20250814    clang-20
i386                  randconfig-004-20250814    clang-20
i386                  randconfig-005-20250814    clang-20
i386                  randconfig-006-20250814    clang-20
i386                  randconfig-007-20250814    clang-20
i386                  randconfig-011-20250814    gcc-12
i386                  randconfig-012-20250814    gcc-12
i386                  randconfig-013-20250814    gcc-12
i386                  randconfig-014-20250814    gcc-12
i386                  randconfig-015-20250814    gcc-12
i386                  randconfig-016-20250814    gcc-12
i386                  randconfig-017-20250814    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250814    clang-22
loongarch             randconfig-001-20250814    gcc-10.5.0
loongarch             randconfig-002-20250814    gcc-10.5.0
loongarch             randconfig-002-20250814    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250814    gcc-10.5.0
nios2                 randconfig-002-20250814    gcc-10.5.0
nios2                 randconfig-002-20250814    gcc-9.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250814    gcc-10.5.0
parisc                randconfig-002-20250814    gcc-10.5.0
parisc                randconfig-002-20250814    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      ppc44x_defconfig    clang-22
powerpc               randconfig-001-20250814    gcc-10.5.0
powerpc               randconfig-001-20250814    gcc-8.5.0
powerpc               randconfig-002-20250814    gcc-10.5.0
powerpc               randconfig-002-20250814    gcc-8.5.0
powerpc               randconfig-003-20250814    gcc-10.5.0
powerpc64             randconfig-001-20250814    clang-22
powerpc64             randconfig-001-20250814    gcc-10.5.0
powerpc64             randconfig-002-20250814    clang-22
powerpc64             randconfig-002-20250814    gcc-10.5.0
powerpc64             randconfig-003-20250814    clang-22
powerpc64             randconfig-003-20250814    gcc-10.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250814    clang-22
riscv                 randconfig-002-20250814    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250814    clang-22
s390                  randconfig-002-20250814    clang-22
s390                  randconfig-002-20250814    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250814    clang-22
sh                    randconfig-001-20250814    gcc-9.5.0
sh                    randconfig-002-20250814    clang-22
sh                    randconfig-002-20250814    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250814    clang-22
sparc                 randconfig-001-20250814    gcc-14.3.0
sparc                 randconfig-002-20250814    clang-22
sparc                 randconfig-002-20250814    gcc-12.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250814    clang-22
sparc64               randconfig-002-20250814    clang-22
sparc64               randconfig-002-20250814    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250814    clang-22
um                    randconfig-002-20250814    clang-22
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250814    clang-20
x86_64      buildonly-randconfig-002-20250814    clang-20
x86_64      buildonly-randconfig-003-20250814    clang-20
x86_64      buildonly-randconfig-003-20250814    gcc-12
x86_64      buildonly-randconfig-004-20250814    clang-20
x86_64      buildonly-randconfig-005-20250814    clang-20
x86_64      buildonly-randconfig-005-20250814    gcc-12
x86_64      buildonly-randconfig-006-20250814    clang-20
x86_64      buildonly-randconfig-006-20250814    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250814    clang-20
x86_64                randconfig-002-20250814    clang-20
x86_64                randconfig-003-20250814    clang-20
x86_64                randconfig-004-20250814    gcc-12
x86_64                randconfig-005-20250814    clang-20
x86_64                randconfig-006-20250814    clang-20
x86_64                randconfig-007-20250814    gcc-12
x86_64                randconfig-008-20250814    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250814    clang-22
xtensa                randconfig-001-20250814    gcc-8.5.0
xtensa                randconfig-002-20250814    clang-22
xtensa                randconfig-002-20250814    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

