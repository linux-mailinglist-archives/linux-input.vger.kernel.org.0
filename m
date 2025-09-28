Return-Path: <linux-input+bounces-15145-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D264ABA792E
	for <lists+linux-input@lfdr.de>; Mon, 29 Sep 2025 00:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 951583B5E7E
	for <lists+linux-input@lfdr.de>; Sun, 28 Sep 2025 22:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFC235950;
	Sun, 28 Sep 2025 22:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQiYOHZV"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90497226D02
	for <linux-input@vger.kernel.org>; Sun, 28 Sep 2025 22:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759100223; cv=none; b=KqcWTlPhgAnvgoFnCt0N2JbUuNnMIKTGp7daA5rq7tzEnKmOm542fePbQi2atFmXpD1Vt+D1lFql240H2Pw2J1jJrRG8WEp514ZGPM/RfzUXp2l3zQYYDzZ0X4w5QqQ/cTeXPeZAS2BeLBxzWR/4RNn36ukvu1XNy/Ss/5YeIvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759100223; c=relaxed/simple;
	bh=AMSmPAnRk9LptaK6qctPK+nvmSK5PZQtZc9gMR0xno8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TnTF2dECRWG9UalOZT11ihooPaATEXSDaMbkaQcLJ1+gjqsqpTsKGV9fhOM+kJVo7jLdFxJtwWBtHk7WKM3ZlDMEionDFjX4UVKlExNn2OM89wzssekSg5h58i4SkeBGjqk6jJC8vsbZQf4t7NuLBRPW5KODN8TopVwK+v/Vwpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQiYOHZV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759100213; x=1790636213;
  h=date:from:to:cc:subject:message-id;
  bh=AMSmPAnRk9LptaK6qctPK+nvmSK5PZQtZc9gMR0xno8=;
  b=cQiYOHZVTkGlt6GuwjnjlDD2gyk41DvwI/MpNiEt0bXIGKIV9IX/vKsU
   9EHgSw3derg0Y/UhZ6buTP0b+I40TFx6wM22G4pdiWK+BuzeQW59pWu11
   ZRUjek/CTA9ISVmAZEUK1xq0abNL35jRsJDs0bTQr8VMo0sIUg68cYw/5
   2R+4BEbZJ+5o5gRQPHMFY9po1qPshCUmNlIPvimmDolQKLpEj1I0n5P+r
   JEbTyVzmkEASULoAzwrmSBGiEUtK1VPd27tpZ3ui4gLdK4nVPjyPUb7IX
   V0FE2bxfaFLvN2Ifyp8u9HzfV+H5+JLa9Y2cHHDcrHStiKghEcaYNQj0H
   g==;
X-CSE-ConnectionGUID: ThTd57ffTACUbpsfd7wYwA==
X-CSE-MsgGUID: KF/lW+C1STePZ5VQH1iXbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="72709084"
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="72709084"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 15:56:52 -0700
X-CSE-ConnectionGUID: iycjdluJS/SSt5D+5w0fWQ==
X-CSE-MsgGUID: ME81hJw/S1SjY+R+6Kesqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="208803052"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 28 Sep 2025 15:56:51 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v30K0-00082F-1k;
	Sun, 28 Sep 2025 22:56:48 +0000
Date: Mon, 29 Sep 2025 06:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 52e06d564ce6a5f03177922b2fa5667781d5ff83
Message-ID: <202509290619.PBmEBn6z-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 52e06d564ce6a5f03177922b2fa5667781d5ff83  Input: aw86927 - add driver for Awinic AW86927

elapsed time: 1025m

configs tested: 144
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250928    gcc-8.5.0
arc                   randconfig-002-20250928    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                         nhk8815_defconfig    clang-22
arm                           omap1_defconfig    gcc-15.1.0
arm                   randconfig-001-20250928    clang-22
arm                   randconfig-002-20250928    clang-22
arm                   randconfig-003-20250928    clang-22
arm                   randconfig-004-20250928    clang-22
arm                           stm32_defconfig    gcc-15.1.0
arm                    vt8500_v6_v7_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250928    gcc-15.1.0
arm64                 randconfig-002-20250928    gcc-9.5.0
arm64                 randconfig-003-20250928    clang-17
arm64                 randconfig-004-20250928    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250928    gcc-14.3.0
csky                  randconfig-002-20250928    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250928    clang-22
hexagon               randconfig-002-20250928    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250928    clang-20
i386        buildonly-randconfig-002-20250928    clang-20
i386        buildonly-randconfig-003-20250928    gcc-14
i386        buildonly-randconfig-004-20250928    clang-20
i386        buildonly-randconfig-005-20250928    clang-20
i386        buildonly-randconfig-006-20250928    clang-20
i386                                defconfig    clang-20
loongarch                        alldefconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch                 loongson3_defconfig    clang-22
loongarch             randconfig-001-20250928    gcc-15.1.0
loongarch             randconfig-002-20250928    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          eyeq5_defconfig    gcc-15.1.0
mips                           ip30_defconfig    gcc-15.1.0
mips                          rb532_defconfig    clang-18
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250928    gcc-11.5.0
nios2                 randconfig-002-20250928    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250928    gcc-14.3.0
parisc                randconfig-002-20250928    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                    adder875_defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                      bamboo_defconfig    clang-22
powerpc               randconfig-001-20250928    gcc-8.5.0
powerpc               randconfig-002-20250928    clang-22
powerpc               randconfig-003-20250928    gcc-8.5.0
powerpc                    socrates_defconfig    gcc-15.1.0
powerpc                     tqm8555_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250928    gcc-10.5.0
powerpc64             randconfig-002-20250928    clang-20
powerpc64             randconfig-003-20250928    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250928    gcc-11.5.0
riscv                 randconfig-002-20250928    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250928    gcc-8.5.0
s390                  randconfig-002-20250928    clang-18
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250928    gcc-15.1.0
sh                    randconfig-002-20250928    gcc-11.5.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250928    gcc-15.1.0
sparc                 randconfig-002-20250928    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250928    gcc-8.5.0
sparc64               randconfig-002-20250928    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250928    gcc-14
um                    randconfig-002-20250928    clang-19
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250928    gcc-14
x86_64      buildonly-randconfig-002-20250928    gcc-14
x86_64      buildonly-randconfig-003-20250928    gcc-14
x86_64      buildonly-randconfig-004-20250928    gcc-14
x86_64      buildonly-randconfig-005-20250928    clang-20
x86_64      buildonly-randconfig-006-20250928    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250928    gcc-8.5.0
xtensa                randconfig-002-20250928    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

