Return-Path: <linux-input+bounces-7571-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E6B9A5555
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 19:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C2BE1C20941
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 17:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00B1194137;
	Sun, 20 Oct 2024 17:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIwgJZjW"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CECEAF6
	for <linux-input@vger.kernel.org>; Sun, 20 Oct 2024 17:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729445279; cv=none; b=MrL9Lq3bQgcgoBetrbc3cB0BtvY1JCZ3fd7ZutTqt+qyNqEYpH2qtG1zBmBxyHR/S+h7lgo6F6RTVHTrOtFXEtX8Xdj/liofrXNZrlP3BuOXtuj32VlMrpVP1yv+lMVFYwh2140wFYiQqYSvQ+gqZuktRenMSq1kX6ys9Jr4Pns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729445279; c=relaxed/simple;
	bh=e6FykECXXlskvtlMdJeofqvxkWbiYBkXHxiRwy/dz3I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IfboGSW3pqjykLigsmSA0I8/0Bm74aiY/vJcUpnkILrgkQRMlqcCMkz+vGWKUMlXttDYOhSSCSn4Xml1J2aQptJdUeStGha7hgW9IsSb+A8lkaMs6/zDi35+mDAnl7Y5fT55Fl/tgLkqDsHpnMqODspbLwjGHpRklPyoThPUWA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIwgJZjW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729445277; x=1760981277;
  h=date:from:to:cc:subject:message-id;
  bh=e6FykECXXlskvtlMdJeofqvxkWbiYBkXHxiRwy/dz3I=;
  b=jIwgJZjWVXPCZIzrmYII37Asx2Urjz/Fq6xOSI4b5DP6QlEYmyeNmXK3
   uMfdHUreTg9ijCTPiMSt/rVDf68eumBZqBhGi1pTlFus6+PWgDAAa7S27
   pUrrRSBoiSNjBfWbFnLpTdI4zYSJjmnCNejV6a6/yWgpc5HYup5exIxl1
   CMMJCFUy6Sc9mIJg6prko6ps2O8dIXc9wKXByiBkEOUp+KYSDS+MKY0sc
   Iyn2f4j65E9n2T5qH5s2VB4LalZg5XSvZAqf4jYpmtzlNyuzwIISWwnxt
   rljs/sQznmK0BMCgzHYLPkWBgc6x+aZQQren5HV4x5AJkm7AoB+ipgLJ9
   A==;
X-CSE-ConnectionGUID: P/P3v17xSv2dqXARPXUmEw==
X-CSE-MsgGUID: 9RQcGbsIQqO5AF7VXPYe1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40050082"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40050082"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 10:27:57 -0700
X-CSE-ConnectionGUID: NT7L72YLRP+16Agv+noTqg==
X-CSE-MsgGUID: 97HsEpwpTbmV4+epi9THtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="102629950"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Oct 2024 10:27:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2Zib-000QXB-1f;
	Sun, 20 Oct 2024 17:27:53 +0000
Date: Mon, 21 Oct 2024 01:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS WITH WARNING
 00850d7b542aa4a8240cf977d43dc6d2158e48d7
Message-ID: <202410210130.mJLALjXu-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: 00850d7b542aa4a8240cf977d43dc6d2158e48d7  Input: ts4800-ts - use cleanup facility for device_node

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202410201730.ItNhUTIv-lkp@intel.com
    https://lore.kernel.org/oe-kbuild/202410201759.qnyACw46-lkp@intel.com

    drivers/input/serio/serio_raw.c:204:12: warning: variable 'written' is uninitialized when used here [-Wuninitialized]

Unverified Warning (likely false positive, kindly check if interested):

    drivers/input/serio/serio_raw.c:204 serio_raw_write() error: uninitialized symbol 'written'.

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-randconfig-r072-20241020
|   `-- drivers-input-serio-serio_raw.c-serio_raw_write()-error:uninitialized-symbol-written-.
|-- arm64-allmodconfig
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- arm64-randconfig-001-20241020
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- hexagon-allmodconfig
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- hexagon-allyesconfig
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- hexagon-randconfig-r061-20241020
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- i386-buildonly-randconfig-002-20241019
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- i386-buildonly-randconfig-002-20241020
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- i386-buildonly-randconfig-004-20241020
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- i386-randconfig-002-20241020
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- i386-randconfig-012-20241020
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- i386-randconfig-141-20241020
|   `-- drivers-input-serio-serio_raw.c-serio_raw_write()-error:uninitialized-symbol-written-.
|-- powerpc-allyesconfig
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- riscv-allmodconfig
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- riscv-allyesconfig
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- s390-allmodconfig
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- sparc64-randconfig-r073-20241020
|   `-- drivers-input-serio-serio_raw.c-serio_raw_write()-error:uninitialized-symbol-written-.
|-- um-allmodconfig
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- x86_64-allyesconfig
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- x86_64-buildonly-randconfig-001-20241020
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- x86_64-buildonly-randconfig-001-20241021
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- x86_64-buildonly-randconfig-002-20241021
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- x86_64-buildonly-randconfig-004-20241020
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- x86_64-buildonly-randconfig-005-20241020
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- x86_64-buildonly-randconfig-006-20241020
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- x86_64-randconfig-001-20241020
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- x86_64-randconfig-101-20241020
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- x86_64-randconfig-102-20241020
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- x86_64-randconfig-103-20241020
|   `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here
|-- x86_64-randconfig-161-20241020
|   `-- drivers-input-serio-serio_raw.c-serio_raw_write()-error:uninitialized-symbol-written-.
`-- x86_64-rhel-8.3-rust
    `-- drivers-input-serio-serio_raw.c:warning:variable-written-is-uninitialized-when-used-here

elapsed time: 746m

configs tested: 112
configs skipped: 3

tested configs:
alpha                            alldefconfig    clang-20
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                        nsimosci_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          moxart_defconfig    clang-20
arm                        neponset_defconfig    clang-20
arm                         nhk8815_defconfig    clang-20
arm                        spear6xx_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241020    gcc-12
i386        buildonly-randconfig-002-20241020    gcc-12
i386        buildonly-randconfig-003-20241020    gcc-12
i386        buildonly-randconfig-004-20241020    gcc-12
i386        buildonly-randconfig-005-20241020    gcc-12
i386        buildonly-randconfig-006-20241020    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241020    gcc-12
i386                  randconfig-002-20241020    gcc-12
i386                  randconfig-003-20241020    gcc-12
i386                  randconfig-004-20241020    gcc-12
i386                  randconfig-005-20241020    gcc-12
i386                  randconfig-006-20241020    gcc-12
i386                  randconfig-011-20241020    gcc-12
i386                  randconfig-012-20241020    gcc-12
i386                  randconfig-013-20241020    gcc-12
i386                  randconfig-014-20241020    gcc-12
i386                  randconfig-015-20241020    gcc-12
i386                  randconfig-016-20241020    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                           sun3_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                         bigsur_defconfig    clang-20
mips                     loongson1b_defconfig    clang-20
mips                          rb532_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                     asp8347_defconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          rsk7264_defconfig    clang-20
sh                           se7712_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                    rhel-8.3-kselftests    gcc-12
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

