Return-Path: <linux-input+bounces-2401-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1243987D929
	for <lists+linux-input@lfdr.de>; Sat, 16 Mar 2024 08:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F088A282260
	for <lists+linux-input@lfdr.de>; Sat, 16 Mar 2024 07:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0984C6D;
	Sat, 16 Mar 2024 07:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IvgzU7gJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83275DDA0
	for <linux-input@vger.kernel.org>; Sat, 16 Mar 2024 07:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710574122; cv=none; b=kBezsAOwhQ74+CFSrg9Cy03ihGgHsZTV5Hi9zLcSTbQNA1T1EQ+fFaqiwugVyLf7YF9+giLz4uBPsVeySX7cXpnXN6QvpJQpY+JS+mm0ke8Ch+OW4JemoVhYXUeUKXPiCGxuU5Vv4/Qxq0BUTmqCbn/7evEm5PbCiD39YigYWOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710574122; c=relaxed/simple;
	bh=42UY8VGuC4bKBNkpjxxAWG/qUtLUBi7k6jidVV0mwFE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BDfu2fukHMQ5BztaNijmewnkafY5z16ThqNgHL20PSzq+cQnr+IMyqPTL7hT6wn8aT4McNVS0mMKMc6tYblpaLOsUep1CqyXKZ24j1m6n4v10Sl/Ktkzokdp9b6jo2fpxeGN2sIIQ9l7s+WfJjVmpKSBHbfRl+gk8RKSWr36z0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IvgzU7gJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710574120; x=1742110120;
  h=date:from:to:cc:subject:message-id;
  bh=42UY8VGuC4bKBNkpjxxAWG/qUtLUBi7k6jidVV0mwFE=;
  b=IvgzU7gJxvwNf+JvjjAr02IzQrChhYXX3/683/AqXZA2iZ544o3/MlgK
   jMRqQOoPJv9AtSyx/sQvTtGYdmmtXzLobibNFAvPHJYy8PiTVgnyZoB/p
   cLs9yTWArjd50kuTjY0uXHMUXJrqebCmy+VHnb6SJSfO80KFxzpoGs2Oj
   Q9IICtmoxEeZIx47Z96tdPteF8ut1wftqnbP+5pn0KZYIdEci9m+eyN9w
   WaQSB2fTTpr/rNKmGWVrbpb/tzjJ3aQz2eUV+poMtl1fcyrDyuyERxvQT
   +8YcIg8qAQcbtIkyXRGdZqA7TAK+6G1ESnBn6DjIActaDX+p+QZTHUjGG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="9282409"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="9282409"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 00:28:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="17510767"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Mar 2024 00:28:38 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlOT5-000FAL-35;
	Sat, 16 Mar 2024 07:28:35 +0000
Date: Sat, 16 Mar 2024 15:27:57 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 81c32343d04f8ca974681d5fb5d939d2e1f58851
Message-ID: <202403161554.zOnVg1nQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 81c32343d04f8ca974681d5fb5d939d2e1f58851  Input: xpad - add support for Snakebyte GAMEPADs

elapsed time: 720m

configs tested: 170
configs skipped: 2

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
arc                   randconfig-001-20240316   gcc  
arc                   randconfig-002-20240316   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              alldefconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   clang
arm                         axm55xx_defconfig   clang
arm                        clps711x_defconfig   clang
arm                                 defconfig   clang
arm                          exynos_defconfig   clang
arm                   milbeaut_m10v_defconfig   clang
arm                          moxart_defconfig   gcc  
arm                            mps2_defconfig   clang
arm                         nhk8815_defconfig   clang
arm                           omap1_defconfig   gcc  
arm                            qcom_defconfig   clang
arm                   randconfig-001-20240316   gcc  
arm                   randconfig-002-20240316   gcc  
arm                   randconfig-003-20240316   gcc  
arm                   randconfig-004-20240316   gcc  
arm                         s5pv210_defconfig   gcc  
arm                           stm32_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240316   gcc  
arm64                 randconfig-002-20240316   clang
arm64                 randconfig-003-20240316   clang
arm64                 randconfig-004-20240316   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240316   gcc  
csky                  randconfig-002-20240316   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240316   clang
hexagon               randconfig-002-20240316   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240316   clang
i386         buildonly-randconfig-002-20240316   gcc  
i386         buildonly-randconfig-003-20240316   gcc  
i386         buildonly-randconfig-004-20240316   gcc  
i386         buildonly-randconfig-005-20240316   gcc  
i386         buildonly-randconfig-006-20240316   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240316   gcc  
i386                  randconfig-002-20240316   gcc  
i386                  randconfig-003-20240316   gcc  
i386                  randconfig-004-20240316   gcc  
i386                  randconfig-005-20240316   clang
i386                  randconfig-006-20240316   gcc  
i386                  randconfig-011-20240316   clang
i386                  randconfig-012-20240316   clang
i386                  randconfig-013-20240316   clang
i386                  randconfig-014-20240316   clang
i386                  randconfig-015-20240316   clang
i386                  randconfig-016-20240316   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240316   gcc  
loongarch             randconfig-002-20240316   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240316   gcc  
nios2                 randconfig-002-20240316   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240316   gcc  
parisc                randconfig-002-20240316   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      cm5200_defconfig   clang
powerpc                     kilauea_defconfig   clang
powerpc                      pcm030_defconfig   clang
powerpc                      ppc40x_defconfig   clang
powerpc               randconfig-001-20240316   clang
powerpc               randconfig-002-20240316   clang
powerpc               randconfig-003-20240316   gcc  
powerpc                     tqm8555_defconfig   clang
powerpc64             randconfig-001-20240316   gcc  
powerpc64             randconfig-002-20240316   gcc  
powerpc64             randconfig-003-20240316   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240316   gcc  
riscv                 randconfig-002-20240316   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240316   clang
s390                  randconfig-002-20240316   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240316   gcc  
sh                    randconfig-002-20240316   gcc  
sh                           se7750_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240316   gcc  
sparc64               randconfig-002-20240316   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240316   clang
um                    randconfig-002-20240316   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240316   gcc  
xtensa                randconfig-002-20240316   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

