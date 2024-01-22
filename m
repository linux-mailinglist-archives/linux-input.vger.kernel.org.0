Return-Path: <linux-input+bounces-1379-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6157D835A33
	for <lists+linux-input@lfdr.de>; Mon, 22 Jan 2024 06:09:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5F0F1F229FB
	for <lists+linux-input@lfdr.de>; Mon, 22 Jan 2024 05:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E883E4C65;
	Mon, 22 Jan 2024 05:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LL+jrbZE"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735907FE
	for <linux-input@vger.kernel.org>; Mon, 22 Jan 2024 05:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705900183; cv=none; b=uq8C1UojZwXyzMG8ZOtvNouuoSIRMq5LcOie0rCwasvBJ/VuQfVz4FtkfKKz0ULUVer0Wp5hybeCm3gQcwSZ4NtQ0iMhRpr6+i7EkfMgY2er1zFDkSIfkNVRSbyOV+Gv7OUlmhc9xVgeifagz4WevVzd+aOLZ7/ZzLNBgyjD5Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705900183; c=relaxed/simple;
	bh=07FVt1Ksd2FO/xq6R7KKZ3KEnUAxpC+9cnVTO2d8rwM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qX+4vOdT4D0j9oj8Yx4fvM9w+qDqeoVzjA/WMJlmguOQ9D4IdDSJenrntx8JWfw1kJ1895HRkIqgfN+3NfUeXMBd7ZK6UNjhpvFcdTuckA6bksp1Ox5Tn641QGuaZIyXC1Mx1GaLx5ihdUaDgzg0YEUcw5n/zLXaXLHzM80PF1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LL+jrbZE; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705900181; x=1737436181;
  h=date:from:to:cc:subject:message-id;
  bh=07FVt1Ksd2FO/xq6R7KKZ3KEnUAxpC+9cnVTO2d8rwM=;
  b=LL+jrbZEgK6sXguSkDlGG/TxyKJQ7MZnFiEteCu0Y5c+iWXVqxF5srPP
   4DduDHP4MtbEirRwMT86aFR6YpQxWCjjXpEkuYADwVAp539aehQLEu2+J
   RTPXxKKGW7/7rsUnUFlOS1ES44oIWE6h1A01VkgGxrjEFBKbCULgpaASU
   56yyZlsC4sqoQconrwxrLUsOuBrat0Rf/0DrJEHUys04ZBvYQmMYLngYG
   Cw4/vaF2bvGzXNR9fimVm8ABZjdxEzEuYckZWl1WNxBFnDegVLzZ3KnC+
   CA6LPYVBSCD6SGlvON8RtWMNCVdU1eL4GBvGh9IJYKs5HEpTN/roW3qB3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="404867549"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="404867549"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 21:09:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="928899908"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="928899908"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Jan 2024 21:09:39 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRmYy-0006QU-2C;
	Mon, 22 Jan 2024 05:09:36 +0000
Date: Mon, 22 Jan 2024 13:09:22 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 d259f137461b9067ff46a10922e66a6e9fc38e12
Message-ID: <202401221320.304XMlIE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: d259f137461b9067ff46a10922e66a6e9fc38e12  dt-bindings: input: touchscreen: goodix: clarify irq-gpios misleading text

elapsed time: 1440m

configs tested: 218
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240121   gcc  
arc                   randconfig-001-20240122   gcc  
arc                   randconfig-002-20240121   gcc  
arc                   randconfig-002-20240122   gcc  
arm                               allnoconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                      jornada720_defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                   randconfig-001-20240121   gcc  
arm                   randconfig-002-20240121   gcc  
arm                   randconfig-003-20240121   gcc  
arm                   randconfig-004-20240121   gcc  
arm                           stm32_defconfig   gcc  
arm                           u8500_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240121   gcc  
arm64                 randconfig-002-20240121   gcc  
arm64                 randconfig-003-20240121   gcc  
arm64                 randconfig-004-20240121   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240121   gcc  
csky                  randconfig-001-20240122   gcc  
csky                  randconfig-002-20240121   gcc  
csky                  randconfig-002-20240122   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240121   gcc  
i386         buildonly-randconfig-002-20240121   gcc  
i386         buildonly-randconfig-003-20240121   gcc  
i386         buildonly-randconfig-004-20240121   gcc  
i386         buildonly-randconfig-005-20240121   gcc  
i386         buildonly-randconfig-006-20240121   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240121   gcc  
i386                  randconfig-002-20240121   gcc  
i386                  randconfig-003-20240121   gcc  
i386                  randconfig-004-20240121   gcc  
i386                  randconfig-005-20240121   gcc  
i386                  randconfig-006-20240121   gcc  
i386                  randconfig-011-20240121   clang
i386                  randconfig-012-20240121   clang
i386                  randconfig-013-20240121   clang
i386                  randconfig-014-20240121   clang
i386                  randconfig-015-20240121   clang
i386                  randconfig-016-20240121   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240121   gcc  
loongarch             randconfig-001-20240122   gcc  
loongarch             randconfig-002-20240121   gcc  
loongarch             randconfig-002-20240122   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                         rt305x_defconfig   gcc  
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240121   gcc  
nios2                 randconfig-001-20240122   gcc  
nios2                 randconfig-002-20240121   gcc  
nios2                 randconfig-002-20240122   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240121   gcc  
parisc                randconfig-001-20240122   gcc  
parisc                randconfig-002-20240121   gcc  
parisc                randconfig-002-20240122   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                    amigaone_defconfig   gcc  
powerpc                      arches_defconfig   gcc  
powerpc                      bamboo_defconfig   gcc  
powerpc               randconfig-001-20240121   gcc  
powerpc               randconfig-002-20240121   gcc  
powerpc               randconfig-003-20240121   gcc  
powerpc                     redwood_defconfig   gcc  
powerpc                     tqm8560_defconfig   gcc  
powerpc64             randconfig-001-20240121   gcc  
powerpc64             randconfig-002-20240121   gcc  
powerpc64             randconfig-003-20240121   gcc  
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20240121   gcc  
riscv                 randconfig-002-20240121   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240122   gcc  
s390                  randconfig-002-20240122   gcc  
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20240121   gcc  
sh                    randconfig-001-20240122   gcc  
sh                    randconfig-002-20240121   gcc  
sh                    randconfig-002-20240122   gcc  
sh                          rsk7201_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240121   gcc  
sparc64               randconfig-001-20240122   gcc  
sparc64               randconfig-002-20240121   gcc  
sparc64               randconfig-002-20240122   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240121   gcc  
um                    randconfig-002-20240121   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240121   gcc  
x86_64       buildonly-randconfig-001-20240122   clang
x86_64       buildonly-randconfig-002-20240121   gcc  
x86_64       buildonly-randconfig-002-20240122   clang
x86_64       buildonly-randconfig-003-20240121   gcc  
x86_64       buildonly-randconfig-003-20240122   clang
x86_64       buildonly-randconfig-004-20240121   gcc  
x86_64       buildonly-randconfig-004-20240122   clang
x86_64       buildonly-randconfig-005-20240121   gcc  
x86_64       buildonly-randconfig-005-20240122   clang
x86_64       buildonly-randconfig-006-20240121   gcc  
x86_64       buildonly-randconfig-006-20240122   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20240121   gcc  
x86_64                randconfig-011-20240122   clang
x86_64                randconfig-012-20240121   gcc  
x86_64                randconfig-012-20240122   clang
x86_64                randconfig-013-20240121   gcc  
x86_64                randconfig-013-20240122   clang
x86_64                randconfig-014-20240121   gcc  
x86_64                randconfig-014-20240122   clang
x86_64                randconfig-015-20240121   gcc  
x86_64                randconfig-015-20240122   clang
x86_64                randconfig-016-20240121   gcc  
x86_64                randconfig-016-20240122   clang
x86_64                randconfig-071-20240121   gcc  
x86_64                randconfig-071-20240122   clang
x86_64                randconfig-072-20240121   gcc  
x86_64                randconfig-072-20240122   clang
x86_64                randconfig-073-20240121   gcc  
x86_64                randconfig-073-20240122   clang
x86_64                randconfig-074-20240121   gcc  
x86_64                randconfig-074-20240122   clang
x86_64                randconfig-075-20240121   gcc  
x86_64                randconfig-075-20240122   clang
x86_64                randconfig-076-20240121   gcc  
x86_64                randconfig-076-20240122   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20240121   gcc  
xtensa                randconfig-001-20240122   gcc  
xtensa                randconfig-002-20240121   gcc  
xtensa                randconfig-002-20240122   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

