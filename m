Return-Path: <linux-input+bounces-10716-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A968EA5CF0B
	for <lists+linux-input@lfdr.de>; Tue, 11 Mar 2025 20:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 577353B9436
	for <lists+linux-input@lfdr.de>; Tue, 11 Mar 2025 19:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428AE264610;
	Tue, 11 Mar 2025 19:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CpCwvxN3"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19243263F4E
	for <linux-input@vger.kernel.org>; Tue, 11 Mar 2025 19:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741720254; cv=none; b=FZcjAy9JSYPxzkB5WMtCp/pD8OC6wTffhJC1YLOQ//CYJLUwMulttCl+4T567NPdh1iQomSZENg/aLMejajVFOB+BxbKay5KzCTBkRxEW1WF9zOYjsdGRNzlWysrCgfJqbdHVbRi3hoz4WW0mWCJe5GDHtw1uVcQymEFGf0QIcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741720254; c=relaxed/simple;
	bh=RI+Z6QmA/BhlsYmNgno12v2M4hHIZuM7Y5VBTVnNVG4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HTD1n76QztavJp6h7aAhH0uPARJNhIOI2hODzF7RQgmcCAXGpjPNsPx5Khcmc2uCFN7VOcR8QGF0dQ5NOAkOq4cGrMWagjvzyXl77wBzIF4fvHiihOYNWO3QGIWw4LuKJ2c7OldXbVviUfbHmUDNfG7/bXqelqpnweQ4d7gQ85o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CpCwvxN3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741720252; x=1773256252;
  h=date:from:to:cc:subject:message-id;
  bh=RI+Z6QmA/BhlsYmNgno12v2M4hHIZuM7Y5VBTVnNVG4=;
  b=CpCwvxN3u9A2An28YdZ/E9hDyVWltMaHXoXxHaNTVlVwU0Gcmd8EVC/e
   Se2n9bKMMk3zlgTP0h0s7EOtf1fSRPnfVGLJ2RKzqLPSrVJNtjP4k10jI
   A6gsByS2Ir8YvzK3b0rMDaiLGUSC6F/yOxERv7QLKK9DAeEnVjM20wXc3
   Yfp+RC2TMu4n3UQaL9lnfAbw9KwdWtth3OiWScpHOeBZV0pesAq04z5/x
   31AzF4BEfyaCBmxUy6mut8p6L6lOjCEnNsq1re70QKjhevDNbURQd9C5o
   ThjYqfy3VEiaDvNh+l/Nu3JW/WL0kBFuVcAbvEfBN/4NeRShTvkvzQOnu
   g==;
X-CSE-ConnectionGUID: yeI2wEZJSsOlvrR0L1UZqA==
X-CSE-MsgGUID: G0Z2urExT6CU+OBv0A7lPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42630802"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="42630802"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 12:10:49 -0700
X-CSE-ConnectionGUID: k07/C3G1TkKqqVvUNB8p4g==
X-CSE-MsgGUID: 5fJWZN6QRTWolAwQv73zCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="120641846"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 11 Mar 2025 12:10:47 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ts501-0007km-0g;
	Tue, 11 Mar 2025 19:10:45 +0000
Date: Wed, 12 Mar 2025 03:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS
 4d395cb071a343196ca524d3694790f06978fe91
Message-ID: <202503120328.CKPau7dt-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 4d395cb071a343196ca524d3694790f06978fe91  Input: goodix_berlin - add support for Berlin-A series

elapsed time: 1444m

configs tested: 114
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250311    gcc-13.2.0
arc                   randconfig-002-20250311    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250311    gcc-14.2.0
arm                   randconfig-002-20250311    clang-16
arm                   randconfig-003-20250311    gcc-14.2.0
arm                   randconfig-004-20250311    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250311    gcc-14.2.0
arm64                 randconfig-002-20250311    gcc-14.2.0
arm64                 randconfig-003-20250311    gcc-14.2.0
arm64                 randconfig-004-20250311    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250311    gcc-14.2.0
csky                  randconfig-002-20250311    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250311    clang-21
hexagon               randconfig-002-20250311    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250311    gcc-12
i386        buildonly-randconfig-001-20250312    gcc-12
i386        buildonly-randconfig-002-20250311    clang-19
i386        buildonly-randconfig-002-20250312    gcc-12
i386        buildonly-randconfig-003-20250311    clang-19
i386        buildonly-randconfig-003-20250312    gcc-12
i386        buildonly-randconfig-004-20250311    clang-19
i386        buildonly-randconfig-004-20250312    gcc-12
i386        buildonly-randconfig-005-20250311    clang-19
i386        buildonly-randconfig-005-20250312    gcc-12
i386        buildonly-randconfig-006-20250311    gcc-11
i386        buildonly-randconfig-006-20250312    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-011-20250312    gcc-11
i386                  randconfig-012-20250312    gcc-11
i386                  randconfig-013-20250312    gcc-11
i386                  randconfig-014-20250312    gcc-11
i386                  randconfig-015-20250312    gcc-11
i386                  randconfig-016-20250312    gcc-11
i386                  randconfig-017-20250312    gcc-11
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250311    gcc-14.2.0
loongarch             randconfig-002-20250311    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250311    gcc-14.2.0
nios2                 randconfig-002-20250311    gcc-14.2.0
openrisc                          allnoconfig    clang-15
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    clang-15
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250311    gcc-14.2.0
parisc                randconfig-002-20250311    gcc-14.2.0
powerpc                           allnoconfig    clang-15
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250311    clang-21
powerpc               randconfig-002-20250311    clang-16
powerpc               randconfig-003-20250311    gcc-14.2.0
powerpc64             randconfig-001-20250311    gcc-14.2.0
powerpc64             randconfig-002-20250311    clang-18
powerpc64             randconfig-003-20250311    gcc-14.2.0
riscv                             allnoconfig    clang-15
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250311    gcc-14.2.0
riscv                 randconfig-002-20250311    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250311    clang-15
s390                  randconfig-002-20250311    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250311    gcc-14.2.0
sh                    randconfig-002-20250311    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250311    gcc-14.2.0
sparc                 randconfig-002-20250311    gcc-14.2.0
sparc64               randconfig-001-20250311    gcc-14.2.0
sparc64               randconfig-002-20250311    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-15
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250311    gcc-12
um                    randconfig-002-20250311    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250311    gcc-12
x86_64      buildonly-randconfig-002-20250311    gcc-12
x86_64      buildonly-randconfig-003-20250311    clang-19
x86_64      buildonly-randconfig-004-20250311    clang-19
x86_64      buildonly-randconfig-005-20250311    gcc-12
x86_64      buildonly-randconfig-006-20250311    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250311    gcc-14.2.0
xtensa                randconfig-002-20250311    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

