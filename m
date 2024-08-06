Return-Path: <linux-input+bounces-5366-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FB394867A
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 02:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 976581C20AE4
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 00:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB2C161;
	Tue,  6 Aug 2024 00:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fvTu3YWT"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A247625
	for <linux-input@vger.kernel.org>; Tue,  6 Aug 2024 00:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722902589; cv=none; b=rXIkubbpckPzL5q71nJA9uEdU7aHqTZZRiiFeVut4CvTk6a/6KKBVjr1duEqhY3M//ENatezFGfvNDVam1Uai38I2YqCMHnuwDprf7IJXbyvFnWtPLO5bA+PvpoiIRgEA42m8kyl+45U4LiXIQdQiFtd8pxem0N1A+9vsh/bVPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722902589; c=relaxed/simple;
	bh=BLSuoh/C5iy3kdCohGVgtZm4yO8s1zpZoupFIux5e5U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eUmTbe/IdtuTTNODLCi71dNl7RTxkD29LZINbcVguJQkWtLgQpDg/Kic2Q/HeaKPyvEc/jGgyEefAP1udwzR47CrO+4Qs1/kocQrL3FBtVms+X0gSO1SJ0VSu5b5o4goJtWgkb0n19XcLT7grPOJlhqNMAiq5KdxGNCtFbgi+dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fvTu3YWT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722902587; x=1754438587;
  h=date:from:to:cc:subject:message-id;
  bh=BLSuoh/C5iy3kdCohGVgtZm4yO8s1zpZoupFIux5e5U=;
  b=fvTu3YWTeGBH5voNiopvE8aDK40fVa/4Do4rw8c1dYJHZgh3RBp0TloC
   sIHTHY1mA+WZtp3u2FnipVgbCI9uz4/rJQxa+SvsMsG7umHKE3ZLCOl1y
   ugPxwbkJSVUAHwly8cxqoUVHkJrZZPoBufI/wQCrM0lyKjCSOS7lUgdNV
   TLVD+s9Thqe7pqs6rfoA1kOgUD+8+o+1+tGscvZMHYYGiKdmq7k8AcWNg
   ruMtMT4MAdKp1TBgg6dWvfMc7zN3kuMsg5yCVrb41TwH2g1iD5nPCcgaR
   5YSI28bSNRIRkXJhL0gFOUvS5/W3kbLpFxkdTcJ4vEsrHCKliIGjJ6++4
   Q==;
X-CSE-ConnectionGUID: 6ZEehiV3R2i5nZx3bp3b8Q==
X-CSE-MsgGUID: UKm3dYfSROm7Iqj5kWnTIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="31556664"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="31556664"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 17:03:06 -0700
X-CSE-ConnectionGUID: 2FpH21ceQz2V5IwCmXg26g==
X-CSE-MsgGUID: qhEfXG5dRMWusDf4NsqB0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="56538651"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 05 Aug 2024 17:03:06 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb7fL-0003tQ-0H;
	Tue, 06 Aug 2024 00:03:03 +0000
Date: Tue, 06 Aug 2024 08:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 206f533a0a7c683982af473079c4111f4a0f9f5e
Message-ID: <202408060821.8k6V4r92-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 206f533a0a7c683982af473079c4111f4a0f9f5e  Input: uinput - reject requests with unreasonable number of slots

elapsed time: 987m

configs tested: 202
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240805   gcc-13.2.0
arc                   randconfig-002-20240805   gcc-13.2.0
arc                           tb10x_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         axm55xx_defconfig   gcc-13.2.0
arm                         bcm2835_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                      jornada720_defconfig   gcc-13.2.0
arm                        keystone_defconfig   gcc-13.2.0
arm                         mv78xx0_defconfig   gcc-13.2.0
arm                         nhk8815_defconfig   gcc-13.2.0
arm                           omap1_defconfig   gcc-13.2.0
arm                   randconfig-001-20240805   gcc-13.2.0
arm                   randconfig-002-20240805   gcc-13.2.0
arm                   randconfig-003-20240805   gcc-13.2.0
arm                   randconfig-004-20240805   gcc-13.2.0
arm                             rpc_defconfig   gcc-13.2.0
arm                           sama5_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240805   gcc-13.2.0
arm64                 randconfig-002-20240805   gcc-13.2.0
arm64                 randconfig-003-20240805   gcc-13.2.0
arm64                 randconfig-004-20240805   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240805   gcc-13.2.0
csky                  randconfig-002-20240805   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240805   clang-18
i386         buildonly-randconfig-002-20240805   clang-18
i386         buildonly-randconfig-003-20240805   clang-18
i386         buildonly-randconfig-004-20240805   clang-18
i386         buildonly-randconfig-005-20240805   clang-18
i386         buildonly-randconfig-006-20240805   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240805   clang-18
i386                  randconfig-002-20240805   clang-18
i386                  randconfig-003-20240805   clang-18
i386                  randconfig-004-20240805   clang-18
i386                  randconfig-005-20240805   clang-18
i386                  randconfig-006-20240805   clang-18
i386                  randconfig-011-20240805   clang-18
i386                  randconfig-012-20240805   clang-18
i386                  randconfig-013-20240805   clang-18
i386                  randconfig-014-20240805   clang-18
i386                  randconfig-015-20240805   clang-18
i386                  randconfig-016-20240805   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240805   gcc-13.2.0
loongarch             randconfig-002-20240805   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5407c3_defconfig   gcc-13.2.0
m68k                        mvme147_defconfig   gcc-13.2.0
m68k                           virt_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                       bmips_be_defconfig   gcc-13.2.0
mips                     cu1000-neo_defconfig   gcc-13.2.0
mips                         db1xxx_defconfig   gcc-13.2.0
mips                          eyeq6_defconfig   gcc-13.2.0
mips                           ip22_defconfig   gcc-13.2.0
mips                          malta_defconfig   gcc-13.2.0
mips                      maltasmvp_defconfig   gcc-13.2.0
mips                        vocore2_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240805   gcc-13.2.0
nios2                 randconfig-002-20240805   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
openrisc                       virt_defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240805   gcc-13.2.0
parisc                randconfig-002-20240805   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      chrp32_defconfig   gcc-13.2.0
powerpc                      cm5200_defconfig   gcc-13.2.0
powerpc                   currituck_defconfig   gcc-13.2.0
powerpc                        fsp2_defconfig   gcc-13.2.0
powerpc                 mpc8315_rdb_defconfig   gcc-13.2.0
powerpc                      pmac32_defconfig   gcc-13.2.0
powerpc                      ppc64e_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240805   gcc-13.2.0
powerpc                    socrates_defconfig   gcc-13.2.0
powerpc                     stx_gp3_defconfig   gcc-13.2.0
powerpc                     tqm8540_defconfig   gcc-13.2.0
powerpc                     tqm8555_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240805   gcc-13.2.0
powerpc64             randconfig-002-20240805   gcc-13.2.0
powerpc64             randconfig-003-20240805   gcc-13.2.0
riscv                            alldefconfig   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240805   gcc-13.2.0
riscv                 randconfig-002-20240805   gcc-13.2.0
s390                             alldefconfig   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240805   gcc-13.2.0
s390                  randconfig-002-20240805   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                        edosk7705_defconfig   gcc-13.2.0
sh                    randconfig-001-20240805   gcc-13.2.0
sh                    randconfig-002-20240805   gcc-13.2.0
sh                           se7705_defconfig   gcc-13.2.0
sh                           sh2007_defconfig   gcc-13.2.0
sh                     sh7710voipgw_defconfig   gcc-13.2.0
sh                  sh7785lcr_32bit_defconfig   gcc-13.2.0
sh                            shmin_defconfig   gcc-13.2.0
sh                            titan_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240805   gcc-13.2.0
sparc64               randconfig-002-20240805   gcc-13.2.0
um                               alldefconfig   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240805   gcc-13.2.0
um                    randconfig-002-20240805   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240805   gcc-12
x86_64       buildonly-randconfig-002-20240805   gcc-12
x86_64       buildonly-randconfig-003-20240805   gcc-12
x86_64       buildonly-randconfig-004-20240805   gcc-12
x86_64       buildonly-randconfig-005-20240805   gcc-12
x86_64       buildonly-randconfig-006-20240805   gcc-12
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240805   gcc-12
x86_64                randconfig-002-20240805   gcc-12
x86_64                randconfig-003-20240805   gcc-12
x86_64                randconfig-004-20240805   gcc-12
x86_64                randconfig-005-20240805   gcc-12
x86_64                randconfig-006-20240805   gcc-12
x86_64                randconfig-011-20240805   gcc-12
x86_64                randconfig-012-20240805   gcc-12
x86_64                randconfig-013-20240805   gcc-12
x86_64                randconfig-014-20240805   gcc-12
x86_64                randconfig-015-20240805   gcc-12
x86_64                randconfig-016-20240805   gcc-12
x86_64                randconfig-071-20240805   gcc-12
x86_64                randconfig-072-20240805   gcc-12
x86_64                randconfig-073-20240805   gcc-12
x86_64                randconfig-074-20240805   gcc-12
x86_64                randconfig-075-20240805   gcc-12
x86_64                randconfig-076-20240805   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                generic_kc705_defconfig   gcc-13.2.0
xtensa                          iss_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240805   gcc-13.2.0
xtensa                randconfig-002-20240805   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

