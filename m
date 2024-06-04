Return-Path: <linux-input+bounces-4056-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B378FA830
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 04:08:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 468A41C219C8
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 02:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D7212D758;
	Tue,  4 Jun 2024 02:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Twr4zLlp"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B693213D2BF
	for <linux-input@vger.kernel.org>; Tue,  4 Jun 2024 02:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717466844; cv=none; b=TqWXNWHo37DXqu1iTJmNT2KVGsq0hzES09RBjf9QEL36nID7BKJ7e428m/s2DGWiN0OII8CHeRl48urRHamqjI5LbwYk5NGq2APHtgm5/pE+lo4GciQt0NQsVS6YOdK+Isur2GZcaaI+qlatrCQNXyfLoOJaR2srfcJxodugOIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717466844; c=relaxed/simple;
	bh=bXnyAamH6LsAmVleZuOkK5UZX8J6HOQkzSQzhJ3WUuA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lzQs/R/JBeKSEITN3QWbo6CmfHgpxBYYuUE6OLQiISpt8fzy7tQLWxP/MvxX0QQu1UeaUHalCF/pARHBLzXGE6Bap9hSzIA80Zhs59UC1EXP0BvWmxDKSXsKQNWT1GgKAnbzfIZ42FZ53LioK5SKKPu3nwp+5imoBA4XmnMNM+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Twr4zLlp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717466843; x=1749002843;
  h=date:from:to:cc:subject:message-id;
  bh=bXnyAamH6LsAmVleZuOkK5UZX8J6HOQkzSQzhJ3WUuA=;
  b=Twr4zLlpKGCV1+TZUAr192Hik1aSMn8ahfEeaxFdzwu+KQm2NFKObWtb
   uUoySkmlreihpGy/zzKjSf1jjRDRMUMhEiUWmoF37W2p2KtdAz1iUiJV5
   MUJSIbFMPAil+6KUo7cZDIiUW9MmAfAMEeKF+qVUS2xrlO/MkC+k2Tmfb
   YtT2ejHiB24aBKOt1ZdJg1gL4lVyvBPPj58I47c1RxpyY2s4Rtz0ryUso
   +c/iQWdHsu4PtLA3aBw7d4a+5jzBbvJvWMIM+cotbrOJNDhfNwLBXbc1C
   5THtb6iCUYcgMSqeNN9/Esokew+M2OjdoVqA1lUwhbA4mn1i/lJe08fpi
   w==;
X-CSE-ConnectionGUID: vf/5wPdCQ2GVRyPBPMYGRw==
X-CSE-MsgGUID: 6s5pkOUkRQSWF7KAr3Sbtw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="11885016"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="11885016"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 19:07:13 -0700
X-CSE-ConnectionGUID: BEFcsoTcR0mSRvnp/k/xTA==
X-CSE-MsgGUID: +zE2Ptn5RFyW9P1+f+RdJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="41618581"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jun 2024 19:07:11 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEJZt-000MRD-26;
	Tue, 04 Jun 2024 02:07:09 +0000
Date: Tue, 04 Jun 2024 10:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 955af6355ddfe35140f9706a635838212a32513b
Message-ID: <202406041043.MK01nPxL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 955af6355ddfe35140f9706a635838212a32513b  Input: i8042 - add Ayaneo Kun to i8042 quirk table

elapsed time: 1280m

configs tested: 194
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
arc                   randconfig-001-20240603   gcc  
arc                   randconfig-002-20240603   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            dove_defconfig   gcc  
arm                   milbeaut_m10v_defconfig   clang
arm                   randconfig-001-20240603   gcc  
arm                   randconfig-002-20240603   gcc  
arm                   randconfig-003-20240603   gcc  
arm                   randconfig-004-20240603   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240603   gcc  
arm64                 randconfig-002-20240603   gcc  
arm64                 randconfig-003-20240603   clang
arm64                 randconfig-004-20240603   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240603   gcc  
csky                  randconfig-002-20240603   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240603   clang
hexagon               randconfig-002-20240603   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240603   clang
i386         buildonly-randconfig-002-20240603   clang
i386         buildonly-randconfig-003-20240603   gcc  
i386         buildonly-randconfig-004-20240603   gcc  
i386         buildonly-randconfig-005-20240603   gcc  
i386         buildonly-randconfig-006-20240603   clang
i386                                defconfig   clang
i386                  randconfig-001-20240603   clang
i386                  randconfig-002-20240603   gcc  
i386                  randconfig-003-20240603   gcc  
i386                  randconfig-004-20240603   clang
i386                  randconfig-005-20240603   clang
i386                  randconfig-006-20240603   gcc  
i386                  randconfig-011-20240603   clang
i386                  randconfig-012-20240603   clang
i386                  randconfig-013-20240603   clang
i386                  randconfig-014-20240603   clang
i386                  randconfig-015-20240603   clang
i386                  randconfig-016-20240603   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240603   gcc  
loongarch             randconfig-002-20240603   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                          malta_defconfig   gcc  
mips                        omega2p_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240603   gcc  
nios2                 randconfig-002-20240603   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240603   gcc  
parisc                randconfig-002-20240603   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 canyonlands_defconfig   clang
powerpc                      obs600_defconfig   clang
powerpc                     powernv_defconfig   gcc  
powerpc               randconfig-001-20240603   gcc  
powerpc               randconfig-002-20240603   gcc  
powerpc               randconfig-003-20240603   gcc  
powerpc64             randconfig-001-20240603   gcc  
powerpc64             randconfig-002-20240603   gcc  
powerpc64             randconfig-003-20240603   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240603   clang
riscv                 randconfig-002-20240603   clang
riscv                          rv32_defconfig   clang
s390                             alldefconfig   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240603   clang
s390                  randconfig-002-20240603   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                    randconfig-001-20240603   gcc  
sh                    randconfig-002-20240603   gcc  
sh                          rsk7201_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240603   gcc  
sparc64               randconfig-002-20240603   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240603   clang
um                    randconfig-002-20240603   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240603   gcc  
x86_64       buildonly-randconfig-001-20240604   clang
x86_64       buildonly-randconfig-002-20240603   gcc  
x86_64       buildonly-randconfig-002-20240604   clang
x86_64       buildonly-randconfig-003-20240603   gcc  
x86_64       buildonly-randconfig-004-20240603   clang
x86_64       buildonly-randconfig-004-20240604   clang
x86_64       buildonly-randconfig-005-20240603   clang
x86_64       buildonly-randconfig-006-20240603   gcc  
x86_64       buildonly-randconfig-006-20240604   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240603   gcc  
x86_64                randconfig-001-20240604   clang
x86_64                randconfig-002-20240603   clang
x86_64                randconfig-003-20240603   clang
x86_64                randconfig-004-20240603   gcc  
x86_64                randconfig-005-20240603   gcc  
x86_64                randconfig-006-20240603   gcc  
x86_64                randconfig-011-20240603   gcc  
x86_64                randconfig-011-20240604   clang
x86_64                randconfig-012-20240603   gcc  
x86_64                randconfig-012-20240604   clang
x86_64                randconfig-013-20240603   clang
x86_64                randconfig-013-20240604   clang
x86_64                randconfig-014-20240603   gcc  
x86_64                randconfig-014-20240604   clang
x86_64                randconfig-015-20240603   gcc  
x86_64                randconfig-015-20240604   clang
x86_64                randconfig-016-20240603   clang
x86_64                randconfig-016-20240604   clang
x86_64                randconfig-071-20240603   clang
x86_64                randconfig-071-20240604   clang
x86_64                randconfig-072-20240603   clang
x86_64                randconfig-073-20240603   clang
x86_64                randconfig-074-20240603   clang
x86_64                randconfig-074-20240604   clang
x86_64                randconfig-075-20240603   gcc  
x86_64                randconfig-075-20240604   clang
x86_64                randconfig-076-20240603   gcc  
x86_64                randconfig-076-20240604   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                randconfig-001-20240603   gcc  
xtensa                randconfig-002-20240603   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

