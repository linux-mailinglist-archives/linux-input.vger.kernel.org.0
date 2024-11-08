Return-Path: <linux-input+bounces-7990-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 365D19C2551
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 20:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CEFE1F249EA
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 19:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3BD233D88;
	Fri,  8 Nov 2024 19:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hb32nq5E"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC75C233D86
	for <linux-input@vger.kernel.org>; Fri,  8 Nov 2024 19:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731092720; cv=none; b=R4gLfzhKmNXKu+gbgILDc7Le0nxZB3bs5BkAqFI1kU+JbrYkYhK2jVUPN+M2Ur5pUer7cHcq68O9Imh7xKKeodWV0NgCCMRp8xlOORNeeQDZvCmHYj+Weku0GJHoqf3MXdolWAgkMS21ph4iobGHDTPz+JnCWkLA1h5/covFsNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731092720; c=relaxed/simple;
	bh=v02WbvUUU5SUQyf2YQXRiLeNOSae7uI2TNrXn6+ayTY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nTm/UxOoLaAfvLPuPaalXa2bK3Gy7jG72VCWPwRvVDunniJYmggs43xqykoEwqMd07KAOox3QyHEdrM/47Ap6cFPW0X7cwsXdPIxVfrsQavu1knzZq6SABno1M3tjnMrbme7aJVn8Uo83SIXgRRAe4jhEd8F8RIM1RTOG49VCIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hb32nq5E; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731092719; x=1762628719;
  h=date:from:to:cc:subject:message-id;
  bh=v02WbvUUU5SUQyf2YQXRiLeNOSae7uI2TNrXn6+ayTY=;
  b=hb32nq5EMHfxjbG8IcVtQnx2I8qTrEgXBku4spUUXkwiEY1KDvWyE5Hj
   yWBrGQttCDTc8uSN37TV9D8xpliooBh6YD0L0A39wmea6LNs51jodCb8L
   eJ3/N6XCujhzJPz5EYrYnbf1srs3mJ5oTjfoATaBoo3rOHQk6TPFkZuqx
   YDxWT2P12Iz4omGjBvp+IAR4LedHbDDC3g8J0uhfBX2A0lAVZB5oDxLcV
   JCJA+jCu9Kmk/ATkQPd4NeXInws4ovcKKvD6WT7Q+lAwM4pkMDf24nJeB
   Y8Y6Fu/2JE+86dt6YxtXtG2ZIuKHPivLR0e2dH4a8V1QUDYcGbBbmfHsP
   A==;
X-CSE-ConnectionGUID: wv6fd7kyS0KF7EyXl9h4MQ==
X-CSE-MsgGUID: 0+cmPrDHReS4zsqdWmM2nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="31091392"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="31091392"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 11:05:18 -0800
X-CSE-ConnectionGUID: LDh+BrL8SIiIdVSZO3wc0g==
X-CSE-MsgGUID: IAP6EsqeQBe6ykbiVLHidg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="90535247"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Nov 2024 11:05:16 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9UID-000riG-0W;
	Fri, 08 Nov 2024 19:05:13 +0000
Date: Sat, 09 Nov 2024 03:04:28 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 5c822c0ce5cc83ed4cd8394f3dc46dae8d9a681d
Message-ID: <202411090322.xHL7K4fy-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 5c822c0ce5cc83ed4cd8394f3dc46dae8d9a681d  Input: cs40l50 - fix wrong usage of INIT_WORK()

elapsed time: 728m

configs tested: 220
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.2.0
arc                            hsdk_defconfig    clang-14
arc                 nsimosci_hs_smp_defconfig    clang-20
arc                   randconfig-001-20241108    gcc-14.2.0
arc                   randconfig-002-20241108    gcc-14.2.0
arc                           tb10x_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                         at91_dt_defconfig    clang-15
arm                                 defconfig    gcc-14.2.0
arm                            dove_defconfig    clang-14
arm                          ep93xx_defconfig    clang-14
arm                           h3600_defconfig    gcc-14.2.0
arm                            mmp2_defconfig    clang-20
arm                       multi_v4t_defconfig    clang-20
arm                        multi_v5_defconfig    clang-20
arm                           omap1_defconfig    gcc-14.2.0
arm                         orion5x_defconfig    clang-20
arm                   randconfig-001-20241108    gcc-14.2.0
arm                   randconfig-002-20241108    gcc-14.2.0
arm                   randconfig-003-20241108    gcc-14.2.0
arm                   randconfig-004-20241108    gcc-14.2.0
arm                           sama7_defconfig    clang-14
arm                           sama7_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    clang-20
arm                           tegra_defconfig    clang-15
arm                         wpcm450_defconfig    clang-15
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241108    gcc-14.2.0
arm64                 randconfig-002-20241108    gcc-14.2.0
arm64                 randconfig-003-20241108    gcc-14.2.0
arm64                 randconfig-004-20241108    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241108    gcc-14.2.0
csky                  randconfig-002-20241108    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241108    gcc-14.2.0
hexagon               randconfig-002-20241108    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241108    clang-19
i386        buildonly-randconfig-002-20241108    clang-19
i386        buildonly-randconfig-003-20241108    clang-19
i386        buildonly-randconfig-004-20241108    clang-19
i386        buildonly-randconfig-005-20241108    clang-19
i386        buildonly-randconfig-006-20241108    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241108    clang-19
i386                  randconfig-002-20241108    clang-19
i386                  randconfig-003-20241108    clang-19
i386                  randconfig-004-20241108    clang-19
i386                  randconfig-005-20241108    clang-19
i386                  randconfig-006-20241108    clang-19
i386                  randconfig-011-20241108    clang-19
i386                  randconfig-012-20241108    clang-19
i386                  randconfig-013-20241108    clang-19
i386                  randconfig-014-20241108    clang-19
i386                  randconfig-015-20241108    clang-19
i386                  randconfig-016-20241108    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20241108    gcc-14.2.0
loongarch             randconfig-002-20241108    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    clang-15
m68k                          atari_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    clang-20
m68k                            q40_defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-15
mips                       bmips_be_defconfig    gcc-14.2.0
mips                            gpr_defconfig    clang-15
mips                            gpr_defconfig    clang-20
mips                           ip30_defconfig    gcc-14.2.0
mips                      maltaaprp_defconfig    clang-14
mips                         rt305x_defconfig    clang-20
mips                   sb1250_swarm_defconfig    clang-14
mips                        vocore2_defconfig    clang-15
nios2                         10m50_defconfig    clang-20
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241108    gcc-14.2.0
nios2                 randconfig-002-20241108    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                       virt_defconfig    clang-14
parisc                           alldefconfig    clang-20
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241108    gcc-14.2.0
parisc                randconfig-002-20241108    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    amigaone_defconfig    clang-14
powerpc                   currituck_defconfig    clang-20
powerpc                       eiger_defconfig    clang-15
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                 linkstation_defconfig    clang-20
powerpc                   lite5200b_defconfig    clang-14
powerpc                     mpc512x_defconfig    clang-14
powerpc               mpc834x_itxgp_defconfig    clang-14
powerpc                  mpc885_ads_defconfig    clang-20
powerpc                      pmac32_defconfig    clang-15
powerpc                      pmac32_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241108    gcc-14.2.0
powerpc               randconfig-002-20241108    gcc-14.2.0
powerpc               randconfig-003-20241108    gcc-14.2.0
powerpc                     sequoia_defconfig    clang-14
powerpc                     skiroot_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241108    gcc-14.2.0
powerpc64             randconfig-002-20241108    gcc-14.2.0
powerpc64             randconfig-003-20241108    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-15
riscv                 randconfig-001-20241108    gcc-14.2.0
riscv                 randconfig-002-20241108    gcc-14.2.0
s390                             alldefconfig    clang-14
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241108    gcc-14.2.0
s390                  randconfig-002-20241108    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    clang-15
sh                             espt_defconfig    clang-15
sh                          kfr2r09_defconfig    clang-14
sh                            migor_defconfig    clang-14
sh                          r7785rp_defconfig    clang-20
sh                    randconfig-001-20241108    gcc-14.2.0
sh                    randconfig-002-20241108    gcc-14.2.0
sh                   secureedge5410_defconfig    clang-15
sh                        sh7757lcr_defconfig    clang-15
sh                   sh7770_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241108    gcc-14.2.0
sparc64               randconfig-002-20241108    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241108    gcc-14.2.0
um                    randconfig-002-20241108    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241108    clang-19
x86_64      buildonly-randconfig-002-20241108    clang-19
x86_64      buildonly-randconfig-003-20241108    clang-19
x86_64      buildonly-randconfig-004-20241108    clang-19
x86_64      buildonly-randconfig-005-20241108    clang-19
x86_64      buildonly-randconfig-006-20241108    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241108    clang-19
x86_64                randconfig-002-20241108    clang-19
x86_64                randconfig-003-20241108    clang-19
x86_64                randconfig-004-20241108    clang-19
x86_64                randconfig-005-20241108    clang-19
x86_64                randconfig-006-20241108    clang-19
x86_64                randconfig-011-20241108    clang-19
x86_64                randconfig-012-20241108    clang-19
x86_64                randconfig-013-20241108    clang-19
x86_64                randconfig-014-20241108    clang-19
x86_64                randconfig-015-20241108    clang-19
x86_64                randconfig-016-20241108    clang-19
x86_64                randconfig-071-20241108    clang-19
x86_64                randconfig-072-20241108    clang-19
x86_64                randconfig-073-20241108    clang-19
x86_64                randconfig-074-20241108    clang-19
x86_64                randconfig-075-20241108    clang-19
x86_64                randconfig-076-20241108    clang-19
x86_64                               rhel-8.3    gcc-12
xtensa                           alldefconfig    clang-15
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    clang-15
xtensa                  nommu_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241108    gcc-14.2.0
xtensa                randconfig-002-20241108    gcc-14.2.0
xtensa                         virt_defconfig    clang-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

