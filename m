Return-Path: <linux-input+bounces-2404-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 552CD87DF60
	for <lists+linux-input@lfdr.de>; Sun, 17 Mar 2024 19:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 066BB2812C7
	for <lists+linux-input@lfdr.de>; Sun, 17 Mar 2024 18:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8651CD29;
	Sun, 17 Mar 2024 18:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgOwxzGp"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A46A1D531
	for <linux-input@vger.kernel.org>; Sun, 17 Mar 2024 18:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710701558; cv=none; b=uzggtIuYvUsgXwvk3W6X3vsULDOMAb0vNQ1/LvT2EmHFZhk1QVJOHRs2aYLBw5n/+9FGil3u4ei7K4IVWFMQLRM9Hp5yZ0NC5sJBl8XY+iQH+8nZuMtIpQx8FDEraGYL6EuCJ31XCohQCLBPU61MbZ5zwkItmkronRo17miP4MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710701558; c=relaxed/simple;
	bh=k2MogJ9H5LQwXyBUv+EMqA/mVDqbWD/Yr5G8XDdQkjk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XCprLLvl2Ag0dD6PHh0l7qin7KD1WBE8B71GPD+ttLMRULV/JjlW6fQH+0n9aYml5BG3BpKD5+UDdf1jKqoKrNNF/fzd6UUuqffSbz8Ag7wy/r964RDs8o1LAPx9COcMu2YntGPrlNC3BFIhdbw4Vm0eLAFfqroHPEEbAPPAGaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgOwxzGp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710701556; x=1742237556;
  h=date:from:to:cc:subject:message-id;
  bh=k2MogJ9H5LQwXyBUv+EMqA/mVDqbWD/Yr5G8XDdQkjk=;
  b=cgOwxzGpDM1rIRZXYy/Qzv5gnId1MpJR/xyvsspecGUbRW1EPzHOYwlh
   gZm/MX5rDaaoHN+5/pUpOvTZHC0eBD2Rkce+9+rdQoGJct+edUY3lxHy0
   bZ+7g7Z4M7fan0AeRQK75aYrDnJKQ6BwP+gnRWSKuHDAjhXPSZchqYe2n
   e3oNKdwAy1w46GmVk48etn6ZuO721yG0INaxDRHWfeR5Z4+TWz4xvzntG
   yYh17wQjyRM1r9qpV4q+dinMVUAFs7Qs9l/L89GL9rZNct1lg1dDB6RNp
   CcIs8iPmUxA74Dh61mn7tRmOi9kseSDOjUwAZdtpWTbAiGx5W1QRG2ZiP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5370659"
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="5370659"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 11:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="13139515"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Mar 2024 11:52:34 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlvcV-000GQR-20;
	Sun, 17 Mar 2024 18:52:31 +0000
Date: Mon, 18 Mar 2024 02:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 57ed9567e63b59350c21ae026635ae051e247abb
Message-ID: <202403180257.vF3SB00t-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 57ed9567e63b59350c21ae026635ae051e247abb  Merge branch 'next' into for-linus

elapsed time: 726m

configs tested: 177
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240317   gcc  
arc                   randconfig-002-20240317   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   clang
arm                                 defconfig   clang
arm                          moxart_defconfig   gcc  
arm                   randconfig-001-20240317   clang
arm                   randconfig-002-20240317   clang
arm                   randconfig-003-20240317   gcc  
arm                   randconfig-004-20240317   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240317   clang
arm64                 randconfig-002-20240317   gcc  
arm64                 randconfig-003-20240317   gcc  
arm64                 randconfig-004-20240317   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240317   gcc  
csky                  randconfig-002-20240317   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240317   clang
hexagon               randconfig-002-20240317   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240317   gcc  
i386         buildonly-randconfig-002-20240317   clang
i386         buildonly-randconfig-003-20240317   gcc  
i386         buildonly-randconfig-004-20240317   clang
i386         buildonly-randconfig-005-20240317   clang
i386         buildonly-randconfig-006-20240317   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240317   clang
i386                  randconfig-002-20240317   clang
i386                  randconfig-003-20240317   clang
i386                  randconfig-004-20240317   clang
i386                  randconfig-005-20240317   gcc  
i386                  randconfig-006-20240317   gcc  
i386                  randconfig-011-20240317   clang
i386                  randconfig-012-20240317   clang
i386                  randconfig-013-20240317   clang
i386                  randconfig-014-20240317   gcc  
i386                  randconfig-015-20240317   gcc  
i386                  randconfig-016-20240317   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240317   gcc  
loongarch             randconfig-002-20240317   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240317   gcc  
nios2                 randconfig-002-20240317   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240317   gcc  
parisc                randconfig-002-20240317   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20240317   clang
powerpc               randconfig-002-20240317   gcc  
powerpc               randconfig-003-20240317   clang
powerpc                  storcenter_defconfig   gcc  
powerpc64             randconfig-001-20240317   gcc  
powerpc64             randconfig-002-20240317   clang
powerpc64             randconfig-003-20240317   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240317   clang
riscv                 randconfig-002-20240317   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240317   clang
s390                  randconfig-002-20240317   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                    randconfig-001-20240317   gcc  
sh                    randconfig-002-20240317   gcc  
sh                           se7343_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240317   gcc  
sparc64               randconfig-002-20240317   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240317   gcc  
um                    randconfig-002-20240317   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240317   gcc  
x86_64       buildonly-randconfig-002-20240317   gcc  
x86_64       buildonly-randconfig-003-20240317   gcc  
x86_64       buildonly-randconfig-004-20240317   clang
x86_64       buildonly-randconfig-005-20240317   gcc  
x86_64       buildonly-randconfig-006-20240317   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240317   gcc  
x86_64                randconfig-002-20240317   gcc  
x86_64                randconfig-003-20240317   gcc  
x86_64                randconfig-004-20240317   gcc  
x86_64                randconfig-005-20240317   gcc  
x86_64                randconfig-006-20240317   clang
x86_64                randconfig-011-20240317   clang
x86_64                randconfig-012-20240317   gcc  
x86_64                randconfig-013-20240317   clang
x86_64                randconfig-014-20240317   clang
x86_64                randconfig-015-20240317   gcc  
x86_64                randconfig-016-20240317   clang
x86_64                randconfig-071-20240317   gcc  
x86_64                randconfig-072-20240317   clang
x86_64                randconfig-073-20240317   clang
x86_64                randconfig-074-20240317   gcc  
x86_64                randconfig-075-20240317   gcc  
x86_64                randconfig-076-20240317   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240317   gcc  
xtensa                randconfig-002-20240317   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

