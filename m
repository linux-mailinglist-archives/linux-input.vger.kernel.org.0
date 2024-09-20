Return-Path: <linux-input+bounces-6613-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D17997D09F
	for <lists+linux-input@lfdr.de>; Fri, 20 Sep 2024 06:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAFE91C2272F
	for <lists+linux-input@lfdr.de>; Fri, 20 Sep 2024 04:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B75879C2;
	Fri, 20 Sep 2024 04:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yvo8uLUK"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510ED22309
	for <linux-input@vger.kernel.org>; Fri, 20 Sep 2024 04:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726807105; cv=none; b=ZjEkSZexyDMebe/lqXUiUEPaO/NLDvohrCLEkrotcWER1p5TnDp4FwpvoQVe7Xr3mJ4FleQxKUJog8Fto81hlVlkLGlNByAbwBUtR6AEZNClJc8fZLe5xtm20P992IzUvXRc+iJS794EmTL6elA+zJqi3AKjPFn9PJNft1G7M4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726807105; c=relaxed/simple;
	bh=f/IQggFTvFh7ZHtdeKm1/WKcZ8rAsbXTfzV8upvzLGk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VvHocsPuOU7X//CPjzTnioOhurF+vLm6x6vRUxBlWOnzYIWrbHc/LYR0iR4XmW7tJ29lVZQTnc3OX7+qRia/jzIx+tyKaxCWZwR4F6SKcAoPz71bAUo7n08RpI2VB0902e6pSHn8hZOwaBXt/3diRpXdzVPflXNT7IPYPy1sXrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yvo8uLUK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726807103; x=1758343103;
  h=date:from:to:cc:subject:message-id;
  bh=f/IQggFTvFh7ZHtdeKm1/WKcZ8rAsbXTfzV8upvzLGk=;
  b=Yvo8uLUKExMcFcv2FvZJIVpSkBH6qn3sTf/Akbfkp4B1qJPAim2D/at9
   YPCxesPUWXqTdT1Gc4UdAkHBN7kSxbsQWCj42L7y9t1TTTIzvkzVaaKNz
   PTroT6WkIgh/nDNnflVATlsvS8kigJRSsnvejfdFcDdV/9AJC4/o5Emsd
   YuX7XuOKmtfcQyZNR+DTy+3adhpOcsXVofaj+52bEfMCGK70wY32AcLmq
   5O5ggwnFNNfOnH/7fFWOQmq9AapgiCOrKMe6i2w5dqoDXqynnnaPvkROA
   PAxLvvlcGYEo4vK1rAAVd+U9hGlUp/gfZH3QjIa7Cz3mEfKHGEDeZr1gQ
   g==;
X-CSE-ConnectionGUID: rM7Gmz3SSFuA89huya9Zbw==
X-CSE-MsgGUID: v04gDPU1TZ+Fo7niTTDWjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25322669"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="25322669"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 21:38:18 -0700
X-CSE-ConnectionGUID: rQ1/gQNVSySnqelK4lUY3Q==
X-CSE-MsgGUID: G6qeBg1nSiWllH5QmmBF7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="70603777"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Sep 2024 21:38:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srVPL-000Dy4-0D;
	Fri, 20 Sep 2024 04:38:15 +0000
Date: Fri, 20 Sep 2024 12:38:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 55bef83509f0cbe4cc54a583ac0313389dabee66
Message-ID: <202409201209.LQHdok2o-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 55bef83509f0cbe4cc54a583ac0313389dabee66  Input: Convert comma to semicolon

elapsed time: 2445m

configs tested: 104
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
arc                               allnoconfig    gcc-13.2.0
arc                   randconfig-001-20240920    gcc-13.2.0
arc                   randconfig-002-20240920    gcc-13.2.0
arm                               allnoconfig    clang-20
arm                   randconfig-001-20240920    gcc-14.1.0
arm                   randconfig-002-20240920    gcc-14.1.0
arm                   randconfig-003-20240920    gcc-14.1.0
arm                   randconfig-004-20240920    gcc-14.1.0
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20240920    gcc-14.1.0
arm64                 randconfig-002-20240920    clang-20
arm64                 randconfig-003-20240920    clang-20
arm64                 randconfig-004-20240920    clang-20
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20240920    gcc-14.1.0
csky                  randconfig-002-20240920    gcc-14.1.0
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20240920    clang-20
hexagon               randconfig-002-20240920    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240919    clang-18
i386        buildonly-randconfig-001-20240920    clang-18
i386        buildonly-randconfig-002-20240919    gcc-12
i386        buildonly-randconfig-002-20240920    clang-18
i386        buildonly-randconfig-003-20240919    clang-18
i386        buildonly-randconfig-003-20240920    clang-18
i386        buildonly-randconfig-004-20240919    gcc-12
i386        buildonly-randconfig-004-20240920    clang-18
i386        buildonly-randconfig-005-20240919    clang-18
i386        buildonly-randconfig-005-20240920    gcc-12
i386        buildonly-randconfig-006-20240919    clang-18
i386        buildonly-randconfig-006-20240920    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240919    clang-18
i386                  randconfig-001-20240920    gcc-12
i386                  randconfig-002-20240919    clang-18
i386                  randconfig-002-20240920    gcc-11
i386                  randconfig-003-20240919    gcc-12
i386                  randconfig-003-20240920    clang-18
i386                  randconfig-004-20240919    clang-18
i386                  randconfig-004-20240920    gcc-12
i386                  randconfig-005-20240919    clang-18
i386                  randconfig-005-20240920    gcc-12
i386                  randconfig-006-20240919    clang-18
i386                  randconfig-006-20240920    clang-18
i386                  randconfig-011-20240919    gcc-12
i386                  randconfig-011-20240920    clang-18
i386                  randconfig-012-20240919    gcc-12
i386                  randconfig-012-20240920    clang-18
i386                  randconfig-013-20240919    clang-18
i386                  randconfig-013-20240920    clang-18
i386                  randconfig-014-20240919    gcc-12
i386                  randconfig-014-20240920    clang-18
i386                  randconfig-015-20240919    gcc-11
i386                  randconfig-015-20240920    gcc-12
i386                  randconfig-016-20240919    clang-18
i386                  randconfig-016-20240920    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20240920    gcc-14.1.0
loongarch             randconfig-002-20240920    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20240920    gcc-14.1.0
nios2                 randconfig-002-20240920    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                randconfig-001-20240920    gcc-14.1.0
parisc                randconfig-002-20240920    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc               randconfig-001-20240920    gcc-14.1.0
powerpc               randconfig-002-20240920    clang-20
powerpc               randconfig-003-20240920    gcc-14.1.0
powerpc64             randconfig-001-20240920    gcc-14.1.0
powerpc64             randconfig-002-20240920    clang-20
powerpc64             randconfig-003-20240920    gcc-14.1.0
riscv                             allnoconfig    gcc-14.1.0
riscv                 randconfig-001-20240920    gcc-14.1.0
s390                              allnoconfig    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
um                                allnoconfig    clang-17
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                           rhel-8.3-bpf    gcc-12
x86_64                         rhel-8.3-kunit    gcc-12
x86_64                           rhel-8.3-ltp    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

