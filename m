Return-Path: <linux-input+bounces-12265-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A97AB2A3B
	for <lists+linux-input@lfdr.de>; Sun, 11 May 2025 20:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CA063B34BF
	for <lists+linux-input@lfdr.de>; Sun, 11 May 2025 18:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E7F25F7AB;
	Sun, 11 May 2025 18:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A57wPSht"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F4425F7BB
	for <linux-input@vger.kernel.org>; Sun, 11 May 2025 18:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746987739; cv=none; b=PAtl33VfjggSTKYjd5LR5ePYlkCB58+nhtTxEnMtNU4mefRm7kfd140j6wsmgE0F4QvnO+lhDQbq6jEZ2TeER2PSxcYQ9d2AZMorPupfG/XuX3JBS5X0Xls4JVXH6SeCD/JQ5xB2fsI3yYUr38okvKQ5PFxNUp8Ix/fxKw/aaK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746987739; c=relaxed/simple;
	bh=9+zVzhFc7CDrNzAFPfSyRNhA1LONh33KYdaXSZeVrWs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jArzXLtA24NHyPvTxNe10YfJeDlR4Kgmgh7I8Y8N0cbrRlETxf03eWh7VMKjQnInCLR8tRNeYbv0FGI2y5DL+O90oG961UJLQaKSo8fEoqB4Zvq9hJY9XCfIBpgBmB2XjFlDnlBj9+DOwowrAq+u8badGJjgLTfNecuXM0it3Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A57wPSht; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746987738; x=1778523738;
  h=date:from:to:cc:subject:message-id;
  bh=9+zVzhFc7CDrNzAFPfSyRNhA1LONh33KYdaXSZeVrWs=;
  b=A57wPShthQpWS0elZECLLbD4SHTcjNNZm0T1NhCPvOXJ57cW7216b/wR
   zs1VirYrCF9L8ZXOHOlZWSSMcOTmYy7RwN7QrlNXajcDnGuAZ0YzmaaHc
   YlSX3+mfUUtGZ81JJ3GgRVFxAyTASDYpb6HBsOGfyG+XizOuKSqSMmODD
   U5Qvu4S/A8mH2MWXgaDeSgeqSbqVEJnUinapxhXnHqDkiinuOjWQHQ4gs
   1a6z3PiPEWPzD/21FKGTuYnuSC2/Ze8VO23z4Q+OL/pOp5aExMn1VkEqV
   odqFRnLEfzTGWv7AL87YgUH2cYWka4Zke1lkqE3iDYESXjbcR1G9oDL94
   w==;
X-CSE-ConnectionGUID: md3tRbqGQiGWBnj0E2UITA==
X-CSE-MsgGUID: wKShDPU8RDG9cORS0WtVsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48778555"
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="48778555"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 11:22:16 -0700
X-CSE-ConnectionGUID: v7rTjL5lTfGrkDIs5BcpcA==
X-CSE-MsgGUID: m1dU5d6RTkGACdMw0fhRXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="137097568"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 May 2025 11:22:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEBJU-000DvH-2Y;
	Sun, 11 May 2025 18:22:12 +0000
Date: Mon, 12 May 2025 02:21:46 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 74d3da135f69a910df0f3487bebd3de540450d4a
Message-ID: <202505120239.fDu7PrId-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 74d3da135f69a910df0f3487bebd3de540450d4a  MAINTAINERS: update dlg,da72??.txt to yaml

elapsed time: 722m

configs tested: 149
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250511    gcc-10.5.0
arc                   randconfig-002-20250511    gcc-14.2.0
arc                        vdk_hs38_defconfig    gcc-14.2.0
arc                    vdk_hs38_smp_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-21
arm                                 defconfig    clang-21
arm                             mxs_defconfig    clang-21
arm                   randconfig-001-20250511    clang-18
arm                   randconfig-002-20250511    clang-21
arm                   randconfig-003-20250511    gcc-8.5.0
arm                   randconfig-004-20250511    gcc-7.5.0
arm                           u8500_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250511    clang-21
arm64                 randconfig-002-20250511    clang-21
arm64                 randconfig-003-20250511    clang-21
arm64                 randconfig-004-20250511    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250511    gcc-12.4.0
csky                  randconfig-002-20250511    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250511    clang-21
hexagon               randconfig-002-20250511    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250511    clang-20
i386        buildonly-randconfig-002-20250511    gcc-12
i386        buildonly-randconfig-003-20250511    clang-20
i386        buildonly-randconfig-004-20250511    clang-20
i386        buildonly-randconfig-005-20250511    clang-20
i386        buildonly-randconfig-006-20250511    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250511    gcc-14.2.0
loongarch             randconfig-002-20250511    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-21
mips                           jazz_defconfig    clang-17
mips                          rb532_defconfig    clang-18
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250511    gcc-10.5.0
nios2                 randconfig-002-20250511    gcc-8.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                generic-32bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250511    gcc-11.5.0
parisc                randconfig-002-20250511    gcc-7.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                     asp8347_defconfig    clang-21
powerpc                   bluestone_defconfig    clang-21
powerpc                      cm5200_defconfig    clang-21
powerpc                   lite5200b_defconfig    clang-21
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    clang-21
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc                      pmac32_defconfig    clang-21
powerpc               randconfig-001-20250511    clang-21
powerpc               randconfig-002-20250511    clang-21
powerpc               randconfig-003-20250511    clang-21
powerpc64             randconfig-001-20250511    gcc-6.5.0
powerpc64             randconfig-002-20250511    gcc-6.5.0
powerpc64             randconfig-003-20250511    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250511    gcc-8.5.0
riscv                 randconfig-002-20250511    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250511    gcc-9.3.0
s390                  randconfig-002-20250511    gcc-9.3.0
sh                               alldefconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                            migor_defconfig    gcc-14.2.0
sh                    randconfig-001-20250511    gcc-10.5.0
sh                    randconfig-002-20250511    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250511    gcc-7.5.0
sparc                 randconfig-002-20250511    gcc-6.5.0
sparc64                          alldefconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250511    gcc-5.5.0
sparc64               randconfig-002-20250511    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250511    clang-19
um                    randconfig-002-20250511    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250511    clang-20
x86_64      buildonly-randconfig-002-20250511    clang-20
x86_64      buildonly-randconfig-003-20250511    clang-20
x86_64      buildonly-randconfig-004-20250511    clang-20
x86_64      buildonly-randconfig-005-20250511    gcc-12
x86_64      buildonly-randconfig-006-20250511    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250511    gcc-11.5.0
xtensa                randconfig-002-20250511    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

