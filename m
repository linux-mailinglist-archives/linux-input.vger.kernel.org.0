Return-Path: <linux-input+bounces-6041-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B36B9967B6D
	for <lists+linux-input@lfdr.de>; Sun,  1 Sep 2024 19:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFF471C2136C
	for <lists+linux-input@lfdr.de>; Sun,  1 Sep 2024 17:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241673F9D2;
	Sun,  1 Sep 2024 17:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPV67hId"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF51E26AC1
	for <linux-input@vger.kernel.org>; Sun,  1 Sep 2024 17:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725211104; cv=none; b=tfrl6kzHh8h98KQzqDmbONPyxbNBqzfxOBHaLlyaM6CaVlIq8h4MCkawyHBxVGc/xUj0qa4bEo4TVkVxOIpP9fDsCFMIruhuHY+Cdqmw/nhhIdMH4i1s9nfnmkZZXfSF/N7peFsBH1Vc4XjiQtZE3V3gCA8kZqh6IvsV5OitU04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725211104; c=relaxed/simple;
	bh=8pK7kyx+Ljm2XnZ1InQSMsn4GsZYJyLGzoGMC3MsjIU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jft9hrlp0mQMFeJHTRm1oSNqJ3gpl2QjGOCslMOIU5Ik4fYX4h5LceALw6Jh/mVpP9KSp6sxn0VC38A0XKvBVx76ZOUolSmDyvB/wqgRlxtJbJQO7bWElFd1KDPdtMqySW2GFdVvF+NasXJnI7DZWooKZkouP12bVegeOan4/go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CPV67hId; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725211102; x=1756747102;
  h=date:from:to:cc:subject:message-id;
  bh=8pK7kyx+Ljm2XnZ1InQSMsn4GsZYJyLGzoGMC3MsjIU=;
  b=CPV67hIdPSqlz6qPNt4eveRqFQnWZAutfk2x1f4FdiL2/xBj58l0+jbj
   t3ulLtgH49WM7tz1fv/aKOkdoHHM2/xValX1hza2RqFSKj4+IeiWlQwIr
   qwGEUMboGGnz9E8ThEjBTVc9mXkK7kplvsHnOTpKunJlYgA3WNsnES9Ms
   ik4GRQ24Q0iLRayWB8R+qOzL38hImS+m/jJffyqnSoCnd8VoQ6Z576g08
   idi7u1eARP20U/yBGvJNJKT/q7yMyKQf5spCrEjd6XYVQxRZWvgBFVtTy
   1AVlxYqsG4/cS4a7pMzZu1C+H8mWACu3ZHis+loNaSG8TNoNjqnLUCPEj
   A==;
X-CSE-ConnectionGUID: QlW9Q2QsQmSua3Ux1JjFzg==
X-CSE-MsgGUID: DDcOb0dcQnq4+qDTaeEkbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23307593"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="23307593"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 10:18:21 -0700
X-CSE-ConnectionGUID: m6ouzzMtQJSIamT7dZHTRw==
X-CSE-MsgGUID: ee3/k0zvQnaJsFfsBBnTpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="64885913"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Sep 2024 10:18:20 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skoDS-0004mu-0P;
	Sun, 01 Sep 2024 17:18:18 +0000
Date: Mon, 02 Sep 2024 01:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 dac973838b0a37d32141c50cf3882b5ff0e42543
Message-ID: <202409020122.7LjLdscW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: dac973838b0a37d32141c50cf3882b5ff0e42543  Input: zinitix - varying icon status registers

elapsed time: 877m

configs tested: 133
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-14.1.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   gcc-13.2.0
arm                       aspeed_g5_defconfig   clang-20
arm                         at91_dt_defconfig   clang-20
arm                        clps711x_defconfig   clang-20
arm                     davinci_all_defconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm                          exynos_defconfig   clang-20
arm64                            alldefconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240901   clang-18
i386         buildonly-randconfig-002-20240901   clang-18
i386         buildonly-randconfig-003-20240901   clang-18
i386         buildonly-randconfig-004-20240901   clang-18
i386         buildonly-randconfig-005-20240901   clang-18
i386         buildonly-randconfig-006-20240901   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240901   clang-18
i386                  randconfig-002-20240901   clang-18
i386                  randconfig-003-20240901   clang-18
i386                  randconfig-004-20240901   clang-18
i386                  randconfig-005-20240901   clang-18
i386                  randconfig-006-20240901   clang-18
i386                  randconfig-011-20240901   clang-18
i386                  randconfig-012-20240901   clang-18
i386                  randconfig-013-20240901   clang-18
i386                  randconfig-014-20240901   clang-18
i386                  randconfig-015-20240901   clang-18
i386                  randconfig-016-20240901   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
m68k                          hp300_defconfig   clang-20
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                           ci20_defconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                        fsp2_defconfig   clang-20
powerpc                 mpc832x_rdb_defconfig   clang-20
powerpc                     tqm8540_defconfig   clang-20
powerpc                         wii_defconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                         ecovec24_defconfig   clang-20
sh                               j2_defconfig   clang-20
sh                          kfr2r09_defconfig   clang-20
sh                          urquell_defconfig   clang-20
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240901   gcc-12
x86_64       buildonly-randconfig-002-20240901   gcc-12
x86_64       buildonly-randconfig-003-20240901   gcc-12
x86_64       buildonly-randconfig-004-20240901   gcc-12
x86_64       buildonly-randconfig-005-20240901   gcc-12
x86_64       buildonly-randconfig-006-20240901   gcc-12
x86_64                              defconfig   clang-18
x86_64                                  kexec   gcc-12
x86_64                randconfig-001-20240901   gcc-12
x86_64                randconfig-002-20240901   gcc-12
x86_64                randconfig-003-20240901   gcc-12
x86_64                randconfig-004-20240901   gcc-12
x86_64                randconfig-005-20240901   gcc-12
x86_64                randconfig-006-20240901   gcc-12
x86_64                randconfig-011-20240901   gcc-12
x86_64                randconfig-012-20240901   gcc-12
x86_64                randconfig-013-20240901   gcc-12
x86_64                randconfig-014-20240901   gcc-12
x86_64                randconfig-015-20240901   gcc-12
x86_64                randconfig-016-20240901   gcc-12
x86_64                randconfig-071-20240901   gcc-12
x86_64                randconfig-072-20240901   gcc-12
x86_64                randconfig-073-20240901   gcc-12
x86_64                randconfig-074-20240901   gcc-12
x86_64                randconfig-075-20240901   gcc-12
x86_64                randconfig-076-20240901   gcc-12
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

