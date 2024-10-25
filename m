Return-Path: <linux-input+bounces-7702-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9C99B09A5
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 18:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33442283FE6
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 16:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D791114A0A7;
	Fri, 25 Oct 2024 16:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k77DiWPe"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D967082B
	for <linux-input@vger.kernel.org>; Fri, 25 Oct 2024 16:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729873110; cv=none; b=uozEJk+fG/Vze8iSQsM+q238T+ATrHEWGoBvS749zQVhGJcPSRnLPm1bDW09zZBRqlH0t219SSQ/iL5pfn2r4vqMSKXkxn4lbzJzCkWzB12Q3K8WK2aHtW6mH51b8aJenZvDPACJ2fCGeGkGsFEpiEDgq/p5LLdaup5q6boYKYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729873110; c=relaxed/simple;
	bh=vy8sF+IyCKXmFWHfTnnM9JlLhIbvs4O+HFUoWXtD+1g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VE+1fTuIIPF5xqFfXDRjHvSzofZley1+ChgjJ97K7Eppz40orpygXZ1xDaOIon+WfdyeJnpqFEELsJMR/9y05Zie+Zm/qzfoPtvqbJt9a4VFL5yX5DMByWgnbNlYx3pKECB+1eQTFpExF4VoQLq6HQvoyzwbtbtPwAWW4Wm6H94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k77DiWPe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729873108; x=1761409108;
  h=date:from:to:cc:subject:message-id;
  bh=vy8sF+IyCKXmFWHfTnnM9JlLhIbvs4O+HFUoWXtD+1g=;
  b=k77DiWPegorD+VwaawERrqS/oOEjXo2thdZZnhdNGpz8268jL+YfcmBD
   NsLfGMzpwKn8G0YAUUC/6HRhs1wUmqzrD22mbGX+WRvFl+uT0+UgRZrGi
   DDOTMBO59eyqzIa17uLkVaHik1gixSIp47HiGZcJ12t8nF7MuJiRWLpyo
   5SqDN/MaNi8pDIXwMBfVsEtaN4RIOlriYolCB4UkZcziXzeKHZuHanBfm
   IfWoR7Duqejst4BdzPiPgeuZ9DW+i9w0r0oS6KTL67Adhv7ijEo9nRxam
   cpK79YL3nl1SM864i3/47yO+HXWu0MFQTXpSVQPWNQA8Jhspp6tJgy3SF
   A==;
X-CSE-ConnectionGUID: 4xlCCrs1QTS3DNyM1RBhJA==
X-CSE-MsgGUID: Lag58dYvQoaoEy+BR/lWVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40925571"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="40925571"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 09:18:14 -0700
X-CSE-ConnectionGUID: QflV3rCPTbOX5ycG0geHjA==
X-CSE-MsgGUID: kFIydFTgRqmTTqH45ng4iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="81786381"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Oct 2024 09:18:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4N0s-000YSw-2g;
	Fri, 25 Oct 2024 16:18:10 +0000
Date: Sat, 26 Oct 2024 00:17:30 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 bffdf9d7e51a7be8eeaac2ccf9e54a5fde01ff65
Message-ID: <202410260022.Gspk46CU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: bffdf9d7e51a7be8eeaac2ccf9e54a5fde01ff65  Input: edt-ft5x06 - fix regmap leak when probe fails

elapsed time: 862m

configs tested: 155
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              alldefconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                       aspeed_g5_defconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                         lpc18xx_defconfig    gcc-14.1.0
arm                           omap1_defconfig    gcc-14.1.0
arm                           sama5_defconfig    clang-20
arm                        shmobile_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241025    gcc-12
i386        buildonly-randconfig-002-20241025    gcc-12
i386        buildonly-randconfig-003-20241025    gcc-12
i386        buildonly-randconfig-004-20241025    gcc-12
i386        buildonly-randconfig-005-20241025    gcc-12
i386        buildonly-randconfig-006-20241025    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241025    gcc-12
i386                  randconfig-002-20241025    gcc-12
i386                  randconfig-003-20241025    gcc-12
i386                  randconfig-004-20241025    gcc-12
i386                  randconfig-005-20241025    gcc-12
i386                  randconfig-006-20241025    gcc-12
i386                  randconfig-011-20241025    gcc-12
i386                  randconfig-012-20241025    gcc-12
i386                  randconfig-013-20241025    gcc-12
i386                  randconfig-014-20241025    gcc-12
i386                  randconfig-015-20241025    gcc-12
i386                  randconfig-016-20241025    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                          amiga_defconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                       m5249evb_defconfig    gcc-14.1.0
m68k                            q40_defconfig    gcc-14.1.0
m68k                           sun3_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm63xx_defconfig    clang-20
mips                         bigsur_defconfig    clang-20
mips                          eyeq6_defconfig    gcc-14.1.0
mips                            gpr_defconfig    clang-20
mips                        omega2p_defconfig    clang-20
nios2                         10m50_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                    adder875_defconfig    clang-20
powerpc                     akebono_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                    amigaone_defconfig    gcc-14.1.0
powerpc                    ge_imp3a_defconfig    clang-20
powerpc                 mpc832x_rdb_defconfig    clang-20
powerpc                     tqm8560_defconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv             nommu_k210_sdcard_defconfig    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                       zfcpdump_defconfig    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                        apsh4ad0a_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    gcc-14.1.0
sh                      rts7751r2d1_defconfig    clang-20
sh                           se7343_defconfig    gcc-14.1.0
sh                           se7705_defconfig    clang-20
sh                   secureedge5410_defconfig    gcc-14.1.0
sh                  sh7785lcr_32bit_defconfig    clang-20
sh                             shx3_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241025    gcc-12
x86_64      buildonly-randconfig-002-20241025    gcc-12
x86_64      buildonly-randconfig-003-20241025    gcc-12
x86_64      buildonly-randconfig-004-20241025    gcc-12
x86_64      buildonly-randconfig-005-20241025    gcc-12
x86_64      buildonly-randconfig-006-20241025    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241025    gcc-12
x86_64                randconfig-002-20241025    gcc-12
x86_64                randconfig-003-20241025    gcc-12
x86_64                randconfig-004-20241025    gcc-12
x86_64                randconfig-005-20241025    gcc-12
x86_64                randconfig-006-20241025    gcc-12
x86_64                randconfig-011-20241025    gcc-12
x86_64                randconfig-012-20241025    gcc-12
x86_64                randconfig-013-20241025    gcc-12
x86_64                randconfig-014-20241025    gcc-12
x86_64                randconfig-015-20241025    gcc-12
x86_64                randconfig-016-20241025    gcc-12
x86_64                randconfig-071-20241025    gcc-12
x86_64                randconfig-072-20241025    gcc-12
x86_64                randconfig-073-20241025    gcc-12
x86_64                randconfig-074-20241025    gcc-12
x86_64                randconfig-075-20241025    gcc-12
x86_64                randconfig-076-20241025    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  cadence_csp_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

