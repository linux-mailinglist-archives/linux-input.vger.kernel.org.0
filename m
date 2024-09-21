Return-Path: <linux-input+bounces-6629-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B108897DB2C
	for <lists+linux-input@lfdr.de>; Sat, 21 Sep 2024 03:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 224A31F221DF
	for <lists+linux-input@lfdr.de>; Sat, 21 Sep 2024 01:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10B01878;
	Sat, 21 Sep 2024 01:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjCXXG3F"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2926010E6
	for <linux-input@vger.kernel.org>; Sat, 21 Sep 2024 01:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726881623; cv=none; b=H6nv9bq62u++Lere6SawKrHu01kwN96Uyuq7YfmmB3P0ADYdnRhwCKMl4HV8Ohc1gj6Z8HwxV8dApdkUXf+GIvd535z4TUO2aeX4RMlk2iZy3M0TTr/VR6Wze+awb1xTWJkqm1YgKmeXyqLkatI9zdfcv189MxnP+RkgV3I8m90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726881623; c=relaxed/simple;
	bh=puYCQsgFT+bpnRpK4v157K68TktYUzUna2/VowV1kYI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CRBAiFEqNWKM1ZrCZFAMjvei6/93f6KlwpQQTB09/ZyzZTLgMKC1vur1dTsuig/m4gF+Qf5lWdUgRz3pOWdmRaNpixM/Qg42WDYax0ACclJ6Dgq9uwqwbG/YWCqzvYTHn91kbkNw4uh7KbuFQ3aXlrOuiqYWv/Fyy3eSwEdqKNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjCXXG3F; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726881623; x=1758417623;
  h=date:from:to:cc:subject:message-id;
  bh=puYCQsgFT+bpnRpK4v157K68TktYUzUna2/VowV1kYI=;
  b=cjCXXG3FqNwLV9EY5gQ4JTJADELsKM9x2gu0dXN+8o4o01MoHkf895+2
   68bFly1Bf0yJAdPMzrICVsxUWfFYrBn700r6aWL6O05qsEQRcjOiinAMF
   cCVIuoh8x2iTgEwlMSXZI+JNqWOtnUyWhueQq/UCCngjqsSlEvKt1vpvJ
   cugSW+tmEJyzDzmjDFZij+F5o/g6wlvaE0YduZZzKQgy+2gQQUemZ6PzN
   mpctZMDwGSLeH2q5LGH24Glh4LIzCzUFuAILsyMY1vCMAAhbQ0IOSLCyD
   03/dSrGDfCvzAgFIjARALyy1qBLysC8/RnZlsVkU37G1loG0sfvi456Wl
   Q==;
X-CSE-ConnectionGUID: gTZo/KMSSEKmJFwCKxjXJA==
X-CSE-MsgGUID: 7+2t32MnRoSGX3xREz86nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="25851684"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="25851684"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 18:20:22 -0700
X-CSE-ConnectionGUID: 78yWl3IvS7+67A/1FOxc8A==
X-CSE-MsgGUID: 7MoaxKE7T/iXo5ks/e324w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="70525300"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Sep 2024 18:20:21 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sronK-000F0x-1q;
	Sat, 21 Sep 2024 01:20:18 +0000
Date: Sat, 21 Sep 2024 09:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 eb017f4ea13b1a5ad7f4332279f2e4c67b44bdea
Message-ID: <202409210929.hWqiFPMm-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: eb017f4ea13b1a5ad7f4332279f2e4c67b44bdea  Input: adp5588-keys - fix check on return code

elapsed time: 956m

configs tested: 134
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                           tb10x_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                         assabet_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                        multi_v7_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240921    clang-18
i386        buildonly-randconfig-002-20240921    clang-18
i386        buildonly-randconfig-003-20240921    clang-18
i386        buildonly-randconfig-004-20240921    clang-18
i386        buildonly-randconfig-005-20240921    clang-18
i386        buildonly-randconfig-006-20240921    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240921    clang-18
i386                  randconfig-002-20240921    clang-18
i386                  randconfig-003-20240921    clang-18
i386                  randconfig-004-20240921    clang-18
i386                  randconfig-005-20240921    clang-18
i386                  randconfig-006-20240921    clang-18
i386                  randconfig-011-20240921    clang-18
i386                  randconfig-012-20240921    clang-18
i386                  randconfig-013-20240921    clang-18
i386                  randconfig-014-20240921    clang-18
i386                  randconfig-015-20240921    clang-18
i386                  randconfig-016-20240921    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                       m5275evb_defconfig    gcc-14.1.0
m68k                       m5475evb_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           ip28_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      arches_defconfig    gcc-14.1.0
powerpc                   currituck_defconfig    gcc-14.1.0
powerpc                      ppc6xx_defconfig    gcc-14.1.0
powerpc                  storcenter_defconfig    gcc-14.1.0
powerpc64                        alldefconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          r7780mp_defconfig    gcc-14.1.0
sh                   sh7724_generic_defconfig    gcc-14.1.0
sh                            titan_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240921    clang-18
x86_64      buildonly-randconfig-002-20240921    clang-18
x86_64      buildonly-randconfig-003-20240921    clang-18
x86_64      buildonly-randconfig-004-20240921    clang-18
x86_64      buildonly-randconfig-005-20240921    clang-18
x86_64      buildonly-randconfig-006-20240921    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20240921    clang-18
x86_64                randconfig-002-20240921    clang-18
x86_64                randconfig-003-20240921    clang-18
x86_64                randconfig-004-20240921    clang-18
x86_64                randconfig-005-20240921    clang-18
x86_64                randconfig-006-20240921    clang-18
x86_64                randconfig-011-20240921    clang-18
x86_64                randconfig-012-20240921    clang-18
x86_64                randconfig-013-20240921    clang-18
x86_64                randconfig-014-20240921    clang-18
x86_64                randconfig-015-20240921    clang-18
x86_64                randconfig-016-20240921    clang-18
x86_64                randconfig-071-20240921    clang-18
x86_64                randconfig-072-20240921    clang-18
x86_64                randconfig-073-20240921    clang-18
x86_64                randconfig-074-20240921    clang-18
x86_64                randconfig-075-20240921    clang-18
x86_64                randconfig-076-20240921    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  audio_kc705_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

