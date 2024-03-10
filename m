Return-Path: <linux-input+bounces-2315-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C55287780E
	for <lists+linux-input@lfdr.de>; Sun, 10 Mar 2024 19:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 808701C20995
	for <lists+linux-input@lfdr.de>; Sun, 10 Mar 2024 18:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C8439FD3;
	Sun, 10 Mar 2024 18:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hZNMXVm8"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EA5200DD
	for <linux-input@vger.kernel.org>; Sun, 10 Mar 2024 18:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710096447; cv=none; b=IGesdOqTvRiopOZe1UDVmvDn6zrTuPUUD+bnGc5tR5eWxrSvDKccMxwS5fKy/ROFyvKg3TcZ9DoE3zhYqD/Vw8GlN3nXwBXpUgG4UhfFayx8Om77OpXx2o6lHJfcq6yvGwVsb2nYpZNDowN76Oxuf+GGiLFYwVgilu8Bgh0fRYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710096447; c=relaxed/simple;
	bh=diXx/Y7Pfc5AArQllbv+vMuBLKa7EVYdyvG1sNBWZr0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SKYvmQiSfS+FqqXemKUe26C3XkSNF4/YuYjxZxo/LqW5eiotB+TMOPKnCgTuuLljxAMQOAeRySbnD5yDOJjjsHZRSMukl79VLomGXFHf/Ol79uAy4bM99gIRvTbD0aASgv0XWQbi3euuzc5/tL+wRMGmWAMk6IWSUxtrAPpXaMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hZNMXVm8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710096445; x=1741632445;
  h=date:from:to:cc:subject:message-id;
  bh=diXx/Y7Pfc5AArQllbv+vMuBLKa7EVYdyvG1sNBWZr0=;
  b=hZNMXVm8SzYDpgiZfAe52c5UPCdbyWH4RT7qfmTFo7f17rPmFan10ueM
   vdhK9d0b3Pl8TXs6jMB5+Zp/2vO5/jZ/tulonBiZESKPd1mp4ARgoUOG6
   26iU43wuJzJkysdxCC9dd8DpWLBKsDKuNoH2P5jgY2KXMkVfZe2YBKDFS
   hrDF/Q/+SoVtselLQGb2680wvHjUREjz1m2cMlxIJ8pjgdayatRDQ/5M0
   17AtAiueT5CWSNMBBaqETzO8vDn2ki3CvD2mmsB9d15aeQvDZeBk43iiB
   lhKdueASa/e3d6j3rIh+u9IKMiynJuQoL+XxduhaXWnjbhryGqV9igbsx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4924243"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="4924243"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 11:47:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="11044126"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Mar 2024 11:47:22 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjOCe-0008Th-0G;
	Sun, 10 Mar 2024 18:47:20 +0000
Date: Mon, 11 Mar 2024 02:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 326b35a8d7fa38a0ef982eaf3e221738cf59aee8
Message-ID: <202403110227.poVc1f4R-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 326b35a8d7fa38a0ef982eaf3e221738cf59aee8  Input: imagis - add touch key support

elapsed time: 727m

configs tested: 212
configs skipped: 3

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
arc                   randconfig-001-20240310   gcc  
arc                   randconfig-002-20240310   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              alldefconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                      footbridge_defconfig   clang
arm                      jornada720_defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                   randconfig-001-20240310   gcc  
arm                   randconfig-002-20240310   gcc  
arm                   randconfig-003-20240310   gcc  
arm                   randconfig-004-20240310   gcc  
arm                           sama7_defconfig   clang
arm                        shmobile_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240310   clang
arm64                 randconfig-002-20240310   gcc  
arm64                 randconfig-003-20240310   clang
arm64                 randconfig-004-20240310   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240310   gcc  
csky                  randconfig-002-20240310   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240310   clang
hexagon               randconfig-002-20240310   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240310   clang
i386         buildonly-randconfig-002-20240310   clang
i386         buildonly-randconfig-003-20240310   clang
i386         buildonly-randconfig-004-20240310   clang
i386         buildonly-randconfig-005-20240310   gcc  
i386         buildonly-randconfig-006-20240310   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240310   gcc  
i386                  randconfig-002-20240310   gcc  
i386                  randconfig-003-20240310   clang
i386                  randconfig-004-20240310   gcc  
i386                  randconfig-005-20240310   gcc  
i386                  randconfig-006-20240310   gcc  
i386                  randconfig-011-20240310   clang
i386                  randconfig-012-20240310   clang
i386                  randconfig-013-20240310   clang
i386                  randconfig-014-20240310   clang
i386                  randconfig-015-20240310   clang
i386                  randconfig-016-20240310   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240310   gcc  
loongarch             randconfig-002-20240310   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1000-neo_defconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                           ip22_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240310   gcc  
nios2                 randconfig-002-20240310   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20240310   gcc  
parisc                randconfig-002-20240310   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 canyonlands_defconfig   clang
powerpc                     ep8248e_defconfig   gcc  
powerpc                     kilauea_defconfig   clang
powerpc                    klondike_defconfig   gcc  
powerpc                      mgcoge_defconfig   clang
powerpc                 mpc8313_rdb_defconfig   gcc  
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                    mvme5100_defconfig   gcc  
powerpc                     ppa8548_defconfig   gcc  
powerpc                       ppc64_defconfig   clang
powerpc               randconfig-001-20240310   gcc  
powerpc               randconfig-002-20240310   clang
powerpc               randconfig-003-20240310   clang
powerpc                    socrates_defconfig   gcc  
powerpc                     tqm5200_defconfig   gcc  
powerpc64             randconfig-001-20240310   gcc  
powerpc64             randconfig-002-20240310   gcc  
powerpc64             randconfig-003-20240310   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240310   gcc  
riscv                 randconfig-002-20240310   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240310   clang
s390                  randconfig-002-20240310   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                    randconfig-001-20240310   gcc  
sh                    randconfig-002-20240310   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240310   gcc  
sparc64               randconfig-002-20240310   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240310   gcc  
um                    randconfig-002-20240310   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240310   clang
x86_64       buildonly-randconfig-002-20240310   gcc  
x86_64       buildonly-randconfig-003-20240310   clang
x86_64       buildonly-randconfig-004-20240310   gcc  
x86_64       buildonly-randconfig-005-20240310   clang
x86_64       buildonly-randconfig-006-20240310   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240310   clang
x86_64                randconfig-002-20240310   gcc  
x86_64                randconfig-003-20240310   gcc  
x86_64                randconfig-004-20240310   gcc  
x86_64                randconfig-005-20240310   clang
x86_64                randconfig-006-20240310   gcc  
x86_64                randconfig-011-20240310   gcc  
x86_64                randconfig-012-20240310   clang
x86_64                randconfig-013-20240310   clang
x86_64                randconfig-014-20240310   gcc  
x86_64                randconfig-015-20240310   clang
x86_64                randconfig-016-20240310   gcc  
x86_64                randconfig-071-20240310   gcc  
x86_64                randconfig-072-20240310   gcc  
x86_64                randconfig-073-20240310   gcc  
x86_64                randconfig-074-20240310   gcc  
x86_64                randconfig-075-20240310   clang
x86_64                randconfig-076-20240310   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240310   gcc  
xtensa                randconfig-002-20240310   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

