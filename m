Return-Path: <linux-input+bounces-9794-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED13A28BAE
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 14:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F38361683F5
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 13:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2A51FC3;
	Wed,  5 Feb 2025 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBsdiODB"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E3DA32
	for <linux-input@vger.kernel.org>; Wed,  5 Feb 2025 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762186; cv=none; b=jTWfIpkWKTdlgtS1hhu1cLM+WX2ZCJ9D1Hv9Aqqjbdz8J3euZUMET6KHiprBTIfzoSHQ73/QUwxmk1tZsigCSNY7O9qu0azqJWCsyTXWXZpp6js2wK43vRCGZuazJxZZ8cbOpd4pExllYoxdki87CZRV2QMsviwcEF/PYbbzlv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762186; c=relaxed/simple;
	bh=+GqZC/snyMjifJBlvSc6PM8UuzLVaT+NlE9Vb3Gsluw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZNEpBNO+94hzKXOnJw3CXXOnqtlhRz3/LnJNA1t9l2hx1TIkTWS/qRuavVLkX0JNjG5xbkwa+DWPZxVPhezX+t1+RCz5LnWSAGYJ6cY5jkEMOCf8XWPMXtL4cidrVomuboo+z/pm9XGD/94H5ix+IM5DTiAicwIEGn26SFiBT5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBsdiODB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738762184; x=1770298184;
  h=date:from:to:cc:subject:message-id;
  bh=+GqZC/snyMjifJBlvSc6PM8UuzLVaT+NlE9Vb3Gsluw=;
  b=VBsdiODBQ69lD0aq9ix242aIKPm1Ke9WIGzbHvGxgTe5nBempHo1nv+S
   EwiVrRElDAJLrRcrJ2OP8rziIWBWo9yfGTq/DGAMq4WMzjy/rF0qSlMyx
   J6IrAbh0MM+53b7RuhtjX3QJ7pOAtdlSh7VarIwUOlHsGrUdddNnkI9vq
   paVaMj52cdsfVu187wkZfLoh61KPfCInouApFM4+438j7v5MI6I4k27nB
   c8CLRcA2XlPfWYYD5niVpYgWd9peCnwxr0fSFAvkdAjLwmWF/IKlA5JdB
   eZAkENgJmABpzLtjj8lZoS4Fcih8vSc5GLjnail+nJigCyKqw+WHnq3JJ
   A==;
X-CSE-ConnectionGUID: sxwzr1ZVTjq44m2bmp++VQ==
X-CSE-MsgGUID: ecB3GNdvRzaTtW2w9oDyHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49974861"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="49974861"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 05:29:43 -0800
X-CSE-ConnectionGUID: rGilbUPpT/u/Pz1MXLagHw==
X-CSE-MsgGUID: A/cKw4/AR9qHa5UoB53OEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="110688258"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Feb 2025 05:29:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tffTG-000tul-1L;
	Wed, 05 Feb 2025 13:29:38 +0000
Date: Wed, 05 Feb 2025 21:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 ab4976976ee117ed53b752bac83453e6f64dad08
Message-ID: <202502052138.7VwfVz6y-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: ab4976976ee117ed53b752bac83453e6f64dad08  Input: drop vb2_ops_wait_prepare/finish

elapsed time: 1377m

configs tested: 229
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                                 defconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250205    gcc-13.2.0
arc                   randconfig-002-20250205    gcc-13.2.0
arc                           tb10x_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                                 defconfig    gcc-14.2.0
arm                           h3600_defconfig    clang-21
arm                            hisi_defconfig    gcc-14.2.0
arm                       multi_v4t_defconfig    clang-21
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250205    gcc-13.2.0
arm                   randconfig-001-20250205    gcc-14.2.0
arm                   randconfig-002-20250205    gcc-13.2.0
arm                   randconfig-002-20250205    gcc-14.2.0
arm                   randconfig-003-20250205    clang-16
arm                   randconfig-003-20250205    gcc-13.2.0
arm                   randconfig-004-20250205    gcc-13.2.0
arm                   randconfig-004-20250205    gcc-14.2.0
arm                         socfpga_defconfig    gcc-14.2.0
arm                       spear13xx_defconfig    clang-21
arm                        vexpress_defconfig    clang-21
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250205    gcc-13.2.0
arm64                 randconfig-001-20250205    gcc-14.2.0
arm64                 randconfig-002-20250205    gcc-13.2.0
arm64                 randconfig-002-20250205    gcc-14.2.0
arm64                 randconfig-003-20250205    gcc-13.2.0
arm64                 randconfig-003-20250205    gcc-14.2.0
arm64                 randconfig-004-20250205    gcc-13.2.0
arm64                 randconfig-004-20250205    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250204    gcc-14.2.0
csky                  randconfig-001-20250205    gcc-14.2.0
csky                  randconfig-002-20250204    gcc-14.2.0
csky                  randconfig-002-20250205    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250204    clang-21
hexagon               randconfig-001-20250205    gcc-14.2.0
hexagon               randconfig-002-20250204    clang-21
hexagon               randconfig-002-20250205    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20250204    gcc-12
i386        buildonly-randconfig-001-20250205    gcc-12
i386        buildonly-randconfig-002-20250204    clang-19
i386        buildonly-randconfig-002-20250205    gcc-12
i386        buildonly-randconfig-003-20250204    clang-19
i386        buildonly-randconfig-003-20250205    gcc-12
i386        buildonly-randconfig-004-20250204    gcc-12
i386        buildonly-randconfig-004-20250205    gcc-12
i386        buildonly-randconfig-005-20250204    clang-19
i386        buildonly-randconfig-005-20250205    gcc-12
i386        buildonly-randconfig-006-20250204    gcc-12
i386        buildonly-randconfig-006-20250205    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250205    gcc-12
i386                  randconfig-002-20250205    gcc-12
i386                  randconfig-003-20250205    gcc-12
i386                  randconfig-004-20250205    gcc-12
i386                  randconfig-005-20250205    gcc-12
i386                  randconfig-006-20250205    gcc-12
i386                  randconfig-007-20250205    gcc-12
i386                  randconfig-011-20250205    clang-19
i386                  randconfig-012-20250205    clang-19
i386                  randconfig-013-20250205    clang-19
i386                  randconfig-014-20250205    clang-19
i386                  randconfig-015-20250205    clang-19
i386                  randconfig-016-20250205    clang-19
i386                  randconfig-017-20250205    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250204    gcc-14.2.0
loongarch             randconfig-001-20250205    gcc-14.2.0
loongarch             randconfig-002-20250204    gcc-14.2.0
loongarch             randconfig-002-20250205    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip22_defconfig    gcc-14.2.0
nios2                         3c120_defconfig    gcc-14.2.0
nios2                            alldefconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250204    gcc-14.2.0
nios2                 randconfig-001-20250205    gcc-14.2.0
nios2                 randconfig-002-20250204    gcc-14.2.0
nios2                 randconfig-002-20250205    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250204    gcc-14.2.0
parisc                randconfig-001-20250205    gcc-14.2.0
parisc                randconfig-002-20250204    gcc-14.2.0
parisc                randconfig-002-20250205    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250204    gcc-14.2.0
powerpc               randconfig-001-20250205    gcc-14.2.0
powerpc               randconfig-002-20250204    gcc-14.2.0
powerpc               randconfig-002-20250205    gcc-14.2.0
powerpc               randconfig-003-20250204    clang-21
powerpc               randconfig-003-20250205    gcc-14.2.0
powerpc                     taishan_defconfig    clang-21
powerpc                      tqm8xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250204    gcc-14.2.0
powerpc64             randconfig-001-20250205    gcc-14.2.0
powerpc64             randconfig-002-20250204    clang-19
powerpc64             randconfig-002-20250205    gcc-14.2.0
powerpc64             randconfig-003-20250204    gcc-14.2.0
powerpc64             randconfig-003-20250205    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250205    gcc-14.2.0
riscv                 randconfig-002-20250205    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250205    clang-17
s390                  randconfig-001-20250205    gcc-14.2.0
s390                  randconfig-002-20250205    clang-19
s390                  randconfig-002-20250205    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        edosk7705_defconfig    clang-21
sh                        edosk7760_defconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                    randconfig-001-20250205    gcc-14.2.0
sh                    randconfig-002-20250205    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                            titan_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250205    gcc-14.2.0
sparc                 randconfig-002-20250205    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250205    gcc-14.2.0
sparc64               randconfig-002-20250205    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250205    gcc-11
um                    randconfig-001-20250205    gcc-14.2.0
um                    randconfig-002-20250205    clang-21
um                    randconfig-002-20250205    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250204    clang-19
x86_64      buildonly-randconfig-001-20250205    clang-19
x86_64      buildonly-randconfig-002-20250204    clang-19
x86_64      buildonly-randconfig-002-20250205    clang-19
x86_64      buildonly-randconfig-003-20250204    clang-19
x86_64      buildonly-randconfig-003-20250205    clang-19
x86_64      buildonly-randconfig-004-20250204    gcc-11
x86_64      buildonly-randconfig-004-20250205    clang-19
x86_64      buildonly-randconfig-005-20250204    clang-19
x86_64      buildonly-randconfig-005-20250205    clang-19
x86_64      buildonly-randconfig-006-20250204    clang-19
x86_64      buildonly-randconfig-006-20250205    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250205    clang-19
x86_64                randconfig-002-20250205    clang-19
x86_64                randconfig-003-20250205    clang-19
x86_64                randconfig-004-20250205    clang-19
x86_64                randconfig-005-20250205    clang-19
x86_64                randconfig-006-20250205    clang-19
x86_64                randconfig-007-20250205    clang-19
x86_64                randconfig-008-20250205    clang-19
x86_64                randconfig-071-20250205    gcc-12
x86_64                randconfig-072-20250205    gcc-12
x86_64                randconfig-073-20250205    gcc-12
x86_64                randconfig-074-20250205    gcc-12
x86_64                randconfig-075-20250205    gcc-12
x86_64                randconfig-076-20250205    gcc-12
x86_64                randconfig-077-20250205    gcc-12
x86_64                randconfig-078-20250205    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250205    gcc-14.2.0
xtensa                randconfig-002-20250205    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

