Return-Path: <linux-input+bounces-6908-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8B398A857
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 17:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE8271C22B1A
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 15:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE8819049B;
	Mon, 30 Sep 2024 15:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPZ2K02j"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1707D20B0F
	for <linux-input@vger.kernel.org>; Mon, 30 Sep 2024 15:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727709682; cv=none; b=gI55CcaqkYjaLbytDboOtnp2I0JrgIgzzbstbfD0vAkvKyfh1k6F3fyI0F8FNpJcaRVVvg6jNFLZunvva2GJgCSuTInkU7OYya5EkepVETC0l/aDcPc55zhV/XiH9aQCW68/+R2VvmyKPD6nBSL4ij6WwhWTr/M3hSIe328CSOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727709682; c=relaxed/simple;
	bh=g/+Q+NCNpHqpg4gk0wkobkW5jB2rhP3mXG9xIoPap1A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jFUlJ3aqHRGthUR5mmWS5U/BZanMPAI/8KR+NYACNZhWhXDXAyvJSStAtI9OzxF34nz4sNnsyx2qzBjtmDrRv+U0a7vZwPW0vH9WUQCczIkJSY7KPGNZY3H+hfEMfOdpCN/ttejNN6FH+4jW3fIYeMO0khQLxP0JsF/7IL3rLew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPZ2K02j; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727709680; x=1759245680;
  h=date:from:to:cc:subject:message-id;
  bh=g/+Q+NCNpHqpg4gk0wkobkW5jB2rhP3mXG9xIoPap1A=;
  b=NPZ2K02jsGtQf4QC+j3t1oUSOvokrNxUTxIsbC18Wnq7KZzufRfERPGI
   FGXWzAY/yQh9kGuV/SK+HxrveW1qFpdSN6NEJ8y+qJE0fhovXM3cSR9Qd
   2UVnly8q1KaKoCRvo6d8PVp1gMpio/egdeOhKTMT8YGbnaHZOo/VFEkmT
   kSVybHht1qtFKn4479nZYls084tJmz37wM+NI2/jlXFlJuLJIfdi5612W
   sPWN0s+pf5U257yH7adZ7l/2AJgkJaKPTCAnViAL/m9bfYj+nKw9ikjSi
   mZCd3atlmQ0I5vojOQu0aSk42VT1gJ87Jwn+VHf3t5rgeybzSoS0XYdkw
   g==;
X-CSE-ConnectionGUID: 7vdVSGEZRjON9v7Vsf+E2w==
X-CSE-MsgGUID: petD0Pw9Tce7B6zgEOOi3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26932081"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="26932081"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 08:21:19 -0700
X-CSE-ConnectionGUID: 4ms46xPLRfKChnfaLTD+Aw==
X-CSE-MsgGUID: AiiJpP0xQhyvnzkAYKW8ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="73606126"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Sep 2024 08:21:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svID5-000PaH-1R;
	Mon, 30 Sep 2024 15:21:15 +0000
Date: Mon, 30 Sep 2024 23:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 c7bf046925dc5885d9c4d8fbcbb7e4e73665bfcf
Message-ID: <202409302344.Yo1KYqs1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: c7bf046925dc5885d9c4d8fbcbb7e4e73665bfcf  Input: novatek-nvt-ts - add support for NT36672A touchscreen

Warning ids grouped by kconfigs:

recent_errors
`-- x86_64-allnoconfig
    `-- drivers-input-keyboard-matrix_keypad.c:linux-gpio-consumer.h-is-included-more-than-once.

elapsed time: 750m

configs tested: 165
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.1.0
arc                     haps_hs_smp_defconfig    clang-20
arc                     haps_hs_smp_defconfig    gcc-14.1.0
arc                           tb10x_defconfig    clang-20
arc                    vdk_hs38_smp_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                          ep93xx_defconfig    clang-20
arm                      integrator_defconfig    clang-20
arm                       omap2plus_defconfig    gcc-14.1.0
arm                         orion5x_defconfig    clang-20
arm                        realview_defconfig    clang-20
arm                          sp7021_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240930    clang-18
i386        buildonly-randconfig-001-20240930    gcc-12
i386        buildonly-randconfig-002-20240930    clang-18
i386        buildonly-randconfig-003-20240930    clang-18
i386        buildonly-randconfig-004-20240930    clang-18
i386        buildonly-randconfig-004-20240930    gcc-12
i386        buildonly-randconfig-005-20240930    clang-18
i386        buildonly-randconfig-006-20240930    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240930    clang-18
i386                  randconfig-002-20240930    clang-18
i386                  randconfig-003-20240930    clang-18
i386                  randconfig-003-20240930    gcc-12
i386                  randconfig-004-20240930    clang-18
i386                  randconfig-005-20240930    clang-18
i386                  randconfig-006-20240930    clang-18
i386                  randconfig-011-20240930    clang-18
i386                  randconfig-012-20240930    clang-18
i386                  randconfig-013-20240930    clang-18
i386                  randconfig-013-20240930    gcc-12
i386                  randconfig-014-20240930    clang-18
i386                  randconfig-014-20240930    gcc-12
i386                  randconfig-015-20240930    clang-18
i386                  randconfig-016-20240930    clang-18
i386                  randconfig-016-20240930    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch                 loongson3_defconfig    clang-20
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                            mac_defconfig    gcc-14.1.0
m68k                            q40_defconfig    clang-15
m68k                           sun3_defconfig    gcc-14.1.0
m68k                          sun3x_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                       bmips_be_defconfig    gcc-14.1.0
mips                           ci20_defconfig    clang-20
mips                     decstation_defconfig    clang-15
mips                      fuloong2e_defconfig    gcc-14.1.0
mips                     loongson1b_defconfig    gcc-14.1.0
mips                        omega2p_defconfig    clang-15
mips                      pic32mzda_defconfig    gcc-14.1.0
mips                          rb532_defconfig    gcc-14.1.0
mips                        vocore2_defconfig    clang-15
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                   bluestone_defconfig    clang-20
powerpc                 canyonlands_defconfig    clang-15
powerpc                      cm5200_defconfig    clang-20
powerpc                     ep8248e_defconfig    clang-20
powerpc                    gamecube_defconfig    clang-15
powerpc                  iss476-smp_defconfig    clang-15
powerpc                      katmai_defconfig    clang-15
powerpc                   lite5200b_defconfig    clang-15
powerpc                      tqm8xx_defconfig    clang-15
powerpc                        warp_defconfig    clang-15
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    gcc-14.1.0
sh                            hp6xx_defconfig    clang-20
sh                 kfr2r09-romimage_defconfig    gcc-14.1.0
sh                          r7780mp_defconfig    clang-15
sh                          rsk7201_defconfig    clang-15
sh                           se7619_defconfig    clang-20
sh                           se7724_defconfig    clang-15
sh                             shx3_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                          alldefconfig    clang-15
sparc64                             defconfig    gcc-12
um                               alldefconfig    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    clang-20
um                             i386_defconfig    gcc-12
um                             i386_defconfig    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  audio_kc705_defconfig    clang-15
xtensa                       common_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

