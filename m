Return-Path: <linux-input+bounces-16650-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EF7CD35DC
	for <lists+linux-input@lfdr.de>; Sat, 20 Dec 2025 20:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9068B300DC98
	for <lists+linux-input@lfdr.de>; Sat, 20 Dec 2025 19:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D955D275106;
	Sat, 20 Dec 2025 19:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hh4/9pZJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303CD1F4CBB
	for <linux-input@vger.kernel.org>; Sat, 20 Dec 2025 19:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766257783; cv=none; b=TxToOukd9ZT5abnlGcB7lkeJ2iCPmD5LGjKc8ZsLcChgvyleIRHQ8s9HJbR6AQFwAc8LJfvlUzt2QhErA1LfMIQZqIRZc7jg0wpz392ueTMy4tYoayc5AT9VpOCDvVsbUXG7q76NJJILQhCN8mYXPkLIGnYCEgnRQ8woDrIS/5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766257783; c=relaxed/simple;
	bh=/PjzbNfF3clOznKAY5vrqC84a0QjmdY8TvfEMTvXx1Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KdJlu0RiHV7OHyrt51tQfmUwY94cqtee5yuoUixHeRL08Bn0FBpMmSLOkILxMtTRtivq6ewrF6uF5/MYmkv3BGQWc03BTbdoVcvxru1Hwx05ONOAdqF+lottG/FYO3gC7GM62x5dJi7INHHvRvh3cbZK/dESN4mlfCctl/zxiq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hh4/9pZJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766257782; x=1797793782;
  h=date:from:to:cc:subject:message-id;
  bh=/PjzbNfF3clOznKAY5vrqC84a0QjmdY8TvfEMTvXx1Y=;
  b=Hh4/9pZJwx7SJypxzp6TK2zYPAcVZaWCAEKzTkoFWCkuZJ7QCs3ucDiF
   RSzGFee7nFfVGriJUCxQAsuPcfUANhv0/Nq5MtihgNFleftKxCgNw0j1j
   3ceAQ1j8fUsXbZaZczLQJ6on3quVasba77a9+iy4n9fgDQBTMilvufRZh
   6rbGmBUtr3FmOlePsIzzn6zAHpPup8rPcDvfgvE9N5NtD6t4qEJLl6pXX
   QOvts5ThDb2fcROiruh01rprzgB+iugY2MRbRJthYhfkymtKS5IGND2qr
   6Zq0sktlQAzOOKqbY8pT7Lh5YDT010AwkJqu479lguMaVwp61nUhOV9FL
   A==;
X-CSE-ConnectionGUID: ORhs5CxfTIeAjn535F1/nQ==
X-CSE-MsgGUID: +k5HrvNIRD+EuqMvhEd9Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="93657457"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="93657457"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 11:09:42 -0800
X-CSE-ConnectionGUID: 3TCFC8VeRjOdBcWKwn3cgg==
X-CSE-MsgGUID: Ye8OEQJrRyqiKTg2N/Ju+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199399040"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2025 11:09:40 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX2Kg-00000000537-0pGd;
	Sat, 20 Dec 2025 19:09:38 +0000
Date: Sun, 21 Dec 2025 03:09:28 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 248d3a73a0167dce15ba100477c3e778c4787178
Message-ID: <202512210315.eA2pB5GA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 248d3a73a0167dce15ba100477c3e778c4787178  Input: ti_am335x_tsc - fix off-by-one error in wire_order validation

elapsed time: 2224m

configs tested: 81
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251220    gcc-14
i386        buildonly-randconfig-002-20251220    gcc-14
i386        buildonly-randconfig-003-20251220    gcc-14
i386        buildonly-randconfig-004-20251220    gcc-14
i386        buildonly-randconfig-005-20251220    gcc-14
i386        buildonly-randconfig-006-20251220    gcc-14
i386                                defconfig    gcc-15.1.0
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc64                          allmodconfig    clang-22
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

