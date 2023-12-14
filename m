Return-Path: <linux-input+bounces-781-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7D0812659
	for <lists+linux-input@lfdr.de>; Thu, 14 Dec 2023 05:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D5921C2140B
	for <lists+linux-input@lfdr.de>; Thu, 14 Dec 2023 04:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9F41FB0;
	Thu, 14 Dec 2023 04:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LK9oMgkp"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E04F4
	for <linux-input@vger.kernel.org>; Wed, 13 Dec 2023 20:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702527783; x=1734063783;
  h=date:from:to:cc:subject:message-id;
  bh=27BwEfaccRMcIFe99X+JJNUunpvN/F7Br3TrjeKcaUo=;
  b=LK9oMgkpSuHSfSdfzv+VUxsplaBSyD3eiA45XBXKO/zJ3D2Cs3eaPpCb
   4quVCIdWPskTKWPvb2YQJpCvtqaYIbkoyVicNtwC1a/FfjGVv9ccwt8Lo
   cQ/q7JYzBvd+GVTC2fB6c6xIy3qB6N2IxuxXZ0nPXHCXLmSVxBQFRKq2B
   o+qQemforrTnxIVgudq9gXV+WncRY7J3H06aCMAJnHlYB34JRrpg9z3Cr
   cKEW9kRiTWe7JNTvcgFiyHkJhE78gJEvJEM4Ep+ols6H6NdTT6EjyeqPW
   BQfwuIed80MWrv/zDsyQOA7vpKUa4JhrViAxgy0SRp7xwyLZObC7GrKSS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="397851818"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="397851818"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 20:23:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="840135419"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="840135419"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 13 Dec 2023 20:23:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDdFQ-000LWV-1Y;
	Thu, 14 Dec 2023 04:22:56 +0000
Date: Thu, 14 Dec 2023 12:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 c3d1610345b79cbe29ef6ca04a4780eff0d360c7
Message-ID: <202312141208.euJEmUJX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: c3d1610345b79cbe29ef6ca04a4780eff0d360c7  Input: xpad - add Razer Wolverine V2 support

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- riscv-allmodconfig
|   |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:xrv64i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0-(section:.text.unlikely.event_trigger_unlock_commit)-event_trace_file-(secti
|   `-- WARNING:modpost:vmlinux:section-mismatch-in-reference:xrv64i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0-(section:.text.unlikely.set_bit)-numa_nodes_parsed-(section:.init.data)
`-- riscv-allyesconfig
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:xrv64i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0-(section:.text.unlikely.bitmap_copy)-bitmap-(section:.init.data)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:xrv64i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0-(section:.text.unlikely.bitmap_copy)-cp-(section:.init.data)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:xrv64i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0-(section:.text.unlikely.event_trigger_unlock_commit)-event_trace_file-(secti
    `-- WARNING:modpost:vmlinux:section-mismatch-in-reference:xrv64i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0-(section:.text.unlikely.set_bit)-numa_nodes_parsed-(section:.init.data)

elapsed time: 1479m

configs tested: 178
configs skipped: 2

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
arc                   randconfig-001-20231213   gcc  
arc                   randconfig-002-20231213   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          ep93xx_defconfig   clang
arm                   randconfig-001-20231213   clang
arm                   randconfig-002-20231213   clang
arm                   randconfig-003-20231213   clang
arm                   randconfig-004-20231213   clang
arm                        spear3xx_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231213   clang
arm64                 randconfig-002-20231213   clang
arm64                 randconfig-003-20231213   clang
arm64                 randconfig-004-20231213   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231213   gcc  
csky                  randconfig-002-20231213   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231213   clang
hexagon               randconfig-002-20231213   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231213   clang
i386         buildonly-randconfig-002-20231213   clang
i386         buildonly-randconfig-003-20231213   clang
i386         buildonly-randconfig-004-20231213   clang
i386         buildonly-randconfig-005-20231213   clang
i386         buildonly-randconfig-006-20231213   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231213   clang
i386                  randconfig-002-20231213   clang
i386                  randconfig-003-20231213   clang
i386                  randconfig-004-20231213   clang
i386                  randconfig-005-20231213   clang
i386                  randconfig-006-20231213   clang
i386                  randconfig-011-20231213   gcc  
i386                  randconfig-012-20231213   gcc  
i386                  randconfig-013-20231213   gcc  
i386                  randconfig-014-20231213   gcc  
i386                  randconfig-015-20231213   gcc  
i386                  randconfig-016-20231213   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231213   gcc  
loongarch             randconfig-002-20231213   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                        bcm63xx_defconfig   clang
mips                    maltaup_xpa_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231213   gcc  
nios2                 randconfig-002-20231213   gcc  
openrisc                         alldefconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231213   gcc  
parisc                randconfig-002-20231213   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     asp8347_defconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc               randconfig-001-20231213   clang
powerpc               randconfig-002-20231213   clang
powerpc               randconfig-003-20231213   clang
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20231213   clang
powerpc64             randconfig-002-20231213   clang
powerpc64             randconfig-003-20231213   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231213   clang
riscv                 randconfig-002-20231213   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231213   gcc  
s390                  randconfig-002-20231213   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                    randconfig-001-20231213   gcc  
sh                    randconfig-002-20231213   gcc  
sh                           se7780_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231213   gcc  
sparc64               randconfig-002-20231213   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231213   clang
um                    randconfig-002-20231213   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231214   gcc  
x86_64       buildonly-randconfig-002-20231214   gcc  
x86_64       buildonly-randconfig-003-20231214   gcc  
x86_64       buildonly-randconfig-004-20231214   gcc  
x86_64       buildonly-randconfig-005-20231214   gcc  
x86_64       buildonly-randconfig-006-20231214   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231214   clang
x86_64                randconfig-002-20231214   clang
x86_64                randconfig-003-20231214   clang
x86_64                randconfig-004-20231214   clang
x86_64                randconfig-005-20231214   clang
x86_64                randconfig-006-20231214   clang
x86_64                randconfig-011-20231214   gcc  
x86_64                randconfig-012-20231214   gcc  
x86_64                randconfig-013-20231214   gcc  
x86_64                randconfig-014-20231214   gcc  
x86_64                randconfig-015-20231214   gcc  
x86_64                randconfig-016-20231214   gcc  
x86_64                randconfig-071-20231214   gcc  
x86_64                randconfig-072-20231214   gcc  
x86_64                randconfig-073-20231214   gcc  
x86_64                randconfig-074-20231214   gcc  
x86_64                randconfig-075-20231214   gcc  
x86_64                randconfig-076-20231214   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20231213   gcc  
xtensa                randconfig-002-20231213   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

