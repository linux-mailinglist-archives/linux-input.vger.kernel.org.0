Return-Path: <linux-input+bounces-6990-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A5A98CCCB
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 07:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55A181C211B0
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 05:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CF3126BE7;
	Wed,  2 Oct 2024 05:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbIsokG2"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4D682866
	for <linux-input@vger.kernel.org>; Wed,  2 Oct 2024 05:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727848736; cv=none; b=m7DHkzx4F0baBvx7w+omSINk/TaTtf6/d+fpM5GZdPwPndK0ojCrk+RTDIdUpmtxnxOwMnoA4XQsZ2bUyD5xiutryK+tLrHOoZ1NSDAIA/K4cwkCpcto/lAKU0b0fBIoit4uRRsjMZu0ntf3zgiNSw0jgbT7zOSPGLdZFIPir0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727848736; c=relaxed/simple;
	bh=bjIJUa21KIkm2zLv1d4ekIX3U96i5d4YdOTateLnXXE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ml8yf/01T078cG2qWat6nnMJd364LCTsSmG/7WmPXP3cNqXCnu1pr2PqJ9O4Vj+7m39z9eORpSYLY/zlg7CYIT9mFlKxnqY8NrGMsNxQE1C7reBxP5RCygpi3opsRsu0sPaq7Ri8lH5GgDZwK3B0zty7tnh5S5aG0OipmTc6GWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbIsokG2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727848734; x=1759384734;
  h=date:from:to:cc:subject:message-id;
  bh=bjIJUa21KIkm2zLv1d4ekIX3U96i5d4YdOTateLnXXE=;
  b=RbIsokG2Dt7Dd7ujMksS5aUtod8Bhi779G6amnLNxMNUuCLFvB1QpwGD
   za4Qsl0l0atqat4DkELuZryiv6HTVu9Q0ge9vcI7Qx8sAhxBl/hGSwTnK
   hd4auY0zfLavY1ZGmDGXlblJOkhlEKgb3YAj+RyaERKzNPETXZGyNYxSc
   0oDwM14iXSVhLuTWrSKRXj3SiVAXrEeqARUx3xW1ZLkr4SSORVuJ5FPmN
   YJ/qp0/Py7Rx/oZjemm/Q6wBzifbYOwZyOKpodT0Grrhp3YgnUXNuzBTt
   UQ3zEX5LFbENBwpYkqq+rDtj82clzx4GJZ8S1XeY+VFRRd0va5juq2PY4
   w==;
X-CSE-ConnectionGUID: cQEcFiroTEGSO/urRkmw1A==
X-CSE-MsgGUID: bin/e+BgTTWMt39aRRPCyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27138797"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="27138797"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 22:58:54 -0700
X-CSE-ConnectionGUID: DZyiHPndTxO2TInWtke3fw==
X-CSE-MsgGUID: ZUI/HP+FRp+mX1pPUiPc/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="97266016"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Oct 2024 22:58:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svsNu-000Rbu-06;
	Wed, 02 Oct 2024 05:58:50 +0000
Date: Wed, 02 Oct 2024 13:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 515ef92b4939fa51f9f1ee278618e2d419b0b8b0
Message-ID: <202410021319.0iIPW6Zw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 515ef92b4939fa51f9f1ee278618e2d419b0b8b0  Input: correct typos in multiple comments across misc drivers

elapsed time: 1078m

configs tested: 246
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241002    gcc-14.1.0
arc                   randconfig-002-20241002    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                            dove_defconfig    gcc-14.1.0
arm                          ep93xx_defconfig    gcc-14.1.0
arm                         lpc32xx_defconfig    gcc-14.1.0
arm                          moxart_defconfig    gcc-14.1.0
arm                        multi_v5_defconfig    gcc-14.1.0
arm                          pxa3xx_defconfig    gcc-14.1.0
arm                             pxa_defconfig    gcc-14.1.0
arm                   randconfig-001-20241002    gcc-14.1.0
arm                   randconfig-002-20241002    gcc-14.1.0
arm                   randconfig-003-20241002    gcc-14.1.0
arm                   randconfig-004-20241002    gcc-14.1.0
arm                       spear13xx_defconfig    gcc-14.1.0
arm                           stm32_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241002    gcc-14.1.0
arm64                 randconfig-002-20241002    gcc-14.1.0
arm64                 randconfig-003-20241002    gcc-14.1.0
arm64                 randconfig-004-20241002    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241002    gcc-14.1.0
csky                  randconfig-002-20241002    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241002    gcc-14.1.0
hexagon               randconfig-002-20241002    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241001    clang-18
i386        buildonly-randconfig-001-20241002    clang-18
i386        buildonly-randconfig-002-20241001    gcc-12
i386        buildonly-randconfig-002-20241002    clang-18
i386        buildonly-randconfig-003-20241001    clang-18
i386        buildonly-randconfig-003-20241002    clang-18
i386        buildonly-randconfig-004-20241001    gcc-12
i386        buildonly-randconfig-004-20241002    clang-18
i386        buildonly-randconfig-005-20241001    clang-18
i386        buildonly-randconfig-005-20241002    clang-18
i386        buildonly-randconfig-006-20241001    gcc-12
i386        buildonly-randconfig-006-20241002    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241001    gcc-12
i386                  randconfig-001-20241002    clang-18
i386                  randconfig-002-20241001    clang-18
i386                  randconfig-002-20241002    clang-18
i386                  randconfig-003-20241001    clang-18
i386                  randconfig-003-20241002    clang-18
i386                  randconfig-004-20241001    gcc-12
i386                  randconfig-004-20241002    clang-18
i386                  randconfig-005-20241001    clang-18
i386                  randconfig-005-20241002    clang-18
i386                  randconfig-006-20241001    clang-18
i386                  randconfig-006-20241002    clang-18
i386                  randconfig-011-20241001    gcc-12
i386                  randconfig-011-20241002    clang-18
i386                  randconfig-012-20241001    gcc-12
i386                  randconfig-012-20241002    clang-18
i386                  randconfig-013-20241001    gcc-12
i386                  randconfig-013-20241002    clang-18
i386                  randconfig-014-20241001    gcc-11
i386                  randconfig-014-20241002    clang-18
i386                  randconfig-015-20241001    gcc-12
i386                  randconfig-015-20241002    clang-18
i386                  randconfig-016-20241001    gcc-12
i386                  randconfig-016-20241002    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241002    gcc-14.1.0
loongarch             randconfig-002-20241002    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                         apollo_defconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        m5272c3_defconfig    gcc-14.1.0
m68k                       m5475evb_defconfig    gcc-14.1.0
m68k                            q40_defconfig    gcc-14.1.0
m68k                           sun3_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm47xx_defconfig    gcc-14.1.0
mips                         cobalt_defconfig    gcc-14.1.0
mips                           ip28_defconfig    gcc-14.1.0
mips                          malta_defconfig    gcc-14.1.0
mips                        qi_lb60_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241002    gcc-14.1.0
nios2                 randconfig-002-20241002    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241002    gcc-14.1.0
parisc                randconfig-002-20241002    gcc-14.1.0
parisc64                         alldefconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                     asp8347_defconfig    gcc-14.1.0
powerpc                      bamboo_defconfig    gcc-14.1.0
powerpc                          g5_defconfig    gcc-14.1.0
powerpc                     kmeter1_defconfig    gcc-14.1.0
powerpc                 mpc834x_itx_defconfig    gcc-14.1.0
powerpc                 mpc836x_rdk_defconfig    gcc-14.1.0
powerpc                    mvme5100_defconfig    gcc-14.1.0
powerpc                      pcm030_defconfig    gcc-14.1.0
powerpc                      ppc6xx_defconfig    gcc-14.1.0
powerpc               randconfig-002-20241002    gcc-14.1.0
powerpc               randconfig-003-20241002    gcc-14.1.0
powerpc                     sequoia_defconfig    gcc-14.1.0
powerpc                     skiroot_defconfig    gcc-14.1.0
powerpc                     tqm5200_defconfig    gcc-14.1.0
powerpc                 xes_mpc85xx_defconfig    gcc-14.1.0
powerpc64                        alldefconfig    gcc-14.1.0
powerpc64             randconfig-001-20241002    gcc-14.1.0
powerpc64             randconfig-002-20241002    gcc-14.1.0
powerpc64             randconfig-003-20241002    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241002    gcc-14.1.0
riscv                 randconfig-002-20241002    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                                defconfig    gcc-14.1.0
s390                  randconfig-001-20241002    gcc-14.1.0
s390                  randconfig-002-20241002    gcc-14.1.0
s390                       zfcpdump_defconfig    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                         ap325rxa_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20241002    gcc-14.1.0
sh                    randconfig-002-20241002    gcc-14.1.0
sh                           se7343_defconfig    gcc-14.1.0
sh                           se7712_defconfig    gcc-14.1.0
sh                           se7722_defconfig    gcc-14.1.0
sh                           se7780_defconfig    gcc-14.1.0
sh                             sh03_defconfig    gcc-14.1.0
sh                     sh7710voipgw_defconfig    gcc-14.1.0
sh                        sh7763rdp_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc                       sparc64_defconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241002    gcc-14.1.0
sparc64               randconfig-002-20241002    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                             i386_defconfig    gcc-14.1.0
um                    randconfig-001-20241002    gcc-14.1.0
um                    randconfig-002-20241002    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241002    gcc-12
x86_64      buildonly-randconfig-002-20241002    gcc-12
x86_64      buildonly-randconfig-003-20241002    gcc-12
x86_64      buildonly-randconfig-004-20241002    gcc-12
x86_64      buildonly-randconfig-005-20241002    gcc-12
x86_64      buildonly-randconfig-006-20241002    gcc-12
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241002    gcc-12
x86_64                randconfig-002-20241002    gcc-12
x86_64                randconfig-003-20241002    gcc-12
x86_64                randconfig-004-20241002    gcc-12
x86_64                randconfig-005-20241002    gcc-12
x86_64                randconfig-006-20241002    gcc-12
x86_64                randconfig-011-20241002    gcc-12
x86_64                randconfig-012-20241002    gcc-12
x86_64                randconfig-013-20241002    gcc-12
x86_64                randconfig-014-20241002    gcc-12
x86_64                randconfig-015-20241002    gcc-12
x86_64                randconfig-016-20241002    gcc-12
x86_64                randconfig-071-20241002    gcc-12
x86_64                randconfig-072-20241002    gcc-12
x86_64                randconfig-073-20241002    gcc-12
x86_64                randconfig-074-20241002    gcc-12
x86_64                randconfig-075-20241002    gcc-12
x86_64                randconfig-076-20241002    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                    rhel-8.3-kselftests    gcc-12
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                generic_kc705_defconfig    gcc-14.1.0
xtensa                randconfig-001-20241002    gcc-14.1.0
xtensa                randconfig-002-20241002    gcc-14.1.0
xtensa                         virt_defconfig    gcc-14.1.0
xtensa                    xip_kc705_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

