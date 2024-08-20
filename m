Return-Path: <linux-input+bounces-5716-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C1D95909E
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 00:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E73341F21FA4
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 22:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4D31C7B87;
	Tue, 20 Aug 2024 22:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aSIVKT6l"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014CC3A8D2
	for <linux-input@vger.kernel.org>; Tue, 20 Aug 2024 22:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724193901; cv=none; b=o2RDAVsOyo7Se1znWMTqbXWVaWrbIdW7587/9R5NHKR367MV8VmFLgxnVkggoUixoc4xl0Cot6KBcDPkjHYHRyt/Xr9HuDwAJt4bJj58uSmOjNuvUoXTDTGLr9qv9o5Xtr5qk1S4I8VXGYfEMxIGVhudXXc3cTkBatO5BNuyQEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724193901; c=relaxed/simple;
	bh=pBEFlqQtMa5ek2mpCdoURX1j7fSJN1rU2fMo85k6p/E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B0GevJb7oauwLaPWrtCmbRPyRJ6xDoVYBeJNh9StmKEyzFSPaeCHR2GLplPY4Lj7IRNiYWPwhxCjclFPFmImB5TZUXlsQQvn64/YbcixPG/oKBs+QTio1EsP4OgX8zxtUOJFVZe3nv/KZx7l3xoEr8TlHUxWD07wF81bCysGe0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aSIVKT6l; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724193899; x=1755729899;
  h=date:from:to:cc:subject:message-id;
  bh=pBEFlqQtMa5ek2mpCdoURX1j7fSJN1rU2fMo85k6p/E=;
  b=aSIVKT6lUr/pMDSgbpHzleZMRyEx5s91ije2di/8Ekh6BYST0uuG7dtZ
   AJMKhaBNPRsmv8LemiH2TVzh9ATSbQw3WiEm41+L53ktXe5lxLrIkomMA
   FRRJm3g3xEBDGoPL6B+XGBIkPQMsvhCVwc5EzAg+HYOb1m6VgbtFK4JYc
   8p+ox3RZgtVr+lcEJgDIYoc+i8fmP9Po3CjBCPLSzyx9juElKElSeJufn
   o91vCd/60rgJbF1ljm+6f+DYo+sJJja8IDgfkR2+A1UWsoVAUTP0kbN0m
   yZ9+VVRToU8He4zEdnAnStZzapJba/Kv/0cNlSsRLRHEXja6MtLmeMN97
   w==;
X-CSE-ConnectionGUID: dsk5G4XPSsuXL3Cr4UotoA==
X-CSE-MsgGUID: b2ZbEXrKRCqk+JaTtAVYIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22690800"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="22690800"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:44:57 -0700
X-CSE-ConnectionGUID: Cv5lUnE4QBChexu6VmcHvg==
X-CSE-MsgGUID: DoZ7HmPNRhi0f9BJ+NM1hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="65776543"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Aug 2024 15:44:56 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgXav-000AfK-2z;
	Tue, 20 Aug 2024 22:44:53 +0000
Date: Wed, 21 Aug 2024 06:43:56 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 4e870e6bbec5c41c0d8b253282dca9465fbf5044
Message-ID: <202408210653.EHsgsiIN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 4e870e6bbec5c41c0d8b253282dca9465fbf5044  Input: himax_hx83112b - fix incorrect size when reading product ID

elapsed time: 1268m

configs tested: 212
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                            hsdk_defconfig   gcc-13.2.0
arc                   randconfig-001-20240820   gcc-13.2.0
arc                   randconfig-002-20240820   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                         assabet_defconfig   gcc-13.2.0
arm                          collie_defconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                         mv78xx0_defconfig   gcc-14.1.0
arm                   randconfig-001-20240820   gcc-13.2.0
arm                   randconfig-002-20240820   gcc-13.2.0
arm                   randconfig-003-20240820   gcc-13.2.0
arm                   randconfig-004-20240820   gcc-13.2.0
arm                           sama5_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240820   gcc-13.2.0
arm64                 randconfig-002-20240820   gcc-13.2.0
arm64                 randconfig-003-20240820   gcc-13.2.0
arm64                 randconfig-004-20240820   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240820   gcc-13.2.0
csky                  randconfig-002-20240820   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240820   clang-18
i386         buildonly-randconfig-002-20240820   clang-18
i386         buildonly-randconfig-003-20240820   clang-18
i386         buildonly-randconfig-004-20240820   clang-18
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
i386                  randconfig-011-20240820   clang-18
i386                  randconfig-011-20240820   gcc-11
i386                  randconfig-012-20240820   clang-18
i386                  randconfig-012-20240820   gcc-12
i386                  randconfig-013-20240820   clang-18
i386                  randconfig-013-20240820   gcc-12
i386                  randconfig-014-20240820   clang-18
i386                  randconfig-014-20240820   gcc-12
i386                  randconfig-015-20240820   clang-18
i386                  randconfig-015-20240820   gcc-12
i386                  randconfig-016-20240820   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch                 loongson3_defconfig   gcc-14.1.0
loongarch             randconfig-001-20240820   gcc-13.2.0
loongarch             randconfig-002-20240820   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5208evb_defconfig   gcc-13.2.0
m68k                        m5272c3_defconfig   gcc-13.2.0
m68k                       m5275evb_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                      bmips_stb_defconfig   gcc-13.2.0
mips                      maltasmvp_defconfig   gcc-14.1.0
mips                      pic32mzda_defconfig   gcc-14.1.0
mips                       rbtx49xx_defconfig   gcc-14.1.0
mips                          rm200_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240820   gcc-13.2.0
nios2                 randconfig-002-20240820   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240820   gcc-13.2.0
parisc                randconfig-002-20240820   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      arches_defconfig   gcc-14.1.0
powerpc                 canyonlands_defconfig   gcc-13.2.0
powerpc                     ep8248e_defconfig   gcc-13.2.0
powerpc                        icon_defconfig   gcc-14.1.0
powerpc                       maple_defconfig   gcc-13.2.0
powerpc                     mpc5200_defconfig   gcc-13.2.0
powerpc                 mpc832x_rdb_defconfig   gcc-13.2.0
powerpc                      ppc64e_defconfig   gcc-13.2.0
powerpc                      ppc6xx_defconfig   gcc-13.2.0
powerpc                      ppc6xx_defconfig   gcc-14.1.0
powerpc                         ps3_defconfig   gcc-14.1.0
powerpc               randconfig-003-20240820   gcc-13.2.0
powerpc                    socrates_defconfig   gcc-14.1.0
powerpc64             randconfig-001-20240820   gcc-13.2.0
powerpc64             randconfig-002-20240820   gcc-13.2.0
powerpc64             randconfig-003-20240820   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240820   gcc-13.2.0
riscv                 randconfig-002-20240820   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240820   gcc-13.2.0
s390                  randconfig-002-20240820   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                             espt_defconfig   gcc-14.1.0
sh                 kfr2r09-romimage_defconfig   gcc-13.2.0
sh                    randconfig-001-20240820   gcc-13.2.0
sh                    randconfig-002-20240820   gcc-13.2.0
sh                           se7619_defconfig   gcc-13.2.0
sh                           se7705_defconfig   gcc-13.2.0
sh                             sh03_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240820   gcc-13.2.0
sparc64               randconfig-002-20240820   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240820   gcc-13.2.0
um                    randconfig-002-20240820   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240820   clang-18
x86_64       buildonly-randconfig-002-20240820   clang-18
x86_64       buildonly-randconfig-003-20240820   clang-18
x86_64       buildonly-randconfig-004-20240820   clang-18
x86_64       buildonly-randconfig-005-20240820   clang-18
x86_64       buildonly-randconfig-006-20240820   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240820   clang-18
x86_64                randconfig-002-20240820   clang-18
x86_64                randconfig-003-20240820   clang-18
x86_64                randconfig-004-20240820   clang-18
x86_64                randconfig-005-20240820   clang-18
x86_64                randconfig-006-20240820   clang-18
x86_64                randconfig-011-20240820   clang-18
x86_64                randconfig-012-20240820   clang-18
x86_64                randconfig-013-20240820   clang-18
x86_64                randconfig-014-20240820   clang-18
x86_64                randconfig-015-20240820   clang-18
x86_64                randconfig-016-20240820   clang-18
x86_64                randconfig-071-20240820   clang-18
x86_64                randconfig-072-20240820   clang-18
x86_64                randconfig-073-20240820   clang-18
x86_64                randconfig-074-20240820   clang-18
x86_64                randconfig-075-20240820   clang-18
x86_64                randconfig-076-20240820   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240820   gcc-13.2.0
xtensa                randconfig-002-20240820   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

