Return-Path: <linux-input+bounces-10216-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4B5A3E8F9
	for <lists+linux-input@lfdr.de>; Fri, 21 Feb 2025 01:00:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E6EA189966E
	for <lists+linux-input@lfdr.de>; Fri, 21 Feb 2025 00:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F891EE03D;
	Thu, 20 Feb 2025 23:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nT82sR/V"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B651D5160
	for <linux-input@vger.kernel.org>; Thu, 20 Feb 2025 23:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740095999; cv=none; b=hjX9v9xcadmwupN2i2Ail8c4Rt2TWLRiem0gG4LyWEq9nEPH1nV85XCkCMNoU169j1s6eBHDf5+Lx6cMXPL+KzRlmfIC39WrTV8SssaGnyL++6mO4LwZ7rYn7Gy6SRiHXzY52/83YY7t5b4jKbM1TSboKaFF3NEb9dug89opyUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740095999; c=relaxed/simple;
	bh=mKnZZM5+oIq5ZfXw7ZaFO2A02bRkolCJwDaSR+l9BGg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XhnFEY6Lr01p2Hjh/fRkQg/UnnTNicr6vX7mDv6AadFeg4bKmZAWneGuG38MMgb6VXihpyghAYJ4yrc9m5FlQSyazoBCaR5cF/HC+mKUBdCqHzG9IvnyN0nQjQYMKeIi/vSP3ae3y2TFi6ozBIweaYSORqx71ruiIvQHlmo5tcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nT82sR/V; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740095996; x=1771631996;
  h=date:from:to:cc:subject:message-id;
  bh=mKnZZM5+oIq5ZfXw7ZaFO2A02bRkolCJwDaSR+l9BGg=;
  b=nT82sR/VsrigbFI0KrOKueu8reS6mJKIjk9luLmHKbk6Oo2U7/NnlBYo
   9UH5GjzYJdcBzlcdfKXAnV7gCDTAcvZjuoTnS3oyONZPZ+ZFcyWNRNnGs
   R5ulcbEZUMMlJNJotLO2O4hCu9/w/OWy/H9t/vTZTv3V4RaUHkgdGHRsA
   6rLgypRlaBLoYod318gDm5t4Ajmfus57GP50UOc00+pa6rmyZeY1l8CbD
   iVMJ7/XmZ+HyjSAQwf5s4NX7HJSqsLGGu6Im1LKQ/jt1BHKvTwfDfJ8tH
   zkS1LkeuwHJ3PYlHn8YYS4iaM2wliT/c+I5JMB+ACEHytMoOZXfRqnmqo
   A==;
X-CSE-ConnectionGUID: sLDQSkwWRL+iXt6OWcydDw==
X-CSE-MsgGUID: bAr2ewW3RBCZe4zZqcZYZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44546642"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="44546642"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 15:59:55 -0800
X-CSE-ConnectionGUID: 6UcoeNasRWOTfsx9YBE1Ww==
X-CSE-MsgGUID: ekujGRVQScS0I+e+w2nxtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115704478"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 20 Feb 2025 15:59:55 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlGSM-0004tD-2q;
	Thu, 20 Feb 2025 23:59:51 +0000
Date: Fri, 21 Feb 2025 07:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 9995b98a4b2a704fa6744d2bee9c5d50b2c33836
Message-ID: <202502210732.kYwiAWWH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 9995b98a4b2a704fa6744d2bee9c5d50b2c33836  MAINTAINERS: Add entries for Apple Z2 touchscreen driver

elapsed time: 1449m

configs tested: 83
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250220    gcc-13.2.0
arc                   randconfig-002-20250220    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250220    gcc-14.2.0
arm                   randconfig-002-20250220    gcc-14.2.0
arm                   randconfig-003-20250220    gcc-14.2.0
arm                   randconfig-004-20250220    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                 randconfig-001-20250220    gcc-14.2.0
arm64                 randconfig-002-20250220    gcc-14.2.0
arm64                 randconfig-003-20250220    clang-21
arm64                 randconfig-004-20250220    gcc-14.2.0
csky                  randconfig-001-20250220    gcc-14.2.0
csky                  randconfig-002-20250220    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250220    clang-21
hexagon               randconfig-002-20250220    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250220    gcc-12
i386        buildonly-randconfig-002-20250220    gcc-12
i386        buildonly-randconfig-003-20250220    gcc-12
i386        buildonly-randconfig-004-20250220    clang-19
i386        buildonly-randconfig-005-20250220    clang-19
i386        buildonly-randconfig-006-20250220    clang-19
i386                                defconfig    clang-19
loongarch             randconfig-001-20250220    gcc-14.2.0
loongarch             randconfig-002-20250220    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250220    gcc-14.2.0
nios2                 randconfig-002-20250220    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250220    gcc-14.2.0
parisc                randconfig-002-20250220    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250220    gcc-14.2.0
powerpc               randconfig-002-20250220    clang-16
powerpc               randconfig-003-20250220    clang-21
powerpc64             randconfig-001-20250220    clang-16
powerpc64             randconfig-002-20250220    clang-18
powerpc64             randconfig-003-20250220    gcc-14.2.0
riscv                 randconfig-001-20250220    gcc-14.2.0
riscv                 randconfig-002-20250220    clang-21
s390                             allmodconfig    clang-19
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250220    clang-19
s390                  randconfig-002-20250220    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250220    gcc-14.2.0
sh                    randconfig-002-20250220    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20250220    gcc-14.2.0
sparc                 randconfig-002-20250220    gcc-14.2.0
sparc64               randconfig-001-20250220    gcc-14.2.0
sparc64               randconfig-002-20250220    gcc-14.2.0
um                               allmodconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250220    gcc-12
um                    randconfig-002-20250220    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250220    gcc-12
x86_64      buildonly-randconfig-002-20250220    gcc-12
x86_64      buildonly-randconfig-003-20250220    gcc-12
x86_64      buildonly-randconfig-004-20250220    gcc-12
x86_64      buildonly-randconfig-005-20250220    gcc-12
x86_64      buildonly-randconfig-006-20250220    gcc-12
x86_64                              defconfig    gcc-11
xtensa                randconfig-001-20250220    gcc-14.2.0
xtensa                randconfig-002-20250220    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

