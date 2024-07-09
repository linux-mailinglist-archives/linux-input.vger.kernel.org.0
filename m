Return-Path: <linux-input+bounces-4936-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB3592C1FF
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 19:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5B822939DE
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 17:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 201E617B04F;
	Tue,  9 Jul 2024 16:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACnkmid6"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0F018563E
	for <linux-input@vger.kernel.org>; Tue,  9 Jul 2024 16:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720544153; cv=none; b=LR24hRza1/vPTU5os+PnPL1431UUQ0xoJnu5BRLpiJxSC2dKQW9o/raqHNhesXUZzwCBAg/2Ec4xnJ5GSsGzuwNPk6+eZCOO4tdnRIgxjnJa06+Fr5N/njksXV9pZrbBKJ3FNH4cTVjXo+aRceoIHbb1uPznxlsuN7HQcp0QwOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720544153; c=relaxed/simple;
	bh=T+O9CqRCVUqISiPU1TtHnvumAWe2aE6gq+xxuXur2xM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nWUTsEbA1u2Vjn34zw6MixvjCzHOWWYlxyVNCk+8GKBob3pFzumtf/JVVzagVL3l26ihRTg5j9qWnHE29zRNJOge1OtSO0OZ/CB9KNjkcCmT4yI1btIXg6E8wYLmzKxwcoHPAcspfIBQyIRiZBJKD2g6MHQaxLpuuwuWAm8OVcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACnkmid6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720544151; x=1752080151;
  h=date:from:to:cc:subject:message-id;
  bh=T+O9CqRCVUqISiPU1TtHnvumAWe2aE6gq+xxuXur2xM=;
  b=ACnkmid6eLMFkQDlKbJHcBPaLPtnq0mhd/suKsLi4WTWMOm2nGEtlGRN
   Rz9IvJICxglP3O72K8sChBrN6CCuoZChg6ehWvtkVAIQZN1TfBcjJYp4F
   k/0dlNVFQkFPvU5Aq9QxqC6xB56wtSd5VomcEUlcPW6ILTlLemgxrNNKi
   9rHDcxiWOE3absnXq5TYDqJUop0B3zUNRvfJhsvfVATukjhfMmbIIolGu
   vxv4dTzyQZZAkRcoBjcf5pnhqJFWbTQutrzW/M8c0EW4t7vSKM/uuPgGf
   k+vNYQ/s4h2UjoHBfTFgQv7NdSOfyxISO1eUz5WkftgTYchonX73J+dRg
   w==;
X-CSE-ConnectionGUID: wAh0GxipQcyIBbzZeZTZpg==
X-CSE-MsgGUID: 5s7EhUd0Svufy310Y/zhWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17650771"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="17650771"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 09:55:50 -0700
X-CSE-ConnectionGUID: gDw0zkUVSaWjwP1AdWD4Kw==
X-CSE-MsgGUID: 8VZcmQxETmObf4WHPBX3pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="48648685"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jul 2024 09:55:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRE83-000WuX-0N;
	Tue, 09 Jul 2024 16:55:47 +0000
Date: Wed, 10 Jul 2024 00:55:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 5e91cef94426d71e3156864d52753ace4cee721a
Message-ID: <202407100033.IeDugqaI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 5e91cef94426d71e3156864d52753ace4cee721a  Input: himax_hx83112b - add support for HX83100A

elapsed time: 998m

configs tested: 219
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240709   gcc-13.2.0
arc                   randconfig-002-20240709   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                     am200epdkit_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                          ixp4xx_defconfig   gcc-13.2.0
arm                         mv78xx0_defconfig   clang-19
arm                         nhk8815_defconfig   gcc-13.2.0
arm                           omap1_defconfig   gcc-13.2.0
arm                   randconfig-001-20240709   gcc-13.2.0
arm                   randconfig-002-20240709   gcc-13.2.0
arm                   randconfig-003-20240709   gcc-13.2.0
arm                   randconfig-004-20240709   gcc-13.2.0
arm                         socfpga_defconfig   gcc-13.2.0
arm                           spitz_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240709   gcc-13.2.0
arm64                 randconfig-002-20240709   gcc-13.2.0
arm64                 randconfig-003-20240709   gcc-13.2.0
arm64                 randconfig-004-20240709   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240709   gcc-13.2.0
csky                  randconfig-002-20240709   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240709   gcc-11
i386         buildonly-randconfig-002-20240709   gcc-11
i386         buildonly-randconfig-002-20240709   gcc-13
i386         buildonly-randconfig-003-20240709   clang-18
i386         buildonly-randconfig-003-20240709   gcc-11
i386         buildonly-randconfig-004-20240709   clang-18
i386         buildonly-randconfig-004-20240709   gcc-11
i386         buildonly-randconfig-005-20240709   clang-18
i386         buildonly-randconfig-005-20240709   gcc-11
i386         buildonly-randconfig-006-20240709   clang-18
i386         buildonly-randconfig-006-20240709   gcc-11
i386                                defconfig   clang-18
i386                  randconfig-001-20240709   gcc-11
i386                  randconfig-001-20240709   gcc-13
i386                  randconfig-002-20240709   clang-18
i386                  randconfig-002-20240709   gcc-11
i386                  randconfig-003-20240709   gcc-11
i386                  randconfig-004-20240709   gcc-11
i386                  randconfig-004-20240709   gcc-13
i386                  randconfig-005-20240709   gcc-11
i386                  randconfig-005-20240709   gcc-13
i386                  randconfig-006-20240709   gcc-11
i386                  randconfig-006-20240709   gcc-13
i386                  randconfig-011-20240709   clang-18
i386                  randconfig-011-20240709   gcc-11
i386                  randconfig-012-20240709   gcc-11
i386                  randconfig-012-20240709   gcc-13
i386                  randconfig-013-20240709   gcc-11
i386                  randconfig-013-20240709   gcc-12
i386                  randconfig-014-20240709   clang-18
i386                  randconfig-014-20240709   gcc-11
i386                  randconfig-015-20240709   clang-18
i386                  randconfig-015-20240709   gcc-11
i386                  randconfig-016-20240709   gcc-10
i386                  randconfig-016-20240709   gcc-11
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240709   gcc-13.2.0
loongarch             randconfig-002-20240709   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                            mac_defconfig   gcc-13.2.0
m68k                        mvme16x_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                         bigsur_defconfig   gcc-13.2.0
mips                       bmips_be_defconfig   clang-19
mips                           ci20_defconfig   clang-19
mips                           ip32_defconfig   clang-19
mips                       lemote2f_defconfig   gcc-13.2.0
mips                      malta_kvm_defconfig   gcc-13.2.0
mips                        maltaup_defconfig   gcc-13.2.0
mips                    maltaup_xpa_defconfig   gcc-13.2.0
nios2                         3c120_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240709   gcc-13.2.0
nios2                 randconfig-002-20240709   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
openrisc                 simple_smp_defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240709   gcc-13.2.0
parisc                randconfig-002-20240709   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   gcc-13.2.0
powerpc                   lite5200b_defconfig   gcc-13.2.0
powerpc                   motionpro_defconfig   gcc-13.2.0
powerpc                 mpc8315_rdb_defconfig   clang-19
powerpc               mpc834x_itxgp_defconfig   clang-19
powerpc                    mvme5100_defconfig   clang-19
powerpc                    mvme5100_defconfig   gcc-13.2.0
powerpc                      pcm030_defconfig   gcc-13.2.0
powerpc                     powernv_defconfig   clang-19
powerpc                     powernv_defconfig   gcc-13.2.0
powerpc                       ppc64_defconfig   clang-19
powerpc                         ps3_defconfig   gcc-13.2.0
powerpc                     rainier_defconfig   clang-19
powerpc               randconfig-001-20240709   gcc-13.2.0
powerpc               randconfig-002-20240709   gcc-13.2.0
powerpc               randconfig-003-20240709   gcc-13.2.0
powerpc                     redwood_defconfig   gcc-13.2.0
powerpc                      tqm8xx_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240709   gcc-13.2.0
powerpc64             randconfig-002-20240709   gcc-13.2.0
powerpc64             randconfig-003-20240709   gcc-13.2.0
riscv                            allmodconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
riscv                 randconfig-001-20240709   gcc-13.2.0
riscv                 randconfig-002-20240709   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   gcc-13.2.0
s390                  randconfig-001-20240709   gcc-13.2.0
s390                  randconfig-002-20240709   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                ecovec24-romimage_defconfig   gcc-13.2.0
sh                    randconfig-001-20240709   gcc-13.2.0
sh                    randconfig-002-20240709   gcc-13.2.0
sh                          rsk7203_defconfig   gcc-13.2.0
sh                           se7206_defconfig   gcc-13.2.0
sh                           se7619_defconfig   gcc-13.2.0
sh                           se7751_defconfig   gcc-13.2.0
sh                        sh7757lcr_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc                       sparc64_defconfig   gcc-13.2.0
sparc64                          alldefconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240709   gcc-13.2.0
sparc64               randconfig-002-20240709   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.2.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240709   gcc-13.2.0
um                    randconfig-002-20240709   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240709   gcc-11
x86_64       buildonly-randconfig-002-20240709   gcc-11
x86_64       buildonly-randconfig-003-20240709   gcc-11
x86_64       buildonly-randconfig-004-20240709   gcc-11
x86_64       buildonly-randconfig-005-20240709   gcc-11
x86_64       buildonly-randconfig-006-20240709   gcc-11
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240709   gcc-11
x86_64                randconfig-002-20240709   gcc-11
x86_64                randconfig-003-20240709   gcc-11
x86_64                randconfig-004-20240709   gcc-11
x86_64                randconfig-005-20240709   gcc-11
x86_64                randconfig-006-20240709   gcc-11
x86_64                randconfig-011-20240709   gcc-11
x86_64                randconfig-012-20240709   gcc-11
x86_64                randconfig-013-20240709   gcc-11
x86_64                randconfig-014-20240709   gcc-11
x86_64                randconfig-015-20240709   gcc-11
x86_64                randconfig-016-20240709   gcc-11
x86_64                randconfig-071-20240709   gcc-11
x86_64                randconfig-072-20240709   gcc-11
x86_64                randconfig-073-20240709   gcc-11
x86_64                randconfig-074-20240709   gcc-11
x86_64                randconfig-075-20240709   gcc-11
x86_64                randconfig-076-20240709   gcc-11
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                  nommu_kc705_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240709   gcc-13.2.0
xtensa                randconfig-002-20240709   gcc-13.2.0
xtensa                    xip_kc705_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

