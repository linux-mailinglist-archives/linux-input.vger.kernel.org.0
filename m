Return-Path: <linux-input+bounces-5025-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F28419306B8
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2024 19:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73A371F24114
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2024 17:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD4913B787;
	Sat, 13 Jul 2024 17:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJshTQIa"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B320C22097
	for <linux-input@vger.kernel.org>; Sat, 13 Jul 2024 17:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720892080; cv=none; b=XV4xmRcdfFFhjdC0W9IqBJPdH1WPQ9gGdSdMRdiOo35BcwLRXbCGQDnk1u/0FvsqNHNB3V48WsmbUUQpb4o3GaxNHxiBXcL4e90zwgLQ23GJL0fg4csPyl8Zl9mBMdC+mrpXXlX60iM5vsAdOpBlwOwEzoB9XePjb369YuevHrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720892080; c=relaxed/simple;
	bh=rjKaIpMag5BIsDYDG9HZjOE/SVa0ujUgghcYHMU82V8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SONnIwbBL5M+ONYhTqUV6+8EaqQQmuEBCkCaYyXNOZq/uH4/7ApfcQVyIt0o8Ntcnfh3brb18wXVLp2ZY3oAfPkUKeCvV6qLqyYlBfxWWmDxDseN9P5GffY1Lx3SVJNiLyeH1UApyjBPqebjIiVw4roXFl4HnPpvDO5xzYKXrUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJshTQIa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720892079; x=1752428079;
  h=date:from:to:cc:subject:message-id;
  bh=rjKaIpMag5BIsDYDG9HZjOE/SVa0ujUgghcYHMU82V8=;
  b=EJshTQIaMrChDIAcoXFRZ4o9UgWqtMBOu1GqjwUekS0mhEHA5YNu5qHa
   arPPbdqUB8HoTHpqklQSRixTgboXzqFiCy+SfNjTBrTxRaaKGKmLWx2hY
   xwH7NGpPgnYM8oo3v1wnrT9Q4yLoFYW5nPu2Pu8XIXUxmxvEbQZqNTNCZ
   L/+bkCc0S7ovPBWXj47cUbyKuOr23J/Rqr4RU+Xpz+R6+3Mg1EQFPcjUR
   yUWc7w7eRa51xhB/hvUtI3fUGp2IZ0p152j0hMZx6EL+cF2PJQA6txH0u
   B7I4HabXg2ds8v1ng/YOwnVEg/2pEz/eSMmJ8h8JE9L7NnLnCJR2ooLHe
   Q==;
X-CSE-ConnectionGUID: DC8btUKzSymFt/i5dGqpqA==
X-CSE-MsgGUID: 987LCVlaSB6ND4K53zHRRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="12535415"
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="12535415"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 10:34:38 -0700
X-CSE-ConnectionGUID: ugfYjoO4SuuSs2xvHxEkag==
X-CSE-MsgGUID: vNwNNhJ6T368dZStnGXnww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="80299714"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2024 10:34:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSgdn-000cZ8-0N;
	Sat, 13 Jul 2024 17:34:35 +0000
Date: Sun, 14 Jul 2024 01:33:52 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 8c98dddc233c233a35e56b49d5cd9e032d442300
Message-ID: <202407140149.Y3nZKffQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 8c98dddc233c233a35e56b49d5cd9e032d442300  Input: exc3000 - add EXC81W32 support

elapsed time: 1079m

configs tested: 163
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                       aspeed_g4_defconfig   gcc-13.2.0
arm                         at91_dt_defconfig   clang-19
arm                     davinci_all_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                           h3600_defconfig   gcc-13.2.0
arm                           imxrt_defconfig   gcc-13.2.0
arm                       omap2plus_defconfig   gcc-14.1.0
arm                        realview_defconfig   clang-19
arm                           sama5_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240713   clang-18
i386         buildonly-randconfig-002-20240713   clang-18
i386         buildonly-randconfig-003-20240713   clang-18
i386         buildonly-randconfig-004-20240713   clang-18
i386         buildonly-randconfig-005-20240713   clang-18
i386         buildonly-randconfig-006-20240713   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240713   clang-18
i386                  randconfig-002-20240713   clang-18
i386                  randconfig-003-20240713   clang-18
i386                  randconfig-004-20240713   clang-18
i386                  randconfig-005-20240713   clang-18
i386                  randconfig-006-20240713   clang-18
i386                  randconfig-011-20240713   clang-18
i386                  randconfig-012-20240713   clang-18
i386                  randconfig-013-20240713   clang-18
i386                  randconfig-014-20240713   clang-18
i386                  randconfig-015-20240713   clang-18
i386                  randconfig-016-20240713   clang-18
loongarch                        alldefconfig   gcc-14.1.0
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
m68k                             alldefconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                       bvme6000_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                           sun3_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
microblaze                      mmu_defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                      bmips_stb_defconfig   gcc-13.2.0
mips                     cu1830-neo_defconfig   gcc-13.2.0
mips                     loongson1b_defconfig   gcc-14.1.0
mips                      loongson3_defconfig   clang-19
mips                      malta_kvm_defconfig   gcc-14.1.0
mips                malta_qemu_32r6_defconfig   clang-19
mips                      maltasmvp_defconfig   gcc-14.1.0
mips                        maltaup_defconfig   clang-19
mips                           mtx1_defconfig   gcc-13.2.0
mips                          rm200_defconfig   gcc-13.2.0
mips                           rs90_defconfig   clang-19
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-64bit_defconfig   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                     akebono_defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                     asp8347_defconfig   clang-19
powerpc                 canyonlands_defconfig   clang-19
powerpc                      cm5200_defconfig   gcc-13.2.0
powerpc                       eiger_defconfig   clang-19
powerpc                   motionpro_defconfig   gcc-13.2.0
powerpc                   motionpro_defconfig   gcc-14.1.0
powerpc                     mpc512x_defconfig   clang-19
powerpc                     mpc5200_defconfig   gcc-13.2.0
powerpc                     mpc5200_defconfig   gcc-14.1.0
powerpc                      ppc44x_defconfig   clang-19
powerpc                     tqm8555_defconfig   clang-19
powerpc                 xes_mpc85xx_defconfig   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_k210_defconfig   gcc-14.1.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                         ap325rxa_defconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                ecovec24-romimage_defconfig   gcc-14.1.0
sh                             shx3_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240713   clang-18
x86_64       buildonly-randconfig-002-20240713   clang-18
x86_64       buildonly-randconfig-003-20240713   clang-18
x86_64       buildonly-randconfig-004-20240713   clang-18
x86_64       buildonly-randconfig-005-20240713   clang-18
x86_64       buildonly-randconfig-006-20240713   clang-18
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240713   clang-18
x86_64                randconfig-002-20240713   clang-18
x86_64                randconfig-003-20240713   clang-18
x86_64                randconfig-004-20240713   clang-18
x86_64                randconfig-005-20240713   clang-18
x86_64                randconfig-006-20240713   clang-18
x86_64                randconfig-011-20240713   clang-18
x86_64                randconfig-012-20240713   clang-18
x86_64                randconfig-013-20240713   clang-18
x86_64                randconfig-014-20240713   clang-18
x86_64                randconfig-015-20240713   clang-18
x86_64                randconfig-016-20240713   clang-18
x86_64                randconfig-071-20240713   clang-18
x86_64                randconfig-072-20240713   clang-18
x86_64                randconfig-073-20240713   clang-18
x86_64                randconfig-074-20240713   clang-18
x86_64                randconfig-075-20240713   clang-18
x86_64                randconfig-076-20240713   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                    xip_kc705_defconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

