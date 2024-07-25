Return-Path: <linux-input+bounces-5147-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 917FE93BA7C
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 04:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45A8A283408
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 02:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B734C84;
	Thu, 25 Jul 2024 02:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oE4lGjBM"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601864687
	for <linux-input@vger.kernel.org>; Thu, 25 Jul 2024 02:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721873209; cv=none; b=gCvUlbduR2lp4zlTNmSmSxoLC3kAl1+dmKxDMKhZ6HqJTG5rw3/Uk8wZWnnGT1ED2671NfL4Zc4QL/2TyiPzYXY3+APgX1DCU3hmybpMKFSl8WX3YfzM82om++8ex44nY5+m1f4oMvnIXGyz1yl4ov1sx39btR0d00C8a7q271k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721873209; c=relaxed/simple;
	bh=xXJza1ZiH9lZC+23qq1BcBOwDq5wXZCnsAloZULq7DE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=os5ICdIqC72BEevEBCp0jJlwKK8exUCQzoP5VtSZ0/J2nhBX4+7zMeQzCcHx7jZQwxQfzYHcx7Q1M8oWOl35xb43dzjKTzhKrGg15Oka1RCMU5zL2m7j1ybGy0PcHkcP2Rfd9QK3JiPedXNo19F+JXuho5vAOl5RORFNnH0KgEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oE4lGjBM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721873207; x=1753409207;
  h=date:from:to:cc:subject:message-id;
  bh=xXJza1ZiH9lZC+23qq1BcBOwDq5wXZCnsAloZULq7DE=;
  b=oE4lGjBMPkQA5ESsZs5lA8CFv7irI8FPOMPEnzidJfCXEX5pGxmvcOMQ
   mFBRHuGNQs9DdWk7pBOmEHKzuDHtqwr6lm/s7fup2Q5pujg9NPscDhICt
   XYuhNKsvH6gULC+4FWomhrQ1uLiyDzu6VI5LKY9djbPd59oTWjlYQ8N7g
   JyLjc4K4hAJyl+xKbNG5mXgEu8Vijl2lXa/Gc/Gu7enaiwhJAx20uygKV
   prwjNbPiFXUGzp/WGxpbu/+1r7Js3iaBghcXto8vEQYYg2V8I4kt6qJxo
   8WIkbvwSAXOaP+8ZHnyFrIgV78wKH9t79KF5lGcAms6j6V+IjyVEUxXVv
   Q==;
X-CSE-ConnectionGUID: UiBWv6FHSealPnVB+AZpvg==
X-CSE-MsgGUID: Qg1E7eTHR/OZ8bRK/9GQEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30189597"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; 
   d="scan'208";a="30189597"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 19:06:47 -0700
X-CSE-ConnectionGUID: p+XEIIYDQ9u/wKd+aeb/yw==
X-CSE-MsgGUID: 5n80yumTQgOKxpLM0zST3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; 
   d="scan'208";a="52645070"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Jul 2024 19:06:45 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWnsR-000neu-0g;
	Thu, 25 Jul 2024 02:06:43 +0000
Date: Thu, 25 Jul 2024 10:06:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 740ff03d7238214a318cdcfd96dec51832b053d2
Message-ID: <202407251036.kdjRPrN1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 740ff03d7238214a318cdcfd96dec51832b053d2  Input: Add driver for PixArt PS/2 touchpad

elapsed time: 1221m

configs tested: 336
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              alldefconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                      axs103_smp_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                            hsdk_defconfig   gcc-13.2.0
arc                   randconfig-001-20240724   gcc-13.2.0
arc                   randconfig-001-20240725   gcc-13.2.0
arc                   randconfig-002-20240724   gcc-13.2.0
arc                   randconfig-002-20240725   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                       aspeed_g5_defconfig   gcc-14.1.0
arm                          collie_defconfig   gcc-13.2.0
arm                     davinci_all_defconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                            hisi_defconfig   gcc-13.2.0
arm                         lpc18xx_defconfig   gcc-13.2.0
arm                            mmp2_defconfig   gcc-13.2.0
arm                        multi_v5_defconfig   gcc-13.2.0
arm                       netwinder_defconfig   gcc-13.2.0
arm                         nhk8815_defconfig   gcc-13.2.0
arm                           omap1_defconfig   gcc-14.1.0
arm                             pxa_defconfig   gcc-13.2.0
arm                   randconfig-001-20240724   clang-19
arm                   randconfig-001-20240724   gcc-13.2.0
arm                   randconfig-001-20240725   gcc-13.2.0
arm                   randconfig-002-20240724   clang-19
arm                   randconfig-002-20240724   gcc-13.2.0
arm                   randconfig-002-20240725   gcc-13.2.0
arm                   randconfig-003-20240724   clang-19
arm                   randconfig-003-20240724   gcc-13.2.0
arm                   randconfig-003-20240725   gcc-13.2.0
arm                   randconfig-004-20240724   gcc-13.2.0
arm                   randconfig-004-20240724   gcc-14.1.0
arm                   randconfig-004-20240725   gcc-13.2.0
arm                        shmobile_defconfig   gcc-13.2.0
arm                       spear13xx_defconfig   gcc-14.1.0
arm                           spitz_defconfig   gcc-13.2.0
arm                           spitz_defconfig   gcc-14.1.0
arm                           sunxi_defconfig   gcc-13.2.0
arm                           u8500_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240724   gcc-13.2.0
arm64                 randconfig-001-20240724   gcc-14.1.0
arm64                 randconfig-001-20240725   gcc-13.2.0
arm64                 randconfig-002-20240724   gcc-13.2.0
arm64                 randconfig-002-20240724   gcc-14.1.0
arm64                 randconfig-002-20240725   gcc-13.2.0
arm64                 randconfig-003-20240724   gcc-13.2.0
arm64                 randconfig-003-20240724   gcc-14.1.0
arm64                 randconfig-003-20240725   gcc-13.2.0
arm64                 randconfig-004-20240724   gcc-13.2.0
arm64                 randconfig-004-20240724   gcc-14.1.0
arm64                 randconfig-004-20240725   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240724   gcc-13.2.0
csky                  randconfig-001-20240724   gcc-14.1.0
csky                  randconfig-001-20240725   gcc-13.2.0
csky                  randconfig-002-20240724   gcc-13.2.0
csky                  randconfig-002-20240724   gcc-14.1.0
csky                  randconfig-002-20240725   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240724   clang-19
hexagon               randconfig-002-20240724   clang-19
i386                             alldefconfig   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240724   clang-18
i386         buildonly-randconfig-001-20240725   gcc-13
i386         buildonly-randconfig-002-20240724   clang-18
i386         buildonly-randconfig-002-20240724   gcc-9
i386         buildonly-randconfig-002-20240725   gcc-13
i386         buildonly-randconfig-003-20240724   clang-18
i386         buildonly-randconfig-003-20240725   gcc-13
i386         buildonly-randconfig-004-20240724   clang-18
i386         buildonly-randconfig-004-20240725   gcc-13
i386         buildonly-randconfig-005-20240724   clang-18
i386         buildonly-randconfig-005-20240725   gcc-13
i386         buildonly-randconfig-006-20240724   clang-18
i386         buildonly-randconfig-006-20240725   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240724   clang-18
i386                  randconfig-001-20240725   gcc-13
i386                  randconfig-002-20240724   clang-18
i386                  randconfig-002-20240725   gcc-13
i386                  randconfig-003-20240724   clang-18
i386                  randconfig-003-20240725   gcc-13
i386                  randconfig-004-20240724   clang-18
i386                  randconfig-004-20240724   gcc-9
i386                  randconfig-004-20240725   gcc-13
i386                  randconfig-005-20240724   clang-18
i386                  randconfig-005-20240725   gcc-13
i386                  randconfig-006-20240724   clang-18
i386                  randconfig-006-20240725   gcc-13
i386                  randconfig-011-20240724   clang-18
i386                  randconfig-011-20240724   gcc-13
i386                  randconfig-011-20240725   gcc-13
i386                  randconfig-012-20240724   clang-18
i386                  randconfig-012-20240725   gcc-13
i386                  randconfig-013-20240724   clang-18
i386                  randconfig-013-20240724   gcc-13
i386                  randconfig-013-20240725   gcc-13
i386                  randconfig-014-20240724   clang-18
i386                  randconfig-014-20240724   gcc-8
i386                  randconfig-014-20240725   gcc-13
i386                  randconfig-015-20240724   clang-18
i386                  randconfig-015-20240724   gcc-13
i386                  randconfig-015-20240725   gcc-13
i386                  randconfig-016-20240724   clang-18
i386                  randconfig-016-20240725   gcc-13
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240724   gcc-13.2.0
loongarch             randconfig-001-20240724   gcc-14.1.0
loongarch             randconfig-001-20240725   gcc-13.2.0
loongarch             randconfig-002-20240724   gcc-13.2.0
loongarch             randconfig-002-20240724   gcc-14.1.0
loongarch             randconfig-002-20240725   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5272c3_defconfig   gcc-13.2.0
m68k                           sun3_defconfig   gcc-13.2.0
m68k                          sun3x_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                         bigsur_defconfig   gcc-14.1.0
mips                      fuloong2e_defconfig   gcc-13.2.0
mips                           gcw0_defconfig   gcc-13.2.0
mips                            gpr_defconfig   gcc-13.2.0
mips                           ip27_defconfig   gcc-13.2.0
mips                       lemote2f_defconfig   gcc-13.2.0
mips                      pic32mzda_defconfig   gcc-14.1.0
mips                   sb1250_swarm_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240724   gcc-13.2.0
nios2                 randconfig-001-20240724   gcc-14.1.0
nios2                 randconfig-001-20240725   gcc-13.2.0
nios2                 randconfig-002-20240724   gcc-13.2.0
nios2                 randconfig-002-20240724   gcc-14.1.0
nios2                 randconfig-002-20240725   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-64bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240724   gcc-13.2.0
parisc                randconfig-001-20240724   gcc-14.1.0
parisc                randconfig-001-20240725   gcc-13.2.0
parisc                randconfig-002-20240724   gcc-13.2.0
parisc                randconfig-002-20240724   gcc-14.1.0
parisc                randconfig-002-20240725   gcc-13.2.0
parisc64                         alldefconfig   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-14.1.0
powerpc                 canyonlands_defconfig   gcc-13.2.0
powerpc                     kmeter1_defconfig   gcc-13.2.0
powerpc                     ksi8560_defconfig   gcc-14.1.0
powerpc                   motionpro_defconfig   gcc-13.2.0
powerpc                     mpc5200_defconfig   gcc-13.2.0
powerpc               mpc834x_itxgp_defconfig   gcc-13.2.0
powerpc                 mpc837x_rdb_defconfig   gcc-14.1.0
powerpc                     mpc83xx_defconfig   gcc-13.2.0
powerpc                      pasemi_defconfig   gcc-13.2.0
powerpc                      pmac32_defconfig   gcc-14.1.0
powerpc                      ppc44x_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240724   clang-19
powerpc               randconfig-001-20240724   gcc-13.2.0
powerpc               randconfig-001-20240725   gcc-13.2.0
powerpc               randconfig-002-20240724   gcc-13.2.0
powerpc               randconfig-002-20240724   gcc-14.1.0
powerpc               randconfig-002-20240725   gcc-13.2.0
powerpc               randconfig-003-20240724   clang-19
powerpc               randconfig-003-20240724   gcc-13.2.0
powerpc               randconfig-003-20240725   gcc-13.2.0
powerpc                     redwood_defconfig   gcc-14.1.0
powerpc                     taishan_defconfig   gcc-13.2.0
powerpc                     tqm8540_defconfig   gcc-13.2.0
powerpc                     tqm8560_defconfig   gcc-14.1.0
powerpc64                        alldefconfig   gcc-13.2.0
powerpc64             randconfig-001-20240724   clang-19
powerpc64             randconfig-001-20240724   gcc-13.2.0
powerpc64             randconfig-001-20240725   gcc-13.2.0
powerpc64             randconfig-002-20240724   gcc-13.2.0
powerpc64             randconfig-002-20240724   gcc-14.1.0
powerpc64             randconfig-002-20240725   gcc-13.2.0
powerpc64             randconfig-003-20240724   clang-19
powerpc64             randconfig-003-20240724   gcc-13.2.0
powerpc64             randconfig-003-20240725   gcc-13.2.0
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv             nommu_k210_sdcard_defconfig   gcc-14.1.0
riscv                    nommu_virt_defconfig   gcc-14.1.0
riscv                 randconfig-001-20240724   gcc-13.2.0
riscv                 randconfig-001-20240724   gcc-14.1.0
riscv                 randconfig-001-20240725   gcc-13.2.0
riscv                 randconfig-002-20240724   gcc-13.2.0
riscv                 randconfig-002-20240724   gcc-14.1.0
riscv                 randconfig-002-20240725   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-13.2.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240724   gcc-13.2.0
s390                  randconfig-001-20240724   gcc-14.1.0
s390                  randconfig-001-20240725   gcc-13.2.0
s390                  randconfig-002-20240724   clang-19
s390                  randconfig-002-20240724   gcc-13.2.0
s390                  randconfig-002-20240725   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                        edosk7760_defconfig   gcc-13.2.0
sh                            hp6xx_defconfig   gcc-13.2.0
sh                               j2_defconfig   gcc-13.2.0
sh                          landisk_defconfig   gcc-13.2.0
sh                            migor_defconfig   gcc-14.1.0
sh                          r7785rp_defconfig   gcc-13.2.0
sh                    randconfig-001-20240724   gcc-13.2.0
sh                    randconfig-001-20240724   gcc-14.1.0
sh                    randconfig-001-20240725   gcc-13.2.0
sh                    randconfig-002-20240724   gcc-13.2.0
sh                    randconfig-002-20240724   gcc-14.1.0
sh                    randconfig-002-20240725   gcc-13.2.0
sh                          sdk7780_defconfig   gcc-13.2.0
sh                           se7705_defconfig   gcc-13.2.0
sh                           sh2007_defconfig   gcc-13.2.0
sh                        sh7763rdp_defconfig   gcc-14.1.0
sh                            shmin_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240724   gcc-13.2.0
sparc64               randconfig-001-20240724   gcc-14.1.0
sparc64               randconfig-001-20240725   gcc-13.2.0
sparc64               randconfig-002-20240724   gcc-13.2.0
sparc64               randconfig-002-20240724   gcc-14.1.0
sparc64               randconfig-002-20240725   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240724   clang-15
um                    randconfig-001-20240724   gcc-13.2.0
um                    randconfig-001-20240725   gcc-13.2.0
um                    randconfig-002-20240724   gcc-13
um                    randconfig-002-20240724   gcc-13.2.0
um                    randconfig-002-20240725   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240724   clang-18
x86_64       buildonly-randconfig-002-20240724   clang-18
x86_64       buildonly-randconfig-003-20240724   clang-18
x86_64       buildonly-randconfig-004-20240724   clang-18
x86_64       buildonly-randconfig-005-20240724   clang-18
x86_64       buildonly-randconfig-006-20240724   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240724   clang-18
x86_64                randconfig-002-20240724   clang-18
x86_64                randconfig-003-20240724   clang-18
x86_64                randconfig-004-20240724   clang-18
x86_64                randconfig-005-20240724   clang-18
x86_64                randconfig-006-20240724   clang-18
x86_64                randconfig-011-20240724   clang-18
x86_64                randconfig-012-20240724   clang-18
x86_64                randconfig-013-20240724   clang-18
x86_64                randconfig-014-20240724   clang-18
x86_64                randconfig-015-20240724   clang-18
x86_64                randconfig-016-20240724   clang-18
x86_64                randconfig-071-20240724   clang-18
x86_64                randconfig-072-20240724   clang-18
x86_64                randconfig-073-20240724   clang-18
x86_64                randconfig-074-20240724   clang-18
x86_64                randconfig-075-20240724   clang-18
x86_64                randconfig-076-20240724   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240724   gcc-13.2.0
xtensa                randconfig-001-20240724   gcc-14.1.0
xtensa                randconfig-001-20240725   gcc-13.2.0
xtensa                randconfig-002-20240724   gcc-13.2.0
xtensa                randconfig-002-20240724   gcc-14.1.0
xtensa                randconfig-002-20240725   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

