Return-Path: <linux-input+bounces-4242-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A50900ED3
	for <lists+linux-input@lfdr.de>; Sat,  8 Jun 2024 02:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C00C5281471
	for <lists+linux-input@lfdr.de>; Sat,  8 Jun 2024 00:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1438EEC2;
	Sat,  8 Jun 2024 00:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BeJDMOVE"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD7B7F
	for <linux-input@vger.kernel.org>; Sat,  8 Jun 2024 00:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717805937; cv=none; b=RCh0nmuJRVeOij7+t3UyLnRuBjqOr9fqxjpYZjkxQ1QyWUMmsE2urxq53dpxH0V+7t5yBjy+QFc4sicgipZdXgsh4Cujgtp3BO/hrWJTwGGO3Zy/rBSdn4RouKlV+A1gNXKVawjQFmTYzwYnyJLnpy6cCLrfeVsME78V+L4+GJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717805937; c=relaxed/simple;
	bh=0AyF4HqGQUZJBvidnZ8f5KVI3Cy2aaumqsWBUA662R0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KU4J0Dg2OKrvduYtFtx+vIc/u80wdM2VpvnUrjBp/3i1dlNh0rEFlEKpwkGxuvTOThudXDtbnB8DfcaCCpp+lXa+q1MkaEtHlfvYSxSisXfWDW28bGCXy4XKYJuWTzeZFX09VoBpNoumLiTkSospigyFH1Z6dDWUl7mCV8AfVcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BeJDMOVE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717805935; x=1749341935;
  h=date:from:to:cc:subject:message-id;
  bh=0AyF4HqGQUZJBvidnZ8f5KVI3Cy2aaumqsWBUA662R0=;
  b=BeJDMOVESMMDderFk/panxE5CyyX1OsJmg/ykFpqGr5bYLhp5Z+Bbyb4
   9/S5Uo4p9b1tCDq33oPHFGukV6mewj9x32XX1jApCpiIlUN905o9ng/Z8
   br8S47dmQ5KOHgEwMIC4+C7z5yqvDLF1PEZs8cCwN+CDJ36NnAui0+Pi7
   HzMJ1FPcDLzvhp20zs7mUaRzf20mnvLuyNqpwIYnArTnbGUCBtTw12699
   P2HsvoX711v2yp5hocyL77tYEvXzD2siG9bFwsH8KcSeQXvW3NXnr2Ugq
   p0lEpOmTStnllT2iyP9ajcltOoH2ffCfVePEvBfWzN8AOnuQsVqIzx+pn
   Q==;
X-CSE-ConnectionGUID: 0VfMbHtTT1+qZ5udhE5MSQ==
X-CSE-MsgGUID: 3Adbbpn9RxyMSJmD4c1O2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14349453"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="14349453"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 17:18:54 -0700
X-CSE-ConnectionGUID: AV5g5nbpQDakEdWASanmWA==
X-CSE-MsgGUID: UkIqfsWISXyL9UiOLma+3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="38581835"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Jun 2024 17:18:53 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFjnH-0000kC-1o;
	Sat, 08 Jun 2024 00:18:51 +0000
Date: Sat, 08 Jun 2024 08:18:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:ib/6.9-disable-irq-guard] BUILD SUCCESS
 c76494768761aef7630e7e0db820ba7b375964da
Message-ID: <202406080833.ZXzaKxTv-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git ib/6.9-disable-irq-guard
branch HEAD: c76494768761aef7630e7e0db820ba7b375964da  linux/interrupt.h: allow "guard" notation to disable and reenable IRQ

elapsed time: 1513m

configs tested: 61
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240608   gcc  
arc                   randconfig-002-20240608   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm                   randconfig-001-20240608   gcc  
arm                   randconfig-002-20240608   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386                                defconfig   clang
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                                defconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
s390                              allnoconfig   clang
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

