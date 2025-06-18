Return-Path: <linux-input+bounces-12956-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0DFADF972
	for <lists+linux-input@lfdr.de>; Thu, 19 Jun 2025 00:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2FF13A9844
	for <lists+linux-input@lfdr.de>; Wed, 18 Jun 2025 22:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2739A27EFF2;
	Wed, 18 Jun 2025 22:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KUH825hB"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47635261594
	for <linux-input@vger.kernel.org>; Wed, 18 Jun 2025 22:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750285727; cv=none; b=MKxPUmqmhFSw/uClf8ZCFoL2018Eovfj2F+QAtS3ADjmIPQJjjv/1xwS6bkaoxfjxwVrtmsGpqWy+8tLPQfqnybwfKwbBaO5IdB9ZQ+xynounmn/1dPQl6f7n1SxSIR+3miV58njtXoGWIIHq95CXfTH2tyPZ4PPES0A1FKDgd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750285727; c=relaxed/simple;
	bh=kJutBkS4Sv9q4Jb9mKUta6oJPNVw/wmxxZlLOsROYks=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PEhguN+N4/vFIERFE/QhKjzbyYyvibaZlbpIMzmojJvlCbxaSFbMe6/WN8tNiC5hQ74Fu6y8U5f2OBYmuJGSLAW3pQSroDj+OQCWXBcSyTpkVLWyZvJG2xgp75KQH2iKbbdDMJaNYqTmyogNgKSuujzZeEr8CB4DxQtcJudxQjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KUH825hB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750285725; x=1781821725;
  h=date:from:to:cc:subject:message-id;
  bh=kJutBkS4Sv9q4Jb9mKUta6oJPNVw/wmxxZlLOsROYks=;
  b=KUH825hB+ir58T5zvZBFV9Y/CZy9+Ita9fxDjocp+OEb6QXUCeZPFcOe
   qtIZVqyHgzICk7EJublb4WZr4zhkCE+reqwUFzeY87BAV1o5QSeaAvCF4
   riyM4Q1Dyap7JYM0Tnswa1TvxsquJH7sh8RHHVTV52pOV7l7OG08lAL8A
   bKZG68Gll5KzjnG7WhYXuX1YqK1d99UF29uxdQvXEZTteSrrv/3AGq4zX
   QZa72YMX2sxgiQ+/37k5eiKkyy1dpDbKB3l+1m6zzaSAjNs5mzPqh7Kjp
   gHKhfqqHRKYefv+TjbvZoU3qs80wKDxuwqTpoEo9+TeT3PlwmkSbBKwLS
   g==;
X-CSE-ConnectionGUID: n8pl78VLQNSRm3Rvnrc/Fw==
X-CSE-MsgGUID: JdTV2XgdRnyYkEJI2bBuRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52676000"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="52676000"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 15:28:45 -0700
X-CSE-ConnectionGUID: F/Y4dnuhRA29g4V23nc91A==
X-CSE-MsgGUID: K+KAJCXoRPS5tZNFWjfbKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="154992961"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Jun 2025 15:28:43 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uS1Gq-000KEQ-24;
	Wed, 18 Jun 2025 22:28:40 +0000
Date: Thu, 19 Jun 2025 06:28:33 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 f4b048a6a34af9ad14a3a4a82902748f6cea6872
Message-ID: <202506190623.UAUR3FOt-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: f4b048a6a34af9ad14a3a4a82902748f6cea6872  Input: apple_z2 - drop default ARCH_APPLE in Kconfig

elapsed time: 1411m

configs tested: 321
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250618    gcc-11.5.0
arc                   randconfig-001-20250619    gcc-15.1.0
arc                   randconfig-002-20250618    gcc-11.5.0
arc                   randconfig-002-20250618    gcc-15.1.0
arc                   randconfig-002-20250619    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                         at91_dt_defconfig    clang-21
arm                                 defconfig    gcc-15.1.0
arm                            hisi_defconfig    gcc-15.1.0
arm                        multi_v7_defconfig    clang-21
arm                        neponset_defconfig    gcc-15.1.0
arm                          pxa3xx_defconfig    clang-21
arm                          pxa3xx_defconfig    gcc-15.1.0
arm                          pxa910_defconfig    clang-21
arm                   randconfig-001-20250618    gcc-11.5.0
arm                   randconfig-001-20250618    gcc-15.1.0
arm                   randconfig-001-20250619    gcc-15.1.0
arm                   randconfig-002-20250618    gcc-10.5.0
arm                   randconfig-002-20250618    gcc-11.5.0
arm                   randconfig-002-20250619    gcc-15.1.0
arm                   randconfig-003-20250618    clang-21
arm                   randconfig-003-20250618    gcc-11.5.0
arm                   randconfig-003-20250619    gcc-15.1.0
arm                   randconfig-004-20250618    gcc-11.5.0
arm                   randconfig-004-20250619    gcc-15.1.0
arm                       spear13xx_defconfig    gcc-15.1.0
arm                           stm32_defconfig    clang-21
arm                        vexpress_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250618    clang-21
arm64                 randconfig-001-20250618    gcc-11.5.0
arm64                 randconfig-001-20250619    gcc-15.1.0
arm64                 randconfig-002-20250618    clang-21
arm64                 randconfig-002-20250618    gcc-11.5.0
arm64                 randconfig-002-20250619    gcc-15.1.0
arm64                 randconfig-003-20250618    gcc-11.5.0
arm64                 randconfig-003-20250618    gcc-14.3.0
arm64                 randconfig-003-20250619    gcc-15.1.0
arm64                 randconfig-004-20250618    clang-16
arm64                 randconfig-004-20250618    gcc-11.5.0
arm64                 randconfig-004-20250619    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250618    gcc-13.3.0
csky                  randconfig-001-20250618    gcc-8.5.0
csky                  randconfig-001-20250619    gcc-8.5.0
csky                  randconfig-002-20250618    gcc-15.1.0
csky                  randconfig-002-20250618    gcc-8.5.0
csky                  randconfig-002-20250619    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250618    clang-19
hexagon               randconfig-001-20250618    gcc-8.5.0
hexagon               randconfig-001-20250619    gcc-8.5.0
hexagon               randconfig-002-20250618    clang-16
hexagon               randconfig-002-20250618    gcc-8.5.0
hexagon               randconfig-002-20250619    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250618    clang-20
i386        buildonly-randconfig-001-20250619    clang-20
i386        buildonly-randconfig-002-20250618    clang-20
i386        buildonly-randconfig-002-20250618    gcc-12
i386        buildonly-randconfig-002-20250619    clang-20
i386        buildonly-randconfig-003-20250618    clang-20
i386        buildonly-randconfig-003-20250619    clang-20
i386        buildonly-randconfig-004-20250618    clang-20
i386        buildonly-randconfig-004-20250619    clang-20
i386        buildonly-randconfig-005-20250618    clang-20
i386        buildonly-randconfig-005-20250619    clang-20
i386        buildonly-randconfig-006-20250618    clang-20
i386        buildonly-randconfig-006-20250619    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250618    gcc-12
i386                  randconfig-001-20250619    gcc-12
i386                  randconfig-002-20250618    gcc-12
i386                  randconfig-002-20250619    gcc-12
i386                  randconfig-003-20250618    gcc-12
i386                  randconfig-003-20250619    gcc-12
i386                  randconfig-004-20250618    gcc-12
i386                  randconfig-004-20250619    gcc-12
i386                  randconfig-005-20250618    gcc-12
i386                  randconfig-005-20250619    gcc-12
i386                  randconfig-006-20250618    gcc-12
i386                  randconfig-006-20250619    gcc-12
i386                  randconfig-007-20250618    gcc-12
i386                  randconfig-007-20250619    gcc-12
i386                  randconfig-011-20250618    gcc-12
i386                  randconfig-011-20250619    clang-20
i386                  randconfig-012-20250618    gcc-12
i386                  randconfig-012-20250619    clang-20
i386                  randconfig-013-20250618    gcc-12
i386                  randconfig-013-20250619    clang-20
i386                  randconfig-014-20250618    gcc-12
i386                  randconfig-014-20250619    clang-20
i386                  randconfig-015-20250618    gcc-12
i386                  randconfig-015-20250619    clang-20
i386                  randconfig-016-20250618    gcc-12
i386                  randconfig-016-20250619    clang-20
i386                  randconfig-017-20250618    gcc-12
i386                  randconfig-017-20250619    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250618    gcc-15.1.0
loongarch             randconfig-001-20250618    gcc-8.5.0
loongarch             randconfig-001-20250619    gcc-8.5.0
loongarch             randconfig-002-20250618    gcc-15.1.0
loongarch             randconfig-002-20250618    gcc-8.5.0
loongarch             randconfig-002-20250619    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5208evb_defconfig    gcc-15.1.0
m68k                        mvme147_defconfig    gcc-15.1.0
m68k                          sun3x_defconfig    gcc-15.1.0
microblaze                       alldefconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         db1xxx_defconfig    gcc-15.1.0
mips                           ip28_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250618    gcc-11.5.0
nios2                 randconfig-001-20250618    gcc-8.5.0
nios2                 randconfig-001-20250619    gcc-8.5.0
nios2                 randconfig-002-20250618    gcc-7.5.0
nios2                 randconfig-002-20250618    gcc-8.5.0
nios2                 randconfig-002-20250619    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                       virt_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250618    gcc-10.5.0
parisc                randconfig-001-20250618    gcc-8.5.0
parisc                randconfig-001-20250619    gcc-8.5.0
parisc                randconfig-002-20250618    gcc-8.5.0
parisc                randconfig-002-20250619    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   currituck_defconfig    gcc-15.1.0
powerpc                       holly_defconfig    clang-21
powerpc               randconfig-001-20250618    gcc-7.5.0
powerpc               randconfig-001-20250618    gcc-8.5.0
powerpc               randconfig-001-20250619    gcc-8.5.0
powerpc               randconfig-002-20250618    clang-19
powerpc               randconfig-002-20250618    gcc-8.5.0
powerpc               randconfig-002-20250619    gcc-8.5.0
powerpc               randconfig-003-20250618    clang-21
powerpc               randconfig-003-20250618    gcc-8.5.0
powerpc               randconfig-003-20250619    gcc-8.5.0
powerpc                     tqm8560_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250618    gcc-6.5.0
powerpc64             randconfig-001-20250618    gcc-8.5.0
powerpc64             randconfig-001-20250619    gcc-8.5.0
powerpc64             randconfig-002-20250618    clang-21
powerpc64             randconfig-002-20250618    gcc-8.5.0
powerpc64             randconfig-002-20250619    gcc-8.5.0
powerpc64             randconfig-003-20250619    gcc-8.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250618    clang-20
riscv                 randconfig-001-20250618    gcc-15.1.0
riscv                 randconfig-001-20250619    gcc-9.3.0
riscv                 randconfig-002-20250618    clang-21
riscv                 randconfig-002-20250618    gcc-15.1.0
riscv                 randconfig-002-20250619    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250618    gcc-15.1.0
s390                  randconfig-001-20250618    gcc-6.5.0
s390                  randconfig-001-20250619    gcc-9.3.0
s390                  randconfig-002-20250618    gcc-15.1.0
s390                  randconfig-002-20250619    gcc-9.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                     magicpanelr2_defconfig    gcc-15.1.0
sh                    randconfig-001-20250618    gcc-15.1.0
sh                    randconfig-001-20250618    gcc-7.5.0
sh                    randconfig-001-20250619    gcc-9.3.0
sh                    randconfig-002-20250618    gcc-15.1.0
sh                    randconfig-002-20250619    gcc-9.3.0
sh                          sdk7780_defconfig    gcc-15.1.0
sh                           se7206_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250618    gcc-15.1.0
sparc                 randconfig-001-20250618    gcc-6.5.0
sparc                 randconfig-001-20250619    gcc-9.3.0
sparc                 randconfig-002-20250618    gcc-13.3.0
sparc                 randconfig-002-20250618    gcc-15.1.0
sparc                 randconfig-002-20250619    gcc-9.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250618    gcc-13.3.0
sparc64               randconfig-001-20250618    gcc-15.1.0
sparc64               randconfig-001-20250619    gcc-9.3.0
sparc64               randconfig-002-20250618    gcc-15.1.0
sparc64               randconfig-002-20250618    gcc-5.5.0
sparc64               randconfig-002-20250619    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250618    clang-21
um                    randconfig-001-20250618    gcc-15.1.0
um                    randconfig-001-20250619    gcc-9.3.0
um                    randconfig-002-20250618    clang-21
um                    randconfig-002-20250618    gcc-15.1.0
um                    randconfig-002-20250619    gcc-9.3.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250618    clang-20
x86_64      buildonly-randconfig-001-20250618    gcc-12
x86_64      buildonly-randconfig-001-20250619    gcc-12
x86_64      buildonly-randconfig-002-20250618    clang-20
x86_64      buildonly-randconfig-002-20250618    gcc-12
x86_64      buildonly-randconfig-002-20250619    gcc-12
x86_64      buildonly-randconfig-003-20250618    gcc-12
x86_64      buildonly-randconfig-003-20250619    gcc-12
x86_64      buildonly-randconfig-004-20250618    clang-20
x86_64      buildonly-randconfig-004-20250618    gcc-12
x86_64      buildonly-randconfig-004-20250619    gcc-12
x86_64      buildonly-randconfig-005-20250618    clang-20
x86_64      buildonly-randconfig-005-20250618    gcc-12
x86_64      buildonly-randconfig-005-20250619    gcc-12
x86_64      buildonly-randconfig-006-20250618    gcc-12
x86_64      buildonly-randconfig-006-20250619    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250618    gcc-12
x86_64                randconfig-001-20250619    gcc-11
x86_64                randconfig-002-20250618    gcc-12
x86_64                randconfig-002-20250619    gcc-11
x86_64                randconfig-003-20250618    gcc-12
x86_64                randconfig-003-20250619    gcc-11
x86_64                randconfig-004-20250618    gcc-12
x86_64                randconfig-004-20250619    gcc-11
x86_64                randconfig-005-20250618    gcc-12
x86_64                randconfig-005-20250619    gcc-11
x86_64                randconfig-006-20250618    gcc-12
x86_64                randconfig-006-20250619    gcc-11
x86_64                randconfig-007-20250618    gcc-12
x86_64                randconfig-007-20250619    gcc-11
x86_64                randconfig-008-20250618    gcc-12
x86_64                randconfig-008-20250619    gcc-11
x86_64                randconfig-071-20250618    clang-20
x86_64                randconfig-071-20250619    clang-20
x86_64                randconfig-072-20250618    clang-20
x86_64                randconfig-072-20250619    clang-20
x86_64                randconfig-073-20250618    clang-20
x86_64                randconfig-073-20250619    clang-20
x86_64                randconfig-074-20250618    clang-20
x86_64                randconfig-074-20250619    clang-20
x86_64                randconfig-075-20250618    clang-20
x86_64                randconfig-075-20250619    clang-20
x86_64                randconfig-076-20250618    clang-20
x86_64                randconfig-076-20250619    clang-20
x86_64                randconfig-077-20250618    clang-20
x86_64                randconfig-077-20250619    clang-20
x86_64                randconfig-078-20250618    clang-20
x86_64                randconfig-078-20250619    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250618    gcc-13.3.0
xtensa                randconfig-001-20250618    gcc-15.1.0
xtensa                randconfig-001-20250619    gcc-9.3.0
xtensa                randconfig-002-20250618    gcc-11.5.0
xtensa                randconfig-002-20250618    gcc-15.1.0
xtensa                randconfig-002-20250619    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

