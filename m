Return-Path: <linux-input+bounces-12234-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBECAB05DC
	for <lists+linux-input@lfdr.de>; Fri,  9 May 2025 00:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 016E2502F31
	for <lists+linux-input@lfdr.de>; Thu,  8 May 2025 22:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AF3224AFB;
	Thu,  8 May 2025 22:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UvPYRnQh"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A344191F77
	for <linux-input@vger.kernel.org>; Thu,  8 May 2025 22:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746742315; cv=none; b=ulVvebSLZU5HMAg8EZ+loINj1qpNsz4FCx5WiKyoeGX09lu5pPqZfN8trI/KynuTSk2mTWsYsZK1pKyM3RIkKqKq6Y93vAkfzBFwhOQC5ERb+TkPeKFki/99UQHIys00KHFeA30TNYGttGB4ctYJazScKSYOH405f/4TCKylVU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746742315; c=relaxed/simple;
	bh=QcK287Rbsq2F7CTbM+1m7b4er1zs07CQtqbvlAtvEXM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uWFSGajMkCT/bmIaz3Nh7tlr79hhA72iCEz6cgpM+KvxuGFQL11Ny+6nZJGkb6IKvPGA2KNBunD5uiJuCLwFHNP9M2DgVSKLxuTZ0W/1HxgKCYq5KRltA47DFPDz7CtpqsX695sd3bAWYkhLpFc19iW7Dnry1wSs4PcPLIKHeM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UvPYRnQh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746742313; x=1778278313;
  h=date:from:to:cc:subject:message-id;
  bh=QcK287Rbsq2F7CTbM+1m7b4er1zs07CQtqbvlAtvEXM=;
  b=UvPYRnQhwAkJVdQ7E9MAKx8XoRIxqewx1RvOmp/9NQ2dJRBehUPPgFMK
   PMuFk8YUArg0DRCA6UooQ0j2Dx0C9ABOgg+6TEecr3vMFrSG/26eMEY72
   iiDiaUX3DgvWUX59jzbSAwT8XvzAL8FxtBpG0q66SOJGIC1pEdAWW3pH5
   JTK/IwWAkbN7ucsYP1eAX2y5YyUs+4WkZ7WhO8WBWO9grTFHg3tTt3SNo
   BxwhuHezYdu2qGyecEM6AHz1y1Fo1KwxkmB++Reoa/S2Sux4scwTMUU8Q
   v5UDs/I2uRW2yQHEVfOLZHXDtSRYs3RKPXoqxAUMo1094xyzPOswiPeZE
   g==;
X-CSE-ConnectionGUID: EoZ9M9gaRf6U8bdSmrDhUw==
X-CSE-MsgGUID: aKNvwPfUTZaaDW0Qi0rFvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48468157"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="48468157"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 15:11:52 -0700
X-CSE-ConnectionGUID: ScYUCno3SJi0swk5BMWL5g==
X-CSE-MsgGUID: h8ggYpR2T5OQqkVnHxaIVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136941486"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 May 2025 15:11:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD9T3-000BQF-1Q;
	Thu, 08 May 2025 22:11:49 +0000
Date: Fri, 09 May 2025 06:11:21 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 a609cb4cc07aa9ab8f50466622814356c06f2c17
Message-ID: <202505090607.xVCVMG6t-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: a609cb4cc07aa9ab8f50466622814356c06f2c17  Input: synaptics - enable InterTouch on Dell Precision M3800

elapsed time: 1449m

configs tested: 101
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                          axs101_defconfig    gcc-14.2.0
arc                        nsimosci_defconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250508    gcc-8.5.0
arc                   randconfig-002-20250508    gcc-12.4.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250508    clang-17
arm                   randconfig-002-20250508    clang-21
arm                   randconfig-004-20250508    gcc-7.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250508    gcc-14.2.0
csky                  randconfig-002-20250508    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250508    clang-20
hexagon               randconfig-002-20250508    clang-21
i386                             alldefconfig    gcc-12
i386                              allnoconfig    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250508    gcc-14.2.0
loongarch             randconfig-002-20250508    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip22_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250508    gcc-14.2.0
nios2                 randconfig-002-20250508    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250508    gcc-9.3.0
parisc                randconfig-002-20250508    gcc-11.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      chrp32_defconfig    clang-19
powerpc                   currituck_defconfig    clang-21
powerpc               mpc834x_itxgp_defconfig    clang-21
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250508    gcc-6.5.0
powerpc               randconfig-002-20250508    clang-21
powerpc               randconfig-003-20250508    gcc-6.5.0
powerpc                     stx_gp3_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250508    clang-21
powerpc64             randconfig-002-20250508    gcc-6.5.0
powerpc64             randconfig-003-20250508    gcc-8.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250508    clang-16
riscv                 randconfig-002-20250508    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250508    gcc-6.5.0
s390                  randconfig-002-20250508    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250508    gcc-14.2.0
sh                    randconfig-002-20250508    gcc-10.5.0
sh                   sh7770_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250508    gcc-13.3.0
sparc                 randconfig-002-20250508    gcc-6.5.0
sparc64               randconfig-001-20250508    gcc-13.3.0
sparc64               randconfig-002-20250508    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250508    clang-21
um                    randconfig-002-20250508    clang-21
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20250508    clang-20
x86_64      buildonly-randconfig-002-20250508    clang-20
x86_64      buildonly-randconfig-003-20250508    clang-20
x86_64      buildonly-randconfig-004-20250508    clang-20
x86_64      buildonly-randconfig-005-20250508    clang-20
x86_64      buildonly-randconfig-006-20250508    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250508    gcc-7.5.0
xtensa                randconfig-002-20250508    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

