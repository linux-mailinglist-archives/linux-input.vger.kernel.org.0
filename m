Return-Path: <linux-input+bounces-3962-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3858D425E
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 02:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2E0A1C20D93
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 00:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA49C848A;
	Thu, 30 May 2024 00:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LfK8UdPB"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37F579F3
	for <linux-input@vger.kernel.org>; Thu, 30 May 2024 00:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717028979; cv=none; b=ljHO62d3vo0uyhXPdwPOV/rcbbUbqi8bbrZAhXXqJUPS4oFT9q9Yg/Wxhe1I65Qbot26Nrn/eU92j4gro/zopzWYvQO/miXEDZPHfR10LL5hhqvbhVq0lqJKjAFeqjLVeN4FQLBIRgMorvD3gQIFgN5jEyvL4wvvGfOMFlJp+xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717028979; c=relaxed/simple;
	bh=OUPvguAYr5P3otcBnRtEAheoXJRkZl3aJsglRbQRagg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HifqI/GMO2neWs0Al1eq+LWjNFX8UxI6SJrEPNYSSe55huOmxaldJcu7i6rZVEnfknsc0Xl4wsmOLNes0wnuq6y8wmVXeujeQqLKaCyWJi+Sg0c3H3PKoGbQiM3f13NfIQX4BbAZLB0q960dVLikXDn0DMQMuEVY/HQQwYNTZpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LfK8UdPB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717028978; x=1748564978;
  h=date:from:to:cc:subject:message-id;
  bh=OUPvguAYr5P3otcBnRtEAheoXJRkZl3aJsglRbQRagg=;
  b=LfK8UdPBI6eUvxfKxXt4hwqqKwYTFec92pjBBHopu0Cii4A1LHiVyeax
   NM0lUbW55vWSS+n9Amp+Kzx9YMo6Uhpurs7Gek+r1T8GVo6SojxapyvtI
   +K7CpvTmrZd4UTUV6YEqDGWUgLjvCwFiJpO/iz01N049dnqFFN8cinRRF
   m90PCZwsN5u+Fj1yQoadQrg/AUTeByMSR0XmebtyCoIAnG8zg2J8OBTu8
   GvGTGFRgbyZKNDLnWa5KzM2aQjN0kPcLYKpfCtuVXJgnpo8bcpcuROVxQ
   u8YrrzaWjvEYSLKK0NcHimobJdWeIPf8IKerMACF0c6kqrANu6W/ESwvf
   Q==;
X-CSE-ConnectionGUID: 4wxaXA61Q8u6jdjdhBPubA==
X-CSE-MsgGUID: TbZddZgZQbGAw6UcbM8tKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24127831"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="24127831"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 17:29:37 -0700
X-CSE-ConnectionGUID: qdGx6I19R1ORhIm/9wDxkQ==
X-CSE-MsgGUID: sgc/sDqbQ7WS9nmy6Zebzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="36095011"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 May 2024 17:29:36 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCTfh-000EMf-0A;
	Thu, 30 May 2024 00:29:33 +0000
Date: Thu, 30 May 2024 08:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 6f47c7ae8c7afaf9ad291d39f0d3974f191a7946
Message-ID: <202405300826.kCvtIgOX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 6f47c7ae8c7afaf9ad291d39f0d3974f191a7946  Merge tag 'v6.9' into next

elapsed time: 1452m

configs tested: 230
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20240529   gcc  
arc                   randconfig-001-20240530   gcc  
arc                   randconfig-002-20240529   gcc  
arc                   randconfig-002-20240530   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         bcm2835_defconfig   clang
arm                                 defconfig   clang
arm                            hisi_defconfig   gcc  
arm                       netwinder_defconfig   gcc  
arm                   randconfig-001-20240529   gcc  
arm                   randconfig-002-20240529   gcc  
arm                   randconfig-002-20240530   gcc  
arm                   randconfig-003-20240529   gcc  
arm                   randconfig-004-20240529   gcc  
arm                   randconfig-004-20240530   gcc  
arm                        spear3xx_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240529   clang
arm64                 randconfig-002-20240529   clang
arm64                 randconfig-002-20240530   gcc  
arm64                 randconfig-003-20240529   gcc  
arm64                 randconfig-003-20240530   gcc  
arm64                 randconfig-004-20240529   gcc  
csky                             allmodconfig   gcc  
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
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                            mac_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   clang
mips                  decstation_64_defconfig   gcc  
mips                     loongson1c_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                          rb532_defconfig   clang
mips                   sb1250_swarm_defconfig   gcc  
mips                           xway_defconfig   clang
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
powerpc                    klondike_defconfig   gcc  
powerpc                       maple_defconfig   clang
powerpc                     mpc83xx_defconfig   clang
powerpc                      obs600_defconfig   clang
powerpc                     ppa8548_defconfig   gcc  
powerpc                      ppc44x_defconfig   clang
powerpc               randconfig-001-20240529   clang
powerpc               randconfig-001-20240530   gcc  
powerpc               randconfig-002-20240529   clang
powerpc               randconfig-003-20240529   clang
powerpc               randconfig-003-20240530   gcc  
powerpc                    socrates_defconfig   gcc  
powerpc64             randconfig-001-20240529   gcc  
powerpc64             randconfig-001-20240530   gcc  
powerpc64             randconfig-002-20240529   clang
powerpc64             randconfig-003-20240529   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240529   gcc  
riscv                 randconfig-002-20240529   clang
riscv                 randconfig-002-20240530   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240529   clang
s390                  randconfig-002-20240529   gcc  
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240529   gcc  
sh                    randconfig-001-20240530   gcc  
sh                    randconfig-002-20240529   gcc  
sh                    randconfig-002-20240530   gcc  
sh                      rts7751r2d1_defconfig   gcc  
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
x86_64                randconfig-076-20240529   clang
x86_64                randconfig-076-20240530   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240529   gcc  
xtensa                randconfig-001-20240530   gcc  
xtensa                randconfig-002-20240529   gcc  
xtensa                randconfig-002-20240530   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

