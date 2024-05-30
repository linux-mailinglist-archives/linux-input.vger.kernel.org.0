Return-Path: <linux-input+bounces-3965-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DABC88D4298
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 02:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A0C01F21F67
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 00:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E298814;
	Thu, 30 May 2024 00:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgGFDdOX"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04A517545
	for <linux-input@vger.kernel.org>; Thu, 30 May 2024 00:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717030497; cv=none; b=oLFYYGYQ60VcVlEUIrdsXBepZKPxecr21GC1NZ9HutTLePP8bIwRmBhhzlTLHRZkSDEmL7JwS8cHVQhjmAnidszFfkIrR6PYCQgMjY4gWtVQNZCkQHH1EvSAJcXkdpicH3TA0kwSh+y0VJKfnIgL4wTP9rgR6YAydf7gR5O08rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717030497; c=relaxed/simple;
	bh=AsHkIm0wOPdRCZhCHc/pxZ7cIjzOg6zO0yPikftntJw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cFSqfCqZ09eHsVKPbQRauOSt2uDd5RMfqDV7Xh5YD/D+w87WgBNEd05aG5I6R1KQCpW8KQ438n+OWLW/f2e/S2zWIyxnRSm8Bpt0aem+LG/VKyAVpGxNBGQkLBV8v9P8r4XKV5Gc1rD6HD9sL6rs5IFbEw+brraragZq5rqCphs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgGFDdOX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717030495; x=1748566495;
  h=date:from:to:cc:subject:message-id;
  bh=AsHkIm0wOPdRCZhCHc/pxZ7cIjzOg6zO0yPikftntJw=;
  b=jgGFDdOXDC+ds4zhIfCdX2X3YVB8s2v6jg40TS7sOYEpU7YKFqjxt6iR
   Fn07tQu2lztQk6zy2iHHtEycWvSXqx5fGT0wnMJBm5L7ddM7cZV72suud
   lRkvtAV57NmpIYYrPMumM1amOzmd/94jggIBrxVfrOVZPFDC81nYd6WZb
   zONp5eCjnaJpL3HJNP0E9TKB6vq22CkVEsZYqz5r/JuMudLirJLbxmGhS
   0L3FIRGeUTyTlVUOnPbldgcmycsCb/Vqhhpp7RwwCElhkQoVnVOJriG95
   Fjj4KpOktWC/VjOoc2YZkWL6J644YwfyZI7duWP4W39kBHZ2K8UuyzI5w
   Q==;
X-CSE-ConnectionGUID: PGJAFxJZQxiYFbCy9iTfHA==
X-CSE-MsgGUID: HAuSvbRCTOGehEjwcxbTeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="30979038"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="30979038"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 17:54:55 -0700
X-CSE-ConnectionGUID: wPjbZua+SZKRNpjSkVLpOg==
X-CSE-MsgGUID: /zhatKJ8QpSrg6do/sry+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="40095137"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 May 2024 17:54:54 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCU3v-000ENx-17;
	Thu, 30 May 2024 00:54:50 +0000
Date: Thu, 30 May 2024 08:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 a69ce592cbe0417664bc5a075205aa75c2ec1273
Message-ID: <202405300825.lOxBP9iM-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: a69ce592cbe0417664bc5a075205aa75c2ec1273  Input: elantech - fix touchpad state on resume for Lenovo N24

elapsed time: 1477m

configs tested: 209
configs skipped: 7

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
arc                   randconfig-001-20240529   gcc  
arc                   randconfig-001-20240530   gcc  
arc                   randconfig-002-20240529   gcc  
arc                   randconfig-002-20240530   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          moxart_defconfig   gcc  
arm                   randconfig-001-20240529   gcc  
arm                   randconfig-002-20240529   gcc  
arm                   randconfig-002-20240530   gcc  
arm                   randconfig-003-20240529   gcc  
arm                   randconfig-004-20240529   gcc  
arm                   randconfig-004-20240530   gcc  
arm                             rpc_defconfig   clang
arm                       spear13xx_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240529   clang
arm64                 randconfig-002-20240529   clang
arm64                 randconfig-002-20240530   gcc  
arm64                 randconfig-003-20240529   gcc  
arm64                 randconfig-003-20240530   gcc  
arm64                 randconfig-004-20240529   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240529   gcc  
csky                  randconfig-001-20240530   gcc  
csky                  randconfig-002-20240529   gcc  
csky                  randconfig-002-20240530   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240529   clang
hexagon               randconfig-002-20240529   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240529   clang
i386         buildonly-randconfig-002-20240529   gcc  
i386         buildonly-randconfig-003-20240529   gcc  
i386         buildonly-randconfig-004-20240529   clang
i386         buildonly-randconfig-005-20240529   gcc  
i386         buildonly-randconfig-006-20240529   clang
i386                                defconfig   clang
i386                  randconfig-001-20240529   clang
i386                  randconfig-002-20240529   gcc  
i386                  randconfig-003-20240529   gcc  
i386                  randconfig-004-20240529   gcc  
i386                  randconfig-005-20240529   clang
i386                  randconfig-006-20240529   clang
i386                  randconfig-011-20240529   clang
i386                  randconfig-012-20240529   clang
i386                  randconfig-013-20240529   clang
i386                  randconfig-014-20240529   gcc  
i386                  randconfig-015-20240529   clang
i386                  randconfig-016-20240529   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240529   gcc  
loongarch             randconfig-001-20240530   gcc  
loongarch             randconfig-002-20240529   gcc  
loongarch             randconfig-002-20240530   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240529   gcc  
nios2                 randconfig-001-20240530   gcc  
nios2                 randconfig-002-20240529   gcc  
nios2                 randconfig-002-20240530   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240529   gcc  
parisc                randconfig-001-20240530   gcc  
parisc                randconfig-002-20240529   gcc  
parisc                randconfig-002-20240530   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 linkstation_defconfig   clang
powerpc                   lite5200b_defconfig   clang
powerpc               randconfig-001-20240529   clang
powerpc               randconfig-001-20240530   gcc  
powerpc               randconfig-002-20240529   clang
powerpc               randconfig-003-20240529   clang
powerpc               randconfig-003-20240530   gcc  
powerpc64             randconfig-001-20240529   gcc  
powerpc64             randconfig-001-20240530   gcc  
powerpc64             randconfig-002-20240529   clang
powerpc64             randconfig-003-20240529   clang
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
riscv                    nommu_virt_defconfig   clang
riscv                 randconfig-001-20240529   gcc  
riscv                 randconfig-002-20240529   clang
riscv                 randconfig-002-20240530   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240529   clang
s390                  randconfig-002-20240529   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                    randconfig-001-20240529   gcc  
sh                    randconfig-001-20240530   gcc  
sh                    randconfig-002-20240529   gcc  
sh                    randconfig-002-20240530   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240529   gcc  
sparc64               randconfig-001-20240530   gcc  
sparc64               randconfig-002-20240529   gcc  
sparc64               randconfig-002-20240530   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240529   clang
um                    randconfig-001-20240530   gcc  
um                    randconfig-002-20240529   gcc  
um                    randconfig-002-20240530   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240529   gcc  
x86_64       buildonly-randconfig-002-20240529   clang
x86_64       buildonly-randconfig-003-20240529   clang
x86_64       buildonly-randconfig-003-20240530   gcc  
x86_64       buildonly-randconfig-004-20240529   gcc  
x86_64       buildonly-randconfig-004-20240530   gcc  
x86_64       buildonly-randconfig-005-20240529   clang
x86_64       buildonly-randconfig-006-20240529   gcc  
x86_64       buildonly-randconfig-006-20240530   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240529   gcc  
x86_64                randconfig-002-20240529   clang
x86_64                randconfig-003-20240529   clang
x86_64                randconfig-004-20240529   clang
x86_64                randconfig-005-20240529   gcc  
x86_64                randconfig-006-20240529   gcc  
x86_64                randconfig-011-20240529   gcc  
x86_64                randconfig-012-20240529   gcc  
x86_64                randconfig-012-20240530   gcc  
x86_64                randconfig-013-20240529   clang
x86_64                randconfig-013-20240530   gcc  
x86_64                randconfig-014-20240529   gcc  
x86_64                randconfig-014-20240530   gcc  
x86_64                randconfig-015-20240529   gcc  
x86_64                randconfig-016-20240529   clang
x86_64                randconfig-016-20240530   gcc  
x86_64                randconfig-071-20240529   clang
x86_64                randconfig-072-20240529   gcc  
x86_64                randconfig-073-20240529   gcc  
x86_64                randconfig-074-20240529   clang
x86_64                randconfig-075-20240529   clang
x86_64                randconfig-075-20240530   gcc  
x86_64                randconfig-076-20240530   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20240529   gcc  
xtensa                randconfig-001-20240530   gcc  
xtensa                randconfig-002-20240529   gcc  
xtensa                randconfig-002-20240530   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

