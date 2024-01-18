Return-Path: <linux-input+bounces-1299-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5638311AA
	for <lists+linux-input@lfdr.de>; Thu, 18 Jan 2024 04:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13E66B23647
	for <lists+linux-input@lfdr.de>; Thu, 18 Jan 2024 03:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11DF5390;
	Thu, 18 Jan 2024 03:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaTQHrKi"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF2833EA
	for <linux-input@vger.kernel.org>; Thu, 18 Jan 2024 03:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705547490; cv=none; b=HUki9Ne0VyCcJhObzlvXNKSoa93HYtJlueqxKJD0jDzNVL8FuXZPbM80fiSgc2jxYIyFdNbSTBN0TtJO3axbissNXXZP+0ohip3j/xLndn6IB7N9uSQ6XvF2xqGa/S55OWHiscYE9sioD8+KZACimExfLyeSzUa2pVNiQWXtqUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705547490; c=relaxed/simple;
	bh=UTbiQHPcdIP5Q88wtHeGTXWEsbEoWAKsIn8uz3TybEA=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 User-Agent; b=aKer5/PgXmtzghEkki6WTMjbcvQ1GjO8nJD3UQrxkPPJfziRLmtiE3kiKfP9ru4ZTiwoUgbXnPUkAP5qOpAGZW7mCKc/NUACsrvVCTcVBhJ8xbi6z4BBtxr1bLeoWqyvBZVwSZCy/baUdx72IqNhiXxoArNSeK5356TD709pTHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DaTQHrKi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705547490; x=1737083490;
  h=date:from:to:cc:subject:message-id;
  bh=UTbiQHPcdIP5Q88wtHeGTXWEsbEoWAKsIn8uz3TybEA=;
  b=DaTQHrKihv1oRpHgA4McRBl+SeUXZRyoZzIyBcToTGzLIZlr2GNpEJDj
   zgf5dZxqkIog41HJbrFkPIVH6coIDENN441QojU/EsJtZ33QwSF8u0jSb
   lkbuoUOrpCPURxA7JM1beVhGNGZ5/OGSE+fTyQucxkg2q5qAGczKwNW2N
   ZAmN9SfgQN2vOLBdjivagfQR9dCR/wYOYpBWYpD0uQZA70q2aoL/0iWqK
   Si1ZxDX9vpmVMIXpJ4ia8fve2AR4wESra+Wp1Ww4pda3vXywYHt1EO0p6
   QV7Ca5XrUooQsR8fbtkNIXICZtixdfAteFtHOmst0oCJq+UGCwEyhKan+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7032417"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7032417"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 19:11:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="26652735"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jan 2024 19:11:27 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQIoO-0002YY-2T;
	Thu, 18 Jan 2024 03:11:24 +0000
Date: Thu, 18 Jan 2024 11:10:55 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [dtor-input:for-linus] BUILD SUCCESS
 58f65f9db7e0de366a5a115c2e2c0703858bba69
Message-ID: <202401181153.Xa8X8R4t-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
branch HEAD: 58f65f9db7e0de366a5a115c2e2c0703858bba69  Input: atkbd - use ab83 as id when skipping the getid command

elapsed time: 1765m

configs tested: 104
configs skipped: 0

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
arc                   randconfig-001-20240118   gcc  
arc                   randconfig-002-20240118   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240118   clang
arm                   randconfig-002-20240118   clang
arm                   randconfig-003-20240118   clang
arm                   randconfig-004-20240118   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240118   clang
arm64                 randconfig-002-20240118   clang
arm64                 randconfig-003-20240118   clang
arm64                 randconfig-004-20240118   clang
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240118   gcc  
csky                  randconfig-002-20240118   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240118   clang
hexagon               randconfig-002-20240118   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240117   gcc  
i386         buildonly-randconfig-002-20240117   gcc  
i386         buildonly-randconfig-003-20240117   gcc  
i386         buildonly-randconfig-004-20240117   gcc  
i386         buildonly-randconfig-005-20240117   gcc  
i386         buildonly-randconfig-006-20240117   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240117   gcc  
i386                  randconfig-002-20240117   gcc  
i386                  randconfig-003-20240117   gcc  
i386                  randconfig-004-20240117   gcc  
i386                  randconfig-005-20240117   gcc  
i386                  randconfig-006-20240117   gcc  
i386                  randconfig-011-20240117   clang
i386                  randconfig-012-20240117   clang
i386                  randconfig-013-20240117   clang
i386                  randconfig-014-20240117   clang
i386                  randconfig-015-20240117   clang
i386                  randconfig-016-20240117   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240118   gcc  
loongarch             randconfig-002-20240118   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                 randconfig-001-20240118   gcc  
nios2                 randconfig-002-20240118   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20240118   gcc  
parisc                randconfig-002-20240118   gcc  
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240118   clang
powerpc               randconfig-002-20240118   clang
powerpc               randconfig-003-20240118   clang
powerpc64             randconfig-001-20240118   clang
powerpc64             randconfig-002-20240118   clang
powerpc64             randconfig-003-20240118   clang
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                 randconfig-001-20240118   clang
riscv                 randconfig-002-20240118   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20240118   gcc  
s390                  randconfig-002-20240118   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                    randconfig-001-20240118   gcc  
sh                    randconfig-002-20240118   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20240118   gcc  
sparc64               randconfig-002-20240118   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

