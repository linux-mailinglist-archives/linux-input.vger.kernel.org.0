Return-Path: <linux-input+bounces-13812-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6511DB1A964
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 21:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18E033BA907
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 19:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E359B652;
	Mon,  4 Aug 2025 19:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUdgWOUm"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF740214A64
	for <linux-input@vger.kernel.org>; Mon,  4 Aug 2025 19:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754334968; cv=none; b=LZTOwZWT5EYlV8Y/32xQeoPUZQ6bGKskakTg9K+ZGAhy303CADbyDwALKw/3YrvYfIgzxetLvzkMsIh9EnBRuuYsoOrjH5oaE9KNpwBxUYbwXGM3ZfZ6v5QTfEk62WUX6Db0BzT3Cw7SFNnenAVzpEiFodGykrM3/4uwLcqLIB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754334968; c=relaxed/simple;
	bh=CXHiVpEsDPU9vP9Bsrhbqa1s1GNQTT9fO1qxnDZcviM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N5eNwaSbkRve+FwXDV29dlPYG4KOjL1ueEZ7qgGWAVGGmzz/8DUf/ZMDPK9VoznxTfU4WafSGdtATJqqlH4gaFq/ZM4SOi1H2UoKGkFgjfc/ry/2W+h6Ib8CF+CzspTL/KGBiyeMz1KCn/FsMgRoxe2biqD2vbsoCMvLAeBQVY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FUdgWOUm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754334967; x=1785870967;
  h=date:from:to:cc:subject:message-id;
  bh=CXHiVpEsDPU9vP9Bsrhbqa1s1GNQTT9fO1qxnDZcviM=;
  b=FUdgWOUmWB3PY2wI9yV64cOqDZaJ703ceUnWldqIYqiI7/rc2WL2ADFp
   SOR08cIJbxepjmc8q58dscawMz9AgXZAbCVD7uyqRXxM1zFxg+5f1HKSJ
   eYvNSHmOEauHveSPTLvr17xTpDmiWYcsBnqc6Vr3xgb9rX0NdJ9ZXU7yR
   aJDKSCJkADb5kXaS0q1TD6qXHQ+EULWJOD83F6cFSuPa2itFsDgbCZyJ5
   +CX7LfvPWq1B4DHSR2iHQR32jmQRYfdqgm81nBzeeTD1J57v2SduAqn0z
   HpBcRn5UZxS6wr5Tzqz44RdoFhDTtC6zjusOoueHP2ZQNSwojZ6mPvHyg
   Q==;
X-CSE-ConnectionGUID: IPJWefAhTUOa7qEGh4wa2A==
X-CSE-MsgGUID: A8MfyFnuSCy1neZr+njh4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="68062411"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="68062411"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 12:16:06 -0700
X-CSE-ConnectionGUID: gy7FUkJPReyifdPlQBm0WA==
X-CSE-MsgGUID: oiGFOOC0QJCClGJfD/AuRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="195090249"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Aug 2025 12:16:04 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uj0fC-0000DD-0i;
	Mon, 04 Aug 2025 19:16:02 +0000
Date: Tue, 05 Aug 2025 03:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:next] BUILD SUCCESS WITH WARNING
 a7bee4e7f78089c101be2ad51f4b5ec64782053e
Message-ID: <202508050315.qcQIHvUU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
branch HEAD: a7bee4e7f78089c101be2ad51f4b5ec64782053e  Merge tag 'ib-mfd-gpio-input-pwm-v6.17' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd into next

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202508041754.ykl25o1q-lkp@intel.com

    drivers/input/touch-overlay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- alpha-allyesconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-allmodconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-allyesconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-hsdk_defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-allmodconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-allyesconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-keystone_defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-mv78xx0_defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-neponset_defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-001-20250804
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-002-20250804
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-003-20250804
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-allmodconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- csky-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- csky-defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- csky-randconfig-001-20250804
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-allmodconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-allyesconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-randconfig-001-20250804
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-randconfig-002-20250804
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-allmodconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-006-20250804
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-randconfig-141-20250804
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- loongarch-allmodconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- loongarch-allyesconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- m68k-allmodconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- m68k-allyesconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- microblaze-allmodconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- microblaze-allyesconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- microblaze-defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- mips-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- nios2-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- nios2-defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- openrisc-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- openrisc-allyesconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- openrisc-defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc-allmodconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc-allyesconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc-defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc-randconfig-002-20250804
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc64-defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-allmodconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-allyesconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-bluestone_defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-ppa8548_defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-randconfig-001-20250804
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc64-randconfig-001-20250804
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc64-randconfig-002-20250804
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc64-randconfig-003-20250804
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- riscv-allmodconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- riscv-allyesconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- riscv-defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- riscv-randconfig-002-20250804
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-allmodconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-allyesconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-allmodconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-allyesconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-sh03_defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc-defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc64-defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-allmodconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-allyesconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-randconfig-001-20250804
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-randconfig-002-20250804
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-allyesconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-006-20250804
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-defconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-randconfig-161-20250804
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-rhel-9.4-rust
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- xtensa-allnoconfig
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- xtensa-randconfig-001-20250804
|   `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
`-- xtensa-randconfig-002-20250804
    `-- drivers-input-touch-overlay.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing

elapsed time: 721m

configs tested: 135
configs skipped: 4

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                            hsdk_defconfig    gcc-15.1.0
arc                   randconfig-001-20250804    gcc-8.5.0
arc                   randconfig-002-20250804    gcc-13.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        keystone_defconfig    gcc-15.1.0
arm                         mv78xx0_defconfig    clang-19
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20250804    clang-22
arm                   randconfig-002-20250804    clang-22
arm                   randconfig-003-20250804    clang-22
arm                   randconfig-004-20250804    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250804    clang-22
arm64                 randconfig-002-20250804    clang-19
arm64                 randconfig-003-20250804    clang-22
arm64                 randconfig-004-20250804    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250804    gcc-12.5.0
csky                  randconfig-002-20250804    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250804    clang-22
hexagon               randconfig-002-20250804    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250804    clang-20
i386        buildonly-randconfig-002-20250804    gcc-12
i386        buildonly-randconfig-003-20250804    clang-20
i386        buildonly-randconfig-004-20250804    gcc-12
i386        buildonly-randconfig-005-20250804    gcc-12
i386        buildonly-randconfig-006-20250804    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250804    gcc-15.1.0
loongarch             randconfig-002-20250804    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          atari_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           gcw0_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250804    gcc-10.5.0
nios2                 randconfig-002-20250804    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250804    gcc-12.5.0
parisc                randconfig-002-20250804    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                   bluestone_defconfig    clang-22
powerpc                     ppa8548_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250804    gcc-8.5.0
powerpc               randconfig-002-20250804    gcc-13.4.0
powerpc               randconfig-003-20250804    clang-22
powerpc64             randconfig-001-20250804    clang-22
powerpc64             randconfig-002-20250804    clang-19
powerpc64             randconfig-003-20250804    clang-16
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250804    gcc-8.5.0
riscv                 randconfig-002-20250804    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250804    clang-22
s390                  randconfig-002-20250804    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                        apsh4ad0a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                     magicpanelr2_defconfig    gcc-15.1.0
sh                    randconfig-001-20250804    gcc-14.3.0
sh                    randconfig-002-20250804    gcc-15.1.0
sh                           se7750_defconfig    gcc-15.1.0
sh                           se7780_defconfig    gcc-15.1.0
sh                             sh03_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250804    gcc-8.5.0
sparc                 randconfig-002-20250804    gcc-13.4.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250804    gcc-10.5.0
sparc64               randconfig-002-20250804    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250804    clang-22
um                    randconfig-002-20250804    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250804    clang-20
x86_64      buildonly-randconfig-002-20250804    gcc-12
x86_64      buildonly-randconfig-003-20250804    gcc-12
x86_64      buildonly-randconfig-004-20250804    gcc-12
x86_64      buildonly-randconfig-005-20250804    clang-20
x86_64      buildonly-randconfig-006-20250804    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250804    gcc-11.5.0
xtensa                randconfig-002-20250804    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

