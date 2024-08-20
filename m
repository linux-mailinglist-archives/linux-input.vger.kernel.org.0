Return-Path: <linux-input+bounces-5713-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4FB958D90
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 19:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B54D91C20E90
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 17:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13151A7048;
	Tue, 20 Aug 2024 17:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h8ZAL0r8"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D998A19DF85
	for <linux-input@vger.kernel.org>; Tue, 20 Aug 2024 17:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724175710; cv=none; b=D5Fwpbl8bpm8Pa1fe0uMesZFY3kW9p1buPehYBbtiu6FhrXcelnumIIFyftfwRrUWnnK9J5GRyBvtRluNoh0PFKlt7vRESf5CiHy6Ta+ns2s4nMMExr+v5QpVHIaitHlOgvJzx7iKVorPjDyj1A219M9amYx4dUr6z64p+62gWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724175710; c=relaxed/simple;
	bh=znnTrhkLgLdjR9uQI95LGUqQLJ+PG/f9WyePQVkAnZ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UUj1UthQ1QOSdSSYdR4jfXHm3y7TGv9DryN0Sbr7RDkxVjrfCLts0cSrr5DMQQS5MVgmAgQ6HNXS/LBxMABR6sVPta+gHVkMGvQqQDwZO98/lCWsLkf1D1d36t6h+cABdxhOIL9CnFxoY2xYlshDJe5y9RLRVDwQCVHf6qbKvuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h8ZAL0r8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724175709; x=1755711709;
  h=date:from:to:cc:subject:message-id;
  bh=znnTrhkLgLdjR9uQI95LGUqQLJ+PG/f9WyePQVkAnZ0=;
  b=h8ZAL0r8qxDJDr9bQRZ29/8zXVb9rn1PvVwlfHKWNUUOW0252y2Q0M6A
   cbsg6T3vJAwHXPfliGfjlbI9O3Q5rrmJTYWpuVlt+c8N01+2o8JMFjqHs
   lQlhkxUF5IwqK1f6iaRcBtB6W3sMlVFvqOXOiI0DY34nRoAJlkcft61dU
   nU97EB+SkjcLxR/okOnbPFSxH+tAMyHCxjp0QvCb/aK0sN3wauNIpH7uC
   OG3/maWuag2bJQueUO2NjWuwCpz3cEPIRK1P5XajFuh+vBTo9sBRvJgdP
   +HrVSe5sfzaSGplDAnxMutihC7o19h4O6vVUWbNfwPNLSZEBrNakLdwFd
   A==;
X-CSE-ConnectionGUID: kALFhKaOQ9urfMuouiUDPQ==
X-CSE-MsgGUID: CkNngJg9SPSQzqh34R5FuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22379804"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="22379804"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 10:41:48 -0700
X-CSE-ConnectionGUID: IYdGP6ChTySgK6eGXUHi6w==
X-CSE-MsgGUID: n+10RW0DS96kdtYXbVfG3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="60657575"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Aug 2024 10:41:47 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgSrY-000ASi-2i;
	Tue, 20 Aug 2024 17:41:44 +0000
Date: Wed, 21 Aug 2024 01:41:27 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 105a0c76fd0c576ce1d865d5a0acf3be75900937
Message-ID: <202408210124.32YJ6oOR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 105a0c76fd0c576ce1d865d5a0acf3be75900937  Input: colibri-vf50-ts - make use of the helper function dev_err_probe()

elapsed time: 965m

configs tested: 143
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240820   gcc-13.2.0
arc                   randconfig-002-20240820   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                   randconfig-001-20240820   clang-20
arm                   randconfig-002-20240820   clang-20
arm                   randconfig-003-20240820   clang-20
arm                   randconfig-004-20240820   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240820   clang-20
arm64                 randconfig-002-20240820   clang-20
arm64                 randconfig-003-20240820   gcc-14.1.0
arm64                 randconfig-004-20240820   clang-20
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240820   gcc-14.1.0
csky                  randconfig-002-20240820   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240820   clang-20
hexagon               randconfig-002-20240820   clang-20
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240820   clang-18
i386         buildonly-randconfig-002-20240820   clang-18
i386         buildonly-randconfig-003-20240820   clang-18
i386         buildonly-randconfig-004-20240820   gcc-12
i386         buildonly-randconfig-005-20240820   clang-18
i386         buildonly-randconfig-006-20240820   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240820   clang-18
i386                  randconfig-002-20240820   clang-18
i386                  randconfig-003-20240820   clang-18
i386                  randconfig-004-20240820   clang-18
i386                  randconfig-005-20240820   clang-18
i386                  randconfig-006-20240820   clang-18
i386                  randconfig-011-20240820   gcc-11
i386                  randconfig-012-20240820   gcc-12
i386                  randconfig-013-20240820   gcc-12
i386                  randconfig-014-20240820   gcc-12
i386                  randconfig-015-20240820   gcc-12
i386                  randconfig-016-20240820   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240820   gcc-14.1.0
loongarch             randconfig-002-20240820   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240820   gcc-14.1.0
nios2                 randconfig-002-20240820   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240820   gcc-14.1.0
parisc                randconfig-002-20240820   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc               randconfig-001-20240820   gcc-14.1.0
powerpc               randconfig-002-20240820   clang-20
powerpc               randconfig-003-20240820   clang-20
powerpc64             randconfig-001-20240820   gcc-14.1.0
powerpc64             randconfig-002-20240820   clang-20
powerpc64             randconfig-003-20240820   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240820   clang-20
riscv                 randconfig-002-20240820   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240820   gcc-14.1.0
s390                  randconfig-002-20240820   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240820   gcc-14.1.0
sh                    randconfig-002-20240820   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240820   gcc-14.1.0
sparc64               randconfig-002-20240820   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240820   gcc-12
um                    randconfig-002-20240820   clang-20
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240820   clang-18
x86_64       buildonly-randconfig-002-20240820   gcc-11
x86_64       buildonly-randconfig-003-20240820   clang-18
x86_64       buildonly-randconfig-004-20240820   clang-18
x86_64       buildonly-randconfig-005-20240820   clang-18
x86_64       buildonly-randconfig-006-20240820   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240820   gcc-12
x86_64                randconfig-002-20240820   gcc-12
x86_64                randconfig-003-20240820   clang-18
x86_64                randconfig-004-20240820   gcc-12
x86_64                randconfig-005-20240820   clang-18
x86_64                randconfig-006-20240820   gcc-12
x86_64                randconfig-011-20240820   clang-18
x86_64                randconfig-012-20240820   gcc-12
x86_64                randconfig-013-20240820   clang-18
x86_64                randconfig-014-20240820   clang-18
x86_64                randconfig-015-20240820   gcc-12
x86_64                randconfig-016-20240820   clang-18
x86_64                randconfig-071-20240820   gcc-12
x86_64                randconfig-072-20240820   gcc-12
x86_64                randconfig-073-20240820   gcc-12
x86_64                randconfig-074-20240820   clang-18
x86_64                randconfig-075-20240820   clang-18
x86_64                randconfig-076-20240820   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240820   gcc-14.1.0
xtensa                randconfig-002-20240820   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

