Return-Path: <linux-input+bounces-5276-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6129453DB
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2024 22:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF7F81C21B14
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2024 20:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E796F14AD25;
	Thu,  1 Aug 2024 20:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUFNVYDC"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001C713C901
	for <linux-input@vger.kernel.org>; Thu,  1 Aug 2024 20:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722545638; cv=none; b=gtyxNCgmEraBp/Zg8ZDmgPkdKNlrGHfkWKZtt47WcW99Obcm98j2bPJn4SS3dN465QSUp+/rmIQYkBdSTTO1dJYNYu9hC78enxiUO9QwWtQZ9rqH1rMzEIMaICJwwXXP01T9tuW+UWVFWbOEIoA/iE/FjNS0sbC6jOCD1pRa/pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722545638; c=relaxed/simple;
	bh=yr5xEARyNhqOuhaEBo5IcvC7TeFno47lPk22+9hoQ98=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XTVQZXivn9TSjqVN3+DEC8i2WmXXBcmc0R0TUNTG8qotSHE/RQJYeorbCoZFE8ivGY9VTdCZEgICmcsdZdrIhPuisFaHVJMNW3bkA8ymMoNWndwtCmDy5DaiT+u2Hqmuc3yUPGtgxLHmLlEy6JG9rlyNYQ9aHbOGRk+Ed3+xrMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUFNVYDC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722545637; x=1754081637;
  h=date:from:to:cc:subject:message-id;
  bh=yr5xEARyNhqOuhaEBo5IcvC7TeFno47lPk22+9hoQ98=;
  b=RUFNVYDCEgEga0Y6HWTPxdo0D7+qb5L2rV1KDqt1HVBRUR+/5QU7BQgK
   DN4IfFVnCjeikMRWSjJno6IWGzSTaLYnQFeyuYE9vTRzKvBpZ+sdD4vir
   SuPPbN6D1iaKdWONRYi9LLbECdOjlXK9hnJ8SLiAOgCrN5nZd0oDehd16
   gksqWkFSF9rwSgvXBQDAZInxh8xpxVR+zynK/+WB9Yf2iw6ge6MxkVbYG
   6gPcIa/u/4NuHOzCnVwGkFUwuzouy4ej/Exo4OMHxNQd5AdaX665OjHDt
   etts9r6qiLVcQe9HU3ECzSlrJImIGUiQL7gGRB/njWl0v4nCusppdpXyC
   g==;
X-CSE-ConnectionGUID: PMhsQf9BSaml8nN4PRylPQ==
X-CSE-MsgGUID: Jje107aBR2qmdosl8DU5gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="43054765"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; 
   d="scan'208";a="43054765"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 13:53:51 -0700
X-CSE-ConnectionGUID: qWbo3I8USOefnAjVK0L9VQ==
X-CSE-MsgGUID: Rq6JhklkQGK8NR/7W1P39A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; 
   d="scan'208";a="54839812"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Aug 2024 13:53:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZco0-000w1s-0W;
	Thu, 01 Aug 2024 20:53:48 +0000
Date: Fri, 02 Aug 2024 04:53:16 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 8bd2aa8529aca1f39bc2bfac4f68adc47c6bd1d7
Message-ID: <202408020413.jmP96WPH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 8bd2aa8529aca1f39bc2bfac4f68adc47c6bd1d7  Input: tc3589x - use of_property_present()

elapsed time: 1453m

configs tested: 219
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                         haps_hs_defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240801   gcc-13.2.0
arc                   randconfig-002-20240801   gcc-13.2.0
arc                        vdk_hs38_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                       aspeed_g5_defconfig   gcc-14.1.0
arm                        clps711x_defconfig   gcc-13.3.0
arm                     davinci_all_defconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                          ep93xx_defconfig   gcc-14.1.0
arm                       imx_v4_v5_defconfig   gcc-13.3.0
arm                      jornada720_defconfig   gcc-14.1.0
arm                        keystone_defconfig   gcc-14.1.0
arm                         nhk8815_defconfig   gcc-13.3.0
arm                             pxa_defconfig   gcc-14.1.0
arm                   randconfig-001-20240801   gcc-13.2.0
arm                   randconfig-002-20240801   gcc-13.2.0
arm                   randconfig-003-20240801   gcc-13.2.0
arm                   randconfig-004-20240801   gcc-13.2.0
arm                        shmobile_defconfig   gcc-14.1.0
arm                          sp7021_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240801   gcc-13.2.0
arm64                 randconfig-002-20240801   gcc-13.2.0
arm64                 randconfig-003-20240801   gcc-13.2.0
arm64                 randconfig-004-20240801   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240801   gcc-13.2.0
csky                  randconfig-002-20240801   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240801   gcc-9
i386         buildonly-randconfig-002-20240801   gcc-9
i386         buildonly-randconfig-003-20240801   gcc-9
i386         buildonly-randconfig-004-20240801   gcc-9
i386         buildonly-randconfig-005-20240801   gcc-9
i386         buildonly-randconfig-006-20240801   gcc-9
i386                                defconfig   clang-18
i386                  randconfig-001-20240801   gcc-9
i386                  randconfig-002-20240801   gcc-9
i386                  randconfig-003-20240801   gcc-9
i386                  randconfig-004-20240801   gcc-9
i386                  randconfig-005-20240801   gcc-9
i386                  randconfig-006-20240801   gcc-9
i386                  randconfig-011-20240801   gcc-9
i386                  randconfig-012-20240801   gcc-9
i386                  randconfig-013-20240801   gcc-9
i386                  randconfig-014-20240801   gcc-9
i386                  randconfig-015-20240801   gcc-9
i386                  randconfig-016-20240801   gcc-9
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240801   gcc-13.2.0
loongarch             randconfig-002-20240801   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          amiga_defconfig   gcc-14.1.0
m68k                          atari_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                        mvme147_defconfig   gcc-13.3.0
m68k                        mvme16x_defconfig   gcc-13.2.0
m68k                        stmark2_defconfig   gcc-13.3.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                        bcm63xx_defconfig   gcc-13.3.0
mips                      bmips_stb_defconfig   gcc-13.2.0
mips                           ci20_defconfig   gcc-14.1.0
mips                          eyeq5_defconfig   gcc-14.1.0
mips                           jazz_defconfig   gcc-14.1.0
mips                     loongson1c_defconfig   gcc-13.2.0
mips                      maltaaprp_defconfig   gcc-13.3.0
mips                        maltaup_defconfig   gcc-14.1.0
mips                           mtx1_defconfig   gcc-13.3.0
mips                           mtx1_defconfig   gcc-14.1.0
mips                         rt305x_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240801   gcc-13.2.0
nios2                 randconfig-002-20240801   gcc-13.2.0
openrisc                         alldefconfig   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240801   gcc-13.2.0
parisc                randconfig-002-20240801   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                   bluestone_defconfig   gcc-13.2.0
powerpc                      cm5200_defconfig   gcc-13.2.0
powerpc                        fsp2_defconfig   gcc-13.3.0
powerpc                       holly_defconfig   gcc-13.2.0
powerpc                        icon_defconfig   gcc-14.1.0
powerpc                     kmeter1_defconfig   gcc-13.3.0
powerpc                 linkstation_defconfig   gcc-13.2.0
powerpc                      mgcoge_defconfig   gcc-13.2.0
powerpc                 mpc834x_itx_defconfig   gcc-14.1.0
powerpc               mpc834x_itxgp_defconfig   gcc-13.3.0
powerpc                      pcm030_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240801   gcc-13.2.0
powerpc               randconfig-002-20240801   gcc-13.2.0
powerpc               randconfig-003-20240801   gcc-13.2.0
powerpc                    sam440ep_defconfig   gcc-14.1.0
powerpc                    socrates_defconfig   gcc-13.2.0
powerpc                     tqm5200_defconfig   gcc-14.1.0
powerpc                     tqm8540_defconfig   gcc-14.1.0
powerpc64             randconfig-001-20240801   gcc-13.2.0
powerpc64             randconfig-002-20240801   gcc-13.2.0
powerpc64             randconfig-003-20240801   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_virt_defconfig   gcc-14.1.0
riscv                 randconfig-001-20240801   gcc-13.2.0
riscv                 randconfig-002-20240801   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240801   gcc-13.2.0
s390                  randconfig-002-20240801   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                         apsh4a3a_defconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                ecovec24-romimage_defconfig   gcc-14.1.0
sh                         ecovec24_defconfig   gcc-13.2.0
sh                            hp6xx_defconfig   gcc-13.3.0
sh                          r7785rp_defconfig   gcc-14.1.0
sh                    randconfig-001-20240801   gcc-13.2.0
sh                    randconfig-002-20240801   gcc-13.2.0
sh                   rts7751r2dplus_defconfig   gcc-13.3.0
sh                   rts7751r2dplus_defconfig   gcc-14.1.0
sh                           se7751_defconfig   gcc-14.1.0
sh                     sh7710voipgw_defconfig   gcc-13.3.0
sh                   sh7770_generic_defconfig   gcc-13.3.0
sh                          urquell_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc                       sparc64_defconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240801   gcc-13.2.0
sparc64               randconfig-002-20240801   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240801   gcc-13.2.0
um                    randconfig-002-20240801   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                           alldefconfig   gcc-13.3.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240801   clang-18
x86_64       buildonly-randconfig-002-20240801   clang-18
x86_64       buildonly-randconfig-003-20240801   clang-18
x86_64       buildonly-randconfig-004-20240801   clang-18
x86_64       buildonly-randconfig-005-20240801   clang-18
x86_64       buildonly-randconfig-006-20240801   clang-18
x86_64                              defconfig   clang-18
x86_64                                  kexec   clang-18
x86_64                randconfig-001-20240801   clang-18
x86_64                randconfig-002-20240801   clang-18
x86_64                randconfig-003-20240801   clang-18
x86_64                randconfig-004-20240801   clang-18
x86_64                randconfig-005-20240801   clang-18
x86_64                randconfig-006-20240801   clang-18
x86_64                randconfig-011-20240801   clang-18
x86_64                randconfig-012-20240801   clang-18
x86_64                randconfig-013-20240801   clang-18
x86_64                randconfig-014-20240801   clang-18
x86_64                randconfig-015-20240801   clang-18
x86_64                randconfig-016-20240801   clang-18
x86_64                randconfig-071-20240801   clang-18
x86_64                randconfig-072-20240801   clang-18
x86_64                randconfig-073-20240801   clang-18
x86_64                randconfig-074-20240801   clang-18
x86_64                randconfig-075-20240801   clang-18
x86_64                randconfig-076-20240801   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                           alldefconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-13.2.0
xtensa                          iss_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240801   gcc-13.2.0
xtensa                randconfig-002-20240801   gcc-13.2.0
xtensa                    smp_lx200_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

