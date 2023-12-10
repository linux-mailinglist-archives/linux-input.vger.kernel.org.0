Return-Path: <linux-input+bounces-655-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD3C80B848
	for <lists+linux-input@lfdr.de>; Sun, 10 Dec 2023 02:17:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4987C1C2085A
	for <lists+linux-input@lfdr.de>; Sun, 10 Dec 2023 01:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99B07EC;
	Sun, 10 Dec 2023 01:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qs9SAYVf"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8199D0
	for <linux-input@vger.kernel.org>; Sat,  9 Dec 2023 17:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702171034; x=1733707034;
  h=date:from:to:cc:subject:message-id;
  bh=GwjV8wJDR0sh57HiiMkL9hlvVHb0i9/QwAE8UHPRmxc=;
  b=Qs9SAYVfn1mlfHeNV5gPcRVHjyZJ00Yc5PZABpjvxid32ML/i3y/t3NC
   VGyOPTfRnAZ6UxVjPcZ6dzt4cLntGCu+/F3UycWE+jAWKCMvLiVUK98zW
   +HzmdRcUfY1AcKsAlrSmf5vTgax9DIF9SA5Vf54QQAoO1loBXzjxgm0WI
   2WbYETsqhetqYmYvCl5HzLyOoedYhpKxriYm95H+VApeN3nFsby21y2yR
   +7+HGs64gvs9rroCadiMuBHysJkNsU4YNvjoQ1fxzf5TDYZmHMb1ztrT2
   hj8Pp5eXbjb2QywGivYtweoHv8rM8Ye1C0DK9V7sFzaI2E7VktdrI5x82
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="384942233"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="384942233"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 17:17:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="772529900"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="772529900"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 09 Dec 2023 17:17:13 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rC8RT-000GDI-10;
	Sun, 10 Dec 2023 01:17:11 +0000
Date: Sun, 10 Dec 2023 09:16:26 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 59b6a747e2d39227ac2325c5e29d6ab3bb070c2a
Message-ID: <202312100923.kmt6fsPK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 59b6a747e2d39227ac2325c5e29d6ab3bb070c2a  Input: ipaq-micro-keys - add error handling for devm_kmemdup

elapsed time: 1520m

configs tested: 89
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20231210   gcc  
arc                   randconfig-002-20231210   gcc  
arm                               allnoconfig   gcc  
arm                     am200epdkit_defconfig   clang
arm                         assabet_defconfig   gcc  
arm                                 defconfig   clang
arm                   milbeaut_m10v_defconfig   clang
arm                   randconfig-001-20231210   gcc  
arm                   randconfig-002-20231210   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231209   gcc  
i386         buildonly-randconfig-002-20231209   gcc  
i386         buildonly-randconfig-003-20231209   gcc  
i386         buildonly-randconfig-004-20231209   gcc  
i386         buildonly-randconfig-005-20231209   gcc  
i386         buildonly-randconfig-006-20231209   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231209   gcc  
i386                  randconfig-002-20231209   gcc  
i386                  randconfig-003-20231209   gcc  
i386                  randconfig-004-20231209   gcc  
i386                  randconfig-005-20231209   gcc  
i386                  randconfig-006-20231209   gcc  
i386                  randconfig-011-20231209   clang
i386                  randconfig-012-20231209   clang
i386                  randconfig-013-20231209   clang
i386                  randconfig-014-20231209   clang
i386                  randconfig-015-20231209   clang
i386                  randconfig-016-20231209   clang
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                      pic32mzda_defconfig   clang
nios2                             allnoconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                       ppc64_defconfig   gcc  
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

