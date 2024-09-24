Return-Path: <linux-input+bounces-6652-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C639842E1
	for <lists+linux-input@lfdr.de>; Tue, 24 Sep 2024 12:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADB091C21E58
	for <lists+linux-input@lfdr.de>; Tue, 24 Sep 2024 10:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C87A158DD9;
	Tue, 24 Sep 2024 10:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6rM87Od"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBD11494CE
	for <linux-input@vger.kernel.org>; Tue, 24 Sep 2024 10:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727172134; cv=none; b=jvMZYPN9YHthbjVGYq247CJp2HqMQJugQABILYNjdEAAFcHE+rQflD8P3p45eRluHAbhyLifpi8MImNzTBhJivMZLRzlMfYc0HL+c/jiE7HZw6dyh/v1OiQqysp2Soi1PDaT0nHG9XBrUMt1MgosCJ5zTHvgF8f22tcCV2MI+Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727172134; c=relaxed/simple;
	bh=Pb8Rb52u5y/1Vgcfb8n4D/SgNOjQsv+yejK8IKKX2fI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rkeXp+f0MqKjIVDDBJi3hUfmEhZAquUH5V3Q+Vpmbtn+/05Y7IfijAhqFf3xtpBfE7jqRCVOVscofsQhKJ3sRv4tb1Z6MKBsHJTQfimkbYmRRs3msNwjOOwD63NxlFCKwt5uPdEiDaLanxGprFmSlYP7Ark3Exl8kBquKpUeIFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6rM87Od; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727172133; x=1758708133;
  h=date:from:to:cc:subject:message-id;
  bh=Pb8Rb52u5y/1Vgcfb8n4D/SgNOjQsv+yejK8IKKX2fI=;
  b=l6rM87OdXMIOOTnmHKXE1JnqWLdv56P8ymmEzRlbYA+Ox5fU/MFrcnrv
   y+K090r01b5dWPXJhtYeTCbpjPaffVEUA6la+S3z7Wu8QTeC3D5Y8vkRg
   YTHsrXtUmz10D4gCqU13AY8jwIEn7QfHz7jJV/Oq8aIjeaQ+K3Lbj+UiV
   LUm+ER+kdfUW8hjuSe/+m/Zy22RpmSZ84oa/k1+l4paL098axxnnXMcdM
   8QpERNFcs5XUav2lAN3L/KhNIvXvVg9xgOZFFs0WmyFD1wSm8Y8VkWbkp
   jc6wfPl3ahIecE8X8X9ESblisFlPFRBPMEjiRk1F2DpER4+192BZYKZyQ
   w==;
X-CSE-ConnectionGUID: KRzCmnUWSNmfLN1cmUmZ8A==
X-CSE-MsgGUID: EcY4lwv2QcyWEignkXLtYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43626098"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="43626098"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 03:02:13 -0700
X-CSE-ConnectionGUID: 8XLTqiu5RxCdaTyNIvmDhg==
X-CSE-MsgGUID: /8pLvqs7RV6cKmeOsPpS5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="72194994"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Sep 2024 03:02:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st2Mz-000ID7-1A;
	Tue, 24 Sep 2024 10:02:09 +0000
Date: Tue, 24 Sep 2024 18:01:56 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 358800b702506c829c8ce21c125420d2abce2090
Message-ID: <202409241850.J6kRdLEk-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 358800b702506c829c8ce21c125420d2abce2090  ARM: spitz: fix compile error when matrix keypad driver is enabled

elapsed time: 1444m

configs tested: 166
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    gcc-13.2.0
arc                            hsdk_defconfig    clang-20
arc                   randconfig-001-20240923    gcc-13.2.0
arc                   randconfig-002-20240923    gcc-13.2.0
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    gcc-14.1.0
arm                       imx_v4_v5_defconfig    clang-20
arm                   randconfig-001-20240923    gcc-14.1.0
arm                   randconfig-002-20240923    clang-20
arm                   randconfig-003-20240923    clang-20
arm                   randconfig-004-20240923    gcc-14.1.0
arm                           stm32_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20240923    clang-20
arm64                 randconfig-002-20240923    clang-20
arm64                 randconfig-003-20240923    clang-20
arm64                 randconfig-004-20240923    clang-20
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20240923    gcc-14.1.0
csky                  randconfig-002-20240923    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20240923    clang-15
hexagon               randconfig-002-20240923    clang-20
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240923    clang-18
i386        buildonly-randconfig-002-20240923    clang-18
i386        buildonly-randconfig-003-20240923    gcc-12
i386        buildonly-randconfig-004-20240923    clang-18
i386        buildonly-randconfig-005-20240923    gcc-12
i386        buildonly-randconfig-006-20240923    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240923    clang-18
i386                  randconfig-002-20240923    clang-18
i386                  randconfig-003-20240923    clang-18
i386                  randconfig-004-20240923    gcc-12
i386                  randconfig-005-20240923    gcc-11
i386                  randconfig-006-20240923    clang-18
i386                  randconfig-011-20240923    clang-18
i386                  randconfig-012-20240923    gcc-12
i386                  randconfig-013-20240923    gcc-12
i386                  randconfig-014-20240923    gcc-12
i386                  randconfig-015-20240923    gcc-12
i386                  randconfig-016-20240923    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20240923    gcc-14.1.0
loongarch             randconfig-002-20240923    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                      bmips_stb_defconfig    clang-20
mips                     cu1830-neo_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20240923    gcc-14.1.0
nios2                 randconfig-002-20240923    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                            defconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                              defconfig    gcc-14.1.0
parisc                generic-32bit_defconfig    clang-20
parisc                randconfig-001-20240923    gcc-14.1.0
parisc                randconfig-002-20240923    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    clang-20
powerpc                         ps3_defconfig    clang-20
powerpc               randconfig-001-20240923    clang-20
powerpc               randconfig-002-20240923    clang-20
powerpc               randconfig-003-20240923    gcc-14.1.0
powerpc                      tqm8xx_defconfig    clang-20
powerpc64                        alldefconfig    clang-20
powerpc64             randconfig-001-20240923    clang-20
powerpc64             randconfig-002-20240923    clang-20
powerpc64             randconfig-003-20240923    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                               defconfig    clang-20
riscv                    nommu_k210_defconfig    clang-20
riscv                 randconfig-001-20240923    gcc-14.1.0
riscv                 randconfig-002-20240923    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
s390                  randconfig-001-20240923    gcc-14.1.0
s390                  randconfig-002-20240923    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                         ap325rxa_defconfig    clang-20
sh                         apsh4a3a_defconfig    clang-20
sh                                  defconfig    gcc-14.1.0
sh                          polaris_defconfig    clang-20
sh                    randconfig-001-20240923    gcc-14.1.0
sh                    randconfig-002-20240923    gcc-14.1.0
sh                          rsk7264_defconfig    clang-20
sh                   rts7751r2dplus_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240924    gcc-12
x86_64      buildonly-randconfig-002-20240924    gcc-12
x86_64      buildonly-randconfig-003-20240924    clang-18
x86_64      buildonly-randconfig-004-20240924    clang-18
x86_64      buildonly-randconfig-005-20240924    clang-18
x86_64      buildonly-randconfig-006-20240924    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20240924    clang-18
x86_64                randconfig-002-20240924    gcc-12
x86_64                randconfig-003-20240924    gcc-12
x86_64                randconfig-004-20240924    gcc-12
x86_64                randconfig-005-20240924    clang-18
x86_64                randconfig-006-20240924    clang-18
x86_64                randconfig-011-20240924    gcc-12
x86_64                randconfig-012-20240924    gcc-12
x86_64                randconfig-013-20240924    gcc-11
x86_64                randconfig-014-20240924    clang-18
x86_64                randconfig-015-20240924    gcc-12
x86_64                randconfig-016-20240924    clang-18
x86_64                randconfig-071-20240924    gcc-12
x86_64                randconfig-072-20240924    clang-18
x86_64                randconfig-073-20240924    gcc-12
x86_64                randconfig-074-20240924    gcc-12
x86_64                randconfig-075-20240924    gcc-12
x86_64                randconfig-076-20240924    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

