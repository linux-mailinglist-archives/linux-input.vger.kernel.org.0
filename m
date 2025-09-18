Return-Path: <linux-input+bounces-13699-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 890ABB1320B
	for <lists+linux-input@lfdr.de>; Sun, 27 Jul 2025 23:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 962461896F98
	for <lists+linux-input@lfdr.de>; Sun, 27 Jul 2025 21:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EADCB2AF11;
	Sun, 27 Jul 2025 21:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aajZjtgE"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1451E24676E
	for <linux-input@vger.kernel.org>; Sun, 27 Jul 2025 21:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753653210; cv=none; b=micSopA5v37nIGzl1EoqjorU1FjoKvX2PthOsdsTpcfAQUIxJemTk/FhGoe4EPEx8ZaFYXR9ZeY0Z3ifyw6k+TftHWj7uljBUHJCaEKNlVDBHADtGPz/aFKxCdZdXFBJLObYCxUTKuzQ8zvqM5cpDpA8//FYUHRI/2o4EF9y5Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753653210; c=relaxed/simple;
	bh=AsNZo78g3QtR7rVhiXGxn+A+hm/vud4cK1Ud1hKhZek=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HlCR4+1zLF1UhbKMF0qXSaf/0bhDECaefHxgb9T2f+XI6+E+kvW0X8D5uwemSoDc+70IU/GYJDNyfbX48d+CfXRvezOlUG1OSRUYS4A0xIZlHo3pou8dmQw8uVJgd53uYhiMsh8nrWdYE5l5HbUG6+fQ5FjlTzF5ISvlBLdRUHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aajZjtgE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753653209; x=1785189209;
  h=date:from:to:cc:subject:message-id;
  bh=AsNZo78g3QtR7rVhiXGxn+A+hm/vud4cK1Ud1hKhZek=;
  b=aajZjtgEtz3jHTp4hO1icrqJpXHnCUKngImvumNPJCnF4L92Zbd4A5Na
   itJlggV6FvbFVQLHSt3byQzEEkzstNPNmHyAxg3OjZm9X+QF5XgLujvke
   6+Y1mhfyOs0Ehsa4Evap5cj2sIbiIQPjHQys6uEs4EO04pyRGL9Vq9Uz1
   uIIc6xOB+eYC5BC1FTxBnUXaxN7uIKgLrsWrWL71B/ETTaQUMv9fUg0nS
   fe9QVrKfk0xLMrIqqRWrUx+RyqxOFLQKO7X/e1HblYSwogOh6FrW+Yb9x
   rC/RuIdKlQWoz3rhahkrpvtccgjx8gmvJYeEooHr/F3q2mZ308ZK453hA
   w==;
X-CSE-ConnectionGUID: 7YKfxyUkTR6MQWL+xoUXSQ==
X-CSE-MsgGUID: xwWK/NK6TxqzpZrb3wfsMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55840870"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55840870"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 14:53:28 -0700
X-CSE-ConnectionGUID: yOuZkRnKTF2Npl7ROmtPnw==
X-CSE-MsgGUID: qyb87RSYQ525F0zj/EV1kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161842065"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Jul 2025 14:53:27 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ug9J7-00003D-1y;
	Sun, 27 Jul 2025 21:53:25 +0000
Date: Mon, 28 Jul 2025 05:53:05 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 1c44b818b81bf6a111a702536a560f5bc830c6d5
Message-ID: <202507280553.sWxhe2Ds-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 1c44b818b81bf6a111a702536a560f5bc830c6d5  Input: st1232 - add touch-overlay handling

elapsed time: 727m

configs tested: 142
configs skipped: 4

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
arc                   randconfig-001-20250727    gcc-15.1.0
arc                   randconfig-002-20250727    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                             pxa_defconfig    gcc-15.1.0
arm                   randconfig-001-20250727    gcc-11.5.0
arm                   randconfig-002-20250727    gcc-14.3.0
arm                   randconfig-003-20250727    clang-22
arm                   randconfig-004-20250727    gcc-10.5.0
arm                         socfpga_defconfig    gcc-15.1.0
arm                        vexpress_defconfig    gcc-15.1.0
arm                         wpcm450_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250727    gcc-11.5.0
arm64                 randconfig-002-20250727    clang-18
arm64                 randconfig-003-20250727    clang-17
arm64                 randconfig-004-20250727    gcc-5.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250727    gcc-15.1.0
csky                  randconfig-002-20250727    gcc-12.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250727    clang-22
hexagon               randconfig-002-20250727    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250727    gcc-12
i386        buildonly-randconfig-002-20250727    gcc-12
i386        buildonly-randconfig-003-20250727    clang-20
i386        buildonly-randconfig-004-20250727    clang-20
i386        buildonly-randconfig-005-20250727    clang-20
i386        buildonly-randconfig-006-20250727    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250727    clang-22
loongarch             randconfig-002-20250727    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         db1xxx_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250727    gcc-8.5.0
nios2                 randconfig-002-20250727    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                 simple_smp_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250727    gcc-11.5.0
parisc                randconfig-002-20250727    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                  iss476-smp_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250727    gcc-13.4.0
powerpc               randconfig-002-20250727    clang-22
powerpc               randconfig-003-20250727    clang-22
powerpc64             randconfig-001-20250727    gcc-12.5.0
powerpc64             randconfig-002-20250727    clang-22
powerpc64             randconfig-003-20250727    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250727    clang-22
riscv                 randconfig-002-20250727    clang-20
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250727    clang-22
s390                  randconfig-002-20250727    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                        edosk7760_defconfig    gcc-15.1.0
sh                          polaris_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250727    gcc-6.5.0
sh                    randconfig-002-20250727    gcc-11.5.0
sh                           se7780_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250727    gcc-6.5.0
sparc                 randconfig-002-20250727    gcc-8.5.0
sparc64                          alldefconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250727    gcc-7.5.0
sparc64               randconfig-002-20250727    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250727    clang-22
um                    randconfig-002-20250727    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250727    gcc-12
x86_64      buildonly-randconfig-002-20250727    clang-20
x86_64      buildonly-randconfig-003-20250727    clang-20
x86_64      buildonly-randconfig-004-20250727    clang-20
x86_64      buildonly-randconfig-005-20250727    clang-20
x86_64      buildonly-randconfig-006-20250727    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250727    gcc-6.5.0
xtensa                randconfig-002-20250727    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

