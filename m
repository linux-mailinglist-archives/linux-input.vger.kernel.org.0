Return-Path: <linux-input+bounces-7558-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8DC9A512E
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 00:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A63C283FCB
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2024 22:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD3E13C816;
	Sat, 19 Oct 2024 22:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fNL9w7vt"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DFE190685
	for <linux-input@vger.kernel.org>; Sat, 19 Oct 2024 22:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729375566; cv=none; b=PdKFxtNXQ/Uf4iNNSjejojj1nEliX4MmI9OzeNxdO+hA7mBiLCb0a297RBNSTCiaVSessAG3R0F4sNef6M225uyvxwuwsJBhk6zUz4chPeBrhEanNehk1dEm6y/qxMjOSxj+SuGlV8TJA3JP49bVlx/xsqa2vdq1qvEYbgkI4Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729375566; c=relaxed/simple;
	bh=zZwZkg/cp2iwoRHZBnlEWuWywpYAjDNAMYan51lRASQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sN0vj+0fB3m5Wh7kKAizo/zTXdU1x9v6PVl9crwmSUb5ZER+AEpmn8XPdtwR48ao5wZqvkrtfnrU/fFg4qPcwkbUXR00ji87z4xeN79i78OBMadDNK/lb4+N1OJsOChSipwtbXh+jo3yNb7IAJnEnk4yzoQ0Nw7WjyWPPwKFkGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fNL9w7vt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729375564; x=1760911564;
  h=date:from:to:cc:subject:message-id;
  bh=zZwZkg/cp2iwoRHZBnlEWuWywpYAjDNAMYan51lRASQ=;
  b=fNL9w7vtUPjPur8KaMD0Gzl/K+Ekx9eXzN+JCo5pDjI9upOVpDuVxQ+c
   7gYHgwZyn7Cfp/oo9FBaH4uPScAYXtfCjz3qDVsS+du0LxARWpB6yMPrj
   odXvpKNVUbdYx3e5ruChh+LQmU5aHB8Mto6rw7ih8/IxgNgDU92jBjpQY
   yu9tbLhAHiwNYilrOBWO0QdW5IzGN6VUCfiZkO8JDXSZqh7O/r6d1IW9p
   8IPoJZgfDzifgqHjzhaJxheTuRwWZ+KZnuTf0jzwurC/Rjfeqv7u+w227
   voeCd0BIHTrKx0e9NfWSFvK9W3sYLrQ5zg00pyr2HsPJVFCa3hSAYR1HE
   A==;
X-CSE-ConnectionGUID: 9LNc8zftTKm40YtEyXDpiQ==
X-CSE-MsgGUID: WMWyT2MkTd+C1VYsdL+7fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="40281480"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="40281480"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 15:06:04 -0700
X-CSE-ConnectionGUID: F388tskoQM2j37r78X+LyQ==
X-CSE-MsgGUID: Szg77i1TTNO0shTCIeHeDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="79579774"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Oct 2024 15:06:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2HaC-000Paj-1D;
	Sat, 19 Oct 2024 22:06:00 +0000
Date: Sun, 20 Oct 2024 06:05:02 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD REGRESSION
 2c19d0159944f3aef1c0ebbd9d7fc6c2523e4307
Message-ID: <202410200653.2J3VXv80-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 2c19d0159944f3aef1c0ebbd9d7fc6c2523e4307  Input: switch back to struct platform_driver::remove()

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202410192242.GL0CoAbv-lkp@intel.com

    drivers/input/serio/gscps2.c:201:23: warning: unused variable 'flags' [-Wunused-variable]
    drivers/input/serio/gscps2.c:221:50: error: 'struct <anonymous>' has no member named 'ste'; did you mean 'str'?

Error/Warning ids grouped by kconfigs:

recent_errors
|-- parisc-allmodconfig
|   |-- drivers-input-serio-gscps2.c:error:struct-anonymous-has-no-member-named-ste
|   `-- drivers-input-serio-gscps2.c:warning:unused-variable-flags
|-- parisc-allyesconfig
|   |-- drivers-input-serio-gscps2.c:error:struct-anonymous-has-no-member-named-ste
|   `-- drivers-input-serio-gscps2.c:warning:unused-variable-flags
|-- parisc-defconfig
|   |-- drivers-input-serio-gscps2.c:error:struct-anonymous-has-no-member-named-ste
|   `-- drivers-input-serio-gscps2.c:warning:unused-variable-flags
|-- parisc-generic-32bit_defconfig
|   |-- drivers-input-serio-gscps2.c:error:struct-anonymous-has-no-member-named-ste
|   `-- drivers-input-serio-gscps2.c:warning:unused-variable-flags
|-- parisc-randconfig-001-20241019
|   |-- drivers-input-serio-gscps2.c:error:struct-anonymous-has-no-member-named-ste
|   `-- drivers-input-serio-gscps2.c:warning:unused-variable-flags
|-- parisc-randconfig-002-20241019
|   |-- drivers-input-serio-gscps2.c:error:struct-anonymous-has-no-member-named-ste
|   `-- drivers-input-serio-gscps2.c:warning:unused-variable-flags
|-- parisc-randconfig-r054-20241019
|   |-- drivers-input-serio-gscps2.c:error:struct-anonymous-has-no-member-named-ste
|   `-- drivers-input-serio-gscps2.c:warning:unused-variable-flags
|-- parisc-randconfig-r112-20241019
|   |-- drivers-input-serio-gscps2.c:error:struct-anonymous-has-no-member-named-ste
|   `-- drivers-input-serio-gscps2.c:warning:unused-variable-flags
`-- parisc64-defconfig
    |-- drivers-input-serio-gscps2.c:error:struct-anonymous-has-no-member-named-ste
    `-- drivers-input-serio-gscps2.c:warning:unused-variable-flags

elapsed time: 1484m

configs tested: 139
configs skipped: 5

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241019    clang-16
arc                   randconfig-002-20241019    clang-16
arc                        vdk_hs38_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                         nhk8815_defconfig    clang-20
arm                       omap2plus_defconfig    clang-20
arm                   randconfig-001-20241019    clang-16
arm                   randconfig-002-20241019    clang-16
arm                   randconfig-003-20241019    clang-16
arm                   randconfig-004-20241019    clang-16
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241019    clang-16
arm64                 randconfig-002-20241019    clang-16
arm64                 randconfig-003-20241019    clang-16
arm64                 randconfig-004-20241019    clang-16
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241019    clang-16
csky                  randconfig-002-20241019    clang-16
hexagon                          alldefconfig    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241019    clang-16
hexagon               randconfig-002-20241019    clang-16
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241019    clang-18
i386        buildonly-randconfig-002-20241019    clang-18
i386        buildonly-randconfig-003-20241019    clang-18
i386        buildonly-randconfig-004-20241019    clang-18
i386        buildonly-randconfig-005-20241019    clang-18
i386        buildonly-randconfig-006-20241019    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241019    clang-18
i386                  randconfig-002-20241019    clang-18
i386                  randconfig-003-20241019    clang-18
i386                  randconfig-004-20241019    clang-18
i386                  randconfig-005-20241019    clang-18
i386                  randconfig-006-20241019    clang-18
i386                  randconfig-011-20241019    clang-18
i386                  randconfig-012-20241019    clang-18
i386                  randconfig-013-20241019    clang-18
i386                  randconfig-014-20241019    clang-18
i386                  randconfig-015-20241019    clang-18
i386                  randconfig-016-20241019    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241019    clang-16
loongarch             randconfig-002-20241019    clang-16
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        m5307c3_defconfig    clang-20
m68k                          sun3x_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          eyeq5_defconfig    clang-20
mips                         rt305x_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241019    clang-16
nios2                 randconfig-002-20241019    clang-16
openrisc                          allnoconfig    clang-20
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-20
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    clang-20
parisc                randconfig-001-20241019    clang-16
parisc                randconfig-002-20241019    clang-16
parisc64                            defconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                   currituck_defconfig    clang-20
powerpc                       holly_defconfig    clang-20
powerpc                    mvme5100_defconfig    clang-20
powerpc               randconfig-001-20241019    clang-16
powerpc               randconfig-002-20241019    clang-16
powerpc               randconfig-003-20241019    clang-16
powerpc                     tqm8541_defconfig    clang-20
powerpc64             randconfig-001-20241019    clang-16
powerpc64             randconfig-002-20241019    clang-16
powerpc64             randconfig-003-20241019    clang-16
riscv                             allnoconfig    clang-20
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241019    clang-16
riscv                 randconfig-002-20241019    clang-16
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241019    clang-16
s390                  randconfig-002-20241019    clang-16
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20241019    clang-16
sh                    randconfig-002-20241019    clang-16
sh                      rts7751r2d1_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241019    clang-16
sparc64               randconfig-002-20241019    clang-16
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241019    clang-16
um                    randconfig-002-20241019    clang-16
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  cadence_csp_defconfig    clang-20
xtensa                randconfig-001-20241019    clang-16
xtensa                randconfig-002-20241019    clang-16

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

