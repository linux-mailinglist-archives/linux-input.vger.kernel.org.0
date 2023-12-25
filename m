Return-Path: <linux-input+bounces-975-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D8F81DF94
	for <lists+linux-input@lfdr.de>; Mon, 25 Dec 2023 10:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CC8DB20EF3
	for <lists+linux-input@lfdr.de>; Mon, 25 Dec 2023 09:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EAF01798A;
	Mon, 25 Dec 2023 09:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d70ygYPx"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6A9168BA
	for <linux-input@vger.kernel.org>; Mon, 25 Dec 2023 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703497929; x=1735033929;
  h=date:from:to:cc:subject:message-id;
  bh=n5fqvs6gtTpqAf5yEmiX6Rq7suso7HjqvJ+7j5WSXKA=;
  b=d70ygYPxplw2Kd9SSjIpWJus9atBDSFxvY1oCKDVpTPXWSUE4pJ6nyQ4
   JL/2r2KGa8lLkkKMmJAhBY4IET8KOoOgBVNqNBqHJBukwfCswNDsbLRZY
   dyjtSKfH3+W24vHT+9drEo5/2S4+lsktvG9e2bmLr8ATVaQKDkF7eQ+S3
   OpCqv+Sut3+LleT0vqqO6qBuVrcPD3/uISsdqpU3NpfANFR1zdjmehymx
   EB4OluvldwyHSnJUHUHi0dRmDyQax8PWHVRzffBocw9lnqJYyXk9KvnT7
   9xKn5q9s6FLJRXTazn6yd7F0UDOyLNDXzcx/nw1WWGwteH8rlTuaQ5qKB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="3112744"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="3112744"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 01:52:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="1024873309"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="1024873309"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 25 Dec 2023 01:52:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHhcz-000DCA-1E;
	Mon, 25 Dec 2023 09:52:05 +0000
Date: Mon, 25 Dec 2023 17:51:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 435e84ec2009bf40625ee7ca1f8453d3b22edf75
Message-ID: <202312251736.ma2vPUlZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 435e84ec2009bf40625ee7ca1f8453d3b22edf75  Input: zforce_ts - accept standard touchscreen properties

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- nios2-allmodconfig
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-pata_ftide010.o
    `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
clang_recent_errors
|-- arm-randconfig-003-20231225
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o
`-- powerpc-randconfig-003-20231225
    `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-ata-sata_gemini.o

elapsed time: 1445m

configs tested: 105
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231225   gcc  
arc                   randconfig-002-20231225   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20231225   clang
arm                   randconfig-002-20231225   clang
arm                   randconfig-003-20231225   clang
arm                   randconfig-004-20231225   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231225   clang
arm64                 randconfig-002-20231225   clang
arm64                 randconfig-003-20231225   clang
arm64                 randconfig-004-20231225   clang
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231225   gcc  
csky                  randconfig-002-20231225   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231225   clang
hexagon               randconfig-002-20231225   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231224   gcc  
i386         buildonly-randconfig-002-20231224   gcc  
i386         buildonly-randconfig-003-20231224   gcc  
i386         buildonly-randconfig-004-20231224   gcc  
i386         buildonly-randconfig-005-20231224   gcc  
i386         buildonly-randconfig-006-20231224   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231224   gcc  
i386                  randconfig-002-20231224   gcc  
i386                  randconfig-003-20231224   gcc  
i386                  randconfig-004-20231224   gcc  
i386                  randconfig-005-20231224   gcc  
i386                  randconfig-006-20231224   gcc  
i386                  randconfig-011-20231224   clang
i386                  randconfig-012-20231224   clang
i386                  randconfig-013-20231224   clang
i386                  randconfig-014-20231224   clang
i386                  randconfig-015-20231224   clang
i386                  randconfig-016-20231224   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231225   gcc  
loongarch             randconfig-002-20231225   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                 randconfig-001-20231225   gcc  
nios2                 randconfig-002-20231225   gcc  
parisc                randconfig-001-20231225   gcc  
parisc                randconfig-002-20231225   gcc  
powerpc               randconfig-001-20231225   clang
powerpc               randconfig-002-20231225   clang
powerpc               randconfig-003-20231225   clang
powerpc64             randconfig-001-20231225   clang
powerpc64             randconfig-002-20231225   clang
powerpc64             randconfig-003-20231225   clang
riscv                 randconfig-001-20231225   clang
riscv                 randconfig-002-20231225   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20231225   gcc  
s390                  randconfig-002-20231225   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                    randconfig-001-20231225   gcc  
sh                    randconfig-002-20231225   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20231225   gcc  
sparc64               randconfig-002-20231225   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                    randconfig-001-20231225   clang
um                    randconfig-002-20231225   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20231225   gcc  
xtensa                randconfig-002-20231225   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

