Return-Path: <linux-input+bounces-14536-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 091C5B47C77
	for <lists+linux-input@lfdr.de>; Sun,  7 Sep 2025 18:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9325D3A8A2A
	for <lists+linux-input@lfdr.de>; Sun,  7 Sep 2025 16:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D18212FAA;
	Sun,  7 Sep 2025 16:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="na0Bia5e"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BED572605
	for <linux-input@vger.kernel.org>; Sun,  7 Sep 2025 16:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757263525; cv=none; b=rbVWvHKXVJBo++f3YW/sXM+UxXthustDMSYhtXREzJXYA57zo5rCnQtZpSrLP2OA1LCpSf6gdPX/GBt0L2X5vaPNNWvEwqKECPDXdQrqWUFylHqBCDfJznuHLeVnS1DJy9QRAQKqrGvI3jVVfSWixd6hM0UTP+X5VSxXNlqwkj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757263525; c=relaxed/simple;
	bh=M5wWW9ba6Qj6t45LT6hH+CXmlDGEazv2Zvn3ngnh9WQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VMQTDTD1kwtAk0Dc3GBSq8hBDlMcFrjQ9yuZRdtzltR/NeyaEjQFJnTmCRYmhyvMXzwXPxdaa8iqnbyI9QjoNlFg/tZ9dX6wJN7yeIWPsKtzKws8YAFPmJfbNJLXrKDZqL61OqkSx5b2SNNPBAmm8H+f8MVbeaO1DrTiOqlJse4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=na0Bia5e; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757263524; x=1788799524;
  h=date:from:to:cc:subject:message-id;
  bh=M5wWW9ba6Qj6t45LT6hH+CXmlDGEazv2Zvn3ngnh9WQ=;
  b=na0Bia5eh1ph+VhO6/asyNSu1bItv1xctchp0j2fUTWI06mrC8F5llR8
   fenLZKS6tcStLQiKVv0O8+Qk5R+4l8Cbnocb0trrXFOwBxL2GY4bdUmMH
   NHlMNQWHuW6xE46P/JdPz7WrprGa5EU4S8L7TOaPGU0Q2rwVRTZ6NYE12
   VtkCEV4ws5M5AdVVkt0xOGSK8RjfaUdjIkDPTPP9CRhHm3oGkoRnaVVe/
   ZHXwOtcZ0vVtcJULdm41fo7h2VJuM8StFDMxE9AxzyhAFBFDcAvXu1jnq
   qkG9dFohRrmMPxiYIPvwBhfI/iM1Zoqb/e3RXlaqL0vDdW7FoBuGT93Ue
   g==;
X-CSE-ConnectionGUID: yRyGakfRQ8aQ3u9X+McLEQ==
X-CSE-MsgGUID: JHbAc/9aTz6CxLvARU5B/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59470883"
X-IronPort-AV: E=Sophos;i="6.18,246,1751266800"; 
   d="scan'208";a="59470883"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 09:45:21 -0700
X-CSE-ConnectionGUID: tprLhCDQR2OqfwWv7q/ZEQ==
X-CSE-MsgGUID: aqh6UO1GT4W54Y5CskgLiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,246,1751266800"; 
   d="scan'208";a="171778278"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Sep 2025 09:45:20 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvIVx-0002OR-03;
	Sun, 07 Sep 2025 16:45:17 +0000
Date: Mon, 08 Sep 2025 00:44:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 f3ebb77fce24b5573e7accc2ba593ae55bded1d9
Message-ID: <202509080036.bAvirFLB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: f3ebb77fce24b5573e7accc2ba593ae55bded1d9  dt-bindings: input: touchscreen: goodix: Drop 'interrupts' requirement

elapsed time: 1449m

configs tested: 134
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                        nsim_700_defconfig    gcc-15.1.0
arc                   randconfig-001-20250907    gcc-8.5.0
arc                   randconfig-002-20250907    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                          gemini_defconfig    clang-20
arm                            hisi_defconfig    gcc-15.1.0
arm                   randconfig-001-20250907    gcc-8.5.0
arm                   randconfig-002-20250907    clang-22
arm                   randconfig-003-20250907    clang-22
arm                   randconfig-004-20250907    gcc-10.5.0
arm                           sama5_defconfig    gcc-15.1.0
arm                    vt8500_v6_v7_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250907    clang-22
arm64                 randconfig-002-20250907    gcc-14.3.0
arm64                 randconfig-003-20250907    clang-22
arm64                 randconfig-004-20250907    gcc-9.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250907    gcc-15.1.0
csky                  randconfig-002-20250907    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250907    clang-17
hexagon               randconfig-002-20250907    clang-22
i386                             allmodconfig    gcc-13
i386                              allnoconfig    gcc-13
i386                             allyesconfig    gcc-13
i386        buildonly-randconfig-001-20250907    clang-20
i386        buildonly-randconfig-002-20250907    clang-20
i386        buildonly-randconfig-003-20250907    gcc-13
i386        buildonly-randconfig-004-20250907    clang-20
i386        buildonly-randconfig-005-20250907    clang-20
i386        buildonly-randconfig-006-20250907    clang-20
i386                                defconfig    clang-20
loongarch                        alldefconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250907    clang-22
loongarch             randconfig-002-20250907    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath25_defconfig    clang-22
mips                        omega2p_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250907    gcc-11.5.0
nios2                 randconfig-002-20250907    gcc-11.5.0
openrisc                         alldefconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250907    gcc-9.5.0
parisc                randconfig-002-20250907    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                       eiger_defconfig    clang-22
powerpc               randconfig-001-20250907    gcc-9.5.0
powerpc               randconfig-002-20250907    clang-22
powerpc               randconfig-003-20250907    gcc-15.1.0
powerpc                  storcenter_defconfig    gcc-15.1.0
powerpc                     tqm8555_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250907    gcc-13.4.0
powerpc64             randconfig-002-20250907    clang-22
powerpc64             randconfig-003-20250907    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250907    clang-22
riscv                 randconfig-002-20250907    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250907    gcc-8.5.0
s390                  randconfig-002-20250907    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                            migor_defconfig    gcc-15.1.0
sh                          polaris_defconfig    gcc-15.1.0
sh                    randconfig-001-20250907    gcc-12.5.0
sh                    randconfig-002-20250907    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250907    gcc-13.4.0
sparc                 randconfig-002-20250907    gcc-15.1.0
sparc                       sparc64_defconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250907    gcc-12.5.0
sparc64               randconfig-002-20250907    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-13
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-13
um                    randconfig-001-20250907    gcc-13
um                    randconfig-002-20250907    gcc-13
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250907    gcc-13
x86_64      buildonly-randconfig-002-20250907    clang-20
x86_64      buildonly-randconfig-003-20250907    gcc-13
x86_64      buildonly-randconfig-004-20250907    gcc-13
x86_64      buildonly-randconfig-005-20250907    gcc-13
x86_64      buildonly-randconfig-006-20250907    gcc-13
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250907    gcc-10.5.0
xtensa                randconfig-002-20250907    gcc-9.5.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

