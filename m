Return-Path: <linux-input+bounces-6638-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 494A597E3E6
	for <lists+linux-input@lfdr.de>; Mon, 23 Sep 2024 00:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 663AD1C20E83
	for <lists+linux-input@lfdr.de>; Sun, 22 Sep 2024 22:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4906055C0A;
	Sun, 22 Sep 2024 22:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHqalSMQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C13C2B9D2
	for <linux-input@vger.kernel.org>; Sun, 22 Sep 2024 22:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727043376; cv=none; b=SIi5i0xcDJvaLUf875bRbOd+Y5LvKVdqQinouh9JCgcHizJrEQmUZQu29WzIT9koZMVGKGCIz5hAZwhoIySVeBmJLLURlYgIGRsbxQojhTN60W5xoFpljN5fapMEfC312qufbVMejRXc9oj3xxmeXH/hL0OK8VIT0cW8y16qwA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727043376; c=relaxed/simple;
	bh=p2OBOOAYIvVD/n/QZeW4oEK0L7slXj9ycEQqwAm9u1Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pmsdIs2W+C2b6ofWRDz6miPG3PnqRPqFoS5pnqx4vRwcMb1stgq5z76ORTvRiH7cNWSg+QeissevEaJH5i8PFCEcDu0HIGuCMn6yJtJiQIR3duGkSoBYu5LuZ+0ouTqT4hiMzKJn9p4JKmA91zbDkCPygqWHumSVYw9agz2cncs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHqalSMQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727043374; x=1758579374;
  h=date:from:to:cc:subject:message-id;
  bh=p2OBOOAYIvVD/n/QZeW4oEK0L7slXj9ycEQqwAm9u1Y=;
  b=UHqalSMQsaZf5IKSZsvGQ5IYKhx6w63N8AZwfmzAepNM7Gazm6A7b2Y6
   HGRsOPM3htrTYl2KXmk/OyJNnQhgdh3nFFOXETYsr1FQJAcM+tn8NfoD5
   Czyo1t+FxAO0Gt9HB7XaaL/zxw75EQEzc+LT5fMKPzMP0dRZ5St8+RX98
   X2Gks9OeQWxWcwTtRGiRIOIRhr+faCuyXLM3By/TQQBdjycbW6SaxoRsc
   UuGs1Kz2LhxVaC4gN1qfuGMSnSJpNWAdQEi7tKrjvnnIVSgUfCJ0H8gL/
   O0F1l9UBN3JWEg23tSMw2KqWedhLaVMKR3OBXfodoheEA70WGLz4nXZbh
   g==;
X-CSE-ConnectionGUID: Rr/hUhURTtSRgLV15iXdKA==
X-CSE-MsgGUID: bd3XJ1E0Txq6dMd+5kmsyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26169698"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="26169698"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 15:16:13 -0700
X-CSE-ConnectionGUID: bvyKCh4NSLaSRev19TDXug==
X-CSE-MsgGUID: cVyuLkgCSQaol8DhPEkrAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="75830707"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Sep 2024 15:16:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssUsD-000Gh4-3C;
	Sun, 22 Sep 2024 22:16:09 +0000
Date: Mon, 23 Sep 2024 06:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD REGRESSION
 b2142a22ef22466575feaccc74a2995c62cae7e8
Message-ID: <202409230644.62YBOP7X-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: b2142a22ef22466575feaccc74a2995c62cae7e8  Input: hynitron_cstxxx - drop explicit initialization of struct i2c_device_id::driver_data to 0

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202409230614.BBJikfMj-lkp@intel.com

    arch/arm/mach-pxa/spitz.c:406:9: error: implicit declaration of function 'PROPERTY_ENTRY_ARRAY_U32'; did you mean 'PROPERTY_ENTRY_U8_ARRAY_LEN'? [-Wimplicit-function-declaration]
    arch/arm/mach-pxa/spitz.c:406:9: error: initialization of 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    arch/arm/mach-pxa/spitz.c:406:9: error: initializer element is not constant

Error/Warning ids grouped by kconfigs:

recent_errors
`-- arm-randconfig-001-20240923
    |-- arch-arm-mach-pxa-spitz.c:error:implicit-declaration-of-function-PROPERTY_ENTRY_ARRAY_U32
    |-- arch-arm-mach-pxa-spitz.c:error:initialization-of-const-char-from-int-makes-pointer-from-integer-without-a-cast
    `-- arch-arm-mach-pxa-spitz.c:error:initializer-element-is-not-constant

elapsed time: 791m

configs tested: 168
configs skipped: 4

tested configs:
alpha                            alldefconfig    clang-20
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                   randconfig-001-20240922    clang-20
arc                   randconfig-002-20240922    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                     davinci_all_defconfig    clang-20
arm                           h3600_defconfig    clang-20
arm                   milbeaut_m10v_defconfig    clang-20
arm                        mvebu_v7_defconfig    clang-20
arm                            qcom_defconfig    clang-20
arm                   randconfig-001-20240922    clang-20
arm                   randconfig-002-20240922    clang-20
arm                   randconfig-003-20240922    clang-20
arm                   randconfig-004-20240922    clang-20
arm                           sama7_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20240922    clang-20
arm64                 randconfig-002-20240922    clang-20
arm64                 randconfig-003-20240922    clang-20
arm64                 randconfig-004-20240922    clang-20
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20240922    clang-20
csky                  randconfig-002-20240922    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20240922    clang-20
hexagon               randconfig-002-20240922    clang-20
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240922    gcc-12
i386        buildonly-randconfig-002-20240922    gcc-12
i386        buildonly-randconfig-003-20240922    gcc-12
i386        buildonly-randconfig-004-20240922    gcc-12
i386        buildonly-randconfig-005-20240922    gcc-12
i386        buildonly-randconfig-006-20240922    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240922    gcc-12
i386                  randconfig-002-20240922    gcc-12
i386                  randconfig-003-20240922    gcc-12
i386                  randconfig-004-20240922    gcc-12
i386                  randconfig-005-20240922    gcc-12
i386                  randconfig-006-20240922    gcc-12
i386                  randconfig-011-20240922    gcc-12
i386                  randconfig-012-20240922    gcc-12
i386                  randconfig-013-20240922    gcc-12
i386                  randconfig-014-20240922    gcc-12
i386                  randconfig-015-20240922    gcc-12
i386                  randconfig-016-20240922    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20240922    clang-20
loongarch             randconfig-002-20240922    clang-20
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                 decstation_r4k_defconfig    clang-20
mips                           mtx1_defconfig    clang-20
mips                      pic32mzda_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20240922    clang-20
nios2                 randconfig-002-20240922    clang-20
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20240922    clang-20
parisc                randconfig-002-20240922    clang-20
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                     powernv_defconfig    clang-20
powerpc               randconfig-002-20240922    clang-20
powerpc64             randconfig-001-20240922    clang-20
powerpc64             randconfig-002-20240922    clang-20
powerpc64             randconfig-003-20240922    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-20
riscv                 randconfig-001-20240922    clang-20
riscv                 randconfig-002-20240922    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20240922    clang-20
s390                  randconfig-002-20240922    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                            hp6xx_defconfig    clang-20
sh                          landisk_defconfig    clang-20
sh                    randconfig-001-20240922    clang-20
sh                    randconfig-002-20240922    clang-20
sh                   secureedge5410_defconfig    clang-20
sh                  sh7785lcr_32bit_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20240922    clang-20
sparc64               randconfig-002-20240922    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20240922    clang-20
um                    randconfig-002-20240922    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240922    clang-18
x86_64      buildonly-randconfig-002-20240922    clang-18
x86_64      buildonly-randconfig-003-20240922    clang-18
x86_64      buildonly-randconfig-004-20240922    clang-18
x86_64      buildonly-randconfig-005-20240922    clang-18
x86_64      buildonly-randconfig-006-20240922    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                randconfig-001-20240922    clang-18
x86_64                randconfig-002-20240922    clang-18
x86_64                randconfig-003-20240922    clang-18
x86_64                randconfig-004-20240922    clang-18
x86_64                randconfig-005-20240922    clang-18
x86_64                randconfig-006-20240922    clang-18
x86_64                randconfig-011-20240922    clang-18
x86_64                randconfig-012-20240922    clang-18
x86_64                randconfig-013-20240922    clang-18
x86_64                randconfig-014-20240922    clang-18
x86_64                randconfig-015-20240922    clang-18
x86_64                randconfig-016-20240922    clang-18
x86_64                randconfig-071-20240922    clang-18
x86_64                randconfig-072-20240922    clang-18
x86_64                randconfig-073-20240922    clang-18
x86_64                randconfig-074-20240922    clang-18
x86_64                randconfig-075-20240922    clang-18
x86_64                randconfig-076-20240922    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20240922    clang-20
xtensa                randconfig-002-20240922    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

