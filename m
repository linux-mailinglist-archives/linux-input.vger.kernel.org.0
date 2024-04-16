Return-Path: <linux-input+bounces-3093-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A038A75C3
	for <lists+linux-input@lfdr.de>; Tue, 16 Apr 2024 22:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D58E91C21409
	for <lists+linux-input@lfdr.de>; Tue, 16 Apr 2024 20:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836EC3BB24;
	Tue, 16 Apr 2024 20:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsN8t9Z4"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D222C33998
	for <linux-input@vger.kernel.org>; Tue, 16 Apr 2024 20:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713299694; cv=none; b=jSMEWEAObltVQydBsMOffI5rLwEc1b6jhjb/rtYWRmBhhgLlPobReJLx0sTwNlH3WsqbOTMopVhjVlm9ynpaqxeb2F8oPYsVJNIx3aqNpGxKBIBjfzdjxt9OsG29LsHRZYg79YDgcQp0IRtAbnlLhwNQLLZqsLHEw9pIKdTNVio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713299694; c=relaxed/simple;
	bh=Hhptk7BvFvrg/ucVrP4i8dl0GDIyXz76sYzEzqRr4Xs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QsKlt8ZSsP74y4uimgGTGQDSkGjnXFJd8C/KyAm6Jdj4m0ZFw3PChVP2kOhGErtAMeTNS/IIHx7P/kjKZoxFl8x/nyOsc1CgA+x+MLKc7msTnd7feRYaaPDGuoYZZOwiDiZx4t3xzb0rMYoeSPRDfpUCtDTbEx/+kEL02f1WbJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsN8t9Z4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713299693; x=1744835693;
  h=date:from:to:cc:subject:message-id;
  bh=Hhptk7BvFvrg/ucVrP4i8dl0GDIyXz76sYzEzqRr4Xs=;
  b=dsN8t9Z4P9GHi6xl96B1kusN2z3CvPS+JbuDJg3Ss9hP0jgoC8721w+B
   hqfjOomU9HNZrsPj66JfDpJOZmP7ebwXsBtAm3hwma9Q/r3gMfKXl2NAP
   WKP4V54HPXva8Wsgi/AVD9TfAftCCoDTQ6It4oZ8sEPnrPs3nNvBQ2voY
   cE/ku9Gxs3YJchZt+Mih14y6iTB5ZAp/tBESa6CCs6of6ldLbm8Buy8b+
   zAj/l/9J1wjvpC2KvEKCPPTbACWCI8qWFBWB3B3yVUqrrlxP7s8JCQfO1
   5ioG6U/jwpUwS8LqjhbHnLuUJYsEmLke+Cnwie5IyNZFToB9FocLpBsEf
   g==;
X-CSE-ConnectionGUID: juG85MjYSUybIyMZOGI3xA==
X-CSE-MsgGUID: sRHZgHNHQ/y7SNjIfyp1hg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8935211"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="8935211"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:34:52 -0700
X-CSE-ConnectionGUID: Qcx+0mi2RL+xmW1+9/0uPQ==
X-CSE-MsgGUID: 7JXua/vGQsi9zLX+7hD9Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="27170458"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 16 Apr 2024 13:34:51 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwpVw-0005ig-1L;
	Tue, 16 Apr 2024 20:34:48 +0000
Date: Wed, 17 Apr 2024 04:34:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 48c0687a322d54ac7e7a685c0b6db78d78f593af
Message-ID: <202404170410.PRqUtKeN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 48c0687a322d54ac7e7a685c0b6db78d78f593af  Input: pm8xxx-vibrator - correct VIB_MAX_LEVELS calculation

elapsed time: 1218m

configs tested: 158
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
arc                   randconfig-001-20240416   gcc  
arc                   randconfig-002-20240416   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   clang
arm                                 defconfig   clang
arm                           h3600_defconfig   gcc  
arm                   randconfig-003-20240416   gcc  
arm                           sama5_defconfig   gcc  
arm                           stm32_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240416   gcc  
arm64                 randconfig-003-20240416   gcc  
arm64                 randconfig-004-20240416   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240416   gcc  
csky                  randconfig-002-20240416   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240416   gcc  
i386         buildonly-randconfig-002-20240416   gcc  
i386         buildonly-randconfig-003-20240416   clang
i386         buildonly-randconfig-004-20240416   clang
i386         buildonly-randconfig-005-20240416   clang
i386         buildonly-randconfig-006-20240416   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240416   clang
i386                  randconfig-002-20240416   clang
i386                  randconfig-003-20240416   gcc  
i386                  randconfig-004-20240416   clang
i386                  randconfig-005-20240416   gcc  
i386                  randconfig-006-20240416   gcc  
i386                  randconfig-011-20240416   clang
i386                  randconfig-012-20240416   gcc  
i386                  randconfig-013-20240416   clang
i386                  randconfig-014-20240416   gcc  
i386                  randconfig-015-20240416   clang
i386                  randconfig-016-20240416   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240416   gcc  
loongarch             randconfig-002-20240416   gcc  
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
nios2                            alldefconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240416   gcc  
nios2                 randconfig-002-20240416   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240416   gcc  
parisc                randconfig-002-20240416   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      bamboo_defconfig   clang
powerpc                       holly_defconfig   clang
powerpc                  mpc866_ads_defconfig   clang
powerpc               randconfig-002-20240416   gcc  
powerpc64             randconfig-001-20240416   gcc  
powerpc64             randconfig-002-20240416   gcc  
powerpc64             randconfig-003-20240416   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240416   gcc  
riscv                 randconfig-002-20240416   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-002-20240416   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                    randconfig-001-20240416   gcc  
sh                    randconfig-002-20240416   gcc  
sh                           se7712_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240416   gcc  
sparc64               randconfig-002-20240416   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240416   gcc  
um                    randconfig-002-20240416   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240416   gcc  
x86_64       buildonly-randconfig-002-20240416   gcc  
x86_64       buildonly-randconfig-003-20240416   gcc  
x86_64       buildonly-randconfig-005-20240416   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-003-20240416   gcc  
x86_64                randconfig-006-20240416   gcc  
x86_64                randconfig-011-20240416   gcc  
x86_64                randconfig-016-20240416   gcc  
x86_64                randconfig-075-20240416   gcc  
x86_64                randconfig-076-20240416   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240416   gcc  
xtensa                randconfig-002-20240416   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

