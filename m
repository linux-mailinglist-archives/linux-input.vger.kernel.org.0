Return-Path: <linux-input+bounces-5144-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9984E93B8CA
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2024 23:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B2411F23BBD
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2024 21:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFA313A885;
	Wed, 24 Jul 2024 21:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xg3Y5SQ3"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6801F13A41D
	for <linux-input@vger.kernel.org>; Wed, 24 Jul 2024 21:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721857722; cv=none; b=uPbv/0DIqIAtb4cz0PDkuq+sKYTEREoL5aWeKgx1Q0orMZsdzYbMH4B/xP8AJ0IpWxDhJQ1Yq4iBISHB3THH7XtYoPthzzK4AIMaC6j/kkyA1kZA3QfSzn3xD3lIOVAbUqE8J5m89xFQ+j9A7WArzOXcgQrb7WKJiGfPZ4wIxG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721857722; c=relaxed/simple;
	bh=+tqxqClTSVVQsTafq1426dgBp5uW6cfsVDFxWmDfm3c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TW13rOAtirb0G7pxX6+Cgj8xoCi3x4yi/gMlveWsaCXCO2lSUlPdTdThRq1AgugcwL3/mxuge/QeVb26XvCxG1Qk7IG01TKBfBYLWOwetuW2rZcLdIc6rbhj6iHXjKRXs2ZpYKF5dhYv9k4U5AAmzsOcFaIjDfBQ5RrmlzIMyeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xg3Y5SQ3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721857720; x=1753393720;
  h=date:from:to:cc:subject:message-id;
  bh=+tqxqClTSVVQsTafq1426dgBp5uW6cfsVDFxWmDfm3c=;
  b=Xg3Y5SQ3GGz7qIiGjEcjXy0KxMwZBBkx1TGRcVuyfLftAsBkd9bdKS64
   LoowMSz9ddHMBJ6zA5YlW27pz90dzgYTcAbPH5zH3w+J5wK//5NzJbsZk
   IOLzvRDDvuWXmrbkxO4Y++qORKslsMd5eirt1fEF+RoPHH5nYOf6pV/E4
   BL1sHm4axaT5bnXP7nGe+i7aztwPIei8vOtomJ37nGJ63NAQYk5oIXGOR
   35uQFfx4gD+x8Il64zXZL4U7ZFWBs3q+3Cd+jzSOSjCGw0fI8TGRLS2k4
   5ceiVdOsLA5NqV6hGc0NMHIdNNcwMWb6KpZoUKUYFwnQmuZkPYSxS1DHq
   w==;
X-CSE-ConnectionGUID: 58hjXeaOSHujrJdff7IY8g==
X-CSE-MsgGUID: /gd36G4/SoediMF7D0r68w==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="12698289"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="12698289"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 14:48:40 -0700
X-CSE-ConnectionGUID: FI5ksPctSVm/vXnHNfjEXA==
X-CSE-MsgGUID: W8Vil0crT+isUjrQSxkP7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="57021726"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jul 2024 14:48:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWjqe-000nT3-2D;
	Wed, 24 Jul 2024 21:48:36 +0000
Date: Thu, 25 Jul 2024 05:48:20 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 da897484557b34a54fabb81f6c223c19a69e546d
Message-ID: <202407250517.RVe2gnfM-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: da897484557b34a54fabb81f6c223c19a69e546d  Input: synaptics - enable SMBus for HP Elitebook 840 G2

elapsed time: 963m

configs tested: 257
configs skipped: 3

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
arc                      axs103_smp_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240724   gcc-13.2.0
arc                   randconfig-002-20240724   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                       aspeed_g5_defconfig   gcc-14.1.0
arm                     davinci_all_defconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                            hisi_defconfig   gcc-13.2.0
arm                        multi_v5_defconfig   gcc-13.2.0
arm                           omap1_defconfig   gcc-14.1.0
arm                   randconfig-001-20240724   clang-19
arm                   randconfig-001-20240724   gcc-13.2.0
arm                   randconfig-002-20240724   clang-19
arm                   randconfig-002-20240724   gcc-13.2.0
arm                   randconfig-003-20240724   clang-19
arm                   randconfig-003-20240724   gcc-13.2.0
arm                   randconfig-004-20240724   gcc-13.2.0
arm                   randconfig-004-20240724   gcc-14.1.0
arm                       spear13xx_defconfig   gcc-14.1.0
arm                           spitz_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240724   gcc-13.2.0
arm64                 randconfig-001-20240724   gcc-14.1.0
arm64                 randconfig-002-20240724   gcc-13.2.0
arm64                 randconfig-002-20240724   gcc-14.1.0
arm64                 randconfig-003-20240724   gcc-13.2.0
arm64                 randconfig-003-20240724   gcc-14.1.0
arm64                 randconfig-004-20240724   gcc-13.2.0
arm64                 randconfig-004-20240724   gcc-14.1.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240724   gcc-13.2.0
csky                  randconfig-001-20240724   gcc-14.1.0
csky                  randconfig-002-20240724   gcc-13.2.0
csky                  randconfig-002-20240724   gcc-14.1.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240724   clang-19
hexagon               randconfig-002-20240724   clang-19
i386                             alldefconfig   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240724   clang-18
i386         buildonly-randconfig-001-20240725   gcc-13
i386         buildonly-randconfig-002-20240724   clang-18
i386         buildonly-randconfig-002-20240725   gcc-13
i386         buildonly-randconfig-003-20240724   clang-18
i386         buildonly-randconfig-003-20240725   gcc-13
i386         buildonly-randconfig-004-20240724   clang-18
i386         buildonly-randconfig-004-20240725   gcc-13
i386         buildonly-randconfig-005-20240724   clang-18
i386         buildonly-randconfig-005-20240725   gcc-13
i386         buildonly-randconfig-006-20240724   clang-18
i386         buildonly-randconfig-006-20240725   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240724   clang-18
i386                  randconfig-001-20240725   gcc-13
i386                  randconfig-002-20240724   clang-18
i386                  randconfig-002-20240725   gcc-13
i386                  randconfig-003-20240724   clang-18
i386                  randconfig-003-20240725   gcc-13
i386                  randconfig-004-20240724   clang-18
i386                  randconfig-004-20240725   gcc-13
i386                  randconfig-005-20240724   clang-18
i386                  randconfig-005-20240725   gcc-13
i386                  randconfig-006-20240724   clang-18
i386                  randconfig-006-20240725   gcc-13
i386                  randconfig-011-20240724   clang-18
i386                  randconfig-011-20240725   gcc-13
i386                  randconfig-012-20240724   clang-18
i386                  randconfig-012-20240725   gcc-13
i386                  randconfig-013-20240724   clang-18
i386                  randconfig-013-20240725   gcc-13
i386                  randconfig-014-20240724   clang-18
i386                  randconfig-014-20240725   gcc-13
i386                  randconfig-015-20240724   clang-18
i386                  randconfig-015-20240725   gcc-13
i386                  randconfig-016-20240724   clang-18
i386                  randconfig-016-20240725   gcc-13
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240724   gcc-13.2.0
loongarch             randconfig-001-20240724   gcc-14.1.0
loongarch             randconfig-002-20240724   gcc-13.2.0
loongarch             randconfig-002-20240724   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5272c3_defconfig   gcc-13.2.0
m68k                          sun3x_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                         bigsur_defconfig   gcc-14.1.0
mips                      fuloong2e_defconfig   gcc-13.2.0
mips                           gcw0_defconfig   gcc-13.2.0
mips                       lemote2f_defconfig   gcc-13.2.0
mips                      pic32mzda_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240724   gcc-13.2.0
nios2                 randconfig-001-20240724   gcc-14.1.0
nios2                 randconfig-002-20240724   gcc-13.2.0
nios2                 randconfig-002-20240724   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240724   gcc-13.2.0
parisc                randconfig-001-20240724   gcc-14.1.0
parisc                randconfig-002-20240724   gcc-13.2.0
parisc                randconfig-002-20240724   gcc-14.1.0
parisc64                         alldefconfig   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-14.1.0
powerpc                     ksi8560_defconfig   gcc-14.1.0
powerpc                 mpc837x_rdb_defconfig   gcc-14.1.0
powerpc                     mpc83xx_defconfig   gcc-13.2.0
powerpc                      pmac32_defconfig   gcc-14.1.0
powerpc                      ppc44x_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240724   clang-19
powerpc               randconfig-001-20240724   gcc-13.2.0
powerpc               randconfig-002-20240724   gcc-13.2.0
powerpc               randconfig-002-20240724   gcc-14.1.0
powerpc               randconfig-003-20240724   clang-19
powerpc               randconfig-003-20240724   gcc-13.2.0
powerpc                     redwood_defconfig   gcc-14.1.0
powerpc                     taishan_defconfig   gcc-13.2.0
powerpc                     tqm8560_defconfig   gcc-14.1.0
powerpc64             randconfig-001-20240724   clang-19
powerpc64             randconfig-001-20240724   gcc-13.2.0
powerpc64             randconfig-002-20240724   gcc-13.2.0
powerpc64             randconfig-002-20240724   gcc-14.1.0
powerpc64             randconfig-003-20240724   clang-19
powerpc64             randconfig-003-20240724   gcc-13.2.0
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv             nommu_k210_sdcard_defconfig   gcc-14.1.0
riscv                    nommu_virt_defconfig   gcc-14.1.0
riscv                 randconfig-001-20240724   gcc-13.2.0
riscv                 randconfig-001-20240724   gcc-14.1.0
riscv                 randconfig-002-20240724   gcc-13.2.0
riscv                 randconfig-002-20240724   gcc-14.1.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240724   gcc-13.2.0
s390                  randconfig-001-20240724   gcc-14.1.0
s390                  randconfig-002-20240724   clang-19
s390                  randconfig-002-20240724   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                            hp6xx_defconfig   gcc-13.2.0
sh                               j2_defconfig   gcc-13.2.0
sh                            migor_defconfig   gcc-14.1.0
sh                          r7785rp_defconfig   gcc-13.2.0
sh                    randconfig-001-20240724   gcc-13.2.0
sh                    randconfig-001-20240724   gcc-14.1.0
sh                    randconfig-002-20240724   gcc-13.2.0
sh                    randconfig-002-20240724   gcc-14.1.0
sh                          sdk7780_defconfig   gcc-13.2.0
sh                           se7705_defconfig   gcc-13.2.0
sh                        sh7763rdp_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240724   gcc-13.2.0
sparc64               randconfig-001-20240724   gcc-14.1.0
sparc64               randconfig-002-20240724   gcc-13.2.0
sparc64               randconfig-002-20240724   gcc-14.1.0
um                               allmodconfig   clang-19
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240724   clang-15
um                    randconfig-001-20240724   gcc-13.2.0
um                    randconfig-002-20240724   gcc-13
um                    randconfig-002-20240724   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240724   clang-18
x86_64       buildonly-randconfig-002-20240724   clang-18
x86_64       buildonly-randconfig-003-20240724   clang-18
x86_64       buildonly-randconfig-004-20240724   clang-18
x86_64       buildonly-randconfig-005-20240724   clang-18
x86_64       buildonly-randconfig-006-20240724   clang-18
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240724   clang-18
x86_64                randconfig-002-20240724   clang-18
x86_64                randconfig-003-20240724   clang-18
x86_64                randconfig-004-20240724   clang-18
x86_64                randconfig-005-20240724   clang-18
x86_64                randconfig-006-20240724   clang-18
x86_64                randconfig-011-20240724   clang-18
x86_64                randconfig-012-20240724   clang-18
x86_64                randconfig-013-20240724   clang-18
x86_64                randconfig-014-20240724   clang-18
x86_64                randconfig-015-20240724   clang-18
x86_64                randconfig-016-20240724   clang-18
x86_64                randconfig-071-20240724   clang-18
x86_64                randconfig-072-20240724   clang-18
x86_64                randconfig-073-20240724   clang-18
x86_64                randconfig-074-20240724   clang-18
x86_64                randconfig-075-20240724   clang-18
x86_64                randconfig-076-20240724   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240724   gcc-13.2.0
xtensa                randconfig-001-20240724   gcc-14.1.0
xtensa                randconfig-002-20240724   gcc-13.2.0
xtensa                randconfig-002-20240724   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

