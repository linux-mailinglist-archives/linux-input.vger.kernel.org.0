Return-Path: <linux-input+bounces-5852-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD9595E26E
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 09:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E84772826F0
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D82F52F62;
	Sun, 25 Aug 2024 07:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIh2FYjL"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B43255898
	for <linux-input@vger.kernel.org>; Sun, 25 Aug 2024 07:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724570913; cv=none; b=pev0K35wzERRa0WG9nZffoyjJaeLZuNUy1KYw7/EOkGch7Pk8bedyuWWWfQbdX269dH/eKq7QBYfPo90kHLyOCrup+pBLdplAY1LBpFl+fSJs8AwsYAKylUtQJ19YwZSZZec0dwQDT0ZEoOuTMgZgcQZ/oQENkdYlhhP2DrSsh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724570913; c=relaxed/simple;
	bh=ng7FudIcM7wVr3DhcBM5buVGGQ9eFgSJIDlm84y1j5Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P2s/bbwCePO7uejORsxXRoX6W/GEqiSeaawzDhLuf+d1BCHnjyCFdytAww7Z/ZbWRpkqWRsMScd2oNI8jFnbHL5fw869dbA1zl66E6rxNijBj2l3071v0Pni1KSsxnSE3huQ07Wv1ocEHdXSpFQ2hcpyaj0RSjNDuMPxwN27Y2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIh2FYjL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724570911; x=1756106911;
  h=date:from:to:cc:subject:message-id;
  bh=ng7FudIcM7wVr3DhcBM5buVGGQ9eFgSJIDlm84y1j5Y=;
  b=lIh2FYjL7uaaZC0J8iuzP/SmFO4pPpeDFp/ogBYmYWFKC6DJ3eHdDGK9
   iic5sJlNTrVIgJK/3CD211jTXCBQRy5pR0xIEMEZp89P7o1Y+V0IBhHt4
   mWbZlln6QIvr7v83pITs4GsuqpXmyIl6iQFn9t4K/wQ89MjYjfemADpQo
   mGAYqenLHMgJBabrrwLGpqrLPJ2fMw1R6XzTO2TCQCUSqpV83llH2OakG
   ZU9jvh3VgSyqnK5k3A8ceAeChQGlvCy/9TvqIYge2+ZVZ4A3NnfJrA3aU
   XrZye8yb15tsNBpX4z9YVEc1VEA3b8KlaQmBdkIX5s/g/hMuJu4nMemqa
   A==;
X-CSE-ConnectionGUID: Q8M8AVKQSt+Mjq6mt08nQQ==
X-CSE-MsgGUID: uQL+IHiYQFmAOasTF5bv6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="34165142"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="34165142"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 00:28:27 -0700
X-CSE-ConnectionGUID: No9Equ7hQoWuZKF3hO26vw==
X-CSE-MsgGUID: plRtqbOkRoGgMjZCj/m9uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="93008026"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Aug 2024 00:28:26 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1si7fj-000F1J-2I;
	Sun, 25 Aug 2024 07:28:23 +0000
Date: Sun, 25 Aug 2024 15:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 6994d8b84bfd71431bfccb5baf84a827086d48a5
Message-ID: <202408251523.w2I7jYw0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 6994d8b84bfd71431bfccb5baf84a827086d48a5  Input: evdev - limit amount of data for writes

elapsed time: 1444m

configs tested: 172
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240825   gcc-13.2.0
arc                   randconfig-002-20240825   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                         at91_dt_defconfig   clang-20
arm                       imx_v6_v7_defconfig   clang-20
arm                         mv78xx0_defconfig   clang-20
arm                        neponset_defconfig   gcc-14.1.0
arm                         nhk8815_defconfig   clang-20
arm                   randconfig-001-20240825   clang-20
arm                   randconfig-002-20240825   gcc-14.1.0
arm                   randconfig-003-20240825   gcc-14.1.0
arm                   randconfig-004-20240825   gcc-14.1.0
arm                             rpc_defconfig   clang-20
arm                           sunxi_defconfig   gcc-14.1.0
arm                         wpcm450_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240825   clang-20
arm64                 randconfig-002-20240825   gcc-14.1.0
arm64                 randconfig-003-20240825   clang-20
arm64                 randconfig-004-20240825   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240825   gcc-14.1.0
csky                  randconfig-002-20240825   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240825   clang-20
hexagon               randconfig-002-20240825   clang-20
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240824   clang-18
i386         buildonly-randconfig-002-20240824   clang-18
i386         buildonly-randconfig-003-20240824   clang-18
i386         buildonly-randconfig-004-20240824   clang-18
i386         buildonly-randconfig-005-20240824   gcc-12
i386         buildonly-randconfig-006-20240824   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240824   clang-18
i386                  randconfig-002-20240824   clang-18
i386                  randconfig-003-20240824   gcc-12
i386                  randconfig-004-20240824   gcc-11
i386                  randconfig-005-20240824   gcc-12
i386                  randconfig-006-20240824   clang-18
i386                  randconfig-011-20240824   clang-18
i386                  randconfig-012-20240824   gcc-12
i386                  randconfig-013-20240824   gcc-12
i386                  randconfig-014-20240824   gcc-12
i386                  randconfig-015-20240824   gcc-12
i386                  randconfig-016-20240824   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240825   gcc-14.1.0
loongarch             randconfig-002-20240825   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          amiga_defconfig   gcc-14.1.0
m68k                        mvme16x_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                          ath79_defconfig   gcc-14.1.0
mips                           ip27_defconfig   gcc-14.1.0
mips                           ip32_defconfig   clang-20
mips                    maltaup_xpa_defconfig   gcc-13.2.0
mips                          rb532_defconfig   clang-20
mips                   sb1250_swarm_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240825   gcc-14.1.0
nios2                 randconfig-002-20240825   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240825   gcc-14.1.0
parisc                randconfig-002-20240825   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                      ep88xc_defconfig   gcc-14.1.0
powerpc                 mpc8315_rdb_defconfig   clang-20
powerpc                      ppc44x_defconfig   clang-16
powerpc               randconfig-001-20240825   gcc-14.1.0
powerpc               randconfig-002-20240825   gcc-14.1.0
powerpc               randconfig-003-20240825   clang-20
powerpc64             randconfig-001-20240825   gcc-14.1.0
powerpc64             randconfig-002-20240825   gcc-14.1.0
powerpc64             randconfig-003-20240825   gcc-14.1.0
riscv                            alldefconfig   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                               defconfig   clang-20
riscv                    nommu_k210_defconfig   clang-20
riscv                 randconfig-001-20240825   gcc-14.1.0
riscv                 randconfig-002-20240825   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240825   clang-20
s390                  randconfig-002-20240825   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                        edosk7705_defconfig   gcc-14.1.0
sh                          lboxre2_defconfig   gcc-14.1.0
sh                            migor_defconfig   gcc-14.1.0
sh                    randconfig-001-20240825   gcc-14.1.0
sh                    randconfig-002-20240825   gcc-14.1.0
sh                          rsk7269_defconfig   gcc-14.1.0
sh                           se7780_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                          alldefconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240825   gcc-14.1.0
sparc64               randconfig-002-20240825   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240825   gcc-12
um                    randconfig-002-20240825   gcc-12
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240825   gcc-12
x86_64       buildonly-randconfig-002-20240825   gcc-12
x86_64       buildonly-randconfig-003-20240825   gcc-12
x86_64       buildonly-randconfig-004-20240825   clang-18
x86_64       buildonly-randconfig-005-20240825   clang-18
x86_64       buildonly-randconfig-006-20240825   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240825   clang-18
x86_64                randconfig-002-20240825   gcc-12
x86_64                randconfig-003-20240825   clang-18
x86_64                randconfig-004-20240825   clang-18
x86_64                randconfig-005-20240825   clang-18
x86_64                randconfig-006-20240825   gcc-12
x86_64                randconfig-011-20240825   gcc-12
x86_64                randconfig-012-20240825   gcc-12
x86_64                randconfig-013-20240825   clang-18
x86_64                randconfig-014-20240825   gcc-12
x86_64                randconfig-015-20240825   clang-18
x86_64                randconfig-016-20240825   clang-18
x86_64                randconfig-071-20240825   clang-18
x86_64                randconfig-072-20240825   clang-18
x86_64                randconfig-073-20240825   gcc-12
x86_64                randconfig-074-20240825   clang-18
x86_64                randconfig-075-20240825   gcc-12
x86_64                randconfig-076-20240825   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                  audio_kc705_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240825   gcc-14.1.0
xtensa                randconfig-002-20240825   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

