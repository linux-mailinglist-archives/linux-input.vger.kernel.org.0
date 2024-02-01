Return-Path: <linux-input+bounces-1611-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A51838455FC
	for <lists+linux-input@lfdr.de>; Thu,  1 Feb 2024 12:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 183521F2A128
	for <lists+linux-input@lfdr.de>; Thu,  1 Feb 2024 11:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89BC3A1C3;
	Thu,  1 Feb 2024 11:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwHEMFoc"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A048F158D9A
	for <linux-input@vger.kernel.org>; Thu,  1 Feb 2024 11:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706785724; cv=none; b=ElSzqPnS+abggDKuShRgsQGz+xlONTOPKXFkiF3GF/zZqHxK9nVk+WlEsY93muOPD/FFwVUGjdBr2lTj07aDTjkJHmCRcvXy7vXjH4f6h4AHoAmhZPdRLlXHB108S9S/m08XLQdctcMCXFY+62+yxLYc5YKzjz1Pd+eLwFEry3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706785724; c=relaxed/simple;
	bh=uzH1Q3Ag/jB5qKkMBcy4uvtsa6gYSx3l7Y8SnOrIroA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tilB4oCQ+DVMzz7rLx/l0tuXK4+L5yTBm0RoWu+bMB5jWGwYIy91C96FyH1qczOMbyey01j8xoun6cDJmJVagyHSdOSnGYWmVqMV0bprJIBjROVXn6ZdSPzlW+lMHup4CMwr296J5B/zWQ8kccIhaDRBiExZGtBYwPA4S1RvijE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwHEMFoc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706785723; x=1738321723;
  h=date:from:to:cc:subject:message-id;
  bh=uzH1Q3Ag/jB5qKkMBcy4uvtsa6gYSx3l7Y8SnOrIroA=;
  b=mwHEMFocQnpazp26xlujusXbLavl7Os3V53kt+j/epl/f1qktTMbIvFa
   /q9upahIUWMjUNzUHs1fuD3U6QK7nhMD5jZoExSioQRGQsg058rI5ty3i
   BIiG2XmvrMYJvMa49nq8Q9rjeQHCjNiJsT21gH2pnC7gOou6wKlPq4v/P
   jMF4eheYDsw1KdzCxDKywwufMPuaU6ABF1sj4QG0EhfKk8cz9vZcSF9k3
   ezYL39xml0RTiVSv8nN4tDovzXVmAsEGBxquQaq/mIZrGMlQh0Kw+Ieqn
   QvkQYNvuTY6s7iHcpxKCCK/8olUiQNGOcU2YyewGyCBx5ivbRYQptdYMy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="67928"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="67928"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 03:08:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4396015"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Feb 2024 03:08:41 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVUvu-0002hq-0Y;
	Thu, 01 Feb 2024 11:08:38 +0000
Date: Thu, 01 Feb 2024 19:08:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 2b9c3eb32a699acdd4784d6b93743271b4970899
Message-ID: <202402011908.tox3y4rQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 2b9c3eb32a699acdd4784d6b93743271b4970899  Input: bcm5974 - check endpoint type before starting traffic

elapsed time: 956m

configs tested: 163
configs skipped: 2

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
arc                   randconfig-001-20240201   gcc  
arc                   randconfig-002-20240201   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240201   gcc  
arm                   randconfig-002-20240201   clang
arm                   randconfig-002-20240201   gcc  
arm                   randconfig-003-20240201   gcc  
arm                   randconfig-004-20240201   clang
arm                   randconfig-004-20240201   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240201   gcc  
arm64                 randconfig-002-20240201   clang
arm64                 randconfig-002-20240201   gcc  
arm64                 randconfig-003-20240201   gcc  
arm64                 randconfig-004-20240201   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240201   gcc  
csky                  randconfig-002-20240201   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240201   clang
hexagon               randconfig-002-20240201   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240201   gcc  
i386         buildonly-randconfig-002-20240201   gcc  
i386         buildonly-randconfig-003-20240201   gcc  
i386         buildonly-randconfig-004-20240201   gcc  
i386         buildonly-randconfig-005-20240201   gcc  
i386         buildonly-randconfig-006-20240201   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240201   gcc  
i386                  randconfig-002-20240201   gcc  
i386                  randconfig-003-20240201   gcc  
i386                  randconfig-004-20240201   gcc  
i386                  randconfig-005-20240201   gcc  
i386                  randconfig-006-20240201   gcc  
i386                  randconfig-011-20240201   clang
i386                  randconfig-012-20240201   clang
i386                  randconfig-013-20240201   clang
i386                  randconfig-014-20240201   clang
i386                  randconfig-015-20240201   clang
i386                  randconfig-016-20240201   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240201   gcc  
loongarch             randconfig-002-20240201   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240201   gcc  
nios2                 randconfig-002-20240201   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240201   gcc  
parisc                randconfig-002-20240201   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240201   clang
powerpc               randconfig-002-20240201   clang
powerpc               randconfig-003-20240201   gcc  
powerpc64             randconfig-001-20240201   clang
powerpc64             randconfig-002-20240201   clang
powerpc64             randconfig-003-20240201   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240201   gcc  
riscv                 randconfig-002-20240201   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240201   gcc  
s390                  randconfig-002-20240201   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240201   gcc  
sh                    randconfig-002-20240201   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240201   gcc  
sparc64               randconfig-002-20240201   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240201   gcc  
um                    randconfig-002-20240201   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240201   gcc  
x86_64       buildonly-randconfig-002-20240201   gcc  
x86_64       buildonly-randconfig-003-20240201   gcc  
x86_64       buildonly-randconfig-004-20240201   gcc  
x86_64       buildonly-randconfig-005-20240201   gcc  
x86_64       buildonly-randconfig-006-20240201   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240201   clang
x86_64                randconfig-002-20240201   clang
x86_64                randconfig-003-20240201   clang
x86_64                randconfig-004-20240201   clang
x86_64                randconfig-005-20240201   clang
x86_64                randconfig-006-20240201   clang
x86_64                randconfig-011-20240201   gcc  
x86_64                randconfig-012-20240201   gcc  
x86_64                randconfig-013-20240201   gcc  
x86_64                randconfig-014-20240201   gcc  
x86_64                randconfig-015-20240201   gcc  
x86_64                randconfig-016-20240201   gcc  
x86_64                randconfig-071-20240201   gcc  
x86_64                randconfig-072-20240201   gcc  
x86_64                randconfig-073-20240201   gcc  
x86_64                randconfig-074-20240201   gcc  
x86_64                randconfig-075-20240201   gcc  
x86_64                randconfig-076-20240201   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240201   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

