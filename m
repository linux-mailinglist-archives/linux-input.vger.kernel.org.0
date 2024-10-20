Return-Path: <linux-input+bounces-7559-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C009A51C0
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 02:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88DA9283814
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 00:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4805F3232;
	Sun, 20 Oct 2024 00:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V242XX0f"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703331FA4
	for <linux-input@vger.kernel.org>; Sun, 20 Oct 2024 00:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729383311; cv=none; b=HS6wS0LGfGF2CAOJxGTilrw91NJFiH4fNtgy9awucY5aXhs3/7zAzU5vUlf3smMkfPbPCHcC9pg9egiVHSCLWLWQmU/+Q21AlSNjpc+A3wSmRHWYuSrx7uSB3/am7ij8RoWrXk3NNdR4R16rIUaxKkESIcfFu4EmolU0G/t2ZhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729383311; c=relaxed/simple;
	bh=0Mq+hyEc+cCtNRbqI2yCacuEjgHUUNCPVQjr44YWwt4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PAiIxFIKNKQ6AIm5K9naKsRZZjmZfXaQgHrAOtTKjzgrFFdnG8yeB3HMCfbzX+rbDS1wyTGV4WtLTPmukwjgb7csdNwMDbfXDPhOAojASmzbpWfwHIvijSXEmHtVrfVSv2v/A/3I+TsOqrCfSh359F7HuGedGqBZbPqTQh6mtzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V242XX0f; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729383308; x=1760919308;
  h=date:from:to:cc:subject:message-id;
  bh=0Mq+hyEc+cCtNRbqI2yCacuEjgHUUNCPVQjr44YWwt4=;
  b=V242XX0fzGGxY3FGPpZ9kn4GXYj8HMV+kelIb09fA9b19zmabFWJmaOX
   JSRKaq99A/bdvY2h6XwbcOwNbFj1j7bwRyqmaMZZqLwwWsfpKgWKO3QoI
   N9bHx3YLzA49N9fF0VtBJWvvQ9y71iZdQtL442vx/3EGi+d3uRadNX5b2
   BYmk43SdSSIPJJKnJbD4oIrKfRfTO4XrB3OjLsheTQAZdu/Lyh39JlxP4
   oeGqA5Aj/D4UPUdI+vTPxP/4XiECxU7jCWiboiSX0vbWZiJ7177pilezT
   7isfRPNY8WIUiRnMD56tnTc7RgvTxo8uSs/rynWsLrBK8lgjL1LMiqa/8
   w==;
X-CSE-ConnectionGUID: XvlMqzIEQ9WAZCRU3IIPjg==
X-CSE-MsgGUID: 424f5GTpRGGtF0sjHbPJgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="39513551"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="39513551"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 17:15:08 -0700
X-CSE-ConnectionGUID: fl41eIK/Q5ivNeVKqpM82Q==
X-CSE-MsgGUID: GY0Cir71TiCEi3SaDy3MJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="79523255"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Oct 2024 17:15:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2Jb6-000PhN-2g;
	Sun, 20 Oct 2024 00:15:04 +0000
Date: Sun, 20 Oct 2024 08:14:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 2de01e0e57f3ebe7f90b08f6bca5ce0f3da3829f
Message-ID: <202410200858.oxKdcRWF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 2de01e0e57f3ebe7f90b08f6bca5ce0f3da3829f  Input: zinitix - don't fail if linux,keycodes prop is absent

elapsed time: 1470m

configs tested: 89
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-14.1.0
alpha                  allyesconfig    clang-20
alpha                     defconfig    gcc-14.1.0
arc                    allmodconfig    clang-20
arc                     allnoconfig    gcc-14.1.0
arc                    allyesconfig    clang-20
arc                       defconfig    gcc-14.1.0
arm                    allmodconfig    clang-20
arm                     allnoconfig    gcc-14.1.0
arm                    allyesconfig    clang-20
arm               at91_dt_defconfig    gcc-14.1.0
arm                       defconfig    gcc-14.1.0
arm                gemini_defconfig    gcc-14.1.0
arm                 sama5_defconfig    gcc-14.1.0
arm                 stm32_defconfig    gcc-14.1.0
arm64                  allmodconfig    clang-20
arm64                   allnoconfig    gcc-14.1.0
arm64                     defconfig    gcc-14.1.0
csky                    allnoconfig    gcc-14.1.0
csky                      defconfig    gcc-14.1.0
hexagon                allmodconfig    clang-20
hexagon                 allnoconfig    gcc-14.1.0
hexagon                allyesconfig    clang-20
hexagon                   defconfig    gcc-14.1.0
i386                   allmodconfig    clang-18
i386                    allnoconfig    clang-18
i386                   allyesconfig    clang-18
i386                      defconfig    clang-18
loongarch              allmodconfig    gcc-14.1.0
loongarch               allnoconfig    gcc-14.1.0
loongarch                 defconfig    gcc-14.1.0
m68k                   allmodconfig    gcc-14.1.0
m68k                    allnoconfig    gcc-14.1.0
m68k                   allyesconfig    gcc-14.1.0
m68k                      defconfig    gcc-14.1.0
m68k                 sun3_defconfig    gcc-14.1.0
microblaze             allmodconfig    gcc-14.1.0
microblaze              allnoconfig    gcc-14.1.0
microblaze             allyesconfig    gcc-14.1.0
microblaze                defconfig    gcc-14.1.0
mips                    allnoconfig    gcc-14.1.0
mips                 ci20_defconfig    gcc-14.1.0
mips                 mtx1_defconfig    gcc-14.1.0
nios2               3c120_defconfig    gcc-14.1.0
nios2                   allnoconfig    gcc-14.1.0
nios2                     defconfig    gcc-14.1.0
openrisc                allnoconfig    clang-20
openrisc               allyesconfig    gcc-14.1.0
openrisc                  defconfig    gcc-12
parisc                 allmodconfig    gcc-14.1.0
parisc                  allnoconfig    clang-20
parisc                 allyesconfig    gcc-14.1.0
parisc                    defconfig    gcc-12
parisc      generic-32bit_defconfig    gcc-14.1.0
parisc64                  defconfig    gcc-14.1.0
powerpc                allmodconfig    gcc-14.1.0
powerpc                 allnoconfig    clang-20
powerpc                allyesconfig    gcc-14.1.0
powerpc         bluestone_defconfig    gcc-14.1.0
powerpc        mpc866_ads_defconfig    gcc-14.1.0
powerpc           taishan_defconfig    gcc-14.1.0
riscv                  allmodconfig    gcc-14.1.0
riscv                   allnoconfig    clang-20
riscv                  allyesconfig    gcc-14.1.0
riscv                     defconfig    gcc-12
s390                   allmodconfig    gcc-14.1.0
s390                    allnoconfig    clang-20
s390                   allyesconfig    gcc-14.1.0
s390                      defconfig    gcc-12
sh                     allmodconfig    gcc-14.1.0
sh                      allnoconfig    gcc-14.1.0
sh                     allyesconfig    gcc-14.1.0
sh               apsh4a3a_defconfig    gcc-14.1.0
sh                        defconfig    gcc-12
sh              sh7785lcr_defconfig    gcc-14.1.0
sparc                  allmodconfig    gcc-14.1.0
sparc64                   defconfig    gcc-12
um                     allmodconfig    clang-20
um                      allnoconfig    clang-20
um                     allyesconfig    clang-20
um                        defconfig    gcc-12
um                   i386_defconfig    gcc-12
um                 x86_64_defconfig    gcc-12
x86_64                  allnoconfig    clang-18
x86_64                 allyesconfig    clang-18
x86_64                    defconfig    clang-18
x86_64                        kexec    gcc-12
x86_64                     rhel-8.3    gcc-12
xtensa                  allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

