Return-Path: <linux-input+bounces-14537-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F138B47C8C
	for <lists+linux-input@lfdr.de>; Sun,  7 Sep 2025 19:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBE5B1899317
	for <lists+linux-input@lfdr.de>; Sun,  7 Sep 2025 17:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A8226FD97;
	Sun,  7 Sep 2025 17:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3FvfPTl"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9C01B4F08
	for <linux-input@vger.kernel.org>; Sun,  7 Sep 2025 17:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757264845; cv=none; b=Y1OgaLTcupLpSZaBABrN/tFfkmcToF4X+SLCsLpSvjwaoRSMTJMLjNxx3aeb/tDaOcR+uFuVjVAog8YDQXIkwuM/bX9DcoAAEHxIJ4h8cXQT4Zsd5Y225EqIbi+MwChEeo/OiV7AYzwQjfFvJSvxheq5wzscEuHNq3XDABkc0Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757264845; c=relaxed/simple;
	bh=u7INqHuIzKmJbJ6GkZ5cw+XYpYaBC0WjXjctQzBXjjw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FMZOY7Zx/Wt+dEqP/djlRX6da+wtrBdEpRE1lgyZXjOCS16WzZHM9KPJyTw7fhkhoC560BManoN9eV9zErOM+sNmdqb1AXbgCu30e1PACuxHM0rCB3cWSP3Vt3CAwFwfHxDpNf4SkTdxukPZIOggsKS1PDXUsM0G/j+3wwyf484=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3FvfPTl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757264843; x=1788800843;
  h=date:from:to:cc:subject:message-id;
  bh=u7INqHuIzKmJbJ6GkZ5cw+XYpYaBC0WjXjctQzBXjjw=;
  b=K3FvfPTlzX+67pc1GzKzaS2ni/54OZFXEzH7Y3JCSBJ7Tk+1M/bgNOGq
   PF0JnMOuogdybRi50Mkdw2zK0wUAt6iBKdC/N+QlGucIF4I8fy0BYa66N
   mGf5pTQkDMec/R8XbcyJpgusG3+5YlDUCnnm/Bx/p+iWfuj6Eu7ge7pO8
   SYd17qjFoHVL8yf2IFZ1fLawZqk9+jyg1PuW/4CiWsupXidtKBnyhsq7P
   7FkRxOaFLoOyjvKpsXLlP1ax0sc1f3jFHfS0U+Ji57DzvDIN5vFx+Vzph
   LFyEB1IrV4kggo05pFfVqDvfkMTTiIf9OW2a4ECgIHSf4izOBnnXUzPUg
   Q==;
X-CSE-ConnectionGUID: 8xfyCjIRTyGr1hy7yXwOkQ==
X-CSE-MsgGUID: S0vb94mSTPOlaLq+ee8PKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59603173"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59603173"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 10:07:22 -0700
X-CSE-ConnectionGUID: yIbBHVJhRE+Aiz7ZL2ikiQ==
X-CSE-MsgGUID: w06oc9xUSM2TwEiRYg9uxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,246,1751266800"; 
   d="scan'208";a="209758205"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Sep 2025 10:07:21 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvIrG-0002PJ-30;
	Sun, 07 Sep 2025 17:07:18 +0000
Date: Mon, 08 Sep 2025 01:06:20 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 5f9efb6b7667043527d377421af2070cc0aa2ecd
Message-ID: <202509080114.B55pqApJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 5f9efb6b7667043527d377421af2070cc0aa2ecd  Input: mtk-pmic-keys - MT6359 has a specific release irq

elapsed time: 1471m

configs tested: 98
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250907    gcc-8.5.0
arc                   randconfig-002-20250907    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                      jornada720_defconfig    clang-22
arm                   randconfig-001-20250907    gcc-8.5.0
arm                   randconfig-002-20250907    clang-22
arm                   randconfig-003-20250907    clang-22
arm                   randconfig-004-20250907    gcc-10.5.0
arm                        shmobile_defconfig    gcc-15.1.0
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
i386        buildonly-randconfig-001-20250907    clang-20
i386        buildonly-randconfig-002-20250907    clang-20
i386        buildonly-randconfig-003-20250907    gcc-13
i386        buildonly-randconfig-004-20250907    clang-20
i386        buildonly-randconfig-005-20250907    clang-20
i386        buildonly-randconfig-006-20250907    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250907    clang-22
loongarch             randconfig-002-20250907    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         apollo_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip28_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250907    gcc-11.5.0
nios2                 randconfig-002-20250907    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250907    gcc-9.5.0
parisc                randconfig-002-20250907    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                      ppc64e_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250907    gcc-9.5.0
powerpc               randconfig-002-20250907    clang-22
powerpc               randconfig-003-20250907    gcc-15.1.0
powerpc64             randconfig-001-20250907    gcc-13.4.0
powerpc64             randconfig-002-20250907    clang-22
powerpc64             randconfig-003-20250907    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250907    clang-22
riscv                 randconfig-002-20250907    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250907    gcc-8.5.0
s390                  randconfig-002-20250907    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250907    gcc-12.5.0
sh                    randconfig-002-20250907    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250907    gcc-13.4.0
sparc                 randconfig-002-20250907    gcc-15.1.0
sparc64               randconfig-001-20250907    gcc-12.5.0
sparc64               randconfig-002-20250907    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-13
um                    randconfig-001-20250907    gcc-13
um                    randconfig-002-20250907    gcc-13
x86_64      buildonly-randconfig-001-20250907    gcc-13
x86_64      buildonly-randconfig-002-20250907    clang-20
x86_64      buildonly-randconfig-003-20250907    gcc-13
x86_64      buildonly-randconfig-004-20250907    gcc-13
x86_64      buildonly-randconfig-005-20250907    gcc-13
x86_64      buildonly-randconfig-006-20250907    gcc-13
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250907    gcc-10.5.0
xtensa                randconfig-002-20250907    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

