Return-Path: <linux-input+bounces-3800-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9568CDA24
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 20:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07A931C2198C
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 18:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E9D2C694;
	Thu, 23 May 2024 18:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJ97QJn6"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5401A849C
	for <linux-input@vger.kernel.org>; Thu, 23 May 2024 18:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716489940; cv=none; b=LPQRkTH9//hrsUu3U1rLd8tXDYZJFh+IDKmx4AsjvysBsq1CCYRwojQ9VZW5ssalz4SQ9N2p0dhocR1wnqY0IyJHLRAzfMHoWk3rKKbVQqbM17JPEvidD3m4LT5XeN+4sWpAr8hfo6E2RhAMd0f/MGsZ/e1DiyHrUezfZSwA/Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716489940; c=relaxed/simple;
	bh=G2Otw1GMa7zXBTsrwJmSGddalMNPo5L7+A0LBqF1+j8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N5T3uwuumjJ0fF2NDf2SiVpyoPDpJrlYHxcbspA72Lre8wdGgw7vQK0YPa0GZJBKiE6cB5s7lILfXEIymsq/8YpdsuNWCOxJjh5mdgUIAZK/ZcoJ8D+Rted5QH6xAWr5C7OvXY5ph7cDQIOaJf0zBGQTMvXXhZOs53sd3rwpXBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJ97QJn6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716489938; x=1748025938;
  h=date:from:to:cc:subject:message-id;
  bh=G2Otw1GMa7zXBTsrwJmSGddalMNPo5L7+A0LBqF1+j8=;
  b=AJ97QJn6SRYaYbpG4aK/xDpBTtczdvqg6nTe844O3/0bcXbEmsOiXtrT
   W+DxtHpIQ/3d1l7V1/d6dOt/9o6aukrZxF8jZ3HiO7aYBac9hAZo2b7hQ
   0p57wXG9Z3dBf+HOKyIWvCxm9ArWJV47ZwNqw7wYtAmGtWGlIZCbHVaJK
   rQtIaAexMCOXBtcp8iwl3F4QXPbcv7DQRBCXFfH7n/XlbR8UFzMD+3rPZ
   VdCyR/1JNKx/vBTLLmG4YPURDLfDxsseKPqJySm6UonBhnPJS9L1VScjs
   xUQo3DK+xqAJGkxn4evWejDb5c6f44/IoSJWOuR+GivWn7Iu/L7YkFqpB
   g==;
X-CSE-ConnectionGUID: on/gPAEeRpiX2ag5GQ/oQQ==
X-CSE-MsgGUID: aVtEvaYoTHOFqZG8NzXWIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="23405062"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="23405062"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 11:45:38 -0700
X-CSE-ConnectionGUID: Rd0yFSCMQqCKXEs+9PkKFQ==
X-CSE-MsgGUID: PbeFra4OR56J0vq+amETrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="33865542"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 May 2024 11:45:37 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sADRW-0003Ev-1J;
	Thu, 23 May 2024 18:45:34 +0000
Date: Fri, 24 May 2024 02:44:52 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 2ec0028a1cadfb88d912435c1eb1ac5de76071f0
Message-ID: <202405240250.LP3VIFQz-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 2ec0028a1cadfb88d912435c1eb1ac5de76071f0  Merge branch 'next' into for-linus

elapsed time: 1041m

configs tested: 161
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                   randconfig-001-20240523   gcc  
arc                   randconfig-002-20240523   gcc  
arm                              alldefconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240523   gcc  
arm                   randconfig-002-20240523   gcc  
arm                   randconfig-003-20240523   gcc  
arm                   randconfig-004-20240523   gcc  
arm                          sp7021_defconfig   gcc  
arm                           spitz_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-002-20240523   gcc  
arm64                 randconfig-004-20240523   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240523   gcc  
csky                  randconfig-002-20240523   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240523   clang
i386         buildonly-randconfig-002-20240523   gcc  
i386         buildonly-randconfig-003-20240523   clang
i386         buildonly-randconfig-004-20240523   clang
i386         buildonly-randconfig-005-20240523   clang
i386         buildonly-randconfig-006-20240523   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240523   gcc  
i386                  randconfig-002-20240523   clang
i386                  randconfig-003-20240523   clang
i386                  randconfig-004-20240523   clang
i386                  randconfig-005-20240523   gcc  
i386                  randconfig-006-20240523   clang
i386                  randconfig-011-20240523   gcc  
i386                  randconfig-012-20240523   clang
i386                  randconfig-013-20240523   clang
i386                  randconfig-014-20240523   gcc  
i386                  randconfig-015-20240523   gcc  
i386                  randconfig-016-20240523   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240523   gcc  
loongarch             randconfig-002-20240523   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1830-neo_defconfig   gcc  
mips                       rbtx49xx_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240523   gcc  
nios2                 randconfig-002-20240523   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20240523   gcc  
parisc                randconfig-002-20240523   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240523   gcc  
powerpc               randconfig-002-20240523   gcc  
powerpc               randconfig-003-20240523   gcc  
powerpc                     tqm8540_defconfig   gcc  
powerpc64             randconfig-001-20240523   gcc  
powerpc64             randconfig-002-20240523   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-002-20240523   gcc  
riscv                          rv32_defconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240523   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                    randconfig-001-20240523   gcc  
sh                    randconfig-002-20240523   gcc  
sh                           se7751_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240523   gcc  
sparc64               randconfig-002-20240523   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-004-20240523   clang
x86_64       buildonly-randconfig-005-20240523   clang
x86_64       buildonly-randconfig-006-20240523   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-002-20240523   clang
x86_64                randconfig-003-20240523   clang
x86_64                randconfig-004-20240523   clang
x86_64                randconfig-005-20240523   clang
x86_64                randconfig-006-20240523   clang
x86_64                randconfig-011-20240523   clang
x86_64                randconfig-013-20240523   clang
x86_64                randconfig-014-20240523   clang
x86_64                randconfig-016-20240523   clang
x86_64                randconfig-076-20240523   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240523   gcc  
xtensa                randconfig-002-20240523   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

