Return-Path: <linux-input+bounces-4050-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7488D87DF
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 19:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 554C728465F
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 17:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DD878283;
	Mon,  3 Jun 2024 17:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UD1Tq0SA"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798A625622
	for <linux-input@vger.kernel.org>; Mon,  3 Jun 2024 17:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717435608; cv=none; b=Zw20yrXiDfNRRD8pim7Zh5sM1yuOk0VZTebvLzx8w0VMzxRVm+zgFsXOqoWPNNNS2dyTtEb4TzkjTZDNwTB7+dL53dhIV7cQLbZdK99HvUSJW4Rvk79ON3cGha/YjKU33/eaW/RSSse+sMUVkbP9EzbN4+0fqBbhnLmXdMFzyhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717435608; c=relaxed/simple;
	bh=Q1u4YyYsnE3UdfRotKAYUFJGN/P+o3AQm+DFu4EXngk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CQNiUAUaNyb2ikNXNxnW2caozNoCLEwEOGZAZhuRhAC1WbFsSwG5xgjEfTdaXMzBzlaOg68b6J2kVXtraSFaO6kFREjGu5vgYB6660Mi2oy2GamGw4KRPNNRHxtmyhFMQFkyuEN5H27YO5lfPqsp/pVTIm7vNxzlSns6PqVcstQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UD1Tq0SA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717435606; x=1748971606;
  h=date:from:to:cc:subject:message-id;
  bh=Q1u4YyYsnE3UdfRotKAYUFJGN/P+o3AQm+DFu4EXngk=;
  b=UD1Tq0SAUhpq3vJKdgS7lLMBmDAigvRRy3ksqKy7mFHlYjTlk8eMVrIR
   Z3G/43wYcWMItTsOdCU4q3R/7ojtwAOEziwHrnYmnSjsNdrLsdW6B3gD+
   M/fOWm3HXW+ztsB2Jdn0HviFk9eTog9tkq2fuURkH/1P7GO5hJfguVJT5
   GL999z6FS6gUO9OtNCXtNTzJP0x3R8JZOwN4+Jp4qNwjm3ILxsyBRMni/
   XX/gTRAtG5DFt+d3mD/jO51xZxUP9pEDlZOciSld26nEU0lT7g6uv78H7
   RpncW4u3Jh/SeP4Fu0EzTP1pYtgSeG9W2nvQ812KEVIXDbYiYZ4rTg1SC
   g==;
X-CSE-ConnectionGUID: Qz/HGHOPQKOUIvZp3oKkIA==
X-CSE-MsgGUID: 4l1Cn7NNQZyPu3nIYVATQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="39345517"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="39345517"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 10:26:46 -0700
X-CSE-ConnectionGUID: ocD/mWgjTQmnoWTTN5xF8A==
X-CSE-MsgGUID: 1uc3OqTIRvC+3knKHZrBzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="41487639"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jun 2024 10:26:45 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEBSE-000LyT-2M;
	Mon, 03 Jun 2024 17:26:42 +0000
Date: Tue, 04 Jun 2024 01:26:08 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 2960d4c8e77aba365df80b69e72f88b29011b111
Message-ID: <202406040105.Jly9zRdC-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 2960d4c8e77aba365df80b69e72f88b29011b111  Input: tablet - use sizeof(*pointer) instead of sizeof(type)

elapsed time: 759m

configs tested: 163
configs skipped: 3

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
arc                   randconfig-001-20240603   gcc  
arc                   randconfig-002-20240603   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240603   gcc  
arm                   randconfig-002-20240603   gcc  
arm                   randconfig-003-20240603   gcc  
arm                   randconfig-004-20240603   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240603   gcc  
arm64                 randconfig-002-20240603   gcc  
arm64                 randconfig-003-20240603   clang
arm64                 randconfig-004-20240603   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240603   gcc  
csky                  randconfig-002-20240603   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240603   clang
hexagon               randconfig-002-20240603   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240603   clang
i386         buildonly-randconfig-002-20240603   clang
i386         buildonly-randconfig-003-20240603   gcc  
i386         buildonly-randconfig-004-20240603   gcc  
i386         buildonly-randconfig-005-20240603   gcc  
i386         buildonly-randconfig-006-20240603   clang
i386                                defconfig   clang
i386                  randconfig-001-20240603   clang
i386                  randconfig-002-20240603   gcc  
i386                  randconfig-003-20240603   gcc  
i386                  randconfig-004-20240603   clang
i386                  randconfig-005-20240603   clang
i386                  randconfig-006-20240603   gcc  
i386                  randconfig-011-20240603   clang
i386                  randconfig-012-20240603   clang
i386                  randconfig-013-20240603   clang
i386                  randconfig-014-20240603   clang
i386                  randconfig-015-20240603   clang
i386                  randconfig-016-20240603   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240603   gcc  
loongarch             randconfig-002-20240603   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240603   gcc  
nios2                 randconfig-002-20240603   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240603   gcc  
parisc                randconfig-002-20240603   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240603   gcc  
powerpc               randconfig-002-20240603   gcc  
powerpc               randconfig-003-20240603   gcc  
powerpc64             randconfig-001-20240603   gcc  
powerpc64             randconfig-002-20240603   gcc  
powerpc64             randconfig-003-20240603   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240603   clang
riscv                 randconfig-002-20240603   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240603   clang
s390                  randconfig-002-20240603   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240603   gcc  
sh                    randconfig-002-20240603   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240603   gcc  
sparc64               randconfig-002-20240603   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240603   clang
um                    randconfig-002-20240603   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240603   gcc  
x86_64       buildonly-randconfig-002-20240603   gcc  
x86_64       buildonly-randconfig-003-20240603   gcc  
x86_64       buildonly-randconfig-004-20240603   clang
x86_64       buildonly-randconfig-005-20240603   clang
x86_64       buildonly-randconfig-006-20240603   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240603   gcc  
x86_64                randconfig-002-20240603   clang
x86_64                randconfig-003-20240603   clang
x86_64                randconfig-004-20240603   gcc  
x86_64                randconfig-005-20240603   gcc  
x86_64                randconfig-006-20240603   gcc  
x86_64                randconfig-011-20240603   gcc  
x86_64                randconfig-012-20240603   gcc  
x86_64                randconfig-013-20240603   clang
x86_64                randconfig-014-20240603   gcc  
x86_64                randconfig-015-20240603   gcc  
x86_64                randconfig-016-20240603   clang
x86_64                randconfig-071-20240603   clang
x86_64                randconfig-072-20240603   clang
x86_64                randconfig-073-20240603   clang
x86_64                randconfig-074-20240603   clang
x86_64                randconfig-075-20240603   gcc  
x86_64                randconfig-076-20240603   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240603   gcc  
xtensa                randconfig-002-20240603   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

