Return-Path: <linux-input+bounces-13606-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA89B0B744
	for <lists+linux-input@lfdr.de>; Sun, 20 Jul 2025 19:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BE9C1899AB7
	for <lists+linux-input@lfdr.de>; Sun, 20 Jul 2025 17:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F131CFBC;
	Sun, 20 Jul 2025 17:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UT0yIz2K"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C901D5CE8
	for <linux-input@vger.kernel.org>; Sun, 20 Jul 2025 17:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753032516; cv=none; b=eTcexZtmVOVB0VVogh62RBzXq7iL53VAjo/wEeQXq2jV7zge+B7HLDpN3uPx9L23URG2q7QH6PY9aeLY0J3gV1m/iIUQaqCdWSb4jOJDhZZO7wFyzbjlpdYlAAS83Ibu7Kn+O+rLiKrKmF4y6cWrqUhbhYz3jKYS9AnUJGOKoEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753032516; c=relaxed/simple;
	bh=gA+H8cfsqtfnyHtBGWgZ/8OIhpsqlX3iRyTTyocN434=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eFxs3CNgMbrRfmKXcN8yYp8OkDaUiL1INMCVQRvU0kzhoPCz33aJSIKa2qpV8VAqS6s0Wchdw851oz1tqqf80KBu9EqpinREtRwOOre5+o9mHUqbEM6IEgJwUSBAe4P4KFHDJzSsScs/MNqcJDqZO5K7LdYvjXYeaPych7Yz94M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UT0yIz2K; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753032515; x=1784568515;
  h=date:from:to:cc:subject:message-id;
  bh=gA+H8cfsqtfnyHtBGWgZ/8OIhpsqlX3iRyTTyocN434=;
  b=UT0yIz2KRkzbqTS9GBHr4DyXMdBeTR9pq2K9p5F10XkczGH2AdnzAqDt
   E1JiUoc0bhmZwaS6lTIJrUZhcH7YE8BhWcGqzNOXmoJ/qeHhQOvQGu+V0
   ODwOpgwH4bUHHThYBxHMX73o5XcGE0Z37rj9rhYLX+/Of1JwWL+jryzvV
   wbgmxBcnbkXO3hiUNzc8lkLhwBoUUoxtKDAquNF9/Jz6hsus/nEcMe5y9
   hue6I9bZEsqJzWqvlJmqLCweuMqmjRfbH6ayyXQEdkAWTy/P8z7b1U/8i
   sSQWpKY04Ld/LdQQxb8yHdqUcYXW3xjXUlwfYURn5bUws2lPg2R0GcOgQ
   w==;
X-CSE-ConnectionGUID: TtEBUGkgQOmAu+hTneV6Bw==
X-CSE-MsgGUID: ODod9nOKSxOkmQEQ/btSpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="66698938"
X-IronPort-AV: E=Sophos;i="6.16,327,1744095600"; 
   d="scan'208";a="66698938"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 10:28:35 -0700
X-CSE-ConnectionGUID: qGq33y3QSpGTm9PWBpU25w==
X-CSE-MsgGUID: uXH3+psBTvC8iFpEJrIh8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,327,1744095600"; 
   d="scan'208";a="162943515"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jul 2025 10:28:33 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udXpv-000GFN-0y;
	Sun, 20 Jul 2025 17:28:31 +0000
Date: Mon, 21 Jul 2025 01:27:49 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 bcce05041b21888f10b80ea903dcfe51a25c586e
Message-ID: <202507210138.KXcR3h0s-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: bcce05041b21888f10b80ea903dcfe51a25c586e  Input: xpad - set correct controller type for Acer NGR200

elapsed time: 724m

configs tested: 125
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250720    gcc-11.5.0
arc                   randconfig-002-20250720    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g5_defconfig    gcc-15.1.0
arm                   randconfig-001-20250720    gcc-15.1.0
arm                   randconfig-002-20250720    gcc-15.1.0
arm                   randconfig-003-20250720    gcc-10.5.0
arm                   randconfig-004-20250720    gcc-7.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250720    gcc-15.1.0
arm64                 randconfig-002-20250720    gcc-12.5.0
arm64                 randconfig-003-20250720    clang-21
arm64                 randconfig-004-20250720    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250720    gcc-15.1.0
csky                  randconfig-002-20250720    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250720    clang-21
hexagon               randconfig-002-20250720    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250720    clang-20
i386        buildonly-randconfig-002-20250720    gcc-12
i386        buildonly-randconfig-003-20250720    gcc-12
i386        buildonly-randconfig-004-20250720    clang-20
i386        buildonly-randconfig-005-20250720    gcc-12
i386        buildonly-randconfig-006-20250720    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250720    clang-18
loongarch             randconfig-002-20250720    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250720    gcc-9.5.0
nios2                 randconfig-002-20250720    gcc-7.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250720    gcc-5.5.0
parisc                randconfig-002-20250720    gcc-6.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250720    gcc-10.5.0
powerpc               randconfig-002-20250720    gcc-5.5.0
powerpc               randconfig-003-20250720    gcc-11.5.0
powerpc64             randconfig-001-20250720    gcc-10.5.0
powerpc64             randconfig-002-20250720    gcc-6.5.0
powerpc64             randconfig-003-20250720    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250720    clang-21
riscv                 randconfig-002-20250720    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250720    clang-21
s390                  randconfig-002-20250720    gcc-7.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                            hp6xx_defconfig    gcc-15.1.0
sh                    randconfig-001-20250720    gcc-15.1.0
sh                    randconfig-002-20250720    gcc-13.4.0
sh                           sh2007_defconfig    gcc-15.1.0
sh                        sh7785lcr_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250720    gcc-7.5.0
sparc                 randconfig-002-20250720    gcc-6.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250720    gcc-5.5.0
sparc64               randconfig-002-20250720    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250720    gcc-11
um                    randconfig-002-20250720    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250720    gcc-12
x86_64      buildonly-randconfig-002-20250720    gcc-12
x86_64      buildonly-randconfig-003-20250720    gcc-12
x86_64      buildonly-randconfig-004-20250720    clang-20
x86_64      buildonly-randconfig-005-20250720    gcc-11
x86_64      buildonly-randconfig-006-20250720    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250720    gcc-15.1.0
xtensa                randconfig-002-20250720    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

